Content-Type: multipart/mixed; boundary="===============4300218903975191166=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-bcm2835.c:153:8: warning: Excessive padding in 'struct bcm2835_spidev' (112 padding bytes, where 48 is optimal).
Date: Fri, 26 Nov 2021 19:57:53 +0800
Message-ID: <202111261928.bRq1t11d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4300218903975191166==
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
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: ec679bda639fe84b78d473526ae27c74dea383fb spi: bcm2835: Allow arbitr=
ary number of slaves
date:   6 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20211118 (https://download.01.org/0day-ci/archi=
ve/20211126/202111261928.bRq1t11d-lkp(a)intel.com/config)
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
   ipc/sem.c:1496:15: note: Assuming 'i' is < 'nsems'
                   for (i =3D 0; i < nsems; i++) {
                               ^~~~~~~~~
   ipc/sem.c:1496:3: note: Loop condition is true.  Entering loop body
                   for (i =3D 0; i < nsems; i++) {
                   ^
   ipc/sem.c:1497:18: note: The left operand of '>' is a garbage value
                           if (sem_io[i] > SEMVMX) {
                               ~~~~~~~~~ ^
   ipc/sem.c:2023:48: warning: The left operand of '' is a garbage value [c=
lang-analyzer-core.UndefinedBinaryOperatorResult]
                   unsigned long mask =3D 1ULL << ((sop->sem_num) % BITS_PE=
R_LONG);
                                                  ~~~~~~~~~~~~  ^
   ipc/sem.c:1997:6: note: Assuming 'nsops' is >=3D 1
           if (nsops < 1 || semid < 0)
               ^~~~~~~~~
   ipc/sem.c:1997:6: note: Left side of '||' is false
   ipc/sem.c:1997:19: note: Assuming 'semid' is >=3D 0
           if (nsops < 1 || semid < 0)
                            ^~~~~~~~~
   ipc/sem.c:1997:2: note: Taking false branch
           if (nsops < 1 || semid < 0)
           ^
   ipc/sem.c:1999:6: note: Assuming the condition is false
           if (nsops > ns->sc_semopm)
               ^~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1999:2: note: Taking false branch
           if (nsops > ns->sc_semopm)
           ^
   ipc/sem.c:2001:6: note: Assuming 'nsops' is <=3D SEMOPM_FAST
           if (nsops > SEMOPM_FAST) {
               ^~~~~~~~~~~~~~~~~~~
   ipc/sem.c:2001:2: note: Taking false branch
           if (nsops > SEMOPM_FAST) {
           ^
   ipc/sem.c:2007:6: note: Calling 'copy_from_user'
           if (copy_from_user(sops, tsops, nsops * sizeof(*tsops))) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking false branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->s=
em_num'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->s=
em_num'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   ipc/sem.c:2007:6: note: Returning from 'copy_from_user'
           if (copy_from_user(sops, tsops, nsops * sizeof(*tsops))) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:2007:2: note: Taking false branch
           if (copy_from_user(sops, tsops, nsops * sizeof(*tsops))) {
           ^
   ipc/sem.c:2012:6: note: Assuming 'timeout' is null
           if (timeout) {
               ^~~~~~~
   ipc/sem.c:2012:2: note: Taking false branch
           if (timeout) {
           ^
   ipc/sem.c:2022:2: note: Loop condition is true.  Entering loop body
           for (sop =3D sops; sop < sops + nsops; sop++) {
           ^
   ipc/sem.c:2023:48: note: The left operand of '' is a garbage value
                   unsigned long mask =3D 1ULL << ((sop->sem_num) % BITS_PE=
R_LONG);
                                                  ~~~~~~~~~~~~  ^
   Suppressed 16 warnings (16 in non-user code).
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
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
                                                                  ^~~~~~~~~=
~~~~
   note: expanded from here
   drivers/base/cacheinfo.c:284:4: note: Returning from 'cpumask_clear_cpu'
                           cpumask_clear_cpu(sibling, &this_leaf->shared_cp=
u_map);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/base/cacheinfo.c:272:3: note: Loop condition is false. Execution=
 continues on line 286
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:286:3: note: Taking true branch
                   if (of_have_populated_dt())
                   ^
   drivers/base/cacheinfo.c:270:26: note: Loop condition is false.  Exiting=
 loop
           for (index =3D 0; index < cache_leaves(cpu); index++) {
                                   ^
   drivers/base/cacheinfo.c:26:28: note: expanded from macro 'cache_leaves'
   #define cache_leaves(cpu)       (ci_cacheinfo(cpu)->num_leaves)
                                    ^
   drivers/base/cacheinfo.c:25:29: note: expanded from macro 'ci_cacheinfo'
   #define ci_cacheinfo(cpu)       (&per_cpu(ci_cpu_cacheinfo, cpu))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/base/cacheinfo.c:270:18: note: Assuming 'index' is < field 'num_=
leaves'
           for (index =3D 0; index < cache_leaves(cpu); index++) {
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:270:2: note: Loop condition is true.  Entering =
loop body
           for (index =3D 0; index < cache_leaves(cpu); index++) {
           ^
   drivers/base/cacheinfo.c:271:3: note: Value assigned to 'this_leaf'
                   this_leaf =3D this_cpu_ci->info_list + index;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:272:3: note: Loop condition is true.  Entering =
loop body
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:275:8: note: 'sibling' is not equal to 'cpu'
                           if (sibling =3D=3D cpu) /* skip itself */
                               ^~~~~~~
   drivers/base/cacheinfo.c:275:4: note: Taking false branch
                           if (sibling =3D=3D cpu) /* skip itself */
                           ^
   drivers/base/cacheinfo.c:279:8: note: Assuming field 'info_list' is null
                           if (!sib_cpu_ci->info_list)
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:279:4: note: Taking true branch
                           if (!sib_cpu_ci->info_list)
                           ^
   drivers/base/cacheinfo.c:280:5: note:  Execution continues on line 272
                                   continue;
                                   ^
   drivers/base/cacheinfo.c:272:3: note: Loop condition is false. Execution=
 continues on line 286
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:286:7: note: Calling 'of_have_populated_dt'
                   if (of_have_populated_dt())
                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:180:9: note: 'of_root' is not equal to NULL
           return of_root !=3D NULL;
                  ^~~~~~~
   include/linux/of.h:180:2: note: Returning the value 1, which participate=
s in a condition later
           return of_root !=3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:286:7: note: Returning from 'of_have_populated_=
dt'
                   if (of_have_populated_dt())
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:286:3: note: Taking true branch
                   if (of_have_populated_dt())
                   ^
   drivers/base/cacheinfo.c:287:16: note: Access to field 'fw_token' result=
s in a dereference of a null pointer (loaded from variable 'this_leaf')
                           of_node_put(this_leaf->fw_token);
                                       ^~~~~~~~~
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
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
--===============4300218903975191166==--

