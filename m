Content-Type: multipart/mixed; boundary="===============6264504493767151786=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9437/11713] drivers/acpi/bus.c:357:32: warning: Array access (from variable 'capbuf_ret') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Thu, 10 Mar 2022 17:56:50 +0800
Message-ID: <202203101714.syPsxwNu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6264504493767151786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mario Limonciello <mario.limonciello@amd.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4e7a74a6856f8613dab9794da4b5cfb8fd54fb8c
commit: 9028fcdfd1787077d2e924bc4d288f515fabc511 [9437/11713] ACPI: bus: Fo=
r platform _OSC negotiate capabilities
:::::: branch date: 22 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20310/202203101714.syPsxwNu-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D9028fcdfd1787077d2e924bc4d288f515fabc511
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9028fcdfd1787077d2e924bc4d288f515fabc511
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/list.h:772:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:230:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_CONTROL
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:7: note: Left side of '||' is false
   sound/core/device.c:231:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_LOWLEVEL
                       dev->type =3D=3D SNDRV_DEV_LOWLEVEL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:3: note: Taking false branch
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                   ^
   sound/core/device.c:233:3: note: Calling '__snd_device_free'
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:6: note: Assuming field 'dev_free' is null
           if (dev->ops->dev_free) {
               ^~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:2: note: Taking false branch
           if (dev->ops->dev_free) {
           ^
   sound/core/device.c:79:2: note: Memory is released
           kfree(dev);
           ^~~~~~~~~~
   sound/core/device.c:233:3: note: Returning; memory was released via 1st =
parameter
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:228:2: note: Loop condition is false. Execution cont=
inues on line 237
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:772:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:237:2: note: Use of memory after it is freed
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:773:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:572:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   drivers/acpi/osl.c:1744:3: warning: Value stored to 'rv' is never read [=
clang-analyzer-deadcode.DeadStores]
                   rv =3D acpi_os_map_generic_address(&acpi_gbl_FADT.reset_=
register);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/acpi/osl.c:1744:3: note: Value stored to 'rv' is never read
                   rv =3D acpi_os_map_generic_address(&acpi_gbl_FADT.reset_=
register);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
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
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/acpi/bus.c:357:32: warning: Array access (from variable 'capbuf_=
ret') results in a null pointer dereference [clang-analyzer-core.NullDerefe=
rence]
                           capbuf[OSC_SUPPORT_DWORD] =3D capbuf_ret[OSC_SUP=
PORT_DWORD];
                                                       ^~~~~~~~~~
   drivers/acpi/bus.c:316:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_ACPI_PROCESSOR_AGGREGATOR))
           ^
   drivers/acpi/bus.c:318:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_ACPI_PROCESSOR))
           ^
   drivers/acpi/bus.c:323:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_ACPI_PRMT))
           ^
   drivers/acpi/bus.c:331:6: note: Left side of '&&' is true
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
   drivers/acpi/bus.c:331:6: note: Left side of '&&' is false
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
   drivers/acpi/bus.c:331:6: note: Left side of '&&' is false
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
   drivers/acpi/bus.c:331:6: note: Left side of '&&' is false
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
   drivers/acpi/bus.c:331:6: note: Left side of '&&' is false
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
   drivers/acpi/bus.c:331:6: note: Left side of '&&' is false
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
   drivers/acpi/bus.c:331:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)

vim +/capbuf_ret +357 drivers/acpi/bus.c

5c2832e91a3ed4 Srinivas Pandruvada 2016-11-22  336  =

de966cf4a4fa8d Tim Chen            2016-11-29  337  	if (IS_ENABLED(CONFIG_=
SCHED_MC_PRIO))
8b533a0eeefc58 Srinivas Pandruvada 2016-11-22  338  		capbuf[OSC_SUPPORT_DW=
ORD] |=3D OSC_SB_CPC_DIVERSE_HIGH_SUPPORT;
8b533a0eeefc58 Srinivas Pandruvada 2016-11-22  339  =

5a6a2c0f0f4367 Mika Westerberg     2020-02-18  340  	if (IS_ENABLED(CONFIG_=
USB4))
5a6a2c0f0f4367 Mika Westerberg     2020-02-18  341  		capbuf[OSC_SUPPORT_DW=
ORD] |=3D OSC_SB_NATIVE_USB4_SUPPORT;
5a6a2c0f0f4367 Mika Westerberg     2020-02-18  342  =

eccddd32ced0df Huang Ying          2011-07-13  343  	if (!ghes_disable)
b938a229c85a56 Bjorn Helgaas       2013-09-05  344  		capbuf[OSC_SUPPORT_DW=
ORD] |=3D OSC_SB_APEI_SUPPORT;
3563ff964fdc36 Shaohua Li          2009-10-29  345  	if (ACPI_FAILURE(acpi_=
get_handle(NULL, "\\_SB", &handle)))
3563ff964fdc36 Shaohua Li          2009-10-29  346  		return;
719e1f561afbe0 Mario Limonciello   2020-10-26  347  =

9028fcdfd17870 Mario Limonciello   2022-03-01  348  	/*
9028fcdfd17870 Mario Limonciello   2022-03-01  349  	 * Check if bits were =
masked, we need to negotiate
9028fcdfd17870 Mario Limonciello   2022-03-01  350  	 * prevent potential e=
ndless loop by limited number of
9028fcdfd17870 Mario Limonciello   2022-03-01  351  	 * negotiation cycles.
9028fcdfd17870 Mario Limonciello   2022-03-01  352  	 */
9028fcdfd17870 Mario Limonciello   2022-03-01  353  	for (i =3D 0; i < 5; i=
++) {
9028fcdfd17870 Mario Limonciello   2022-03-01  354  		status =3D acpi_run_o=
sc(handle, &context);
9028fcdfd17870 Mario Limonciello   2022-03-01  355  		if (status =3D=3D AE_=
OK || status =3D=3D AE_SUPPORT) {
9028fcdfd17870 Mario Limonciello   2022-03-01  356  			capbuf_ret =3D conte=
xt.ret.pointer;
9028fcdfd17870 Mario Limonciello   2022-03-01 @357  			capbuf[OSC_SUPPORT_D=
WORD] =3D capbuf_ret[OSC_SUPPORT_DWORD];
9028fcdfd17870 Mario Limonciello   2022-03-01  358  			kfree(context.ret.po=
inter);
9028fcdfd17870 Mario Limonciello   2022-03-01  359  		}
9028fcdfd17870 Mario Limonciello   2022-03-01  360  		if (status !=3D AE_SU=
PPORT)
9028fcdfd17870 Mario Limonciello   2022-03-01  361  			break;
9028fcdfd17870 Mario Limonciello   2022-03-01  362  	}
9028fcdfd17870 Mario Limonciello   2022-03-01  363  	if (ACPI_FAILURE(statu=
s))
719e1f561afbe0 Mario Limonciello   2020-10-26  364  		return;
719e1f561afbe0 Mario Limonciello   2020-10-26  365  =

9028fcdfd17870 Mario Limonciello   2022-03-01  366  	/*
9028fcdfd17870 Mario Limonciello   2022-03-01  367  	 * Avoid problems with=
 BIOS dynamically loading tables by indicating
9028fcdfd17870 Mario Limonciello   2022-03-01  368  	 * support for CPPC ev=
en if it was masked.
9028fcdfd17870 Mario Limonciello   2022-03-01  369  	 */
9028fcdfd17870 Mario Limonciello   2022-03-01  370  #ifdef CONFIG_X86
9028fcdfd17870 Mario Limonciello   2022-03-01  371  	if (boot_cpu_has(X86_F=
EATURE_HWP)) {
9028fcdfd17870 Mario Limonciello   2022-03-01  372  		capbuf[OSC_SUPPORT_DW=
ORD] |=3D OSC_SB_CPC_SUPPORT;
9028fcdfd17870 Mario Limonciello   2022-03-01  373  		capbuf[OSC_SUPPORT_DW=
ORD] |=3D OSC_SB_CPCV2_SUPPORT;
9028fcdfd17870 Mario Limonciello   2022-03-01  374  	}
9028fcdfd17870 Mario Limonciello   2022-03-01  375  #endif
719e1f561afbe0 Mario Limonciello   2020-10-26  376  =

159d8c274fd924 Mika Westerberg     2021-06-09  377  	/* Now run _OSC again =
with query flag clear */
719e1f561afbe0 Mario Limonciello   2020-10-26  378  	capbuf[OSC_QUERY_DWORD=
] =3D 0;
719e1f561afbe0 Mario Limonciello   2020-10-26  379  =

719e1f561afbe0 Mario Limonciello   2020-10-26  380  	if (ACPI_FAILURE(acpi_=
run_osc(handle, &context)))
719e1f561afbe0 Mario Limonciello   2020-10-26  381  		return;
719e1f561afbe0 Mario Limonciello   2020-10-26  382  =

719e1f561afbe0 Mario Limonciello   2020-10-26  383  	capbuf_ret =3D context=
.ret.pointer;
eccddd32ced0df Huang Ying          2011-07-13  384  	osc_sb_apei_support_ac=
ked =3D
b938a229c85a56 Bjorn Helgaas       2013-09-05  385  		capbuf_ret[OSC_SUPPOR=
T_DWORD] & OSC_SB_APEI_SUPPORT;
a36a7fecfe6071 Sudeep Holla        2016-07-21  386  	osc_pc_lpi_support_con=
firmed =3D
a36a7fecfe6071 Sudeep Holla        2016-07-21  387  		capbuf_ret[OSC_SUPPOR=
T_DWORD] & OSC_SB_PCLPI_SUPPORT;
5a6a2c0f0f4367 Mika Westerberg     2020-02-18  388  	osc_sb_native_usb4_sup=
port_confirmed =3D
5a6a2c0f0f4367 Mika Westerberg     2020-02-18  389  		capbuf_ret[OSC_SUPPOR=
T_DWORD] & OSC_SB_NATIVE_USB4_SUPPORT;
5a6a2c0f0f4367 Mika Westerberg     2020-02-18  390  =

5a6a2c0f0f4367 Mika Westerberg     2020-02-18  391  	kfree(context.ret.poin=
ter);
5a6a2c0f0f4367 Mika Westerberg     2020-02-18  392  }
5a6a2c0f0f4367 Mika Westerberg     2020-02-18  393  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6264504493767151786==--

