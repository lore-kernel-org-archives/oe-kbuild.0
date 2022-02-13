Content-Type: multipart/mixed; boundary="===============8181009180769401645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ambarus:spi-nor/next 1/15] drivers/spi/atmel-quadspi.c:1080:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 13 Feb 2022 13:44:49 +0800
Message-ID: <202202131315.EkkujSNQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8181009180769401645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>

tree:   https://github.com/ambarus/linux-0day spi-nor/next
head:   038b3fa2d89f1a00fdb8767704cdb799a0fe746b
commit: ff51c966a3c5144ae964797349747e680ee47c3a [1/15] spi: atmel-quadspi:=
 Add support for sama7g5 QSPI
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-c006-20220210 (https://download.01.org/0day-ci/arc=
hive/20220213/202202131315.EkkujSNQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ambarus/linux-0day/commit/ff51c966a3c5144ae964=
797349747e680ee47c3a
        git remote add ambarus https://github.com/ambarus/linux-0day
        git fetch --no-tags ambarus spi-nor/next
        git checkout ff51c966a3c5144ae964797349747e680ee47c3a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/misc/habanalabs/goya/goya.c:1512:2: warning: Value stored to 'va=
l' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D RREG32(tpc_slm_offset);
           ^
   drivers/misc/habanalabs/goya/goya.c:1512:2: note: Value stored to 'val' =
is never read
   drivers/misc/habanalabs/goya/goya.c:4250:2: warning: Value stored to 'i'=
 is never read [clang-analyzer-deadcode.DeadStores]
           i =3D RREG32(mmSYNC_MNGR_SOB_OBJ_0);
           ^
   drivers/misc/habanalabs/goya/goya.c:4250:2: note: Value stored to 'i' is=
 never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   kernel/trace/trace_printk.c:77:5: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(fmt, *iter);
                                   ^~~~~~
   kernel/trace/trace_printk.c:77:5: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                                   strcpy(fmt, *iter);
                                   ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (7 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/spi/atmel-quadspi.c:1080:3: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   ret =3D  readl_poll_timeout(aq->regs + QSPI_SR2, val,
                   ^
   drivers/spi/atmel-quadspi.c:1080:3: note: Value stored to 'ret' is never=
 read
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/spi/spi-axi-spi-engine.c:324:4: warning: Array access (from vari=
able 'buf') results in a null pointer dereference [clang-analyzer-core.Null=
Dereference]
                           writel_relaxed(buf[i], addr);
                           ^
   arch/riscv/include/asm/mmio.h:120:45: note: expanded from macro 'writel_=
relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __i=
o_raw(); })
                                                  ^
   arch/riscv/include/asm/mmio.h:93:59: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                    ^
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_=
to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                    ^
   drivers/spi/spi-axi-spi-engine.c:425:2: note: Calling 'spi_engine_compil=
e_message'
           spi_engine_compile_message(spi_engine, msg, true, &p_dry);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:215:2: note: Loop condition is false. E=
xecution continues on line 238
           list_for_each_entry(xfer, &msg->transfers, transfer_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-axi-spi-engine.c:238:2: note: Returning without writing =
to 'spi_engine->tx_length', which participates in a condition later
           return 0;
           ^
   drivers/spi/spi-axi-spi-engine.c:238:2: note: Returning without writing =
to 'spi_engine->tx_buf'
   drivers/spi/spi-axi-spi-engine.c:425:2: note: Returning from 'spi_engine=
_compile_message'
           spi_engine_compile_message(spi_engine, msg, true, &p_dry);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:429:6: note: Assuming 'p' is non-null
           if (!p)
               ^~
   drivers/spi/spi-axi-spi-engine.c:429:2: note: Taking false branch
           if (!p)
           ^
   drivers/spi/spi-axi-spi-engine.c:431:2: note: Calling 'spi_engine_compil=
e_message'
           spi_engine_compile_message(spi_engine, msg, false, p);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:215:2: note: Loop condition is false. E=
xecution continues on line 238
           list_for_each_entry(xfer, &msg->transfers, transfer_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-axi-spi-engine.c:238:2: note: Returning without writing =
to 'spi_engine->tx_length', which participates in a condition later
           return 0;
           ^
   drivers/spi/spi-axi-spi-engine.c:238:2: note: Returning without writing =
to 'spi_engine->tx_buf'
   drivers/spi/spi-axi-spi-engine.c:431:2: note: Returning from 'spi_engine=
_compile_message'
           spi_engine_compile_message(spi_engine, msg, false, p);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:433:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&spi_engine->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/spi/spi-axi-spi-engine.c:433:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&spi_engine->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/spi/spi-axi-spi-engine.c:443:6: note: Calling 'spi_engine_write_=
cmd_fifo'
           if (spi_engine_write_cmd_fifo(spi_engine))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:299:6: note: Loop condition is false.  =
Exiting loop
           n =3D readl_relaxed(spi_engine->base + SPI_ENGINE_REG_CMD_FIFO_R=
OOM);
               ^
   arch/riscv/include/asm/mmio.h:116:38: note: expanded from macro 'readl_r=
elaxed'
   #define readl_relaxed(c)        ({ u32 __v; __io_rbr(); __v =3D readl_cp=
u(c); __io_rar(); __v; })
                                               ^
   arch/riscv/include/asm/mmio.h:109:21: note: expanded from macro '__io_rb=
r'
   #define __io_rbr()              do {} while (0)
                                   ^
   drivers/spi/spi-axi-spi-engine.c:299:6: note: Loop condition is false.  =
Exiting loop
           n =3D readl_relaxed(spi_engine->base + SPI_ENGINE_REG_CMD_FIFO_R=
OOM);
               ^
   arch/riscv/include/asm/mmio.h:116:70: note: expanded from macro 'readl_r=
elaxed'
   #define readl_relaxed(c)        ({ u32 __v; __io_rbr(); __v =3D readl_cp=
u(c); __io_rar(); __v; })
                                                                           =
    ^
   arch/riscv/include/asm/mmio.h:110:21: note: expanded from macro '__io_ra=
r'
   #define __io_rar()              do {} while (0)
                                   ^
   drivers/spi/spi-axi-spi-engine.c:300:9: note: Assuming 'n' is 0
           while (n && spi_engine->cmd_length) {
                  ^
   drivers/spi/spi-axi-spi-engine.c:300:11: note: Left side of '&&' is false
           while (n && spi_engine->cmd_length) {

vim +/ret +1080 drivers/spi/atmel-quadspi.c

ff51c966a3c514 Tudor Ambarus 2020-10-19  1064  =

ff51c966a3c514 Tudor Ambarus 2020-10-19  1065  static int atmel_qspi_sama7g=
5_init(struct atmel_qspi *aq)
ff51c966a3c514 Tudor Ambarus 2020-10-19  1066  {
ff51c966a3c514 Tudor Ambarus 2020-10-19  1067  	u32 val;
ff51c966a3c514 Tudor Ambarus 2020-10-19  1068  	int ret;
ff51c966a3c514 Tudor Ambarus 2020-10-19  1069  =

ff51c966a3c514 Tudor Ambarus 2020-10-19  1070  	ret =3D atmel_qspi_set_gclk=
(aq);
ff51c966a3c514 Tudor Ambarus 2020-10-19  1071  	if (ret)
ff51c966a3c514 Tudor Ambarus 2020-10-19  1072  		return ret;
ff51c966a3c514 Tudor Ambarus 2020-10-19  1073  =

ff51c966a3c514 Tudor Ambarus 2020-10-19  1074  	if (aq->caps->octal) {
ff51c966a3c514 Tudor Ambarus 2020-10-19  1075  		ret =3D atmel_qspi_set_pad=
_calibration(aq);
ff51c966a3c514 Tudor Ambarus 2020-10-19  1076  		if (ret)
ff51c966a3c514 Tudor Ambarus 2020-10-19  1077  			return ret;
ff51c966a3c514 Tudor Ambarus 2020-10-19  1078  	} else {
ff51c966a3c514 Tudor Ambarus 2020-10-19  1079  		atmel_qspi_write(QSPI_CR_D=
LLON, aq, QSPI_CR);
ff51c966a3c514 Tudor Ambarus 2020-10-19 @1080  		ret =3D  readl_poll_timeou=
t(aq->regs + QSPI_SR2, val,
ff51c966a3c514 Tudor Ambarus 2020-10-19  1081  					  (val & QSPI_SR2_DLOCK=
), 40,
ff51c966a3c514 Tudor Ambarus 2020-10-19  1082  					  ATMEL_QSPI_TIMEOUT);
ff51c966a3c514 Tudor Ambarus 2020-10-19  1083  	}
ff51c966a3c514 Tudor Ambarus 2020-10-19  1084  =

ff51c966a3c514 Tudor Ambarus 2020-10-19  1085  	/* Set the QSPI controller =
by default in Serial Memory Mode */
ff51c966a3c514 Tudor Ambarus 2020-10-19  1086  	atmel_qspi_write(QSPI_MR_SM=
M | QSPI_MR_DQSDLYEN, aq, QSPI_MR);
ff51c966a3c514 Tudor Ambarus 2020-10-19  1087  	aq->mr =3D QSPI_MR_SMM;
ff51c966a3c514 Tudor Ambarus 2020-10-19  1088  	ret =3D atmel_qspi_update_c=
onfig(aq);
ff51c966a3c514 Tudor Ambarus 2020-10-19  1089  	if (ret)
ff51c966a3c514 Tudor Ambarus 2020-10-19  1090  		return ret;
ff51c966a3c514 Tudor Ambarus 2020-10-19  1091  =

ff51c966a3c514 Tudor Ambarus 2020-10-19  1092  	/* Enable the QSPI controll=
er. */
ff51c966a3c514 Tudor Ambarus 2020-10-19  1093  	atmel_qspi_write(QSPI_CR_QS=
PIEN, aq, QSPI_CR);
ff51c966a3c514 Tudor Ambarus 2020-10-19  1094  	ret =3D readl_poll_timeout(=
aq->regs + QSPI_SR2, val,
ff51c966a3c514 Tudor Ambarus 2020-10-19  1095  				 val & QSPI_SR2_QSPIENS,=
 40,
ff51c966a3c514 Tudor Ambarus 2020-10-19  1096  				 ATMEL_QSPI_SYNC_TIMEOUT=
);
ff51c966a3c514 Tudor Ambarus 2020-10-19  1097  	if (ret)
ff51c966a3c514 Tudor Ambarus 2020-10-19  1098  		return ret;
ff51c966a3c514 Tudor Ambarus 2020-10-19  1099  =

ff51c966a3c514 Tudor Ambarus 2020-10-19  1100  	if (aq->caps->octal) {
ff51c966a3c514 Tudor Ambarus 2020-10-19  1101  		ret =3D readl_poll_timeout=
(aq->regs + QSPI_SR, val,
ff51c966a3c514 Tudor Ambarus 2020-10-19  1102  					 val & QSPI_SR_RFRSHD, =
40,
ff51c966a3c514 Tudor Ambarus 2020-10-19  1103  					 ATMEL_QSPI_TIMEOUT);
ff51c966a3c514 Tudor Ambarus 2020-10-19  1104  	}
ff51c966a3c514 Tudor Ambarus 2020-10-19  1105  =

ff51c966a3c514 Tudor Ambarus 2020-10-19  1106  	atmel_qspi_write(QSPI_TOUT_=
TCNTM, aq, QSPI_TOUT);
ff51c966a3c514 Tudor Ambarus 2020-10-19  1107  	return ret;
ff51c966a3c514 Tudor Ambarus 2020-10-19  1108  }
ff51c966a3c514 Tudor Ambarus 2020-10-19  1109  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8181009180769401645==--

