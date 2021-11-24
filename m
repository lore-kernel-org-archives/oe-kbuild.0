Content-Type: multipart/mixed; boundary="===============2447899720754873587=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/amba/bus.c:377:22: warning: Value stored to 'node' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 24 Nov 2021 21:09:27 +0800
Message-ID: <202111242156.mC9wrRLR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2447899720754873587==
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
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: 854f695c3d41853eb7efcd436023c5ab92a257eb ARM: 9119/1: amba: Properl=
y handle device probe without IRQ domain
date:   5 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20211123 (https://download.01.org/0day-ci/archi=
ve/20211124/202111242156.mC9wrRLR-lkp(a)intel.com/config)
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
                                 ^
   security/integrity/ima/ima_api.c:325:6: note: Assuming the condition is =
false
           if (iint->measured_pcrs & (0x1 << pcr) && !modsig)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:325:41: note: Left side of '&&' is false
           if (iint->measured_pcrs & (0x1 << pcr) && !modsig)
                                                  ^
   security/integrity/ima/ima_api.c:328:11: note: Calling 'ima_alloc_init_t=
emplate'
           result =3D ima_alloc_init_template(&event_data, &entry, template=
_desc);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   security/integrity/ima/ima_api.c:45:6: note: Assuming 'desc' is non-null
           if (desc)
               ^~~~
   security/integrity/ima/ima_api.c:45:2: note: Taking true branch
           if (desc)
           ^
   security/integrity/ima/ima_api.c:52:6: note: Assuming the condition is f=
alse
           if (!*entry)
               ^~~~~~~
   security/integrity/ima/ima_api.c:52:2: note: Taking false branch
           if (!*entry)
           ^
   security/integrity/ima/ima_api.c:55:29: note: Assuming 'ima_tpm_chip' is=
 equal to null
           digests =3D kcalloc(NR_BANKS(ima_tpm_chip) + ima_extra_slots,
                                      ^
   security/integrity/ima/ima.h:44:26: note: expanded from macro 'NR_BANKS'
   #define NR_BANKS(chip) ((chip !=3D NULL) ? chip->nr_allocated_banks : 0)
                            ^~~~~~~~~~~~
   security/integrity/ima/ima_api.c:55:20: note: '?' condition is false
           digests =3D kcalloc(NR_BANKS(ima_tpm_chip) + ima_extra_slots,
                             ^
   security/integrity/ima/ima.h:44:25: note: expanded from macro 'NR_BANKS'
   #define NR_BANKS(chip) ((chip !=3D NULL) ? chip->nr_allocated_banks : 0)
                           ^
   security/integrity/ima/ima_api.c:57:6: note: Assuming 'digests' is non-n=
ull
           if (!digests) {
               ^~~~~~~~
   security/integrity/ima/ima_api.c:57:2: note: Taking false branch
           if (!digests) {
           ^
   security/integrity/ima/ima_api.c:65:14: note: Assuming 'i' is < field 'n=
um_fields'
           for (i =3D 0; i < template_desc->num_fields; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:65:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < template_desc->num_fields; i++) {
           ^
   security/integrity/ima/ima_api.c:72:7: note: Assuming 'result' is not eq=
ual to 0
                   if (result !=3D 0)
                       ^~~~~~~~~~~
   security/integrity/ima/ima_api.c:72:3: note: Taking true branch
                   if (result !=3D 0)
                   ^
   security/integrity/ima/ima_api.c:73:4: note: Control jumps to line 81
                           goto out;
                           ^
   security/integrity/ima/ima_api.c:82:2: note: Null pointer value stored t=
o 'entry'
           *entry =3D NULL;
           ^~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:328:11: note: Returning from 'ima_alloc=
_init_template'
           result =3D ima_alloc_init_template(&event_data, &entry, template=
_desc);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   security/integrity/ima/ima_api.c:329:6: note: Assuming 'result' is >=3D 0
           if (result < 0) {
               ^~~~~~~~~~
   security/integrity/ima/ima_api.c:329:2: note: Taking false branch
           if (result < 0) {
           ^
   security/integrity/ima/ima_api.c:335:30: note: Passing null pointer valu=
e via 1st parameter 'entry'
           result =3D ima_store_template(entry, violation, inode, filename,=
 pcr);
                                       ^~~~~
   security/integrity/ima/ima_api.c:335:11: note: Calling 'ima_store_templa=
te'
           result =3D ima_store_template(entry, violation, inode, filename,=
 pcr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   security/integrity/ima/ima_api.c:108:24: note: Access to field 'template=
_desc' results in a dereference of a null pointer (loaded from variable 'en=
try')
           char *template_name =3D entry->template_desc->name;
                                 ^~~~~
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
   4 warnings generated.
   drivers/tty/serial/8250/8250_early.c:46:10: warning: Dereference of null=
 pointer [clang-analyzer-core.NullDereference]
                   return readw(port->membase + offset);
                          ^
   arch/arm/include/asm/io.h:302:32: note: expanded from macro 'readw'
   #define readw(c)                ({ u16 __v =3D readw_relaxed(c); __iormb=
(); __v; })
                                                ^
   arch/arm/include/asm/io.h:293:6: note: expanded from macro 'readw_relaxe=
d'
                                           __raw_readw(c)); __r; })
                                           ^
   arch/arm/include/asm/io.h:59:50: note: expanded from macro '__raw_readw'
   #define __raw_readw(a)         (__chk_io_ptr(a), *(volatile unsigned sho=
rt __force *)(a))
                                                    ^
   drivers/tty/serial/8250/8250_early.c:160:8: note: Assuming field 'membas=
e' is null
           if (!(device->port.membase || device->port.iobase))
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:160:8: note: Left side of '||' is f=
alse
   drivers/tty/serial/8250/8250_early.c:160:6: note: Assuming the condition=
 is false
           if (!(device->port.membase || device->port.iobase))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:160:2: note: Taking false branch
           if (!(device->port.membase || device->port.iobase))
           ^
   drivers/tty/serial/8250/8250_early.c:163:6: note: Assuming field 'baud' =
is 0
           if (!device->baud) {
               ^~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:163:2: note: Taking true branch
           if (!device->baud) {
           ^
   drivers/tty/serial/8250/8250_early.c:168:9: note: Calling 'serial8250_ea=
rly_in'
                   ier =3D serial8250_early_in(port, UART_IER);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:42:2: note: Control jumps to 'case =
7:'  at line 45
           switch (port->iotype) {
           ^
   drivers/tty/serial/8250/8250_early.c:46:10: note: Dereference of null po=
inter
                   return readw(port->membase + offset);
                          ^
   arch/arm/include/asm/io.h:302:32: note: expanded from macro 'readw'
   #define readw(c)                ({ u16 __v =3D readw_relaxed(c); __iormb=
(); __v; })
                                                ^~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:293:6: note: expanded from macro 'readw_relaxe=
d'
                                           __raw_readw(c)); __r; })
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:59:50: note: expanded from macro '__raw_readw'
   #define __raw_readw(a)         (__chk_io_ptr(a), *(volatile unsigned sho=
rt __force *)(a))
                                                    ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from =
macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   drivers/tty/serial/8250/8250_early.c:70:3: warning: Dereference of null =
pointer [clang-analyzer-core.NullDereference]
                   writew(value, port->membase + offset);
                   ^
   arch/arm/include/asm/io.h:306:36: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                                 ^
   arch/arm/include/asm/io.h:298:29: note: expanded from macro 'writew_rela=
xed'
   #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v=
),c)
                                   ^
   arch/arm/include/asm/io.h:60:97: note: expanded from macro '__raw_writew'
   #define __raw_writew(v,a)      ((void)(__chk_io_ptr(a), *(volatile unsig=
ned short __force *)(a) =3D (v)))
                                                                           =
                        ^
   drivers/tty/serial/8250/8250_early.c:160:8: note: Assuming field 'membas=
e' is null
           if (!(device->port.membase || device->port.iobase))
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:160:8: note: Left side of '||' is f=
alse
   drivers/tty/serial/8250/8250_early.c:160:6: note: Assuming the condition=
 is false
           if (!(device->port.membase || device->port.iobase))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:160:2: note: Taking false branch
           if (!(device->port.membase || device->port.iobase))
           ^
   drivers/tty/serial/8250/8250_early.c:163:6: note: Assuming field 'baud' =
is not equal to 0
           if (!device->baud) {
               ^~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:163:2: note: Taking false branch
           if (!device->baud) {
           ^
   drivers/tty/serial/8250/8250_early.c:171:3: note: Calling 'init_port'
                   init_port(device);
                   ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:141:2: note: Calling 'serial8250_ea=
rly_out'
           serial8250_early_out(port, UART_LCR, 0x3);      /* 8n1 */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_early.c:65:2: note: Control jumps to 'case =
7:'  at line 69
           switch (port->iotype) {
           ^

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
--===============2447899720754873587==--

