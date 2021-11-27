Content-Type: multipart/mixed; boundary="===============1152975113371398246=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-bcm2835.c:153:8: warning: Excessive padding in 'struct bcm2835_spidev' (112 padding bytes, where 48 is optimal).
Date: Sat, 27 Nov 2021 20:56:36 +0800
Message-ID: <202111272007.5gV1WhGq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1152975113371398246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lukas Wunner <lukas@wunner.de>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: ec679bda639fe84b78d473526ae27c74dea383fb spi: bcm2835: Allow arbitr=
ary number of slaves
date:   6 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20211118 (https://download.01.org/0day-ci/archi=
ve/20211127/202111272007.5gV1WhGq-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46bec=
f500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dec679bda639fe84b78d473526ae27c74dea383fb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ec679bda639fe84b78d473526ae27c74dea383fb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (hid_report_len(r) < 64)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-steam.c:137:2: note: Taking false branch
           if (hid_report_len(r) < 64)
           ^
   drivers/hid/hid-steam.c:141:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/hid/hid-steam.c:141:2: note: Taking false branch
           if (!buf)
           ^
   drivers/hid/hid-steam.c:153:6: note: Assuming 'ret' is <=3D 0
           if (ret > 0)
               ^~~~~~~
   drivers/hid/hid-steam.c:153:2: note: Taking false branch
           if (ret > 0)
           ^
   drivers/hid/hid-steam.c:156:2: note: Returning without writing to '*data'
           return ret;
           ^
   drivers/hid/hid-steam.c:243:8: note: Returning from 'steam_recv_report'
           ret =3D steam_recv_report(steam, reply, sizeof(reply));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-steam.c:244:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/hid/hid-steam.c:244:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/hid/hid-steam.c:246:15: note: The left operand of '!=3D' is a ga=
rbage value
           if (reply[0] !=3D 0xae || reply[1] !=3D 0x15 || reply[2] !=3D 0x=
01)
               ~~~~~~~~ ^
   17 warnings generated.
   fs/stat.c:209:20: warning: The left expression of the compound assignmen=
t is an uninitialized value. The computed value will also be garbage [clang=
-analyzer-core.uninitialized.Assign]
           stat->result_mask |=3D STATX_MNT_ID;
                             ^
   fs/stat.c:516:1: note: Calling '__do_sys_lstat64'
   SYSCALL_DEFINE2(lstat64, const char __user *, filename,
   ^
   include/linux/syscalls.h:217:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:248:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/stat.c:520:14: note: Calling 'vfs_lstat'
           int error =3D vfs_lstat(filename, &stat);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3384:9: note: Calling 'vfs_fstatat'
           return vfs_fstatat(AT_FDCWD, name, stat, AT_SYMLINK_NOFOLLOW);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:225:9: note: Calling 'vfs_statx'
           return vfs_statx(dfd, filename, flags | AT_NO_AUTOMOUNT,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:191:2: note: Taking false branch
           if (flags & ~(AT_SYMLINK_NOFOLLOW | AT_NO_AUTOMOUNT | AT_EMPTY_P=
ATH |
           ^
   fs/stat.c:195:2: note: Taking false branch
           if (!(flags & AT_SYMLINK_NOFOLLOW))
           ^
   fs/stat.c:197:2: note: Taking false branch
           if (!(flags & AT_NO_AUTOMOUNT))
           ^
   fs/stat.c:199:2: note: Taking false branch
           if (flags & AT_EMPTY_PATH)
           ^
   fs/stat.c:204:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/stat.c:204:2: note: Taking false branch
           if (error)
           ^
   fs/stat.c:207:10: note: Calling 'vfs_getattr'
           error =3D vfs_getattr(&path, stat, request_mask, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:140:6: note: Assuming 'retval' is not equal to 0
           if (retval)
               ^~~~~~
   fs/stat.c:140:2: note: Taking true branch
           if (retval)
           ^
   fs/stat.c:141:3: note: Returning without writing to 'stat->result_mask'
                   return retval;
                   ^
   fs/stat.c:207:10: note: Returning from 'vfs_getattr'
           error =3D vfs_getattr(&path, stat, request_mask, flags);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/stat.c:209:20: note: The left expression of the compound assignment i=
s an uninitialized value. The computed value will also be garbage
           stat->result_mask |=3D STATX_MNT_ID;
           ~~~~~~~~~~~~~~~~~ ^
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/spi/spi-bcm2835.c:153:8: warning: Excessive padding in 'struct b=
cm2835_spidev' (112 padding bytes, where 48 is optimal). =

   Optimal fields order: =

   clear_rx_cs, =

   prepare_cs, =

   clear_rx_desc, =

   clear_rx_addr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bcm2835_spidev {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:153:8: note: Excessive padding in 'struct bcm2=
835_spidev' (112 padding bytes, where 48 is optimal). Optimal fields order:=
 clear_rx_cs, prepare_cs, clear_rx_desc, clear_rx_addr, consider reordering=
 the fields or adding explicit padding members
   struct bcm2835_spidev {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1164:20: warning: Access to field 'device' res=
ults in a dereference of a null pointer (loaded from field 'dma_rx') [clang=
-analyzer-core.NullDereference]
                   dma_unmap_single(ctlr->dma_rx->device->dev,
                                    ^
   drivers/spi/spi-bcm2835.c:1213:27: note: Calling 'spi_controller_get_dev=
data'
           struct bcm2835_spi *bs =3D spi_controller_get_devdata(ctlr);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi.h:675:2: note: Returning without writing to 'ctlr-=
>dma_rx'
           return dev_get_drvdata(&ctlr->dev);
           ^
   drivers/spi/spi-bcm2835.c:1213:27: note: Returning from 'spi_controller_=
get_devdata'
           struct bcm2835_spi *bs =3D spi_controller_get_devdata(ctlr);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1219:6: note: Assuming 'slv' is non-null
           if (!slv) {
               ^~~~
   drivers/spi/spi-bcm2835.c:1219:2: note: Taking false branch
           if (!slv) {
           ^
   drivers/spi/spi-bcm2835.c:1239:6: note: Assuming the condition is false
           if (spi->mode & SPI_CPOL)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1239:2: note: Taking false branch
           if (spi->mode & SPI_CPOL)
           ^
   drivers/spi/spi-bcm2835.c:1241:6: note: Assuming the condition is false
           if (spi->mode & SPI_CPHA)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1241:2: note: Taking false branch
           if (spi->mode & SPI_CPHA)
           ^
   drivers/spi/spi-bcm2835.c:1249:6: note: Assuming field 'dma_rx' is null
           if (ctlr->dma_rx) {
               ^~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1249:2: note: Taking false branch
           if (ctlr->dma_rx) {
           ^
   drivers/spi/spi-bcm2835.c:1262:6: note: Assuming the condition is false
           if (spi->mode & SPI_NO_CS)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1262:2: note: Taking false branch
           if (spi->mode & SPI_NO_CS)
           ^
   drivers/spi/spi-bcm2835.c:1268:6: note: Assuming field 'cs_gpiod' is null
           if (spi->cs_gpiod)
               ^~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1268:2: note: Taking false branch
           if (spi->cs_gpiod)
           ^
   drivers/spi/spi-bcm2835.c:1270:6: note: Assuming field 'chip_select' is =
<=3D 1
           if (spi->chip_select > 1) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1270:2: note: Taking false branch
           if (spi->chip_select > 1) {
           ^
   drivers/spi/spi-bcm2835.c:1292:6: note: Assuming 'chip' is non-null
           if (!chip)
               ^~~~~
   drivers/spi/spi-bcm2835.c:1292:2: note: Taking false branch
           if (!chip)
           ^
   drivers/spi/spi-bcm2835.c:1299:2: note: Taking true branch
           if (IS_ERR(spi->cs_gpiod)) {
           ^
   drivers/spi/spi-bcm2835.c:1301:3: note: Control jumps to line 1311
                   goto err_cleanup;
                   ^
   drivers/spi/spi-bcm2835.c:1311:2: note: Calling 'bcm2835_spi_cleanup'
           bcm2835_spi_cleanup(spi);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1160:6: note: Assuming field 'clear_rx_desc' i=
s null
           if (slv->clear_rx_desc)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1160:2: note: Taking false branch
           if (slv->clear_rx_desc)
           ^
   drivers/spi/spi-bcm2835.c:1163:6: note: Assuming field 'clear_rx_addr' i=
s not equal to 0
           if (slv->clear_rx_addr)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1163:2: note: Taking true branch
           if (slv->clear_rx_addr)
           ^
   drivers/spi/spi-bcm2835.c:1164:20: note: Access to field 'device' result=
s in a dereference of a null pointer (loaded from field 'dma_rx')
                   dma_unmap_single(ctlr->dma_rx->device->dev,
                                    ^
   include/linux/dma-mapping.h:427:61: note: expanded from macro 'dma_unmap=
_single'
   #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, =
0)
                                                               ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/usb/class/usbtmc.c:159:14: note: Use of memory after it is freed
           usb_put_dev(data->usb_dev);
                       ^~~~~~~~~~~~~
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   mm/gup.c:1264:13: warning: Dereference of null pointer (loaded from vari=
able 'unlocked') [clang-analyzer-core.NullDereference]
                   *unlocked =3D true;
                    ~~~~~~~~ ^
   mm/gup.c:1237:6: note: Assuming 'unlocked' is null
           if (unlocked)
               ^~~~~~~~
   mm/gup.c:1237:2: note: Taking false branch
           if (unlocked)
           ^
   mm/gup.c:1242:6: note: Assuming 'vma' is non-null
           if (!vma || address < vma->vm_start)
               ^~~~
   mm/gup.c:1242:6: note: Left side of '||' is false
   mm/gup.c:1242:14: note: Assuming 'address' is >=3D field 'vm_start'
           if (!vma || address < vma->vm_start)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1242:2: note: Taking false branch
           if (!vma || address < vma->vm_start)
           ^
   mm/gup.c:1245:7: note: Calling 'vma_permits_fault'
           if (!vma_permits_fault(vma, fault_flags))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1179:18: note: Assuming the condition is false
           bool write   =3D !!(fault_flags & FAULT_FLAG_WRITE);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1180:18: note: Assuming the condition is false
           bool foreign =3D !!(fault_flags & FAULT_FLAG_REMOTE);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1181:24: note: 'write' is true
           vm_flags_t vm_flags =3D write ? VM_WRITE : VM_READ;
                                 ^~~~~
   mm/gup.c:1181:24: note: '?' condition is true
   mm/gup.c:1183:6: note: Assuming the condition is false
           if (!(vm_flags & vma->vm_flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1183:2: note: Taking false branch
           if (!(vm_flags & vma->vm_flags))
           ^
   mm/gup.c:1193:7: note: Calling 'arch_vma_access_permitted'
           if (!arch_vma_access_permitted(vma, write, false, foreign))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/mm_hooks.h:29:2: note: Returning the value 1, which =
participates in a condition later
           return true;
           ^~~~~~~~~~~
   mm/gup.c:1193:7: note: Returning from 'arch_vma_access_permitted'
           if (!arch_vma_access_permitted(vma, write, false, foreign))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1193:2: note: Taking false branch
           if (!arch_vma_access_permitted(vma, write, false, foreign))
           ^
   mm/gup.c:1196:2: note: Returning the value 1, which participates in a co=
ndition later
           return true;
           ^~~~~~~~~~~
   mm/gup.c:1245:7: note: Returning from 'vma_permits_fault'
           if (!vma_permits_fault(vma, fault_flags))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1245:2: note: Taking false branch
           if (!vma_permits_fault(vma, fault_flags))
           ^
   mm/gup.c:1248:7: note: Assuming the condition is false
           if ((fault_flags & FAULT_FLAG_KILLABLE) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1248:42: note: Left side of '&&' is false
           if ((fault_flags & FAULT_FLAG_KILLABLE) &&
                                                   ^
   mm/gup.c:1254:6: note: Assuming the condition is false
           if (ret & VM_FAULT_ERROR) {
               ^~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1254:2: note: Taking false branch
           if (ret & VM_FAULT_ERROR) {
           ^
   mm/gup.c:1262:6: note: Assuming the condition is true
           if (ret & VM_FAULT_RETRY) {
               ^~~~~~~~~~~~~~~~~~~~
   mm/gup.c:1262:2: note: Taking true branch
           if (ret & VM_FAULT_RETRY) {
           ^
   mm/gup.c:1264:13: note: Dereference of null pointer (loaded from variabl=
e 'unlocked')
                   *unlocked =3D true;
                    ~~~~~~~~ ^
   Suppressed 18 warnings (17 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/spi/spi-bcm2835.c:153:8: warning: Excessive padding in 'struct b=
cm2835_spidev' (112 padding bytes, where 48 is optimal). =

   Optimal fields order: =

   clear_rx_cs, =

   prepare_cs, =

   clear_rx_desc, =

   clear_rx_addr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bcm2835_spidev {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:153:8: note: Excessive padding in 'struct bcm2=
835_spidev' (112 padding bytes, where 48 is optimal). Optimal fields order:=
 clear_rx_cs, prepare_cs, clear_rx_desc, clear_rx_addr, consider reordering=
 the fields or adding explicit padding members
   struct bcm2835_spidev {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1164:20: warning: Access to field 'device' res=
ults in a dereference of a null pointer (loaded from field 'dma_rx') [clang=
-analyzer-core.NullDereference]
                   dma_unmap_single(ctlr->dma_rx->device->dev,
                                    ^
   drivers/spi/spi-bcm2835.c:1213:27: note: Calling 'spi_controller_get_dev=
data'
           struct bcm2835_spi *bs =3D spi_controller_get_devdata(ctlr);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi.h:675:2: note: Returning without writing to 'ctlr-=
>dma_rx'
           return dev_get_drvdata(&ctlr->dev);
           ^
   drivers/spi/spi-bcm2835.c:1213:27: note: Returning from 'spi_controller_=
get_devdata'
           struct bcm2835_spi *bs =3D spi_controller_get_devdata(ctlr);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1219:6: note: Assuming 'slv' is non-null
           if (!slv) {
               ^~~~
   drivers/spi/spi-bcm2835.c:1219:2: note: Taking false branch
           if (!slv) {
           ^
   drivers/spi/spi-bcm2835.c:1239:6: note: Assuming the condition is false
           if (spi->mode & SPI_CPOL)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1239:2: note: Taking false branch
           if (spi->mode & SPI_CPOL)
           ^
   drivers/spi/spi-bcm2835.c:1241:6: note: Assuming the condition is false
           if (spi->mode & SPI_CPHA)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1241:2: note: Taking false branch
           if (spi->mode & SPI_CPHA)
           ^
   drivers/spi/spi-bcm2835.c:1249:6: note: Assuming field 'dma_rx' is null
           if (ctlr->dma_rx) {
               ^~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1249:2: note: Taking false branch
           if (ctlr->dma_rx) {
           ^
   drivers/spi/spi-bcm2835.c:1262:6: note: Assuming the condition is false
           if (spi->mode & SPI_NO_CS)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1262:2: note: Taking false branch
           if (spi->mode & SPI_NO_CS)
           ^
   drivers/spi/spi-bcm2835.c:1268:6: note: Assuming field 'cs_gpiod' is null
           if (spi->cs_gpiod)
               ^~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1268:2: note: Taking false branch
           if (spi->cs_gpiod)
           ^
   drivers/spi/spi-bcm2835.c:1270:6: note: Assuming field 'chip_select' is =
<=3D 1
           if (spi->chip_select > 1) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1270:2: note: Taking false branch
           if (spi->chip_select > 1) {
           ^
   drivers/spi/spi-bcm2835.c:1292:6: note: Assuming 'chip' is non-null
           if (!chip)
               ^~~~~
   drivers/spi/spi-bcm2835.c:1292:2: note: Taking false branch
           if (!chip)
           ^
   drivers/spi/spi-bcm2835.c:1299:2: note: Taking true branch
           if (IS_ERR(spi->cs_gpiod)) {
           ^
   drivers/spi/spi-bcm2835.c:1301:3: note: Control jumps to line 1311
                   goto err_cleanup;
                   ^
   drivers/spi/spi-bcm2835.c:1311:2: note: Calling 'bcm2835_spi_cleanup'
           bcm2835_spi_cleanup(spi);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1160:6: note: Assuming field 'clear_rx_desc' i=
s null
           if (slv->clear_rx_desc)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1160:2: note: Taking false branch
           if (slv->clear_rx_desc)
           ^
   drivers/spi/spi-bcm2835.c:1163:6: note: Assuming field 'clear_rx_addr' i=
s not equal to 0
           if (slv->clear_rx_addr)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm2835.c:1163:2: note: Taking true branch
           if (slv->clear_rx_addr)
           ^
   drivers/spi/spi-bcm2835.c:1164:20: note: Access to field 'device' result=
s in a dereference of a null pointer (loaded from field 'dma_rx')
                   dma_unmap_single(ctlr->dma_rx->device->dev,
                                    ^
   include/linux/dma-mapping.h:427:61: note: expanded from macro 'dma_unmap=
_single'
   #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, =
0)
                                                               ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +153 drivers/spi/spi-bcm2835.c

ec679bda639fe8 Lukas Wunner 2021-05-27  142  =

ec679bda639fe8 Lukas Wunner 2021-05-27  143  /**
ec679bda639fe8 Lukas Wunner 2021-05-27  144   * struct bcm2835_spidev - BCM=
2835 SPI slave
ec679bda639fe8 Lukas Wunner 2021-05-27  145   * @prepare_cs: precalculated =
CS register value for ->prepare_message()
ec679bda639fe8 Lukas Wunner 2021-05-27  146   *	(uses slave-specific clock =
polarity and phase settings)
ec679bda639fe8 Lukas Wunner 2021-05-27  147   * @clear_rx_desc: preallocate=
d RX DMA descriptor used for TX-only transfers
ec679bda639fe8 Lukas Wunner 2021-05-27  148   *	(cyclically clears RX FIFO =
by writing @clear_rx_cs to CS register)
ec679bda639fe8 Lukas Wunner 2021-05-27  149   * @clear_rx_addr: bus address=
 of @clear_rx_cs
ec679bda639fe8 Lukas Wunner 2021-05-27  150   * @clear_rx_cs: precalculated=
 CS register value to clear RX FIFO
ec679bda639fe8 Lukas Wunner 2021-05-27  151   *	(uses slave-specific clock =
polarity and phase settings)
ec679bda639fe8 Lukas Wunner 2021-05-27  152   */
ec679bda639fe8 Lukas Wunner 2021-05-27 @153  struct bcm2835_spidev {
ec679bda639fe8 Lukas Wunner 2021-05-27  154  	u32 prepare_cs;
ec679bda639fe8 Lukas Wunner 2021-05-27  155  	struct dma_async_tx_descripto=
r *clear_rx_desc;
8259bf667a0f9e Lukas Wunner 2019-09-11  156  	dma_addr_t clear_rx_addr;
ec679bda639fe8 Lukas Wunner 2021-05-27  157  	u32 clear_rx_cs ____cacheline=
_aligned;
f8043872e79614 Chris Boot   2013-03-11  158  };
f8043872e79614 Chris Boot   2013-03-11  159  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1152975113371398246==--

