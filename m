Content-Type: multipart/mixed; boundary="===============5999044103630011937=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/samsung/exynos4-is/fimc-core.c:803:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 04 May 2022 12:57:04 +0800
Message-ID: <202205041259.KXqibzyp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5999044103630011937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef8e4d3c2ab1f47f63b6c7e578266b7e5cc9cd1b
commit: 238c84f71120f41c45301359902a912a19370f3d media: platform: rename ex=
ynos4-is/ to samsung/exynos4-is/
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220504/202205041259.KXqibzyp-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D238c84f71120f41c45301359902a912a19370f3d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 238c84f71120f41c45301359902a912a19370f3d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:3: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
     ^
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:262:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/hid/hid-picolcd_fb.c:235:6: note: Assuming field 'ready' is not =
equal to 0
           if (!fbdata->ready && fbdata->picolcd)
               ^~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:235:21: note: Left side of '&&' is false
           if (!fbdata->ready && fbdata->picolcd)
                              ^
   drivers/hid/hid-picolcd_fb.c:247:2: note: Loop condition is true.  Enter=
ing loop body
           for (chip =3D 0; chip < 4; chip++)
           ^
   drivers/hid/hid-picolcd_fb.c:248:3: note: Loop condition is true.  Enter=
ing loop body
                   for (tile =3D 0; tile < 8; tile++) {
                   ^
   drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is 0
                           if (!fbdata->force && !picolcd_fb_update_tile(
                               ^~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
   drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_update_ti=
le'
                           if (!fbdata->force && !picolcd_fb_update_tile(
                                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is not equal to=
 1
           if (bpp =3D=3D 1) {
               ^~~~~~~~
   drivers/hid/hid-picolcd_fb.c:148:2: note: Taking false branch
           if (bpp =3D=3D 1) {
           ^
   drivers/hid/hid-picolcd_fb.c:156:13: note: Assuming 'bpp' is equal to 8
           } else if (bpp =3D=3D 8) {
                      ^~~~~~~~
   drivers/hid/hid-picolcd_fb.c:156:9: note: Taking true branch
           } else if (bpp =3D=3D 8) {
                  ^
   drivers/hid/hid-picolcd_fb.c:157:3: note: Loop condition is true.  Enter=
ing loop body
                   for (b =3D 7; b >=3D 0; b--) {
                   ^
   drivers/hid/hid-picolcd_fb.c:159:9: note: The value 0 is assigned to 'i'
                           for (i =3D 0; i < 64; i++) {
                                ^~~~~
   drivers/hid/hid-picolcd_fb.c:159:4: note: Loop condition is true.  Enter=
ing loop body
                           for (i =3D 0; i < 64; i++) {
                           ^
   drivers/hid/hid-picolcd_fb.c:160:14: note: The left expression of the co=
mpound assignment is an uninitialized value. The computed value will also b=
e garbage
                                   tdata[i] <<=3D 1;
                                   ~~~~~~~~ ^
   2 warnings generated.
>> drivers/media/platform/samsung/exynos4-is/fimc-core.c:803:4: warning: Va=
lue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D PTR_ERR(fimc->clock[i]);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-core.c:803:4: note: Value=
 stored to 'ret' is never read
                           ret =3D PTR_ERR(fimc->clock[i]);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:467:20: warning: Di=
vision by zero [clang-analyzer-core.DivideZero]
                                 halign, 64/(ALIGN(depth, 8)));
                                           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:493:8: note: Callin=
g 'fimc_m2m_try_selection'
           ret =3D fimc_m2m_try_selection(ctx, s);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:435:6: note: Assumi=
ng field 'top' is >=3D 0
           if (s->r.top < 0 || s->r.left < 0) {
               ^~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:435:6: note: Left s=
ide of '||' is false
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:435:22: note: Assum=
ing field 'left' is >=3D 0
           if (s->r.top < 0 || s->r.left < 0) {
                               ^~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:435:2: note: Taking=
 false branch
           if (s->r.top < 0 || s->r.left < 0) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:440:6: note: Assumi=
ng field 'type' is equal to V4L2_BUF_TYPE_VIDEO_CAPTURE
           if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:440:2: note: Taking=
 true branch
           if (s->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:442:7: note: Assumi=
ng field 'target' is equal to V4L2_SEL_TGT_COMPOSE
                   if (s->target !=3D V4L2_SEL_TGT_COMPOSE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:442:3: note: Taking=
 false branch
                   if (s->target !=3D V4L2_SEL_TGT_COMPOSE)
                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:452:13: note: '?' c=
ondition is false
           min_size =3D (f =3D=3D &ctx->s_frame) ?
                      ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:456:6: note: Assumi=
ng field 'min_vsize_align' is not equal to 1
           if (fimc->variant->min_vsize_align =3D=3D 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:456:2: note: Taking=
 false branch
           if (fimc->variant->min_vsize_align =3D=3D 1)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:461:14: note: Assum=
ing 'i' is >=3D field 'memplanes'
           for (i =3D 0; i < f->fmt->memplanes; i++)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:461:2: note: Loop c=
ondition is false. Execution continues on line 464
           for (i =3D 0; i < f->fmt->memplanes; i++)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-m2m.c:467:20: note: Divis=
ion by zero
                                 halign, 64/(ALIGN(depth, 8)));
                                         ~~^~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
>> drivers/media/platform/samsung/exynos4-is/fimc-capture.c:670:16: warning=
: Division by zero [clang-analyzer-core.DivideZero]
                   align_sz =3D 64/ALIGN(depth, 8);
                                ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1643:6: note: A=
ssuming field 'pad' is not equal to FIMC_SD_PAD_SOURCE
           if (sel->pad =3D=3D FIMC_SD_PAD_SOURCE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1643:2: note: T=
aking false branch
           if (sel->pad =3D=3D FIMC_SD_PAD_SOURCE)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1647:2: note: C=
alling 'fimc_capture_try_selection'
           fimc_capture_try_selection(ctx, r, V4L2_SEL_TGT_CROP);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:643:16: note: A=
ssuming field 'rotation' is equal to 90
           bool rotate =3D ctx->rotation =3D=3D 90 || ctx->rotation =3D=3D =
270;
                         ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:643:36: note: L=
eft side of '||' is true
           bool rotate =3D ctx->rotation =3D=3D 90 || ctx->rotation =3D=3D =
270;
                                             ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:653:6: note: As=
suming the condition is true
           if (fimc_fmt_is_user_defined(ctx->d_frame.fmt->color)) {
               ^
   drivers/media/platform/samsung/exynos4-is/fimc-core.h:112:39: note: expa=
nded from macro 'fimc_fmt_is_user_defined'
   #define fimc_fmt_is_user_defined(x) (!!((x) & 0x180))
                                         ^~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:653:2: note: Ta=
king false branch
           if (fimc_fmt_is_user_defined(ctx->d_frame.fmt->color)) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:659:6: note: 't=
arget' is not equal to V4L2_SEL_TGT_COMPOSE
           if (target =3D=3D V4L2_SEL_TGT_COMPOSE) {
               ^~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:659:2: note: Ta=
king false branch
           if (target =3D=3D V4L2_SEL_TGT_COMPOSE) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:670:16: note: D=
ivision by zero
                   align_sz =3D 64/ALIGN(depth, 8);
                              ~~^~~~~~~~~~~~~~~~
>> drivers/media/platform/samsung/exynos4-is/fimc-capture.c:825:3: warning:=
 Value stored to 'ffmt' is never read [clang-analyzer-deadcode.DeadStores]
                   ffmt =3D fimc_capture_try_format(ctx, &tfmt->width, &tfm=
t->height,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:825:3: note: Va=
lue stored to 'ffmt' is never read
                   ffmt =3D fimc_capture_try_format(ctx, &tfmt->width, &tfm=
t->height,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>> drivers/media/platform/samsung/exynos4-is/fimc-capture.c:862:22: warning=
: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized=
.Assign]
                   fd.entry[i].length =3D plane_fmt[i].sizeimage;
                                      ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1184:2: note: T=
aking false branch
           if (fimc_capture_active(fimc))
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1188:6: note: A=
ssuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1188:2: note: T=
aking false branch
           if (ret < 0)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1192:6: note: A=
ssuming 'sd' is non-null
           if (sd)
               ^~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1192:2: note: T=
aking true branch
           if (sd)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1195:6: note: A=
ssuming 'si' is not equal to NULL
           if (si =3D=3D NULL) {
               ^~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1195:2: note: T=
aking false branch
           if (si =3D=3D NULL) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1205:6: note: A=
ssuming the condition is false
           if (vc->input =3D=3D GRP_ID_FIMC_IS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1205:2: note: T=
aking false branch
           if (vc->input =3D=3D GRP_ID_FIMC_IS)
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1208:6: note: A=
ssuming field 'user_subdev_api' is true
           if (vc->user_subdev_api) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1208:2: note: T=
aking true branch
           if (vc->user_subdev_api) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1209:9: note: C=
alling 'fimc_pipeline_validate'
                   ret =3D fimc_pipeline_validate(fimc);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1105:2: note: L=
oop condition is true.  Entering loop body
           while (1) {
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1113:15: note: =
Assuming 'i' is < field 'num_pads'
                   for (i =3D 0; i < sd->entity.num_pads; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1113:3: note: L=
oop condition is true.  Entering loop body
                   for (i =3D 0; i < sd->entity.num_pads; i++) {
                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1116:8: note: A=
ssuming the condition is true
                           if (p->flags & MEDIA_PAD_FL_SINK) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1116:4: note: T=
aking true branch
                           if (p->flags & MEDIA_PAD_FL_SINK) {
                           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1119:9: note: A=
ssuming 'src_pad' is non-null
                                   if (src_pad)
                                       ^~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1119:5: note: T=
aking true branch
                                   if (src_pad)
                                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1120:6: note:  =
Execution continues on line 1124
                                           break;
                                           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1124:8: note: '=
src_pad' is non-null
                   if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->en=
tity))
                        ^~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1124:7: note: L=
eft side of '||' is false
                   if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->en=
tity))
                       ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1124:3: note: T=
aking false branch
                   if (!src_pad || !is_media_entity_v4l2_subdev(src_pad->en=
tity))
                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1128:3: note: T=
aking true branch
                   if (sd =3D=3D &vc->subdev) {
                   ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1132:27: note: =
Assuming field 'fmt' is non-null
                           sink_fmt.format.code =3D ff->fmt ? ff->fmt->mbus=
_code : 0;
                                                  ^~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1132:27: note: =
'?' condition is true
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1142:8: note: '=
__me_sd_ent' is non-null
                   sd =3D media_entity_to_v4l2_subdev(src_pad->entity);
                        ^
   include/media/v4l2-subdev.h:932:2: note: expanded from macro 'media_enti=
ty_to_v4l2_subdev'
           __me_sd_ent ?                                                   \
           ^~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1142:8: note: '=
?' condition is true
                   sd =3D media_entity_to_v4l2_subdev(src_pad->entity);
                        ^
   include/media/v4l2-subdev.h:932:2: note: expanded from macro 'media_enti=
ty_to_v4l2_subdev'
           __me_sd_ent ?                                                   \
           ^
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1145:9: note: '=
__sd' is non-null
                   ret =3D v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fm=
t);
                         ^
   include/media/v4l2-subdev.h:1170:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                        ^~~~
   drivers/media/platform/samsung/exynos4-is/fimc-capture.c:1145:9: note: T=
aking false branch
                   ret =3D v4l2_subdev_call(sd, pad, get_fmt, NULL, &src_fm=
t);
                         ^
   include/media/v4l2-subdev.h:1170:3: note: expanded from macro 'v4l2_subd=
ev_call'
--
   drivers/of/unittest.c:2489:22: warning: Value stored to 'np' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   drivers/of/unittest.c:2489:22: note: Value stored to 'np' during its ini=
tialization is never read
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   drivers/of/unittest.c:2530:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/of/unittest.c:2530:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/of/unittest.c:2531:22: warning: Value stored to 'np' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *np =3D client->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:2531:22: note: Value stored to 'np' during its ini=
tialization is never read
           struct device_node *np =3D client->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:2607:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/of/unittest.c:2607:17: note: Value stored to 'dev' during its in=
itialization is never read
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/of/unittest.c:2608:22: warning: Value stored to 'np' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *np =3D client->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:2608:22: note: Value stored to 'np' during its ini=
tialization is never read
           struct device_node *np =3D client->dev.of_node;
                               ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:3133:29: warning: Access to field 'properties' res=
ults in a dereference of an undefined pointer value (loaded from variable '=
overlay_base_symbols') [clang-analyzer-core.NullDereference]
                   for_each_property_of_node(overlay_base_symbols, prop) {
                                             ^
   include/linux/of.h:359:12: note: expanded from macro 'for_each_property_=
of_node'
           for (pp =3D dn->properties; pp !=3D NULL; pp =3D pp->next)
                     ^~
   drivers/of/unittest.c:3042:2: note: 'overlay_base_symbols' declared with=
out an initial value
           struct device_node *overlay_base_symbols;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:3047:6: note: Assuming 'overlay_base_root' is non-=
null
           if (!overlay_base_root) {
               ^~~~~~~~~~~~~~~~~~
   drivers/of/unittest.c:3047:2: note: Taking false branch
           if (!overlay_base_root) {
           ^
   drivers/of/unittest.c:3071:2: note: Loop condition is false. Execution c=
ontinues on line 3080
           for (np =3D overlay_base_root->child; np; np =3D np->sibling) {
           ^
   drivers/of/unittest.c:3081:6: note: Assuming 'of_symbols' is non-null
           if (of_symbols) {
               ^~~~~~~~~~
   drivers/of/unittest.c:3081:2: note: Taking true branch
           if (of_symbols) {
           ^
   drivers/of/unittest.c:3084:3: note: Loop condition is false. Execution c=
ontinues on line 3094
                   for (np =3D overlay_base_root->child; np; np =3D np->sib=
ling) {
                   ^
   drivers/of/unittest.c:3094:44: note: Assuming 'np' is equal to null
           for_each_child_of_node(overlay_base_root, np) {
                                                     ^
   include/linux/of.h:1368:48: note: expanded from macro 'for_each_child_of=
_node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
                                                         ^~~~~~~~~~~~~
   drivers/of/unittest.c:3094:2: note: Loop condition is false. Execution c=
ontinues on line 3115
           for_each_child_of_node(overlay_base_root, np) {
           ^
   include/linux/of.h:1368:2: note: expanded from macro 'for_each_child_of_=
node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
           ^
   drivers/of/unittest.c:3115:2: note: Loop condition is false. Execution c=
ontinues on line 3118
           for (np =3D overlay_base_root->child; np; np =3D np->sibling)
           ^
   drivers/of/unittest.c:3120:2: note: Loop condition is false. Execution c=
ontinues on line 3123
           for (last_sibling =3D np =3D of_root->child; np; np =3D np->sibl=
ing)
           ^
   drivers/of/unittest.c:3123:6: note: 'last_sibling' is null
           if (last_sibling)
               ^~~~~~~~~~~~
   drivers/of/unittest.c:3123:2: note: Taking false branch
           if (last_sibling)
           ^
   drivers/of/unittest.c:3128:2: note: Loop condition is false. Execution c=
ontinues on line 3131
           for_each_of_allnodes_from(overlay_base_root, np)
           ^
   include/linux/of.h:265:2: note: expanded from macro 'for_each_of_allnode=
s_from'
           for (dn =3D __of_find_all_nodes(from); dn; dn =3D __of_find_all_=
nodes(dn))
           ^
   drivers/of/unittest.c:3131:6: note: 'of_symbols' is non-null
           if (of_symbols) {
               ^~~~~~~~~~
   drivers/of/unittest.c:3131:2: note: Taking true branch
           if (of_symbols) {
           ^
   drivers/of/unittest.c:3133:29: note: Access to field 'properties' result=
s in a dereference of an undefined pointer value (loaded from variable 'ove=
rlay_base_symbols')
                   for_each_property_of_node(overlay_base_symbols, prop) {
                                             ^
   include/linux/of.h:359:12: note: expanded from macro 'for_each_property_=
of_node'
           for (pp =3D dn->properties; pp !=3D NULL; pp =3D pp->next)
                     ^~
   5 warnings generated.
>> drivers/media/platform/samsung/exynos4-is/media-dev.c:1018:3: warning: V=
alue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1018:3: note: Valu=
e stored to 'ret' is never read
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1031:3: warning: V=
alue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1031:3: note: Valu=
e stored to 'ret' is never read
                   ret =3D __fimc_md_create_fimc_sink_links(fmd, source, se=
nsor,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1541:6: note: Assu=
ming 'fmd' is non-null
           if (!fmd)
               ^~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1541:2: note: Taki=
ng false branch
           if (!fmd)
           ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1551:2: note: Call=
ing 'fimc_md_pipelines_free'
           fimc_md_pipelines_free(fmd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:389:2: note: Loop =
condition is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:394:3: note: Memor=
y is released
                   kfree(p);
                   ^~~~~~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:389:2: note: Loop =
condition is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:393:3: note: Calli=
ng 'list_del'
                   list_del(&p->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1541:6: note: Assu=
ming 'fmd' is non-null
           if (!fmd)
               ^~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1541:2: note: Taki=
ng false branch
           if (!fmd)
           ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:1551:2: note: Call=
ing 'fimc_md_pipelines_free'
           fimc_md_pipelines_free(fmd);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:389:2: note: Loop =
condition is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:394:3: note: Memor=
y is released
                   kfree(p);
                   ^~~~~~~~
   drivers/media/platform/samsung/exynos4-is/media-dev.c:389:2: note: Loop =
condition is true.  Entering loop body
           while (!list_empty(&fmd->pipelines)) {
           ^
   drivers/media/platform/samsung/exynos4-is/media-dev.c:393:3: note: Calli=
ng 'list_del'
                   list_del(&p->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/dac/ad5770r.c:133:8: warning: Excessive padding in 'struct a=
d5770r_state' (54 padding bytes, where 22 is optimal). =

   Optimal fields order: =

   transf_buf, =

   internal_ref, =

   external_res, =

   spi, =

   regmap, =

   vref_reg, =

   gpio_reset, =

   vref, =

   ch_pwr_down, =

   output_mode, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5770r_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/dac/ad5770r.c:133:8: note: Excessive padding in 'struct ad57=
70r_state' (54 padding bytes, where 22 is optimal). Optimal fields order: t=
ransf_buf, internal_ref, external_res, spi, regmap, vref_reg, gpio_reset, v=
ref, ch_pwr_down, output_mode, consider reordering the fields or adding exp=
licit padding members
   struct ad5770r_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/dac/ad5791.c:84:8: warning: Excessive padding in 'struct ad5=
791_state' (53 padding bytes, where 21 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   reg_vdd, =


vim +/ret +803 drivers/media/platform/samsung/exynos4-is/fimc-core.c

5fd8f7388c9a860 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2010-08-03  792  =

5fd8f7388c9a860 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2010-08-03  793  static int fimc_clk_get(struct fimc_dev *fimc)
5fd8f7388c9a860 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2010-08-03  794  {
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  795  	int i, ret;
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  796  =

b71b56b264ae27f drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawro=
cki 2013-01-29  797  	for (i =3D 0; i < MAX_FIMC_CLOCKS; i++)
b71b56b264ae27f drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawro=
cki 2013-01-29  798  		fimc->clock[i] =3D ERR_PTR(-EINVAL);
b71b56b264ae27f drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawro=
cki 2013-01-29  799  =

6ec0163b7952ad0 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-03-17  800  	for (i =3D 0; i < MAX_FIMC_CLOCKS; i++) {
a25be18dfb6e1b1 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2010-12-27  801  		fimc->clock[i] =3D clk_get(&fimc->pdev->dev, fimc_cl=
ocks[i]);
b71b56b264ae27f drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawro=
cki 2013-01-29  802  		if (IS_ERR(fimc->clock[i])) {
b71b56b264ae27f drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawro=
cki 2013-01-29 @803  			ret =3D PTR_ERR(fimc->clock[i]);
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  804  			goto err;
b71b56b264ae27f drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawro=
cki 2013-01-29  805  		}
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  806  		ret =3D clk_prepare(fimc->clock[i]);
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  807  		if (ret < 0) {
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  808  			clk_put(fimc->clock[i]);
b71b56b264ae27f drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawro=
cki 2013-01-29  809  			fimc->clock[i] =3D ERR_PTR(-EINVAL);
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  810  			goto err;
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  811  		}
5fd8f7388c9a860 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2010-08-03  812  	}
e9e21083ef9361f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2011-09-02  813  	return 0;
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  814  err:
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  815  	fimc_clk_put(fimc);
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  816  	dev_err(&fimc->pdev->dev, "failed to get clock: %s\n",
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  817  		fimc_clocks[i]);
bd7d8888e99d67f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2012-01-30  818  	return -ENXIO;
e9e21083ef9361f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2011-09-02  819  }
e9e21083ef9361f drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawro=
cki 2011-09-02  820  =


:::::: The code at line 803 was first introduced by commit
:::::: b71b56b264ae27f32784973d15bfdfbc7df6d579 [media] s5p-fimc: Check ret=
urn value of clk_enable/clk_set_rate

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5999044103630011937==--

