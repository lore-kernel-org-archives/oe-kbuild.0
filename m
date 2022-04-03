Content-Type: multipart/mixed; boundary="===============2820234524260030326=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/kernel/nmi.c:109:26: warning: Parameter 'mcesad' can be declared with const [constParameter]
Date: Sun, 03 Apr 2022 11:27:24 +0800
Message-ID: <202204031128.wNbBg9M3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2820234524260030326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: c7ed509b21b6566990ff39a6744cd5e214b5dca9 s390/nmi: disable interrup=
ts on extended save area update
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> arch/s390/kernel/ptrace.c:357:20: warning: Local variable 'regs' shadows=
 outer variable [shadowVariable]
      struct pt_regs *regs =3D task_pt_regs(child);
                      ^
   arch/s390/kernel/ptrace.c:336:19: note: Shadowed declaration
     struct pt_regs *regs =3D task_pt_regs(child);
                     ^
   arch/s390/kernel/ptrace.c:357:20: note: Shadow variable
      struct pt_regs *regs =3D task_pt_regs(child);
                      ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/s390/kernel/vtime.c:77:21: warning: Either the condition 'div>0' is=
 redundant or the array 'cycles_new[8]' is accessed at index -1, which is o=
ut of bounds. [negativeIndex]
     delta =3D cycles_new[i] - cycles_old[i];
                       ^
   arch/s390/kernel/vtime.c:84:10: note: Assuming that condition 'div>0' is=
 not redundant
    if (div > 0) {
            ^
   arch/s390/kernel/vtime.c:83:9: note: Assignment to 'div*=3Dfac'
    div *=3D fac;
           ^
   arch/s390/kernel/vtime.c:81:12: note: Assignment to 'fac*=3Di+1'
     fac *=3D i + 1;
              ^
   arch/s390/kernel/vtime.c:77:21: note: Negative array index
     delta =3D cycles_new[i] - cycles_old[i];
                       ^
--
>> arch/s390/kernel/nmi.c:109:26: warning: Parameter 'mcesad' can be declar=
ed with const [constParameter]
   void nmi_free_mcesa(u64 *mcesad)
                            ^
>> arch/s390/mm/vmem.c:574:2: warning: There is an unknown macro here somew=
here. Configuration is required. If for_each_mem_range is a macro then plea=
se configure it. [unknownMacro]
    for_each_mem_range(i, &base, &end)
    ^
--
>> arch/s390/kernel/processor.c:113:2: warning: There is an unknown macro h=
ere somewhere. Configuration is required. If for_each_set_bit_inv is a macr=
o then please configure it. [unknownMacro]
    for_each_set_bit_inv(bit, (long *)&stfle_fac_list, MAX_FACILITY_BIT)
    ^
--
>> arch/s390/kernel/topology.c:217:2: warning: There is an unknown macro he=
re somewhere. Configuration is required. If for_each_possible_cpu is a macr=
o then please configure it. [unknownMacro]
    for_each_possible_cpu(cpu)
    ^
--
>> arch/s390/kernel/sysinfo.c:290:12: warning: The if condition is the same=
 as the previous if condition [duplicateCondition]
    if (level >=3D 1)
              ^
   arch/s390/kernel/sysinfo.c:288:12: note: First condition
    if (level >=3D 1)
              ^
   arch/s390/kernel/sysinfo.c:290:12: note: Second condition
    if (level >=3D 1)
              ^
   arch/s390/kernel/sysinfo.c:292:12: warning: The if condition is the same=
 as the previous if condition [duplicateCondition]
    if (level >=3D 1)
              ^
   arch/s390/kernel/sysinfo.c:290:12: note: First condition
    if (level >=3D 1)
              ^
   arch/s390/kernel/sysinfo.c:292:12: note: Second condition
    if (level >=3D 1)
              ^
>> arch/s390/kernel/setup.c:816:2: warning: There is an unknown macro here =
somewhere. Configuration is required. If for_each_mem_range is a macro then=
 please configure it. [unknownMacro]
    for_each_mem_range(i, &start, &end)
    ^
--
   arch/s390/kernel/ptrace.c:152:23: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr =3D=3D (addr_t) &dummy->cr9)
                         ^
   arch/s390/kernel/ptrace.c:156:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->cr10)
                              ^
   arch/s390/kernel/ptrace.c:160:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->cr11)
                              ^
   arch/s390/kernel/ptrace.c:164:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->bits)
                              ^
   arch/s390/kernel/ptrace.c:168:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->starting_addr)
                              ^
   arch/s390/kernel/ptrace.c:171:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->ending_addr)
                              ^
   arch/s390/kernel/ptrace.c:174:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->perc_atmid)
                              ^
   arch/s390/kernel/ptrace.c:178:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->address)
                              ^
   arch/s390/kernel/ptrace.c:181:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->access_id)
                              ^
   arch/s390/kernel/ptrace.c:202:22: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr < (addr_t) &dummy->regs.acrs) {
                        ^
   arch/s390/kernel/ptrace.c:207:24: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     if (addr =3D=3D (addr_t) &dummy->regs.psw.mask) {
                          ^
   arch/s390/kernel/ptrace.c:213:29: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr < (addr_t) &dummy->regs.orig_gpr2) {
                               ^
   arch/s390/kernel/ptrace.c:223:24: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     if (addr =3D=3D (addr_t) &dummy->regs.acrs[15])
                          ^
   arch/s390/kernel/ptrace.c:228:30: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr =3D=3D (addr_t) &dummy->regs.orig_gpr2) {
                                ^
   arch/s390/kernel/ptrace.c:234:29: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr < (addr_t) &dummy->regs.fp_regs) {
                               ^
   arch/s390/kernel/ptrace.c:241:30: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr =3D=3D (addr_t) &dummy->regs.fp_regs.fpc) {
                                ^
   arch/s390/kernel/ptrace.c:284:23: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr >=3D (addr_t) &((struct user *) NULL)->regs.acrs &&
                         ^
   arch/s390/kernel/ptrace.c:285:22: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
        addr < (addr_t) &((struct user *) NULL)->regs.orig_gpr2)
                        ^
   arch/s390/kernel/ptrace.c:311:23: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr =3D=3D (addr_t) &dummy->cr9)
                         ^
   arch/s390/kernel/ptrace.c:315:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->starting_addr)
                              ^
   arch/s390/kernel/ptrace.c:318:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy->ending_addr)
                              ^
   arch/s390/kernel/ptrace.c:335:22: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr < (addr_t) &dummy->regs.acrs) {
                        ^
   arch/s390/kernel/ptrace.c:340:24: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     if (addr =3D=3D (addr_t) &dummy->regs.psw.mask) {
                          ^
   arch/s390/kernel/ptrace.c:373:24: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     if (addr =3D=3D (addr_t) &dummy->regs.acrs[15])
                          ^
   arch/s390/kernel/ptrace.c:378:30: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr =3D=3D (addr_t) &dummy->regs.orig_gpr2) {
                                ^
   arch/s390/kernel/ptrace.c:384:29: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr < (addr_t) &dummy->regs.fp_regs) {
                               ^
   arch/s390/kernel/ptrace.c:391:30: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr =3D=3D (addr_t) &dummy->regs.fp_regs.fpc) {
                                ^
   arch/s390/kernel/ptrace.c:434:23: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr >=3D (addr_t) &((struct user *) NULL)->regs.acrs &&
                         ^
   arch/s390/kernel/ptrace.c:435:22: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
        addr < (addr_t) &((struct user *) NULL)->regs.orig_gpr2)
                        ^
>> arch/s390/kernel/ptrace.c:1110:6: warning: The if condition is the same =
as the previous if condition [duplicateCondition]
    if (!target->thread.gs_cb)
        ^
   arch/s390/kernel/ptrace.c:1105:6: note: First condition
    if (!target->thread.gs_cb) {
        ^
   arch/s390/kernel/ptrace.c:1110:6: note: Second condition
    if (!target->thread.gs_cb)
        ^
   arch/s390/kernel/ptrace.c:202:23: warning: Null pointer dereference: dum=
my [nullPointer]
    if (addr < (addr_t) &dummy->regs.acrs) {
                         ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:202:23: note: Null pointer dereference
    if (addr < (addr_t) &dummy->regs.acrs) {
                         ^
   arch/s390/kernel/ptrace.c:207:25: warning: Null pointer dereference: dum=
my [nullPointer]
     if (addr =3D=3D (addr_t) &dummy->regs.psw.mask) {
                           ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:207:25: note: Null pointer dereference
     if (addr =3D=3D (addr_t) &dummy->regs.psw.mask) {
                           ^
   arch/s390/kernel/ptrace.c:213:30: warning: Null pointer dereference: dum=
my [nullPointer]
    } else if (addr < (addr_t) &dummy->regs.orig_gpr2) {
                                ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:213:30: note: Null pointer dereference
    } else if (addr < (addr_t) &dummy->regs.orig_gpr2) {
                                ^
   arch/s390/kernel/ptrace.c:217:29: warning: Null pointer dereference: dum=
my [nullPointer]
     offset =3D addr - (addr_t) &dummy->regs.acrs;
                               ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:217:29: note: Null pointer dereference
     offset =3D addr - (addr_t) &dummy->regs.acrs;
                               ^
   arch/s390/kernel/ptrace.c:223:25: warning: Null pointer dereference: dum=
my [nullPointer]
     if (addr =3D=3D (addr_t) &dummy->regs.acrs[15])
                           ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:223:25: note: Null pointer dereference
     if (addr =3D=3D (addr_t) &dummy->regs.acrs[15])
                           ^
   arch/s390/kernel/ptrace.c:228:31: warning: Null pointer dereference: dum=
my [nullPointer]
    } else if (addr =3D=3D (addr_t) &dummy->regs.orig_gpr2) {
                                 ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:228:31: note: Null pointer dereference
    } else if (addr =3D=3D (addr_t) &dummy->regs.orig_gpr2) {
                                 ^
   arch/s390/kernel/ptrace.c:234:30: warning: Null pointer dereference: dum=
my [nullPointer]
    } else if (addr < (addr_t) &dummy->regs.fp_regs) {
                                ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:234:30: note: Null pointer dereference
    } else if (addr < (addr_t) &dummy->regs.fp_regs) {
                                ^
   arch/s390/kernel/ptrace.c:241:31: warning: Null pointer dereference: dum=
my [nullPointer]
    } else if (addr =3D=3D (addr_t) &dummy->regs.fp_regs.fpc) {
                                 ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:241:31: note: Null pointer dereference
    } else if (addr =3D=3D (addr_t) &dummy->regs.fp_regs.fpc) {
                                 ^
   arch/s390/kernel/ptrace.c:253:29: warning: Null pointer dereference: dum=
my [nullPointer]
     offset =3D addr - (addr_t) &dummy->regs.fp_regs.fprs;
                               ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:253:29: note: Null pointer dereference
     offset =3D addr - (addr_t) &dummy->regs.fp_regs.fprs;
                               ^
   arch/s390/kernel/ptrace.c:265:21: warning: Null pointer dereference: dum=
my [nullPointer]
     addr -=3D (addr_t) &dummy->regs.per_info;
                       ^
   arch/s390/kernel/ptrace.c:199:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:265:21: note: Null pointer dereference
     addr -=3D (addr_t) &dummy->regs.per_info;
                       ^
   arch/s390/kernel/ptrace.c:284:25: warning: Null pointer dereference: (st=
ruct user*)NULL [nullPointer]
    if (addr >=3D (addr_t) &((struct user *) NULL)->regs.acrs &&
                           ^
   arch/s390/kernel/ptrace.c:285:24: warning: Null pointer dereference: (st=
ruct user*)NULL [nullPointer]
        addr < (addr_t) &((struct user *) NULL)->regs.orig_gpr2)
                          ^
   arch/s390/kernel/ptrace.c:335:23: warning: Null pointer dereference: dum=
my [nullPointer]
    if (addr < (addr_t) &dummy->regs.acrs) {
                         ^
   arch/s390/kernel/ptrace.c:331:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:335:23: note: Null pointer dereference
    if (addr < (addr_t) &dummy->regs.acrs) {
                         ^
   arch/s390/kernel/ptrace.c:340:25: warning: Null pointer dereference: dum=
my [nullPointer]
     if (addr =3D=3D (addr_t) &dummy->regs.psw.mask) {
                           ^
   arch/s390/kernel/ptrace.c:331:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:340:25: note: Null pointer dereference
     if (addr =3D=3D (addr_t) &dummy->regs.psw.mask) {
                           ^
   arch/s390/kernel/ptrace.c:366:29: warning: Null pointer dereference: dum=
my [nullPointer]
     offset =3D addr - (addr_t) &dummy->regs.acrs;
                               ^
   arch/s390/kernel/ptrace.c:331:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:366:29: note: Null pointer dereference
     offset =3D addr - (addr_t) &dummy->regs.acrs;
                               ^
   arch/s390/kernel/ptrace.c:373:25: warning: Null pointer dereference: dum=
my [nullPointer]
     if (addr =3D=3D (addr_t) &dummy->regs.acrs[15])
                           ^
   arch/s390/kernel/ptrace.c:331:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:373:25: note: Null pointer dereference
     if (addr =3D=3D (addr_t) &dummy->regs.acrs[15])
                           ^
   arch/s390/kernel/ptrace.c:378:31: warning: Null pointer dereference: dum=
my [nullPointer]
    } else if (addr =3D=3D (addr_t) &dummy->regs.orig_gpr2) {
                                 ^
   arch/s390/kernel/ptrace.c:331:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:378:31: note: Null pointer dereference
    } else if (addr =3D=3D (addr_t) &dummy->regs.orig_gpr2) {
                                 ^
   arch/s390/kernel/ptrace.c:384:30: warning: Null pointer dereference: dum=
my [nullPointer]
    } else if (addr < (addr_t) &dummy->regs.fp_regs) {
                                ^
   arch/s390/kernel/ptrace.c:331:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:384:30: note: Null pointer dereference
    } else if (addr < (addr_t) &dummy->regs.fp_regs) {
                                ^
   arch/s390/kernel/ptrace.c:391:31: warning: Null pointer dereference: dum=
my [nullPointer]
    } else if (addr =3D=3D (addr_t) &dummy->regs.fp_regs.fpc) {
                                 ^
   arch/s390/kernel/ptrace.c:331:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:391:31: note: Null pointer dereference
    } else if (addr =3D=3D (addr_t) &dummy->regs.fp_regs.fpc) {
                                 ^
   arch/s390/kernel/ptrace.c:405:29: warning: Null pointer dereference: dum=
my [nullPointer]
     offset =3D addr - (addr_t) &dummy->regs.fp_regs.fprs;
                               ^
   arch/s390/kernel/ptrace.c:331:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:405:29: note: Null pointer dereference
     offset =3D addr - (addr_t) &dummy->regs.fp_regs.fprs;
                               ^
   arch/s390/kernel/ptrace.c:417:21: warning: Null pointer dereference: dum=
my [nullPointer]
     addr -=3D (addr_t) &dummy->regs.per_info;
                       ^
   arch/s390/kernel/ptrace.c:331:23: note: Assignment 'dummy=3DNULL', assig=
ned value is 0
    struct user *dummy =3D NULL;
                         ^
   arch/s390/kernel/ptrace.c:417:21: note: Null pointer dereference
     addr -=3D (addr_t) &dummy->regs.per_info;
                       ^
   arch/s390/kernel/ptrace.c:434:25: warning: Null pointer dereference: (st=
ruct user*)NULL [nullPointer]
    if (addr >=3D (addr_t) &((struct user *) NULL)->regs.acrs &&
                           ^
   arch/s390/kernel/ptrace.c:435:24: warning: Null pointer dereference: (st=
ruct user*)NULL [nullPointer]
        addr < (addr_t) &((struct user *) NULL)->regs.orig_gpr2)
                          ^
   arch/s390/kernel/ptrace.c:545:23: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr =3D=3D (addr_t) &dummy32->cr9)
                         ^
   arch/s390/kernel/ptrace.c:549:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->cr10)
                              ^
   arch/s390/kernel/ptrace.c:553:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->cr11)
                              ^
   arch/s390/kernel/ptrace.c:557:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->bits)
                              ^
   arch/s390/kernel/ptrace.c:561:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->starting_addr)
                              ^
   arch/s390/kernel/ptrace.c:564:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->ending_addr)
                              ^
   arch/s390/kernel/ptrace.c:567:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->perc_atmid)
                              ^
   arch/s390/kernel/ptrace.c:570:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->address)
                              ^
   arch/s390/kernel/ptrace.c:573:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->access_id)
                              ^
   arch/s390/kernel/ptrace.c:588:22: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr < (addr_t) &dummy32->regs.acrs) {
                        ^
   arch/s390/kernel/ptrace.c:593:24: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     if (addr =3D=3D (addr_t) &dummy32->regs.psw.mask) {
                          ^
   arch/s390/kernel/ptrace.c:598:31: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     } else if (addr =3D=3D (addr_t) &dummy32->regs.psw.addr) {
                                 ^
   arch/s390/kernel/ptrace.c:619:29: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr < (addr_t) &dummy32->regs.fp_regs) {
                               ^
   arch/s390/kernel/ptrace.c:626:30: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr =3D=3D (addr_t) &dummy32->regs.fp_regs.fpc) {
                                ^
   arch/s390/kernel/ptrace.c:678:23: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr =3D=3D (addr_t) &dummy32->cr9)
                         ^
   arch/s390/kernel/ptrace.c:682:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->starting_addr)
                              ^
   arch/s390/kernel/ptrace.c:685:28: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    else if (addr =3D=3D (addr_t) &dummy32->ending_addr)
                              ^
   arch/s390/kernel/ptrace.c:700:22: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    if (addr < (addr_t) &dummy32->regs.acrs) {
                        ^
   arch/s390/kernel/ptrace.c:705:24: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     if (addr =3D=3D (addr_t) &dummy32->regs.psw.mask) {
                          ^
   arch/s390/kernel/ptrace.c:719:31: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
     } else if (addr =3D=3D (addr_t) &dummy32->regs.psw.addr) {
                                 ^
   arch/s390/kernel/ptrace.c:748:29: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr < (addr_t) &dummy32->regs.fp_regs) {
                               ^
   arch/s390/kernel/ptrace.c:755:30: warning: Boolean result is used in bit=
wise operation. Clarify expression with parentheses. [clarifyCondition]
    } else if (addr =3D=3D (addr_t) &dummy32->regs.fp_regs.fpc) {
                                ^
   arch/s390/kernel/ptrace.c:588:23: warning: Null pointer dereference: dum=
my32 [nullPointer]
    if (addr < (addr_t) &dummy32->regs.acrs) {
                         ^
   arch/s390/kernel/ptrace.c:584:32: note: Assignment 'dummy32=3DNULL', ass=
igned value is 0
    struct compat_user *dummy32 =3D NULL;
--
>> arch/s390/kernel/smp.c:526:2: warning: There is an unknown macro here so=
mewhere. Configuration is required. If for_each_cpu is a macro then please =
configure it. [unknownMacro]
    for_each_cpu(cpu, mask)
    ^

vim +/mcesad +109 arch/s390/kernel/nmi.c

6c81511ca1f52a0 arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  108  =

c7ed509b21b6566 arch/s390/kernel/nmi.c  Alexander Gordeev  2021-12-10 @109 =
 void nmi_free_mcesa(u64 *mcesad)
6c81511ca1f52a0 arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  110 =
 {
6c81511ca1f52a0 arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  111 =
 	if (!nmi_needs_mcesa())
6c81511ca1f52a0 arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  112 =
 		return;
c7ed509b21b6566 arch/s390/kernel/nmi.c  Alexander Gordeev  2021-12-10  113 =
 	kmem_cache_free(mcesa_cache, __va(*mcesad & MCESA_ORIGIN_MASK));
6c81511ca1f52a0 arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  114 =
 }
77fa22450de00d5 drivers/s390/s390mach.c Heiko Carstens     2005-06-25  115  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2820234524260030326==--

