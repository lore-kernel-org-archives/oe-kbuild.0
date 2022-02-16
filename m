Content-Type: multipart/mixed; boundary="===============2704065087282860909=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] ACPI: bus: For platform OSC negotiate capabilities
Date: Thu, 17 Feb 2022 05:15:01 +0800
Message-ID: <202202170529.KhZQO9pK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2704065087282860909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220215185209.1046551-3-mario.limonciello@amd.com>
References: <20220215185209.1046551-3-mario.limonciello@amd.com>
TO: Mario Limonciello <mario.limonciello@amd.com>
TO: "Rafael J . Wysocki" <rjw@rjwysocki.net>
TO: linux-acpi(a)vger.kernel.org
CC: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Xiaomeng.Hou(a)amd.com
CC: Aaron.Liu(a)amd.com
CC: Ray.Huang(a)amd.com
CC: hdegoede(a)redhat.com
CC: Mario Limonciello <mario.limonciello@amd.com>

Hi Mario,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on v5.17-rc4 next-20220216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mario-Limonciello/ACPI-APE=
I-Adjust-for-acpi_run_osc-logic-changes/20220216-025736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 linux-next
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: i386-randconfig-c001-20220214 (https://download.01.org/0day-ci/arch=
ive/20220217/202202170529.KhZQO9pK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422=
f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/602548e9eec8dc7598a1e6423=
04e8c084b2e0c60
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mario-Limonciello/ACPI-APEI-Adjust=
-for-acpi_run_osc-logic-changes/20220216-025736
        git checkout 602548e9eec8dc7598a1e642304e8c084b2e0c60
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   kernel/time/ntp.c:345:33: note: The result of the left shift is undefine=
d because the left operand is negative
           time_offset =3D div_s64(offset64 << NTP_SCALE_SHIFT, NTP_INTERVA=
L_FREQ);
                                 ~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/base/platform.c:578:3: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pa->name, name);
                   ^~~~~~
   drivers/base/platform.c:578:3: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                   strcpy(pa->name, name);
                   ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/acpi/bus.c:249:5: warning: Value stored to 'status' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                                   status =3D AE_SUPPORT;
                                   ^
   drivers/acpi/bus.c:249:5: note: Value stored to 'status' is never read
   drivers/acpi/bus.c:257:2: warning: Value stored to 'status' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           status =3D  AE_OK;
           ^
   drivers/acpi/bus.c:257:2: note: Value stored to 'status' is never read
>> drivers/acpi/bus.c:345:31: warning: Array access (from variable 'capbuf_=
ret') results in a null pointer dereference [clang-analyzer-core.NullDerefe=
rence]
                   capbuf[OSC_SUPPORT_DWORD] =3D capbuf_ret[OSC_SUPPORT_DWO=
RD];
                                               ^~~~~~~~~~
   drivers/acpi/bus.c:293:2: note: 'context.ret.pointer' initialized to a n=
ull pointer value
           struct acpi_osc_context context =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/bus.c:305:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_ACPI_PROCESSOR_AGGREGATOR))
           ^
   drivers/acpi/bus.c:307:2: note: Taking true branch
           if (IS_ENABLED(CONFIG_ACPI_PROCESSOR))
           ^
   drivers/acpi/bus.c:312:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_ACPI_PRMT))
           ^
   drivers/acpi/bus.c:320:6: note: Left side of '&&' is true
           if (boot_cpu_has(X86_FEATURE_HWP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:3: note: expanded from macro 'cpu_=
has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
            ^
   drivers/acpi/bus.c:320:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:74:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
            ( CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  0, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/acpi/bus.c:320:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:75:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  1, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/acpi/bus.c:320:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:76:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  2, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/acpi/bus.c:320:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:77:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  3, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/acpi/bus.c:320:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:78:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  4, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/acpi/bus.c:320:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP)) {

vim +/capbuf_ret +345 drivers/acpi/bus.c

5c2832e91a3ed45 Srinivas Pandruvada 2016-11-22  325  =

de966cf4a4fa8d4 Tim Chen            2016-11-29  326  	if (IS_ENABLED(CONFIG=
_SCHED_MC_PRIO))
8b533a0eeefc586 Srinivas Pandruvada 2016-11-22  327  		capbuf[OSC_SUPPORT_D=
WORD] |=3D OSC_SB_CPC_DIVERSE_HIGH_SUPPORT;
8b533a0eeefc586 Srinivas Pandruvada 2016-11-22  328  =

5a6a2c0f0f43676 Mika Westerberg     2020-02-18  329  	if (IS_ENABLED(CONFIG=
_USB4))
5a6a2c0f0f43676 Mika Westerberg     2020-02-18  330  		capbuf[OSC_SUPPORT_D=
WORD] |=3D OSC_SB_NATIVE_USB4_SUPPORT;
5a6a2c0f0f43676 Mika Westerberg     2020-02-18  331  =

eccddd32ced0df8 Huang Ying          2011-07-13  332  	if (!ghes_disable)
b938a229c85a567 Bjorn Helgaas       2013-09-05  333  		capbuf[OSC_SUPPORT_D=
WORD] |=3D OSC_SB_APEI_SUPPORT;
3563ff964fdc363 Shaohua Li          2009-10-29  334  	if (ACPI_FAILURE(acpi=
_get_handle(NULL, "\\_SB", &handle)))
3563ff964fdc363 Shaohua Li          2009-10-29  335  		return;
719e1f561afbe02 Mario Limonciello   2020-10-26  336  =

602548e9eec8dc7 Mario Limonciello   2022-02-15  337  	/*
602548e9eec8dc7 Mario Limonciello   2022-02-15  338  	 * check if bits were=
 masked, we need to negotiate
602548e9eec8dc7 Mario Limonciello   2022-02-15  339  	 * prevent potential =
endless loop by limited number of
602548e9eec8dc7 Mario Limonciello   2022-02-15  340  	 * negotiation cycles
602548e9eec8dc7 Mario Limonciello   2022-02-15  341  	 */
602548e9eec8dc7 Mario Limonciello   2022-02-15  342  	for (i =3D 0; i < 5; =
i++) {
602548e9eec8dc7 Mario Limonciello   2022-02-15  343  		status =3D acpi_run_=
osc(handle, &context);
602548e9eec8dc7 Mario Limonciello   2022-02-15  344  		capbuf_ret =3D conte=
xt.ret.pointer;
602548e9eec8dc7 Mario Limonciello   2022-02-15 @345  		capbuf[OSC_SUPPORT_D=
WORD] =3D capbuf_ret[OSC_SUPPORT_DWORD];
602548e9eec8dc7 Mario Limonciello   2022-02-15  346  		kfree(context.ret.po=
inter);
602548e9eec8dc7 Mario Limonciello   2022-02-15  347  		if (status !=3D AE_S=
UPPORT)
602548e9eec8dc7 Mario Limonciello   2022-02-15  348  			break;
602548e9eec8dc7 Mario Limonciello   2022-02-15  349  	}
602548e9eec8dc7 Mario Limonciello   2022-02-15  350  	if (ACPI_FAILURE(stat=
us))
719e1f561afbe02 Mario Limonciello   2020-10-26  351  		return;
719e1f561afbe02 Mario Limonciello   2020-10-26  352  =

602548e9eec8dc7 Mario Limonciello   2022-02-15  353  	/*
602548e9eec8dc7 Mario Limonciello   2022-02-15  354  	 * avoid problems wit=
h BIOS dynamically loading tables by indicating
602548e9eec8dc7 Mario Limonciello   2022-02-15  355  	 * support for CPPC e=
ven if it was masked
602548e9eec8dc7 Mario Limonciello   2022-02-15  356  	 */
602548e9eec8dc7 Mario Limonciello   2022-02-15  357  #ifdef CONFIG_X86
602548e9eec8dc7 Mario Limonciello   2022-02-15  358  	if (boot_cpu_has(X86_=
FEATURE_HWP)) {
602548e9eec8dc7 Mario Limonciello   2022-02-15  359  		capbuf[OSC_SUPPORT_D=
WORD] |=3D OSC_SB_CPC_SUPPORT;
602548e9eec8dc7 Mario Limonciello   2022-02-15  360  		capbuf[OSC_SUPPORT_D=
WORD] |=3D OSC_SB_CPCV2_SUPPORT;
602548e9eec8dc7 Mario Limonciello   2022-02-15  361  	}
602548e9eec8dc7 Mario Limonciello   2022-02-15  362  #endif
719e1f561afbe02 Mario Limonciello   2020-10-26  363  =

159d8c274fd9243 Mika Westerberg     2021-06-09  364  	/* Now run _OSC again=
 with query flag clear */
719e1f561afbe02 Mario Limonciello   2020-10-26  365  	capbuf[OSC_QUERY_DWOR=
D] =3D 0;
719e1f561afbe02 Mario Limonciello   2020-10-26  366  =

719e1f561afbe02 Mario Limonciello   2020-10-26  367  	if (ACPI_FAILURE(acpi=
_run_osc(handle, &context)))
719e1f561afbe02 Mario Limonciello   2020-10-26  368  		return;
719e1f561afbe02 Mario Limonciello   2020-10-26  369  =

719e1f561afbe02 Mario Limonciello   2020-10-26  370  	capbuf_ret =3D contex=
t.ret.pointer;
eccddd32ced0df8 Huang Ying          2011-07-13  371  	osc_sb_apei_support_a=
cked =3D
b938a229c85a567 Bjorn Helgaas       2013-09-05  372  		capbuf_ret[OSC_SUPPO=
RT_DWORD] & OSC_SB_APEI_SUPPORT;
a36a7fecfe60717 Sudeep Holla        2016-07-21  373  	osc_pc_lpi_support_co=
nfirmed =3D
a36a7fecfe60717 Sudeep Holla        2016-07-21  374  		capbuf_ret[OSC_SUPPO=
RT_DWORD] & OSC_SB_PCLPI_SUPPORT;
5a6a2c0f0f43676 Mika Westerberg     2020-02-18  375  	osc_sb_native_usb4_su=
pport_confirmed =3D
5a6a2c0f0f43676 Mika Westerberg     2020-02-18  376  		capbuf_ret[OSC_SUPPO=
RT_DWORD] & OSC_SB_NATIVE_USB4_SUPPORT;
5a6a2c0f0f43676 Mika Westerberg     2020-02-18  377  =

5a6a2c0f0f43676 Mika Westerberg     2020-02-18  378  	kfree(context.ret.poi=
nter);
5a6a2c0f0f43676 Mika Westerberg     2020-02-18  379  }
5a6a2c0f0f43676 Mika Westerberg     2020-02-18  380  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2704065087282860909==--

