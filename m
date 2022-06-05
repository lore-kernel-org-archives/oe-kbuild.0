Content-Type: multipart/mixed; boundary="===============9028024858965579159=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15 5484/5636] fs/proc/task_mmu.c:964:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 05 Jun 2022 23:44:52 +0800
Message-ID: <202206052344.80LaYZRN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9028024858965579159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/proc/task_mmu.c:964:28: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.15
head:   754bb029c85fb4b18d198216540f75e635dde8d4
commit: 67cc8ce9a649a8407c8e815d03b88761c4ddfe67 [5484/5636] FROMLIST: mm: =
rcu safe vma freeing
:::::: branch date: 9 weeks ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20605/202206052344.80LaYZRN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/67cc8ce9a649a84=
07c8e815d03b88761c4ddfe67
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.15
        git checkout 67cc8ce9a649a8407c8e815d03b88761c4ddfe67
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   lib/vsprintf.c:1360:9: note: Assigned value is garbage or undefined
                           *p++ =3D temp[digits];
                                ^ ~~~~~~~~~~~~
   lib/vsprintf.c:1423:4: warning: Value stored to 'needcolon' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1423:4: note: Value stored to 'needcolon' is never read
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1791:2: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
   lib/vsprintf.c:1791:2: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/acpi/acpica/nsrepair.c:264:8: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
                               return_object->common.reference_count;
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:125:2: note: 'return_object' initialized =
here
           union acpi_operand_object *return_object =3D *return_object_ptr;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:139:6: note: Assuming 'predefined' is non=
-null
           if (predefined) {
               ^~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:139:2: note: Taking true branch
           if (predefined) {
           ^
   drivers/acpi/acpica/nsrepair.c:140:7: note: Assuming 'return_object' is =
null
                   if (!return_object) {
                       ^~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:140:3: note: Taking true branch
                   if (!return_object) {
                   ^
   drivers/acpi/acpica/nsrepair.c:148:7: note: Assuming 'status' is 0
                   if (ACPI_FAILURE(status)) {
                       ^
   include/acpi/acexcep.h:58:41: note: expanded from macro 'ACPI_FAILURE'
   #define ACPI_FAILURE(a)                 (a)
                                           ^~~
   drivers/acpi/acpica/nsrepair.c:148:3: note: Taking false branch
                   if (ACPI_FAILURE(status)) {
                   ^
   drivers/acpi/acpica/nsrepair.c:156:7: note: Assuming 'new_object' is non=
-null
                   if (new_object) {
                       ^~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:156:3: note: Taking true branch
                   if (new_object) {
                   ^
   drivers/acpi/acpica/nsrepair.c:157:4: note: Control jumps to line 258
                           goto object_repaired;
                           ^
   drivers/acpi/acpica/nsrepair.c:258:6: note: Assuming the condition is tr=
ue
           if (package_index !=3D ACPI_NOT_PACKAGE_ELEMENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:258:2: note: Taking true branch
           if (package_index !=3D ACPI_NOT_PACKAGE_ELEMENT) {
           ^
   drivers/acpi/acpica/nsrepair.c:262:7: note: Assuming the condition is tr=
ue
                   if (!(info->return_flags & ACPI_OBJECT_WRAPPED)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/nsrepair.c:262:3: note: Taking true branch
                   if (!(info->return_flags & ACPI_OBJECT_WRAPPED)) {
                   ^
   drivers/acpi/acpica/nsrepair.c:264:8: note: Dereference of null pointer
                               return_object->common.reference_count;
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
>> fs/proc/task_mmu.c:964:28: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           show_vma_header_prefix(m, priv->mm->mmap->vm_start,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:878:6: note: Assuming field 'task' is non-null
           if (!priv->task)
               ^~~~~~~~~~~
   fs/proc/task_mmu.c:878:2: note: Taking false branch
           if (!priv->task)
           ^
   fs/proc/task_mmu.c:882:6: note: Assuming 'mm' is non-null
           if (!mm || !mmget_not_zero(mm)) {
               ^~~
   fs/proc/task_mmu.c:882:6: note: Left side of '||' is false
   fs/proc/task_mmu.c:882:2: note: Taking false branch
           if (!mm || !mmget_not_zero(mm)) {
           ^
   fs/proc/task_mmu.c:889:8: note: Calling 'mmap_read_lock_killable'
           ret =3D mmap_read_lock_killable(mm);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:179:2: note: Calling '__mmap_lock_trace_start_=
locking'
           __mmap_lock_trace_start_locking(mm, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:36:2: note: Taking false branch
           if (tracepoint_enabled(mmap_lock_start_locking))
           ^
   include/linux/mmap_lock.h:38:1: note: Returning without writing to 'mm->=
.mmap', which participates in a condition later
   }
   ^
   include/linux/mmap_lock.h:38:1: note: Returning without writing to 'mm->=
.mmap'
   include/linux/mmap_lock.h:179:2: note: Returning from '__mmap_lock_trace=
_start_locking'
           __mmap_lock_trace_start_locking(mm, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:180:10: note: Value assigned to field 'mmap', =
which participates in a condition later
           error =3D down_read_killable(&mm->mmap_lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:180:10: note: Value assigned to field 'mmap'
           error =3D down_read_killable(&mm->mmap_lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:181:48: note: Assuming 'error' is 0, which par=
ticipates in a condition later
           __mmap_lock_trace_acquire_returned(mm, false, !error);
                                                         ^~~~~~
   include/linux/mmap_lock.h:181:2: note: Calling '__mmap_lock_trace_acquir=
e_returned'
           __mmap_lock_trace_acquire_returned(mm, false, !error);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:43:2: note: Taking false branch
           if (tracepoint_enabled(mmap_lock_acquire_returned))
           ^
   include/linux/mmap_lock.h:45:1: note: Returning without writing to 'mm->=
.mmap', which participates in a condition later
   }
   ^
   include/linux/mmap_lock.h:45:1: note: Returning without writing to 'mm->=
.mmap'
   include/linux/mmap_lock.h:181:2: note: Returning from '__mmap_lock_trace=
_acquire_returned'
           __mmap_lock_trace_acquire_returned(mm, false, !error);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:182:2: note: Returning zero (loaded from 'erro=
r'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/proc/task_mmu.c:889:8: note: Returning from 'mmap_read_lock_killable'
           ret =3D mmap_read_lock_killable(mm);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:890:6: note: 'ret' is 0
           if (ret)
               ^~~
   fs/proc/task_mmu.c:890:2: note: Taking false branch
           if (ret)
           ^
   fs/proc/task_mmu.c:895:29: note: Assuming pointer value is null
           for (vma =3D priv->mm->mmap; vma;) {
                                      ^~~
   fs/proc/task_mmu.c:895:2: note: Loop condition is false. Execution conti=
nues on line 964
           for (vma =3D priv->mm->mmap; vma;) {
           ^
   fs/proc/task_mmu.c:964:28: note: Dereference of null pointer
           show_vma_header_prefix(m, priv->mm->mmap->vm_start,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
--
                             ^~~~   ~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/acpi/acpica/dbexec.c:390:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name_string, name);
           ^~~~~~
   drivers/acpi/acpica/dbexec.c:390:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(name_string, name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/acpi/acpica/dbhistry.c:73:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_gbl_history_buffer[acpi_gbl_next_history_index].comm=
and,
           ^~~~~~
   drivers/acpi/acpica/dbhistry.c:73:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(acpi_gbl_history_buffer[acpi_gbl_next_history_index].comm=
and,
           ^~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/leds/led-triggers.c:276:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)trig->name, name);
           ^~~~~~
   drivers/leds/led-triggers.c:276:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)trig->name, name);
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/net/phy/realtek.c:813:3: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   err =3D phy_write_paged(phydev, 0xa42, RTL9000A_GINMR, v=
al);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/realtek.c:813:3: note: Value stored to 'err' is never re=
ad
                   err =3D phy_write_paged(phydev, 0xa42, RTL9000A_GINMR, v=
al);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/realtek.c:820:3: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   err =3D rtl9000a_ack_interrupt(phydev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/realtek.c:820:3: note: Value stored to 'err' is never re=
ad
                   err =3D rtl9000a_ack_interrupt(phydev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   4 warnings generated.
>> arch/x86/mm/pat/memtype.c:1098:24: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
                   if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
                                        ^~~~~~~~~~~~~
   arch/x86/mm/pat/memtype.c:1092:6: note: Assuming 'vma' is null
           if (vma && !(vma->vm_flags & VM_PAT))
               ^~~
   arch/x86/mm/pat/memtype.c:1092:10: note: Left side of '&&' is false
           if (vma && !(vma->vm_flags & VM_PAT))
                   ^
   arch/x86/mm/pat/memtype.c:1097:6: note: Assuming 'paddr' is 0
           if (!paddr && !size) {
               ^~~~~~
   arch/x86/mm/pat/memtype.c:1097:6: note: Left side of '&&' is true
   arch/x86/mm/pat/memtype.c:1097:16: note: Assuming 'size' is 0
           if (!paddr && !size) {
                         ^~~~~
   arch/x86/mm/pat/memtype.c:1097:2: note: Taking true branch
           if (!paddr && !size) {
           ^
   arch/x86/mm/pat/memtype.c:1098:24: note: Dereference of null pointer
                   if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
                                        ^~~~~~~~~~~~~
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/target/target_core_configfs.c:2017:5: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2017:5: note: Value stored to 'ret=
' is never read
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2031:5: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2031:5: note: Value stored to 'ret=
' is never read
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2095:5: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2095:5: note: Value stored to 'ret=
' is never read
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2217:17: warning: Value stored to =
'hba' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2217:17: note: Value stored to 'hb=
a' during its initialization is never read
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2257:17: warning: Value stored to =
'hba' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2257:17: note: Value stored to 'hb=
a' during its initialization is never read
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2339:17: warning: Value stored to =
'hba' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2339:17: note: Value stored to 'hb=
a' during its initialization is never read

vim +964 fs/proc/task_mmu.c

258f669e7e88c1 Vlastimil Babka       2018-08-21  867  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  868  static int show_smaps=
_rollup(struct seq_file *m, void *v)
258f669e7e88c1 Vlastimil Babka       2018-08-21  869  {
258f669e7e88c1 Vlastimil Babka       2018-08-21  870  	struct proc_maps_pri=
vate *priv =3D m->private;
258f669e7e88c1 Vlastimil Babka       2018-08-21  871  	struct mem_size_stat=
s mss;
258f669e7e88c1 Vlastimil Babka       2018-08-21  872  	struct mm_struct *mm;
258f669e7e88c1 Vlastimil Babka       2018-08-21  873  	struct vm_area_struc=
t *vma;
258f669e7e88c1 Vlastimil Babka       2018-08-21  874  	unsigned long last_v=
ma_end =3D 0;
258f669e7e88c1 Vlastimil Babka       2018-08-21  875  	int ret =3D 0;
258f669e7e88c1 Vlastimil Babka       2018-08-21  876  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  877  	priv->task =3D get_p=
roc_task(priv->inode);
258f669e7e88c1 Vlastimil Babka       2018-08-21  878  	if (!priv->task)
258f669e7e88c1 Vlastimil Babka       2018-08-21  879  		return -ESRCH;
258f669e7e88c1 Vlastimil Babka       2018-08-21  880  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  881  	mm =3D priv->mm;
258f669e7e88c1 Vlastimil Babka       2018-08-21  882  	if (!mm || !mmget_no=
t_zero(mm)) {
258f669e7e88c1 Vlastimil Babka       2018-08-21  883  		ret =3D -ESRCH;
258f669e7e88c1 Vlastimil Babka       2018-08-21  884  		goto out_put_task;
258f669e7e88c1 Vlastimil Babka       2018-08-21  885  	}
258f669e7e88c1 Vlastimil Babka       2018-08-21  886  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  887  	memset(&mss, 0, size=
of(mss));
258f669e7e88c1 Vlastimil Babka       2018-08-21  888  =

d8ed45c5dcd455 Michel Lespinasse     2020-06-08  889  	ret =3D mmap_read_lo=
ck_killable(mm);
a26a9781554857 Konstantin Khlebnikov 2019-07-11  890  	if (ret)
a26a9781554857 Konstantin Khlebnikov 2019-07-11  891  		goto out_put_mm;
a26a9781554857 Konstantin Khlebnikov 2019-07-11  892  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  893  	hold_task_mempolicy(=
priv);
258f669e7e88c1 Vlastimil Babka       2018-08-21  894  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  895  	for (vma =3D priv->m=
m->mmap; vma;) {
03b4b1149308b0 Chinwen Chang         2020-10-13  896  		smap_gather_stats(v=
ma, &mss, 0);
258f669e7e88c1 Vlastimil Babka       2018-08-21  897  		last_vma_end =3D vm=
a->vm_end;
ff9f47f6f00cfe Chinwen Chang         2020-10-13  898  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  899  		/*
ff9f47f6f00cfe Chinwen Chang         2020-10-13  900  		 * Release mmap_loc=
k temporarily if someone wants to
ff9f47f6f00cfe Chinwen Chang         2020-10-13  901  		 * access it for wr=
ite request.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  902  		 */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  903  		if (mmap_lock_is_co=
ntended(mm)) {
ff9f47f6f00cfe Chinwen Chang         2020-10-13  904  			mmap_read_unlock(m=
m);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  905  			ret =3D mmap_read_=
lock_killable(mm);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  906  			if (ret) {
ff9f47f6f00cfe Chinwen Chang         2020-10-13  907  				release_task_memp=
olicy(priv);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  908  				goto out_put_mm;
ff9f47f6f00cfe Chinwen Chang         2020-10-13  909  			}
ff9f47f6f00cfe Chinwen Chang         2020-10-13  910  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  911  			/*
ff9f47f6f00cfe Chinwen Chang         2020-10-13  912  			 * After dropping =
the lock, there are four cases to
ff9f47f6f00cfe Chinwen Chang         2020-10-13  913  			 * consider. See t=
he following example for explanation.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  914  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  915  			 *   +------+-----=
-+-----------+
ff9f47f6f00cfe Chinwen Chang         2020-10-13  916  			 *   | VMA1 | VMA2=
 | VMA3      |
ff9f47f6f00cfe Chinwen Chang         2020-10-13  917  			 *   +------+-----=
-+-----------+
ff9f47f6f00cfe Chinwen Chang         2020-10-13  918  			 *   |      |     =
 |           |
ff9f47f6f00cfe Chinwen Chang         2020-10-13  919  			 *  4k     8k     =
16k         400k
ff9f47f6f00cfe Chinwen Chang         2020-10-13  920  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  921  			 * Suppose we drop=
 the lock after reading VMA2 due to
ff9f47f6f00cfe Chinwen Chang         2020-10-13  922  			 * contention, the=
n we get:
ff9f47f6f00cfe Chinwen Chang         2020-10-13  923  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  924  			 *	last_vma_end =
=3D 16k
ff9f47f6f00cfe Chinwen Chang         2020-10-13  925  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  926  			 * 1) VMA2 is free=
d, but VMA3 exists:
ff9f47f6f00cfe Chinwen Chang         2020-10-13  927  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  928  			 *    find_vma(mm,=
 16k - 1) will return VMA3.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  929  			 *    In this case=
, just continue from VMA3.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  930  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  931  			 * 2) VMA2 still e=
xists:
ff9f47f6f00cfe Chinwen Chang         2020-10-13  932  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  933  			 *    find_vma(mm,=
 16k - 1) will return VMA2.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  934  			 *    Iterate the =
loop like the original one.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  935  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  936  			 * 3) No more VMAs=
 can be found:
ff9f47f6f00cfe Chinwen Chang         2020-10-13  937  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  938  			 *    find_vma(mm,=
 16k - 1) will return NULL.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  939  			 *    No more thin=
gs to do, just break.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  940  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  941  			 * 4) (last_vma_en=
d - 1) is the middle of a vma (VMA'):
ff9f47f6f00cfe Chinwen Chang         2020-10-13  942  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  943  			 *    find_vma(mm,=
 16k - 1) will return VMA' whose range
ff9f47f6f00cfe Chinwen Chang         2020-10-13  944  			 *    contains las=
t_vma_end.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  945  			 *    Iterate VMA'=
 from last_vma_end.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  946  			 */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  947  			vma =3D find_vma(m=
m, last_vma_end - 1);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  948  			/* Case 3 above */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  949  			if (!vma)
ff9f47f6f00cfe Chinwen Chang         2020-10-13  950  				break;
ff9f47f6f00cfe Chinwen Chang         2020-10-13  951  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  952  			/* Case 1 above */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  953  			if (vma->vm_start =
>=3D last_vma_end)
ff9f47f6f00cfe Chinwen Chang         2020-10-13  954  				continue;
ff9f47f6f00cfe Chinwen Chang         2020-10-13  955  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  956  			/* Case 4 above */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  957  			if (vma->vm_end > =
last_vma_end)
ff9f47f6f00cfe Chinwen Chang         2020-10-13  958  				smap_gather_stats=
(vma, &mss, last_vma_end);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  959  		}
ff9f47f6f00cfe Chinwen Chang         2020-10-13  960  		/* Case 2 above */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  961  		vma =3D vma->vm_nex=
t;
258f669e7e88c1 Vlastimil Babka       2018-08-21  962  	}
258f669e7e88c1 Vlastimil Babka       2018-08-21  963  =

258f669e7e88c1 Vlastimil Babka       2018-08-21 @964  	show_vma_header_pref=
ix(m, priv->mm->mmap->vm_start,
258f669e7e88c1 Vlastimil Babka       2018-08-21  965  			       last_vma_en=
d, 0, 0, 0, 0);
258f669e7e88c1 Vlastimil Babka       2018-08-21  966  	seq_pad(m, ' ');
258f669e7e88c1 Vlastimil Babka       2018-08-21  967  	seq_puts(m, "[rollup=
]\n");
258f669e7e88c1 Vlastimil Babka       2018-08-21  968  =

ee2ad71b0756e9 Luigi Semenzato       2019-07-11  969  	__show_smap(m, &mss,=
 true);
258f669e7e88c1 Vlastimil Babka       2018-08-21  970  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  971  	release_task_mempoli=
cy(priv);
d8ed45c5dcd455 Michel Lespinasse     2020-06-08  972  	mmap_read_unlock(mm);
258f669e7e88c1 Vlastimil Babka       2018-08-21  973  =

a26a9781554857 Konstantin Khlebnikov 2019-07-11  974  out_put_mm:
a26a9781554857 Konstantin Khlebnikov 2019-07-11  975  	mmput(mm);
258f669e7e88c1 Vlastimil Babka       2018-08-21  976  out_put_task:
258f669e7e88c1 Vlastimil Babka       2018-08-21  977  	put_task_struct(priv=
->task);
258f669e7e88c1 Vlastimil Babka       2018-08-21  978  	priv->task =3D NULL;
258f669e7e88c1 Vlastimil Babka       2018-08-21  979  =

493b0e9d945fa9 Daniel Colascione     2017-09-06  980  	return ret;
e070ad49f31155 Mauricio Lin          2005-09-03  981  }
d1be35cb6f9697 Andrei Vagin          2018-04-10  982  #undef SEQ_PUT_DEC
e070ad49f31155 Mauricio Lin          2005-09-03  983  =


:::::: The code at line 964 was first introduced by commit
:::::: 258f669e7e88c18edbc23fe5ce00a476b924551f mm: /proc/pid/smaps_rollup:=
 convert to single value seq_file

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9028024858965579159==--

