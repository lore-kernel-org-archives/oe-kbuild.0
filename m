Content-Type: multipart/mixed; boundary="===============8426787605672953203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/renesas/rcar_jpu.c:1551:17: warning: Value stored to 'error' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 22 Apr 2022 18:47:39 +0800
Message-ID: <202204221807.dku4vRrW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8426787605672953203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d569e86915b7f2f9795588591c8d5ea0b66481cb
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Ren=
esas drivers on a separate dir
date:   6 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220418 (https://download.01.org/0day-ci/archi=
ve/20220422/202204221807.dku4vRrW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ef9460=
9d6ebe981767788e6877b0b3b731d425af)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/gpu/drm/drm_syncobj.c:788:9: note: Calling 'drm_syncobj_create_a=
s_handle'
           return drm_syncobj_create_as_handle(file_private,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:563:8: note: Calling 'drm_syncobj_create'
           ret =3D drm_syncobj_create(&syncobj, flags, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:498:6: note: Assuming 'syncobj' is non-null
           if (!syncobj)
               ^~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:498:2: note: Taking false branch
           if (!syncobj)
           ^
   drivers/gpu/drm/drm_syncobj.c:503:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_init(&syncobj->lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/gpu/drm/drm_syncobj.c:505:6: note: Assuming the condition is fal=
se
           if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:505:2: note: Taking false branch
           if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
           ^
   drivers/gpu/drm/drm_syncobj.c:513:6: note: 'fence' is null
           if (fence)
               ^~~~~
   drivers/gpu/drm/drm_syncobj.c:513:2: note: Taking false branch
           if (fence)
           ^
   drivers/gpu/drm/drm_syncobj.c:563:8: note: Returning from 'drm_syncobj_c=
reate'
           ret =3D drm_syncobj_create(&syncobj, flags, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:564:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/drm_syncobj.c:564:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/drm_syncobj.c:567:8: note: Calling 'drm_syncobj_get_hand=
le'
           ret =3D drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:547:6: note: Assuming 'ret' is < 0
           if (ret < 0) {
               ^~~~~~~
   drivers/gpu/drm/drm_syncobj.c:547:2: note: Taking true branch
           if (ret < 0) {
           ^
   drivers/gpu/drm/drm_syncobj.c:548:3: note: Calling 'drm_syncobj_put'
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Calling 'kref_put'
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'drm_syncobj_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:475:2: note: Memory is released
           kfree(syncobj);
           ^~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Returning; memory was released
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:548:3: note: Returning; memory was release=
d via 1st parameter
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:567:8: note: Returning; memory was release=
d via 2nd parameter
           ret =3D drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:568:2: note: Use of memory after it is fre=
ed
           drm_syncobj_put(syncobj);
           ^               ~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/media/platform/renesas/rcar_jpu.c:1551:17: warning: Value stored=
 to 'error' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
                   unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_M=
ASK;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_jpu.c:1551:17: note: Value stored to=
 'error' during its initialization is never read
                   unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_M=
ASK;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/media/platform/sti/hva/hva-v4l2.c:230:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:230:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:231:25: warning: Value stored =
to 'stream' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:231:25: note: Value stored to =
'stream' during its initialization is never read
           struct hva_streaminfo *stream =3D &ctx->streaminfo;
                                  ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:232:24: warning: Value stored =
to 'frame' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:232:24: note: Value stored to =
'frame' during its initialization is never read
           struct hva_frameinfo *frame =3D &ctx->frameinfo;
                                 ^~~~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/sti/hva/hva-v4l2.c:339:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:339:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:403:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:403:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:453:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:453:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:483:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:483:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:557:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:557:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:620:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:620:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:695:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:695:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:866:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:866:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:876:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:876:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:914:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:914:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:936:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:936:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:1069:17: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   drivers/media/platform/sti/hva/hva-v4l2.c:1069:17: note: Value stored to=
 'dev' during its initialization is never read
           struct device *dev =3D ctx_to_dev(ctx);
                          ^~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/error +1551 drivers/media/platform/renesas/rcar_jpu.c

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1489  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1490  /*
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1491   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1492   * IRQ handler
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1493   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1494   */
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1495  static irqreturn_t jpu_irq_handler(int irq, void *dev_id)
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1496  {
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1497  	struct jpu *jpu =3D dev_id;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1498  	struct jpu_ctx *curr_ctx;
2d7007153f0c9b1 drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-2=
2  1499  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1500  	unsigned int int_status;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1501  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1502  	int_status =3D jpu_read(jpu, JINTS);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1503  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1504  	/* ...spurious interrupt */
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1505  	if (!((JINTS_TRANSF_COMPL | JINTS_PROCESS_COMPL | JINTS_ERR) &
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1506  	    int_status))
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1507  		return IRQ_NONE;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1508  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1509  	/* ...clear interrupts */
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1510  	jpu_write(jpu, ~(int_status & JINTS_MASK), JINTS);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1511  	if (int_status & (JINTS_ERR | JINTS_PROCESS_COMPL))
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1512  		jpu_write(jpu, JCCMD_JEND, JCCMD);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1513  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1514  	spin_lock(&jpu->lock);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1515  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1516  	if ((int_status & JINTS_PROCESS_COMPL) &&
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1517  	   !(int_status & JINTS_TRANSF_COMPL))
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1518  		goto handled;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1519  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1520  	curr_ctx =3D v4l2_m2m_get_curr_priv(jpu->m2m_dev);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1521  	if (!curr_ctx) {
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1522  		/* ...instance is not running */
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1523  		dev_err(jpu->dev, "no active context for m2m\n");
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1524  		goto handled;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1525  	}
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1526  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1527  	src_buf =3D v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1528  	dst_buf =3D v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1529  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1530  	if (int_status & JINTS_TRANSF_COMPL) {
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1531  		if (curr_ctx->encoder) {
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1532  			unsigned long payload_size =3D jpu_read(jpu, JCDTCU) << 16
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1533  						   | jpu_read(jpu, JCDTCM) << 8
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1534  						   | jpu_read(jpu, JCDTCD);
2d7007153f0c9b1 drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-2=
2  1535  			vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1536  				payload_size + JPU_JPEG_HDR_SIZE);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1537  		}
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1538  =

2d7007153f0c9b1 drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-2=
2  1539  		dst_buf->field =3D src_buf->field;
d6dd645eae76eeb drivers/media/platform/rcar_jpu.c Junghak Sung    2015-11-0=
3  1540  		dst_buf->vb2_buf.timestamp =3D src_buf->vb2_buf.timestamp;
2d7007153f0c9b1 drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-2=
2  1541  		if (src_buf->flags & V4L2_BUF_FLAG_TIMECODE)
2d7007153f0c9b1 drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-2=
2  1542  			dst_buf->timecode =3D src_buf->timecode;
2d7007153f0c9b1 drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-2=
2  1543  		dst_buf->flags =3D src_buf->flags &
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1544  			(V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_KEYFRAME |
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1545  			 V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME |
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1546  			 V4L2_BUF_FLAG_TSTAMP_SRC_MASK);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1547  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1548  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1549  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1550  	} else if (int_status & JINTS_ERR) {
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2 @1551  		unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_MASK;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1552  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1553  		dev_dbg(jpu->dev, "processing error: %#X: %s\n", error,
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1554  			error_to_text[error]);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1555  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1556  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1557  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1558  	}
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1559  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1560  	jpu->curr =3D NULL;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1561  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1562  	/* ...reset JPU after completion */
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1563  	jpu_write(jpu, JCCMD_SRST, JCCMD);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1564  	spin_unlock(&jpu->lock);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1565  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1566  	v4l2_m2m_job_finish(jpu->m2m_dev, curr_ctx->fh.m2m_ctx);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1567  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1568  	return IRQ_HANDLED;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1569  =

2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1570  handled:
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1571  	spin_unlock(&jpu->lock);
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1572  	return IRQ_HANDLED;
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1573  }
2c42cdbaec56a95 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-2=
2  1574  =


:::::: The code at line 1551 was first introduced by commit
:::::: 2c42cdbaec56a9565a2717b450506150c9c55103 [media] V4L2: platform: Add=
 Renesas R-Car JPEG codec driver

:::::: TO: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8426787605672953203==--

