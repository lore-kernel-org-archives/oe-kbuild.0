Content-Type: multipart/mixed; boundary="===============1231949070484240303=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:766 amdgpu_gem_op_ioctl() warn: should 'robj->tbo.page_alignment << (12)' be a 64 bit type?
Date: Thu, 03 Mar 2022 07:21:36 +0800
Message-ID: <202203030710.ZQwlt482-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1231949070484240303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Matthew Auld <matthew.auld@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fb184c4af9b9f4563e7a126219389986a71d5b5b
commit: c777dc9e793342ecdfc95045d2127a3ea32791a0 drm/ttm: move the page_ali=
gnment into the BO v2
date:   10 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-m031-20220302 (https://download.01.org/0day-ci/arc=
hive/20220303/202203030710.ZQwlt482-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:766 amdgpu_gem_op_ioctl() warn: sho=
uld 'robj->tbo.page_alignment << (12)' be a 64 bit type?

vim +766 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

d38ceaf99ed015 Alex Deucher                   2015-04-20  739  =

d38ceaf99ed015 Alex Deucher                   2015-04-20  740  int amdgpu_g=
em_op_ioctl(struct drm_device *dev, void *data,
d38ceaf99ed015 Alex Deucher                   2015-04-20  741  			struct dr=
m_file *filp)
d38ceaf99ed015 Alex Deucher                   2015-04-20  742  {
1348969ab68cb8 Luben Tuikov                   2020-08-24  743  	struct amdg=
pu_device *adev =3D drm_to_adev(dev);
d38ceaf99ed015 Alex Deucher                   2015-04-20  744  	struct drm_=
amdgpu_gem_op *args =3D data;
d38ceaf99ed015 Alex Deucher                   2015-04-20  745  	struct drm_=
gem_object *gobj;
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  746  	struct amdg=
pu_vm_bo_base *base;
d38ceaf99ed015 Alex Deucher                   2015-04-20  747  	struct amdg=
pu_bo *robj;
d38ceaf99ed015 Alex Deucher                   2015-04-20  748  	int r;
d38ceaf99ed015 Alex Deucher                   2015-04-20  749  =

a8ad0bd84f9860 Chris Wilson                   2016-05-09  750  	gobj =3D dr=
m_gem_object_lookup(filp, args->handle);
d38ceaf99ed015 Alex Deucher                   2015-04-20  751  	if (gobj =
=3D=3D NULL) {
d38ceaf99ed015 Alex Deucher                   2015-04-20  752  		return -EN=
OENT;
d38ceaf99ed015 Alex Deucher                   2015-04-20  753  	}
d38ceaf99ed015 Alex Deucher                   2015-04-20  754  	robj =3D ge=
m_to_amdgpu_bo(gobj);
d38ceaf99ed015 Alex Deucher                   2015-04-20  755  =

d38ceaf99ed015 Alex Deucher                   2015-04-20  756  	r =3D amdgp=
u_bo_reserve(robj, false);
d38ceaf99ed015 Alex Deucher                   2015-04-20  757  	if (unlikel=
y(r))
d38ceaf99ed015 Alex Deucher                   2015-04-20  758  		goto out;
d38ceaf99ed015 Alex Deucher                   2015-04-20  759  =

d38ceaf99ed015 Alex Deucher                   2015-04-20  760  	switch (arg=
s->op) {
d38ceaf99ed015 Alex Deucher                   2015-04-20  761  	case AMDGPU=
_GEM_OP_GET_GEM_CREATE_INFO: {
d38ceaf99ed015 Alex Deucher                   2015-04-20  762  		struct drm=
_amdgpu_gem_create_in info;
7ecc245a8ce32f Christian K=C3=B6nig                2017-07-26  763  		void =
__user *out =3D u64_to_user_ptr(args->value);
d38ceaf99ed015 Alex Deucher                   2015-04-20  764  =

c105de2828e139 Gerd Hoffmann                  2019-08-05  765  		info.bo_si=
ze =3D robj->tbo.base.size;
c777dc9e793342 Christian K=C3=B6nig                2021-02-05 @766  		info.=
alignment =3D robj->tbo.page_alignment << PAGE_SHIFT;
6d7d9c5aa212d0 Kent Russell                   2017-08-08  767  		info.domai=
ns =3D robj->preferred_domains;
d38ceaf99ed015 Alex Deucher                   2015-04-20  768  		info.domai=
n_flags =3D robj->flags;
4c28fb0b27ad58 Christian K=C3=B6nig                2015-08-28  769  		amdgp=
u_bo_unreserve(robj);
d38ceaf99ed015 Alex Deucher                   2015-04-20  770  		if (copy_t=
o_user(out, &info, sizeof(info)))
d38ceaf99ed015 Alex Deucher                   2015-04-20  771  			r =3D -EF=
AULT;
d38ceaf99ed015 Alex Deucher                   2015-04-20  772  		break;
d38ceaf99ed015 Alex Deucher                   2015-04-20  773  	}
d8f65a2376268d Marek Ol=C5=A1=C3=A1k                    2015-05-27  774  	c=
ase AMDGPU_GEM_OP_SET_PLACEMENT:
803d89ade4ede1 Christopher James Halse Rogers 2017-04-03  775  		if (robj->=
prime_shared_count && (args->value & AMDGPU_GEM_DOMAIN_VRAM)) {
803d89ade4ede1 Christopher James Halse Rogers 2017-04-03  776  			r =3D -EI=
NVAL;
803d89ade4ede1 Christopher James Halse Rogers 2017-04-03  777  			amdgpu_bo=
_unreserve(robj);
803d89ade4ede1 Christopher James Halse Rogers 2017-04-03  778  			break;
803d89ade4ede1 Christopher James Halse Rogers 2017-04-03  779  		}
cc325d19134756 Christian K=C3=B6nig                2016-02-08  780  		if (a=
mdgpu_ttm_tt_get_usermm(robj->tbo.ttm)) {
d38ceaf99ed015 Alex Deucher                   2015-04-20  781  			r =3D -EP=
ERM;
4c28fb0b27ad58 Christian K=C3=B6nig                2015-08-28  782  			amdg=
pu_bo_unreserve(robj);
d38ceaf99ed015 Alex Deucher                   2015-04-20  783  			break;
d38ceaf99ed015 Alex Deucher                   2015-04-20  784  		}
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  785  		for (base =
=3D robj->vm_bo; base; base =3D base->next)
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  786  			if (amdgp=
u_xgmi_same_hive(amdgpu_ttm_adev(robj->tbo.bdev),
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  787  				amdgpu_t=
tm_adev(base->vm->root.base.bo->tbo.bdev))) {
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  788  				r =3D -E=
INVAL;
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  789  				amdgpu_b=
o_unreserve(robj);
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  790  				goto out;
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  791  			}
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  792  =

b4ae4fe6cdbbfe shaoyunl                       2019-03-26  793  =

6d7d9c5aa212d0 Kent Russell                   2017-08-08  794  		robj->pref=
erred_domains =3D args->value & (AMDGPU_GEM_DOMAIN_VRAM |
d38ceaf99ed015 Alex Deucher                   2015-04-20  795  							AMDGP=
U_GEM_DOMAIN_GTT |
d38ceaf99ed015 Alex Deucher                   2015-04-20  796  							AMDGP=
U_GEM_DOMAIN_CPU);
6d7d9c5aa212d0 Kent Russell                   2017-08-08  797  		robj->allo=
wed_domains =3D robj->preferred_domains;
1ea863fd736eed Christian K=C3=B6nig                2015-12-18  798  		if (r=
obj->allowed_domains =3D=3D AMDGPU_GEM_DOMAIN_VRAM)
1ea863fd736eed Christian K=C3=B6nig                2015-12-18  799  			robj=
->allowed_domains |=3D AMDGPU_GEM_DOMAIN_GTT;
1ea863fd736eed Christian K=C3=B6nig                2015-12-18  800  =

e1eb899b45781b Christian K=C3=B6nig                2017-08-25  801  		if (r=
obj->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
e1eb899b45781b Christian K=C3=B6nig                2017-08-25  802  			amdg=
pu_vm_bo_invalidate(adev, robj, true);
e1eb899b45781b Christian K=C3=B6nig                2017-08-25  803  =

4c28fb0b27ad58 Christian K=C3=B6nig                2015-08-28  804  		amdgp=
u_bo_unreserve(robj);
d38ceaf99ed015 Alex Deucher                   2015-04-20  805  		break;
d38ceaf99ed015 Alex Deucher                   2015-04-20  806  	default:
4c28fb0b27ad58 Christian K=C3=B6nig                2015-08-28  807  		amdgp=
u_bo_unreserve(robj);
d38ceaf99ed015 Alex Deucher                   2015-04-20  808  		r =3D -EIN=
VAL;
d38ceaf99ed015 Alex Deucher                   2015-04-20  809  	}
d38ceaf99ed015 Alex Deucher                   2015-04-20  810  =

d38ceaf99ed015 Alex Deucher                   2015-04-20  811  out:
e07ddb0ce7cde6 Emil Velikov                   2020-05-15  812  	drm_gem_obj=
ect_put(gobj);
d38ceaf99ed015 Alex Deucher                   2015-04-20  813  	return r;
d38ceaf99ed015 Alex Deucher                   2015-04-20  814  }
d38ceaf99ed015 Alex Deucher                   2015-04-20  815  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1231949070484240303==--

