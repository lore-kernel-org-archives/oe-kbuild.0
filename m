Content-Type: multipart/mixed; boundary="===============6423224034740145177=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/amba/bus.c:377:22: warning: Value stored to 'node' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 27 Nov 2021 17:01:47 +0800
Message-ID: <202111271637.C6cT64wS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6423224034740145177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Wang Kefeng <wangkefeng.wang@huawei.com>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 854f695c3d41853eb7efcd436023c5ab92a257eb ARM: 9119/1: amba: Properl=
y handle device probe without IRQ domain
date:   6 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20211123 (https://download.01.org/0day-ci/archi=
ve/20211127/202111271637.C6cT64wS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e383=
8145dff1ec91c2e67a2cb562775c8d2a08)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D854f695c3d41853eb7efcd436023c5ab92a257eb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 854f695c3d41853eb7efcd436023c5ab92a257eb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                      ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12273:7: note: 'is_narrower_load' is true
                   if (is_narrower_load) {
                       ^~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12273:3: note: Taking true branch
                   if (is_narrower_load) {
                   ^
   kernel/bpf/verifier.c:12276:8: note: 'type' is not equal to BPF_WRITE
                           if (type =3D=3D BPF_WRITE) {
                               ^~~~
   kernel/bpf/verifier.c:12276:4: note: Taking false branch
                           if (type =3D=3D BPF_WRITE) {
                           ^
   kernel/bpf/verifier.c:12282:8: note: 'ctx_field_size' is not equal to 4
                           if (ctx_field_size =3D=3D 4)
                               ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12282:4: note: Taking false branch
                           if (ctx_field_size =3D=3D 4)
                           ^
   kernel/bpf/verifier.c:12284:13: note: 'ctx_field_size' is not equal to 8
                           else if (ctx_field_size =3D=3D 8)
                                    ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12284:9: note: Taking false branch
                           else if (ctx_field_size =3D=3D 8)
                                ^
   kernel/bpf/verifier.c:12294:7: note: Assuming 'cnt' is not equal to 0
                   if (cnt =3D=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf) ||
                       ^~~~~~~~
   kernel/bpf/verifier.c:12294:7: note: Left side of '||' is false
   kernel/bpf/verifier.c:12294:19: note: Assuming the condition is false
                   if (cnt =3D=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf) ||
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12294:7: note: Left side of '||' is false
                   if (cnt =3D=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf) ||
                       ^
   kernel/bpf/verifier.c:12295:8: note: 'ctx_field_size' is not equal to 0
                       (ctx_field_size && !target_size)) {
                        ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12295:8: note: Left side of '&&' is true
   kernel/bpf/verifier.c:12295:26: note: Assuming 'target_size' is not equa=
l to 0
                       (ctx_field_size && !target_size)) {
                                          ^~~~~~~~~~~~
   kernel/bpf/verifier.c:12294:3: note: Taking false branch
                   if (cnt =3D=3D 0 || cnt >=3D ARRAY_SIZE(insn_buf) ||
                   ^
   kernel/bpf/verifier.c:12300:7: note: 'is_narrower_load' is true
                   if (is_narrower_load && size < target_size) {
                       ^~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12300:7: note: Left side of '&&' is true
   kernel/bpf/verifier.c:12300:27: note: Assuming 'size' is < 'target_size'
                   if (is_narrower_load && size < target_size) {
                                           ^~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12300:3: note: Taking true branch
                   if (is_narrower_load && size < target_size) {
                   ^
   kernel/bpf/verifier.c:12303:8: note: Assuming 'shift' is 0
                           if (shift && cnt + 1 >=3D ARRAY_SIZE(insn_buf)) {
                               ^~~~~
   kernel/bpf/verifier.c:12303:14: note: Left side of '&&' is false
                           if (shift && cnt + 1 >=3D ARRAY_SIZE(insn_buf)) {
                                     ^
   kernel/bpf/verifier.c:12307:8: note: 'ctx_field_size' is > 4
                           if (ctx_field_size <=3D 4) {
                               ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12307:4: note: Taking false branch
                           if (ctx_field_size <=3D 4) {
                           ^
   kernel/bpf/verifier.c:12315:9: note: 'shift' is 0
                                   if (shift)
                                       ^~~~~
   kernel/bpf/verifier.c:12315:5: note: Taking false branch
                                   if (shift)
                                   ^
   kernel/bpf/verifier.c:12320:15: note: The result of the left shift is un=
defined due to shifting by '64', which is greater or equal to the width of =
type 'unsigned long long'
                                                                   (1ULL <<=
 size * 8) - 1);
                                                                         ^
   include/linux/filter.h:116:12: note: expanded from macro 'BPF_ALU64_IMM'
                   .imm   =3D IMM })
                            ^~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/amba/bus.c:377:22: warning: Value stored to 'node' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *node =3D dev->dev.of_node;
                               ^~~~   ~~~~~~~~~~~~~~~~
   drivers/amba/bus.c:377:22: note: Value stored to 'node' during its initi=
alization is never read
           struct device_node *node =3D dev->dev.of_node;
                               ^~~~   ~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/mtd/mtdcore.c:660:3: warning: Value stored to 'error' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   error =3D 0;
                   ^       ~
   drivers/mtd/mtdcore.c:660:3: note: Value stored to 'error' is never read
                   error =3D 0;
                   ^       ~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mtd/devices/phram.c:231:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:231:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:315:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(phram_paramline, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:315:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(phram_paramline, val);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/usb/gadget/udc/udc-xilinx.c:632:3: warning: Value stored to 'buf=
ferspace' is never read [clang-analyzer-deadcode.DeadStores]
                   bufferspace -=3D count;
                   ^              ~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:632:3: note: Value stored to 'buffer=
space' is never read
                   bufferspace -=3D count;

vim +/node +377 drivers/amba/bus.c

^1da177e4c3f41 arch/arm/common/amba.c Linus Torvalds 2005-04-16  374  =

854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  375  stati=
c int of_amba_device_decode_irq(struct amba_device *dev)
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  376  {
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23 @377  	stru=
ct device_node *node =3D dev->dev.of_node;
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  378  	int =
i, irq =3D 0;
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  379  =

854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  380  	if (=
IS_ENABLED(CONFIG_OF_IRQ) && node) {
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  381  		/* =
Decode the IRQs and address ranges */
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  382  		for=
 (i =3D 0; i < AMBA_NR_IRQS; i++) {
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  383  			ir=
q =3D of_irq_get(node, i);
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  384  			if=
 (irq < 0) {
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  385  				i=
f (irq =3D=3D -EPROBE_DEFER)
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  386  					=
return irq;
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  387  				i=
rq =3D 0;
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  388  			}
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  389  =

854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  390  			de=
v->irq[i] =3D irq;
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  391  		}
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  392  	}
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  393  =

854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  394  	retu=
rn 0;
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  395  }
854f695c3d4185 drivers/amba/bus.c     Wang Kefeng    2021-08-23  396  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6423224034740145177==--

