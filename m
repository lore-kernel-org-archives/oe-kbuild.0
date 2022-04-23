Content-Type: multipart/mixed; boundary="===============1093069822942381524=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 484/2399] drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:112 dpu_rm_init() warn: passing zero to 'PTR_ERR'
Date: Sat, 23 Apr 2022 23:58:36 +0800
Message-ID: <202204232300.xNIeryxA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1093069822942381524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Junxiao Chang <junxiao.chang@intel.com>

Hi Christian,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   7acd0be121091f12349a4dcefd2e6deee2e73946
commit: 2e4c0f14c46f4dcdeec66f40779cd8e9708e8dda [484/2399] drm/msm: allow =
compile_test on !ARM
:::::: branch date: 4 days ago
:::::: commit date: 9 weeks ago
config: xtensa-randconfig-m031-20220422 (https://download.01.org/0day-ci/ar=
chive/20220423/202204232300.xNIeryxA-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:112 dpu_rm_init() warn: passing zero=
 to 'PTR_ERR'
drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:281 _dpu_crtc_blend_setup_mixer() =
warn: inconsistent indenting

Old smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:141 dpu_rm_init() warn: passing zero=
 to 'PTR_ERR'
drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:159 dpu_rm_init() warn: passing zero=
 to 'PTR_ERR'
drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:183 dpu_rm_init() warn: passing zero=
 to 'PTR_ERR'
drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:200 dpu_rm_init() warn: passing zero=
 to 'PTR_ERR'
drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:217 dpu_rm_init() warn: passing zero=
 to 'PTR_ERR'
arch/xtensa/include/asm/thread_info.h:91 current_thread_info() warn: incons=
istent indenting

vim +/PTR_ERR +112 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   81  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   82  int dpu_rm_init(struct dp=
u_rm *rm,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   83  		struct dpu_mdss_cfg *ca=
t,
3763f1a5511005 Jeykumar Sankaran 2018-12-07   84  		void __iomem *mmio)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   85  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   86  	int rc, i;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   87  =

3763f1a5511005 Jeykumar Sankaran 2018-12-07   88  	if (!rm || !cat || !mmio=
) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   89  		DPU_ERROR("invalid kms\=
n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   90  		return -EINVAL;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   91  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   92  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   93  	/* Clear, setup lists */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   94  	memset(rm, 0, sizeof(*rm=
));
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   95  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   96  	/* Interrogate HW catalo=
g and create tracking items for hw blocks */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27   97  	for (i =3D 0; i < cat->m=
ixer_count; i++) {
bb00a452d6f773 Drew Davenport    2020-02-19   98  		struct dpu_hw_mixer *hw;
abda0d925f9c06 Stephen Boyd      2019-11-19   99  		const struct dpu_lm_cfg=
 *lm =3D &cat->mixer[i];
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  100  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  101  		if (lm->pingpong =3D=3D=
 PINGPONG_MAX) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  102  			DPU_DEBUG("skip mixer =
%d without pingpong\n", lm->id);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  103  			continue;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  104  		}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  105  =

bb00a452d6f773 Drew Davenport    2020-02-19  106  		if (lm->id < LM_0 || lm=
->id >=3D LM_MAX) {
bb00a452d6f773 Drew Davenport    2020-02-19  107  			DPU_ERROR("skip mixer =
%d with invalid id\n", lm->id);
bb00a452d6f773 Drew Davenport    2020-02-19  108  			continue;
bb00a452d6f773 Drew Davenport    2020-02-19  109  		}
bb00a452d6f773 Drew Davenport    2020-02-19  110  		hw =3D dpu_hw_lm_init(l=
m->id, mmio, cat);
bb00a452d6f773 Drew Davenport    2020-02-19  111  		if (IS_ERR_OR_NULL(hw))=
 {
bb00a452d6f773 Drew Davenport    2020-02-19 @112  			rc =3D PTR_ERR(hw);
bb00a452d6f773 Drew Davenport    2020-02-19  113  			DPU_ERROR("failed lm o=
bject creation: err %d\n", rc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  114  			goto fail;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  115  		}
bb00a452d6f773 Drew Davenport    2020-02-19  116  		rm->mixer_blks[lm->id -=
 LM_0] =3D &hw->base;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  117  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  118  		if (!rm->lm_max_width) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  119  			rm->lm_max_width =3D l=
m->sblk->maxwidth;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  120  		} else if (rm->lm_max_w=
idth !=3D lm->sblk->maxwidth) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  121  			/*
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  122  			 * Don't expect to hav=
e hw where lm max widths differ.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  123  			 * If found, take the =
min.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  124  			 */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  125  			DPU_ERROR("unsupported=
: lm maxwidth differs\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  126  			if (rm->lm_max_width >=
 lm->sblk->maxwidth)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  127  				rm->lm_max_width =3D =
lm->sblk->maxwidth;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  128  		}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  129  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  130  =

4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  131  	for (i =3D 0; i < cat->m=
erge_3d_count; i++) {
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  132  		struct dpu_hw_merge_3d =
*hw;
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  133  		const struct dpu_merge_=
3d_cfg *merge_3d =3D &cat->merge_3d[i];
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  134  =

4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  135  		if (merge_3d->id < MERG=
E_3D_0 || merge_3d->id >=3D MERGE_3D_MAX) {
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  136  			DPU_ERROR("skip merge_=
3d %d with invalid id\n", merge_3d->id);
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  137  			continue;
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  138  		}
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  139  		hw =3D dpu_hw_merge_3d_=
init(merge_3d->id, mmio, cat);
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  140  		if (IS_ERR_OR_NULL(hw))=
 {
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  141  			rc =3D PTR_ERR(hw);
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  142  			DPU_ERROR("failed merg=
e_3d object creation: err %d\n",
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  143  				rc);
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  144  			goto fail;
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  145  		}
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  146  		rm->merge_3d_blks[merge=
_3d->id - MERGE_3D_0] =3D &hw->base;
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  147  	}
4369c93cf36bc5 Dmitry Baryshkov  2020-10-22  148  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  149  	for (i =3D 0; i < cat->p=
ingpong_count; i++) {
bb00a452d6f773 Drew Davenport    2020-02-19  150  		struct dpu_hw_pingpong =
*hw;
bb00a452d6f773 Drew Davenport    2020-02-19  151  		const struct dpu_pingpo=
ng_cfg *pp =3D &cat->pingpong[i];
bb00a452d6f773 Drew Davenport    2020-02-19  152  =

bb00a452d6f773 Drew Davenport    2020-02-19  153  		if (pp->id < PINGPONG_0=
 || pp->id >=3D PINGPONG_MAX) {
bb00a452d6f773 Drew Davenport    2020-02-19  154  			DPU_ERROR("skip pingpo=
ng %d with invalid id\n", pp->id);
bb00a452d6f773 Drew Davenport    2020-02-19  155  			continue;
bb00a452d6f773 Drew Davenport    2020-02-19  156  		}
bb00a452d6f773 Drew Davenport    2020-02-19  157  		hw =3D dpu_hw_pingpong_=
init(pp->id, mmio, cat);
bb00a452d6f773 Drew Davenport    2020-02-19  158  		if (IS_ERR_OR_NULL(hw))=
 {
bb00a452d6f773 Drew Davenport    2020-02-19  159  			rc =3D PTR_ERR(hw);
bb00a452d6f773 Drew Davenport    2020-02-19  160  			DPU_ERROR("failed ping=
pong object creation: err %d\n",
bb00a452d6f773 Drew Davenport    2020-02-19  161  				rc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  162  			goto fail;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  163  		}
3e79527a33a83b Dmitry Baryshkov  2020-10-22  164  		if (pp->merge_3d && pp-=
>merge_3d < MERGE_3D_MAX)
dfa35bac99305a Dmitry Baryshkov  2021-05-15  165  			hw->merge_3d =3D to_dp=
u_hw_merge_3d(rm->merge_3d_blks[pp->merge_3d - MERGE_3D_0]);
bb00a452d6f773 Drew Davenport    2020-02-19  166  		rm->pingpong_blks[pp->i=
d - PINGPONG_0] =3D &hw->base;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  167  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  168  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  169  	for (i =3D 0; i < cat->i=
ntf_count; i++) {
bb00a452d6f773 Drew Davenport    2020-02-19  170  		struct dpu_hw_intf *hw;
bb00a452d6f773 Drew Davenport    2020-02-19  171  		const struct dpu_intf_c=
fg *intf =3D &cat->intf[i];
bb00a452d6f773 Drew Davenport    2020-02-19  172  =

bb00a452d6f773 Drew Davenport    2020-02-19  173  		if (intf->type =3D=3D I=
NTF_NONE) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  174  			DPU_DEBUG("skip intf %=
d with type none\n", i);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  175  			continue;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  176  		}
bb00a452d6f773 Drew Davenport    2020-02-19  177  		if (intf->id < INTF_0 |=
| intf->id >=3D INTF_MAX) {
bb00a452d6f773 Drew Davenport    2020-02-19  178  			DPU_ERROR("skip intf %=
d with invalid id\n", intf->id);
bb00a452d6f773 Drew Davenport    2020-02-19  179  			continue;
bb00a452d6f773 Drew Davenport    2020-02-19  180  		}
bb00a452d6f773 Drew Davenport    2020-02-19  181  		hw =3D dpu_hw_intf_init=
(intf->id, mmio, cat);
bb00a452d6f773 Drew Davenport    2020-02-19  182  		if (IS_ERR_OR_NULL(hw))=
 {
bb00a452d6f773 Drew Davenport    2020-02-19  183  			rc =3D PTR_ERR(hw);
bb00a452d6f773 Drew Davenport    2020-02-19  184  			DPU_ERROR("failed intf=
 object creation: err %d\n", rc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  185  			goto fail;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  186  		}
bb00a452d6f773 Drew Davenport    2020-02-19  187  		rm->intf_blks[intf->id =
- INTF_0] =3D &hw->base;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  188  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  189  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  190  	for (i =3D 0; i < cat->c=
tl_count; i++) {
bb00a452d6f773 Drew Davenport    2020-02-19  191  		struct dpu_hw_ctl *hw;
bb00a452d6f773 Drew Davenport    2020-02-19  192  		const struct dpu_ctl_cf=
g *ctl =3D &cat->ctl[i];
bb00a452d6f773 Drew Davenport    2020-02-19  193  =

bb00a452d6f773 Drew Davenport    2020-02-19  194  		if (ctl->id < CTL_0 || =
ctl->id >=3D CTL_MAX) {
bb00a452d6f773 Drew Davenport    2020-02-19  195  			DPU_ERROR("skip ctl %d=
 with invalid id\n", ctl->id);
bb00a452d6f773 Drew Davenport    2020-02-19  196  			continue;
bb00a452d6f773 Drew Davenport    2020-02-19  197  		}
bb00a452d6f773 Drew Davenport    2020-02-19  198  		hw =3D dpu_hw_ctl_init(=
ctl->id, mmio, cat);
bb00a452d6f773 Drew Davenport    2020-02-19  199  		if (IS_ERR_OR_NULL(hw))=
 {
bb00a452d6f773 Drew Davenport    2020-02-19  200  			rc =3D PTR_ERR(hw);
bb00a452d6f773 Drew Davenport    2020-02-19  201  			DPU_ERROR("failed ctl =
object creation: err %d\n", rc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  202  			goto fail;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  203  		}
bb00a452d6f773 Drew Davenport    2020-02-19  204  		rm->ctl_blks[ctl->id - =
CTL_0] =3D &hw->base;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  205  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  206  =

e47616df008b10 Kalyan Thota      2020-03-24  207  	for (i =3D 0; i < cat->d=
spp_count; i++) {
e47616df008b10 Kalyan Thota      2020-03-24  208  		struct dpu_hw_dspp *hw;
e47616df008b10 Kalyan Thota      2020-03-24  209  		const struct dpu_dspp_c=
fg *dspp =3D &cat->dspp[i];
e47616df008b10 Kalyan Thota      2020-03-24  210  =

e47616df008b10 Kalyan Thota      2020-03-24  211  		if (dspp->id < DSPP_0 |=
| dspp->id >=3D DSPP_MAX) {
e47616df008b10 Kalyan Thota      2020-03-24  212  			DPU_ERROR("skip dspp %=
d with invalid id\n", dspp->id);
e47616df008b10 Kalyan Thota      2020-03-24  213  			continue;
e47616df008b10 Kalyan Thota      2020-03-24  214  		}
e47616df008b10 Kalyan Thota      2020-03-24  215  		hw =3D dpu_hw_dspp_init=
(dspp->id, mmio, cat);
e47616df008b10 Kalyan Thota      2020-03-24  216  		if (IS_ERR_OR_NULL(hw))=
 {
e47616df008b10 Kalyan Thota      2020-03-24  217  			rc =3D PTR_ERR(hw);
e47616df008b10 Kalyan Thota      2020-03-24  218  			DPU_ERROR("failed dspp=
 object creation: err %d\n", rc);
e47616df008b10 Kalyan Thota      2020-03-24  219  			goto fail;
e47616df008b10 Kalyan Thota      2020-03-24  220  		}
e47616df008b10 Kalyan Thota      2020-03-24  221  		rm->dspp_blks[dspp->id =
- DSPP_0] =3D &hw->base;
e47616df008b10 Kalyan Thota      2020-03-24  222  	}
e47616df008b10 Kalyan Thota      2020-03-24  223  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  224  	return 0;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  225  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  226  fail:
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  227  	dpu_rm_destroy(rm);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  228  =

bb00a452d6f773 Drew Davenport    2020-02-19  229  	return rc ? rc : -EFAULT;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  230  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  231  =


:::::: The code at line 112 was first introduced by commit
:::::: bb00a452d6f77391441ef7df48f7115dd459cd2f drm/msm/dpu: Refactor resou=
rce manager

:::::: TO: Drew Davenport <ddavenport@chromium.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1093069822942381524==--

