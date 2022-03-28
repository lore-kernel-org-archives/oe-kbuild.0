Content-Type: multipart/mixed; boundary="===============0119692547858112439=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/qce/aead.c:148:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 28 Mar 2022 18:02:51 +0800
Message-ID: <202203281716.1kazgnbl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0119692547858112439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thara Gopinath <thara.gopinath@linaro.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: 9363efb4181c5e0fbf86bdfa759262aa29f0eb50 crypto: qce - Add support =
for AEAD algorithms
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220328/202203281716.1kazgnbl-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9363efb4181c5e0fbf86bdfa759262aa29f0eb50
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9363efb4181c5e0fbf86bdfa759262aa29f0eb50
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/of/property.c:920:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:920:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:920:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:926:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (1 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/crypto/mxs-dcp.c:285:22: warning: Value stored to 'src' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct scatterlist *src =3D req->src;
                               ^~~   ~~~~~~~~
   drivers/crypto/mxs-dcp.c:285:22: note: Value stored to 'src' during its =
initialization is never read
           struct scatterlist *src =3D req->src;
                               ^~~   ~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (2 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/crypto/qce/aead.c:148:4: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           ret =3D PTR_ERR(sg);
                           ^     ~~~~~~~~~~~
   drivers/crypto/qce/aead.c:148:4: note: Value stored to 'ret' is never re=
ad
                           ret =3D PTR_ERR(sg);
                           ^     ~~~~~~~~~~~
   drivers/crypto/qce/aead.c:154:4: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           ret =3D PTR_ERR(sg);
                           ^     ~~~~~~~~~~~
   drivers/crypto/qce/aead.c:154:4: note: Value stored to 'ret' is never re=
ad
                           ret =3D PTR_ERR(sg);
                           ^     ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/rcar-du/rcar_lvds.c:105:20: warning: Value stored to 'lv=
ds' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct rcar_lvds *lvds =3D connector_to_rcar_lvds(connector);
                             ^~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:105:20: note: Value stored to 'lvds'=
 during its initialization is never read
           struct rcar_lvds *lvds =3D connector_to_rcar_lvds(connector);
                             ^~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:315:28: warning: Division by zero [c=
lang-analyzer-core.DivideZero]
           output =3D fin * pll->pll_n / pll->pll_m / (1 << pll->pll_e)
                                     ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:373:27: note: Left side of '&&' is f=
alse
           struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
                                    ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:81:2: note: expanded from macro 'bri=
dge_to_rcar_lvds'
           container_of(b, struct rcar_lvds, bridge)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:373:27: note: Taking false branch
           struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
                                    ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:81:2: note: expanded from macro 'bri=
dge_to_rcar_lvds'
           container_of(b, struct rcar_lvds, bridge)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:373:27: note: Loop condition is fals=
e.  Exiting loop
           struct rcar_lvds *lvds =3D bridge_to_rcar_lvds(bridge);
                                    ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:81:2: note: expanded from macro 'bri=
dge_to_rcar_lvds'
           container_of(b, struct rcar_lvds, bridge)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:376:14: note: Assuming the condition=
 is false
           if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
                       ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:376:2: note: Taking false branch
           if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
           ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:379:2: note: Taking false branch
           dev_dbg(lvds->dev, "enabling LVDS PLL, freq=3D%luHz\n", freq);
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:382:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/gpu/drm/rcar-du/rcar_lvds.c:382:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/rcar-du/rcar_lvds.c:385:2: note: Calling '__rcar_lvds_pl=
l_setup_d3_e3'
           __rcar_lvds_pll_setup_d3_e3(lvds, freq, true);

vim +/ret +148 drivers/crypto/qce/aead.c

9363efb4181c5e Thara Gopinath 2021-04-29  111  =

9363efb4181c5e Thara Gopinath 2021-04-29  112  static struct scatterlist *
9363efb4181c5e Thara Gopinath 2021-04-29  113  qce_aead_prepare_dst_buf(str=
uct aead_request *req)
9363efb4181c5e Thara Gopinath 2021-04-29  114  {
9363efb4181c5e Thara Gopinath 2021-04-29  115  	struct qce_aead_reqctx *rct=
x =3D aead_request_ctx(req);
9363efb4181c5e Thara Gopinath 2021-04-29  116  	struct qce_alg_template *tm=
pl =3D to_aead_tmpl(crypto_aead_reqtfm(req));
9363efb4181c5e Thara Gopinath 2021-04-29  117  	struct qce_device *qce =3D =
tmpl->qce;
9363efb4181c5e Thara Gopinath 2021-04-29  118  	struct scatterlist *sg, *ms=
g_sg, __sg[2];
9363efb4181c5e Thara Gopinath 2021-04-29  119  	gfp_t gfp;
9363efb4181c5e Thara Gopinath 2021-04-29  120  	unsigned int assoclen =3D r=
eq->assoclen;
9363efb4181c5e Thara Gopinath 2021-04-29  121  	unsigned int totallen;
9363efb4181c5e Thara Gopinath 2021-04-29  122  	int ret;
9363efb4181c5e Thara Gopinath 2021-04-29  123  =

9363efb4181c5e Thara Gopinath 2021-04-29  124  	totallen =3D rctx->cryptlen=
 + assoclen;
9363efb4181c5e Thara Gopinath 2021-04-29  125  	rctx->dst_nents =3D sg_nent=
s_for_len(req->dst, totallen);
9363efb4181c5e Thara Gopinath 2021-04-29  126  	if (rctx->dst_nents < 0) {
9363efb4181c5e Thara Gopinath 2021-04-29  127  		dev_err(qce->dev, "Invalid=
 numbers of dst SG.\n");
9363efb4181c5e Thara Gopinath 2021-04-29  128  		return ERR_PTR(-EINVAL);
9363efb4181c5e Thara Gopinath 2021-04-29  129  	}
9363efb4181c5e Thara Gopinath 2021-04-29  130  	if (IS_CCM(rctx->flags))
9363efb4181c5e Thara Gopinath 2021-04-29  131  		rctx->dst_nents +=3D 2;
9363efb4181c5e Thara Gopinath 2021-04-29  132  	else
9363efb4181c5e Thara Gopinath 2021-04-29  133  		rctx->dst_nents +=3D 1;
9363efb4181c5e Thara Gopinath 2021-04-29  134  =

9363efb4181c5e Thara Gopinath 2021-04-29  135  	gfp =3D (req->base.flags & =
CRYPTO_TFM_REQ_MAY_SLEEP) ?
9363efb4181c5e Thara Gopinath 2021-04-29  136  						GFP_KERNEL : GFP_ATOMI=
C;
9363efb4181c5e Thara Gopinath 2021-04-29  137  	ret =3D sg_alloc_table(&rct=
x->dst_tbl, rctx->dst_nents, gfp);
9363efb4181c5e Thara Gopinath 2021-04-29  138  	if (ret)
9363efb4181c5e Thara Gopinath 2021-04-29  139  		return ERR_PTR(ret);
9363efb4181c5e Thara Gopinath 2021-04-29  140  =

9363efb4181c5e Thara Gopinath 2021-04-29  141  	if (IS_CCM(rctx->flags) && =
assoclen) {
9363efb4181c5e Thara Gopinath 2021-04-29  142  		/* Get the dst buffer */
9363efb4181c5e Thara Gopinath 2021-04-29  143  		msg_sg =3D scatterwalk_ffw=
d(__sg, req->dst, assoclen);
9363efb4181c5e Thara Gopinath 2021-04-29  144  =

9363efb4181c5e Thara Gopinath 2021-04-29  145  		sg =3D qce_sgtable_add(&rc=
tx->dst_tbl, &rctx->adata_sg,
9363efb4181c5e Thara Gopinath 2021-04-29  146  				     rctx->assoclen);
9363efb4181c5e Thara Gopinath 2021-04-29  147  		if (IS_ERR(sg)) {
9363efb4181c5e Thara Gopinath 2021-04-29 @148  			ret =3D PTR_ERR(sg);
9363efb4181c5e Thara Gopinath 2021-04-29  149  			goto dst_tbl_free;
9363efb4181c5e Thara Gopinath 2021-04-29  150  		}
9363efb4181c5e Thara Gopinath 2021-04-29  151  		/* dst buffer */
9363efb4181c5e Thara Gopinath 2021-04-29  152  		sg =3D qce_sgtable_add(&rc=
tx->dst_tbl, msg_sg, rctx->cryptlen);
9363efb4181c5e Thara Gopinath 2021-04-29  153  		if (IS_ERR(sg)) {
9363efb4181c5e Thara Gopinath 2021-04-29  154  			ret =3D PTR_ERR(sg);
9363efb4181c5e Thara Gopinath 2021-04-29  155  			goto dst_tbl_free;
9363efb4181c5e Thara Gopinath 2021-04-29  156  		}
9363efb4181c5e Thara Gopinath 2021-04-29  157  		totallen =3D rctx->cryptle=
n + rctx->assoclen;
9363efb4181c5e Thara Gopinath 2021-04-29  158  	} else {
9363efb4181c5e Thara Gopinath 2021-04-29  159  		if (totallen) {
9363efb4181c5e Thara Gopinath 2021-04-29  160  			sg =3D qce_sgtable_add(&r=
ctx->dst_tbl, req->dst, totallen);
9363efb4181c5e Thara Gopinath 2021-04-29  161  			if (IS_ERR(sg))
9363efb4181c5e Thara Gopinath 2021-04-29  162  				goto dst_tbl_free;
9363efb4181c5e Thara Gopinath 2021-04-29  163  		}
9363efb4181c5e Thara Gopinath 2021-04-29  164  	}
9363efb4181c5e Thara Gopinath 2021-04-29  165  	if (IS_CCM(rctx->flags))
9363efb4181c5e Thara Gopinath 2021-04-29  166  		sg =3D qce_aead_prepare_cc=
m_result_buf(&rctx->dst_tbl, req);
9363efb4181c5e Thara Gopinath 2021-04-29  167  	else
9363efb4181c5e Thara Gopinath 2021-04-29  168  		sg =3D qce_aead_prepare_re=
sult_buf(&rctx->dst_tbl, req);
9363efb4181c5e Thara Gopinath 2021-04-29  169  =

9363efb4181c5e Thara Gopinath 2021-04-29  170  	if (IS_ERR(sg))
9363efb4181c5e Thara Gopinath 2021-04-29  171  		goto dst_tbl_free;
9363efb4181c5e Thara Gopinath 2021-04-29  172  =

9363efb4181c5e Thara Gopinath 2021-04-29  173  	sg_mark_end(sg);
9363efb4181c5e Thara Gopinath 2021-04-29  174  	rctx->dst_sg =3D rctx->dst_=
tbl.sgl;
9363efb4181c5e Thara Gopinath 2021-04-29  175  	rctx->dst_nents =3D sg_nent=
s_for_len(rctx->dst_sg, totallen) + 1;
9363efb4181c5e Thara Gopinath 2021-04-29  176  =

9363efb4181c5e Thara Gopinath 2021-04-29  177  	return sg;
9363efb4181c5e Thara Gopinath 2021-04-29  178  =

9363efb4181c5e Thara Gopinath 2021-04-29  179  dst_tbl_free:
9363efb4181c5e Thara Gopinath 2021-04-29  180  	sg_free_table(&rctx->dst_tb=
l);
9363efb4181c5e Thara Gopinath 2021-04-29  181  	return sg;
9363efb4181c5e Thara Gopinath 2021-04-29  182  }
9363efb4181c5e Thara Gopinath 2021-04-29  183  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0119692547858112439==--

