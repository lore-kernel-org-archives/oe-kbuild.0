Content-Type: multipart/mixed; boundary="===============2117294944699298094=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [RFC 05/17] drm: exynos: fix sg_table nents vs. orig_nents misuse
Date: Thu, 30 Apr 2020 09:30:31 +0800
Message-ID: <202004300923.EifN4ixW%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2117294944699298094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200428132005.21424-6-m.szyprowski@samsung.com>
References: <20200428132005.21424-6-m.szyprowski@samsung.com>
TO: Marek Szyprowski <m.szyprowski@samsung.com>

Hi Marek,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on next-20200429]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linu=
s/master v5.7-rc3]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Marek-Szyprowski/DRM-fix-s=
truct-sg_table-nents-vs-orig_nents-misuse/20200429-040352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.=
git exynos-drm-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/gpu/drm/exynos/exynos_drm_g2d.c:516:9: sparse: sparse: Expected =
; at end of statement
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:516:9: sparse: sparse: got if
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:522:20: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:522:20: sparse: sparse: got ->
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:523:20: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:523:20: sparse: sparse: got ->
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:525:23: sparse: sparse: Expected=
 ) in function declarator
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:525:23: sparse: sparse: got &
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:527:16: sparse: sparse: Expected=
 ) in function declarator
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:527:16: sparse: sparse: got ->
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:527:9: sparse: sparse: Trying to=
 use reserved word 'if' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:529:28: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:529:28: sparse: sparse: got ->
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:530:9: sparse: sparse: Expected =
; at the end of type declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:530:9: sparse: sparse: got }
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:534:9: sparse: sparse: Trying to=
 use reserved word 'return' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:534:16: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:534:16: sparse: sparse: got &
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:536:18: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:536:18: sparse: sparse: got :
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:539:13: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:539:13: sparse: sparse: got :
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:542:17: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:542:17: sparse: sparse: got :
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:545:21: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:545:21: sparse: sparse: got :
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:548:9: sparse: sparse: Expected =
; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:548:9: sparse: sparse: got :
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:551:9: sparse: sparse: Trying to=
 use reserved word 'return' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:551:16: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:551:16: sparse: sparse: got ERR_=
PTR
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:552:1: sparse: sparse: Expected =
; at the end of type declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:552:1: sparse: sparse: got }
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
) in function declarator
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got =3D
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Trying to=
 use reserved word 'for' as identifier
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Trying to=
 use reserved word 'do' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got {
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
) in function declarator
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got !
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Trying to=
 use reserved word 'if' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
; at the end of type declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got }
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
) in function declarator
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got *
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Trying to=
 use reserved word 'typeof' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
; at the end of type declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got }
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Trying to=
 use reserved word 'do' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got {
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
) in function declarator
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got !
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Trying to=
 use reserved word 'if' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
; at the end of type declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got }
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
) in function declarator
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got *
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Trying to=
 use reserved word 'typeof' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
; at the end of type declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got }
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
; at the end of type declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got &
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: Expected =
; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:559:9: sparse: sparse: got )
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:563:12: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:563:12: sparse: sparse: got ->
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:564:1: sparse: sparse: Expected =
; at the end of type declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:564:1: sparse: sparse: got }
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:570:9: sparse: sparse: Trying to=
 use reserved word 'switch' as identifier
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:571:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:572:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:573:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:574:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:575:9: sparse: sparse: not in sw=
itch scope
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:577:17: sparse: sparse: break/co=
ntinue not in iterator scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:578:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:580:17: sparse: sparse: break/co=
ntinue not in iterator scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:581:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:582:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:583:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:584:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:585:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:587:17: sparse: sparse: break/co=
ntinue not in iterator scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:588:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:590:17: sparse: sparse: break/co=
ntinue not in iterator scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:591:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:593:17: sparse: sparse: break/co=
ntinue not in iterator scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:594:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:596:17: sparse: sparse: break/co=
ntinue not in iterator scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:597:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:601:17: sparse: sparse: break/co=
ntinue not in iterator scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:604:9: sparse: sparse: Trying to=
 use reserved word 'return' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:604:16: sparse: sparse: Expected=
 ; at end of declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:604:16: sparse: sparse: got reg_=
type
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:605:1: sparse: sparse: Expected =
; at the end of type declaration
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:605:1: sparse: sparse: got }
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:611:9: sparse: sparse: Trying to=
 use reserved word 'switch' as identifier
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:612:9: sparse: sparse: not in sw=
itch scope
   drivers/gpu/drm/exynos/exynos_drm_g2d.c:613:9: sparse: sparse: not in sw=
itch scope
>> drivers/gpu/drm/exynos/exynos_drm_g2d.c:615:17: sparse: sparse: too many=
 errors

# https://github.com/0day-ci/linux/commit/e3b3dfab5ae2bb2842aaa4f90c41b264c=
b18900c
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout e3b3dfab5ae2bb2842aaa4f90c41b264cb18900c
vim +/if +527 drivers/gpu/drm/exynos/exynos_drm_g2d.c

2a3098ff6c2109 Inki Dae         2012-11-04  418  =

eb4d9796fa3404 Marek Szyprowski 2018-07-09  419  static dma_addr_t *g2d_use=
rptr_get_dma_addr(struct g2d_data *g2d,
2a3098ff6c2109 Inki Dae         2012-11-04  420  					unsigned long userptr,
2a3098ff6c2109 Inki Dae         2012-11-04  421  					unsigned long size,
2a3098ff6c2109 Inki Dae         2012-11-04  422  					struct drm_file *filp,
3aa2a5c14076e2 Marek Szyprowski 2018-07-09  423  					void **obj)
2a3098ff6c2109 Inki Dae         2012-11-04  424  {
2a3098ff6c2109 Inki Dae         2012-11-04  425  	struct drm_exynos_file_pr=
ivate *file_priv =3D filp->driver_priv;
2a3098ff6c2109 Inki Dae         2012-11-04  426  	struct g2d_cmdlist_userpt=
r *g2d_userptr;
2a3098ff6c2109 Inki Dae         2012-11-04  427  	struct sg_table	*sgt;
2a3098ff6c2109 Inki Dae         2012-11-04  428  	unsigned long start, end;
2a3098ff6c2109 Inki Dae         2012-11-04  429  	unsigned int npages, offs=
et;
2a3098ff6c2109 Inki Dae         2012-11-04  430  	int ret;
2a3098ff6c2109 Inki Dae         2012-11-04  431  =

2a3098ff6c2109 Inki Dae         2012-11-04  432  	if (!size) {
6f83d20838c099 Inki Dae         2019-04-15  433  		DRM_DEV_ERROR(g2d->dev, =
"invalid userptr size.\n");
2a3098ff6c2109 Inki Dae         2012-11-04  434  		return ERR_PTR(-EINVAL);
2a3098ff6c2109 Inki Dae         2012-11-04  435  	}
2a3098ff6c2109 Inki Dae         2012-11-04  436  =

2a3098ff6c2109 Inki Dae         2012-11-04  437  	/* check if userptr alrea=
dy exists in userptr_list. */
eb4d9796fa3404 Marek Szyprowski 2018-07-09  438  	list_for_each_entry(g2d_u=
serptr, &file_priv->userptr_list, list) {
2a3098ff6c2109 Inki Dae         2012-11-04  439  		if (g2d_userptr->userptr=
 =3D=3D userptr) {
2a3098ff6c2109 Inki Dae         2012-11-04  440  			/*
2a3098ff6c2109 Inki Dae         2012-11-04  441  			 * also check size beca=
use there could be same address
2a3098ff6c2109 Inki Dae         2012-11-04  442  			 * and different size.
2a3098ff6c2109 Inki Dae         2012-11-04  443  			 */
2a3098ff6c2109 Inki Dae         2012-11-04  444  			if (g2d_userptr->size =
=3D=3D size) {
2a3098ff6c2109 Inki Dae         2012-11-04  445  				atomic_inc(&g2d_userpt=
r->refcount);
3aa2a5c14076e2 Marek Szyprowski 2018-07-09  446  				*obj =3D g2d_userptr;
2a3098ff6c2109 Inki Dae         2012-11-04  447  =

2a3098ff6c2109 Inki Dae         2012-11-04  448  				return &g2d_userptr->d=
ma_addr;
2a3098ff6c2109 Inki Dae         2012-11-04  449  			}
2a3098ff6c2109 Inki Dae         2012-11-04  450  =

2a3098ff6c2109 Inki Dae         2012-11-04  451  			/*
2a3098ff6c2109 Inki Dae         2012-11-04  452  			 * at this moment, mayb=
e g2d dma is accessing this
2a3098ff6c2109 Inki Dae         2012-11-04  453  			 * g2d_userptr memory r=
egion so just remove this
2a3098ff6c2109 Inki Dae         2012-11-04  454  			 * g2d_userptr object f=
rom userptr_list not to be
2a3098ff6c2109 Inki Dae         2012-11-04  455  			 * referred again and a=
lso except it the userptr
2a3098ff6c2109 Inki Dae         2012-11-04  456  			 * pool to be released =
after the dma access completion.
2a3098ff6c2109 Inki Dae         2012-11-04  457  			 */
2a3098ff6c2109 Inki Dae         2012-11-04  458  			g2d_userptr->out_of_lis=
t =3D true;
2a3098ff6c2109 Inki Dae         2012-11-04  459  			g2d_userptr->in_pool =
=3D false;
2a3098ff6c2109 Inki Dae         2012-11-04  460  			list_del_init(&g2d_user=
ptr->list);
2a3098ff6c2109 Inki Dae         2012-11-04  461  =

2a3098ff6c2109 Inki Dae         2012-11-04  462  			break;
2a3098ff6c2109 Inki Dae         2012-11-04  463  		}
2a3098ff6c2109 Inki Dae         2012-11-04  464  	}
2a3098ff6c2109 Inki Dae         2012-11-04  465  =

2a3098ff6c2109 Inki Dae         2012-11-04  466  	g2d_userptr =3D kzalloc(s=
izeof(*g2d_userptr), GFP_KERNEL);
38bb5253a95f2e Sachin Kamat     2013-08-19  467  	if (!g2d_userptr)
2a3098ff6c2109 Inki Dae         2012-11-04  468  		return ERR_PTR(-ENOMEM);
2a3098ff6c2109 Inki Dae         2012-11-04  469  =

2a3098ff6c2109 Inki Dae         2012-11-04  470  	atomic_set(&g2d_userptr->=
refcount, 1);
63540f01917c0d Jan Kara         2015-07-20  471  	g2d_userptr->size =3D siz=
e;
2a3098ff6c2109 Inki Dae         2012-11-04  472  =

2a3098ff6c2109 Inki Dae         2012-11-04  473  	start =3D userptr & PAGE_=
MASK;
2a3098ff6c2109 Inki Dae         2012-11-04  474  	offset =3D userptr & ~PAG=
E_MASK;
2a3098ff6c2109 Inki Dae         2012-11-04  475  	end =3D PAGE_ALIGN(userpt=
r + size);
2a3098ff6c2109 Inki Dae         2012-11-04  476  	npages =3D (end - start) =
>> PAGE_SHIFT;
63540f01917c0d Jan Kara         2015-07-20  477  	g2d_userptr->vec =3D fram=
e_vector_create(npages);
63540f01917c0d Jan Kara         2015-07-20  478  	if (!g2d_userptr->vec) {
4bb615c5fbb4f3 Seung-Woo Kim    2013-07-03  479  		ret =3D -ENOMEM;
4bb615c5fbb4f3 Seung-Woo Kim    2013-07-03  480  		goto err_free;
2a3098ff6c2109 Inki Dae         2012-11-04  481  	}
2a3098ff6c2109 Inki Dae         2012-11-04  482  =

7f23b3504a0df6 Lorenzo Stoakes  2016-10-13  483  	ret =3D get_vaddr_frames(=
start, npages, FOLL_FORCE | FOLL_WRITE,
7f23b3504a0df6 Lorenzo Stoakes  2016-10-13  484  		g2d_userptr->vec);
63540f01917c0d Jan Kara         2015-07-20  485  	if (ret !=3D npages) {
6f83d20838c099 Inki Dae         2019-04-15  486  		DRM_DEV_ERROR(g2d->dev,
6f83d20838c099 Inki Dae         2019-04-15  487  			      "failed to get us=
er pages from userptr.\n");
63540f01917c0d Jan Kara         2015-07-20  488  		if (ret < 0)
63540f01917c0d Jan Kara         2015-07-20  489  			goto err_destroy_framev=
ec;
2a3098ff6c2109 Inki Dae         2012-11-04  490  		ret =3D -EFAULT;
63540f01917c0d Jan Kara         2015-07-20  491  		goto err_put_framevec;
2a3098ff6c2109 Inki Dae         2012-11-04  492  	}
63540f01917c0d Jan Kara         2015-07-20  493  	if (frame_vector_to_pages=
(g2d_userptr->vec) < 0) {
2a3098ff6c2109 Inki Dae         2012-11-04  494  		ret =3D -EFAULT;
63540f01917c0d Jan Kara         2015-07-20  495  		goto err_put_framevec;
2a3098ff6c2109 Inki Dae         2012-11-04  496  	}
2a3098ff6c2109 Inki Dae         2012-11-04  497  =

e44a5c00169df6 Sachin Kamat     2013-01-25  498  	sgt =3D kzalloc(sizeof(*s=
gt), GFP_KERNEL);
2a3098ff6c2109 Inki Dae         2012-11-04  499  	if (!sgt) {
2a3098ff6c2109 Inki Dae         2012-11-04  500  		ret =3D -ENOMEM;
63540f01917c0d Jan Kara         2015-07-20  501  		goto err_put_framevec;
2a3098ff6c2109 Inki Dae         2012-11-04  502  	}
2a3098ff6c2109 Inki Dae         2012-11-04  503  =

63540f01917c0d Jan Kara         2015-07-20  504  	ret =3D sg_alloc_table_fr=
om_pages(sgt,
63540f01917c0d Jan Kara         2015-07-20  505  					frame_vector_pages(g2=
d_userptr->vec),
63540f01917c0d Jan Kara         2015-07-20  506  					npages, offset, size,=
 GFP_KERNEL);
2a3098ff6c2109 Inki Dae         2012-11-04  507  	if (ret < 0) {
6f83d20838c099 Inki Dae         2019-04-15  508  		DRM_DEV_ERROR(g2d->dev, =
"failed to get sgt from pages.\n");
2a3098ff6c2109 Inki Dae         2012-11-04  509  		goto err_free_sgt;
2a3098ff6c2109 Inki Dae         2012-11-04  510  	}
2a3098ff6c2109 Inki Dae         2012-11-04  511  =

2a3098ff6c2109 Inki Dae         2012-11-04  512  	g2d_userptr->sgt =3D sgt;
2a3098ff6c2109 Inki Dae         2012-11-04  513  =

e3b3dfab5ae2bb Marek Szyprowski 2020-04-28  514  	sgt->nents =3D dma_map_sg=
(to_dma_dev(g2d->drm_dev), sgt->sgl,
e3b3dfab5ae2bb Marek Szyprowski 2020-04-28  515  				sgt->orig_nents, DMA_B=
IDIRECTIONAL)
e3b3dfab5ae2bb Marek Szyprowski 2020-04-28  516  	if (!sgt->nents) {
6f83d20838c099 Inki Dae         2019-04-15  517  		DRM_DEV_ERROR(g2d->dev, =
"failed to map sgt with dma region.\n");
6aa5e85d7c1578 Joonyoung Shim   2016-04-22  518  		ret =3D -ENOMEM;
067ed3311f7961 YoungJun Cho     2013-03-11  519  		goto err_sg_free_table;
2a3098ff6c2109 Inki Dae         2012-11-04  520  	}
2a3098ff6c2109 Inki Dae         2012-11-04  521  =

2a3098ff6c2109 Inki Dae         2012-11-04  522  	g2d_userptr->dma_addr =3D=
 sgt->sgl[0].dma_address;
2a3098ff6c2109 Inki Dae         2012-11-04  523  	g2d_userptr->userptr =3D =
userptr;
2a3098ff6c2109 Inki Dae         2012-11-04  524  =

eb4d9796fa3404 Marek Szyprowski 2018-07-09  525  	list_add_tail(&g2d_userpt=
r->list, &file_priv->userptr_list);
2a3098ff6c2109 Inki Dae         2012-11-04  526  =

2a3098ff6c2109 Inki Dae         2012-11-04 @527  	if (g2d->current_pool + (=
npages << PAGE_SHIFT) < g2d->max_pool) {
2a3098ff6c2109 Inki Dae         2012-11-04  528  		g2d->current_pool +=3D n=
pages << PAGE_SHIFT;
2a3098ff6c2109 Inki Dae         2012-11-04  529  		g2d_userptr->in_pool =3D=
 true;
2a3098ff6c2109 Inki Dae         2012-11-04  530  	}
2a3098ff6c2109 Inki Dae         2012-11-04  531  =

3aa2a5c14076e2 Marek Szyprowski 2018-07-09  532  	*obj =3D g2d_userptr;
2a3098ff6c2109 Inki Dae         2012-11-04  533  =

2a3098ff6c2109 Inki Dae         2012-11-04 @534  	return &g2d_userptr->dma_=
addr;
2a3098ff6c2109 Inki Dae         2012-11-04  535  =

067ed3311f7961 YoungJun Cho     2013-03-11  536  err_sg_free_table:
2a3098ff6c2109 Inki Dae         2012-11-04  537  	sg_free_table(sgt);
067ed3311f7961 YoungJun Cho     2013-03-11  538  =

067ed3311f7961 YoungJun Cho     2013-03-11  539  err_free_sgt:
2a3098ff6c2109 Inki Dae         2012-11-04  540  	kfree(sgt);
2a3098ff6c2109 Inki Dae         2012-11-04  541  =

63540f01917c0d Jan Kara         2015-07-20  542  err_put_framevec:
63540f01917c0d Jan Kara         2015-07-20  543  	put_vaddr_frames(g2d_user=
ptr->vec);
2a3098ff6c2109 Inki Dae         2012-11-04  544  =

63540f01917c0d Jan Kara         2015-07-20  545  err_destroy_framevec:
63540f01917c0d Jan Kara         2015-07-20  546  	frame_vector_destroy(g2d_=
userptr->vec);
4bb615c5fbb4f3 Seung-Woo Kim    2013-07-03  547  =

4bb615c5fbb4f3 Seung-Woo Kim    2013-07-03  548  err_free:
2a3098ff6c2109 Inki Dae         2012-11-04  549  	kfree(g2d_userptr);
2a3098ff6c2109 Inki Dae         2012-11-04  550  =

2a3098ff6c2109 Inki Dae         2012-11-04  551  	return ERR_PTR(ret);
2a3098ff6c2109 Inki Dae         2012-11-04  552  }
2a3098ff6c2109 Inki Dae         2012-11-04  553  =

eb4d9796fa3404 Marek Szyprowski 2018-07-09  554  static void g2d_userptr_fr=
ee_all(struct g2d_data *g2d, struct drm_file *filp)
2a3098ff6c2109 Inki Dae         2012-11-04  555  {
2a3098ff6c2109 Inki Dae         2012-11-04  556  	struct drm_exynos_file_pr=
ivate *file_priv =3D filp->driver_priv;
2a3098ff6c2109 Inki Dae         2012-11-04  557  	struct g2d_cmdlist_userpt=
r *g2d_userptr, *n;
2a3098ff6c2109 Inki Dae         2012-11-04  558  =

eb4d9796fa3404 Marek Szyprowski 2018-07-09 @559  	list_for_each_entry_safe(=
g2d_userptr, n, &file_priv->userptr_list, list)
2a3098ff6c2109 Inki Dae         2012-11-04  560  		if (g2d_userptr->in_pool)
3aa2a5c14076e2 Marek Szyprowski 2018-07-09  561  			g2d_userptr_put_dma_add=
r(g2d, g2d_userptr, true);
2a3098ff6c2109 Inki Dae         2012-11-04  562  =

2a3098ff6c2109 Inki Dae         2012-11-04  563  	g2d->current_pool =3D 0;
2a3098ff6c2109 Inki Dae         2012-11-04  564  }
2a3098ff6c2109 Inki Dae         2012-11-04  565  =

6f83d20838c099 Inki Dae         2019-04-15  566  static enum g2d_reg_type g=
2d_get_reg_type(struct g2d_data *g2d, int reg_offset)
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  567  {
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  568  	enum g2d_reg_type reg_typ=
e;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  569  =

9963cb6ef9e6f9 YoungJun Cho     2013-03-13 @570  	switch (reg_offset) {
9963cb6ef9e6f9 YoungJun Cho     2013-03-13 @571  	case G2D_SRC_BASE_ADDR:
ed4dc2718d3510 Tobias Jakobi    2016-05-25  572  	case G2D_SRC_STRIDE:
2dec17c70e7567 YoungJun Cho     2013-03-11  573  	case G2D_SRC_COLOR_MODE:
2dec17c70e7567 YoungJun Cho     2013-03-11  574  	case G2D_SRC_LEFT_TOP:
2dec17c70e7567 YoungJun Cho     2013-03-11  575  	case G2D_SRC_RIGHT_BOTTOM:
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  576  		reg_type =3D REG_TYPE_SR=
C;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13 @577  		break;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  578  	case G2D_SRC_PLANE2_BASE_=
ADDR:
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  579  		reg_type =3D REG_TYPE_SR=
C_PLANE2;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  580  		break;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  581  	case G2D_DST_BASE_ADDR:
ed4dc2718d3510 Tobias Jakobi    2016-05-25  582  	case G2D_DST_STRIDE:
2dec17c70e7567 YoungJun Cho     2013-03-11  583  	case G2D_DST_COLOR_MODE:
2dec17c70e7567 YoungJun Cho     2013-03-11  584  	case G2D_DST_LEFT_TOP:
2dec17c70e7567 YoungJun Cho     2013-03-11  585  	case G2D_DST_RIGHT_BOTTOM:
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  586  		reg_type =3D REG_TYPE_DS=
T;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  587  		break;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  588  	case G2D_DST_PLANE2_BASE_=
ADDR:
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  589  		reg_type =3D REG_TYPE_DS=
T_PLANE2;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  590  		break;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  591  	case G2D_PAT_BASE_ADDR:
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  592  		reg_type =3D REG_TYPE_PA=
T;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  593  		break;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  594  	case G2D_MSK_BASE_ADDR:
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  595  		reg_type =3D REG_TYPE_MS=
K;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  596  		break;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  597  	default:
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  598  		reg_type =3D REG_TYPE_NO=
NE;
6f83d20838c099 Inki Dae         2019-04-15  599  		DRM_DEV_ERROR(g2d->dev, =
"Unknown register offset![%d]\n",
6f83d20838c099 Inki Dae         2019-04-15  600  			      reg_offset);
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  601  		break;
5cdbc8d993074f Sachin Kamat     2014-01-16  602  	}
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  603  =

9963cb6ef9e6f9 YoungJun Cho     2013-03-13  604  	return reg_type;
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  605  }
9963cb6ef9e6f9 YoungJun Cho     2013-03-13  606  =

2dec17c70e7567 YoungJun Cho     2013-03-11  607  static unsigned long g2d_g=
et_buf_bpp(unsigned int format)
2dec17c70e7567 YoungJun Cho     2013-03-11  608  {
2dec17c70e7567 YoungJun Cho     2013-03-11  609  	unsigned long bpp;
2dec17c70e7567 YoungJun Cho     2013-03-11  610  =

2dec17c70e7567 YoungJun Cho     2013-03-11  611  	switch (format) {
2dec17c70e7567 YoungJun Cho     2013-03-11  612  	case G2D_FMT_XRGB8888:
2dec17c70e7567 YoungJun Cho     2013-03-11  613  	case G2D_FMT_ARGB8888:
2dec17c70e7567 YoungJun Cho     2013-03-11  614  		bpp =3D 4;
2dec17c70e7567 YoungJun Cho     2013-03-11 @615  		break;
2dec17c70e7567 YoungJun Cho     2013-03-11  616  	case G2D_FMT_RGB565:
2dec17c70e7567 YoungJun Cho     2013-03-11  617  	case G2D_FMT_XRGB1555:
2dec17c70e7567 YoungJun Cho     2013-03-11  618  	case G2D_FMT_ARGB1555:
2dec17c70e7567 YoungJun Cho     2013-03-11  619  	case G2D_FMT_XRGB4444:
2dec17c70e7567 YoungJun Cho     2013-03-11  620  	case G2D_FMT_ARGB4444:
2dec17c70e7567 YoungJun Cho     2013-03-11  621  		bpp =3D 2;
2dec17c70e7567 YoungJun Cho     2013-03-11  622  		break;
2dec17c70e7567 YoungJun Cho     2013-03-11  623  	case G2D_FMT_PACKED_RGB88=
8:
2dec17c70e7567 YoungJun Cho     2013-03-11  624  		bpp =3D 3;
2dec17c70e7567 YoungJun Cho     2013-03-11  625  		break;
2dec17c70e7567 YoungJun Cho     2013-03-11  626  	default:
2dec17c70e7567 YoungJun Cho     2013-03-11  627  		bpp =3D 1;
2dec17c70e7567 YoungJun Cho     2013-03-11  628  		break;
2dec17c70e7567 YoungJun Cho     2013-03-11  629  	}
2dec17c70e7567 YoungJun Cho     2013-03-11  630  =

2dec17c70e7567 YoungJun Cho     2013-03-11  631  	return bpp;
2dec17c70e7567 YoungJun Cho     2013-03-11  632  }
2dec17c70e7567 YoungJun Cho     2013-03-11  633  =


:::::: The code at line 527 was first introduced by commit
:::::: 2a3098ff6c2109557868f9f230f4725312dcb882 drm/exynos: add userptr fea=
ture for g2d module

:::::: TO: Inki Dae <inki.dae@samsung.com>
:::::: CC: Inki Dae <inki.dae@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2117294944699298094==--

