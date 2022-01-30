Content-Type: multipart/mixed; boundary="===============7248207163493680776=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/nand/raw/renesas-nand-controller.c:874:4: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Sun, 30 Jan 2022 23:49:04 +0800
Message-ID: <202201302341.Chr1Ew2W-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7248207163493680776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   24f4db1f3a2725a6308105081d822b26889e1018
commit: d8701fe890ecbab239086e7053d62d0f08587d7c mtd: rawnand: renesas: Add=
 new NAND controller driver
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220130 (https://download.01.org/0day-ci/archi=
ve/20220130/202201302341.Chr1Ew2W-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd8701fe890ecbab239086e7053d62d0f08587d7c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d8701fe890ecbab239086e7053d62d0f08587d7c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~
   drivers/mmc/host/sh_mmcif.c:830:2: note: Taking false branch
           if (data) {
           ^
   drivers/mmc/host/sh_mmcif.c:860:6: note: Assuming 'opc' is not equal to =
MMC_WRITE_BLOCK
           if (opc =3D=3D MMC_WRITE_BLOCK || opc =3D=3D MMC_WRITE_MULTIPLE_=
BLOCK)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:860:6: note: Left side of '||' is false
   drivers/mmc/host/sh_mmcif.c:860:32: note: Assuming 'opc' is not equal to=
 MMC_WRITE_MULTIPLE_BLOCK
           if (opc =3D=3D MMC_WRITE_BLOCK || opc =3D=3D MMC_WRITE_MULTIPLE_=
BLOCK)
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:860:2: note: Taking false branch
           if (opc =3D=3D MMC_WRITE_BLOCK || opc =3D=3D MMC_WRITE_MULTIPLE_=
BLOCK)
           ^
   drivers/mmc/host/sh_mmcif.c:863:6: note: Assuming 'opc' is equal to MMC_=
READ_MULTIPLE_BLOCK
           if (opc =3D=3D MMC_READ_MULTIPLE_BLOCK || opc =3D=3D MMC_WRITE_M=
ULTIPLE_BLOCK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:863:37: note: Left side of '||' is true
           if (opc =3D=3D MMC_READ_MULTIPLE_BLOCK || opc =3D=3D MMC_WRITE_M=
ULTIPLE_BLOCK) {
                                              ^
   drivers/mmc/host/sh_mmcif.c:866:5: note: Access to field 'blocks' result=
s in a dereference of a null pointer (loaded from variable 'data')
                                   data->blocks << 16);
                                   ^~~~
   drivers/mmc/host/sh_mmcif.c:971:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:971:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:994:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:994:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1085:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1085:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1179:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1179:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1285:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:1285:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   1 warning generated.
   drivers/mtd/nand/raw/mxic_nand.c:409:11: warning: The result of the left=
 shift is undefined because the left operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
                                  OP_CMD_BYTES(0), nfc->regs + SS_CTRL(0));
                                  ^
   drivers/mtd/nand/raw/mxic_nand.c:73:37: note: expanded from macro 'OP_CM=
D_BYTES'
   #define OP_CMD_BYTES(x)         (((x) - 1) << 13)
                                              ^
   arch/arm/include/asm/io.h:308:51: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                                 ~~~~~~~~~~~~~~~^~~~
   arch/arm/include/asm/io.h:300:68: note: expanded from macro 'writel_rela=
xed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v=
),c)
                                                              ~~~~~~~~~~~~^~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from =
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
   arch/arm/include/asm/io.h:308:51: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                                 ~~~~~~~~~~~~~~~^~~~
   arch/arm/include/asm/io.h:300:68: note: expanded from macro 'writel_rela=
xed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v=
),c)
                                                              ~~~~~~~~~~~~^~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
   1 warning generated.
>> drivers/mtd/nand/raw/renesas-nand-controller.c:874:4: warning: Null poin=
ter passed as 2nd argument to memory copy function [clang-analyzer-unix.cst=
ring.NullArg]
                           memcpy(&last_bytes, rop.buf + (words * sizeof(u3=
2)), remainder);
                           ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/nand/raw/renesas-nand-controller.c:698:6: note: Assuming 'ch=
eck_only' is false
           if (!check_only)
               ^~~~~~~~~~~
   drivers/mtd/nand/raw/renesas-nand-controller.c:698:2: note: Taking true =
branch
           if (!check_only)
           ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:701:18: note: Assuming 'o=
p_id' is < field 'ninstrs'
           for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
                           ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/renesas-nand-controller.c:701:2: note: Loop conditi=
on is true.  Entering loop body
           for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
           ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:706:3: note: Control jump=
s to 'case NAND_OP_DATA_OUT_INSTR:'  at line 782
                   switch (instr->type) {
                   ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:784:4: note: Value assign=
ed to 'rop.buf'
                           rop.buf =3D instr->ctx.data.buf.in;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/renesas-nand-controller.c:788:4: note: Control jump=
s to 'case 0:'  at line 789
                           switch (data_phase++) {
                           ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:790:9: note: 'cmd_phase' =
is <=3D 2
                                   if (cmd_phase <=3D 2)
                                       ^~~~~~~~~
   drivers/mtd/nand/raw/renesas-nand-controller.c:790:5: note: Taking true =
branch
                                   if (cmd_phase <=3D 2)
                                   ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:792:9: note: 'addr_phase'=
 is <=3D 1
                                   if (addr_phase <=3D 1)
                                       ^~~~~~~~~~
   drivers/mtd/nand/raw/renesas-nand-controller.c:792:5: note: Taking true =
branch
                                   if (addr_phase <=3D 1)
                                   ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:794:9: note: 'delay_phase=
' is equal to 0
                                   if (delay_phase =3D=3D 0)
                                       ^~~~~~~~~~~
   drivers/mtd/nand/raw/renesas-nand-controller.c:794:5: note: Taking true =
branch
                                   if (delay_phase =3D=3D 0)
                                   ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:796:5: note:  Execution c=
ontinues on line 800
                                   break;
                                   ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:800:4: note:  Execution c=
ontinues on line 701
                           break;
                           ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:701:18: note: Assuming 'o=
p_id' is >=3D field 'ninstrs'
           for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
                           ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/renesas-nand-controller.c:701:2: note: Loop conditi=
on is false. Execution continues on line 829
           for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
           ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:829:6: note: Assuming fie=
ld 'buf' is null
           if (rop.buf && !rop.read)
               ^~~~~~~
   drivers/mtd/nand/raw/renesas-nand-controller.c:829:14: note: Left side o=
f '&&' is false
           if (rop.buf && !rop.read)
                       ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:832:18: note: Taking fals=
e branch
                   rop.command |=3D COMMAND_SEQ_GEN_IN;
                                  ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:27:32: note: expanded fro=
m macro 'COMMAND_SEQ_GEN_IN'
   #define     COMMAND_SEQ_GEN_IN COMMAND_SEQ_18
                                  ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:25:28: note: expanded fro=
m macro 'COMMAND_SEQ_18'
   #define     COMMAND_SEQ_18 COMMAND_SEQ(0x32)
                              ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:22:26: note: expanded fro=
m macro 'COMMAND_SEQ'
   #define   COMMAND_SEQ(x) FIELD_PREP(GENMASK(5, 0), (x))
                            ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:832:18: note: Loop condit=
ion is false.  Exiting loop
                   rop.command |=3D COMMAND_SEQ_GEN_IN;
                                  ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:27:32: note: expanded fro=
m macro 'COMMAND_SEQ_GEN_IN'
   #define     COMMAND_SEQ_GEN_IN COMMAND_SEQ_18
                                  ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:25:28: note: expanded fro=
m macro 'COMMAND_SEQ_18'
   #define     COMMAND_SEQ_18 COMMAND_SEQ(0x32)
                              ^
   drivers/mtd/nand/raw/renesas-nand-controller.c:22:26: note: expanded fro=
m macro 'COMMAND_SEQ'
   #define   COMMAND_SEQ(x) FIELD_PREP(GENMASK(5, 0), (x))
                            ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^

vim +874 drivers/mtd/nand/raw/renesas-nand-controller.c

d8701fe890ecba Miquel Raynal 2021-12-17  677  =

d8701fe890ecba Miquel Raynal 2021-12-17  678  /*
d8701fe890ecba Miquel Raynal 2021-12-17  679   * This controller is simple =
enough and thus does not need to use the parser
d8701fe890ecba Miquel Raynal 2021-12-17  680   * provided by the core, inst=
ead, handle every situation here.
d8701fe890ecba Miquel Raynal 2021-12-17  681   */
d8701fe890ecba Miquel Raynal 2021-12-17  682  static int rnandc_exec_op(str=
uct nand_chip *chip,
d8701fe890ecba Miquel Raynal 2021-12-17  683  			  const struct nand_operat=
ion *op, bool check_only)
d8701fe890ecba Miquel Raynal 2021-12-17  684  {
d8701fe890ecba Miquel Raynal 2021-12-17  685  	struct rnandc *rnandc =3D to=
_rnandc(chip->controller);
d8701fe890ecba Miquel Raynal 2021-12-17  686  	const struct nand_op_instr *=
instr =3D NULL;
d8701fe890ecba Miquel Raynal 2021-12-17  687  	struct rnandc_op rop =3D {
d8701fe890ecba Miquel Raynal 2021-12-17  688  		.command =3D COMMAND_INPUT_=
SEL_AHBS,
d8701fe890ecba Miquel Raynal 2021-12-17  689  		.gen_seq_ctrl =3D GEN_SEQ_I=
MD_SEQ,
d8701fe890ecba Miquel Raynal 2021-12-17  690  	};
d8701fe890ecba Miquel Raynal 2021-12-17  691  	unsigned int cmd_phase =3D 0=
, addr_phase =3D 0, data_phase =3D 0,
d8701fe890ecba Miquel Raynal 2021-12-17  692  		delay_phase =3D 0, delays =
=3D 0;
d8701fe890ecba Miquel Raynal 2021-12-17  693  	unsigned int op_id, col_addr=
s, row_addrs, naddrs, remainder, words, i;
d8701fe890ecba Miquel Raynal 2021-12-17  694  	const u8 *addrs;
d8701fe890ecba Miquel Raynal 2021-12-17  695  	u32 last_bytes;
d8701fe890ecba Miquel Raynal 2021-12-17  696  	int ret;
d8701fe890ecba Miquel Raynal 2021-12-17  697  =

d8701fe890ecba Miquel Raynal 2021-12-17  698  	if (!check_only)
d8701fe890ecba Miquel Raynal 2021-12-17  699  		rnandc_select_target(chip, =
op->cs);
d8701fe890ecba Miquel Raynal 2021-12-17  700  =

d8701fe890ecba Miquel Raynal 2021-12-17  701  	for (op_id =3D 0; op_id < op=
->ninstrs; op_id++) {
d8701fe890ecba Miquel Raynal 2021-12-17  702  		instr =3D &op->instrs[op_id=
];
d8701fe890ecba Miquel Raynal 2021-12-17  703  =

d8701fe890ecba Miquel Raynal 2021-12-17  704  		nand_op_trace("  ", instr);
d8701fe890ecba Miquel Raynal 2021-12-17  705  =

d8701fe890ecba Miquel Raynal 2021-12-17  706  		switch (instr->type) {
d8701fe890ecba Miquel Raynal 2021-12-17  707  		case NAND_OP_CMD_INSTR:
d8701fe890ecba Miquel Raynal 2021-12-17  708  			switch (cmd_phase++) {
d8701fe890ecba Miquel Raynal 2021-12-17  709  			case 0:
d8701fe890ecba Miquel Raynal 2021-12-17  710  				rop.command |=3D COMMAND_=
0(instr->ctx.cmd.opcode);
d8701fe890ecba Miquel Raynal 2021-12-17  711  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_CMD0_EN;
d8701fe890ecba Miquel Raynal 2021-12-17  712  				break;
d8701fe890ecba Miquel Raynal 2021-12-17  713  			case 1:
d8701fe890ecba Miquel Raynal 2021-12-17  714  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_COMMAND_3(instr->ctx.cmd.opcode);
d8701fe890ecba Miquel Raynal 2021-12-17  715  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_CMD3_EN;
d8701fe890ecba Miquel Raynal 2021-12-17  716  				if (addr_phase =3D=3D 0)
d8701fe890ecba Miquel Raynal 2021-12-17  717  					addr_phase =3D 1;
d8701fe890ecba Miquel Raynal 2021-12-17  718  				break;
d8701fe890ecba Miquel Raynal 2021-12-17  719  			case 2:
d8701fe890ecba Miquel Raynal 2021-12-17  720  				rop.command |=3D COMMAND_=
2(instr->ctx.cmd.opcode);
d8701fe890ecba Miquel Raynal 2021-12-17  721  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_CMD2_EN;
d8701fe890ecba Miquel Raynal 2021-12-17  722  				if (addr_phase <=3D 1)
d8701fe890ecba Miquel Raynal 2021-12-17  723  					addr_phase =3D 2;
d8701fe890ecba Miquel Raynal 2021-12-17  724  				break;
d8701fe890ecba Miquel Raynal 2021-12-17  725  			case 3:
d8701fe890ecba Miquel Raynal 2021-12-17  726  				rop.command |=3D COMMAND_=
1(instr->ctx.cmd.opcode);
d8701fe890ecba Miquel Raynal 2021-12-17  727  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_CMD1_EN;
d8701fe890ecba Miquel Raynal 2021-12-17  728  				if (addr_phase <=3D 1)
d8701fe890ecba Miquel Raynal 2021-12-17  729  					addr_phase =3D 2;
d8701fe890ecba Miquel Raynal 2021-12-17  730  				if (delay_phase =3D=3D 0)
d8701fe890ecba Miquel Raynal 2021-12-17  731  					delay_phase =3D 1;
d8701fe890ecba Miquel Raynal 2021-12-17  732  				if (data_phase =3D=3D 0)
d8701fe890ecba Miquel Raynal 2021-12-17  733  					data_phase =3D 1;
d8701fe890ecba Miquel Raynal 2021-12-17  734  				break;
d8701fe890ecba Miquel Raynal 2021-12-17  735  			default:
d8701fe890ecba Miquel Raynal 2021-12-17  736  				return -EOPNOTSUPP;
d8701fe890ecba Miquel Raynal 2021-12-17  737  			}
d8701fe890ecba Miquel Raynal 2021-12-17  738  			break;
d8701fe890ecba Miquel Raynal 2021-12-17  739  =

d8701fe890ecba Miquel Raynal 2021-12-17  740  		case NAND_OP_ADDR_INSTR:
d8701fe890ecba Miquel Raynal 2021-12-17  741  			addrs =3D instr->ctx.addr.=
addrs;
d8701fe890ecba Miquel Raynal 2021-12-17  742  			naddrs =3D instr->ctx.addr=
.naddrs;
d8701fe890ecba Miquel Raynal 2021-12-17  743  			if (naddrs > 5)
d8701fe890ecba Miquel Raynal 2021-12-17  744  				return -EOPNOTSUPP;
d8701fe890ecba Miquel Raynal 2021-12-17  745  =

d8701fe890ecba Miquel Raynal 2021-12-17  746  			col_addrs =3D min(2U, nadd=
rs);
d8701fe890ecba Miquel Raynal 2021-12-17  747  			row_addrs =3D naddrs > 2 ?=
 naddrs - col_addrs : 0;
d8701fe890ecba Miquel Raynal 2021-12-17  748  =

d8701fe890ecba Miquel Raynal 2021-12-17  749  			switch (addr_phase++) {
d8701fe890ecba Miquel Raynal 2021-12-17  750  			case 0:
d8701fe890ecba Miquel Raynal 2021-12-17  751  				for (i =3D 0; i < col_add=
rs; i++)
d8701fe890ecba Miquel Raynal 2021-12-17  752  					rop.addr0_col |=3D addrs=
[i] << (i * 8);
d8701fe890ecba Miquel Raynal 2021-12-17  753  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_COL_A0(col_addrs);
d8701fe890ecba Miquel Raynal 2021-12-17  754  =

d8701fe890ecba Miquel Raynal 2021-12-17  755  				for (i =3D 0; i < row_add=
rs; i++)
d8701fe890ecba Miquel Raynal 2021-12-17  756  					rop.addr0_row |=3D addrs=
[2 + i] << (i * 8);
d8701fe890ecba Miquel Raynal 2021-12-17  757  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_ROW_A0(row_addrs);
d8701fe890ecba Miquel Raynal 2021-12-17  758  =

d8701fe890ecba Miquel Raynal 2021-12-17  759  				if (cmd_phase =3D=3D 0)
d8701fe890ecba Miquel Raynal 2021-12-17  760  					cmd_phase =3D 1;
d8701fe890ecba Miquel Raynal 2021-12-17  761  				break;
d8701fe890ecba Miquel Raynal 2021-12-17  762  			case 1:
d8701fe890ecba Miquel Raynal 2021-12-17  763  				for (i =3D 0; i < col_add=
rs; i++)
d8701fe890ecba Miquel Raynal 2021-12-17  764  					rop.addr1_col |=3D addrs=
[i] << (i * 8);
d8701fe890ecba Miquel Raynal 2021-12-17  765  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_COL_A1(col_addrs);
d8701fe890ecba Miquel Raynal 2021-12-17  766  =

d8701fe890ecba Miquel Raynal 2021-12-17  767  				for (i =3D 0; i < row_add=
rs; i++)
d8701fe890ecba Miquel Raynal 2021-12-17  768  					rop.addr1_row |=3D addrs=
[2 + i] << (i * 8);
d8701fe890ecba Miquel Raynal 2021-12-17  769  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_ROW_A1(row_addrs);
d8701fe890ecba Miquel Raynal 2021-12-17  770  =

d8701fe890ecba Miquel Raynal 2021-12-17  771  				if (cmd_phase <=3D 1)
d8701fe890ecba Miquel Raynal 2021-12-17  772  					cmd_phase =3D 2;
d8701fe890ecba Miquel Raynal 2021-12-17  773  				break;
d8701fe890ecba Miquel Raynal 2021-12-17  774  			default:
d8701fe890ecba Miquel Raynal 2021-12-17  775  				return -EOPNOTSUPP;
d8701fe890ecba Miquel Raynal 2021-12-17  776  			}
d8701fe890ecba Miquel Raynal 2021-12-17  777  			break;
d8701fe890ecba Miquel Raynal 2021-12-17  778  =

d8701fe890ecba Miquel Raynal 2021-12-17  779  		case NAND_OP_DATA_IN_INSTR:
d8701fe890ecba Miquel Raynal 2021-12-17  780  			rop.read =3D true;
d8701fe890ecba Miquel Raynal 2021-12-17  781  			fallthrough;
d8701fe890ecba Miquel Raynal 2021-12-17  782  		case NAND_OP_DATA_OUT_INSTR:
d8701fe890ecba Miquel Raynal 2021-12-17  783  			rop.gen_seq_ctrl |=3D GEN_=
SEQ_DATA_EN;
d8701fe890ecba Miquel Raynal 2021-12-17  784  			rop.buf =3D instr->ctx.dat=
a.buf.in;
d8701fe890ecba Miquel Raynal 2021-12-17  785  			rop.len =3D instr->ctx.dat=
a.len;
d8701fe890ecba Miquel Raynal 2021-12-17  786  			rop.command |=3D COMMAND_F=
IFO_SEL;
d8701fe890ecba Miquel Raynal 2021-12-17  787  =

d8701fe890ecba Miquel Raynal 2021-12-17  788  			switch (data_phase++) {
d8701fe890ecba Miquel Raynal 2021-12-17  789  			case 0:
d8701fe890ecba Miquel Raynal 2021-12-17  790  				if (cmd_phase <=3D 2)
d8701fe890ecba Miquel Raynal 2021-12-17  791  					cmd_phase =3D 3;
d8701fe890ecba Miquel Raynal 2021-12-17  792  				if (addr_phase <=3D 1)
d8701fe890ecba Miquel Raynal 2021-12-17  793  					addr_phase =3D 2;
d8701fe890ecba Miquel Raynal 2021-12-17  794  				if (delay_phase =3D=3D 0)
d8701fe890ecba Miquel Raynal 2021-12-17  795  					delay_phase =3D 1;
d8701fe890ecba Miquel Raynal 2021-12-17  796  				break;
d8701fe890ecba Miquel Raynal 2021-12-17  797  			default:
d8701fe890ecba Miquel Raynal 2021-12-17  798  				return -EOPNOTSUPP;
d8701fe890ecba Miquel Raynal 2021-12-17  799  			}
d8701fe890ecba Miquel Raynal 2021-12-17  800  			break;
d8701fe890ecba Miquel Raynal 2021-12-17  801  =

d8701fe890ecba Miquel Raynal 2021-12-17  802  		case NAND_OP_WAITRDY_INSTR:
d8701fe890ecba Miquel Raynal 2021-12-17  803  			switch (delay_phase++) {
d8701fe890ecba Miquel Raynal 2021-12-17  804  			case 0:
d8701fe890ecba Miquel Raynal 2021-12-17  805  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_DELAY0_EN;
d8701fe890ecba Miquel Raynal 2021-12-17  806  =

d8701fe890ecba Miquel Raynal 2021-12-17  807  				if (cmd_phase <=3D 2)
d8701fe890ecba Miquel Raynal 2021-12-17  808  					cmd_phase =3D 3;
d8701fe890ecba Miquel Raynal 2021-12-17  809  				break;
d8701fe890ecba Miquel Raynal 2021-12-17  810  			case 1:
d8701fe890ecba Miquel Raynal 2021-12-17  811  				rop.gen_seq_ctrl |=3D GEN=
_SEQ_DELAY1_EN;
d8701fe890ecba Miquel Raynal 2021-12-17  812  =

d8701fe890ecba Miquel Raynal 2021-12-17  813  				if (cmd_phase <=3D 3)
d8701fe890ecba Miquel Raynal 2021-12-17  814  					cmd_phase =3D 4;
d8701fe890ecba Miquel Raynal 2021-12-17  815  				if (data_phase =3D=3D 0)
d8701fe890ecba Miquel Raynal 2021-12-17  816  					data_phase =3D 1;
d8701fe890ecba Miquel Raynal 2021-12-17  817  				break;
d8701fe890ecba Miquel Raynal 2021-12-17  818  			default:
d8701fe890ecba Miquel Raynal 2021-12-17  819  				return -EOPNOTSUPP;
d8701fe890ecba Miquel Raynal 2021-12-17  820  			}
d8701fe890ecba Miquel Raynal 2021-12-17  821  			break;
d8701fe890ecba Miquel Raynal 2021-12-17  822  		}
d8701fe890ecba Miquel Raynal 2021-12-17  823  	}
d8701fe890ecba Miquel Raynal 2021-12-17  824  =

d8701fe890ecba Miquel Raynal 2021-12-17  825  	/*
d8701fe890ecba Miquel Raynal 2021-12-17  826  	 * Sequence 19 is generic an=
d dedicated to write operations.
d8701fe890ecba Miquel Raynal 2021-12-17  827  	 * Sequence 18 is also gener=
ic and works for all other operations.
d8701fe890ecba Miquel Raynal 2021-12-17  828  	 */
d8701fe890ecba Miquel Raynal 2021-12-17  829  	if (rop.buf && !rop.read)
d8701fe890ecba Miquel Raynal 2021-12-17  830  		rop.command |=3D COMMAND_SE=
Q_GEN_OUT;
d8701fe890ecba Miquel Raynal 2021-12-17  831  	else
d8701fe890ecba Miquel Raynal 2021-12-17  832  		rop.command |=3D COMMAND_SE=
Q_GEN_IN;
d8701fe890ecba Miquel Raynal 2021-12-17  833  =

d8701fe890ecba Miquel Raynal 2021-12-17  834  	if (delays > 1) {
d8701fe890ecba Miquel Raynal 2021-12-17  835  		dev_err(rnandc->dev, "Canno=
t handle more than one wait delay\n");
d8701fe890ecba Miquel Raynal 2021-12-17  836  		return -EOPNOTSUPP;
d8701fe890ecba Miquel Raynal 2021-12-17  837  	}
d8701fe890ecba Miquel Raynal 2021-12-17  838  =

d8701fe890ecba Miquel Raynal 2021-12-17  839  	if (check_only)
d8701fe890ecba Miquel Raynal 2021-12-17  840  		return 0;
d8701fe890ecba Miquel Raynal 2021-12-17  841  =

d8701fe890ecba Miquel Raynal 2021-12-17  842  	rnandc_trigger_op(rnandc, &r=
op);
d8701fe890ecba Miquel Raynal 2021-12-17  843  =

d8701fe890ecba Miquel Raynal 2021-12-17  844  	words =3D rop.len / sizeof(u=
32);
d8701fe890ecba Miquel Raynal 2021-12-17  845  	remainder =3D rop.len % size=
of(u32);
d8701fe890ecba Miquel Raynal 2021-12-17  846  	if (rop.buf && rop.read) {
d8701fe890ecba Miquel Raynal 2021-12-17  847  		while (!FIFO_STATE_C_EMPTY(=
readl(rnandc->regs + FIFO_STATE_REG)))
d8701fe890ecba Miquel Raynal 2021-12-17  848  			cpu_relax();
d8701fe890ecba Miquel Raynal 2021-12-17  849  =

d8701fe890ecba Miquel Raynal 2021-12-17  850  		while (FIFO_STATE_R_EMPTY(r=
eadl(rnandc->regs + FIFO_STATE_REG)))
d8701fe890ecba Miquel Raynal 2021-12-17  851  			cpu_relax();
d8701fe890ecba Miquel Raynal 2021-12-17  852  =

d8701fe890ecba Miquel Raynal 2021-12-17  853  		ioread32_rep(rnandc->regs +=
 FIFO_DATA_REG, rop.buf, words);
d8701fe890ecba Miquel Raynal 2021-12-17  854  		if (remainder) {
d8701fe890ecba Miquel Raynal 2021-12-17  855  			last_bytes =3D readl_relax=
ed(rnandc->regs + FIFO_DATA_REG);
d8701fe890ecba Miquel Raynal 2021-12-17  856  			memcpy(rop.buf + (words * =
sizeof(u32)), &last_bytes,
d8701fe890ecba Miquel Raynal 2021-12-17  857  			       remainder);
d8701fe890ecba Miquel Raynal 2021-12-17  858  		}
d8701fe890ecba Miquel Raynal 2021-12-17  859  =

d8701fe890ecba Miquel Raynal 2021-12-17  860  		if (!FIFO_STATE_R_EMPTY(rea=
dl(rnandc->regs + FIFO_STATE_REG))) {
d8701fe890ecba Miquel Raynal 2021-12-17  861  			dev_warn(rnandc->dev,
d8701fe890ecba Miquel Raynal 2021-12-17  862  				 "Clearing residual data =
in the read FIFO\n");
d8701fe890ecba Miquel Raynal 2021-12-17  863  			rnandc_clear_fifo(rnandc);
d8701fe890ecba Miquel Raynal 2021-12-17  864  		}
d8701fe890ecba Miquel Raynal 2021-12-17  865  	} else if (rop.len && !rop.r=
ead) {
d8701fe890ecba Miquel Raynal 2021-12-17  866  		while (FIFO_STATE_W_FULL(re=
adl(rnandc->regs + FIFO_STATE_REG)))
d8701fe890ecba Miquel Raynal 2021-12-17  867  			cpu_relax();
d8701fe890ecba Miquel Raynal 2021-12-17  868  =

d8701fe890ecba Miquel Raynal 2021-12-17  869  		iowrite32_rep(rnandc->regs =
+ FIFO_DATA_REG, rop.buf,
d8701fe890ecba Miquel Raynal 2021-12-17  870  			      DIV_ROUND_UP(rop.len=
, 4));
d8701fe890ecba Miquel Raynal 2021-12-17  871  =

d8701fe890ecba Miquel Raynal 2021-12-17  872  		if (remainder) {
d8701fe890ecba Miquel Raynal 2021-12-17  873  			last_bytes =3D 0;
d8701fe890ecba Miquel Raynal 2021-12-17 @874  			memcpy(&last_bytes, rop.bu=
f + (words * sizeof(u32)), remainder);
d8701fe890ecba Miquel Raynal 2021-12-17  875  			writel_relaxed(last_bytes,=
 rnandc->regs + FIFO_DATA_REG);
d8701fe890ecba Miquel Raynal 2021-12-17  876  		}
d8701fe890ecba Miquel Raynal 2021-12-17  877  =

d8701fe890ecba Miquel Raynal 2021-12-17  878  		while (!FIFO_STATE_W_EMPTY(=
readl(rnandc->regs + FIFO_STATE_REG)))
d8701fe890ecba Miquel Raynal 2021-12-17  879  			cpu_relax();
d8701fe890ecba Miquel Raynal 2021-12-17  880  	}
d8701fe890ecba Miquel Raynal 2021-12-17  881  =

d8701fe890ecba Miquel Raynal 2021-12-17  882  	ret =3D rnandc_wait_end_of_o=
p(rnandc, chip);
d8701fe890ecba Miquel Raynal 2021-12-17  883  	if (ret)
d8701fe890ecba Miquel Raynal 2021-12-17  884  		return ret;
d8701fe890ecba Miquel Raynal 2021-12-17  885  =

d8701fe890ecba Miquel Raynal 2021-12-17  886  	return 0;
d8701fe890ecba Miquel Raynal 2021-12-17  887  }
d8701fe890ecba Miquel Raynal 2021-12-17  888  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7248207163493680776==--

