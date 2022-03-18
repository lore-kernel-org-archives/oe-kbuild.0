Content-Type: multipart/mixed; boundary="===============5963955179371580708=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:cec 352/417] drivers/media/platform/renesas/rcar_jpu.c:1551:17: warning: Value stored to 'error' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 18 Mar 2022 14:08:50 +0800
Message-ID: <202203181456.719UtS65-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5963955179371580708==
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

tree:   git://linuxtv.org/hverkuil/media_tree.git cec
head:   8b429dac2d98bd585ff5af37042d1d9bb104a2eb
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 [352/417] media: platform:=
 place Renesas drivers on a separate dir
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20220317 (https://download.01.org/0day-ci/arc=
hive/20220318/202203181456.719UtS65-lkp(a)intel.com/config)
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
        git fetch --no-tags hverkuil-media-tree cec
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/i2c/busses/i2c-qcom-geni.c:170:6: warning: Value stored to 'm_cm=
d' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           u32 m_cmd =3D readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
               ^~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:170:6: note: Value stored to 'm_cmd' =
during its initialization is never read
           u32 m_cmd =3D readl_relaxed(gi2c->se.base + SE_GENI_M_CMD0);
               ^~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:171:6: warning: Value stored to 'm_st=
at' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           u32 m_stat =3D readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATU=
S);
               ^~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:171:6: note: Value stored to 'm_stat'=
 during its initialization is never read
           u32 m_stat =3D readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATU=
S);
               ^~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:172:6: warning: Value stored to 'geni=
_s' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           u32 geni_s =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
               ^~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:172:6: note: Value stored to 'geni_s'=
 during its initialization is never read
           u32 geni_s =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
               ^~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:173:6: warning: Value stored to 'geni=
_ios' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           u32 geni_ios =3D readl_relaxed(gi2c->se.base + SE_GENI_IOS);
               ^~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:173:6: note: Value stored to 'geni_io=
s' during its initialization is never read
           u32 geni_ios =3D readl_relaxed(gi2c->se.base + SE_GENI_IOS);
               ^~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:178:3: warning: Value stored to 'rx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   rx_st =3D readl_relaxed(gi2c->se.base + SE_DMA_RX_IRQ_ST=
AT);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:178:3: note: Value stored to 'rx_st' =
is never read
   drivers/i2c/busses/i2c-qcom-geni.c:179:3: warning: Value stored to 'tx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   tx_st =3D readl_relaxed(gi2c->se.base + SE_DMA_TX_IRQ_ST=
AT);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:179:3: note: Value stored to 'tx_st' =
is never read
   drivers/i2c/busses/i2c-qcom-geni.c:181:3: warning: Value stored to 'rx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   rx_st =3D readl_relaxed(gi2c->se.base + SE_GENI_RX_FIFO_=
STATUS);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:181:3: note: Value stored to 'rx_st' =
is never read
   drivers/i2c/busses/i2c-qcom-geni.c:182:3: warning: Value stored to 'tx_s=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   tx_st =3D readl_relaxed(gi2c->se.base + SE_GENI_TX_FIFO_=
STATUS);
                   ^
   drivers/i2c/busses/i2c-qcom-geni.c:182:3: note: Value stored to 'tx_st' =
is never read
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
   8 warnings generated.
   drivers/media/dvb-frontends/drxd_hard.c:858:9: warning: The left express=
ion of the compound assignment is an uninitialized value. The computed valu=
e will also be garbage [clang-analyzer-core.uninitialized.Assign]
                   Value &=3D FE_AG_REG_GC1_AGC_DAT__M;
                         ^
   drivers/media/dvb-frontends/drxd_hard.c:2761:8: note: Calling 'ReadIFAgc'
           res =3D ReadIFAgc(state, &value);
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxd_hard.c:855:6: note: Assuming field 'ctr=
lMode' is not equal to AGC_CTRL_OFF
           if (state->if_agc_cfg.ctrlMode !=3D AGC_CTRL_OFF) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxd_hard.c:855:2: note: Taking true branch
           if (state->if_agc_cfg.ctrlMode !=3D AGC_CTRL_OFF) {
           ^
   drivers/media/dvb-frontends/drxd_hard.c:856:3: note: 'Value' declared wi=
thout an initial value
                   u16 Value;
                   ^~~~~~~~~
   drivers/media/dvb-frontends/drxd_hard.c:857:12: note: Calling 'Read16'
                   status =3D Read16(state, FE_AG_REG_GC1_AGC_DAT__A, &Valu=
e, 0);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/dvb-frontends/drxd_hard.c:232:2: note: Taking true branch
           if (i2c_read(state->i2c, adr, mm1, 4, mm2, 2) < 0)
           ^
   drivers/media/dvb-frontends/drxd_hard.c:233:3: note: Returning without w=
riting to '*data'
                   return -1;
                   ^
   drivers/media/dvb-frontends/drxd_hard.c:857:12: note: Returning from 'Re=
ad16'
                   status =3D Read16(state, FE_AG_REG_GC1_AGC_DAT__A, &Valu=
e, 0);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/dvb-frontends/drxd_hard.c:858:9: note: The left expression=
 of the compound assignment is an uninitialized value. The computed value w=
ill also be garbage
                   Value &=3D FE_AG_REG_GC1_AGC_DAT__M;
                   ~~~~~ ^
   drivers/media/dvb-frontends/drxd_hard.c:2259:4: warning: Value stored to=
 'operationMode' is never read [clang-analyzer-deadcode.DeadStores]
                           operationMode |=3D SC_RA_RAM_OP_AUTO_RATE__M;
                           ^
   drivers/media/dvb-frontends/drxd_hard.c:2259:4: note: Value stored to 'o=
perationMode' is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: warning: Value stored to=
 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: note: Value stored to 's=
tatus' is never read
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:4172:2: warning: Value stored to=
 'fec_rs_prescale' is never read [clang-analyzer-deadcode.DeadStores]
           fec_rs_prescale =3D 1;
           ^                 ~
   drivers/media/dvb-frontends/drxk_hard.c:4172:2: note: Value stored to 'f=
ec_rs_prescale' is never read
           fec_rs_prescale =3D 1;
           ^                 ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/tuners/xc5000.c:645:2: warning: 3rd function call argument=
 is an uninitialized value [clang-analyzer-core.CallAndMessage]
           dprintk(1, "*** ADC envelope (0-1023) =3D %d\n", adc_envelope);
           ^
   drivers/media/tuners/xc5000.c:37:2: note: expanded from macro 'dprintk'
           printk(KERN_INFO "%s: " fmt, "xc5000", ## arg)
           ^
   include/linux/printk.h:446:44: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                              ^
   drivers/media/tuners/xc5000.c:1286:2: note: Assuming 'debug' is < 1
           dprintk(1, "%s()\n", __func__);
           ^
   drivers/media/tuners/xc5000.c:36:41: note: expanded from macro 'dprintk'
   #define dprintk(level, fmt, arg...) if (debug >=3D level) \
                                           ^~~~~~~~~~~~~~
   drivers/media/tuners/xc5000.c:1286:2: note: Taking false branch

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

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5963955179371580708==--

