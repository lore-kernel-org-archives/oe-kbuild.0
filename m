Content-Type: multipart/mixed; boundary="===============0658121807371484877=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:tmp 352/423] drivers/media/platform/renesas/rcar_jpu.c:1551:17: warning: Value stored to 'error' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 24 Mar 2022 14:02:51 +0800
Message-ID: <202203241312.VpSwODHc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0658121807371484877==
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

tree:   git://linuxtv.org/hverkuil/media_tree.git tmp
head:   f89d74081c909f1c547a611141a23d7670e44bed
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 [352/423] media: platform:=
 place Renesas drivers on a separate dir
:::::: branch date: 20 hours ago
:::::: commit date: 10 days ago
config: riscv-randconfig-c006-20220317 (https://download.01.org/0day-ci/arc=
hive/20220324/202203241312.VpSwODHc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media=
_tree.git
        git fetch --no-tags hverkuil-media-tree tmp
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/light/tsl2772.c:879:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:882:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   drivers/iio/light/tsl2772.c:882:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/light/tsl2772.c:879:14: note: Assuming 'i' is >=3D field 'pr=
ox_max_samples_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:879:2: note: Loop condition is false. Execut=
ion continues on line 888
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:889:2: note: The value -2147483648 is assign=
ed to 'max'
           max =3D INT_MIN;
           ^~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:890:14: note: Assuming 'i' is >=3D field 'pr=
ox_max_samples_cal'
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/tsl2772.c:890:2: note: Loop condition is false. Execut=
ion continues on line 894
           for (i =3D 0; i < chip->settings.prox_max_samples_cal; i++) {
           ^
   drivers/iio/light/tsl2772.c:896:40: note: The result of the left shift i=
s undefined because the left operand is negative
           chip->settings.prox_thres_high =3D (max << 1) - mean;
                                             ~~~ ^
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/bluetooth/btqca.c:257:3: warning: Value stored to 'type_len' is =
never read [clang-analyzer-deadcode.DeadStores]
                   type_len =3D le32_to_cpu(tlv->type_len);
                   ^
   drivers/bluetooth/btqca.c:257:3: note: Value stored to 'type_len' is nev=
er read
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/platform/qcom/venus/venc.c:877:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/venc.c:877:3: note: Value stored to 'r=
et' is never read
                   ret =3D hfi_session_set_property(inst, ptype, &en);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
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
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/platform/s5p-jpeg/jpeg-core.c:1141:3: warning: Value store=
d to 'length' is never read [clang-analyzer-deadcode.DeadStores]
                   length =3D 0;
                   ^        ~
   drivers/media/platform/s5p-jpeg/jpeg-core.c:1141:3: note: Value stored t=
o 'length' is never read
                   length =3D 0;
                   ^        ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:993:15: warning: Assigned=
 value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   cf->data[6] =3D bec.txerr;
                               ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:1307:6: note: Assuming fi=
eld 'rx_int' is null
           if (priv->rx_int)
               ^~~~~~~~~~~~
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:1307:2: note: Taking fals=
e branch
           if (priv->rx_int)
           ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:1330:7: note: Assuming 'e=
rr' is 0
                   if (err)
                       ^~~
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:1330:3: note: Taking fals=
e branch
                   if (err)
                   ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:1333:18: note: Taking fal=
se branch
                   intf_pending =3D FIELD_GET(MCP251XFD_REG_INT_IF_MASK,
                                  ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:1333:18: note: Loop condi=
tion is false.  Exiting loop
                   intf_pending =3D FIELD_GET(MCP251XFD_REG_INT_IF_MASK,
                                  ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:1333:18: note: Taking fal=
se branch
                   intf_pending =3D FIELD_GET(MCP251XFD_REG_INT_IF_MASK,
                                  ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \

vim +/error +1551 drivers/media/platform/renesas/rcar_jpu.c

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1489  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1490  /*
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1491   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1492   * IRQ handler
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1493   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1494   */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1495  static irqreturn_t jpu_irq_handler(int irq, void *dev_id)
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1496  {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1497  	struct jpu *jpu =3D dev_id;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1498  	struct jpu_ctx *curr_ctx;
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1499  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1500  	unsigned int int_status;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1501  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1502  	int_status =3D jpu_read(jpu, JINTS);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1503  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1504  	/* ...spurious interrupt */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1505  	if (!((JINTS_TRANSF_COMPL | JINTS_PROCESS_COMPL | JINTS_ERR) &
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1506  	    int_status))
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1507  		return IRQ_NONE;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1508  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1509  	/* ...clear interrupts */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1510  	jpu_write(jpu, ~(int_status & JINTS_MASK), JINTS);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1511  	if (int_status & (JINTS_ERR | JINTS_PROCESS_COMPL))
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1512  		jpu_write(jpu, JCCMD_JEND, JCCMD);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1513  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1514  	spin_lock(&jpu->lock);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1515  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1516  	if ((int_status & JINTS_PROCESS_COMPL) &&
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1517  	   !(int_status & JINTS_TRANSF_COMPL))
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1518  		goto handled;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1519  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1520  	curr_ctx =3D v4l2_m2m_get_curr_priv(jpu->m2m_dev);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1521  	if (!curr_ctx) {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1522  		/* ...instance is not running */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1523  		dev_err(jpu->dev, "no active context for m2m\n");
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1524  		goto handled;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1525  	}
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1526  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1527  	src_buf =3D v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1528  	dst_buf =3D v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1529  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1530  	if (int_status & JINTS_TRANSF_COMPL) {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1531  		if (curr_ctx->encoder) {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1532  			unsigned long payload_size =3D jpu_read(jpu, JCDTCU) << 16
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1533  						   | jpu_read(jpu, JCDTCM) << 8
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1534  						   | jpu_read(jpu, JCDTCD);
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1535  			vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1536  				payload_size + JPU_JPEG_HDR_SIZE);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1537  		}
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1538  =

2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1539  		dst_buf->field =3D src_buf->field;
d6dd645eae76ee drivers/media/platform/rcar_jpu.c Junghak Sung    2015-11-03=
  1540  		dst_buf->vb2_buf.timestamp =3D src_buf->vb2_buf.timestamp;
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1541  		if (src_buf->flags & V4L2_BUF_FLAG_TIMECODE)
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1542  			dst_buf->timecode =3D src_buf->timecode;
2d7007153f0c9b drivers/media/platform/rcar_jpu.c Junghak Sung    2015-09-22=
  1543  		dst_buf->flags =3D src_buf->flags &
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1544  			(V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_KEYFRAME |
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1545  			 V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME |
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1546  			 V4L2_BUF_FLAG_TSTAMP_SRC_MASK);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1547  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1548  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1549  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1550  	} else if (int_status & JINTS_ERR) {
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
 @1551  		unsigned char error =3D jpu_read(jpu, JCDERR) & JCDERR_MASK;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1552  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1553  		dev_dbg(jpu->dev, "processing error: %#X: %s\n", error,
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1554  			error_to_text[error]);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1555  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1556  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1557  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1558  	}
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1559  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1560  	jpu->curr =3D NULL;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1561  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1562  	/* ...reset JPU after completion */
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1563  	jpu_write(jpu, JCCMD_SRST, JCCMD);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1564  	spin_unlock(&jpu->lock);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1565  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1566  	v4l2_m2m_job_finish(jpu->m2m_dev, curr_ctx->fh.m2m_ctx);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1567  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1568  	return IRQ_HANDLED;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1569  =

2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1570  handled:
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1571  	spin_unlock(&jpu->lock);
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1572  	return IRQ_HANDLED;
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1573  }
2c42cdbaec56a9 drivers/media/platform/rcar_jpu.c Mikhail Ulyanov 2015-07-22=
  1574  =


:::::: The code at line 1551 was first introduced by commit
:::::: 2c42cdbaec56a9565a2717b450506150c9c55103 [media] V4L2: platform: Add=
 Renesas R-Car JPEG codec driver

:::::: TO: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0658121807371484877==--

