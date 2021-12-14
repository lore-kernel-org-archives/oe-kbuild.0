Content-Type: multipart/mixed; boundary="===============1764116816049107898=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4045/6644] drivers/gpu/drm/radeon/radeon_kms.c:705 radeon_driver_open_kms() error: uninitialized symbol 'vm'.
Date: Wed, 15 Dec 2021 05:11:28 +0800
Message-ID: <202112150530.BpzlFLtI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1764116816049107898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Zhou Qingyang <zhou1615@umn.edu>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bcd5ddb85fad453da26afd5b3fca8ad931b5253d
commit: ab50cb9df8896b39aae65c537a30de2c79c19735 [4045/6644] drm/radeon/rad=
eon_kms: Fix a NULL pointer dereference in radeon_driver_open_kms()
:::::: branch date: 18 hours ago
:::::: commit date: 12 days ago
config: microblaze-randconfig-m031-20211214 (https://download.01.org/0day-c=
i/archive/20211215/202112150530.BpzlFLtI-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/radeon/radeon_kms.c:705 radeon_driver_open_kms() error: uni=
nitialized symbol 'vm'.
drivers/gpu/drm/radeon/radeon_kms.c:707 radeon_driver_open_kms() error: uni=
nitialized symbol 'fpriv'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/vm +705 drivers/gpu/drm/radeon/radeon_kms.c

771fe6b912fca5 Jerome Glisse   2009-06-05  638  =

f482a1419545de Alex Deucher    2012-07-17  639  /**
f482a1419545de Alex Deucher    2012-07-17  640   * radeon_driver_open_kms -=
 drm callback for open
f482a1419545de Alex Deucher    2012-07-17  641   *
f482a1419545de Alex Deucher    2012-07-17  642   * @dev: drm dev pointer
f482a1419545de Alex Deucher    2012-07-17  643   * @file_priv: drm file
f482a1419545de Alex Deucher    2012-07-17  644   *
f482a1419545de Alex Deucher    2012-07-17  645   * On device open, init vm =
on cayman+ (all asics).
f482a1419545de Alex Deucher    2012-07-17  646   * Returns 0 on success, er=
ror on failure.
f482a1419545de Alex Deucher    2012-07-17  647   */
771fe6b912fca5 Jerome Glisse   2009-06-05  648  int radeon_driver_open_kms(=
struct drm_device *dev, struct drm_file *file_priv)
771fe6b912fca5 Jerome Glisse   2009-06-05  649  {
721604a15b934f Jerome Glisse   2012-01-05  650  	struct radeon_device *rdev=
 =3D dev->dev_private;
ab50cb9df8896b Zhou Qingyang   2021-12-01  651  	struct radeon_fpriv *fpriv;
ab50cb9df8896b Zhou Qingyang   2021-12-01  652  	struct radeon_vm *vm;
10ebc0bc09344a Dave Airlie     2012-09-17  653  	int r;
721604a15b934f Jerome Glisse   2012-01-05  654  =

721604a15b934f Jerome Glisse   2012-01-05  655  	file_priv->driver_priv =3D=
 NULL;
721604a15b934f Jerome Glisse   2012-01-05  656  =

10ebc0bc09344a Dave Airlie     2012-09-17  657  	r =3D pm_runtime_get_sync(=
dev->dev);
9fb10671011143 Aditya Pakki    2020-06-13  658  	if (r < 0) {
9fb10671011143 Aditya Pakki    2020-06-13  659  		pm_runtime_put_autosuspen=
d(dev->dev);
10ebc0bc09344a Dave Airlie     2012-09-17  660  		return r;
9fb10671011143 Aditya Pakki    2020-06-13  661  	}
10ebc0bc09344a Dave Airlie     2012-09-17  662  =

721604a15b934f Jerome Glisse   2012-01-05  663  	/* new gpu have virtual ad=
dress space support */
721604a15b934f Jerome Glisse   2012-01-05  664  	if (rdev->family >=3D CHIP=
_CAYMAN) {
721604a15b934f Jerome Glisse   2012-01-05  665  =

721604a15b934f Jerome Glisse   2012-01-05  666  		fpriv =3D kzalloc(sizeof(=
*fpriv), GFP_KERNEL);
721604a15b934f Jerome Glisse   2012-01-05  667  		if (unlikely(!fpriv)) {
32c59dc14b7280 Alex Deucher    2016-08-31  668  			r =3D -ENOMEM;
32c59dc14b7280 Alex Deucher    2016-08-31  669  			goto out_suspend;
721604a15b934f Jerome Glisse   2012-01-05  670  		}
721604a15b934f Jerome Glisse   2012-01-05  671  =

544143f9e01a60 Alex Deucher    2015-01-28  672  		if (rdev->accel_working) {
cc9e67e3d7000c Christian K=C3=B6nig 2014-07-18  673  			vm =3D &fpriv->vm;
cc9e67e3d7000c Christian K=C3=B6nig 2014-07-18  674  			r =3D radeon_vm_ini=
t(rdev, vm);
ab50cb9df8896b Zhou Qingyang   2021-12-01  675  			if (r)
ab50cb9df8896b Zhou Qingyang   2021-12-01  676  				goto out_fpriv;
d72d43cfc5847c Christian K=C3=B6nig 2012-10-09  677  =

f1e3dc708aaadb Christian K=C3=B6nig 2014-02-20  678  			r =3D radeon_bo_res=
erve(rdev->ring_tmp_bo.bo, false);
ab50cb9df8896b Zhou Qingyang   2021-12-01  679  			if (r)
ab50cb9df8896b Zhou Qingyang   2021-12-01  680  				goto out_vm_fini;
f1e3dc708aaadb Christian K=C3=B6nig 2014-02-20  681  =

d72d43cfc5847c Christian K=C3=B6nig 2012-10-09  682  			/* map the ib pool =
buffer read only into
d72d43cfc5847c Christian K=C3=B6nig 2012-10-09  683  			 * virtual address =
space */
cc9e67e3d7000c Christian K=C3=B6nig 2014-07-18  684  			vm->ib_bo_va =3D ra=
deon_vm_bo_add(rdev, vm,
d72d43cfc5847c Christian K=C3=B6nig 2012-10-09  685  							rdev->ring_tmp_=
bo.bo);
ab50cb9df8896b Zhou Qingyang   2021-12-01  686  			if (!vm->ib_bo_va) {
ab50cb9df8896b Zhou Qingyang   2021-12-01  687  				r =3D -ENOMEM;
ab50cb9df8896b Zhou Qingyang   2021-12-01  688  				goto out_vm_fini;
ab50cb9df8896b Zhou Qingyang   2021-12-01  689  			}
ab50cb9df8896b Zhou Qingyang   2021-12-01  690  =

cc9e67e3d7000c Christian K=C3=B6nig 2014-07-18  691  			r =3D radeon_vm_bo_=
set_addr(rdev, vm->ib_bo_va,
cc9e67e3d7000c Christian K=C3=B6nig 2014-07-18  692  						  RADEON_VA_IB_O=
FFSET,
d72d43cfc5847c Christian K=C3=B6nig 2012-10-09  693  						  RADEON_VM_PAGE=
_READABLE |
d72d43cfc5847c Christian K=C3=B6nig 2012-10-09  694  						  RADEON_VM_PAGE=
_SNOOPED);
ab50cb9df8896b Zhou Qingyang   2021-12-01  695  			if (r)
ab50cb9df8896b Zhou Qingyang   2021-12-01  696  				goto out_vm_fini;
24f47acc78b0ab J=C3=A9r=C3=B4me Glisse   2014-05-07  697  		}
721604a15b934f Jerome Glisse   2012-01-05  698  		file_priv->driver_priv =
=3D fpriv;
721604a15b934f Jerome Glisse   2012-01-05  699  	}
10ebc0bc09344a Dave Airlie     2012-09-17  700  =

ab50cb9df8896b Zhou Qingyang   2021-12-01  701  	if (!r)
ab50cb9df8896b Zhou Qingyang   2021-12-01  702  		goto out_suspend;
ab50cb9df8896b Zhou Qingyang   2021-12-01  703  =

ab50cb9df8896b Zhou Qingyang   2021-12-01  704  out_vm_fini:
ab50cb9df8896b Zhou Qingyang   2021-12-01 @705  	radeon_vm_fini(rdev, vm);
ab50cb9df8896b Zhou Qingyang   2021-12-01  706  out_fpriv:
ab50cb9df8896b Zhou Qingyang   2021-12-01 @707  	kfree(fpriv);
32c59dc14b7280 Alex Deucher    2016-08-31  708  out_suspend:
10ebc0bc09344a Dave Airlie     2012-09-17  709  	pm_runtime_mark_last_busy(=
dev->dev);
10ebc0bc09344a Dave Airlie     2012-09-17  710  	pm_runtime_put_autosuspend=
(dev->dev);
32c59dc14b7280 Alex Deucher    2016-08-31  711  	return r;
771fe6b912fca5 Jerome Glisse   2009-06-05  712  }
771fe6b912fca5 Jerome Glisse   2009-06-05  713  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1764116816049107898==--

