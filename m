Content-Type: multipart/mixed; boundary="===============1624533673913992556=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 02 Jan 2022 23:30:20 +0800
Message-ID: <202201022342.d4nclP1q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1624533673913992556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Robert Foss <robert.foss@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Andrey Konovalov <andrey.konovalov@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: eebe6d00e9bf1216fb381b64146e1b7e50d90b3f media: camss: Add support =
for CSID hardware version Titan 170
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-c006-20211227 (https://download.01.org/0day-ci/arc=
hive/20220102/202201022342.d4nclP1q-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726=
c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Deebe6d00e9bf1216fb381b64146e1b7e50d90b3f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout eebe6d00e9bf1216fb381b64146e1b7e50d90b3f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   handle_rx, =

   rx_fifo, =

   private_data, =

   se, =

   uport, =

   tx_fifo_depth, =

   tx_fifo_width, =

   rx_fifo_depth, =

   baud, =

   loopback, =

   tx_remaining, =

   wakeup_irq, =

   setup, =

   brk, =

   rx_tx_swap, =

   cts_rts_swap, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct qcom_geni_serial_port {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/qcom_geni_serial.c:120:8: note: Excessive padding in =
'struct qcom_geni_serial_port' (16 padding bytes, where 0 is optimal). Opti=
mal fields order: name, handle_rx, rx_fifo, private_data, se, uport, tx_fif=
o_depth, tx_fifo_width, rx_fifo_depth, baud, loopback, tx_remaining, wakeup=
_irq, setup, brk, rx_tx_swap, cts_rts_swap, consider reordering the fields =
or adding explicit padding members
   struct qcom_geni_serial_port {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/media/v4l2-core/videobuf-core.c:712:10: warning: Access to field=
 'state' results in a dereference of a null pointer (loaded from variable '=
buf') [clang-analyzer-core.NullDereference]
           switch (buf->state) {
                   ^~~
   drivers/media/v4l2-core/videobuf-core.c:698:2: note: 'buf' initialized t=
o a null pointer value
           struct videobuf_buffer *buf =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/videobuf-core.c:701:2: note: Assuming field 'mag=
ic' is equal to 304484355
           MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);
           ^
   drivers/media/v4l2-core/videobuf-core.c:27:16: note: expanded from macro=
 'MAGIC_CHECK'
                   if (unlikely((is) !=3D (should))) {                     =
  \
                       ~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/media/v4l2-core/videobuf-core.c:701:2: note: Taking false branch
           MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);
           ^
   drivers/media/v4l2-core/videobuf-core.c:27:3: note: expanded from macro =
'MAGIC_CHECK'
                   if (unlikely((is) !=3D (should))) {                     =
  \
                   ^
   drivers/media/v4l2-core/videobuf-core.c:701:2: note: Loop condition is f=
alse.  Exiting loop
           MAGIC_CHECK(q->int_ops->magic, MAGIC_QTYPE_OPS);
           ^
   drivers/media/v4l2-core/videobuf-core.c:26:2: note: expanded from macro =
'MAGIC_CHECK'
           do {                                                            \
           ^
   drivers/media/v4l2-core/videobuf-core.c:706:11: note: Calling 'stream_ne=
xt_buffer'
           retval =3D stream_next_buffer(q, &buf, nonblocking);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/videobuf-core.c:682:6: note: Assuming 'retval' i=
s not equal to 0
           if (retval)
               ^~~~~~
   drivers/media/v4l2-core/videobuf-core.c:682:2: note: Taking true branch
           if (retval)
           ^
   drivers/media/v4l2-core/videobuf-core.c:683:3: note: Control jumps to li=
ne 692
                   goto done;
                   ^
   drivers/media/v4l2-core/videobuf-core.c:692:2: note: Returning without w=
riting to '*vb'
           return retval;
           ^
   drivers/media/v4l2-core/videobuf-core.c:706:11: note: Returning from 'st=
ream_next_buffer'
           retval =3D stream_next_buffer(q, &buf, nonblocking);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/videobuf-core.c:707:6: note: Assuming 'retval' i=
s >=3D 0
           if (retval < 0) {
               ^~~~~~~~~~
   drivers/media/v4l2-core/videobuf-core.c:707:2: note: Taking false branch
           if (retval < 0) {
           ^
   drivers/media/v4l2-core/videobuf-core.c:712:10: note: Access to field 's=
tate' results in a dereference of a null pointer (loaded from variable 'buf=
')
           switch (buf->state) {
                   ^~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: warning: Value=
 stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: note: Value st=
ored to 'val' is never read
                   val =3D 0;
                   ^     ~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: warning: Value=
 stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: note: Value st=
ored to 'hw_gen' is never read
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: warning: Value=
 stored to 'hw_rev' is never read [clang-analyzer-deadcode.DeadStores]
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: note: Value st=
ored to 'hw_rev' is never read
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: warning: Value=
 stored to 'hw_step' is never read [clang-analyzer-deadcode.DeadStores]
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: note: Value st=
ored to 'hw_step' is never read
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: warning: =
Value stored to 'hw_version' during its initialization is never read [clang=
-analyzer-deadcode.DeadStores]
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: note: Val=
ue stored to 'hw_version' during its initialization is never read
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/w83781d.c:391:1: note: Left side of '&&' is false
   store_temp_reg(HYST, max_hyst);
   ^
   drivers/hwmon/w83781d.c:368:41: note: expanded from macro 'store_temp_re=
g'
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);=
 \
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwmon/w83781d.c:391:1: note: Taking false branch
   store_temp_reg(HYST, max_hyst);
   ^
   drivers/hwmon/w83781d.c:368:41: note: expanded from macro 'store_temp_re=
g'
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);=
 \
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/w83781d.c:391:1: note: Loop condition is false.  Exiting l=
oop
   store_temp_reg(HYST, max_hyst);
   ^
   drivers/hwmon/w83781d.c:368:41: note: expanded from macro 'store_temp_re=
g'
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);=
 \
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^

vim +/val +398 drivers/media/platform/qcom/camss/camss-csid-170.c

eebe6d00e9bf12 Robert Foss 2021-03-16  328  =

eebe6d00e9bf12 Robert Foss 2021-03-16  329  static void csid_configure_stre=
am(struct csid_device *csid, u8 enable)
eebe6d00e9bf12 Robert Foss 2021-03-16  330  {
eebe6d00e9bf12 Robert Foss 2021-03-16  331  	struct csid_testgen_config *tg=
 =3D &csid->testgen;
eebe6d00e9bf12 Robert Foss 2021-03-16  332  	u32 val;
eebe6d00e9bf12 Robert Foss 2021-03-16  333  	u32 phy_sel =3D 0;
eebe6d00e9bf12 Robert Foss 2021-03-16  334  	u8 lane_cnt =3D csid->phy.lane=
_cnt;
eebe6d00e9bf12 Robert Foss 2021-03-16  335  	struct v4l2_mbus_framefmt *inp=
ut_format =3D &csid->fmt[MSM_CSID_PAD_SRC];
eebe6d00e9bf12 Robert Foss 2021-03-16  336  	const struct csid_format *form=
at =3D csid_get_fmt_entry(csid->formats, csid->nformats,
eebe6d00e9bf12 Robert Foss 2021-03-16  337  							      input_format->code=
);
eebe6d00e9bf12 Robert Foss 2021-03-16  338  =

eebe6d00e9bf12 Robert Foss 2021-03-16  339  	if (!lane_cnt)
eebe6d00e9bf12 Robert Foss 2021-03-16  340  		lane_cnt =3D 4;
eebe6d00e9bf12 Robert Foss 2021-03-16  341  =

eebe6d00e9bf12 Robert Foss 2021-03-16  342  	if (!tg->enabled)
eebe6d00e9bf12 Robert Foss 2021-03-16  343  		phy_sel =3D csid->phy.csiphy_=
id;
eebe6d00e9bf12 Robert Foss 2021-03-16  344  =

eebe6d00e9bf12 Robert Foss 2021-03-16  345  	if (enable) {
eebe6d00e9bf12 Robert Foss 2021-03-16  346  		u8 vc =3D 0; /* Virtual Chann=
el 0 */
eebe6d00e9bf12 Robert Foss 2021-03-16  347  		u8 dt_id =3D vc * 4;
eebe6d00e9bf12 Robert Foss 2021-03-16  348  =

eebe6d00e9bf12 Robert Foss 2021-03-16  349  		if (tg->enabled) {
eebe6d00e9bf12 Robert Foss 2021-03-16  350  			/* Config Test Generator */
eebe6d00e9bf12 Robert Foss 2021-03-16  351  			vc =3D 0xa;
eebe6d00e9bf12 Robert Foss 2021-03-16  352  =

eebe6d00e9bf12 Robert Foss 2021-03-16  353  			/* configure one DT, infinit=
e frames */
eebe6d00e9bf12 Robert Foss 2021-03-16  354  			val =3D vc << TPG_VC_CFG0_VC=
_NUM;
eebe6d00e9bf12 Robert Foss 2021-03-16  355  			val |=3D INTELEAVING_MODE_ON=
E_SHOT << TPG_VC_CFG0_LINE_INTERLEAVING_MODE;
eebe6d00e9bf12 Robert Foss 2021-03-16  356  			val |=3D 0 << TPG_VC_CFG0_NU=
M_FRAMES;
eebe6d00e9bf12 Robert Foss 2021-03-16  357  			writel_relaxed(val, csid->ba=
se + CSID_TPG_VC_CFG0);
eebe6d00e9bf12 Robert Foss 2021-03-16  358  =

eebe6d00e9bf12 Robert Foss 2021-03-16  359  			val =3D 0x740 << TPG_VC_CFG1=
_H_BLANKING_COUNT;
eebe6d00e9bf12 Robert Foss 2021-03-16  360  			val |=3D 0x3ff << TPG_VC_CFG=
1_V_BLANKING_COUNT;
eebe6d00e9bf12 Robert Foss 2021-03-16  361  			writel_relaxed(val, csid->ba=
se + CSID_TPG_VC_CFG1);
eebe6d00e9bf12 Robert Foss 2021-03-16  362  =

eebe6d00e9bf12 Robert Foss 2021-03-16  363  			writel_relaxed(0x12345678, c=
sid->base + CSID_TPG_LFSR_SEED);
eebe6d00e9bf12 Robert Foss 2021-03-16  364  =

eebe6d00e9bf12 Robert Foss 2021-03-16  365  			val =3D input_format->height=
 & 0x1fff << TPG_DT_n_CFG_0_FRAME_HEIGHT;
eebe6d00e9bf12 Robert Foss 2021-03-16  366  			val |=3D input_format->width=
 & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
eebe6d00e9bf12 Robert Foss 2021-03-16  367  			writel_relaxed(val, csid->ba=
se + CSID_TPG_DT_n_CFG_0(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  368  =

eebe6d00e9bf12 Robert Foss 2021-03-16  369  			val =3D DATA_TYPE_RAW_10BIT =
<< TPG_DT_n_CFG_1_DATA_TYPE;
eebe6d00e9bf12 Robert Foss 2021-03-16  370  			writel_relaxed(val, csid->ba=
se + CSID_TPG_DT_n_CFG_1(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  371  =

eebe6d00e9bf12 Robert Foss 2021-03-16  372  			val =3D tg->mode << TPG_DT_n=
_CFG_2_PAYLOAD_MODE;
eebe6d00e9bf12 Robert Foss 2021-03-16  373  			val |=3D 0xBE << TPG_DT_n_CF=
G_2_USER_SPECIFIED_PAYLOAD;
eebe6d00e9bf12 Robert Foss 2021-03-16  374  			val |=3D format->decode_form=
at << TPG_DT_n_CFG_2_ENCODE_FORMAT;
eebe6d00e9bf12 Robert Foss 2021-03-16  375  			writel_relaxed(val, csid->ba=
se + CSID_TPG_DT_n_CFG_2(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  376  =

eebe6d00e9bf12 Robert Foss 2021-03-16  377  			writel_relaxed(0, csid->base=
 + CSID_TPG_COLOR_BARS_CFG);
eebe6d00e9bf12 Robert Foss 2021-03-16  378  =

eebe6d00e9bf12 Robert Foss 2021-03-16  379  			writel_relaxed(0, csid->base=
 + CSID_TPG_COLOR_BOX_CFG);
eebe6d00e9bf12 Robert Foss 2021-03-16  380  		}
eebe6d00e9bf12 Robert Foss 2021-03-16  381  =

eebe6d00e9bf12 Robert Foss 2021-03-16  382  		val =3D 1 << RDI_CFG0_BYTE_CN=
TR_EN;
eebe6d00e9bf12 Robert Foss 2021-03-16  383  		val |=3D 1 << RDI_CFG0_FORMAT=
_MEASURE_EN;
eebe6d00e9bf12 Robert Foss 2021-03-16  384  		val |=3D 1 << RDI_CFG0_TIMEST=
AMP_EN;
eebe6d00e9bf12 Robert Foss 2021-03-16  385  		val |=3D DECODE_FORMAT_PAYLOA=
D_ONLY << RDI_CFG0_DECODE_FORMAT;
eebe6d00e9bf12 Robert Foss 2021-03-16  386  		val |=3D DATA_TYPE_RAW_10BIT =
<< RDI_CFG0_DATA_TYPE;
eebe6d00e9bf12 Robert Foss 2021-03-16  387  		val |=3D vc << RDI_CFG0_VIRTU=
AL_CHANNEL;
eebe6d00e9bf12 Robert Foss 2021-03-16  388  		val |=3D dt_id << RDI_CFG0_DT=
_ID;
eebe6d00e9bf12 Robert Foss 2021-03-16  389  		writel_relaxed(val, csid->bas=
e + CSID_RDI_CFG0(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  390  =

eebe6d00e9bf12 Robert Foss 2021-03-16  391  		/* CSID_TIMESTAMP_STB_POST_IR=
Q */
eebe6d00e9bf12 Robert Foss 2021-03-16  392  		val =3D 2 << RDI_CFG1_TIMESTA=
MP_STB_SEL;
eebe6d00e9bf12 Robert Foss 2021-03-16  393  		writel_relaxed(val, csid->bas=
e + CSID_RDI_CFG1(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  394  =

eebe6d00e9bf12 Robert Foss 2021-03-16  395  		val =3D 1;
eebe6d00e9bf12 Robert Foss 2021-03-16  396  		writel_relaxed(val, csid->bas=
e + CSID_RDI_FRM_DROP_PERIOD(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  397  =

eebe6d00e9bf12 Robert Foss 2021-03-16 @398  		val =3D 0;
eebe6d00e9bf12 Robert Foss 2021-03-16  399  		writel_relaxed(0, csid->base =
+ CSID_RDI_FRM_DROP_PATTERN(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  400  =

eebe6d00e9bf12 Robert Foss 2021-03-16  401  		val =3D 1;
eebe6d00e9bf12 Robert Foss 2021-03-16  402  		writel_relaxed(val, csid->bas=
e + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  403  =

eebe6d00e9bf12 Robert Foss 2021-03-16  404  		val =3D 0;
eebe6d00e9bf12 Robert Foss 2021-03-16  405  		writel_relaxed(val, csid->bas=
e + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  406  =

eebe6d00e9bf12 Robert Foss 2021-03-16  407  		val =3D 1;
eebe6d00e9bf12 Robert Foss 2021-03-16  408  		writel_relaxed(val, csid->bas=
e + CSID_RDI_RPP_PIX_DROP_PERIOD(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  409  =

eebe6d00e9bf12 Robert Foss 2021-03-16  410  		val =3D 0;
eebe6d00e9bf12 Robert Foss 2021-03-16  411  		writel_relaxed(val, csid->bas=
e + CSID_RDI_RPP_PIX_DROP_PATTERN(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  412  =

eebe6d00e9bf12 Robert Foss 2021-03-16  413  		val =3D 1;
eebe6d00e9bf12 Robert Foss 2021-03-16  414  		writel_relaxed(val, csid->bas=
e + CSID_RDI_RPP_LINE_DROP_PERIOD(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  415  =

eebe6d00e9bf12 Robert Foss 2021-03-16  416  		val =3D 0;
eebe6d00e9bf12 Robert Foss 2021-03-16  417  		writel_relaxed(val, csid->bas=
e + CSID_RDI_RPP_LINE_DROP_PATTERN(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  418  =

eebe6d00e9bf12 Robert Foss 2021-03-16  419  		val =3D 0;
eebe6d00e9bf12 Robert Foss 2021-03-16  420  		writel_relaxed(val, csid->bas=
e + CSID_RDI_CTRL(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  421  =

eebe6d00e9bf12 Robert Foss 2021-03-16  422  		val =3D readl_relaxed(csid->b=
ase + CSID_RDI_CFG0(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  423  		val |=3D  1 << RDI_CFG0_ENABL=
E;
eebe6d00e9bf12 Robert Foss 2021-03-16  424  		writel_relaxed(val, csid->bas=
e + CSID_RDI_CFG0(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  425  	}
eebe6d00e9bf12 Robert Foss 2021-03-16  426  =

eebe6d00e9bf12 Robert Foss 2021-03-16  427  	if (tg->enabled) {
eebe6d00e9bf12 Robert Foss 2021-03-16  428  		val =3D enable << TPG_CTRL_TE=
ST_EN;
eebe6d00e9bf12 Robert Foss 2021-03-16  429  		val |=3D 1 << TPG_CTRL_FS_PKT=
_EN;
eebe6d00e9bf12 Robert Foss 2021-03-16  430  		val |=3D 1 << TPG_CTRL_FE_PKT=
_EN;
eebe6d00e9bf12 Robert Foss 2021-03-16  431  		val |=3D (lane_cnt - 1) << TP=
G_CTRL_NUM_ACTIVE_LANES;
eebe6d00e9bf12 Robert Foss 2021-03-16  432  		val |=3D 0x64 << TPG_CTRL_CYC=
LES_BETWEEN_PKTS;
eebe6d00e9bf12 Robert Foss 2021-03-16  433  		val |=3D 0xA << TPG_CTRL_NUM_=
TRAIL_BYTES;
eebe6d00e9bf12 Robert Foss 2021-03-16  434  		writel_relaxed(val, csid->bas=
e + CSID_TPG_CTRL);
eebe6d00e9bf12 Robert Foss 2021-03-16  435  	}
eebe6d00e9bf12 Robert Foss 2021-03-16  436  =

eebe6d00e9bf12 Robert Foss 2021-03-16  437  	val =3D (lane_cnt - 1) << CSI2=
_RX_CFG0_NUM_ACTIVE_LANES;
eebe6d00e9bf12 Robert Foss 2021-03-16  438  	val |=3D csid->phy.lane_assign=
 << CSI2_RX_CFG0_DL0_INPUT_SEL;
eebe6d00e9bf12 Robert Foss 2021-03-16  439  	val |=3D phy_sel << CSI2_RX_CF=
G0_PHY_NUM_SEL;
eebe6d00e9bf12 Robert Foss 2021-03-16  440  	writel_relaxed(val, csid->base=
 + CSID_CSI2_RX_CFG0);
eebe6d00e9bf12 Robert Foss 2021-03-16  441  =

eebe6d00e9bf12 Robert Foss 2021-03-16  442  	val =3D 1 << CSI2_RX_CFG1_PACK=
ET_ECC_CORRECTION_EN;
eebe6d00e9bf12 Robert Foss 2021-03-16  443  	val |=3D 1 << CSI2_RX_CFG1_MIS=
R_EN;
eebe6d00e9bf12 Robert Foss 2021-03-16  444  	writel_relaxed(val, csid->base=
 + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
eebe6d00e9bf12 Robert Foss 2021-03-16  445  =

eebe6d00e9bf12 Robert Foss 2021-03-16  446  	/* error irqs start at BIT(11)=
 */
eebe6d00e9bf12 Robert Foss 2021-03-16  447  	writel_relaxed(~0u, csid->base=
 + CSID_CSI2_RX_IRQ_MASK);
eebe6d00e9bf12 Robert Foss 2021-03-16  448  =

eebe6d00e9bf12 Robert Foss 2021-03-16  449  	/* RDI irq */
eebe6d00e9bf12 Robert Foss 2021-03-16  450  	writel_relaxed(~0u, csid->base=
 + CSID_TOP_IRQ_MASK);
eebe6d00e9bf12 Robert Foss 2021-03-16  451  =

eebe6d00e9bf12 Robert Foss 2021-03-16  452  	val =3D 1 << RDI_CTRL_HALT_CMD;
eebe6d00e9bf12 Robert Foss 2021-03-16  453  	writel_relaxed(val, csid->base=
 + CSID_RDI_CTRL(0));
eebe6d00e9bf12 Robert Foss 2021-03-16  454  }
eebe6d00e9bf12 Robert Foss 2021-03-16  455  =

eebe6d00e9bf12 Robert Foss 2021-03-16  456  static int csid_configure_testg=
en_pattern(struct csid_device *csid, s32 val)
eebe6d00e9bf12 Robert Foss 2021-03-16  457  {
eebe6d00e9bf12 Robert Foss 2021-03-16  458  	if (val > 0 && val <=3D csid->=
testgen.nmodes)
eebe6d00e9bf12 Robert Foss 2021-03-16  459  		csid->testgen.mode =3D val;
eebe6d00e9bf12 Robert Foss 2021-03-16  460  =

eebe6d00e9bf12 Robert Foss 2021-03-16  461  	return 0;
eebe6d00e9bf12 Robert Foss 2021-03-16  462  }
eebe6d00e9bf12 Robert Foss 2021-03-16  463  =

eebe6d00e9bf12 Robert Foss 2021-03-16  464  /*
eebe6d00e9bf12 Robert Foss 2021-03-16  465   * csid_hw_version - CSID hardw=
are version query
eebe6d00e9bf12 Robert Foss 2021-03-16  466   * @csid: CSID device
eebe6d00e9bf12 Robert Foss 2021-03-16  467   *
eebe6d00e9bf12 Robert Foss 2021-03-16  468   * Return HW version or error
eebe6d00e9bf12 Robert Foss 2021-03-16  469   */
eebe6d00e9bf12 Robert Foss 2021-03-16  470  static u32 csid_hw_version(stru=
ct csid_device *csid)
eebe6d00e9bf12 Robert Foss 2021-03-16  471  {
eebe6d00e9bf12 Robert Foss 2021-03-16  472  	u32 hw_version;
eebe6d00e9bf12 Robert Foss 2021-03-16  473  	u32 hw_gen;
eebe6d00e9bf12 Robert Foss 2021-03-16  474  	u32 hw_rev;
eebe6d00e9bf12 Robert Foss 2021-03-16  475  	u32 hw_step;
eebe6d00e9bf12 Robert Foss 2021-03-16  476  =

eebe6d00e9bf12 Robert Foss 2021-03-16  477  	hw_version =3D readl_relaxed(c=
sid->base + CSID_HW_VERSION);
eebe6d00e9bf12 Robert Foss 2021-03-16 @478  	hw_gen =3D (hw_version >> HW_V=
ERSION_GENERATION) & 0xF;
eebe6d00e9bf12 Robert Foss 2021-03-16 @479  	hw_rev =3D (hw_version >> HW_V=
ERSION_REVISION) & 0xFFF;
eebe6d00e9bf12 Robert Foss 2021-03-16 @480  	hw_step =3D (hw_version >> HW_=
VERSION_STEPPING) & 0xFFFF;
eebe6d00e9bf12 Robert Foss 2021-03-16  481  	dev_dbg(csid->camss->dev, "CSI=
D HW Version =3D %u.%u.%u\n",
eebe6d00e9bf12 Robert Foss 2021-03-16  482  		hw_gen, hw_rev, hw_step);
eebe6d00e9bf12 Robert Foss 2021-03-16  483  =

eebe6d00e9bf12 Robert Foss 2021-03-16  484  	return hw_version;
eebe6d00e9bf12 Robert Foss 2021-03-16  485  }
eebe6d00e9bf12 Robert Foss 2021-03-16  486  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1624533673913992556==--

