Content-Type: multipart/mixed; boundary="===============5471906191788643441=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-ci:v3_20220816_patrice_chotard_spi_stm32_qspi_use_qspi_bus_as_8_lines_communication_channel 13/13] drivers/spi/spi-stm32-qspi.c:633:14: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 03 Sep 2022 09:34:34 +0800
Message-ID: <202209030908.2qKSQRix-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5471906191788643441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/s=
pi/spi-stm32-qspi.c:633:14: warning: Assigned value is garbage or undefined=
 [clang-analyzer-core.uninitialized.Assign]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Patrice Chotard <patrice.chotard@foss.st.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_2=
0220816_patrice_chotard_spi_stm32_qspi_use_qspi_bus_as_8_lines_communicatio=
n_channel
head:   b051161f44d414e736fa2b011245441bae9babd7
commit: b051161f44d414e736fa2b011245441bae9babd7 [13/13] spi: stm32_qspi: A=
dd transfer_one_message() spi callback
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: riscv-randconfig-c006-20220901 (https://download.01.org/0day-ci/arc=
hive/20220903/202209030908.2qKSQRix-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/co=
mmit/?id=3Db051161f44d414e736fa2b011245441bae9babd7
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kern=
el/git/broonie/ci.git
        git fetch --no-tags broonie-ci v3_20220816_patrice_chotard_spi_stm3=
2_qspi_use_qspi_bus_as_8_lines_communication_channel
        git checkout b051161f44d414e736fa2b011245441bae9babd7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/mxic_nand.c:409:11: warning: The result of the left=
 shift is undefined because the left operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
                                  OP_CMD_BYTES(0), nfc->regs + SS_CTRL(0));
                                  ^
   drivers/mtd/nand/raw/mxic_nand.c:73:37: note: expanded from macro 'OP_CM=
D_BYTES'
   #define OP_CMD_BYTES(x)         (((x) - 1) << 13)
                                              ^
   arch/riscv/include/asm/mmio.h:144:48: note: expanded from macro 'writel'
   #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
                                         ~~~~~~~~~~~~^~~~~~~~
   arch/riscv/include/asm/mmio.h:93:71: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                    ~~~~~~~=
~~~~~^~
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   drivers/mtd/nand/raw/mxic_nand.c:396:6: note: Assuming 'check_only' is f=
alse
           if (check_only)
               ^~~~~~~~~~
   drivers/mtd/nand/raw/mxic_nand.c:396:2: note: Taking false branch
           if (check_only)
           ^
   drivers/mtd/nand/raw/mxic_nand.c:401:18: note: Assuming 'op_id' is < fie=
ld 'ninstrs'
           for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
                           ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/mxic_nand.c:401:2: note: Loop condition is true.  E=
ntering loop body
           for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
           ^
   drivers/mtd/nand/raw/mxic_nand.c:404:3: note: Control jumps to 'case NAN=
D_OP_CMD_INSTR:'  at line 405
                   switch (instr->type) {
                   ^
   drivers/mtd/nand/raw/mxic_nand.c:409:11: note: The result of the left sh=
ift is undefined because the left operand is negative
                                  OP_CMD_BYTES(0), nfc->regs + SS_CTRL(0));
                                  ^
   drivers/mtd/nand/raw/mxic_nand.c:73:37: note: expanded from macro 'OP_CM=
D_BYTES'
   #define OP_CMD_BYTES(x)         (((x) - 1) << 13)
                                              ^
   arch/riscv/include/asm/mmio.h:144:48: note: expanded from macro 'writel'
   #define writel(v, c)    ({ __io_bw(); writel_cpu((v), (c)); __io_aw(); })
                                         ~~~~~~~~~~~~^~~~~~~~
   arch/riscv/include/asm/mmio.h:93:71: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                    ~~~~~~~=
~~~~~^~
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/spi/spi-stm32-qspi.c:537:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&op, &desc->info.op_tmpl, sizeof(struct spi_mem_op));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32-qspi.c:537:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&op, &desc->info.op_tmpl, sizeof(struct spi_mem_op));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32-qspi.c:583:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&op, 0, sizeof(op));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32-qspi.c:583:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(&op, 0, sizeof(op));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> drivers/spi/spi-stm32-qspi.c:633:14: warning: Assigned value is garbage =
or undefined [clang-analyzer-core.uninitialized.Assign]
           msg->status =3D ret;
                       ^ ~~~
   drivers/spi/spi-stm32-qspi.c:571:2: note: 'ret' declared without an init=
ial value
           int ret;
           ^~~~~~~
   drivers/spi/spi-stm32-qspi.c:573:6: note: Assuming field 'cs_gpiod' is n=
on-null
           if (!spi->cs_gpiod)
               ^~~~~~~~~~~~~~
   drivers/spi/spi-stm32-qspi.c:573:2: note: Taking false branch
           if (!spi->cs_gpiod)
           ^
   drivers/spi/spi-stm32-qspi.c:580:2: note: Loop condition is false. Execu=
tion continues on line 629
           list_for_each_entry(transfer, &msg->transfers, transfer_list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-stm32-qspi.c:633:14: note: Assigned value is garbage or =
undefined
           msg->status =3D ret;
                       ^ ~~~
   drivers/spi/spi-stm32-qspi.c:705:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&dma_cfg, 0, sizeof(dma_cfg));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32-qspi.c:705:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&dma_cfg, 0, sizeof(dma_cfg));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/input/touchscreen/cyttsp4_core.c:806:17: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct device *dev =3D &md->input->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:806:17: note: Value stored to '=
dev' during its initialization is never read
           struct device *dev =3D &md->input->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:876:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ids, 0, si->si_ofs.tch_abs[CY_TCH_T].max * sizeof(int));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:876:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(ids, 0, si->si_ofs.tch_abs[CY_TCH_T].max * sizeof(int));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:990:2: warning: Value stored to=
 'hst_mode' is never read [clang-analyzer-deadcode.DeadStores]
           hst_mode =3D si->xy_mode[CY_REG_BASE];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/cyttsp4_core.c:990:2: note: Value stored to 'h=
st_mode' is never read
           hst_mode =3D si->xy_mode[CY_REG_BASE];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +633 drivers/spi/spi-stm32-qspi.c

b051161f44d414 Patrice Chotard 2022-08-16  563  =

b051161f44d414 Patrice Chotard 2022-08-16  564  static int stm32_qspi_trans=
fer_one_message(struct spi_controller *ctrl,
b051161f44d414 Patrice Chotard 2022-08-16  565  					   struct spi_message =
*msg)
b051161f44d414 Patrice Chotard 2022-08-16  566  {
b051161f44d414 Patrice Chotard 2022-08-16  567  	struct stm32_qspi *qspi =
=3D spi_controller_get_devdata(ctrl);
b051161f44d414 Patrice Chotard 2022-08-16  568  	struct spi_transfer *trans=
fer;
b051161f44d414 Patrice Chotard 2022-08-16  569  	struct spi_device *spi =3D=
 msg->spi;
b051161f44d414 Patrice Chotard 2022-08-16  570  	struct spi_mem_op op;
b051161f44d414 Patrice Chotard 2022-08-16  571  	int ret;
b051161f44d414 Patrice Chotard 2022-08-16  572  =

b051161f44d414 Patrice Chotard 2022-08-16  573  	if (!spi->cs_gpiod)
b051161f44d414 Patrice Chotard 2022-08-16  574  		return -EOPNOTSUPP;
b051161f44d414 Patrice Chotard 2022-08-16  575  =

b051161f44d414 Patrice Chotard 2022-08-16  576  	mutex_lock(&qspi->lock);
b051161f44d414 Patrice Chotard 2022-08-16  577  =

b051161f44d414 Patrice Chotard 2022-08-16  578  	gpiod_set_value_cansleep(s=
pi->cs_gpiod, true);
b051161f44d414 Patrice Chotard 2022-08-16  579  =

b051161f44d414 Patrice Chotard 2022-08-16  580  	list_for_each_entry(transf=
er, &msg->transfers, transfer_list) {
b051161f44d414 Patrice Chotard 2022-08-16  581  		u8 dummy_bytes =3D 0;
b051161f44d414 Patrice Chotard 2022-08-16  582  =

b051161f44d414 Patrice Chotard 2022-08-16  583  		memset(&op, 0, sizeof(op)=
);
b051161f44d414 Patrice Chotard 2022-08-16  584  =

b051161f44d414 Patrice Chotard 2022-08-16  585  		dev_dbg(qspi->dev, "tx_bu=
f:%p tx_nbits:%d rx_buf:%p rx_nbits:%d len:%d dummy_data:%d\n",
b051161f44d414 Patrice Chotard 2022-08-16  586  			transfer->tx_buf, transf=
er->tx_nbits,
b051161f44d414 Patrice Chotard 2022-08-16  587  			transfer->rx_buf, transf=
er->rx_nbits,
b051161f44d414 Patrice Chotard 2022-08-16  588  			transfer->len, transfer-=
>dummy_data);
b051161f44d414 Patrice Chotard 2022-08-16  589  =

b051161f44d414 Patrice Chotard 2022-08-16  590  		/*
b051161f44d414 Patrice Chotard 2022-08-16  591  		 * QSPI hardware supports=
 dummy bytes transfer.
b051161f44d414 Patrice Chotard 2022-08-16  592  		 * If current transfer is=
 dummy byte, merge it with the next
b051161f44d414 Patrice Chotard 2022-08-16  593  		 * transfer in order to t=
ake into account QSPI block constraint
b051161f44d414 Patrice Chotard 2022-08-16  594  		 */
b051161f44d414 Patrice Chotard 2022-08-16  595  		if (transfer->dummy_data)=
 {
b051161f44d414 Patrice Chotard 2022-08-16  596  			op.dummy.buswidth =3D tr=
ansfer->tx_nbits;
b051161f44d414 Patrice Chotard 2022-08-16  597  			op.dummy.nbytes =3D tran=
sfer->len;
b051161f44d414 Patrice Chotard 2022-08-16  598  			dummy_bytes =3D transfer=
->len;
b051161f44d414 Patrice Chotard 2022-08-16  599  =

b051161f44d414 Patrice Chotard 2022-08-16  600  			/* if happens, means tha=
t message is not correctly built */
b051161f44d414 Patrice Chotard 2022-08-16  601  			if (list_is_last(&transf=
er->transfer_list, &msg->transfers))
b051161f44d414 Patrice Chotard 2022-08-16  602  				goto end_of_transfer;
b051161f44d414 Patrice Chotard 2022-08-16  603  =

b051161f44d414 Patrice Chotard 2022-08-16  604  			transfer =3D list_next_e=
ntry(transfer, transfer_list);
b051161f44d414 Patrice Chotard 2022-08-16  605  		}
b051161f44d414 Patrice Chotard 2022-08-16  606  =

b051161f44d414 Patrice Chotard 2022-08-16  607  		op.data.nbytes =3D transf=
er->len;
b051161f44d414 Patrice Chotard 2022-08-16  608  =

b051161f44d414 Patrice Chotard 2022-08-16  609  		if (transfer->rx_buf) {
b051161f44d414 Patrice Chotard 2022-08-16  610  			qspi->fmode =3D CCR_FMOD=
E_INDR;
b051161f44d414 Patrice Chotard 2022-08-16  611  			op.data.buswidth =3D tra=
nsfer->rx_nbits;
b051161f44d414 Patrice Chotard 2022-08-16  612  			op.data.dir =3D SPI_MEM_=
DATA_IN;
b051161f44d414 Patrice Chotard 2022-08-16  613  			op.data.buf.in =3D trans=
fer->rx_buf;
b051161f44d414 Patrice Chotard 2022-08-16  614  		} else {
b051161f44d414 Patrice Chotard 2022-08-16  615  			qspi->fmode =3D CCR_FMOD=
E_INDW;
b051161f44d414 Patrice Chotard 2022-08-16  616  			op.data.buswidth =3D tra=
nsfer->tx_nbits;
b051161f44d414 Patrice Chotard 2022-08-16  617  			op.data.dir =3D SPI_MEM_=
DATA_OUT;
b051161f44d414 Patrice Chotard 2022-08-16  618  			op.data.buf.out =3D tran=
sfer->tx_buf;
b051161f44d414 Patrice Chotard 2022-08-16  619  		}
b051161f44d414 Patrice Chotard 2022-08-16  620  =

b051161f44d414 Patrice Chotard 2022-08-16  621  		ret =3D stm32_qspi_send(s=
pi, &op);
b051161f44d414 Patrice Chotard 2022-08-16  622  		if (ret)
b051161f44d414 Patrice Chotard 2022-08-16  623  			goto end_of_transfer;
b051161f44d414 Patrice Chotard 2022-08-16  624  =

b051161f44d414 Patrice Chotard 2022-08-16  625  		msg->actual_length +=3D t=
ransfer->len + dummy_bytes;
b051161f44d414 Patrice Chotard 2022-08-16  626  	}
b051161f44d414 Patrice Chotard 2022-08-16  627  =

b051161f44d414 Patrice Chotard 2022-08-16  628  end_of_transfer:
b051161f44d414 Patrice Chotard 2022-08-16  629  	gpiod_set_value_cansleep(s=
pi->cs_gpiod, false);
b051161f44d414 Patrice Chotard 2022-08-16  630  =

b051161f44d414 Patrice Chotard 2022-08-16  631  	mutex_unlock(&qspi->lock);
b051161f44d414 Patrice Chotard 2022-08-16  632  =

b051161f44d414 Patrice Chotard 2022-08-16 @633  	msg->status =3D ret;
b051161f44d414 Patrice Chotard 2022-08-16  634  	spi_finalize_current_messa=
ge(ctrl);
b051161f44d414 Patrice Chotard 2022-08-16  635  =

b051161f44d414 Patrice Chotard 2022-08-16  636  	return ret;
b051161f44d414 Patrice Chotard 2022-08-16  637  }
b051161f44d414 Patrice Chotard 2022-08-16  638  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5471906191788643441==--

