Content-Type: multipart/mixed; boundary="===============5737081577701636000=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-drm-misc:drm-misc-next 4/4] drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:766 amdgpu_gem_op_ioctl() warn: should 'robj->tbo.page_alignment << 12' be a 64 bit type?
Date: Sat, 24 Apr 2021 07:05:54 +0800
Message-ID: <202104240741.ZourXGr1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5737081577701636000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Matthew Auld <matthew.auld@intel.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   c777dc9e793342ecdfc95045d2127a3ea32791a0
commit: c777dc9e793342ecdfc95045d2127a3ea32791a0 [4/4] drm/ttm: move the pa=
ge_alignment into the BO v2
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: ia64-randconfig-m031-20210423 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:766 amdgpu_gem_op_ioctl() warn: sho=
uld 'robj->tbo.page_alignment << 12' be a 64 bit type?

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

--===============5737081577701636000==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
p+gjnHgrCoxlo5ABTwDs3dfnhnQBAA==
--===============5737081577701636000==--

