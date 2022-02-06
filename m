Content-Type: multipart/mixed; boundary="===============2160749832131873742=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/nouveau/nouveau_ttm.c:119 nv04_gart_manager_new() warn: should '(*res)->num_pages << 12' be a 64 bit type?
Date: Mon, 07 Feb 2022 03:38:19 +0800
Message-ID: <202202070336.MVM9IeLm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2160749832131873742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Matthew Auld <matthew.auld@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   90c9e950c0def5c354b4a6154a2ddda3e5f214ac
commit: cb1c81467af355829a4a9d8fa3f92ffab355d93c drm/ttm: flip the switch f=
or driver allocated resources v2
date:   8 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 8 months ago
config: powerpc-randconfig-m031-20220130 (https://download.01.org/0day-ci/a=
rchive/20220207/202202070336.MVM9IeLm-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/nouveau/nouveau_ttm.c:119 nv04_gart_manager_new() warn: sho=
uld '(*res)->num_pages << 12' be a 64 bit type?

vim +119 drivers/gpu/drm/nouveau/nouveau_ttm.c

bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  100  =

bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  101  static int
9de59bc201496f Dave Airlie     2020-08-04  102  nv04_gart_manager_new(struc=
t ttm_resource_manager *man,
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  103  		      struct ttm_buffer_o=
bject *bo,
f1217ed09f827e Christian K=C3=B6nig 2014-08-27  104  		      const struct t=
tm_place *place,
cb1c81467af355 Christian K=C3=B6nig 2021-04-30  105  		      struct ttm_res=
ource **res)
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  106  {
9ce523cc3bf2ac Ben Skeggs      2017-11-01  107  	struct nouveau_bo *nvbo =
=3D nouveau_bo(bo);
0d5a03c3d92548 Ben Skeggs      2018-05-08  108  	struct nouveau_drm *drm =
=3D nouveau_bdev(bo->bdev);
9ce523cc3bf2ac Ben Skeggs      2017-11-01  109  	struct nouveau_mem *mem;
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  110  	int ret;
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  111  =

cb1c81467af355 Christian K=C3=B6nig 2021-04-30  112  	ret =3D nouveau_mem_n=
ew(&drm->master, nvbo->kind, nvbo->comp, res);
9ce523cc3bf2ac Ben Skeggs      2017-11-01  113  	if (ret)
9ce523cc3bf2ac Ben Skeggs      2017-11-01  114  		return ret;
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  115  =

cb1c81467af355 Christian K=C3=B6nig 2021-04-30  116  	mem =3D nouveau_mem(*=
res);
cb1c81467af355 Christian K=C3=B6nig 2021-04-30  117  	ttm_resource_init(bo,=
 place, *res);
d7722134b8254b Ben Skeggs      2017-11-01  118  	ret =3D nvif_vmm_get(&mem-=
>cli->vmm.vmm, PTES, false, 12, 0,
cb1c81467af355 Christian K=C3=B6nig 2021-04-30 @119  			   (long)(*res)->nu=
m_pages << PAGE_SHIFT, &mem->vma[0]);
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  120  	if (ret) {
cb1c81467af355 Christian K=C3=B6nig 2021-04-30  121  		nouveau_mem_del(*res=
);
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  122  		return ret;
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  123  	}
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  124  =

cb1c81467af355 Christian K=C3=B6nig 2021-04-30  125  	(*res)->start =3D mem=
->vma[0].addr >> PAGE_SHIFT;
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  126  	return 0;
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  127  }
bc9e7b9a61e9e9 Ben Skeggs      2012-07-19  128  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2160749832131873742==--

