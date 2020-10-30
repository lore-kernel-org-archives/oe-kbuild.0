Content-Type: multipart/mixed; boundary="===============1645256583257407607=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/ttm/ttm_bo.c:409:9: warning: Identical condition 'r', second condition is always false
Date: Fri, 30 Oct 2020 19:06:37 +0800
Message-ID: <202010301926.Srolp5Lt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1645256583257407607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: xinhui pan <xinhui.pan@amd.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   07e0887302450a62f51dba72df6afb5fabb23d1c
commit: 519c2de003b91becfef3d679f133b877adeb2840 drm/ttm: replace dma_resv =
object on deleted BOs v3
date:   9 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/ttm/ttm_bo.c:409:9: warning: Identical condition 'r', se=
cond condition is always false [identicalConditionAfterEarlyExit]
    return r;
           ^
   drivers/gpu/drm/ttm/ttm_bo.c:396:6: note: first condition
    if (r)
        ^
   drivers/gpu/drm/ttm/ttm_bo.c:409:9: note: second condition
    return r;
           ^

vim +/r +409 drivers/gpu/drm/ttm/ttm_bo.c

1df6a2ebd75067a Thomas Hellstrom 2010-09-30  384  =

841e763b40764a7 Christian K=C3=B6nig  2017-07-20  385  static int ttm_bo_in=
dividualize_resv(struct ttm_buffer_object *bo)
841e763b40764a7 Christian K=C3=B6nig  2017-07-20  386  {
841e763b40764a7 Christian K=C3=B6nig  2017-07-20  387  	int r;
841e763b40764a7 Christian K=C3=B6nig  2017-07-20  388  =

e532a135d7044b5 Gerd Hoffmann    2019-08-05  389  	if (bo->base.resv =3D=3D=
 &bo->base._resv)
841e763b40764a7 Christian K=C3=B6nig  2017-07-20  390  		return 0;
841e763b40764a7 Christian K=C3=B6nig  2017-07-20  391  =

52791eeec1d9f4a Christian K=C3=B6nig  2019-08-11  392  	BUG_ON(!dma_resv_tr=
ylock(&bo->base._resv));
841e763b40764a7 Christian K=C3=B6nig  2017-07-20  393  =

52791eeec1d9f4a Christian K=C3=B6nig  2019-08-11  394  	r =3D dma_resv_copy=
_fences(&bo->base._resv, bo->base.resv);
52791eeec1d9f4a Christian K=C3=B6nig  2019-08-11  395  	dma_resv_unlock(&bo=
->base._resv);
519c2de003b91be Christian K=C3=B6nig  2019-11-11  396  	if (r)
519c2de003b91be Christian K=C3=B6nig  2019-11-11  397  		return r;
519c2de003b91be Christian K=C3=B6nig  2019-11-11  398  =

519c2de003b91be Christian K=C3=B6nig  2019-11-11  399  	if (bo->type !=3D t=
tm_bo_type_sg) {
519c2de003b91be Christian K=C3=B6nig  2019-11-11  400  		/* This works beca=
use the BO is about to be destroyed and nobody
519c2de003b91be Christian K=C3=B6nig  2019-11-11  401  		 * reference it an=
y more. The only tricky case is the trylock on
519c2de003b91be Christian K=C3=B6nig  2019-11-11  402  		 * the resv object=
 while holding the lru_lock.
519c2de003b91be Christian K=C3=B6nig  2019-11-11  403  		 */
519c2de003b91be Christian K=C3=B6nig  2019-11-11  404  		spin_lock(&ttm_bo_=
glob.lru_lock);
519c2de003b91be Christian K=C3=B6nig  2019-11-11  405  		bo->base.resv =3D =
&bo->base._resv;
519c2de003b91be Christian K=C3=B6nig  2019-11-11  406  		spin_unlock(&ttm_b=
o_glob.lru_lock);
519c2de003b91be Christian K=C3=B6nig  2019-11-11  407  	}
841e763b40764a7 Christian K=C3=B6nig  2017-07-20  408  =

841e763b40764a7 Christian K=C3=B6nig  2017-07-20 @409  	return r;
841e763b40764a7 Christian K=C3=B6nig  2017-07-20  410  }
841e763b40764a7 Christian K=C3=B6nig  2017-07-20  411  =


:::::: The code at line 409 was first introduced by commit
:::::: 841e763b40764a7699ae07f4cb1921af62d6316d drm/ttm: individualize BO r=
eservation obj when they are freed

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1645256583257407607==--

