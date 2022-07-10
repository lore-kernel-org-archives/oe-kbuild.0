Content-Type: multipart/mixed; boundary="===============1023352041768429108=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:for-linux-next-fixes 1/1] drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:405 amdgpu_vram_mgr_new() warn: Please consider using kvzalloc instead of kvmalloc
Date: Sun, 10 Jul 2022 12:15:43 +0800
Message-ID: <202207101212.IUo5OvzJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1023352041768429108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: dri-devel(a)lists.freedesktop.org
TO: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next-fixes
head:   925b6e59138cefa47275c67891c65d48d3266d57
commit: 925b6e59138cefa47275c67891c65d48d3266d57 [1/1] Revert "drm/amdgpu: =
add drm buddy support to amdgpu"
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-randconfig-m031-20220707 (https://download.01.org/0day-ci/archi=
ve/20220710/202207101212.IUo5OvzJ-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:405 amdgpu_vram_mgr_new() warn=
: Please consider using kvzalloc instead of kvmalloc

vim +405 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  355  =

6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  356  /**
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  357   * amdgpu_vra=
m_mgr_new - allocate new ranges
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  358   *
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  359   * @man: TTM =
memory type manager
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  360   * @tbo: TTM =
BO we need this range for
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  361   * @place: pl=
acement flags and restrictions
6333a495f53347 Yifan Zhang              2021-08-26  362   * @res: the resul=
ting mem object
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  363   *
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  364   * Allocate V=
RAM for the given BO.
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  365   */
9de59bc201496f Dave Airlie              2020-08-04  366  static int amdgpu_=
vram_mgr_new(struct ttm_resource_manager *man,
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  367  			       str=
uct ttm_buffer_object *tbo,
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  368  			       con=
st struct ttm_place *place,
cb1c81467af355 Christian K=C3=B6nig          2021-04-30  369  			       str=
uct ttm_resource **res)
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  370  {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  371  	unsigned long lpf=
n, num_nodes, pages_per_node, pages_left, pages;
0af135b892bf06 Dave Airlie              2020-08-04  372  	struct amdgpu_vra=
m_mgr *mgr =3D to_vram_mgr(man);
373627930f0208 Dave Airlie              2020-08-07  373  	struct amdgpu_dev=
ice *adev =3D to_amdgpu_device(mgr);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  374  	uint64_t vis_usag=
e =3D 0, mem_bytes, max_bytes;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  375  	struct ttm_range_=
mgr_node *node;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  376  	struct drm_mm *mm=
 =3D &mgr->mm;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  377  	enum drm_mm_inser=
t_mode mode;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  378  	unsigned i;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  379  	int r;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  380  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  381  	lpfn =3D place->l=
pfn;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  382  	if (!lpfn)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  383  		lpfn =3D man->si=
ze >> PAGE_SHIFT;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  384  =

9d1b3c78052e87 Christian K=C3=B6nig          2019-08-30  385  	max_bytes =
=3D adev->gmc.mc_vram_size;
9d1b3c78052e87 Christian K=C3=B6nig          2019-08-30  386  	if (tbo->typ=
e !=3D ttm_bo_type_kernel)
9d1b3c78052e87 Christian K=C3=B6nig          2019-08-30  387  		max_bytes -=
=3D AMDGPU_VM_RESERVED_VRAM;
9d1b3c78052e87 Christian K=C3=B6nig          2019-08-30  388  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  389  	mem_bytes =3D tbo=
->base.size;
b4559a16467a13 Tom St Denis             2019-06-04  390  	if (place->flags =
& TTM_PL_FLAG_CONTIGUOUS) {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  391  		pages_per_node =
=3D ~0ul;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  392  		num_nodes =3D 1;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  393  	} else {
b4559a16467a13 Tom St Denis             2019-06-04  394  #ifdef CONFIG_TRAN=
SPARENT_HUGEPAGE
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  395  		pages_per_node =
=3D HPAGE_PMD_NR;
b4559a16467a13 Tom St Denis             2019-06-04  396  #else
b4559a16467a13 Tom St Denis             2019-06-04  397  		/* default to 2M=
B */
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  398  		pages_per_node =
=3D 2UL << (20UL - PAGE_SHIFT);
b4559a16467a13 Tom St Denis             2019-06-04  399  #endif
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  400  		pages_per_node =
=3D max_t(uint32_t, pages_per_node,
c777dc9e793342 Christian K=C3=B6nig          2021-02-05  401  				       tb=
o->page_alignment);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  402  		num_nodes =3D DI=
V_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  403  	}
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  404  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08 @405  	node =3D kvmalloc=
(struct_size(node, mm_nodes, num_nodes),
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  406  			GFP_KERNEL | __=
GFP_ZERO);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  407  	if (!node)
7db47b838896ec Christian K=C3=B6nig          2021-07-12  408  		return -ENO=
MEM;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  409  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  410  	ttm_resource_init=
(tbo, place, &node->base);
267501ec2b9cfa Christian K=C3=B6nig          2021-04-26  411  =

7db47b838896ec Christian K=C3=B6nig          2021-07-12  412  	/* bail out =
quickly if there's likely not enough VRAM for this BO */
7db47b838896ec Christian K=C3=B6nig          2021-07-12  413  	if (ttm_reso=
urce_manager_usage(man) > max_bytes) {
7db47b838896ec Christian K=C3=B6nig          2021-07-12  414  		r =3D -ENOS=
PC;
7db47b838896ec Christian K=C3=B6nig          2021-07-12  415  		goto error_=
fini;
7db47b838896ec Christian K=C3=B6nig          2021-07-12  416  	}
7db47b838896ec Christian K=C3=B6nig          2021-07-12  417  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  418  	mode =3D DRM_MM_I=
NSERT_BEST;
4e64e5539d152e Chris Wilson             2017-02-02  419  	if (place->flags =
& TTM_PL_FLAG_TOPDOWN)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  420  		mode =3D DRM_MM_=
INSERT_HIGH;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  421  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  422  	pages_left =3D no=
de->base.num_pages;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  423  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  424  	/* Limit maximum =
size to 2GB due to SG table limitations */
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  425  	pages =3D min(pag=
es_left, 2UL << (30 - PAGE_SHIFT));
433ca054949a6c Christian K=C3=B6nig          2018-09-07  426  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  427  	i =3D 0;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  428  	spin_lock(&mgr->l=
ock);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  429  	while (pages_left=
) {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  430  		uint32_t alignme=
nt =3D tbo->page_alignment;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  431  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  432  		if (pages >=3D p=
ages_per_node)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  433  			alignment =3D p=
ages_per_node;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  434  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  435  		r =3D drm_mm_ins=
ert_node_in_range(mm, &node->mm_nodes[i], pages,
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  436  						alignment, 0=
, place->fpfn,
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  437  						lpfn, mode);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  438  		if (unlikely(r))=
 {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  439  			if (pages > pag=
es_per_node) {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  440  				if (is_power_o=
f_2(pages))
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  441  					pages =3D pag=
es / 2;
dd03daec0ff170 Christian K=C3=B6nig          2021-04-26  442  				else
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  443  					pages =3D rou=
nddown_pow_of_two(pages);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  444  				continue;
dd03daec0ff170 Christian K=C3=B6nig          2021-04-26  445  			}
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  446  			goto error_free;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  447  		}
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  448  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  449  		vis_usage +=3D a=
mdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  450  		amdgpu_vram_mgr_=
virt_start(&node->base, &node->mm_nodes[i]);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  451  		pages_left -=3D =
pages;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  452  		++i;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  453  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  454  		if (pages > page=
s_left)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  455  			pages =3D pages=
_left;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  456  	}
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  457  	spin_unlock(&mgr-=
>lock);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  458  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  459  	if (i =3D=3D 1)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  460  		node->base.place=
ment |=3D TTM_PL_FLAG_CONTIGUOUS;
3c848bb38aca1f Christian K=C3=B6nig          2017-08-07  461  =

8dbe43e99f0f62 Oak Zeng                 2021-06-28  462  	if (adev->gmc.xgm=
i.connected_to_cpu)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  463  		node->base.bus.c=
aching =3D ttm_cached;
8dbe43e99f0f62 Oak Zeng                 2021-06-28  464  	else
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  465  		node->base.bus.c=
aching =3D ttm_write_combined;
8dbe43e99f0f62 Oak Zeng                 2021-06-28  466  =

abf91e0d33166b Christian K=C3=B6nig          2021-04-27  467  	atomic64_add=
(vis_usage, &mgr->vis_usage);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  468  	*res =3D &node->b=
ase;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  469  	return 0;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  470  =

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  471  error_free:
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  472  	while (i--)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  473  		drm_mm_remove_no=
de(&node->mm_nodes[i]);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  474  	spin_unlock(&mgr-=
>lock);
7db47b838896ec Christian K=C3=B6nig          2021-07-12  475  error_fini:
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  476  	ttm_resource_fini=
(man, &node->base);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  477  	kvfree(node);
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  478  =

58e4d686d456c3 Christian K=C3=B6nig          2020-06-16  479  	return r;
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  480  }
6a7f76e70fac0b Christian K=C3=B6nig          2016-08-24  481  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1023352041768429108==--

