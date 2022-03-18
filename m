Content-Type: multipart/mixed; boundary="===============3875953267334569448=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:guest-rebased 44/129] drivers/acpi/tables.c:217:4: warning: Value stored to 'p' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 18 Mar 2022 17:37:33 +0800
Message-ID: <202203181724.yKNVb27S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3875953267334569448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.co=
m>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-rebased
head:   6d6cab7288e23cfe0084bd1c214e3649146eb159
commit: 44fa9baac88cba252676a6aa3c72b84ce692adc3 [44/129] ACPI/table: Print=
 MADT Wake table information
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20318/202203181724.yKNVb27S-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
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
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   include/linux/list.h:292:9: note: Taking false branch
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   include/linux/list.h:292:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   include/linux/list.h:292:9: note: Dereference of null pointer
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/acpi/pci_link.c:88:14: warning: Value stored to 'handle' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           acpi_handle handle =3D link->device->handle;
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/pci_link.c:88:14: note: Value stored to 'handle' during its=
 initialization is never read
           acpi_handle handle =3D link->device->handle;
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/pci_link.c:717:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_PCI_LINK_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/pci_link.c:717:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_PCI_LINK_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/pci_link.c:718:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_PCI_LINK_CLASS);
           ^~~~~~
   drivers/acpi/pci_link.c:718:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_PCI_LINK_CLASS);
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/acpi/pci_irq.c:131:4: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(prt->source, quirk->actual_source);
                           ^~~~~~
   drivers/acpi/pci_irq.c:131:4: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                           strcpy(prt->source, quirk->actual_source);
                           ^~~~~~
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
>> drivers/acpi/tables.c:217:4: warning: Value stored to 'p' is never read =
[clang-analyzer-deadcode.DeadStores]
                           p =3D (struct acpi_madt_multiproc_wakeup *)heade=
r;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/tables.c:217:4: note: Value stored to 'p' is never read
                           p =3D (struct acpi_madt_multiproc_wakeup *)heade=
r;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   net/sched/sch_ets.c:680:23: warning: Assigned value is garbage or undefi=
ned [clang-analyzer-core.uninitialized.Assign]
                   q->classes[i].qdisc =3D queues[i];
                                       ^ ~~~~~~~~~
   net/sched/sch_ets.c:590:2: note: 'oldbands' initialized here
           unsigned int oldbands =3D q->nbands;
           ^~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:597:6: note: Assuming 'opt' is non-null
           if (!opt) {
               ^~~~
   net/sched/sch_ets.c:597:2: note: Taking false branch
           if (!opt) {
           ^
   net/sched/sch_ets.c:602:8: note: Calling 'nla_parse_nested'
           err =3D nla_parse_nested(tb, TCA_ETS_MAX, opt, ets_policy, extac=
k);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1207:6: note: Assuming the condition is false
           if (!(nla->nla_type & NLA_F_NESTED)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1207:2: note: Taking false branch
           if (!(nla->nla_type & NLA_F_NESTED)) {
           ^
   include/net/netlink.h:1212:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/sch_ets.c:602:8: note: Returning from 'nla_parse_nested'
           err =3D nla_parse_nested(tb, TCA_ETS_MAX, opt, ets_policy, extac=
k);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:603:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/sch_ets.c:603:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/sch_ets.c:606:6: note: Assuming the condition is false
           if (!tb[TCA_ETS_NBANDS]) {
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:606:2: note: Taking false branch
           if (!tb[TCA_ETS_NBANDS]) {
           ^
   net/sched/sch_ets.c:611:6: note: Assuming 'nbands' is >=3D 1
           if (nbands < 1 || nbands > TCQ_ETS_MAX_BANDS) {
               ^~~~~~~~~~
   net/sched/sch_ets.c:611:6: note: Left side of '||' is false
   net/sched/sch_ets.c:611:20: note: Assuming 'nbands' is <=3D TCQ_ETS_MAX_=
BANDS
           if (nbands < 1 || nbands > TCQ_ETS_MAX_BANDS) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:611:2: note: Taking false branch
           if (nbands < 1 || nbands > TCQ_ETS_MAX_BANDS) {
           ^
   net/sched/sch_ets.c:618:6: note: Assuming the condition is false
           if (tb[TCA_ETS_NSTRICT]) {
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:618:2: note: Taking false branch
           if (tb[TCA_ETS_NSTRICT]) {
           ^
   net/sched/sch_ets.c:626:6: note: Assuming the condition is false
           if (tb[TCA_ETS_PRIOMAP]) {
               ^~~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:626:2: note: Taking false branch
           if (tb[TCA_ETS_PRIOMAP]) {
           ^
   net/sched/sch_ets.c:633:6: note: Assuming the condition is false
           if (tb[TCA_ETS_QUANTA]) {
               ^~~~~~~~~~~~~~~~~~
   net/sched/sch_ets.c:633:2: note: Taking false branch
           if (tb[TCA_ETS_QUANTA]) {
           ^
   net/sched/sch_ets.c:642:20: note: 'i' is < 'nbands'
           for (i =3D nstrict; i < nbands; i++) {
                             ^
   net/sched/sch_ets.c:642:2: note: Loop condition is true.  Entering loop =
body
           for (i =3D nstrict; i < nbands; i++) {
           ^
   net/sched/sch_ets.c:643:3: note: Taking true branch
                   if (!quanta[i])
                   ^
   net/sched/sch_ets.c:642:20: note: Assuming 'i' is >=3D 'nbands'
           for (i =3D nstrict; i < nbands; i++) {
                             ^~~~~~~~~~
   net/sched/sch_ets.c:642:2: note: Loop condition is false. Execution cont=
inues on line 648
           for (i =3D nstrict; i < nbands; i++) {
           ^
   net/sched/sch_ets.c:648:21: note: Assuming 'i' is >=3D 'nbands'
           for (i =3D oldbands; i < nbands; i++) {
                              ^~~~~~~~~~
   net/sched/sch_ets.c:648:2: note: Loop condition is false. Execution cont=
inues on line 659

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
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3875953267334569448==--

