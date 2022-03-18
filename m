Content-Type: multipart/mixed; boundary="===============1010396915288279979=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/venus/venc.c:807:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 18 Mar 2022 21:31:43 +0800
Message-ID: <202203182154.UNWCvcFs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1010396915288279979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Stanimir Varbanov <stanimir.varbanov@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   551acdc3c3d2b6bc97f11e31dcf960bc36343bfc
commit: f7a3d3dc5831df6f898a5ae2a6ea1d221ea95c8a media: venus: venc: Add su=
pport for intra-refresh period
date:   8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20220317 (https://download.01.org/0day-ci/arc=
hive/20220318/202203182154.UNWCvcFs-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df7a3d3dc5831df6f898a5ae2a6ea1d221ea95c8a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f7a3d3dc5831df6f898a5ae2a6ea1d221ea95c8a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:130:2: note: Takin=
g true branch
           if (it->lo !=3D 0) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:133:11: note: Call=
ing 'inv_compute_chip_period'
                   valid =3D inv_compute_chip_period(ts, fifo_mult, period);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:101:2: note: Takin=
g false branch
           if (!inv_validate_period(period, mult))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:106:2: note: Calli=
ng 'inv_update_acc'
           inv_update_acc(&ts->chip_period, new_chip_period);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:6: note: Assumi=
ng the condition is false
           if (acc->idx >=3D ARRAY_SIZE(acc->values))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:2: note: Taking=
 false branch
           if (acc->idx >=3D ARRAY_SIZE(acc->values))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:7: note: The va=
lue 0 is assigned to 'i'
           for (i =3D 0; i < ARRAY_SIZE(acc->values); ++i) {
                ^~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:2: note: Loop c=
ondition is true.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(acc->values); ++i) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:7: note: Assumi=
ng the condition is true
                   if (acc->values[i] =3D=3D 0)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:3: note: Taking=
 true branch
                   if (acc->values[i] =3D=3D 0)
                   ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:36:4: note:  Execu=
tion continues on line 40
                           break;
                           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:40:26: note: Passi=
ng the value 0 via 2nd parameter 'divisor'
           acc->val =3D div_u64(sum, i);
                                   ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:40:13: note: Calli=
ng 'div_u64'
           acc->val =3D div_u64(sum, i);
                      ^~~~~~~~~~~~~~~
   include/linux/math64.h:128:31: note: Passing the value 0 via 2nd paramet=
er 'divisor'
           return div_u64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:128:9: note: Calling 'div_u64_rem'
           return div_u64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:92:15: note: '__base' initialized to 0
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:226:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                       \
           ^~~~~~~~~~~~~~~
   include/linux/math64.h:92:15: note: Left side of '&&' is false
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:229:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   include/linux/math64.h:92:15: note: 4 is >=3D 4
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:68:32: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   include/linux/math64.h:92:15: note: Left side of '&&' is true
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   include/asm-generic/div64.h:68:31: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   include/linux/math64.h:92:15: note: Left side of '&&' is false
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:234:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   include/linux/math64.h:92:15: note: Taking true branch
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:241:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   include/linux/math64.h:92:15: note: Division by zero
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:242:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/media/platform/qcom/venus/venc.c:807:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/venc.c:807:3: note: Value stored to 'r=
et' is never read
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/hwmon/npcm750-pwm-fan.c:876:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D npcm7xx_pwm_config_set(data, pwm_port,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/npcm750-pwm-fan.c:876:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D npcm7xx_pwm_config_set(data, pwm_port,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/hwmon/pc87360.c:1450:12: warning: The right operand of '>=3D' is=
 a garbage value due to array index out of bounds [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
                   if (init >=3D init_temp[i]) {
                            ^
   drivers/hwmon/pc87360.c:1203:6: note: Assuming 'data' is non-null
           if (!data)
               ^~~~~
   drivers/hwmon/pc87360.c:1203:2: note: Taking false branch
           if (!data)
           ^
   drivers/hwmon/pc87360.c:1206:2: note: Control jumps to the 'default' cas=
e at line 1207
           switch (devid) {
           ^
   drivers/hwmon/pc87360.c:1210:3: note:  Execution continues on line 1233
                   break;
                   ^
   drivers/hwmon/pc87360.c:1234:2: note: Loop condition is false.  Exiting =
loop
           mutex_init(&data->lock);
           ^
   include/linux/mutex.h:113:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/hwmon/pc87360.c:1235:2: note: Loop condition is false.  Exiting =
loop
           mutex_init(&data->update_lock);
           ^
   include/linux/mutex.h:113:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/hwmon/pc87360.c:1238:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < LDNI_MAX; i++) {
           ^
   drivers/hwmon/pc87360.c:1240:7: note: Assuming the condition is false
                   if (data->address[i]
                       ^~~~~~~~~~~~~~~~
   drivers/hwmon/pc87360.c:1241:4: note: Left side of '&&' is false
                    && !devm_request_region(dev, extra_isa[i], PC87360_EXTE=
NT,
                    ^
   drivers/hwmon/pc87360.c:1238:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < LDNI_MAX; i++) {
           ^
   drivers/hwmon/pc87360.c:1240:7: note: Assuming the condition is false
                   if (data->address[i]
                       ^~~~~~~~~~~~~~~~
   drivers/hwmon/pc87360.c:1241:4: note: Left side of '&&' is false
                    && !devm_request_region(dev, extra_isa[i], PC87360_EXTE=
NT,
                    ^
   drivers/hwmon/pc87360.c:1238:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < LDNI_MAX; i++) {
           ^
   drivers/hwmon/pc87360.c:1240:7: note: Assuming the condition is false
                   if (data->address[i]
                       ^~~~~~~~~~~~~~~~
   drivers/hwmon/pc87360.c:1241:4: note: Left side of '&&' is false
                    && !devm_request_region(dev, extra_isa[i], PC87360_EXTE=
NT,
                    ^
   drivers/hwmon/pc87360.c:1238:2: note: Loop condition is false. Execution=
 continues on line 1251
           for (i =3D 0; i < LDNI_MAX; i++) {
           ^
   drivers/hwmon/pc87360.c:1251:6: note: Assuming field 'fannr' is 0
           if (data->fannr)
               ^~~~~~~~~~~
   drivers/hwmon/pc87360.c:1251:2: note: Taking false branch
           if (data->fannr)
           ^
   drivers/hwmon/pc87360.c:1259:6: note: Assuming field 'innr' is 0
           if (data->innr) {
               ^~~~~~~~~~
   drivers/hwmon/pc87360.c:1259:2: note: Taking false branch
           if (data->innr) {
           ^
   drivers/hwmon/pc87360.c:1275:2: note: Loop condition is false. Execution=
 continues on line 1282
           for (i =3D 0; i < data->fannr; i++) {
           ^
   drivers/hwmon/pc87360.c:1282:6: note: Assuming 'init' is > 0
           if (init > 0) {

vim +/ret +807 drivers/media/platform/qcom/venus/venc.c

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  540  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  541  static int venc_set_prope=
rties(struct venus_inst *inst)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  542  {
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  543  	struct venc_controls *ct=
r =3D &inst->controls.enc;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  544  	struct hfi_intra_period =
intra_period;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  545  	struct hfi_framerate fra=
te;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  546  	struct hfi_bitrate brate;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  547  	struct hfi_idr_period id=
rp;
2123cbd687ca0c Kelvin Lawson     2018-11-29  548  	struct hfi_quantization =
quant;
2123cbd687ca0c Kelvin Lawson     2018-11-29  549  	struct hfi_quantization_=
range quant_range;
002c22bd360e07 Dikshita Agarwal  2021-01-08  550  	struct hfi_enable en;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  551  	struct hfi_ltr_mode ltr_=
mode;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  552  	struct hfi_intra_refresh=
 intra_refresh =3D {};
435c53c3698f41 Stanimir Varbanov 2020-09-08  553  	u32 ptype, rate_control,=
 bitrate;
a7a20f721e812a Stanimir Varbanov 2020-10-27  554  	u32 profile, level;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  555  	int ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  556  =

1ad175952bbcaf Dikshita Agarwal  2021-04-02  557  	ret =3D venus_helper_set=
_work_mode(inst);
01165b8484973d Stanimir Varbanov 2018-07-05  558  	if (ret)
01165b8484973d Stanimir Varbanov 2018-07-05  559  		return ret;
01165b8484973d Stanimir Varbanov 2018-07-05  560  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  561  	ptype =3D HFI_PROPERTY_C=
ONFIG_FRAME_RATE;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  562  	frate.buffer_type =3D HF=
I_BUFFER_OUTPUT;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  563  	frate.framerate =3D inst=
->fps * (1 << 16);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  564  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  565  	ret =3D hfi_session_set_=
property(inst, ptype, &frate);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  566  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  567  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  568  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  569  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_H264) {
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  570  		struct hfi_h264_vui_tim=
ing_info info;
a7837e11679e01 Loic Poulain      2017-11-24  571  		struct hfi_h264_entropy=
_control entropy;
f7d12fea16cbcc Loic Poulain      2017-11-24  572  		struct hfi_h264_db_cont=
rol deblock;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  573  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  574  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_H264_VUI_TIMING_INFO;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  575  		info.enable =3D 1;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  576  		info.fixed_framerate =
=3D 1;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  577  		info.time_scale =3D NSE=
C_PER_SEC;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  578  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  579  		ret =3D hfi_session_set=
_property(inst, ptype, &info);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  580  		if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  581  			return ret;
a7837e11679e01 Loic Poulain      2017-11-24  582  =

a7837e11679e01 Loic Poulain      2017-11-24  583  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_H264_ENTROPY_CONTROL;
a7837e11679e01 Loic Poulain      2017-11-24  584  		entropy.entropy_mode =
=3D venc_v4l2_to_hfi(
a7837e11679e01 Loic Poulain      2017-11-24  585  					  V4L2_CID_MPEG_VIDE=
O_H264_ENTROPY_MODE,
a7837e11679e01 Loic Poulain      2017-11-24  586  					  ctr->h264_entropy_=
mode);
a7837e11679e01 Loic Poulain      2017-11-24  587  		entropy.cabac_model =3D=
 HFI_H264_CABAC_MODEL_0;
a7837e11679e01 Loic Poulain      2017-11-24  588  =

a7837e11679e01 Loic Poulain      2017-11-24  589  		ret =3D hfi_session_set=
_property(inst, ptype, &entropy);
a7837e11679e01 Loic Poulain      2017-11-24  590  		if (ret)
a7837e11679e01 Loic Poulain      2017-11-24  591  			return ret;
f7d12fea16cbcc Loic Poulain      2017-11-24  592  =

f7d12fea16cbcc Loic Poulain      2017-11-24  593  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_H264_DEBLOCK_CONTROL;
f7d12fea16cbcc Loic Poulain      2017-11-24  594  		deblock.mode =3D venc_v=
4l2_to_hfi(
f7d12fea16cbcc Loic Poulain      2017-11-24  595  				      V4L2_CID_MPEG_V=
IDEO_H264_LOOP_FILTER_MODE,
f7d12fea16cbcc Loic Poulain      2017-11-24  596  				      ctr->h264_loop_=
filter_mode);
f7d12fea16cbcc Loic Poulain      2017-11-24  597  		deblock.slice_alpha_off=
set =3D ctr->h264_loop_filter_alpha;
f7d12fea16cbcc Loic Poulain      2017-11-24  598  		deblock.slice_beta_offs=
et =3D ctr->h264_loop_filter_beta;
f7d12fea16cbcc Loic Poulain      2017-11-24  599  =

f7d12fea16cbcc Loic Poulain      2017-11-24  600  		ret =3D hfi_session_set=
_property(inst, ptype, &deblock);
f7d12fea16cbcc Loic Poulain      2017-11-24  601  		if (ret)
f7d12fea16cbcc Loic Poulain      2017-11-24  602  			return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  603  	}
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  604  =

f0ddb4e9911665 Dikshita Agarwal  2020-12-16  605  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_H264 ||
f0ddb4e9911665 Dikshita Agarwal  2020-12-16  606  	    inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
8fc58186bb41ff Stanimir Varbanov 2017-12-01  607  		/* IDR periodicity, n:
8fc58186bb41ff Stanimir Varbanov 2017-12-01  608  		 * n =3D 0 - only the f=
irst I-frame is IDR frame
8fc58186bb41ff Stanimir Varbanov 2017-12-01  609  		 * n =3D 1 - all I-fram=
es will be IDR frames
8fc58186bb41ff Stanimir Varbanov 2017-12-01  610  		 * n > 1 - every n-th I=
-frame will be IDR frame
8fc58186bb41ff Stanimir Varbanov 2017-12-01  611  		 */
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  612  		ptype =3D HFI_PROPERTY_=
CONFIG_VENC_IDR_PERIOD;
8fc58186bb41ff Stanimir Varbanov 2017-12-01  613  		idrp.idr_period =3D 0;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  614  		ret =3D hfi_session_set=
_property(inst, ptype, &idrp);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  615  		if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  616  			return ret;
f0ddb4e9911665 Dikshita Agarwal  2020-12-16  617  	}
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  618  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  619  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
9172652d72f8e9 Stanimir Varbanov 2020-04-23  620  		struct hfi_hdr10_pq_sei=
 hdr10;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  621  		unsigned int c;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  622  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  623  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_HDR10_PQ_SEI;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  624  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  625  		for (c =3D 0; c < 3; c+=
+) {
9172652d72f8e9 Stanimir Varbanov 2020-04-23  626  			hdr10.mastering.displa=
y_primaries_x[c] =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  627  				ctr->mastering.displa=
y_primaries_x[c];
9172652d72f8e9 Stanimir Varbanov 2020-04-23  628  			hdr10.mastering.displa=
y_primaries_y[c] =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  629  				ctr->mastering.displa=
y_primaries_y[c];
9172652d72f8e9 Stanimir Varbanov 2020-04-23  630  		}
9172652d72f8e9 Stanimir Varbanov 2020-04-23  631  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  632  		hdr10.mastering.white_p=
oint_x =3D ctr->mastering.white_point_x;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  633  		hdr10.mastering.white_p=
oint_y =3D ctr->mastering.white_point_y;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  634  		hdr10.mastering.max_dis=
play_mastering_luminance =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  635  			ctr->mastering.max_dis=
play_mastering_luminance;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  636  		hdr10.mastering.min_dis=
play_mastering_luminance =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  637  			ctr->mastering.min_dis=
play_mastering_luminance;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  638  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  639  		hdr10.cll.max_content_l=
ight =3D ctr->cll.max_content_light_level;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  640  		hdr10.cll.max_pic_avera=
ge_light =3D
9172652d72f8e9 Stanimir Varbanov 2020-04-23  641  			ctr->cll.max_pic_avera=
ge_light_level;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  642  =

9172652d72f8e9 Stanimir Varbanov 2020-04-23  643  		ret =3D hfi_session_set=
_property(inst, ptype, &hdr10);
9172652d72f8e9 Stanimir Varbanov 2020-04-23  644  		if (ret)
9172652d72f8e9 Stanimir Varbanov 2020-04-23  645  			return ret;
9172652d72f8e9 Stanimir Varbanov 2020-04-23  646  	}
9172652d72f8e9 Stanimir Varbanov 2020-04-23  647  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  648  	if (ctr->num_b_frames) {
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  649  		u32 max_num_b_frames =
=3D NUM_B_FRAMES_MAX;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  650  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  651  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_MAX_NUM_B_FRAMES;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  652  		ret =3D hfi_session_set=
_property(inst, ptype, &max_num_b_frames);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  653  		if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  654  			return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  655  	}
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  656  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  657  	ptype =3D HFI_PROPERTY_C=
ONFIG_VENC_INTRA_PERIOD;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  658  	intra_period.pframes =3D=
 ctr->num_p_frames;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  659  	intra_period.bframes =3D=
 ctr->num_b_frames;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  660  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  661  	ret =3D hfi_session_set_=
property(inst, ptype, &intra_period);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  662  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  663  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  664  =

6f704b2fbbde0c Jeffrey Kardatzke 2020-02-22  665  	if (!ctr->rc_enable)
6f704b2fbbde0c Jeffrey Kardatzke 2020-02-22  666  		rate_control =3D HFI_RA=
TE_CONTROL_OFF;
6f704b2fbbde0c Jeffrey Kardatzke 2020-02-22  667  	else if (ctr->bitrate_mo=
de =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
94dfb1689c25ed Stanimir Varbanov 2020-07-05  668  		rate_control =3D ctr->f=
rame_skip_mode ? HFI_RATE_CONTROL_VBR_VFR :
94dfb1689c25ed Stanimir Varbanov 2020-07-05  669  						      HFI_RATE_CONT=
ROL_VBR_CFR;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  670  	else if (ctr->bitrate_mo=
de =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
94dfb1689c25ed Stanimir Varbanov 2020-07-05  671  		rate_control =3D ctr->f=
rame_skip_mode ? HFI_RATE_CONTROL_CBR_VFR :
94dfb1689c25ed Stanimir Varbanov 2020-07-05  672  						      HFI_RATE_CONT=
ROL_CBR_CFR;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  673  	else if (ctr->bitrate_mo=
de =3D=3D V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  674  		rate_control =3D HFI_RA=
TE_CONTROL_CQ;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  675  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  676  	ptype =3D HFI_PROPERTY_P=
ARAM_VENC_RATE_CONTROL;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  677  	ret =3D hfi_session_set_=
property(inst, ptype, &rate_control);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  678  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  679  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  680  =

69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  681  	if (rate_control =3D=3D =
HFI_RATE_CONTROL_CQ && ctr->const_quality) {
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  682  		struct hfi_heic_frame_q=
uality quality =3D {};
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  683  =

69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  684  		ptype =3D HFI_PROPERTY_=
CONFIG_HEIC_FRAME_QUALITY;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  685  		quality.frame_quality =
=3D ctr->const_quality;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  686  		ret =3D hfi_session_set=
_property(inst, ptype, &quality);
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  687  		if (ret)
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  688  			return ret;
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  689  	}
69ff4b2caa95e1 Stanimir Varbanov 2020-06-16  690  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  691  	if (!ctr->bitrate)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  692  		bitrate =3D 64000;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  693  	else
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  694  		bitrate =3D ctr->bitrat=
e;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  695  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  696  	ptype =3D HFI_PROPERTY_C=
ONFIG_VENC_TARGET_BITRATE;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  697  	brate.bitrate =3D bitrat=
e;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  698  	brate.layer_id =3D 0;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  699  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  700  	ret =3D hfi_session_set_=
property(inst, ptype, &brate);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  701  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  702  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  703  =

002c22bd360e07 Dikshita Agarwal  2021-01-08  704  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_H264 ||
002c22bd360e07 Dikshita Agarwal  2021-01-08  705  	    inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
002c22bd360e07 Dikshita Agarwal  2021-01-08  706  		ptype =3D HFI_PROPERTY_=
CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
002c22bd360e07 Dikshita Agarwal  2021-01-08  707  		if (ctr->header_mode =
=3D=3D V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
002c22bd360e07 Dikshita Agarwal  2021-01-08  708  			en.enable =3D 0;
002c22bd360e07 Dikshita Agarwal  2021-01-08  709  		else
002c22bd360e07 Dikshita Agarwal  2021-01-08  710  			en.enable =3D 1;
002c22bd360e07 Dikshita Agarwal  2021-01-08  711  =

002c22bd360e07 Dikshita Agarwal  2021-01-08  712  		ret =3D hfi_session_set=
_property(inst, ptype, &en);
002c22bd360e07 Dikshita Agarwal  2021-01-08  713  		if (ret)
002c22bd360e07 Dikshita Agarwal  2021-01-08  714  			return ret;
002c22bd360e07 Dikshita Agarwal  2021-01-08  715  	}
002c22bd360e07 Dikshita Agarwal  2021-01-08  716  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  717  	if (!ctr->bitrate_peak)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  718  		bitrate *=3D 2;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  719  	else
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  720  		bitrate =3D ctr->bitrat=
e_peak;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  721  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  722  	ptype =3D HFI_PROPERTY_C=
ONFIG_VENC_MAX_BITRATE;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  723  	brate.bitrate =3D bitrat=
e;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  724  	brate.layer_id =3D 0;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  725  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  726  	ret =3D hfi_session_set_=
property(inst, ptype, &brate);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  727  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  728  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  729  =

2123cbd687ca0c Kelvin Lawson     2018-11-29  730  	ptype =3D HFI_PROPERTY_P=
ARAM_VENC_SESSION_QP;
74c895974fd356 Dikshita Agarwal  2020-12-24  731  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
74c895974fd356 Dikshita Agarwal  2020-12-24  732  		quant.qp_i =3D ctr->hev=
c_i_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  733  		quant.qp_p =3D ctr->hev=
c_p_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  734  		quant.qp_b =3D ctr->hev=
c_b_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  735  	} else {
2123cbd687ca0c Kelvin Lawson     2018-11-29  736  		quant.qp_i =3D ctr->h26=
4_i_qp;
2123cbd687ca0c Kelvin Lawson     2018-11-29  737  		quant.qp_p =3D ctr->h26=
4_p_qp;
2123cbd687ca0c Kelvin Lawson     2018-11-29  738  		quant.qp_b =3D ctr->h26=
4_b_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  739  	}
2123cbd687ca0c Kelvin Lawson     2018-11-29  740  	quant.layer_id =3D 0;
2123cbd687ca0c Kelvin Lawson     2018-11-29  741  	ret =3D hfi_session_set_=
property(inst, ptype, &quant);
2123cbd687ca0c Kelvin Lawson     2018-11-29  742  	if (ret)
2123cbd687ca0c Kelvin Lawson     2018-11-29  743  		return ret;
2123cbd687ca0c Kelvin Lawson     2018-11-29  744  =

2123cbd687ca0c Kelvin Lawson     2018-11-29  745  	ptype =3D HFI_PROPERTY_P=
ARAM_VENC_SESSION_QP_RANGE;
74c895974fd356 Dikshita Agarwal  2020-12-24  746  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
74c895974fd356 Dikshita Agarwal  2020-12-24  747  		quant_range.min_qp =3D =
ctr->hevc_min_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  748  		quant_range.max_qp =3D =
ctr->hevc_max_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  749  	} else {
2123cbd687ca0c Kelvin Lawson     2018-11-29  750  		quant_range.min_qp =3D =
ctr->h264_min_qp;
2123cbd687ca0c Kelvin Lawson     2018-11-29  751  		quant_range.max_qp =3D =
ctr->h264_max_qp;
74c895974fd356 Dikshita Agarwal  2020-12-24  752  	}
2123cbd687ca0c Kelvin Lawson     2018-11-29  753  	quant_range.layer_id =3D=
 0;
2123cbd687ca0c Kelvin Lawson     2018-11-29  754  	ret =3D hfi_session_set_=
property(inst, ptype, &quant_range);
2123cbd687ca0c Kelvin Lawson     2018-11-29  755  	if (ret)
2123cbd687ca0c Kelvin Lawson     2018-11-29  756  		return ret;
2123cbd687ca0c Kelvin Lawson     2018-11-29  757  =

f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  758  	ptype =3D HFI_PROPERTY_P=
ARAM_VENC_LTRMODE;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  759  	ltr_mode.ltr_count =3D c=
tr->ltr_count;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  760  	ltr_mode.ltr_mode =3D HF=
I_LTR_MODE_MANUAL;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  761  	ltr_mode.trust_mode =3D =
1;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  762  	ret =3D hfi_session_set_=
property(inst, ptype, &ltr_mode);
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  763  	if (ret)
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  764  		return ret;
f2fb3f02abe2e6 Dikshita Agarwal  2021-03-24  765  =

a7a20f721e812a Stanimir Varbanov 2020-10-27  766  	switch (inst->hfi_codec)=
 {
a7a20f721e812a Stanimir Varbanov 2020-10-27  767  	case HFI_VIDEO_CODEC_H26=
4:
a7a20f721e812a Stanimir Varbanov 2020-10-27  768  		profile =3D ctr->profil=
e.h264;
a7a20f721e812a Stanimir Varbanov 2020-10-27  769  		level =3D ctr->level.h2=
64;
a7a20f721e812a Stanimir Varbanov 2020-10-27  770  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  771  	case HFI_VIDEO_CODEC_MPE=
G4:
a7a20f721e812a Stanimir Varbanov 2020-10-27  772  		profile =3D ctr->profil=
e.mpeg4;
a7a20f721e812a Stanimir Varbanov 2020-10-27  773  		level =3D ctr->level.mp=
eg4;
a7a20f721e812a Stanimir Varbanov 2020-10-27  774  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  775  	case HFI_VIDEO_CODEC_VP8:
a7a20f721e812a Stanimir Varbanov 2020-10-27  776  		profile =3D ctr->profil=
e.vp8;
a7a20f721e812a Stanimir Varbanov 2020-10-27  777  		level =3D 0;
a7a20f721e812a Stanimir Varbanov 2020-10-27  778  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  779  	case HFI_VIDEO_CODEC_VP9:
a7a20f721e812a Stanimir Varbanov 2020-10-27  780  		profile =3D ctr->profil=
e.vp9;
a7a20f721e812a Stanimir Varbanov 2020-10-27  781  		level =3D ctr->level.vp=
9;
a7a20f721e812a Stanimir Varbanov 2020-10-27  782  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  783  	case HFI_VIDEO_CODEC_HEV=
C:
a7a20f721e812a Stanimir Varbanov 2020-10-27  784  		profile =3D ctr->profil=
e.hevc;
a7a20f721e812a Stanimir Varbanov 2020-10-27  785  		level =3D ctr->level.he=
vc;
a7a20f721e812a Stanimir Varbanov 2020-10-27  786  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  787  	case HFI_VIDEO_CODEC_MPE=
G2:
a7a20f721e812a Stanimir Varbanov 2020-10-27  788  	default:
a7a20f721e812a Stanimir Varbanov 2020-10-27  789  		profile =3D 0;
a7a20f721e812a Stanimir Varbanov 2020-10-27  790  		level =3D 0;
a7a20f721e812a Stanimir Varbanov 2020-10-27  791  		break;
a7a20f721e812a Stanimir Varbanov 2020-10-27  792  	}
a7a20f721e812a Stanimir Varbanov 2020-10-27  793  =

a7a20f721e812a Stanimir Varbanov 2020-10-27  794  	ret =3D venus_helper_set=
_profile_level(inst, profile, level);
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  795  	if (ret)
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  796  		return ret;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  797  =

08c06797627935 Stanimir Varbanov 2020-11-24  798  	if (inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_H264 ||
08c06797627935 Stanimir Varbanov 2020-11-24  799  	    inst->fmt_cap->pixfm=
t =3D=3D V4L2_PIX_FMT_HEVC) {
08c06797627935 Stanimir Varbanov 2020-11-24  800  		struct hfi_enable en =
=3D {};
08c06797627935 Stanimir Varbanov 2020-11-24  801  =

08c06797627935 Stanimir Varbanov 2020-11-24  802  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_H264_GENERATE_AUDNAL;
08c06797627935 Stanimir Varbanov 2020-11-24  803  =

08c06797627935 Stanimir Varbanov 2020-11-24  804  		if (ctr->aud_enable)
08c06797627935 Stanimir Varbanov 2020-11-24  805  			en.enable =3D 1;
08c06797627935 Stanimir Varbanov 2020-11-24  806  =

08c06797627935 Stanimir Varbanov 2020-11-24 @807  		ret =3D hfi_session_set=
_property(inst, ptype, &en);
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  808  	}
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  809  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  810  	if ((inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_H264 ||
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  811  	     inst->fmt_cap->pixf=
mt =3D=3D V4L2_PIX_FMT_HEVC) &&
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  812  	    (rate_control =3D=3D=
 HFI_RATE_CONTROL_CBR_VFR ||
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  813  	     rate_control =3D=3D=
 HFI_RATE_CONTROL_CBR_CFR)) {
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  814  		intra_refresh.mode =3D =
HFI_INTRA_REFRESH_NONE;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  815  		intra_refresh.cir_mbs =
=3D 0;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  816  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  817  		if (ctr->intra_refresh_=
period) {
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  818  			u32 mbs;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  819  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  820  			mbs =3D ALIGN(inst->wi=
dth, 16) * ALIGN(inst->height, 16);
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  821  			mbs /=3D 16 * 16;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  822  			if (mbs % ctr->intra_r=
efresh_period)
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  823  				mbs++;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  824  			mbs /=3D ctr->intra_re=
fresh_period;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  825  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  826  			intra_refresh.mode =3D=
 HFI_INTRA_REFRESH_RANDOM;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  827  			intra_refresh.cir_mbs =
=3D mbs;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  828  		}
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  829  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  830  		ptype =3D HFI_PROPERTY_=
PARAM_VENC_INTRA_REFRESH;
f7a3d3dc5831df Stanimir Varbanov 2021-06-22  831  =

f7a3d3dc5831df Stanimir Varbanov 2021-06-22  832  		ret =3D hfi_session_set=
_property(inst, ptype, &intra_refresh);
08c06797627935 Stanimir Varbanov 2020-11-24  833  		if (ret)
08c06797627935 Stanimir Varbanov 2020-11-24  834  			return ret;
08c06797627935 Stanimir Varbanov 2020-11-24  835  	}
08c06797627935 Stanimir Varbanov 2020-11-24  836  =

aaaa93eda64b00 Stanimir Varbanov 2017-06-15  837  	return 0;
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  838  }
aaaa93eda64b00 Stanimir Varbanov 2017-06-15  839  =


:::::: The code at line 807 was first introduced by commit
:::::: 08c06797627935d48621359eb95ab8a69d70d5c5 media: venus: venc: Add sup=
port for AUD NALU control

:::::: TO: Stanimir Varbanov <stanimir.varbanov@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1010396915288279979==--

