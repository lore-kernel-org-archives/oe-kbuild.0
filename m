Content-Type: multipart/mixed; boundary="===============3546627697817073902=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [morse:mpam/snapshot/v5.17 63/137] fs/resctrl/rdtgroup.c:2611:12: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 10 Apr 2022 07:09:23 +0800
Message-ID: <202204100709.CMFUgt7V-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3546627697817073902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: James Morse <james.morse@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpa=
m/snapshot/v5.17
head:   fb7499c2de17b6b98e0e3ac5b7b023bfc5a6f3a4
commit: 89c48a135b8af444d91c5d577030e063c6b9ec85 [63/137] x86/resctrl: Move=
 resctrl to /fs
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20410/202204100709.CMFUgt7V-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9fdd25=
848a79892eaacc5414d5aef18555b79919)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/c=
ommit/?id=3D89c48a135b8af444d91c5d577030e063c6b9ec85
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/gi=
t/morse/linux.git
        git fetch --no-tags morse mpam/snapshot/v5.17
        git checkout 89c48a135b8af444d91c5d577030e063c6b9ec85
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^        ~~~~~~
   lib/assoc_array.c:409:3: note: Value stored to 'cursor' is never read
                   cursor =3D parent;
                   ^        ~~~~~~
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
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   6 warnings generated.
   drivers/acpi/battery.c:1191:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_BATTERY_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/battery.c:1191:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_BATTERY_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/battery.c:1192:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_BATTERY_CLASS);
           ^~~~~~
   drivers/acpi/battery.c:1192:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_BATTERY_CLASS);
           ^~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
   4 warnings generated.
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> fs/resctrl/rdtgroup.c:2611:12: warning: Assigned value is garbage or und=
efined [clang-analyzer-core.uninitialized.Assign]
                   *dest_kn =3D kn;
                            ^
   fs/resctrl/rdtgroup.c:2160:6: note: Assuming 'resctrl_mounted' is false
           if (resctrl_mounted) {
               ^~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2160:2: note: Taking false branch
           if (resctrl_mounted) {
           ^
   fs/resctrl/rdtgroup.c:2166:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   fs/resctrl/rdtgroup.c:2166:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/resctrl/rdtgroup.c:2169:8: note: Calling 'schemata_list_create'
           ret =3D schemata_list_create();
                 ^~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2116:2: note: Loop condition is true.  Entering lo=
op body
           for (i =3D 0; i < RDT_NUM_RESOURCES; i++) {
           ^
   fs/resctrl/rdtgroup.c:2118:7: note: Assuming field 'alloc_capable' is fa=
lse
                   if (!r->alloc_capable)
                       ^~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2118:3: note: Taking true branch
                   if (!r->alloc_capable)
                   ^
   fs/resctrl/rdtgroup.c:2119:4: note:  Execution continues on line 2116
                           continue;
                           ^
   fs/resctrl/rdtgroup.c:2116:2: note: Loop condition is true.  Entering lo=
op body
           for (i =3D 0; i < RDT_NUM_RESOURCES; i++) {
           ^
   fs/resctrl/rdtgroup.c:2118:7: note: Assuming field 'alloc_capable' is fa=
lse
                   if (!r->alloc_capable)
                       ^~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2118:3: note: Taking true branch
                   if (!r->alloc_capable)
                   ^
   fs/resctrl/rdtgroup.c:2119:4: note:  Execution continues on line 2116
                           continue;
                           ^
   fs/resctrl/rdtgroup.c:2116:2: note: Loop condition is true.  Entering lo=
op body
           for (i =3D 0; i < RDT_NUM_RESOURCES; i++) {
           ^
   fs/resctrl/rdtgroup.c:2118:7: note: Assuming field 'alloc_capable' is fa=
lse
                   if (!r->alloc_capable)
                       ^~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2118:3: note: Taking true branch
                   if (!r->alloc_capable)
                   ^
   fs/resctrl/rdtgroup.c:2119:4: note:  Execution continues on line 2116
                           continue;
                           ^
   fs/resctrl/rdtgroup.c:2116:2: note: Loop condition is false. Execution c=
ontinues on line 2135
           for (i =3D 0; i < RDT_NUM_RESOURCES; i++) {
           ^
   fs/resctrl/rdtgroup.c:2135:2: note: Returning zero (loaded from 'ret'), =
which participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/resctrl/rdtgroup.c:2169:8: note: Returning from 'schemata_list_create'
           ret =3D schemata_list_create();
                 ^~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2170:6: note: 'ret' is 0
           if (ret) {
               ^~~
   fs/resctrl/rdtgroup.c:2170:2: note: Taking false branch
           if (ret) {
           ^
   fs/resctrl/rdtgroup.c:2178:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   fs/resctrl/rdtgroup.c:2178:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/resctrl/rdtgroup.c:2181:6: note: Assuming the condition is true
           if (resctrl_arch_mon_capable()) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2181:2: note: Taking true branch
           if (resctrl_arch_mon_capable()) {
           ^
   fs/resctrl/rdtgroup.c:2182:9: note: Calling 'mongroup_create_dir'
                   ret =3D mongroup_create_dir(rdtgroup_default.kn,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:1839:7: note: Calling 'kernfs_create_dir'
           kn =3D kernfs_create_dir(parent_kn, name, parent_kn->mode, prgrp=
);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernfs.h:566:9: note: Value assigned to 'kn_mondata', whic=
h participates in a condition later
           return kernfs_create_dir_ns(parent, name, mode,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:1839:7: note: Returning from 'kernfs_create_dir'
           kn =3D kernfs_create_dir(parent_kn, name, parent_kn->mode, prgrp=
);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:1840:2: note: Taking true branch
           if (IS_ERR(kn))
           ^
   fs/resctrl/rdtgroup.c:2182:9: note: Returning from 'mongroup_create_dir'
                   ret =3D mongroup_create_dir(rdtgroup_default.kn,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2185:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   fs/resctrl/rdtgroup.c:2185:3: note: Taking false branch
                   if (ret < 0)
                   ^
   fs/resctrl/rdtgroup.c:2188:9: note: Calling 'mkdir_mondata_all'
                   ret =3D mkdir_mondata_all(rdtgroup_default.kn,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2600:2: note: 'kn' declared without an initial val=
ue
           struct kernfs_node *kn;
           ^~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2606:8: note: Calling 'mongroup_create_dir'
           ret =3D mongroup_create_dir(parent_kn, prgrp, "mon_data", &kn);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:1840:2: note: Taking true branch
           if (IS_ERR(kn))
           ^
   fs/resctrl/rdtgroup.c:1841:3: note: Returning without writing to '*dest_=
kn'
                   return PTR_ERR(kn);
                   ^
   fs/resctrl/rdtgroup.c:1841:3: note: Returning value, which participates =
in a condition later
                   return PTR_ERR(kn);
                   ^~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2606:8: note: Returning from 'mongroup_create_dir'
           ret =3D mongroup_create_dir(parent_kn, prgrp, "mon_data", &kn);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2607:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/resctrl/rdtgroup.c:2607:2: note: Taking false branch
           if (ret)
           ^
   fs/resctrl/rdtgroup.c:2610:6: note: 'dest_kn' is non-null
           if (dest_kn)
               ^~~~~~~
   fs/resctrl/rdtgroup.c:2610:2: note: Taking true branch
           if (dest_kn)
           ^
   fs/resctrl/rdtgroup.c:2611:12: note: Assigned value is garbage or undefi=
ned
                   *dest_kn =3D kn;
                            ^ ~~
>> fs/resctrl/rdtgroup.c:2919:10: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           prgrp =3D rdtgrp->mon.parent;
                   ^
   fs/resctrl/rdtgroup.c:3047:6: note: Assuming the condition is false
           if (strchr(name, '\n'))
               ^~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:3047:2: note: Taking false branch
           if (strchr(name, '\n'))
           ^
   fs/resctrl/rdtgroup.c:3055:6: note: Assuming the condition is false
           if (resctrl_arch_alloc_capable() && parent_kn =3D=3D rdtgroup_de=
fault.kn)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:3055:35: note: Left side of '&&' is false
           if (resctrl_arch_alloc_capable() && parent_kn =3D=3D rdtgroup_de=
fault.kn)
                                            ^
   fs/resctrl/rdtgroup.c:3062:6: note: Assuming the condition is true
           if (resctrl_arch_mon_capable() && is_mon_groups(parent_kn, name))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:3062:6: note: Left side of '&&' is true
   fs/resctrl/rdtgroup.c:3062:36: note: Assuming the condition is true
           if (resctrl_arch_mon_capable() && is_mon_groups(parent_kn, name))
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:3062:2: note: Taking true branch
           if (resctrl_arch_mon_capable() && is_mon_groups(parent_kn, name))
           ^
   fs/resctrl/rdtgroup.c:3063:10: note: Calling 'rdtgroup_mkdir_mon'
                   return rdtgroup_mkdir_mon(parent_kn, name, mode);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2915:8: note: Calling 'mkdir_rdt_prepare'
           ret =3D mkdir_rdt_prepare(parent_kn, name, mode, RDTMON_GROUP, &=
rdtgrp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/resctrl/rdtgroup.c:2831:7: note: 'prdtgrp' is non-null
           if (!prdtgrp) {
                ^~~~~~~
   fs/resctrl/rdtgroup.c:2831:2: note: Taking false branch
           if (!prdtgrp) {
           ^
   fs/resctrl/rdtgroup.c:2836:6: note: 'rtype' is equal to RDTMON_GROUP
           if (rtype =3D=3D RDTMON_GROUP &&
               ^~~~~
   fs/resctrl/rdtgroup.c:2836:6: note: Left side of '&&' is true
   fs/resctrl/rdtgroup.c:2837:7: note: Assuming field 'mode' is not equal t=
o RDT_MODE_PSEUDO_LOCKSETUP
               (prdtgrp->mode =3D=3D RDT_MODE_PSEUDO_LOCKSETUP ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2837:7: note: Left side of '||' is false
   fs/resctrl/rdtgroup.c:2838:7: note: Assuming field 'mode' is not equal t=
o RDT_MODE_PSEUDO_LOCKED
                prdtgrp->mode =3D=3D RDT_MODE_PSEUDO_LOCKED)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2836:2: note: Taking false branch
           if (rtype =3D=3D RDTMON_GROUP &&
           ^
   fs/resctrl/rdtgroup.c:2846:6: note: Assuming 'rdtgrp' is non-null
           if (!rdtgrp) {
               ^~~~~~~
   fs/resctrl/rdtgroup.c:2846:2: note: Taking false branch
           if (!rdtgrp) {
           ^
   fs/resctrl/rdtgroup.c:2858:2: note: Taking true branch
           if (IS_ERR(kn)) {
           ^
   fs/resctrl/rdtgroup.c:2861:3: note: Control jumps to line 2897
                   goto out_free_rgrp;
                   ^
   fs/resctrl/rdtgroup.c:2897:2: note: Memory is released
           kfree(rdtgrp);
           ^~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2915:8: note: Returning; memory was released via 5=
th parameter
           ret =3D mkdir_rdt_prepare(parent_kn, name, mode, RDTMON_GROUP, &=
rdtgrp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/resctrl/rdtgroup.c:2916:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/resctrl/rdtgroup.c:2916:2: note: Taking false branch
           if (ret)
           ^
   fs/resctrl/rdtgroup.c:2919:10: note: Use of memory after it is freed
           prgrp =3D rdtgrp->mon.parent;
                   ^~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2971:7: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
           kn =3D rdtgrp->kn;
                ^
   fs/resctrl/rdtgroup.c:3047:6: note: Assuming the condition is false
           if (strchr(name, '\n'))
               ^~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:3047:2: note: Taking false branch
           if (strchr(name, '\n'))
           ^
   fs/resctrl/rdtgroup.c:3055:6: note: Assuming the condition is true
           if (resctrl_arch_alloc_capable() && parent_kn =3D=3D rdtgroup_de=
fault.kn)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:3055:6: note: Left side of '&&' is true
   fs/resctrl/rdtgroup.c:3055:38: note: Assuming 'parent_kn' is equal to fi=
eld 'kn'
           if (resctrl_arch_alloc_capable() && parent_kn =3D=3D rdtgroup_de=
fault.kn)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/resctrl/rdtgroup.c:3055:2: note: Taking true branch
           if (resctrl_arch_alloc_capable() && parent_kn =3D=3D rdtgroup_de=
fault.kn)
           ^
   fs/resctrl/rdtgroup.c:3056:10: note: Calling 'rdtgroup_mkdir_ctrl_mon'
                   return rdtgroup_mkdir_ctrl_mon(parent_kn, name, mode);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/resctrl/rdtgroup.c:2967:8: note: Calling 'mkdir_rdt_prepare'

vim +2611 fs/resctrl/rdtgroup.c

89c48a135b8af4 James Morse 2021-09-06  2576  =

89c48a135b8af4 James Morse 2021-09-06  2577  /*
89c48a135b8af4 James Morse 2021-09-06  2578   * This creates a directory mo=
n_data which contains the monitored data.
89c48a135b8af4 James Morse 2021-09-06  2579   *
89c48a135b8af4 James Morse 2021-09-06  2580   * mon_data has one directory =
for each domain which are named
89c48a135b8af4 James Morse 2021-09-06  2581   * in the format mon_<domain_n=
ame>_<domain_id>. For ex: A mon_data
89c48a135b8af4 James Morse 2021-09-06  2582   * with L3 domain looks as bel=
ow:
89c48a135b8af4 James Morse 2021-09-06  2583   * ./mon_data:
89c48a135b8af4 James Morse 2021-09-06  2584   * mon_L3_00
89c48a135b8af4 James Morse 2021-09-06  2585   * mon_L3_01
89c48a135b8af4 James Morse 2021-09-06  2586   * mon_L3_02
89c48a135b8af4 James Morse 2021-09-06  2587   * ...
89c48a135b8af4 James Morse 2021-09-06  2588   *
89c48a135b8af4 James Morse 2021-09-06  2589   * Each domain directory has o=
ne file per event:
89c48a135b8af4 James Morse 2021-09-06  2590   * ./mon_L3_00/:
89c48a135b8af4 James Morse 2021-09-06  2591   * llc_occupancy
89c48a135b8af4 James Morse 2021-09-06  2592   *
89c48a135b8af4 James Morse 2021-09-06  2593   */
89c48a135b8af4 James Morse 2021-09-06  2594  static int mkdir_mondata_all(s=
truct kernfs_node *parent_kn,
89c48a135b8af4 James Morse 2021-09-06  2595  			     struct rdtgroup *prgrp,
89c48a135b8af4 James Morse 2021-09-06  2596  			     struct kernfs_node **d=
est_kn)
89c48a135b8af4 James Morse 2021-09-06  2597  {
89c48a135b8af4 James Morse 2021-09-06  2598  	enum resctrl_res_level i;
89c48a135b8af4 James Morse 2021-09-06  2599  	struct rdt_resource *r;
89c48a135b8af4 James Morse 2021-09-06  2600  	struct kernfs_node *kn;
89c48a135b8af4 James Morse 2021-09-06  2601  	int ret;
89c48a135b8af4 James Morse 2021-09-06  2602  =

89c48a135b8af4 James Morse 2021-09-06  2603  	/*
89c48a135b8af4 James Morse 2021-09-06  2604  	 * Create the mon_data direct=
ory first.
89c48a135b8af4 James Morse 2021-09-06  2605  	 */
89c48a135b8af4 James Morse 2021-09-06  2606  	ret =3D mongroup_create_dir(p=
arent_kn, prgrp, "mon_data", &kn);
89c48a135b8af4 James Morse 2021-09-06  2607  	if (ret)
89c48a135b8af4 James Morse 2021-09-06  2608  		return ret;
89c48a135b8af4 James Morse 2021-09-06  2609  =

89c48a135b8af4 James Morse 2021-09-06  2610  	if (dest_kn)
89c48a135b8af4 James Morse 2021-09-06 @2611  		*dest_kn =3D kn;
89c48a135b8af4 James Morse 2021-09-06  2612  =

89c48a135b8af4 James Morse 2021-09-06  2613  	/*
89c48a135b8af4 James Morse 2021-09-06  2614  	 * Create the subdirectories =
for each domain. Note that all events
89c48a135b8af4 James Morse 2021-09-06  2615  	 * in a domain like L3 are gr=
ouped into a resource whose domain is L3
89c48a135b8af4 James Morse 2021-09-06  2616  	 */
89c48a135b8af4 James Morse 2021-09-06  2617  	for (i =3D 0; i < RDT_NUM_RES=
OURCES; i++) {
89c48a135b8af4 James Morse 2021-09-06  2618  		r =3D resctrl_arch_get_resou=
rce(i);
89c48a135b8af4 James Morse 2021-09-06  2619  		if (!r->mon_capable)
89c48a135b8af4 James Morse 2021-09-06  2620  			continue;
89c48a135b8af4 James Morse 2021-09-06  2621  =

89c48a135b8af4 James Morse 2021-09-06  2622  		ret =3D mkdir_mondata_subdir=
_alldom(kn, r, prgrp);
89c48a135b8af4 James Morse 2021-09-06  2623  		if (ret)
89c48a135b8af4 James Morse 2021-09-06  2624  			goto out_destroy;
89c48a135b8af4 James Morse 2021-09-06  2625  	}
89c48a135b8af4 James Morse 2021-09-06  2626  =

89c48a135b8af4 James Morse 2021-09-06  2627  	return 0;
89c48a135b8af4 James Morse 2021-09-06  2628  =

89c48a135b8af4 James Morse 2021-09-06  2629  out_destroy:
89c48a135b8af4 James Morse 2021-09-06  2630  	kernfs_remove(kn);
89c48a135b8af4 James Morse 2021-09-06  2631  	return ret;
89c48a135b8af4 James Morse 2021-09-06  2632  }
89c48a135b8af4 James Morse 2021-09-06  2633  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3546627697817073902==--

