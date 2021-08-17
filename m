Content-Type: multipart/mixed; boundary="===============7563814235093446509=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/mmzone.h:870:9: warning: Access to field 'pgdat' results in a dereference of a null pointer (loaded from variable 'lruvec') [clang-analyzer-core.NullDereference]
Date: Tue, 17 Aug 2021 14:25:31 +0800
Message-ID: <202108171406.OCWBWrk0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7563814235093446509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Shi <alex.shi@linux.alibaba.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   794c7931a2428a656551f2179e6a093233a6e0aa
commit: 6168d0da2b479ce25a4647de194045de1bdd1f1d mm/lru: replace pgdat lru_=
lock with lruvec lock
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20210816 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 44d0a9=
9a12ec7ead4d2f5ef649ba05b40f6d463d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6168d0da2b479ce25a4647de194045de1bdd1f1d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6168d0da2b479ce25a4647de194045de1bdd1f1d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^
   drivers/i2c/i2c-core-smbus.c:136:2: note: Undefined or garbage value ret=
urned to caller
           return (status < 0) ? status : data.byte;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-smbus.c:176:2: warning: Undefined or garbage value =
returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return (status < 0) ? status : data.word;
           ^
   drivers/i2c/i2c-core-smbus.c:643:6: note: Assuming 'length' is > I2C_SMB=
US_BLOCK_MAX
           if (length > I2C_SMBUS_BLOCK_MAX)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-smbus.c:643:2: note: Taking true branch
           if (length > I2C_SMBUS_BLOCK_MAX)
           ^
   drivers/i2c/i2c-core-smbus.c:646:2: note: Taking false branch
           if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ=
_I2C_BLOCK))
           ^
   drivers/i2c/i2c-core-smbus.c:649:2: note: Taking false branch
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_REA=
D_BYTE_DATA))
           ^
   drivers/i2c/i2c-core-smbus.c:652:2: note: Taking true branch
           if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ=
_WORD_DATA)) {
           ^
   drivers/i2c/i2c-core-smbus.c:653:3: note: Loop condition is true.  Enter=
ing loop body
                   while ((i + 2) <=3D length) {
                   ^
   drivers/i2c/i2c-core-smbus.c:655:8: note: 'status' is >=3D 0
                           if (status < 0)
                               ^~~~~~
   drivers/i2c/i2c-core-smbus.c:655:4: note: Taking false branch
                           if (status < 0)
                           ^
   drivers/i2c/i2c-core-smbus.c:653:3: note: Loop condition is true.  Enter=
ing loop body
                   while ((i + 2) <=3D length) {
                   ^
   drivers/i2c/i2c-core-smbus.c:654:13: note: Calling 'i2c_smbus_read_word_=
data'
                           status =3D i2c_smbus_read_word_data(client, comm=
and + i);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/i2c/i2c-core-smbus.c:173:11: note: Calling 'i2c_smbus_xfer'
           status =3D i2c_smbus_xfer(client->adapter, client->addr, client-=
>flags,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/i2c/i2c-core-smbus.c:539:6: note: Assuming 'res' is not equal to=
 0
           if (res)
               ^~~
   drivers/i2c/i2c-core-smbus.c:539:2: note: Taking true branch
           if (res)
           ^
   drivers/i2c/i2c-core-smbus.c:540:3: note: Returning without writing to '=
data->word'
                   return res;
                   ^
   drivers/i2c/i2c-core-smbus.c:173:11: note: Returning from 'i2c_smbus_xfe=
r'
           status =3D i2c_smbus_xfer(client->adapter, client->addr, client-=
>flags,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/i2c/i2c-core-smbus.c:176:10: note: Assuming 'status' is >=3D 0
           return (status < 0) ? status : data.word;
                   ^~~~~~~~~~
   drivers/i2c/i2c-core-smbus.c:176:9: note: '?' condition is false
           return (status < 0) ? status : data.word;
                  ^
   drivers/i2c/i2c-core-smbus.c:176:2: note: Undefined or garbage value ret=
urned to caller
           return (status < 0) ? status : data.word;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/autofs/root.c:560:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(cp, symname);
           ^~~~~~
   fs/autofs/root.c:560:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(cp, symname);
           ^~~~~~
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
   5 warnings generated.
   fs/autofs/dev-ioctl.c:518:34: warning: Although the value stored to 'dev=
id' is used in the enclosing expression, the value is never actually read f=
rom 'devid' [clang-analyzer-deadcode.DeadStores]
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
   fs/autofs/dev-ioctl.c:518:34: note: Although the value stored to 'devid'=
 is used in the enclosing expression, the value is never actually read from=
 'devid'
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> include/linux/mmzone.h:870:9: warning: Access to field 'pgdat' results i=
n a dereference of a null pointer (loaded from variable 'lruvec') [clang-an=
alyzer-core.NullDereference]
           return lruvec->pgdat;
                  ^
   mm/vmscan.c:4268:2: note: 'lruvec' initialized to a null pointer value
           struct lruvec *lruvec =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:4273:14: note: Assuming 'i' is < field 'nr'
           for (i =3D 0; i < pvec->nr; i++) {
                       ^~~~~~~~~~~~
   mm/vmscan.c:4273:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < pvec->nr; i++) {
           ^
   mm/vmscan.c:4278:7: note: Calling 'PageTransTail'
                   if (PageTransTail(page))
                       ^~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:698:1: note: Returning zero, which participat=
es in a condition later
   TESTPAGEFLAG_FALSE(TransTail)
   ^
   include/linux/page-flags.h:305:58: note: expanded from macro 'TESTPAGEFL=
AG_FALSE'
   static inline int Page##uname(const struct page *page) { return 0; }
                                                            ^~~~~~~~
   mm/vmscan.c:4278:7: note: Returning from 'PageTransTail'
                   if (PageTransTail(page))
                       ^~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:4278:3: note: Taking false branch
                   if (PageTransTail(page))
                   ^
   mm/vmscan.c:4285:8: note: Calling 'TestClearPageLRU'
                   if (!TestClearPageLRU(page))
                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:337:2: note: '?' condition is true
           TESTCLEARFLAG(LRU, lru, PF_HEAD)
           ^
   include/linux/page-flags.h:288:11: note: expanded from macro 'TESTCLEARF=
LAG'
           { return test_and_clear_bit(PG_##lname, &policy(page, 1)->flags)=
; }
                    ^
   arch/arm/include/asm/bitops.h:193:34: note: expanded from macro 'test_an=
d_clear_bit'
   #define test_and_clear_bit(nr,p)        ATOMIC_BITOP(test_and_clear_bit,=
nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   include/linux/page-flags.h:337:2: note: Calling '____atomic_test_and_cle=
ar_bit'
           TESTCLEARFLAG(LRU, lru, PF_HEAD)
           ^
   include/linux/page-flags.h:288:11: note: expanded from macro 'TESTCLEARF=
LAG'
           { return test_and_clear_bit(PG_##lname, &policy(page, 1)->flags)=
; }
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:193:34: note: expanded from macro 'test_an=
d_clear_bit'
   #define test_and_clear_bit(nr,p)        ATOMIC_BITOP(test_and_clear_bit,=
nr,p)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/arm/include/asm/bitops.h:181:30: note: expanded from macro 'ATOMIC_=
BITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   arch/arm/include/asm/bitops.h:98:2: note: Loop condition is false.  Exit=
ing loop
           raw_local_irq_save(flags);
           ^
   include/linux/irqflags.h:158:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   arch/arm/include/asm/bitops.h:101:2: note: Loop condition is false.  Exi=
ting loop
           raw_local_irq_restore(flags);
           ^
   include/linux/irqflags.h:163:2: note: expanded from macro 'raw_local_irq=
_restore'
           do {                                            \
           ^
   arch/arm/include/asm/bitops.h:103:9: note: Assuming the condition is true
           return (res & mask) !=3D 0;
                  ^~~~~~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:103:2: note: Returning the value 1, which =
participates in a condition later
           return (res & mask) !=3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:337:2: note: Returning from '____atomic_test_=
and_clear_bit'
           TESTCLEARFLAG(LRU, lru, PF_HEAD)
           ^
   include/linux/page-flags.h:288:11: note: expanded from macro 'TESTCLEARF=
LAG'
           { return test_and_clear_bit(PG_##lname, &policy(page, 1)->flags)=
; }
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:193:34: note: expanded from macro 'test_an=
d_clear_bit'
   #define test_and_clear_bit(nr,p)        ATOMIC_BITOP(test_and_clear_bit,=
nr,p)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/arm/include/asm/bitops.h:181:30: note: expanded from macro 'ATOMIC_=
BITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/page-flags.h:337:2: note: Returning the value 1, which par=
ticipates in a condition later
           TESTCLEARFLAG(LRU, lru, PF_HEAD)
           ^
   include/linux/page-flags.h:288:4: note: expanded from macro 'TESTCLEARFL=
AG'
           { return test_and_clear_bit(PG_##lname, &policy(page, 1)->flags)=
; }
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:4285:8: note: Returning from 'TestClearPageLRU'
                   if (!TestClearPageLRU(page))
                        ^~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:4285:3: note: Taking false branch
                   if (!TestClearPageLRU(page))
                   ^
   mm/vmscan.c:4289:7: note: Assuming 'lruvec' is equal to 'new_lruvec'
                   if (lruvec !=3D new_lruvec) {
                       ^~~~~~~~~~~~~~~~~~~~
--
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/misc/eeprom/idt_89hpesx.c:977:3: warning: Value stored to 'csrad=
dr_len' is never read [clang-analyzer-deadcode.DeadStores]
                   csraddr_len =3D strnlen(csraddr_str, count);
                   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/idt_89hpesx.c:977:3: note: Value stored to 'csraddr_=
len' is never read
                   csraddr_len =3D strnlen(csraddr_str, count);
                   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (3 in non-user code, 3 with check filters).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   mm/oom_kill.c:257:17: warning: Value stored to 'highest_zoneidx' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   mm/oom_kill.c:257:17: note: Value stored to 'highest_zoneidx' during its=
 initialization is never read
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   mm/page-writeback.c:1408:14: warning: The result of the left shift is un=
defined because the right operand is negative [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                              ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1407:6: note: Assuming 'thresh' is > 'dirty'
           if (thresh > dirty)
               ^~~~~~~~~~~~~~
   mm/page-writeback.c:1407:2: note: Taking true branch
           if (thresh > dirty)
           ^
   mm/page-writeback.c:1408:18: note: '?' condition is false
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                                  ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   mm/page-writeback.c:1408:18: note: '?' condition is true
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                                  ^
   include/linux/log2.h:160:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   mm/page-writeback.c:1408:14: note: The result of the left shift is undef=
ined because the right operand is negative
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                              ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> include/linux/mmzone.h:870:9: warning: Access to field 'pgdat' results i=
n a dereference of a null pointer (loaded from variable 'lruvec') [clang-an=
alyzer-core.NullDereference]
           return lruvec->pgdat;
                  ^
   mm/swap.c:851:2: note: Calling 'lru_add_drain'
           lru_add_drain();
           ^~~~~~~~~~~~~~~
   mm/swap.c:726:2: note: Loop condition is false.  Exiting loop
           local_lock(&lru_pvecs.lock);
           ^
   include/linux/local_lock.h:16:27: note: expanded from macro 'local_lock'
   #define local_lock(lock)                __local_lock(lock)
                                           ^
   include/linux/local_lock_internal.h:58:3: note: expanded from macro '__l=
ocal_lock'
                   preempt_disable();                              \
                   ^
   include/linux/preempt.h:169:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   mm/swap.c:726:2: note: Loop condition is false.  Exiting loop
           local_lock(&lru_pvecs.lock);
           ^
   include/linux/local_lock.h:16:27: note: expanded from macro 'local_lock'
   #define local_lock(lock)                __local_lock(lock)
                                           ^
   include/linux/local_lock_internal.h:59:22: note: expanded from macro '__=
local_lock'
                   local_lock_acquire(this_cpu_ptr(lock));         \
                                      ^
   include/linux/percpu-defs.h:265:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   mm/swap.c:726:2: note: Loop condition is false.  Exiting loop
           local_lock(&lru_pvecs.lock);
           ^
   include/linux/local_lock.h:16:27: note: expanded from macro 'local_lock'
   #define local_lock(lock)                __local_lock(lock)
                                           ^
   include/linux/local_lock_internal.h:57:2: note: expanded from macro '__l=
ocal_lock'
           do {                                                    \
           ^
   mm/swap.c:727:2: note: Calling 'lru_add_drain_cpu'
           lru_add_drain_cpu(smp_processor_id());
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap.c:620:26: note: Loop condition is false.  Exiting loop
           struct pagevec *pvec =3D &per_cpu(lru_pvecs.lru_add, cpu);
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
   mm/swap.c:622:6: note: Assuming the condition is false
           if (pagevec_count(pvec))
               ^~~~~~~~~~~~~~~~~~~
   mm/swap.c:622:2: note: Taking false branch
           if (pagevec_count(pvec))
           ^
   mm/swap.c:625:10: note: Loop condition is false.  Exiting loop
           pvec =3D &per_cpu(lru_rotate.pvec, cpu);
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
   mm/swap.c:627:6: note: Assuming the condition is false
           if (data_race(pagevec_count(pvec))) {
               ^
   include/linux/compiler.h:204:31: note: expanded from macro 'data_race'
   #define data_race(expr)                                                 \
                                                                           ^
   mm/swap.c:627:2: note: Taking false branch
           if (data_race(pagevec_count(pvec))) {
           ^
   mm/swap.c:636:10: note: Loop condition is false.  Exiting loop
           pvec =3D &per_cpu(lru_pvecs.lru_deactivate_file, cpu);
                   ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'

vim +870 include/linux/mmzone.h

7f5e86c2ccc148 Konstantin Khlebnikov 2012-05-29  866  =

599d0c954f91d0 Mel Gorman            2016-07-28  867  static inline struct =
pglist_data *lruvec_pgdat(struct lruvec *lruvec)
7f5e86c2ccc148 Konstantin Khlebnikov 2012-05-29  868  {
c255a458055e45 Andrew Morton         2012-07-31  869  #ifdef CONFIG_MEMCG
599d0c954f91d0 Mel Gorman            2016-07-28 @870  	return lruvec->pgdat;
7f5e86c2ccc148 Konstantin Khlebnikov 2012-05-29  871  #else
867e5e1de14b2b Johannes Weiner       2019-11-30  872  	return container_of(=
lruvec, struct pglist_data, __lruvec);
7f5e86c2ccc148 Konstantin Khlebnikov 2012-05-29  873  #endif
7f5e86c2ccc148 Konstantin Khlebnikov 2012-05-29  874  }
7f5e86c2ccc148 Konstantin Khlebnikov 2012-05-29  875  =


:::::: The code at line 870 was first introduced by commit
:::::: 599d0c954f91d0689c9bb421b5bc04ea02437a41 mm, vmscan: move LRU lists =
to node

:::::: TO: Mel Gorman <mgorman@techsingularity.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7563814235093446509==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICPdDG2EAAy5jb25maWcAlFxbd9u2sn7fv4Irfel+aKObHfuc5QeQBCVUJIEQpCT7hUux6URn
25KPJKfJvz8z4A0gQaWnXW2jmcFtMJj5ZgD2t3/95pD38+F1e949bl9efjpfi31x3J6LJ+d591L8
t+NzJ+apQ32W/gnC4W7//uPj9vjqXP05Hv05cpbFcV+8ON5h/7z7+g4td4f9v377l8fjgM1zz8tX
NJGMx3lKN+ndh8eX7f6r8704nkDOGc/+xD5+/7o7/9fHj/Dv193xeDh+fHn5/pq/HQ//Uzyencnj
9Wx28/j0OHm+vnm+eZzcPD+Nvjzdzkaz8c3ky814Orou4O9/f6hHnbfD3o1qYuj3aSDHZO6FJJ7f
/dQEgRiGfktSEk3z8WwEfzXiWscmB3pfEJkTGeVznnKtO5OR8ywVWWrlszhkMW1ZLPmcr3myBApo
+TdnrrbrxTkV5/e3Vu9uwpc0zkHtMhJa65ilOY1XOUlg4ixi6d100ozKI8FCChsltbmE3CNhvb4P
jYrdjMG6JQlTjbggK5ovaRLTMJ8/MG1gnRM+RMTO2TwMteBDjFnLMAf+zTHJOKqzOzn7wxmV1eNv
Hi5xYQaX2TOdXTF9GpAsTJXWNS3V5AWXaUwievfh9/1hX4D5Nt3Ke7liwrP0uSapt8g/ZzSj+iIz
SUPmWuSVtkgCbUgGRxg6hu0Ma+sBa3JO719OP0/n4rW1njmNacI8ZWwi4a5mfzpLLvh6mJOHdEVD
O5/Ff1EvRYvStjXxgSVzuc4TKmns25t6C92ukOLziLDYpEkW2YTyBaMJauNeHzj2weorAZA1GwY8
8aifp4uEEp/pfkIKkkhqttBn6lM3mwdSbVOxf3IOzx19dxt5cNaWoLQ4lfUGpbtXcJW2PVo85AJa
cZ95uiHEHDkMVmQxBvgPeuE8TYi3NNbS5ZTL7nVsPQMLNl/gluUpi8BPmDLVwnvrqAcWCaWRSKH7
2Biupq94mMUpSe6tQ1dSlqXW7T0OzWtteiL7mG5P/3HOMB1nC1M7nbfnk7N9fDy878+7/ddWvyuW
QGuR5cRTfZTqakZOmbfssC2zsHSCu613hJaCihvoqF2qZFbN/oM1NZsME2GSh6Q6eUoniZc5sm9e
MI/7HHj6VOFnTjdgdTaFy1JYb94hEbmUqo/K3i2sHinzqY2OZkqb6VWaMFfSnOFl+QftVC8bG+HG
2WHLBZzxjgk3YRBjXgCejQXp3fhTa2csTpcQCAPalZl2z7f0FuBJ1CmvtS8fvxVP7y/F0Xkutuf3
Y3FS5GpFFm6zl/OEZ0K2qxJkTktrp0lLjWjkzTs/8yX8Rzv6qqdycro2AsKSXONZrRLM+1ciVf+C
+Ta9VtzE1zFBRQzgDD+o1XQ78+mKefTScGDrcKDSizOiSTA8I+W9tSktqLcUHDYbXV3KE8NblTtL
spSrxrbjcS8DCZ2CX/JIamq6y8tXE7uyaUjuLX274RI1onBGooVN9ZtE0LfkGbrzFoMkfg8nAckF
0sQyALAq0KZLDyAmJcyHepl1OnmQqW9bEufou82DC7CYC/CV7IFifFIbyJOIxGak6opJ+IPtRPs5
TwREf8BUiQFEADFlzB9ft7TS6+mDRIDgGKCuxLbXc5pG4KfyFm0ZO90jByUGMeIfl2xjiaiG29FO
f+mG4oi1tNJ+mx5pGIBGE5sqXAI4JsiMKWWABzo/4QwbHQoehlYTkGwekzCwbaxaUaAZqcI7gXEe
CLOZD+N5lnSiMPFXDKZeKdSmKHB1LkkSpjvFJcreR7JPyY1taahKP3j6UrYydskVQT24ZWwFuzGR
aycB0rGntqEdBkCkhiCV36lpra4jl/o+tWlU2SsehbyBjrVRIBFsNF9FMEGuBVzhjUezOgZVGbwo
js+H4+t2/1g49HuxBwxBIAx5iCIAu7XQwByrmWI58e6YVszyD0dsUFRUDleHN2NYzFpJCgnv0nYS
Q+IanjbMXLvFhtyWPWF72L0EQmuVtZm9AReDVMgkhAU4wzwa6qQRwzwH8IAZABZZEEAOomK4UhuB
CGOz5ogIJbDOsxjdOyMheDff8DApjXKfpASrEixgHjETLUA9AQvrg1TtiFlGaA04MnrOZSYET1I4
JwL2BHxgp29IEhhHiRwmqjVNIasoMVvVg1FfWELo6zNq1LRYU0gwLAw4dcxNIGDC3kBgbAXUuWum
mqkMVj8WC1gJDwJJ07vRj9HoZqQXberejegv5ilxYYNUSivvJhV4U0jTSX++FWV6UW9SNuQM1P4l
MURaSMXzCLLWm0t8srkbX2ubAY41noeYz0erT5HhCLE1dSUZj0dWAy8FxO10sxnmBxB13YT5czu0
UjI+X13gqglcmIGcepPZpSmQ9HY8zI023oW+02hqB07l4oOL7BB84s2lmUVCGs3Vlovj4bE4nQ7H
2gq0VKvcIo2QLrLI5XF4byGDNQs0MZM1nXzvdkLcBLNlMDKTLhQjpHPidfr3CKBTaCJs5N4kgZDH
WaTKGpPZqLvMoE1TNLtUSzD7YWX/PpPVslqPDVzf4NpROoi5AIl95qU2QW34cFytpsy8rnQeJBYY
fzExC2jSnQv4AMUVBICyrYQHZBX+LZ5C8RBcWngJxZO8oh74cUhXOUSHznmNwKAya3TU3YrSvvuO
lZO3t8PxrGeHOlkP5P0tUnFl0OMp644h1xOMt6XxxUMesA2ElpFW6XnIh043sCYXWFcjG3J5yKej
ka4WoFwN9wJj27u5m7arUaY4qQqzWkygxGWdELEmgCmUvydhvsgAtYdub5O4n2FkDlMbulRVMvTT
+QOPKYfIntyNxxqKB7PCGpC9olMxL5d/TMjU7G1pGAcQO7zhlYu224i+eKCtNSVzLfxpeaayevCb
SeZp8fVBJV8Jj8orGzCYPseVUjEMXREhaAwgNfdTG5jyIl/dZXzQCt0bJqqtsvuAhEgIOVlkS6kx
3c4fEJb7fqKDGUMtdeHPEYe/i6MTbffbr8UrgE1gNLzgWPzve7F//OmcHrcvZR3QcEQA3z4Pld8s
rZuO2dNLJyowv+vkkZLP+SrHhXTKHTo7orENWBgyKeU1rIcdaabg+Mfd9xLEGzsG/G6p2OSHQn4a
jze/FFyyZLnm3P+l4MN9/NkmpJsRQIBapHsc6eY+5vKXo0QrSEYglP1S8DOkD7kUA5qo9tiuSd0C
ym3WKT1rU6oPXg5bLMk6b4fd/uwUr+8v9YVpuWdn56XYnsB690XLdV7fgfSlgFm9FI/n4kmPAoNd
loFbTeO1mYbmLdoYmEk8t3YfFdlVp8P/AZsUUQ+Rq3GwtCFZHYerVQzOs1Tb7vj69/Y4aMbSixjm
NSn3uD0Rr2X4GnLw5sKo04n4B52I4U4ClkRrklAEFBD9rYpLsyRhgOz5Jk/WqV25rhfNPm02ebyy
Y5I555gE1MNpiVHJwOqCctQqZ7l7bXuuBLAKzGPJNdnhYVbChy7Ky6ji63HrPNeb8aQ2Q7fFAYHG
VLvbqKvWS+6FcUeufgOiI2OVh2rLqFiESuQMBA4l4i0AFpLJKIfgbLXTUkzw8H48HV1VA9Wzkvkq
ABAXAYILBItlc49UZ8vb4+O33RmOJITkP56KN1inecY0lBkYVQteZuE2F6jqOTW/c4QwtOPNO8AE
CMFr0r1hN+p/7dWvSr0XnGsFw+ZOIhJl9CgvOC03mcjESh+uIhOdCWF1C0BQyoL7usjcF1hSKrq1
6YZZIXCe3FtnrmZVQZR8vWCpqqJ0+plOIF9GgJunnU4SOgcjif2yBIEgi0qsXnTVZNbg2pIatrfR
sfJb9YnoxAYsmfDy8oa4fj1hWZ+kHhawLrDgnIfGlY69iZoLei+VcnRKL7+ko4K5fh+s+vQGr4sV
e/hyU5ey3G92JABiVysW1MOClXZfpdC3VHaP9evEgPS1CSmOqr5hMmZ2TjdgGV3b9kJA65DWeUtw
oL62wRzftLB5FammPQapHy10y4+lBeI6L9WBVeUJ/I1v3qVgCUyvcNoyjdauLt5bKDERxPmKhMxv
/JXHV3982Z6KJ+c/ZR7xdjw877pAF8UsaLy7CiVW+aeqYN7WES+MZEwUn2iJMJuDW7XVIX/hWZs0
G3wH3kzo5T1VrJdYfW6T2SqLk2XKFpG0Z2JdQpXahVy3m4qVxRW5LfnpbUq2NSyBXOUM5BBfzTPx
6ldz9puFdj29yUlmebyh8Todqv33D+r38+H4tTg754Nz2n3dO5jV7I6wk68HvIQ+OX/vzt8gxTnu
3s6njyjyBz4RNEqf7TgYuC+usZSZTGwvpzoyV9cDiwHm9Gb2D4a5GtvuNTUZMOzF3YfTty0M9qHX
C57yBCLHcB9lUT5iEku0OT7rkgLr3SxSVWh9/lkM7gzcyX3k8tBuB2nColpuiVdQgwPjWwiKdsqX
mXGd66JXsR1jGY9bo8FbBEzKwfcCpEDL9ZYdD9vW/FNwsF4OqNPig2OwVQ5GGxIhUAOYk2OoVVrQ
7hGbK31lNvRH8fh+3n6BvApNyVHXQWcD37ssDqJU+fjAF8xe/62EpJcw62ugZpqVYBDqLuBXRHwt
uRL4blKoF5UYOu2CPDTcQsV6QJ7t2rWa9QJQvG8fHgzKaxEpovUKbjQec0iFSodR8Xo4/tTS0D42
xWGN9yBqITH3VZ5g3uMoNSKaUzeapq1IEUIEFKkKZoAK5N2t+qsxV4XxwDvDQTGuo7A2mVA0MQMa
qBJ3Xt1xlQeCbhC93Y0bEYo1LABiCEKWRn3VCymJVU3YovcHwXmoSz+4me1m9WEa4IY26q8hMSVJ
eJ8zroq8um3Dqa9qvsYlLE4PjMb0AvNMqJe21orD8L61HcTUZlMl6MF76b9Yk6/4xffdo54913Pz
PJIYFiu8yGOkFyCE98fj9vjkfDnunr6qynKbB+0eq44d3qtElqBmQUOhI1iDDAaQLozXsas0EoFR
sCwp4PHKt3xt5SIF1EcQzNlfAKphmrRcPVmuVdLkoi+H7ZPKYutdXKugr8+3ISlj9fEqoWUCQE5I
m4y3C2lbqWShqwQrOw/geLiGe2nl6iCkn/7uMupWCinimyDDZdTHWMUqnWt9vIzX+X7CVvqsKypd
JdRy+Y/2XDXBG5Chm0IlRtRLiEpYXdHaahD1VS9mGVnKO4+RITszTmD5O2cTr0dbj9tzXJGiiPF+
W/01b0WDxDb21yyhvS6k52nXXnjVVDnz8rbJ0BAwAxoDJFDZuPXYD5yn5hLoSZ3jXvmLQZo2T/DJ
QB7aCkZu4kUydfM5ky40MO443HQM6bD9UYTibZiVt2CShQx+4MWpVUKVVqnLbMBrRTfKlOsnXlpx
J5BhHuH1uxXzLBhy2n2oCM1rPeNyrFZXY02x1JriL0imEwgvHWKEDzptDMkg9bdyMnfTMlr0aH3b
5qeaeeoXNTxAPJZW31+0taIATyxeqthUAlyM2IgCjZ7KIGVlLbn7l0Hw7wGwMmNWNYAzaMbh4IF6
p5+swNwNAFEyeLgyRy3RYfeZRoRvO6rCiqqXVI9A9FsyJPVCUryCXFv2b0UNegmCdqdH7ejUsYPG
Eu9mQyan4Wo08fWNI/7V5GqT+8JaGQWPGd1XymgfD3vydjqRs9HA8wUAWWEupf2sgF8IucwgSKFC
GcCc4SPlcQZeZODlnZIIiEyTgVNJhC9vb0YTMpB5MBlObkejqe0BnmJNRq3p1zpMgXN1NdI1WLPc
xfjTJ9utbS2gJnQ70t4aLiLveno1aYfx5fj6ZqJBzfIyXfsFUZhq5rvB901wIP2AauhZrASJza8l
vInVtgDhJjzS7tzrbVJ02MvJTF9rRS7fXliWWvEjsrm++XSlQYeSfjv1Ntc9KvPT/OZ2Iajc6DOu
uJSOR6OZNYh0Jl9V7n9sTw7bn87H91f10A4yXUztz8ft/oRyzstuXzhPcFR2b/hHs6z//25tO2Uq
LrfVdaxqEoRwQnOm1FtwpdoaCOtnt3x05UlWUfobhExMjPVIYGtQfvxEKXXG09uZ8zvAqGIN//zb
eGdRRySI/Bj9rdq+2Ek5zP7t/Tw4YxaXX/61BxAJYEvW1/IlMwjQ4YZURbNOQ6zUAzyzn20lUX62
tOzcUBkiEYF8a7MssZVaRHYqji/4cckOn2Y+bzsopGrGsWBxcfC/+P1lAbrq8DtcDPOvumKHcpuy
wZLeu5zoFw81BXy8uLqajIY4Nze6cju8W+sKWqF06doifyPwOR2PrjRHajA+jawjf04n42v725hG
pr6vvyyFzzCWuc+S65ury5LhsrOQvsiFN4WNDL4suqQO5CvLpb516alHrmfj60tdgMjNbHxj2c3S
mC2MMLqZTqaWTUDG1MYAD/5penVrG8STNnmRjCdj65JkvJK5WCdAuLSsmK5TvVrSMLgAzMAxC+sP
KwDL3Ww2RtxoByaRzAa+MWs3hId+wOSieuZ9aYYy5WuyBlxnXaU6gdIjtsvXViqLwczss12UHVye
QSSodXgOHsxeHW7tJprkKc+8xS82YpOWU+ydOCLgvG0su+B6Ud89Kxd52T9K/LTwgoi61be/KKsE
cDnSA9QfX5DCyqJlwUnEZuX3CdrcFRGit7U7xZSR7cWXYgUj7R6tpqhkiWv5NNInfoUXuvLjcY8y
6VKmox7F/NaopNm/AS+ZV3ZbqZiGq1QBaLE9PqniC/vIHQzrRnqR6NUF9RNQkCvkRMfPSE3Iukuq
wFEprGFq5AERPz6yQmrVNvFUw87YkOSX1E53HPJ3YEr7e5VSBg7ojOWd988dmdKHD4hkSsbKmpOI
dkF4g65sGm6Qlw1XlaAE0On2EXCKrWCSprZzXubuqiZm1BcY+NLqC/GkQxVYJ8fvLFpNl3RMMkrH
aeC6lgfZmf1zYSVTftuoijpJgJcn5rCSdQmSBYajQaL63wT4fHAQ9YaJB0ZDIgUW1JeeLGXcyH7g
Y+FF+D7pl4JVh25qFWun415Y82JdXe1bSOXHZIxj9cHCdclsagTfloVPF6yQpBVh0SZP4rln61l9
aWBjRFRCtLYx0qWNXD5ntHFQyTY6RsMUv5W3rsvz0sRqWa3IhokF+BYtu6arsnyjFXNX+ImwpZvU
g3+EfS/0935KDv/PKlwvmlZUfeq1IASXskRiLxhrUgwo3ddcVsE4W/H0gtwKZoyF543NH9QdyXQ6
fRAq3R/gVFmt9qI5DO871cv2ZWjPM2lhptJjkgFqwjd5Zdm/F3UwDvfTSL3kjatXGAR0xQ0fNPGq
Byu2g4hM9XXaSvMwQIyyTZ1yRe8vZ8jwix+wApyH9233Zp0MlpnLkABdAq6P57TXafnBgYVaDmjM
Ghlh6s2mo2s7pqlkhEdur2bjgeW1Ej/64woWw+kJ+4yEzrvT8anW4sJgUbjxROgbFY1LKjRHqe6E
8OJjcNEAvExba2yEvHw9HHfnb6+nzs6Ec+6y1DQXJAovMBdfEok++07HzWBNoO5+q6Ivh22uFn7/
Gypl0OU3L1+wal9m8s7vr4fT+eWnU7x+KZ6eiifn/xi7kia3dSR9n19Rt46JmDdNgvuRIimJLkJi
iZRE+6KosKtjKtqucth+M/a/HyxcsGSCutilzI/Yl0xkIvHPEfXX+9tfn1mr/aeZgZSa0KaS2xHO
xm6eCeYw1HjKTNQnaQDr0iOf7XMn8zasgXg8HnJkLI0WHL3PCm74EHPImOJlfmEjs0bSKit+PVtY
RPV7yAaza/ILzuXSD3elsvKud3VxbPTbqxoCv4cnuLRCoh8IrtgvI6Rm43qifSHWoCkM0wdhm0dT
54FsGrYKVzikprDmLHlsjWoxNUkgji12VsLZHz6FSQqf8HA2E9QJohjy5YaLHji3jyNHzrRPYoKP
fnqJw8H1+YAYE/g2LKVFpMuO8gzDGERHzH1eMK+wkMB5bLWaRyYOomwy4em3B7yi7YAvAtI4U8Dm
Ug441TUoAHPWYzCYjSCuyiK3eQV/f6NsIQd9yAW/pn1VmPOBmzDxJNsTvj6arioai03pLaw9L/zE
wT8HyLU/wT4fYqaykCvett3Hw9OZKQ74zBUmcjf3tmkpPi7OByY5144cJsANiirDAdynM+9r/VYT
Z1wpJpBJS5aJHxq8FEPTZo6peipyW6SsfjOR9O35K9+K/8kkCrYLP395/i7k1PlcXSCPv/5Hyi0j
TNmwzd14lH1gqwkmMvyHPio2ukACbEmCNFrFALDwNeFGdWufEg4rZjwUAMKFIHQn5QB+XvBHrxog
zgXwrtC18JjumMIMqXGq9s9+aGK+PJPq6ofP72+/frx//Wp0ylF4rOhhxJZvvr5yy54SX46lztUB
dQFpW1vUbPuWffz++d+K2CcH1ZtwSmz3H3lkQm47OlQ9D13J3eCF6t71OeXOosLj+OXlgY0tNu6+
vHKvFzYYRao//1u1RNqZzcbdUXq37q+MjJsVL6s+cD0DwnPJfXs+CF9//Qv+F5yFZCgqtAiGgioI
U6nyLkiIdsg3c5g4ymQXeFGdQRS5tjfyN9RPEYligpR5Gnm39ty6UyrzzIthwWyCABEUDAQtWhJ0
Xqpbgk2uzZFhL/SeEPTBjzxtdZw5Pd3Ci+CcWz4kTOhxNw7LtzqAu/aEOD2mXmSX+FhUzbGHSoaJ
L8uIEIdmu5WOH1GwzmGiYJ15HiRce/GRPUMDISrO3FpcxbGMfRas+Lg7MM2FzTInDLkisbDb9awO
Hbkjn3YVw6epe6RsqlPDL+XtQiTo3JydLQ9bGCZmkmgdkqwUun1KvXhlHHEMcoNi6dan0PNhk7eC
Wc1LYJJVTOz5qXvmdjQlxD2mOSZGrOUqJlvDlDSLffew5+kMK/USefnrZc6SOzDZHXll96Tjbuen
ogtNHyMLwk/Du00tbM5OaFck/spW1JV0rc8YJA3d3cFq5kcrqbABpENkKNSXt5efzz8fvr++ff71
4ysk2M7LPtv6u9y9QrVb13GGijqleZJkmbteC9DdJ0qC7laYgYl7bi8J3plettL8ChA+c7BL6B6p
S4LBnbg7883ie/tkZdwqwHuzvnfYrEyqBbiyg83A8D5ckLvH4ekTcgFQAdxZx/Duot/ZXeG9Gd85
nsI7p2RY3FuR6s5hEq408gLcrPXGYT2lbp8Qb71NOGxFGJhh62sPgyUrcvoMW+9XDgvuKlsSwSdW
JgxxorNg7h15hAX5nTW9qxcSck9NByOtKZ42sh3aychjefeW6wj8p2DiVUzLPb6KLF0TFOSRJHEP
rxG1MgjH48vQ3YEj6p609msLi0DR1l8ZgX19q48lEhV6Ak3Hkrb6PB9YNmXo4DKtzsXumjJ1fx25
2IPqqgSULN5AWrQC8N3LloJcWUTUMmndM16l/fL63L/82yUdVjw8OO1hI80sevckQS6JLJAkXpng
AuIearRP/RWNnUOIe4zx4vruZZX2cbIiKHHIipjJIdlaWVil18qS+vFaKqmfrLVu6qfrkBUZjUGi
NZ2vjwOz0vMdYGTAWedm3E0ktycRU9+SJgAmn2CkGCPzMAaBZmJP20uSINabeYN4Otc8WG99hryK
xtv5POLMueuZRimMtnvloJX9Zp9bBHHTid8fHt8yivz5MaPjdjKNG5/Upyf9CRl5VGuDZbB2g1Zw
7xibdLv4BtV640JQhQO5t7jTyGve356/f3/58iBOs4BVRXyZsI1R3FgF2k8ApPODFu1LkHGnB4V/
69CjNInq98jsFewTS2VTnU4f25qHyseBkJuDjRh2ncNdQsKkQwTWGAWbEsarAJIO3I9Q+eU1bzdW
G1a1wzQqEbC1WTof9Pw/T7fkAkNlcan4prNPup+UnBzNtbRqVx+hKz2C1Rx3dXEprE9cUY8nQEDA
Q305oDdp3CWDlS6tDp+wnUUCWnFFwQHAXRIkf4CO5UdWZxUIdSmQfss8sMl6N2PmfzkJDMuqwS0d
n3Y5zaOSsOXyuIFCfEpQva1V6+dIPA7WeO0ObXcrThXsqiIhznqyRfU2XEGpcloZCz0MliDjJvaF
7SNqkER0YYrsJILvNMELxMAn062D77NLhLCoO/gNOok+VRfd2UpS0cmR0/K2Lfaa9x++4s++cIL6
8vv789sX7UabTHO8m/YHohpvkUnOoTW3puutVR83VHYmzxpLgk4c7SX8KQO0DQQ78axWa4ttGiEG
DDkW2rogKeL/Mo2WzBwtihHeaEa54W5Lu3mNrU5eC0T79FR/YhuY1U6bMvEikmKfbUrWCj69msID
N6tGiiS279k6BMgiTRtkYWBsAk2bJsFgIdMkiiOgI0vDOdLsZm4NNXKQ5MgeFl1DUtO7Q19B+J0s
vWR928UR8VMjD0HOfHuIjAwofoTkP9EhjY1MrsI+ok05u8/1Ht3t2FKZa0F7ZOWPxaMa8PLqT04W
/l//9zo6rtDnn/rrKFeftVrX8wixHQlTTWZeeNhDBurX/hUSlheE6e64cLod/FYcUG61Pt3X5/99
0asyOtHsK1UsmemdcXFgZvCqe7BGqGOgCaMh/ADPALoQqiHE7U7w4/Se0gXQKqAjfCyDMIDVRx2z
Vv3IG4BmZ4wk9dSBqTJ8rMHSCrHm6SAfVkf1MTIriCIWMo8DojiUK8TJwUV72WrhcjEe1QdMoCHv
g7hdRevDcr1pHY96EBgg8epbjkXyV8DS80P+gE7lFGjTFySLCNxwY34wE/QkVAHTNaHV4kpRbqWg
ErRcGkMyPdn+qCAOlJjGmNX0WCr7xpixyvuG1KMgsJcxjwdD4dTl9zy+ofoki0o1XwFsy1zylQhE
+ZBmJBrJ6guhPMqVoIINssl7tlR/vKVpS9PYg4rO3e92/AIIE0m8WFtqpq/zok+zMIIn0AQqrsRD
fBgmCF85Ymi5UwGpIh5odLBoggNt3hOg2yg336a6SuKcGM0P+Uh2pLR54p2vSEIGQ78eZTL3pRbI
x2SX/e3M+p11Jx9LriZislwANBEbIX7ihZ5dgpFDkG+Ir+l2UxMx0ZkNB2R/mUBiWCKmugnDRUVd
RzcAuiC6JC36xO67pg/iyLfpvDJhlCQ2p6zG+NMCEkcxlNssgoKcLAA53LsFajzpsUI34AMlI4b1
fOhH2qGGxsqgiaIiSJTYFeGMRD2OVRgRz86qBmek6nGsyshSgMEqFoSJPdB2+XlXyf0m9O3RNoV7
gKbxqY+8lbF26tkSBK8vc8HY8hxA1/ImwLnofM8jYJvbqhWAybJMv78/7SuHqI/91Fy291eq39Rl
P2+XujRJo5+4PDGWgceefzGFHTqonUNalUnoQ2XRANrwXDjU95BjLx0DXYLSEbEdqEsyMoShS7Mq
y0/gozwFk5EQmhYLok8GH4gdxhkhzvARRkwQRoIllUQAg/t1gpXuCvP40UQM9W2bH0SQ/NOxgdLm
J+sAvR9asKF5uMX2Agd2kIiC/cNfZS7a09FOuOxiKDgbj55GgGYcjx6AgvAIUQM8nyfIljvzRdBF
FxWRku3OznibREESdTZj1xVQcXZN5KcdfMKuYIi3hmESDiwoKQhIYJnZ8i7hASrkvt7HPqgwToh6
Q/OKQt8yTltBAuAM6NPEbq4PRQhMArbOnXwCDQQe5ztX72HPDLEvANNDMoCsR4bux68xM3Ba8Svc
PuL0p2KI71reBIIQLAMSrn4co6UjsWvSczEl9mKgqQTHB1ZWwYhTmJEBbcvogZ8EQAfyAIIxAdcO
wQoyd9HjOAQbTbDAF/o0BF7YDCps0QYeUthmOFX8gXlI75xjShZxFIJfV4ct8Te0kDu0q9SnhK0K
AdjVNIZCXC7sJAAGNoX2EEaFZghNgD5vaApNTJoihUydI5lCq0JDod5gVHi+UMRlVgFEBPGX0zDh
yqwWGPem0hZpEoBaqIoISQLV5NAX8pyy7rA73jO06NmMdPU/RyRQZzMGU4OBZXe81gGWrMsDxPVo
ghz5ayipGWLLqvw2jTJtRrVm9AfzkyvFNizVZm9NJFskwM/7Z8i+94EWY2RI+mDk4DdILsA1o6QV
WxTdUmhFCz9EdF4FQ/x1TMyPTNwtQrsiTOh9IMRRSIdtLE8gE9b3XRK59qeO0jgGZbq8LHySlqkP
HTkvoC5JCbBu5axFUqgb60NOPGDX43Q1Kp5CDwi8K/RF4tKZ+j0t4BDDPW2ZUuP6lAOA9VzQQTWM
cbBAzirEqSAwQOQDuU6xzwFO7xMfbJtrGiRJAAV2UhGpD6gbnJGhDIIxwA1JcFxbEgM0SRr1HfI1
Y8ZI7EkFFZNk71ItJKTaa9HLxNqfw3crHdHQum6jPki5ULUf0zsF+oHYpqA58DEnK2csHLQ/dv2t
O2r+N4IxpkvrFnafFqBu2+TdHjp5VJLY0by4FfSAZYHEYJWQ8ZR7ifH0r7/fPounR8f4el/M8Lp0
WxrhYzhlOo7WjnC35RhAcNeyVQispviW6eI+NKEmJlG2XeGws0Tw1RPKe5ImHn65X4D4I7PnzrDo
aAAesH3bVEOhRhZYWPumKAudwRozyjx13RNUxfavl2FoiTcguz4HmJ6dC2080daSE06aoOI0c9Xj
x5mYQkT12HEhEqO7u7pQgnuKThGn4INZNnHYQBxVNR0hJlpMoKRieAMf2dj1P87m7kGPbKcNHBD5
xnDT5vCDXwyyy/uKhzKwzixEDxV+MBodsH5tSUwys2J0YJmeXFOEDiS69Z0BUQD7mql4vugIM3XG
iqLBuqc5IrjfSTt15/wdp7JaWFE8lGTrpy5G3IM4+7GisNTImcL05VnzV5KxcTzZy8xZYZoYRqr0
ajGxhkVhoaYxRNV3w5mehpAOMbLTzEusfLml0Op2YayAzDALNzVS6uNAP8KYqHg6k9asp3Sq+rNO
maxLmpF3pN3gkTez9e1RpEZTzTAn8hQWBbMZTkXUR6BSJriPqRoYQpDkwb5O7Kpi2pb0DagOk3hw
bwmQjqMDaORhG1T3+DFlI1BbrfLNEHn2PqR+NbpJyZcNevr6+ce7eOP7x/vb6+efD4L/UE8x96H3
rwXEDs48PX5wf5pauWTEpVNB9a6bHT8VWl8z9SAI2NrSdwUbIDrXdFyTtDQRLoxa67J0GnpGG7/N
G5pD6zF3E/O9SBlkwnHMU20KkpJY25KkIy6pCwC5+DwDiI9NO14pw0tPIXM/PZ0+uchB5Uxj6Ix4
ZksXOptK9MafqPrZ7chhq3Gg+Q/114Zp1A5ZigFiL3QO8mvjkySwgoqLkUCDCDEuihIVQZRmaK2p
udr0SRPHw8YgFnGQJsPGalNGz4IBMgQL9uRdqBf4WOwP+U739FYlotE99A9AtFtcCFUk1NFXGvke
sWm+tVEKX0f4yGBmQ+r+yAztrZdRA9+SXCxI5DmEm9ED01yA+2uYghcvxFp+3FNu5+V3EYzNYuRw
C7C1ZcxfIdbhcYkNCJttIlb0CkpgMJmv67ns5NsVwyINCflnn5c5PwyH3Po5YH4JjS2tRqDZk3Cx
bIG5p4aSxTS1KROW6LnRvVtnkunetDC29VCxwh2bnluMAACPoH3OG27+7M60AlPnUd/lK7guFBPo
dmxpQ1hCQPyGsGIvgXhcC03VpVVnmQqqwi2jAAmKooAO7D/4LokCGqd8Ux4hicEGsqHFXc7A6lgx
whbepHGuFAf3TtcwYvrB+Uw6rDOJ2aQMclSTvcYh6s5lcHxwdOaHKIh047XBNcKeWSAzbu7CkTqU
82MJuUQBWO66a5h6CQ4/xopJ4udQQ3BJKfFRDth4woNrwDgByonA0gFXB3RmujY3Grlj34GKE8h7
e8HYCp3Oi/S9WWNacd0QkH6crHHTOISMqQYmBpemRflD0s5A5x0Do/oFG6wsRbI1FFiTp6uxBjcF
j9BNEIGTL1qftSZc4jYKffirNk3Vx5R0ToysRLR9SjLEnKagmC6MBAbQQUgYiQXUbmpQ7VAQRc62
FA/ub6ezpgLbnj/xJ/3WYBe2rq0XmaNW1j+BybBCX2FPmgUh3ChPLd3fgzODmWK4c7e5XaynEyys
arlU3jq65X1fHz6ufcwPEpwtY50rKCwmcMKj8tSHKWIwUkGoK6UKopeV1asjtM09cKvgrA7eNLuI
pkmcwOVH/TMVyHLCYfOaHVNaPGQ9lcL15njkl5NWqi+xl1O13Zzh6xsmtr2upykk91WU0FBuFwq+
U6MAWTt4cQ5PHcZMSQhfcNAwyQHqP6aDR34cgI1sH3ToPMLPBBEeW5yRxX86GnGWWID8ABFCp1OL
lQaeTinWc9IOLTSedUChaBuuy8GK4sIDUjiLoBhoge+l4rySyRWP0miseU2+qUFn9FNh2NcYQT7I
OSfV1CdwpPLI1MWxZMrX8nV9uh2qmaFWjXFORTRxgPQEIEY+/XAp3J92x8NH5VuFkR8+HpFU+Svq
rTtdWnBDTgkmPdAWpNfSo1sy/mj1o1RhLJ1VjE9TQRJAUZldxCmHY19vtXBLtCrrXPBOulVmpnPN
7whbIgVm5JtJjmSmrPPYH3bS3XlTni7i/Ziuaio9MO0S1Gg6Ofj157t6+3MsXk7FM71wCZgu3Bx3
t/6iAIxC8AdB+rxRMGg1T3kpHptDUurK02oSUwwNrMDiUpaagxpsR2+I6cNLXVZ8nF6sHj0Kz+9G
NL1ozsvrl5f3sHl9+/v3w/t3fiqjtKdM5xI2yuK+0PQrSgqdd2LFOrGt1RaRgLy8yCMccKWRGHmS
Q+uDkJwOO3Aoi5xoRQm/K6c9ACU4wv+Av0l8K9hfncm9HrRrdSJftnvzwCYAtaSy6eqd2gFQ0ylD
dAlprzSs0XsARh3k+kMGo9Xj4V+vX3+98Lesn3+yBuFmEv73r4d/bAXj4Zv68T9Uw4scrXmZtz18
aDjVmBirxEIHBoOgs144qrHqF47SeN+A9GjeNEd1HIXNMiWkI0hnDyPKlks5zx3jaAyp40CMzw7d
Lm3NernuWiMunQtesFY8IyaGEU7jMIxvRYHYxydUEEV3gOLoVnc1LGCaxdtUUG30iTjd9TASYbPm
coSOfscJXp/NOS/fJDCS4cFrYL1B8kUw8N8OgHybJqcdrFuNhRXidFkgypoEjYGP2bYFm+pG1LF4
5HemWCO3sNw9ZikfIx5dLkIGd4BzGgYJk8/brWucOOK7jGUr8tOt6GrYJVPBsP53lUY4ARmP6CIY
V4NK16hiDROvYXoGyCHBlq8B89KOLQFM8nFNfv60VYsE9hrHLd8S++rx9qFF4g4ZuEvrGkAzjJZQ
OJ4JNG1Y4uHQRj4caqXEJFC2FRHYrq+Pwy5qb7u7kStVVaF06xondCC3irJJfnI1sT5ZuOeRczLX
tw1ftlYw+4ur3zmirJrehZlWhG3pnOoT7IOz3+fEClfBJ9TFvbrMq9Bp56pAzxd515IiVs9LdUBO
pvgEE3LlOLtgW50mhChyyfPb59evX59//AF8LKWM3fd5sTf3Ca7NCHOySCr/+8vrOxNfP7/z+Db/
9fD9x/vnl58/35mAwx/e+fb6W0t4rPclP5eqCX0kl3kSBpaQysgZ03wNsYOT/SxLBnvi9VUeh34E
aagKgFgp0q4NpGlaX6G6IPBSmxoFYQSsZ4zeBMTZ7c0lIF5eFySA44pI2JlVMAihs3HJZ6q+dlNk
oQaZSb20JOloO5h0oSNv+u2N8xSh+L5ulW8XlN0MNDu6y/OYxwxTgiJp8EV3QZNgmga/8WkWXJID
UDNJwhQ6VFr4sRfao2ZkcLXYtbEyVOrolA0PzmqOFUaMYrMGjBjHJvKx83ySAIJyk8aseDHk7TM3
deL7HiAJCgbeIMJwxuadNe1GOm8Qi3dpIz+Eph5nIE6wMyLxPJcI1F9J6kEXMiZ2lnlAxws67E+1
AMAzwGmKDAEBFoV8yIiwbSmDlc+BZ22KACM/8aHFqRhIlJoPHaiqKDg7Xt4c2UADRjCQ+PDKDEKe
N1ARkMVw4QdhAE+lALnetyAixEz2/5RdWZPbOJL+K/W0MfOwMTzEayP2ASIpiRYvE9RRfmHUuKvb
FVOuclTZ07376zcTpEQcCao2ot228kuAOBJA4sjMC0fixwl1Pjnh+zh2iR1Lv+OxZ3HOp7Wl1L5P
32GG+/fj98eXn3cY4ddo6EObhSvHd5k+FEZgMqNUvmPmOa+Y/xhZvr4CD8yr+Irm8lmzI8Mo8Hb0
4r6c2fi4M+vufv56eXyTvnB5o6lBo3Lw9P71EfSCl8fXX+933x6ffyhJ9caOfId6OjsNnsCLEmNB
JQ6cQIepirbIHE9ux4WijGV5+P749gCffYGV6RrYXF9A2r6o8Xyu1Id2mvKJrFVrVwQB9UjguiXx
3JVRKaQaMz9SA0N3QGpE5pAY8w9QfddYz5EaGGt/c3Q85hrt3Ry9cOUQm3ugB9RjgxmOiQVF0Jdm
FmCwhXK5MAQh6bNDggPqw0C3r4DNEW3JqWoGYbT8NVONQmpCUCNP9jN0peJbGKPVo3BF9EUURhQ1
onjjODBUhOaYhCuyW5JwceUFBi3+iAa7fhzEZsZHHoaePV3VJ5XjGI0iyOq93Qy4i1M/cLQOeSd8
xfvxi2bC3iXddl7xo+NSRT2ORTXIrsnNO8d32tQ3RmrdNLXjklAVVE2pH6uiZ+a0MjWO7lOwql1j
hgz2ITNWH0H1jSIG+1Webk1tP9gHa7YxtjIp1znzPs73sbwjoOdaMQ2XQDP3kJdlPIg9Q7LZPvLN
MZedkshdUdQwNoc10GMnGo5pRa6MSqFEMTfPD+/frKtEhg+JjJbEZ+Kh0UNADVeh3Dpq3uO62xbm
6nlZeHVMuys61PPVTvrr/efr96f/fbzrj+NqrSzEUgoMvN2SUbllJtw3YxA644LqgsbKKmSA0dkK
Qr7yO0INTeJYUVQVOGdBRDpAMbki+gtV7znKG24N08yWdJS0/1GZvDC0lR9Q16fnNJntc+/S7vhl
pnPqObIpvIoFjvZ4XkFXjnMr++pcQh4Bt7SUQCPz+nJE09WKx45vQRmoQLKLGlM8XEu9NqnjuK6t
XgKlpnWDyV/8uGeTgFxvN0sxQJe72bxx3PEQsustRTmwRFu81CHsabGXCKaiT1zfIuodTLeWT0Pf
+o7bbWzN/LlyMxdakTzeMBjXUMeVskIQE5WYqfrX1+d3DLUN8+Pj8+uPu5fHP+9+f3t9+QkpietU
82BS8GzfHn58QzuyOdz3tRrCw78wdnfpGxi8Ryjaw9G32QtlnWRxBj/EfmTIuHL5jfSsHdjhLPz/
ZfmR/JhgE+77Kvo548zA83KDR7h0iYZ9xYddXrbyq44LfbOeISJnKGcF26q+aZuy2d4PXb6h7oox
wUZc9OcVPg8qZCu7GWyOeTde8bqOo35uZChzJuKrc+Gb21rrsmHZAKKUDZuiq07M1hdYfOXgCWnb
vBqEUwNLiyjYNarBtN+/A7XFtpvFDIAVOjVySOfeFwZelG6oHB5ekPrcikUuIc8eDa5poyJFDbAV
czw06CpTc8FMd1mZZmpLCNLAd81pONRZ3nUHrUcrVhaXi2W9KvsGBjojNSq5DFqiar1wUY0cx63q
r13QoMusciJ5OrDyiLvSjL7UmfETNIh6sayzlMeM6+3AdwsupQUD3p5acu0L1UODGCW8HLL0oH/H
iFwiYS2r8/IiydnT+4/nh/+5ax9eHp81IRCMA8M2ldxzmwz8wIcvsDINfRW0wVD3fhAkIcW6bvJh
V+Cbfy9KMrUmM0d/BHXmdKiGugwpHqphR8Sqqc4seVlkbNhnftC7vk9lv8mLc1EPeygEzO/emsnu
sRS2e1Zvh829EzneKis82DI5mS6OI3NRFnj5C3+BuuraZW/iruumhMWgdaLkS0rf+czcn7JiKHso
RJU7Aa2ozcz7ot5OYwoawUmizDHmnamVc5Zhmct+D9nufHcVnhazlhJAMXYZqEYJJQR1cxQ34UJO
ZKNmkiUMI4/RJaxY3RfnoSrZxgmiU27xwzgnaMqiys8DzmPwz/oA3Uw7y5eSdAVHn867oenRdC+5
1RsNz/APCE8Pal00BH5vn47GJPB/xpu6SIfj8ew6G8df1Te60WIyQAtfx+6zAoZTV4WRm1C7IZIX
z7up/uuaet0M3RokLvNJjutDgTBzw8yhSzUz5f7OEjiZ5A79T87Z4vHMkqBabk2JN46ZM8DPVeDl
G8ddrl0eM+ZYZqILU7OBfG58Pi/2zbDyT8eNu7U0lng/XH4Gsepcfia9Nhjc3PGjY5SdHHcxU+6s
/N4t81uZFj30PIw33keRfDBnY/EtX8W7YZaeV96K7am3MDNrn+GtNsjZie9oSeu7Q3k/rTjRcPp8
3jKK7VhwUECbM4p14iUJVXiYDNoceuzctk4QpF6k3Blo66ScfN0V2ZZcGa+IstTOnirWb0+//aGr
XmlWc7FB0OQq3UHb9pArapMWqxuh4U6zO5Bq4Yve0sQl5IYjveyT0NW6U8UOZ03pwAUYX1jpinSV
bxm+T0HPfll7Rp9B23xYx4EDG6TNSWWuT+W8GVKyR2227Wt/FRqLQ8eyfGh5HKohWDTQcksg9KsC
xbSIaYPKkaNIHO9saG5A9shz7hFFxePS4Uqh+11RY8ShNPSh3VxQFQxlreG7Ys2mq3HSYzPBdisb
ardPsMXL2ZD3tKMyOvSbdqWv30DmdRhAn8aaBogJ2sz1uOMG+jfHZ/cwcbD6HPqku2OdLVI8Kyho
1loATBZ6gYri/mm6N7YCw+VhkbE/uzDYnndcR3S1y9o40ENua7OLOTVoe5uUtsERtezSdmvftVRn
vqGfBY0jl5Oeh8XAKl3ViePYm5nl7S2iX+7rz2iy0vIDddWuqFd53YvjgeHzoej2/DJbbt4evj/e
/fPX77/DljXT96ibNezKM3QAPvcZ0IStyr1MkvvscjQgDgqIYmGm8GdTlGUHM6eSMwJp095DcmYA
sKPZ5mtQ8RWE33M6LwTIvBCg89o0XV5s6yGvs4Ipah6A66bfTQhdqzX8RaaEz/QwbS2lFbVQHu8D
Mcs3oHzm2SC/tsMPsXRfFttdL4sL0DFM0XSEQh0WAQduLrHWPexPSBH49vD2258Pb2ScCuwGIhCu
jBeVFWIdPXRFjwuLGBu8XdMbeYDaY0fN44A0oGXgYaF0OYbN7GbCyZ7WcOK8wvaNUwUrK31jjiU4
MzekTRgxrc02G8uyG8ZTikE/J5H6q5JD+E4EUOvSvCw1IeO+tX2LdTVsz/0qIDVkbGEikAvKH4vJ
2FgATX5cdAHMUTNtKmt/rbuGZXyX53RANKyG7WwBMdjw+U6kfRStHOh9DRqomG+ZL5d+1MwnxH39
8PVfz09/fPt59x930DUX86754HrKHje4wrBpMvabOwoRMyzzddiqqZQYUheOfZ95Aa19zkwtGelx
xk2fmjNmdygx84gHzKcyl44oZ/DiRfU7lTuAcWxxOKBxkY87Zh7Tb6NU/9nnoIHhLa/vMLp4AqTe
zkgsoEbIwZUUJIpjCrmauhOYGoxbyu0IjRiVLVWHdRa6qrhLbdel57SmLU2k3PUY7pPw3xDxS1HE
hbm8qsylxGPZ+Rcoforehr8HcfYDc1xNORCWOI5bmELVvCYkLQ+95yn3VMY90iUZbw617JVa+zE6
6VJJbVoZhCGXYxxfiEWeJvJLMKRnFYONLO46jHx4/tmYE5D+CTpGzQQpA2yJD/1kKnptQkQbzvFe
h2i+S8HGWmnJsvuaoU9dYb1Jq4+ilJMdMEz+aCdq5Wu7Jh029nyOebduODRDV9T93lJYzWXYlXRJ
rdch7cvhyPAUGbVWS6bQzge0LuyI5j9UlXI/Ir5oWlqIGX+X/ad4iynfZl5pcs47DOQI+iTepcFS
9SX/73ClfgLvWSyFbVKtmJAHxh3v0P2xIkxaWyAjy+wdJPAK3WjT1i+iXOJKBjitHOu08mI/ELkV
3oLYAJ7eb2s6gsSYUegLR8Z8OO0K3peqoT7y5G2CLEvlyXIOurjYSWjFGV/ovKaTocPvr2+wmj8+
vn99eH68S9vD1Vo3ff3+/fVFYp0MfIkk/6U4R52qidc+jJPeEmQWzgqzZxGoPnO94tdsDzCBksGb
5Iy5JWPeZsXGlnUO5VnsPVG0IoVd08L38c4dC3k4699BxOi4y9uopV7RsvEw/FXouc6iuH36sopW
zk2p3MOu9tQ0mV4yo1ZbanQBWZTHYrqpszUHMtyaxIXHZGWJW+9Db3YhcoguhA8uodbELYwqPANs
BmHCWLMSlD1ieinEUSYfXxKU+TEvydoLrn2eV2vyDljlq0azMksu6Lxx2OB5Q1be4wnndoDFKF+e
Tqp+P6z79MgzY5gzlKhprRcyxb4/v/7x9PXux/PDT/j9/V0fuKPlJivoQxqJ4wzbhy7LLEF/FL6+
+SAfDGq7CCl8mgxZGIVWM6Sso41LNWYUmg/mi6wfKmqbWcLjXbm2548Xc+t6DFqTiWPtj/GiptnT
xwpX+RH8fWKEK748frgtRFoBznxxbULL+RvLF5YLN1CLDBdT00Wm6ZJrYQWUq9Y9vjy+P7wjagwN
kdtuBQvA8gKBDytuTO/WTxJfLDraY8KVodlc56dlxnZBwARDX5jNRPoy97077L0HuTJkcwnvBrdW
1JHrltY05YVDrzvT7fvxso6z4/Pzn08vaANk9IxRmdFhwOK4A574/8EzHfkvsQbOx3mheIstKDhE
69GDfKEtzL4wnu5IBtGybPePf4FkFy/vP99+oTHYdWCNjyMNNANJkdKTauXFRwizmNnrfFX6Uc5j
anFOcmHEwzLYbBTL85bgqtL1ja9ObNoKYWnIf74+vP32fvfn089v9kalP6E/ATO4PkWemw/5kTYm
+HCnmhkvOoe7MI2uQ3TZpZnEDRfeM1QiTrapsU18FwVfR/tNu0WP8Mq+4suZGhYzaBtVAPXZwnZ1
vHrDf7fFxYR2nByoKNaXjWhZjiN+eS5kaRKZM42x6WWH4dAXJTebAjFXeSGhImcrEi4gWmhaCUW7
Zwviyg/jdWTYnaiN2hW2BG+8sO1XdO771Sqg6YEW/3RGQpcMXikxrKgq7gNfdg8s0QOyCGUahJ5v
AuvMi0PVn+QV6geeUseE1wMH7gelapCmQks1GzlWZolGILDnSr0mnjlWXkk1mAACQsgmYJIx4pMI
W0I+Kjw3ixWRrYwQ+bZCZlCiFEt0LeC5jLg3hBiZzmdCVCaAHnQA+q4Sz1gCVnTz+quEoqNTD7r4
Z8+JLHGorovLeABxQyuaGL1g/UHO6CNZZgxWtiXRxqXcrDEumNPLIQPLeeRSYwHoHtWqOY99lxj+
SPeIPh3pNhnf9lVIvoCbTxHqZuj2vuMT30R3DrETE18ViB9EjPqoAAPSK4XCIhunKUDi2RA/Iia6
C0LL9RXl2cmGJoTYj0UkxbjiVZy44XBKM0LPXmCevGxSebZp5YbxUlchRxQTA24C6OoLMDlbAXuq
0bc7DVhT+U5ItOUE2KQUYag8s0a0kRgD1/vrJh8ItE/G0bgylLAyEqOv62EKjGlR6fogpEYm0um8
gjAm1quRbvtG5BDtJ8hTCrOyPSg2CC43CXAFOpe+Yd72ZeBQBeDFtmIZb+0ILRFXtMu36BaZKP70
yJDB/4VH3uUtfdFtJqX+ljJrPbPnvPJ8MnChzBFS6ucE2OQY4FUQWqJDXw8lmH9jBUQWi3MC6eBl
4GTAg+uGm3EvCIg6CCAkVTuEonBp3hYctGoCkB6jjeCIXGJSEYBHiB0AoCMTq6fwfiY8fZjl2LAk
jqjXBleO2aUYkfMM0iJ9ZfDds3FXozJ459UNVW3mpZplBLP07K7oJuc+87yIfv4zM41q31IpkCUg
mll4VaO0F3yk5RIdhnR6yyGQJdFChpjOMnKJ6RXpXmz5VGSxL1dYqLfEMgOlniE9sJQyIMRJ+J0j
Fg2kU4sD0GOHbnCg0xKJbuwdW6Mni3oYMtA6jkDIcO0SQ0SXNIkIlRHpMbHZOXEmnFMRZfgiDnCS
sPWWd2moqkWkc54rRx/61BZR0Cn9tg9DSpGp2SEOVhYgpkaEADyip0eAmttaFoIWwhRLDfUcSEky
rp94GUSe3cywCoyr6LZj7e6Cjo8zisx8ewdEuYPg57AWJ2r3sBR1eb3tqcDnwNaxk3x5edgV9I0C
5jg9zjBvFH48fn16eBYlMzynYEK2Qls2vYAs7Q70QivQln73KLADvjkxKpyX+4J6GoNgukO7NT1J
uivgF3XHK9DmsGXSmSTSKpaysjQyarsmK/b5PX3IJzITPgfs8L0IlmHFoaO2TY1mgZbC5mhEv1EL
i9EKmkova/4FCmrJZZtX60KWREHcdEYm27LpisbiyhUZjsWRlZZHOohDGYQJoaUg+/tc/+SJlbaI
geMH85OwZ7RV7b4bHQJo2Rbokt2SpuhztSk+sXXH9Bz6U1HvGH15PFa15gUMwcbOUqZtcyJjdAg0
13qkzOvm2Gi0Bvau4zAjqPhDjot4pW82ylPDojtU6zJvWeaN0LWYCG6TlQNkshqIn3Z5XnKNQxk9
2yKtQGxyfVSV+FJaJ96LiAl6c3f5OBhs3yjSruHNptdya/BlSG6M3OpQ9sWSJNZ9oadpuj7fW/uy
ZXUPsw0MEPtU2uY9K+9rSukTMExL6ArhO0EczUsI+mwGQcKKawUFyDNOI2nRaUDJamFsmXJzBkQL
e0t9OENDdLU60zW+no8IAVAWNfVwUuB9ziotpx6lDpYm2bpBAIe6LQ8asauM/tyiFTPjC9Mzr1jX
f2ruMTtLwfpCH5EwW/FcH7pomLc1ptN+1x14XzE9tJfEcsC1emi5b8yLRVE1vW0KOxd11ehJvuRd
o1dFZbjPYHm2jjEOMxoG8DystQYf6SnUBQPWiV8qBytbLutNlO5wdXaiqjrXAuI1nKGnSM5HlGTX
96sS8VIgjJTX7NJCtUhS9CHgWAiWUynHDO2pw6e2OR35bEJHfW9uFGAWbs8v6h38/gfP4L+iudu9
vv+8S+d4LETcekxuj12DKM+ghlb08mTpBgM+cYR8PsJV0M4NBFdzZh39HAvh8XKbFkqR/LiY+3Tp
b8UvVj10R46mRFN0dY0sd/LUpPbPLN6Ri3LSB4Ei4x3+VVDLp8gaPxx2TekYJTrUZ8qBC2LpZxAA
tVI7/lnPYXrubMmj6vd6guZEP06qQBPti5Sav+v8pK02+EuPhjTThsv6byJi2YZVSp5fBLzucAms
MRb47oSOreqtMNgZnTvmxA5FJLva1Ui1FABjvesllFHOCNe+4wUJM9PBckS9Jx5B7odj+GyFevIU
p29jffD1uHyxNFNV/6aC3h862CPASKoti5ngQkeQvrVKAvW0DwovkRQx8cw2Q7pjsYoUDNxPvZUl
3PbYyc0aVMLh82FNrWuCBePFBuoVuEwXFka2tJP1kVbq1k9W1GHMFQ2MBmgD50zUvw2C8xkqUVXk
EjoxTXZTelqrpdhcvYBStK5w6JtFGm3frKlOlVazOd69JniZFztGM/R+kOiCOxvEydSa64nrvD+v
5UBcoyCnDONpmgJepkHikqelAqdCUktAQl0eX6U++MtI1vQeaSU65pnXG89dV6lWeLRWhIGhUQvu
u5vSd+XLPhnwhCRp89T4Vuz56eVff3P/fgfqyF23Xd9Ndmy/XtDHGqFC3f1tVjX/rs10a1Su9e6G
yc8J9EmmKs8gBhoRH7SbvQIqVHUgBF5jm0Kv2jmK1j4v8W3ljwft1zbq357++EPTiMYvwSqwpc2+
0VqY82KNzrHuLwsDtOHDv379wOB376/Pj3fvPx4fv35TvNzSHJdcc9CXBxgvaGfG0+4g7dEEZARS
7PoU1M61SqhSdxXGbmwi4xqpkP6vsitrbhzX1X8l1U/nVs3i3c5DP9CUbGuiLZLsOHlRpRNPt2s6
SzlJ3en76y9AUhIpgnTOqTrTMfGJO0EQBIENr7Lylk5sntt9Ob0/DL50nYMQIFeZQ5ZDulucRGq6
63lElHFTKsivcSOh7a34RZRWKyx0ZQTMain4nM5ZmkD0PFPqVS12UnjWPCRiVQh7vAbebPTu5jeg
Mxi2XE7vwpJiKB0kzO40g4Aufb8Y7Pu9gZRlwUF6IgPZNt+W4/nIjCCsKEGJr8E9nyJA99Svpc/m
Izt9c5ssprOxXf/+k98mHXjs7FJ336URFpeDOdVi98NrA3G5cHwMTH1BB0ppQM5Y5Q29nPLxfGQ3
Jyrj4UgPlmQSRkSXKcrMzmwP6VNq2HK+wjs5TwUFYjAb28UJythJmY2pThOkha/AZDKsFgOywwWl
vgnoU1w7jYP5YEoaeLSI6/HoiirBF966gzQBrPtDyTHoPLHiShBpLwfMJqwS06iuzQlWqBmASKNM
STsg/dPR1M4yTOCoMCcqvRuji2yiL5Aypu74OsBiYd4stg2e0i9tWnoAvGJh8XH05W4yUJ0Za+bP
vzo8xg/6BOMNyvHI2xiYl6OhbllmdNAlJ1aopMBBLxGOfkWxuXrD5G4HfsmTrCQ54Wgxo4YCKL0Q
PwRgSvBKZK6Lab1iSWReG5kA72AJCHV9qgHmo8XUUfH55Hz+wM99PFjkQgxAUI4mA2pLgePGlFgD
mE7tKGV1NZxXbEF1UDJZVGdYPELG/jYixLyCtiFlMhtN6Kvsjm9NFgPvksyn3PSI3lBwrjoi3je9
wEdz8mjTAvKQFSSz7zn+aCjSJVazNF6ef+f59txCZWVyOXIcQbtxdOvaWky0lhoaLwofX6+qpGZx
z1WAPTx9b2E0ot4JYdQDQz2jfxwcvoNaTi5e63shu2IyPANh1eWwgK52uETSYSVL/FOXuJq3q1Qt
pmfKEhFyzyH2fkS1n1yOzyw02tN82+IiYQEbk77HW/4t42hT62xVwV+9yBQWiGeby8Fw7DBD6thS
4p8p0hjeC4lzt65Lw4xHZzBwItmfgViP+OwGpTtav94OjVtF30Kq0Xzo55JotnNJ21l2kPnMYTbU
isw4q/2i/Xw8ODuCY38pRRUMh5dnlqq4lbSkJdS4lDKGkFfY0PyJKUoAM1yc0I0zcZdqH8KlM9eE
2V4JWXmbclh2dZiyJZoSbVgqXN7eRJUe8RaD3kunKmaa8l3WfFea1EyzD2BxFRYM9sk1UPSKs32E
YJr/qKU2pL3CYRm4ihYO76lALtlwuPeQnUwruPHXTHldwV61OY1wHYLtfNJTrnstR+8TScAdeUgf
EBEQTcepKj3La9b7sIVcjft5djcsfCVqRhOjeBmybYWPXhzNbiF7NyTJ0dOBo4gE4z64iLBuHVs+
ehFwfZYu85UaK5Iu34qfpSYOizIJSJzf50XgzlxeVrinkWC7o0HN8qUzE4kZDtwDXkWJ+/PmUlE0
ga5FC3GPqmCozjLUU9vWi6oLd2etmG6Eq6t6U/qo/NpFFd71lixxLCVB3uBSqpN1UulrsCMR3wEP
wP7o3eyqVMOodWXN+IaNqzjpcuk38I1wUgU17jnrkun0diJieLhGpykGbQ76oHaOSJZkcmh8uPFL
g2Ai2kCVS9bGjsGW8Z9HfNxN7Bz9PJVO1do46oJFgZblcrtqfEh1uYpMVzJsR9ctNyKdnrkqJ2Lw
BAGEkl1oedlVtCbmUGlsrkjZhCwvLbxIFTpwFcSlcYZstkbb27Z7IhxMt7ttWIEuAyka7qyUkzWN
bAaOx994q7S1EpfoY02PZqTSha+8rulNFgmVrzBwkP6La0L62AU5Nft3GIiqqVQHFqlilimzmTpG
P+xGJ6kQvA+nl7eXv98vNr9eD6ffdxffPw5v74ZhTxsi1w9tqrQuwtvl1qh8WTGYoNQ7v1b4+tVP
qfMo12QhdHWfhK2jUiN7bGhNPmdKwjhm6OS/dXDaRTIT92f1JqvyeKvdo6l08wo6gzMA7Jx0iOoN
gwXAY81ZIvwQgaqy7Gqrrf4GiF75clborRN3cyoTeez/+fLwj37NiAfw4vD34XR4fjhcPB7ejt/1
dR1xnSlgIWW+0AP0YtIu3AtD5joruWEf/7nCtB6PxVZCm1l2jSGvAEjU5WRh6N81qnVDQIE20Wzq
uLrUUCV3+OYwMA7vkjommo4nlL6xh9EfTZgkPfioSZk4KebLMY22TIYLMlqghuEBD+eDGTXlBO1S
94Gv08rRYDCoee4oW7kUPNdj6zCJ0rMo+yRH9v4oyUtHWF89MxBY4V+QqmgkQK6zIrp2UuNyOBgt
RDzvIKLvXLXirPOwDUFDjl/kx9k+Jd8japAddy0QkPhH8kGKP4dlMB8aERL0YYz2YdDsTEYvMI52
+bReQuTKois4n1aO8UAET0b4yDbY0eqaBrNwKIkVvZ651Ho6oF6zipbvGtRVltIybgOw/YVakE1B
qy0aeupwRtTR/d+X9BlNsMMuzNN5pggcaMZ3Y4disQ+l9YImaubQPfdQ88+g5pcLvnNpWE3mPnIp
58MyhNN05PIRV22X57LQMJ9p3RJEK4emO9mjKYhjU4RPo2S/cITpbMluZiXI7mklyAYzk0YXz98P
z8cH4TOKulcAsSzEMGN8vfXpS/uw0ZQOHNLHOeZBH+bQL+mw/dAVONdELcZ+VMW39iA19ulUZ5Gz
AF+TwTSgOQ0+L78tuYRaI2IJWyIUbXX4B4vVh0Zn8dVo7tCl9lAO3a+Bms1nDk5rouZnGQKiHKpk
A+XUJvdRnyhxMXTtEybK4UrAQuHWWTreBtrgKFl/Hpys1nx1VnJowMnnM96hy7LPoed0YIYeavEZ
FGwm5LLxz2ht0p9zjUuUKi4Nlf8LSnBRbxtyEWLERfZSF0td0/CZipL943SfKjZtqT06K9nazlNN
RedwoME9sNGnYJPxOZg8eayincNLAmpm6Sz0DPBWsnc2xST4K+NXJUXJC57IqwMfdeGlXhrxtFWJ
nHa0rI0BMG8WwIRx9of3CYk4N6wT3ItI+uamzKMU2+3YF8qXj9PDwb6tErETjPsemZIX2TI0uqEs
uCXIN+7yxTdkxRrJ2ANp/HZ6EI1RgQ9zI1TxbsCqqpJiADPdDYn2Oer83YDGVbEHIu+x6/F8UO99
OMEjZh4APrVOffSb2FfTwNfl0o2slz6N6k3pRshw9W66tDvwANKcJ3NvZ6vb/rqquK+/peGKLx85
d9MMBibCDcexViUsWO6x4rjaXTgZ/stXpypm5dw3+PvSQxWvakcewHbs71rgBUXoATRSpm8ppGKE
K1hzzDeNVa+FK9eNuwL4jB0UpPXn7wMBGx2PnJsKItyX/zoAKuTDJLnjJM0KNRnpTRcjmK9jfMdk
95kGkTy2zBeDiXGjXiS7eSLuKXpv6bSphSFM8oi21lABTnzEii9VI73jub9Ns7JOOJ1V05Mq8nAv
BlfHcpWZl4eJoYKqLnLfcsAbRA+rQlnh7Pz8C28Cnd1WbtSI8OQMAJiHw7BE3ePBKd7h7b7JonLw
lbCdFpVDAyOb0hcITSreOrGqdw/XrB2WrrN6XzGnECKW4d7xIn4huE5S0ErzltwX5k167mW+GFVl
nXvnHEKqnO5j2X8iNAvGvay8U6LEKGb0ImAVh6ky9DLZ1p7Cx0OVauAsAqqbOVZtA+nR21pwkElQ
IoEKzybEkaMn+LUfMqh/ZjxHwX5LII0oprnmqpPNVtcWt8IObOTFDaz0/ve25OQoobEy6tVJ6s7c
2Ur9m5uumineC5EAYUbAco6v0OjJgBJsHnBPGWjhkATXboQ4caAFlROATMz5uagjVM92wlQcnl7e
D6+nlwfCDi1EBxH40EqzEG7Tat4LtdbMs12+BX7sep6FbS37EbbUfCMqIyv5+vT2nahfDh2iVQ1/
yqau8bGiZi7eo2BCn9reqne1MUptzRQwRstNVLSR0mF5PD/eHE8H28SuxYqymxeIJfTMf8pfb++H
p4vs+YL/OL7+D74LfDj+DYf5zlmDjACgzvgYjIFQkkotAmfpznGGVwChUmDltqCPy1oEGh6lK4ez
hNZZAwVqogQQ9ZUNwZePj712tP3E1Q2bIcuIFGSxyIjpHUfDlGnmcPOkQPmIERk19barp3Pzy6F0
q0xfAbb0clVYK2x5erl/fHh5cg1hcwK2PDl1azvjTTQ4N91+AdiFqaRqIKqQ7vM/u+hi1y+n6Joe
oettxLltBpozhgqdtMyUuKBKPJevKPz4R7J3dYrobLw3IBtkfSkvFODs/e+/rhzVyfw6WXtP7mke
kkUSmUszFU2hSC5QxdqdvBBWUsFculgE5Pg2+KZwvD1Q7NSlckUyob5tDGeoyovaX3/c/4QZ45y0
gpeibgofdgX0jYvkt7Al1CXNdSSgXNLCqqDGMae3EUEFzr1xU8skQIQbcMPTsnSzBLIPzClKaE/7
0sq6MNyhtelRFmQgWzhih2VkvCqD3piP7rK4YusQ3Q7msYeDCPz4v8DTw7IVyg2bGYrZsT/+PD47
l6CyFN31VZ2qv4mPzRrd9e/Pmzf2n9pQW0k0QSu2VRFetxaJ8ufF+gWAzy8631Okep3tGpebWRqE
OO11KVaH5WEhAtOknJ71BhZ5fsl2lHmGjkPvCWXO9EC4RjasLKNd2AgYTXsIv0+oOlAn8+W2bDJx
KiJQoP8MTuryPoWCGevDdaNTh7swpU4s4b7iwumfaFj47/vDy7OSvagmSzg61rlz2VcoyKpklxPH
ha+C9L3D9OkJ2w8n0zn1nL5DjMdTw2Kmo1iuRvqYvEqnQ4cTcQWRvA92DTjalZTpocIV1eJyPtbe
Kaj0MplOByOifmhg7Gx/AueCgjZ1jUjzH2ly1P2wXT1gotupBFKFPspPrTcxh6OXS7+EODyeRc7z
SoNwGucogNNISNDDInawekGmhDeN3iiMnQD7ZaFGVDq0ftduouWOPtEiNUrc3Q5cgb7xV8QRfb+t
qE7di6Bfl7PRgLInRqpwtWS8W5epHK3HQAxyN8enPEa6+5GooIIUhcbcns+DiLmcewrAnpbPkKaC
ybm0vQgR7plMO1SR7FC0Ic0OPqkTla7RpUwTGF9QTbFgPQKKoLuvZwU5Hi14HtMnKgHAV8seqsNP
qiA6hBdJc2n3W6pLta8A/SOCTsVrMSfV/dBSUKOQO6R8Rd4UPj7meaiL5Dtj9ssTU3F98QDSku0Y
HCg49tobPti/013EjQM68JWING5nAariIBMdLjXoLPI/Y4lSdBlRXOcOftnioIZeQHHHhm5UM/tE
ebQquARZYIA5+FWzfOvENFXZLEp3OeFdmpf12tEtkHX3RItFQejQ8QJfBSi6tKV4iCCnFUYh1wZE
CYJYBMgMSzja08sNX5CshbUKx8cPDr1eWdn90Bye+/OsrRfItFcoYWraOGE3CT+qIosx5L1+eBI0
Vm0c9l+Kvi+HLidMAuDZjRXAsx8bCPzFHZchygDU9RZBkmFgHO+dJVk8+FzTnj8lBF0rO0zFFUBu
jx6Ex0NCR1eBBVjh6xa8kveQ/fezEiPV6ZnDp72GyQPX+kfIOWNkiXI+u1BkceLzAXC3SPLh1DeI
cDzFcKM+hNs7gqC3ZpsejNf4x4TU63jraxU+5STJyhipMW0+Z5Tc4PoGztLfzub2ovz49iaO7d3G
ozxS1EDWXl51iXCoyaM6kORufwNCIwYK78yVQywBnNs9AFLVRUtTiA+HQZmhMPq8JqraxV8HnEPm
sHBjYLORu4JaSPnPwURbEOuLHY2fKBUz1oHWqiFIPkHwly3fCWA+xFbUmnNhl4hhfrK/Tkt/j6Xl
SL53dcmAmI+wtmOVQ+BqEL1aUg3xNra1McqKgtZX6KjAmNc6pYSFWWincYPG4l1mfoaHOmlYjy3o
r4Uk2sO+cX4Wq8tPXx+o+1M/BLdCFCH8ZZWRjEvpHVq5n9W7Yj9CIypf1ytoARJYP8tOakWXMPMp
Ani8RT/5NcE7pERwZrZIDD2rRafvwuW2htKg3tsqiaxBUfSFcPHr6yo419WjRQpn9NIhbRkob38i
yjd4SZKP/QA0nvHVFgHbleN8q+j7speDRs94GGewCYZFYL4sRqIQ9rz1U3fb15PB8BNAnFDuzhKQ
a8dblg7g7XABEQEAUK5fhUmV1btPwDelGM1P5Ovu6qYvFoPZ3tsXBRP34F4Ieh2AvXLs3+TaC41A
/HI4XDGQggk4o9Hb0KCMvFysRXu5RWd5e5s74gUjTB2KgrzewWmLllQ1nOCxn0J6K9fYwfnWUYvx
zb5Wxvs0yj20Lcpb9e506goYISpfSX3OcDwcYKf5RKsWOjkPjTaTwdw7j6VGBxDwwz3sQjUzvJzU
+cihEgNQwJSA6USwZDadKFbmBP01Hw3D+ia6IxFCHajOv7Wr8XAiQC8E7rGTJ8erMEyW7NaKLUJA
xdsA2MLd87jDebMz/MGQ6gBT9Ne+xtuwngqs0S5wLWQM/EBpv7kByg8nfP1yjw4Bnl6ej+8vJyr8
C2qwOKePUEjLHVaVSAsSPgM5yYI0DfLUQDtcmRfF0irm+fH0cnzUfKukQZFFgW5M0WDamz+meYIX
frU70VD8tK9SZLLQAkX0DtMhMp5V9AYo30PW4WrruNCXmTQHsRDNxHylNUBXeRKFlu7uOqFw4a6Q
3K5Xznq0e4I7ixbiryUeFdy1VMMiOBF6C6Fr03LScz28W82Ai3o6pbHUOpcR+vWDYVjnDjMA4VjU
k4uwOrTI0sndzcX76f7h+Pzd1i5DRxgulKoEXwtV6K7GJfB2GDTMpY5ZiAi2SXLbLQ5MKrNtwcPW
SImibWCzqZYhq2xfa9WGXPBE47ovncqeleMteBVS9/8iVE0eh/uw9caUfPx8P77+PPx7OJG2Rtt9
zYL1/HJEXaAhVQQw+aWntO+xGpMgogjNciLLtTuBMsr08MbwSxgL9KOklHGULMn4Z9jHBfydhrwy
LUm7dORJZK8ZILHQsxJ4iuu56DalY6QlWak5QkqEeyI0bNWc0PRsC0SXr44YzEHsYMYY7ECwDlgV
wmDXOStKskykZWUEo8W155/hHkM9rEo7pV7iuzzofI2GnrJqTI7Std53aJqCj25uDQRdiTDlxW0u
olv+0pJ3YSFjXPST5HU8RVhuI5itKQaGT1m1LXoOKqUTLscwCpowcaFXDfN8fb3NKmqys22VrcoJ
1LAbW5lW6x2MnEtiupmyJWOlKmdYJjaD1scMlTEW++P3Dz8OxsxYlZzxDW3BpNBSnHk7fDy+XPwN
E6ybX80KRLvrnpUEJqF2uKLCRklD7U0UB0WoDfJVWKR6PzQCQ7ta8B/ZV9o6IGqmzbuolO7bpI80
armnehBj+AHTacWAy339cnx7WSyml78Pv+hkDI6co6naZGxE9DFovXjfDhDpHsuALPTw3z3KyFn6
YvqJjOeujGfOImdDJ2XkpIydlIm7AbPzDZjNPJ9T/uUNyOV45qjXpbPLL8euVl5OLl2t1KOWIyUq
M5xU9cJZ++HINKVyYIb9DFjJIypsnl6q9VFDoE/lOoKKsaHTHe2cukqkn1PpCMpeTadf0iUOx64i
h1RANAMwNbO8yqJFXRBpWzMNfXKCBM1SO5mHGNuPSoetf1tkBKXIWBWRed0WURxHvN8+pK1ZGEeU
2UMLKEI9am2THEEFpd1on5Buo8rRTFk7qw6wxV71YlIamG21osKowAkDJ7a+f6ikOkWb1Ti6E8Gu
W/eYlNCW1TfXushoiELyhcvh4eN0fP9lO/nEd8N66fi7LsLrbYhyl70/NttYWJQRbCtphV8UINBQ
+0uFwXDDQBbSmTVKIadJNwuvgw2IVaEM8U3liRghf0RcYrRNM+RbKRXBeUvcnVZFxCsboG+twtPi
hhVBmEKNUOjhWX5bo5tOLuLm6U/X+jBKigMBEcUneZTRyq6gulx8mcDwbsI4D4szZBBYq83XL3++
fTs+//nxdjg9vTwefv9x+Pl6OLUbs9qztdYz7XlYXCZfv/y8f37El4O/4X8eX/73+bdf90/38Ov+
8fX4/Nvb/d8HaMHx8TcM/fUdJ8pv317//iLnztXh9Hz4efHj/vR4eMYDVjeH1IOLp5fTr4vj8/H9
eP/z+H/3SNU8tHDotlLIeiCLF7C2ogrbBcK/Jv+QKIxu3EFEEporXMH4p6F5PGlJMG5N7g7p1oBi
EeQ5CFB4XYuzoO3hLLUKRSNlYC4ahBQnHX3UkN1d3FrU9xdw23G4lLLWFejp1+v7y8XDy+lw8XK6
kDNFGwsBhlatWa47RNGTR3Z6yAIy0YaWVzzKN/q87hHsTzZMd+mqJdrQIl1TaSSwFWWtijtrwlyV
v8pzG32lH7ybHPAa0YbCrgGCi52vSnd+gCauIhKA9IvcR61Xw9Ei2caaE1BJSLeGE6Mu0S5J/BNY
OcA63ACbtuCmP2mV2D5Ck6elj28/jw+//3P4dfEgZuP30/3rj1/WJCxKZuUU2DMh5HYtQh5srCqH
vAhKw6V/M/US6iK6af+22IWj6VTEGpMK4I/3H4fn9+PD/fvh8SJ8Fo2AJXfxv8f3Hxfs7e3l4ShI
wf37veGDTeXIyaf8ash4YlWcb2CXZaNBnsW3w/FgSiy1dYTxrKwvy/A62hEtDiE/4E476wy8FM/H
cRN5s8aDLzmRFV9Rl+sNsSqoTyrSPWlTtaXVvri4sZqWrWxcjlXsA/fEwgARAZ/n2eti0/axNeHR
83W1tUcHQ4zumrm9uX/74eq+hNkTdUMl7ume3vU8xcuHQ8fvh7d3u7CCj0d2X4hkIuv9HvkprYaT
iGXMrsIRfYtmQDxDC6VXw0EQrWxGtTGifzfD6ZrvSTAh0ghcBPNcWNVQ/VkkwZCMXKjRZ6ab5JYw
mtIntA4xHlHn1GZdbtjQqi0kQrZU8nRIbKQbNrbXezK2gRWIH8tsTfRAtS6Glx7ed5NjyYrt8ePr
D+OBcct87PUFaXUVWdVbxtmN6aC9R1BmiBTPYOh+PaIUhy0CzyPN9zbNnh6Yavc3WrT0K74S/1Jb
B4tL5hvphnfbwxIWORyOiCG053Z1k5lBhcz0ptXNQL08vZ4Ob29SyO7XGKSeuOfVuMds7zKroMXE
noDxnV1RSNtwYsXclZX98rSAM8fL00X68fTtcLpYH54Pp+Zk0P+epWVU87wgteJNw4rluhdRQaeQ
nFZSKPlSUOT2ZROsxL8iPE+EaACQ39pMHgrAR+N9Ifzn8dvpHoT+08vH+/GZ2DLiaEkuL0xX3LYx
tLWGTMOQNDkx28+pIiSE/rqVirQK9EfNBHpmHOACRzObPQCkwegu/HrZZzQF38gDug4mq9zm5Guy
NwdLDqNADi6+uSG4B8Z1gAPkTZS63nFowDzi2Z6HLmeSHVAZLxWOd14aspw6/KFp1RMvMpnDNMYC
Vi4jGgsJ/fQ5YOhwJ0DlOBpMzuZ67XjkbUDQU8H5/ouSdRUKvYRXdkKoirX0iY6kHibaqH5EGX1U
2SrEiUKsSNFZRZWHnIyi0YE4B6HBMWOFVXBJhkjRi0nibB3xer2PXTO/Q3geDRsNG23Pzv7Gfirj
pRBDYD+lLhvL2yQJUfkn1IVoX6g9nOuI+XYZK0y5XTphVZ4YmJYx7KeDy5qHhdJGhuqCWTMMv+Ll
Ap0/7pCKefQRTd4q/Un/co52IyXeebRfdQpYQcfzOH5OW2hEa9RV5qG8eMaL4UZpat+OHk7v6JwB
TrZvwpUxhnG5f/84HS4efhwe/jk+f+/2ryQLtjEayAtt7NcvD/Dx25/4BcBqOPn/8Xp4avWT8vpR
1wUXka7Isenl1y/9r8N9VTC9q63vLUQttpTJ4HKmdUkIfwSsuO1Xh+5AmTPss/wqjsqKBjc3xp/o
QdHVsVMuwIBOrKgLlq71/RKf5Bk9toxA6EevgFoviF1S7JcUtXmvA6eFlOe39aoQpsv6RNQhcZj2
qDwrAl0MQX+mYZ1ukyUUpL0VFLOLxXa2OY/qyIxwJmqL9/08yfd8sxamEUVonB858CqQvoyk4czk
fbBAxbnTwTt4HVVb0kCpOS/rP9uLFpOtCQrwinB56wgwpEMonqQArLiRs7f35TJy1NC8KoaEiat8
6s4QZBZbWcAX+oilQZaY7VYkOBaIdxEYBspMDUI7/Q7FIxCDY2NxwnGjy+NJT9Xy0NInRIni2EHm
MiFrsr/DZL2LZUq9J6NLKaKwdc2pzyI2o/tc0Xvxri1itYFlQuRbAlentllFXvK/iI8cd4BdP9Tr
O/2ZuEaI74zogDphYi9Y/QKs3RLR0RwsccFqCnars58Sl7du+brpR1oUMQ51i6kUncCJQJAsFxdg
vYC2UMWYFWgquBHHrx7rwALKsNrmds6YkGZp82GdGIwHqQxfYinjqc4sSifUJXUcLdex7Bqix6os
iXC9ai7W7+qKaZpMfNkN5wuNPyZ5BAtHm+zRchVoLc2iAGMawO5T3Pban2ZQm1roerXdEK+2gjDP
DAaW47sr+kIsW/7F1o79r8Ldjrx6brc9azcz7wwbyUGkvp6Oz+//XNzDl49Phzf9JlGznopS5RyY
vniWdM7imLTk49KsFPaSdQy7YNzeA82diOttFFZfJ+2IKJnLymHS1WKZZVVTlSB0hZQMblOGvuIs
8Zeiy8CmehiC22SZoXgaFgXgXL6r8FP4P2z4y6xvFKzGyNnvrULp+PPw+/vxSYkqbwL6INNPts2A
ik+dbFEltwm5Fs5wVUBN6xtWpF+Hg9HEnEs5enbHdpH+2UIWiGwBo3fDJkTfFeiuAaZ2TJnUqdUa
iuhjaPaWMCNedp8iqldnaWy8OpS5rDK0P15tU/kJi0GGrscj6hJE/+AmZFdoE1HzXEbXbITCz/at
GAmhJDs+NKsnOHz7+P4dr4Oj57f308eTCvqqWZaupaNh08uDWb+SaGQpWNhNzRzqhhaGF5ACmaC5
rqcQlWH/Yn67LE22o9Lh8MJS+G+2q5dFdhWmeqd9qhvMCqD5ZBjbLe073NINFtp8NWtOXPdwkAjT
0jDBlZkhtcf6e4RmZVh3zyLj7CY1zobiYJdFZZYa0r3ME9gyTFti8BTBZxBkAle9s75JtR3fk7Cb
rLhyZ4IPfnGdns0GlgiskMb429Hmfi8O+8WWMaMWpDgCqfkAkkgMa9KuckNx8xFhG7LFLUBjIcDm
AkUK06DP9eSXu8ROEdd6aEVl1wSIDtcdLT1fgzi9pnVKEpRmSbIVAgJtLaWWgfAFJyxWNOFEmtxc
MVyKttZUUnHcUQZIM0BFFZyoaxYESt7um7d0K6rXpRvpeEheaSLoInt5ffvtIn55+OfjVbLEzf3z
d92wmgkP6cCnDcHOSEbb/m0I88Mg4ozOttXXQStSwbEShcSwgtmly7NltqqcRNziQWxiiQ4TJXwG
01ZNGy8sod7gg9GKlbQPmptr2JxgiwoySl4Q2h5Zivkawtej0v4P9p7HD9xwCK4nJ3fvJYFMVNca
ehrK6cbgU3mb448jchWGuWRzUgmChggdZ//P2+vxGY0ToAlPH++Hfw/wx+H94Y8//vgf3fcn5laA
OL+twr2uIlHzTMVL6qc74MVNGSZWqpTigcdAhe1Fq15viFNCG7GcOnfj8xCYT/jyou6rE25uZJV8
PLzkK/N7bcD/m84zzgVVwXSTRCEHoRXcNi3hKAbjLbUB/S65kozZXMH/yN358f79/gK35QdUdb31
BwvVZnYv5pjs4WrkyatheKjfQ6VTtwpx60jrgFUMhehi2zyg6a0QR43N/HkBHZFWEYvLpr2wu1HL
pje6jRgLWyF6oGpHTUu3xlOjFeFK+47sG5EFjiAlPQMtvC61I23jM9+ovNlW4DZSfC06wbWZv3AY
T/ltlVFvf8VG28rIokoa45RUkVonYqeHxqH+sAfBJzI4+QQS5KC06lvlcvWhzMU4GzH0A0UtvFYz
EITyAa0STYUnezGc96cnaji36U2UBvhqXg/9jm+NJaW/KLY9hbya7+4DCjQ1Snm8DcKvX57uH378
+YiV+B3+PL38UX7p6tHqZVq4QP758fyg7v7/+PFF0/zBubGM1hv6fG62Vj+cV4e3d2QfuFVwdLR8
//2gny6utimpk2xWIJ5LM7TU/Uuer/TOyFZi6Nx4x8MyNKFtM/SNLh4dLGEFRBQ8Ucipl2v7tEJ3
TUOYkjKxt1mBUjhpbY5IPHoW2wQVSUzX3UhicQ3VCpm8bhj8OxnA/7RFCzMXVeW4qnHjQBMGsvEw
WZ1KFt+IadsKsnM48ZRYTpBxUWNaeJScfxnJMaF90fd0OP8PEbbT2hu9AQA=
--===============7563814235093446509==--

