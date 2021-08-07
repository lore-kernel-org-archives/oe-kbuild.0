Content-Type: multipart/mixed; boundary="===============4781821513617659878=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/amd-pmc.c:204:37: warning: The left operand of '<<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Sun, 08 Aug 2021 03:41:46 +0800
Message-ID: <202108080336.9OygcFWj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4781821513617659878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9194f32bfd932e976a158d1af97a63be68a2aab
commit: 76620567496237f1f1f54683ec7da1755ee501d7 platform/x86: amd-pmc: Add=
 support for logging SMU metrics
date:   3 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c001-20210807 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 41a6b5=
0c25961addc04438b567ee1f4ef9e40f98)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D76620567496237f1f1f54683ec7da1755ee501d7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 76620567496237f1f1f54683ec7da1755ee501d7
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/platform/x86/thinkpad_acpi.c:406:52: note: expanded from macro '=
dbg_printk'
   #define dbg_printk(a_dbg_level, format, arg...)                         \
                                                                           ^
   drivers/platform/x86/thinkpad_acpi.c:10347:7: note: Assuming 'dytc_versi=
on' is < 6
                   if (dytc_version >=3D 6) {
                       ^~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10347:3: note: Taking false branch
                   if (dytc_version >=3D 6) {
                   ^
   drivers/platform/x86/thinkpad_acpi.c:10358:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   drivers/platform/x86/thinkpad_acpi.c:10358:3: note: Taking false branch
                   if (err)
                   ^
   drivers/platform/x86/thinkpad_acpi.c:10363:3: note: Calling 'dytc_profil=
e_refresh'
                   dytc_profile_refresh();
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10285:2: note: 'profile' declared w=
ithout an initial value
           enum platform_profile_option profile;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10290:6: note: Assuming 'dytc_mmc_g=
et_available' is true
           if (dytc_mmc_get_available)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10290:2: note: Taking true branch
           if (dytc_mmc_get_available)
           ^
   drivers/platform/x86/thinkpad_acpi.c:10291:9: note: Calling 'dytc_comman=
d'
                   err =3D dytc_command(DYTC_CMD_MMC_GET, &output);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:9934:19: note: Assuming the conditi=
on is false
           if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_hand=
le))) {
                            ^
   include/acpi/acexcep.h:58:42: note: expanded from macro 'ACPI_FAILURE'
   #define ACPI_FAILURE(a)                 (a)
                                            ^
   drivers/platform/x86/thinkpad_acpi.c:9934:2: note: Taking false branch
           if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_hand=
le))) {
           ^
   drivers/platform/x86/thinkpad_acpi.c:9938:6: note: Assuming the conditio=
n is false
           if (!acpi_evalf(dytc_handle, output, NULL, "dd", command))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:9938:2: note: Taking false branch
           if (!acpi_evalf(dytc_handle, output, NULL, "dd", command))
           ^
   drivers/platform/x86/thinkpad_acpi.c:9940:2: note: Returning zero, which=
 participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10291:9: note: Returning from 'dytc=
_command'
                   err =3D dytc_command(DYTC_CMD_MMC_GET, &output);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10295:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/platform/x86/thinkpad_acpi.c:10295:2: note: Taking false branch
           if (err)
           ^
   drivers/platform/x86/thinkpad_acpi.c:10299:2: note: Calling 'convert_dyt=
c_to_profile'
           convert_dytc_to_profile(perfmode, &profile);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10151:2: note: Control jumps to the=
 'default' case at line 10162
           switch (dytcmode) {
           ^
   drivers/platform/x86/thinkpad_acpi.c:10163:3: note: Returning without wr=
iting to '*profile'
                   return -EINVAL;
                   ^
   drivers/platform/x86/thinkpad_acpi.c:10299:2: note: Returning from 'conv=
ert_dytc_to_profile'
           convert_dytc_to_profile(perfmode, &profile);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10300:14: note: The left operand of=
 '!=3D' is a garbage value
           if (profile !=3D dytc_current_profile) {
               ~~~~~~~ ^
   drivers/platform/x86/thinkpad_acpi.c:11187:4: warning: Call to function =
'strcpy' is insecure as it does not provide bounding of the memory buffer. =
Replace unbounded copy functions with analogous functions that support leng=
th arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAP=
I.strcpy]
                           strcpy(ibms_init[i].param, val);
                           ^~~~~~
   drivers/platform/x86/thinkpad_acpi.c:11187:4: note: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119
                           strcpy(ibms_init[i].param, val);
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/platform/x86/amd-pmc.c:204:37: warning: The left operand of '<<'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           smu_phys_addr =3D ((u64)phys_addr_hi << 32 | phys_addr_low);
                                              ^
   drivers/platform/x86/amd-pmc.c:363:6: note: Assuming 'rdev' is non-null
           if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
               ^~~~~
   drivers/platform/x86/amd-pmc.c:363:6: note: Left side of '||' is false
   drivers/platform/x86/amd-pmc.c:363:15: note: Assuming the condition is f=
alse
           if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:363:2: note: Taking false branch
           if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
           ^
   drivers/platform/x86/amd-pmc.c:370:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/platform/x86/amd-pmc.c:370:2: note: Taking false branch
           if (err) {
           ^
   drivers/platform/x86/amd-pmc.c:377:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/platform/x86/amd-pmc.c:377:2: note: Taking false branch
           if (err) {
           ^
   drivers/platform/x86/amd-pmc.c:385:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/platform/x86/amd-pmc.c:385:2: note: Taking false branch
           if (err) {
           ^
   drivers/platform/x86/amd-pmc.c:392:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/platform/x86/amd-pmc.c:392:2: note: Taking false branch
           if (err) {
           ^
   drivers/platform/x86/amd-pmc.c:403:6: note: Assuming field 'regbase' is =
non-null
           if (!dev->regbase)
               ^~~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:403:2: note: Taking false branch
           if (!dev->regbase)
           ^
   drivers/platform/x86/amd-pmc.c:406:2: note: Loop condition is false.  Ex=
iting loop
           mutex_init(&dev->lock);
           ^
   include/linux/mutex.h:113:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/platform/x86/amd-pmc.c:409:8: note: Calling 'amd_pmc_setup_smu_l=
ogging'
           err =3D amd_pmc_setup_smu_logging(dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:192:21: note: 'phys_addr_hi' declared wit=
hout an initial value
           u32 phys_addr_low, phys_addr_hi;
                              ^~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:195:6: note: Assuming field 'cpu_id' is n=
ot equal to AMD_CPU_ID_PCO
           if (dev->cpu_id =3D=3D AMD_CPU_ID_PCO)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:195:2: note: Taking false branch
           if (dev->cpu_id =3D=3D AMD_CPU_ID_PCO)
           ^
   drivers/platform/x86/amd-pmc.c:203:2: note: Calling 'amd_pmc_send_cmd'
           amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR=
_HI, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/platform/x86/amd-pmc.c:237:7: note: '__sleep_us' is not equal to=
 0
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeo=
ut'
           might_sleep_if((__sleep_us) !=3D 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:183:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/platform/x86/amd-pmc.c:237:7: note: Taking true branch
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/platform/x86/amd-pmc.c:237:7: note: Loop condition is false.  Ex=
iting loop
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:132:2: note: expanded from macro 'might_sleep'
--
           ^
   include/linux/iopoll.h:43:24: note: expanded from macro 'read_poll_timeo=
ut'
           if (sleep_before_read && __sleep_us) \
                                 ^
   drivers/platform/x86/amd-pmc.c:237:7: note: Loop condition is true.  Ent=
ering loop body
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:45:2: note: expanded from macro 'read_poll_timeou=
t'
           for (;;) { \
           ^
   drivers/platform/x86/amd-pmc.c:238:10: note: Assuming 'val' is equal to 0
                                   val, val !=3D 0, PMC_MSG_DELAY_MIN_US,
                                        ^
   include/linux/iopoll.h:121:29: note: expanded from macro 'readx_poll_tim=
eout'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
                                      ^~~~
   include/linux/iopoll.h:47:7: note: expanded from macro 'read_poll_timeou=
t'
                   if (cond) \
                       ^~~~
   drivers/platform/x86/amd-pmc.c:237:7: note: Taking false branch
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:47:3: note: expanded from macro 'read_poll_timeou=
t'
                   if (cond) \
                   ^
   drivers/platform/x86/amd-pmc.c:237:7: note: '__timeout_us' is 20000
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/iopoll.h:49:7: note: expanded from macro 'read_poll_timeou=
t'
                   if (__timeout_us && \
                       ^~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:237:7: note: Left side of '&&' is true
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:49:7: note: expanded from macro 'read_poll_timeou=
t'
                   if (__timeout_us && \
                       ^
   drivers/platform/x86/amd-pmc.c:237:7: note: Taking true branch
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:49:3: note: expanded from macro 'read_poll_timeou=
t'
                   if (__timeout_us && \
                   ^
   drivers/platform/x86/amd-pmc.c:237:7: note:  Execution continues on line=
 237
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:52:4: note: expanded from macro 'read_poll_timeou=
t'
                           break; \
                           ^
   drivers/platform/x86/amd-pmc.c:238:10: note: Assuming 'val' is equal to 0
                                   val, val !=3D 0, PMC_MSG_DELAY_MIN_US,
                                        ^
   include/linux/iopoll.h:121:29: note: expanded from macro 'readx_poll_tim=
eout'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
                                      ^~~~
   include/linux/iopoll.h:57:3: note: expanded from macro 'read_poll_timeou=
t'
           (cond) ? 0 : -ETIMEDOUT; \
            ^~~~
   drivers/platform/x86/amd-pmc.c:237:7: note: '?' condition is false
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:57:2: note: expanded from macro 'read_poll_timeou=
t'
           (cond) ? 0 : -ETIMEDOUT; \
           ^
   drivers/platform/x86/amd-pmc.c:240:6: note: 'rc' is -110
           if (rc) {
               ^~
   drivers/platform/x86/amd-pmc.c:240:2: note: Taking true branch
           if (rc) {
           ^
   drivers/platform/x86/amd-pmc.c:242:3: note: Returning without writing to=
 '*data'
                   return rc;
                   ^
   drivers/platform/x86/amd-pmc.c:203:2: note: Returning from 'amd_pmc_send=
_cmd'
           amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR=
_HI, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/platform/x86/amd-pmc.c:204:37: note: The left operand of '<<' is=
 a garbage value
           smu_phys_addr =3D ((u64)phys_addr_hi << 32 | phys_addr_low);
                                 ~~~~~~~~~~~~ ^
>> drivers/platform/x86/amd-pmc.c:204:43: warning: The right operand of '|'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           smu_phys_addr =3D ((u64)phys_addr_hi << 32 | phys_addr_low);
                                                    ^
   drivers/platform/x86/amd-pmc.c:363:6: note: Assuming 'rdev' is non-null
           if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
               ^~~~~
   drivers/platform/x86/amd-pmc.c:363:6: note: Left side of '||' is false
   drivers/platform/x86/amd-pmc.c:363:15: note: Assuming the condition is f=
alse
           if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:363:2: note: Taking false branch
           if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
           ^
   drivers/platform/x86/amd-pmc.c:370:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/platform/x86/amd-pmc.c:370:2: note: Taking false branch
           if (err) {
           ^
   drivers/platform/x86/amd-pmc.c:377:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/platform/x86/amd-pmc.c:377:2: note: Taking false branch
           if (err) {
           ^
   drivers/platform/x86/amd-pmc.c:385:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/platform/x86/amd-pmc.c:385:2: note: Taking false branch
           if (err) {
           ^
   drivers/platform/x86/amd-pmc.c:392:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/platform/x86/amd-pmc.c:392:2: note: Taking false branch
           if (err) {
           ^
   drivers/platform/x86/amd-pmc.c:403:6: note: Assuming field 'regbase' is =
non-null
           if (!dev->regbase)
               ^~~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:403:2: note: Taking false branch
           if (!dev->regbase)
           ^
   drivers/platform/x86/amd-pmc.c:406:2: note: Loop condition is false.  Ex=
iting loop
           mutex_init(&dev->lock);
           ^
   include/linux/mutex.h:113:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/platform/x86/amd-pmc.c:409:8: note: Calling 'amd_pmc_setup_smu_l=
ogging'
           err =3D amd_pmc_setup_smu_logging(dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:192:6: note: 'phys_addr_low' declared wit=
hout an initial value
           u32 phys_addr_low, phys_addr_hi;
               ^~~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:195:6: note: Assuming field 'cpu_id' is n=
ot equal to AMD_CPU_ID_PCO
           if (dev->cpu_id =3D=3D AMD_CPU_ID_PCO)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/amd-pmc.c:195:2: note: Taking false branch
           if (dev->cpu_id =3D=3D AMD_CPU_ID_PCO)
           ^
   drivers/platform/x86/amd-pmc.c:202:2: note: Calling 'amd_pmc_send_cmd'
           amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADD=
R_LO, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/platform/x86/amd-pmc.c:237:7: note: '__sleep_us' is not equal to=
 0
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeo=
ut'
           might_sleep_if((__sleep_us) !=3D 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:183:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/platform/x86/amd-pmc.c:237:7: note: Taking true branch
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/platform/x86/amd-pmc.c:237:7: note: Loop condition is false.  Ex=
iting loop
           rc =3D readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGIS=
TER_RESPONSE,
                ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:132:2: note: expanded from macro 'might_sleep'

vim +204 drivers/platform/x86/amd-pmc.c

156ec4731cb22b Shyam Sundar S K 2020-11-05  189  =

76620567496237 Shyam Sundar S K 2021-06-29  190  static int amd_pmc_setup_s=
mu_logging(struct amd_pmc_dev *dev)
76620567496237 Shyam Sundar S K 2021-06-29  191  {
76620567496237 Shyam Sundar S K 2021-06-29  192  	u32 phys_addr_low, phys_a=
ddr_hi;
76620567496237 Shyam Sundar S K 2021-06-29  193  	u64 smu_phys_addr;
76620567496237 Shyam Sundar S K 2021-06-29  194  =

76620567496237 Shyam Sundar S K 2021-06-29  195  	if (dev->cpu_id =3D=3D AM=
D_CPU_ID_PCO)
76620567496237 Shyam Sundar S K 2021-06-29  196  		return -EINVAL;
76620567496237 Shyam Sundar S K 2021-06-29  197  =

76620567496237 Shyam Sundar S K 2021-06-29  198  	/* Get Active devices lis=
t from SMU */
76620567496237 Shyam Sundar S K 2021-06-29  199  	amd_pmc_send_cmd(dev, 0, =
&dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
76620567496237 Shyam Sundar S K 2021-06-29  200  =

76620567496237 Shyam Sundar S K 2021-06-29  201  	/* Get dram address */
76620567496237 Shyam Sundar S K 2021-06-29  202  	amd_pmc_send_cmd(dev, 0, =
&phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
76620567496237 Shyam Sundar S K 2021-06-29  203  	amd_pmc_send_cmd(dev, 0, =
&phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
76620567496237 Shyam Sundar S K 2021-06-29 @204  	smu_phys_addr =3D ((u64)p=
hys_addr_hi << 32 | phys_addr_low);
76620567496237 Shyam Sundar S K 2021-06-29  205  =

76620567496237 Shyam Sundar S K 2021-06-29  206  	dev->smu_virt_addr =3D de=
vm_ioremap(dev->dev, smu_phys_addr, sizeof(struct smu_metrics));
76620567496237 Shyam Sundar S K 2021-06-29  207  	if (!dev->smu_virt_addr)
76620567496237 Shyam Sundar S K 2021-06-29  208  		return -ENOMEM;
76620567496237 Shyam Sundar S K 2021-06-29  209  =

76620567496237 Shyam Sundar S K 2021-06-29  210  	/* Start the logging */
76620567496237 Shyam Sundar S K 2021-06-29  211  	amd_pmc_send_cmd(dev, 0, =
NULL, SMU_MSG_LOG_START, 0);
76620567496237 Shyam Sundar S K 2021-06-29  212  =

76620567496237 Shyam Sundar S K 2021-06-29  213  	return 0;
76620567496237 Shyam Sundar S K 2021-06-29  214  }
76620567496237 Shyam Sundar S K 2021-06-29  215  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4781821513617659878==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
DsQus6NryokooR8x/B+mduX3+0oCAA==
--===============4781821513617659878==--

