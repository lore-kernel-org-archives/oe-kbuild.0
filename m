Content-Type: multipart/mixed; boundary="===============3222760724150176268=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/ttm/ttm_bo.c:553:35: warning: Uninitialized variable: evict_mem [uninitvar]
Date: Tue, 15 Feb 2022 19:22:23 +0800
Message-ID: <202202151740.Tt8mccWa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3222760724150176268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: 403797925768d9fa870f5b1ebcd20016b397083b drm/ttm: Fix multihop asse=
rt on eviction.
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/ttm/ttm_bo.c:553:35: warning: Uninitialized variable: ev=
ict_mem [uninitvar]
    ret =3D ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
                                     ^

vim +553 drivers/gpu/drm/ttm/ttm_bo.c

403797925768d9 Andrey Grodzovsky 2021-06-22  512  =

83876c1bed8c91 Christian K=C3=B6nig   2017-04-12  513  static int ttm_bo_ev=
ict(struct ttm_buffer_object *bo,
83876c1bed8c91 Christian K=C3=B6nig   2017-04-12  514  			struct ttm_operat=
ion_ctx *ctx)
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  515  {
8af8a109b34fa8 Christian K=C3=B6nig   2020-10-01  516  	struct ttm_device *=
bdev =3D bo->bdev;
bfa3357ef9abc9 Christian K=C3=B6nig   2021-04-15  517  	struct ttm_resource=
 *evict_mem;
ca262a9998d461 Jerome Glisse     2009-12-08  518  	struct ttm_placement pla=
cement;
ebdf565169af00 Dave Airlie       2020-10-29  519  	struct ttm_place hop;
ca262a9998d461 Jerome Glisse     2009-12-08  520  	int ret =3D 0;
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  521  =

ebdf565169af00 Dave Airlie       2020-10-29  522  	memset(&hop, 0, sizeof(h=
op));
ebdf565169af00 Dave Airlie       2020-10-29  523  =

52791eeec1d9f4 Christian K=C3=B6nig   2019-08-11  524  	dma_resv_assert_hel=
d(bo->base.resv);
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  525  =

5d95109815493e Christian K=C3=B6nig   2018-02-20  526  	placement.num_place=
ment =3D 0;
5d95109815493e Christian K=C3=B6nig   2018-02-20  527  	placement.num_busy_=
placement =3D 0;
8af8a109b34fa8 Christian K=C3=B6nig   2020-10-01  528  	bdev->funcs->evict_=
flags(bo, &placement);
5d95109815493e Christian K=C3=B6nig   2018-02-20  529  =

d59bc6324208e4 Christian K=C3=B6nig   2020-07-23  530  	if (!placement.num_=
placement && !placement.num_busy_placement) {
a3be8cd70fec2a Thomas Hellstr=C3=B6m  2021-06-02  531  		ret =3D ttm_bo_wai=
t(bo, true, false);
a3be8cd70fec2a Thomas Hellstr=C3=B6m  2021-06-02  532  		if (ret)
a3be8cd70fec2a Thomas Hellstr=C3=B6m  2021-06-02  533  			return ret;
d59bc6324208e4 Christian K=C3=B6nig   2020-07-23  534  =

a3be8cd70fec2a Thomas Hellstr=C3=B6m  2021-06-02  535  		/*
a3be8cd70fec2a Thomas Hellstr=C3=B6m  2021-06-02  536  		 * Since we've alr=
eady synced, this frees backing store
a3be8cd70fec2a Thomas Hellstr=C3=B6m  2021-06-02  537  		 * immediately.
a3be8cd70fec2a Thomas Hellstr=C3=B6m  2021-06-02  538  		 */
a3be8cd70fec2a Thomas Hellstr=C3=B6m  2021-06-02  539  		return ttm_bo_pipe=
line_gutting(bo);
d59bc6324208e4 Christian K=C3=B6nig   2020-07-23  540  	}
5d95109815493e Christian K=C3=B6nig   2018-02-20  541  =

83876c1bed8c91 Christian K=C3=B6nig   2017-04-12  542  	ret =3D ttm_bo_mem_=
space(bo, &placement, &evict_mem, ctx);
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  543  	if (ret) {
fb53f8621a3fab Jerome Glisse     2009-12-09  544  		if (ret !=3D -ERESTARTS=
YS) {
25d0479a592556 Joe Perches       2012-03-16  545  			pr_err("Failed to find=
 memory space for buffer 0x%p eviction\n",
25d0479a592556 Joe Perches       2012-03-16  546  			       bo);
fb53f8621a3fab Jerome Glisse     2009-12-09  547  			ttm_bo_mem_space_debug=
(bo, &placement);
fb53f8621a3fab Jerome Glisse     2009-12-09  548  		}
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  549  		goto out;
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  550  	}
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  551  =

403797925768d9 Andrey Grodzovsky 2021-06-22  552  bounce:
bfa3357ef9abc9 Christian K=C3=B6nig   2021-04-15 @553  	ret =3D ttm_bo_hand=
le_move_mem(bo, evict_mem, true, ctx, &hop);
403797925768d9 Andrey Grodzovsky 2021-06-22  554  	if (ret =3D=3D -EMULTIHO=
P) {
403797925768d9 Andrey Grodzovsky 2021-06-22  555  		ret =3D ttm_bo_bounce_t=
emp_buffer(bo, &evict_mem, ctx, &hop);
403797925768d9 Andrey Grodzovsky 2021-06-22  556  		if (ret) {
25d0479a592556 Joe Perches       2012-03-16  557  			pr_err("Buffer evictio=
n failed\n");
b2458726b38cb6 Christian K=C3=B6nig   2020-08-03  558  			ttm_resource_free=
(bo, &evict_mem);
403797925768d9 Andrey Grodzovsky 2021-06-22  559  			goto out;
403797925768d9 Andrey Grodzovsky 2021-06-22  560  		}
403797925768d9 Andrey Grodzovsky 2021-06-22  561  		/* try and move to fina=
l place now. */
403797925768d9 Andrey Grodzovsky 2021-06-22  562  		goto bounce;
ca262a9998d461 Jerome Glisse     2009-12-08  563  	}
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  564  out:
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  565  	return ret;
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  566  }
ba4e7d973dd09b Thomas Hellstrom  2009-06-10  567  =


:::::: The code at line 553 was first introduced by commit
:::::: bfa3357ef9abc9d56a2910222d2deeb9f15c91ff drm/ttm: allocate resource =
object instead of embedding it v2

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Christian K=C3=B6nig <christian.koenig@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3222760724150176268==--

