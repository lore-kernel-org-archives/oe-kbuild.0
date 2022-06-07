Content-Type: multipart/mixed; boundary="===============0859867538790100211=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/samsung/exynos4-is/fimc-core.c:803:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 07 Jun 2022 15:19:42 +0800
Message-ID: <202206071503.tVEuXA4c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0859867538790100211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/samsung/exynos4-is/fimc-core.c:803:4: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e71e60cd74df9386c3f684c54888f2367050b831
commit: 238c84f71120f41c45301359902a912a19370f3d media: platform: rename ex=
ynos4-is/ to samsung/exynos4-is/
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220605 (https://download.01.org/0day-ci/archi=
ve/20220607/202206071503.tVEuXA4c-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
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


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/adc/meson_saradc.c:1233:2: note: Taking false branch
           if (IS_ERR(priv->clkin))
           ^
   drivers/iio/adc/meson_saradc.c:1238:2: note: Taking false branch
           if (IS_ERR(priv->core_clk))
           ^
   drivers/iio/adc/meson_saradc.c:1243:2: note: Taking false branch
           if (IS_ERR(priv->adc_clk)) {
           ^
   drivers/iio/adc/meson_saradc.c:1252:2: note: Taking false branch
           if (IS_ERR(priv->adc_sel_clk)) {
           ^
   drivers/iio/adc/meson_saradc.c:1261:6: note: Assuming field 'adc_clk' is=
 null
           if (!priv->adc_clk) {
               ^~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1261:2: note: Taking true branch
           if (!priv->adc_clk) {
           ^
   drivers/iio/adc/meson_saradc.c:1263:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/iio/adc/meson_saradc.c:1263:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/iio/adc/meson_saradc.c:1268:2: note: Taking false branch
           if (IS_ERR(priv->vref))
           ^
   drivers/iio/adc/meson_saradc.c:1274:6: note: Assuming field 'temperature=
_trimming_bits' is not equal to 0
           if (priv->param->temperature_trimming_bits) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1274:2: note: Taking true branch
           if (priv->param->temperature_trimming_bits) {
           ^
   drivers/iio/adc/meson_saradc.c:1276:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/iio/adc/meson_saradc.c:1276:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/iio/adc/meson_saradc.c:1280:6: note: Assuming field 'temperature=
_sensor_calibrated' is true
           if (priv->temperature_sensor_calibrated) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1280:2: note: Taking true branch
           if (priv->temperature_sensor_calibrated) {
           ^
   drivers/iio/adc/meson_saradc.c:1291:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:1291:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:1295:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:1295:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:1298:8: note: Calling 'meson_sar_adc_cali=
b'
           ret =3D meson_sar_adc_calib(indio_dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1027:31: note: 'value0' declared without =
an initial value
           int ret, nominal0, nominal1, value0, value1;
                                        ^~~~~~
   drivers/iio/adc/meson_saradc.c:1035:8: note: Calling 'meson_sar_adc_get_=
sample'
           ret =3D meson_sar_adc_get_sample(indio_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:555:6: note: Assuming field 'type' is not=
 equal to IIO_TEMP
           if (chan->type =3D=3D IIO_TEMP && !priv->temperature_sensor_cali=
brated)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:555:29: note: Left side of '&&' is false
           if (chan->type =3D=3D IIO_TEMP && !priv->temperature_sensor_cali=
brated)
                                      ^
   drivers/iio/adc/meson_saradc.c:559:6: note: Assuming 'ret' is not equal =
to 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:559:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:560:3: note: Returning without writing to=
 '*val'
                   return ret;
                   ^
   drivers/iio/adc/meson_saradc.c:1035:8: note: Returning from 'meson_sar_a=
dc_get_sample'
           ret =3D meson_sar_adc_get_sample(indio_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1038:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/adc/meson_saradc.c:1038:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/adc/meson_saradc.c:1046:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/adc/meson_saradc.c:1046:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/adc/meson_saradc.c:1049:13: note: The right operand of '<=3D=
' is a garbage value
           if (value1 <=3D value0) {
                      ^  ~~~~~~
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
                   if (rdev && test_bit(WriteMostly, &rdev->flags))
                            ^
   drivers/md/raid1.c:1420:7: note: 'rdev' is null
                   if (rdev && unlikely(test_bit(Blocked, &rdev->flags))) {
                       ^~~~
   drivers/md/raid1.c:1420:12: note: Left side of '&&' is false
                   if (rdev && unlikely(test_bit(Blocked, &rdev->flags))) {
                            ^
   drivers/md/raid1.c:1426:8: note: 'rdev' is null
                   if (!rdev || test_bit(Faulty, &rdev->flags)) {
                        ^~~~
   drivers/md/raid1.c:1426:13: note: Left side of '||' is true
                   if (!rdev || test_bit(Faulty, &rdev->flags)) {
                             ^
   drivers/md/raid1.c:1427:8: note: Assuming 'i' is < field 'raid_disks'
                           if (i < conf->raid_disks)
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1427:4: note: Taking true branch
                           if (i < conf->raid_disks)
                           ^
   drivers/md/raid1.c:1428:5: note: '?' condition is true
                                   set_bit(R1BIO_Degraded, &r1_bio->state);
                                   ^
   arch/arm/include/asm/bitops.h:189:25: note: expanded from macro 'set_bit'
   #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   drivers/md/raid1.c:1429:4: note:  Execution continues on line 1409
                           continue;
                           ^
   drivers/md/raid1.c:1409:15: note: Assuming 'i' is >=3D 'disks'
           for (i =3D 0;  i < disks; i++) {
                        ^~~~~~~~~
   drivers/md/raid1.c:1409:2: note: Loop condition is false. Execution cont=
inues on line 1476
           for (i =3D 0;  i < disks; i++) {
           ^
   drivers/md/raid1.c:1478:2: note: Taking false branch
           if (unlikely(blocked_rdev)) {
           ^
   drivers/md/raid1.c:1504:6: note: 'write_behind' is false
           if (write_behind && bitmap)
               ^~~~~~~~~~~~
   drivers/md/raid1.c:1504:19: note: Left side of '&&' is false
           if (write_behind && bitmap)
                            ^
   drivers/md/raid1.c:1507:6: note: Assuming the condition is false
           if (max_sectors < bio_sectors(bio)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1507:2: note: Taking false branch
           if (max_sectors < bio_sectors(bio)) {
           ^
   drivers/md/raid1.c:1517:6: note: Assuming the condition is false
           if (blk_queue_io_stat(bio->bi_bdev->bd_disk->queue))
               ^
   include/linux/blkdev.h:435:30: note: expanded from macro 'blk_queue_io_s=
tat'
   #define blk_queue_io_stat(q)    test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue=
_flags)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/md/raid1.c:1517:2: note: Taking false branch
           if (blk_queue_io_stat(bio->bi_bdev->bd_disk->queue))
           ^
   drivers/md/raid1.c:1524:2: note: Loop condition is true.  Entering loop =
body
           for (i =3D 0; i < disks; i++) {
           ^
   drivers/md/raid1.c:1526:3: note: 'rdev' initialized to a null pointer va=
lue
                   struct md_rdev *rdev =3D conf->mirrors[i].rdev;
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1527:7: note: Assuming the condition is false
                   if (!r1_bio->bios[i])
                       ^~~~~~~~~~~~~~~~
   drivers/md/raid1.c:1527:3: note: Taking false branch
                   if (!r1_bio->bios[i])
                   ^
   drivers/md/raid1.c:1530:7: note: 'first_clone' is 1
                   if (first_clone) {
                       ^~~~~~~~~~~
   drivers/md/raid1.c:1530:3: note: Taking true branch
                   if (first_clone) {
                   ^
   drivers/md/raid1.c:1535:8: note: Assuming 'bitmap' is non-null
                           if (bitmap &&
                               ^~~~~~
   drivers/md/raid1.c:1535:8: note: Left side of '&&' is true
   drivers/md/raid1.c:1536:30: note: Passing null pointer value via 2nd par=
ameter 'addr'
                               test_bit(WriteMostly, &rdev->flags) &&
                                                     ^~~~~~~~~~~~
   drivers/md/raid1.c:1536:8: note: Calling 'arch_test_bit'
                               test_bit(WriteMostly, &rdev->flags) &&
                               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:118:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   4 warnings generated.
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
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   fs/btrfs/sysfs.c:626:8: warning: Dereference of null pointer (loaded fro=
m variable 'value_ptr') [clang-analyzer-core.NullDereference]
           val =3D *value_ptr;
                 ^
   fs/btrfs/sysfs.c:644:34: note: Calling 'to_fs_info'
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:1097:6: note: Assuming the condition is false
           if (kobj->ktype !=3D &btrfs_ktype)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:1097:2: note: Taking false branch
           if (kobj->ktype !=3D &btrfs_ktype)
           ^
   fs/btrfs/sysfs.c:1099:2: note: Returning pointer
           return to_fs_devs(kobj)->fs_info;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:644:34: note: Returning from 'to_fs_info'
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:644:2: note: 'fs_info' initialized here
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:645:2: note: 'block_rsv' initialized here
           struct btrfs_block_rsv *block_rsv =3D &fs_info->global_block_rsv;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:646:24: note: Passing value via 1st parameter 'value_pt=
r'
           return btrfs_show_u64(&block_rsv->reserved, &block_rsv->lock, bu=
f);
                                 ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:646:9: note: Calling 'btrfs_show_u64'
           return btrfs_show_u64(&block_rsv->reserved, &block_rsv->lock, bu=
f);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/sysfs.c:624:6: note: Assuming 'lock' is null
           if (lock)
               ^~~~
   fs/btrfs/sysfs.c:624:2: note: Taking false branch
           if (lock)
           ^
   fs/btrfs/sysfs.c:626:8: note: Dereference of null pointer (loaded from v=
ariable 'value_ptr')
           val =3D *value_ptr;
                 ^~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/btrfs/xattr.c:484:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/btrfs/xattr.c:484:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/btrfs/xattr.c:485:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
                   ^~~~~~
   fs/btrfs/xattr.c:485:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119

vim +/ret +803 drivers/media/platform/samsung/exynos4-is/fimc-core.c

5fd8f7388c9a86 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-08-03  792  =

5fd8f7388c9a86 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-08-03  793  static int fimc_clk_get(struct fimc_dev *fimc)
5fd8f7388c9a86 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-08-03  794  {
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  795  	int i, ret;
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  796  =

b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  797  	for (i =3D 0; i < MAX_FIMC_CLOCKS; i++)
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  798  		fimc->clock[i] =3D ERR_PTR(-EINVAL);
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  799  =

6ec0163b7952ad drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-03-17  800  	for (i =3D 0; i < MAX_FIMC_CLOCKS; i++) {
a25be18dfb6e1b drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-12-27  801  		fimc->clock[i] =3D clk_get(&fimc->pdev->dev, fimc_clo=
cks[i]);
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  802  		if (IS_ERR(fimc->clock[i])) {
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29 @803  			ret =3D PTR_ERR(fimc->clock[i]);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  804  			goto err;
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  805  		}
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  806  		ret =3D clk_prepare(fimc->clock[i]);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  807  		if (ret < 0) {
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  808  			clk_put(fimc->clock[i]);
b71b56b264ae27 drivers/media/platform/s5p-fimc/fimc-core.c Sylwester Nawroc=
ki 2013-01-29  809  			fimc->clock[i] =3D ERR_PTR(-EINVAL);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  810  			goto err;
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  811  		}
5fd8f7388c9a86 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2010-08-03  812  	}
e9e21083ef9361 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2011-09-02  813  	return 0;
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  814  err:
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  815  	fimc_clk_put(fimc);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  816  	dev_err(&fimc->pdev->dev, "failed to get clock: %s\n",
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  817  		fimc_clocks[i]);
bd7d8888e99d67 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2012-01-30  818  	return -ENXIO;
e9e21083ef9361 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2011-09-02  819  }
e9e21083ef9361 drivers/media/video/s5p-fimc/fimc-core.c    Sylwester Nawroc=
ki 2011-09-02  820  =


:::::: The code at line 803 was first introduced by commit
:::::: b71b56b264ae27f32784973d15bfdfbc7df6d579 [media] s5p-fimc: Check ret=
urn value of clk_enable/clk_set_rate

:::::: TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0859867538790100211==--

