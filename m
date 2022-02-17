Content-Type: multipart/mixed; boundary="===============2079470604450579282=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:guest-rebased 44/133] drivers/acpi/tables.c:217:4: warning: Value stored to 'p' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 18 Feb 2022 03:47:20 +0800
Message-ID: <202202180225.D7WvTnYI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2079470604450579282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.co=
m>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-rebased
head:   36c91f6d572820e8556972fd7644bd96798e85d6
commit: 44fa9baac88cba252676a6aa3c72b84ce692adc3 [44/133] ACPI/table: Print=
 MADT Wake table information
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20218/202202180225.D7WvTnYI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7c=
b56526f2572c74449fcf97c1fcda42b41d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/44fa9baac88cba252676a6aa3c72b=
84ce692adc3
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-rebased
        git checkout 44fa9baac88cba252676a6aa3c72b84ce692adc3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   fs/crypto/hkdf.c:156:3: note: Taking false branch
                   BUILD_BUG_ON(sizeof(counter) !=3D 1);
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
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
   fs/crypto/hkdf.c:156:3: note: Loop condition is false.  Exiting loop
                   BUILD_BUG_ON(sizeof(counter) !=3D 1);
                   ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
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
   fs/crypto/hkdf.c:157:7: note: Assuming the condition is false
                   if (okmlen - i < HKDF_HASHLEN) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/crypto/hkdf.c:157:3: note: Taking false branch
                   if (okmlen - i < HKDF_HASHLEN) {
                   ^
   fs/crypto/hkdf.c:165:8: note: Assuming 'err' is 0
                           if (err)
                               ^~~
   fs/crypto/hkdf.c:165:4: note: Taking false branch
                           if (err)
                           ^
   fs/crypto/hkdf.c:136:14: note: Assuming 'i' is < 'okmlen'
           for (i =3D 0; i < okmlen; i +=3D HKDF_HASHLEN) {
                       ^~~~~~~~~~
   fs/crypto/hkdf.c:136:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < okmlen; i +=3D HKDF_HASHLEN) {
           ^
   fs/crypto/hkdf.c:139:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/crypto/hkdf.c:139:3: note: Taking false branch
                   if (err)
                   ^
   fs/crypto/hkdf.c:142:7: note: Assuming 'prev' is null
                   if (prev) {
                       ^~~~
   fs/crypto/hkdf.c:142:3: note: Taking false branch
                   if (prev) {
                   ^
   fs/crypto/hkdf.c:149:7: note: Assuming 'err' is not equal to 0
                   if (err)
                       ^~~
   fs/crypto/hkdf.c:149:3: note: Taking true branch
                   if (err)
                   ^
   fs/crypto/hkdf.c:150:4: note: Control jumps to line 173
                           goto out;
                           ^
   fs/crypto/hkdf.c:173:15: note: 'err' is not equal to 0
           if (unlikely(err))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/crypto/hkdf.c:173:2: note: Taking true branch
           if (unlikely(err))
           ^
   fs/crypto/hkdf.c:174:20: note: Passing null pointer value via 1st parame=
ter 's'
                   memzero_explicit(okm, okmlen); /* so caller doesn't need=
 to */
                                    ^~~
   fs/crypto/hkdf.c:174:3: note: Calling 'memzero_explicit'
                   memzero_explicit(okm, okmlen); /* so caller doesn't need=
 to */
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:237:2: note: Null pointer passed as 1st argument =
to memory set function
           memset(s, 0, count);
           ^      ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/acpi/tables.c:217:4: warning: Value stored to 'p' is never read =
[clang-analyzer-deadcode.DeadStores]
                           p =3D (struct acpi_madt_multiproc_wakeup *)heade=
r;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/tables.c:217:4: note: Value stored to 'p' is never read
                           p =3D (struct acpi_madt_multiproc_wakeup *)heade=
r;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   net/core/skbuff.c:741:6: warning: Access to field 'head' results in a de=
reference of a null pointer (loaded from variable 'skb') [clang-analyzer-co=
re.NullDereference]
           if (likely(skb->head))
               ^
   include/linux/compiler.h:77:39: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                              ^
   net/core/skbuff.c:1336:6: note: Assuming 'have_uref' is true
           if (have_uref)
               ^~~~~~~~~
   net/core/skbuff.c:1336:2: note: Taking true branch
           if (have_uref)
           ^
   net/core/skbuff.c:1337:3: note: Calling 'msg_zerocopy_callback'
                   msg_zerocopy_callback(NULL, uarg, true);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skbuff.c:1324:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&uarg->refcnt))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skbuff.c:1324:2: note: Taking true branch
           if (refcount_dec_and_test(&uarg->refcnt))
           ^
   net/core/skbuff.c:1325:3: note: Calling '__msg_zerocopy_callback'
                   __msg_zerocopy_callback(uarg);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skbuff.c:1285:6: note: Assuming field 'len' is not equal to 0
           if (!uarg->len || sock_flag(sk, SOCK_DEAD))
               ^~~~~~~~~~
   net/core/skbuff.c:1285:6: note: Left side of '||' is false
   net/core/skbuff.c:1285:20: note: Assuming the condition is false
           if (!uarg->len || sock_flag(sk, SOCK_DEAD))
                             ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skbuff.c:1285:2: note: Taking false branch
           if (!uarg->len || sock_flag(sk, SOCK_DEAD))
           ^
   net/core/skbuff.c:1299:6: note: Assuming 'is_zerocopy' is true
           if (!is_zerocopy)
               ^~~~~~~~~~~~
   net/core/skbuff.c:1299:2: note: Taking false branch
           if (!is_zerocopy)
           ^
   net/core/skbuff.c:1303:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&q->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   net/core/skbuff.c:1303:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&q->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   net/core/skbuff.c:1305:6: note: Assuming 'tail' is non-null
           if (!tail || SKB_EXT_ERR(tail)->ee.ee_origin !=3D SO_EE_ORIGIN_Z=
EROCOPY ||
               ^~~~~
   net/core/skbuff.c:1305:6: note: Left side of '||' is false
   net/core/skbuff.c:1305:15: note: Assuming field 'ee_origin' is not equal=
 to SO_EE_ORIGIN_ZEROCOPY
           if (!tail || SKB_EXT_ERR(tail)->ee.ee_origin !=3D SO_EE_ORIGIN_Z=
EROCOPY ||
                        ^
   include/linux/errqueue.h:12:26: note: expanded from macro 'SKB_EXT_ERR'
   #define SKB_EXT_ERR(skb) ((struct sock_exterr_skb *) ((skb)->cb))
                            ^
   net/core/skbuff.c:1305:72: note: Left side of '||' is true
           if (!tail || SKB_EXT_ERR(tail)->ee.ee_origin !=3D SO_EE_ORIGIN_Z=
EROCOPY ||
                                                                           =
      ^
   net/core/skbuff.c:1308:3: note: Null pointer value stored to 'skb'
                   skb =3D NULL;
                   ^~~~~~~~~~
   net/core/skbuff.c:1315:14: note: Passing null pointer value via 1st para=
meter 'skb'
           consume_skb(skb);
                       ^~~
   net/core/skbuff.c:1315:2: note: Calling 'consume_skb'
           consume_skb(skb);
           ^~~~~~~~~~~~~~~~
   net/core/skbuff.c:910:6: note: Assuming the condition is false
           if (!skb_unref(skb))
               ^~~~~~~~~~~~~~~
   net/core/skbuff.c:910:2: note: Taking false branch
           if (!skb_unref(skb))
           ^
   net/core/skbuff.c:914:14: note: Passing null pointer value via 1st param=
eter 'skb'
           __kfree_skb(skb);
                       ^~~
   net/core/skbuff.c:914:2: note: Calling '__kfree_skb'
           __kfree_skb(skb);
           ^~~~~~~~~~~~~~~~
   net/core/skbuff.c:756:18: note: Passing null pointer value via 1st param=
eter 'skb'
           skb_release_all(skb);
                           ^~~

vim +/p +217 drivers/acpi/tables.c

4fc0a7e889e554 Lv Zheng                   2014-05-31   57  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   58  void acpi_table_=
print_madt_entry(struct acpi_subtable_header *header)
^1da177e4c3f41 Linus Torvalds             2005-04-16   59  {
^1da177e4c3f41 Linus Torvalds             2005-04-16   60  	if (!header)
^1da177e4c3f41 Linus Torvalds             2005-04-16   61  		return;
^1da177e4c3f41 Linus Torvalds             2005-04-16   62  =

^1da177e4c3f41 Linus Torvalds             2005-04-16   63  	switch (header-=
>type) {
^1da177e4c3f41 Linus Torvalds             2005-04-16   64  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   65  	case ACPI_MADT_=
TYPE_LOCAL_APIC:
^1da177e4c3f41 Linus Torvalds             2005-04-16   66  		{
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   67  			struct acpi_m=
adt_local_apic *p =3D
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   68  			    (struct a=
cpi_madt_local_apic *)header;
07f438df228864 Hanjun Guo                 2015-03-24   69  			pr_debug("LAP=
IC (acpi_id[0x%02x] lapic_id[0x%02x] %s)\n",
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   70  				 p->processo=
r_id, p->id,
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   71  				 (p->lapic_f=
lags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
^1da177e4c3f41 Linus Torvalds             2005-04-16   72  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16   73  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16   74  =

7237d3de78ff89 Suresh Siddha              2009-03-30   75  	case ACPI_MADT_=
TYPE_LOCAL_X2APIC:
7237d3de78ff89 Suresh Siddha              2009-03-30   76  		{
7237d3de78ff89 Suresh Siddha              2009-03-30   77  			struct acpi_m=
adt_local_x2apic *p =3D
7237d3de78ff89 Suresh Siddha              2009-03-30   78  			    (struct a=
cpi_madt_local_x2apic *)header;
07f438df228864 Hanjun Guo                 2015-03-24   79  			pr_debug("X2A=
PIC (apic_id[0x%02x] uid[0x%02x] %s)\n",
7237d3de78ff89 Suresh Siddha              2009-03-30   80  				 p->local_ap=
ic_id, p->uid,
730bf5ebb4dfb3 Hanjun Guo                 2014-02-20   81  				 (p->lapic_f=
lags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
7237d3de78ff89 Suresh Siddha              2009-03-30   82  		}
7237d3de78ff89 Suresh Siddha              2009-03-30   83  		break;
7237d3de78ff89 Suresh Siddha              2009-03-30   84  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   85  	case ACPI_MADT_=
TYPE_IO_APIC:
^1da177e4c3f41 Linus Torvalds             2005-04-16   86  		{
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   87  			struct acpi_m=
adt_io_apic *p =3D
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   88  			    (struct a=
cpi_madt_io_apic *)header;
07f438df228864 Hanjun Guo                 2015-03-24   89  			pr_debug("IOA=
PIC (id[0x%02x] address[0x%08x] gsi_base[%d])\n",
^1da177e4c3f41 Linus Torvalds             2005-04-16   90  				 p->id, p->a=
ddress, p->global_irq_base);
^1da177e4c3f41 Linus Torvalds             2005-04-16   91  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16   92  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16   93  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   94  	case ACPI_MADT_=
TYPE_INTERRUPT_OVERRIDE:
^1da177e4c3f41 Linus Torvalds             2005-04-16   95  		{
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   96  			struct acpi_m=
adt_interrupt_override *p =3D
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   97  			    (struct a=
cpi_madt_interrupt_override *)header;
730bf5ebb4dfb3 Hanjun Guo                 2014-02-20   98  			pr_info("INT_=
SRC_OVR (bus %d bus_irq %d global_irq %d %s %s)\n",
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02   99  				p->bus, p->s=
ource_irq, p->global_irq,
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  100  				mps_inti_fla=
gs_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  101  				mps_inti_fla=
gs_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2]);
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  102  			if (p->inti_f=
lags  &
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  103  			    ~(ACPI_MA=
DT_POLARITY_MASK | ACPI_MADT_TRIGGER_MASK))
730bf5ebb4dfb3 Hanjun Guo                 2014-02-20  104  				pr_info("INT=
_SRC_OVR unexpected reserved flags: 0x%x\n",
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  105  					p->inti_fla=
gs  &
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  106  					~(ACPI_MADT=
_POLARITY_MASK | ACPI_MADT_TRIGGER_MASK));
^1da177e4c3f41 Linus Torvalds             2005-04-16  107  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  108  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16  109  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  110  	case ACPI_MADT_=
TYPE_NMI_SOURCE:
^1da177e4c3f41 Linus Torvalds             2005-04-16  111  		{
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  112  			struct acpi_m=
adt_nmi_source *p =3D
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  113  			    (struct a=
cpi_madt_nmi_source *)header;
730bf5ebb4dfb3 Hanjun Guo                 2014-02-20  114  			pr_info("NMI_=
SRC (%s %s global_irq %d)\n",
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  115  				mps_inti_fla=
gs_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  116  				mps_inti_fla=
gs_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
4be44fcd3bf648 Len Brown                  2005-08-05  117  				p->global_ir=
q);
^1da177e4c3f41 Linus Torvalds             2005-04-16  118  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  119  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16  120  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  121  	case ACPI_MADT_=
TYPE_LOCAL_APIC_NMI:
^1da177e4c3f41 Linus Torvalds             2005-04-16  122  		{
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  123  			struct acpi_m=
adt_local_apic_nmi *p =3D
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  124  			    (struct a=
cpi_madt_local_apic_nmi *)header;
730bf5ebb4dfb3 Hanjun Guo                 2014-02-20  125  			pr_info("LAPI=
C_NMI (acpi_id[0x%02x] %s %s lint[0x%x])\n",
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  126  				p->processor=
_id,
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  127  				mps_inti_fla=
gs_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK	],
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  128  				mps_inti_fla=
gs_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
4be44fcd3bf648 Len Brown                  2005-08-05  129  				p->lint);
7237d3de78ff89 Suresh Siddha              2009-03-30  130  		}
7237d3de78ff89 Suresh Siddha              2009-03-30  131  		break;
7237d3de78ff89 Suresh Siddha              2009-03-30  132  =

7237d3de78ff89 Suresh Siddha              2009-03-30  133  	case ACPI_MADT_=
TYPE_LOCAL_X2APIC_NMI:
7237d3de78ff89 Suresh Siddha              2009-03-30  134  		{
7237d3de78ff89 Suresh Siddha              2009-03-30  135  			u16 polarity,=
 trigger;
7237d3de78ff89 Suresh Siddha              2009-03-30  136  			struct acpi_m=
adt_local_x2apic_nmi *p =3D
7237d3de78ff89 Suresh Siddha              2009-03-30  137  			    (struct a=
cpi_madt_local_x2apic_nmi *)header;
7237d3de78ff89 Suresh Siddha              2009-03-30  138  =

7237d3de78ff89 Suresh Siddha              2009-03-30  139  			polarity =3D =
p->inti_flags & ACPI_MADT_POLARITY_MASK;
7237d3de78ff89 Suresh Siddha              2009-03-30  140  			trigger =3D (=
p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2;
7237d3de78ff89 Suresh Siddha              2009-03-30  141  =

730bf5ebb4dfb3 Hanjun Guo                 2014-02-20  142  			pr_info("X2AP=
IC_NMI (uid[0x%02x] %s %s lint[0x%x])\n",
7237d3de78ff89 Suresh Siddha              2009-03-30  143  				p->uid,
7237d3de78ff89 Suresh Siddha              2009-03-30  144  				mps_inti_fla=
gs_polarity[polarity],
7237d3de78ff89 Suresh Siddha              2009-03-30  145  				mps_inti_fla=
gs_trigger[trigger],
7237d3de78ff89 Suresh Siddha              2009-03-30  146  				p->lint);
^1da177e4c3f41 Linus Torvalds             2005-04-16  147  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  148  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16  149  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  150  	case ACPI_MADT_=
TYPE_LOCAL_APIC_OVERRIDE:
^1da177e4c3f41 Linus Torvalds             2005-04-16  151  		{
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  152  			struct acpi_m=
adt_local_apic_override *p =3D
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  153  			    (struct a=
cpi_madt_local_apic_override *)header;
730bf5ebb4dfb3 Hanjun Guo                 2014-02-20  154  			pr_info("LAPI=
C_ADDR_OVR (address[%p])\n",
^1da177e4c3f41 Linus Torvalds             2005-04-16  155  				(void *)(uns=
igned long)p->address);
^1da177e4c3f41 Linus Torvalds             2005-04-16  156  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  157  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16  158  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  159  	case ACPI_MADT_=
TYPE_IO_SAPIC:
^1da177e4c3f41 Linus Torvalds             2005-04-16  160  		{
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  161  			struct acpi_m=
adt_io_sapic *p =3D
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  162  			    (struct a=
cpi_madt_io_sapic *)header;
07f438df228864 Hanjun Guo                 2015-03-24  163  			pr_debug("IOS=
APIC (id[0x%x] address[%p] gsi_base[%d])\n",
4be44fcd3bf648 Len Brown                  2005-08-05  164  				 p->id, (voi=
d *)(unsigned long)p->address,
4be44fcd3bf648 Len Brown                  2005-08-05  165  				 p->global_i=
rq_base);
^1da177e4c3f41 Linus Torvalds             2005-04-16  166  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  167  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16  168  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  169  	case ACPI_MADT_=
TYPE_LOCAL_SAPIC:
^1da177e4c3f41 Linus Torvalds             2005-04-16  170  		{
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  171  			struct acpi_m=
adt_local_sapic *p =3D
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  172  			    (struct a=
cpi_madt_local_sapic *)header;
07f438df228864 Hanjun Guo                 2015-03-24  173  			pr_debug("LSA=
PIC (acpi_id[0x%02x] lsapic_id[0x%02x] lsapic_eid[0x%02x] %s)\n",
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  174  				 p->processo=
r_id, p->id, p->eid,
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  175  				 (p->lapic_f=
lags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
^1da177e4c3f41 Linus Torvalds             2005-04-16  176  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  177  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16  178  =

5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  179  	case ACPI_MADT_=
TYPE_INTERRUPT_SOURCE:
^1da177e4c3f41 Linus Torvalds             2005-04-16  180  		{
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  181  			struct acpi_m=
adt_interrupt_source *p =3D
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  182  			    (struct a=
cpi_madt_interrupt_source *)header;
730bf5ebb4dfb3 Hanjun Guo                 2014-02-20  183  			pr_info("PLAT=
_INT_SRC (%s %s type[0x%x] id[0x%04x] eid[0x%x] iosapic_vector[0x%x] global=
_irq[0x%x]\n",
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  184  				mps_inti_fla=
gs_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  185  				mps_inti_fla=
gs_trigger[(p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2],
5f3b1a8b6737b0 Alexey Starikovskiy        2007-02-02  186  				p->type, p->=
id, p->eid, p->io_sapic_vector,
4be44fcd3bf648 Len Brown                  2005-08-05  187  				p->global_ir=
q);
^1da177e4c3f41 Linus Torvalds             2005-04-16  188  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  189  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16  190  =

4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  191  	case ACPI_MADT_=
TYPE_GENERIC_INTERRUPT:
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  192  		{
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  193  			struct acpi_m=
adt_generic_interrupt *p =3D
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  194  				(struct acpi=
_madt_generic_interrupt *)header;
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  195  			pr_debug("GIC=
C (acpi_id[0x%04x] address[%llx] MPIDR[0x%llx] %s)\n",
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  196  				 p->uid, p->=
base_address,
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  197  				 p->arm_mpid=
r,
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  198  				 (p->flags &=
 ACPI_MADT_ENABLED) ? "enabled" : "disabled");
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  199  =

4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  200  		}
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  201  		break;
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  202  =

4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  203  	case ACPI_MADT_=
TYPE_GENERIC_DISTRIBUTOR:
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  204  		{
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  205  			struct acpi_m=
adt_generic_distributor *p =3D
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  206  				(struct acpi=
_madt_generic_distributor *)header;
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  207  			pr_debug("GIC=
 Distributor (gic_id[0x%04x] address[%llx] gsi_base[%d])\n",
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  208  				 p->gic_id, =
p->base_address,
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  209  				 p->global_i=
rq_base);
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  210  		}
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  211  		break;
4c1c8d7a7ebc8b Hanjun Guo                 2015-03-24  212  =

44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  213  	case ACPI_MADT_=
TYPE_MULTIPROC_WAKEUP:
44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  214  		{
44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  215  			struct acpi_m=
adt_multiproc_wakeup *p;
44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  216  =

44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15 @217  			p =3D (struct=
 acpi_madt_multiproc_wakeup *)header;
44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  218  =

44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  219  			pr_debug("MP =
Wake (Mailbox version[%d] base_address[%llx])\n",
44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  220  				 p->mailbox_=
version, p->base_address);
44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  221  		}
44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  222  		break;
44fa9baac88cba Kuppuswamy Sathyanarayanan 2021-04-15  223  =

^1da177e4c3f41 Linus Torvalds             2005-04-16  224  	default:
730bf5ebb4dfb3 Hanjun Guo                 2014-02-20  225  		pr_warn("Found=
 unsupported MADT entry (type =3D 0x%x)\n",
^1da177e4c3f41 Linus Torvalds             2005-04-16  226  			header->type);
^1da177e4c3f41 Linus Torvalds             2005-04-16  227  		break;
^1da177e4c3f41 Linus Torvalds             2005-04-16  228  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  229  }
^1da177e4c3f41 Linus Torvalds             2005-04-16  230  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2079470604450579282==--

