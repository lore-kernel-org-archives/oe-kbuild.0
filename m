Content-Type: multipart/mixed; boundary="===============0887584998760895134=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/include/asm/mshyperv.h:212:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Mon, 10 Jan 2022 21:22:37 +0800
Message-ID: <202201102124.NY2GbE3t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0887584998760895134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tianyu Lan <Tianyu.Lan@microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mikelley@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: faff44069ff538ccdfef187c4d7ec83d22dfb3a4 x86/hyperv: Add Write/Read=
 MSR registers via ghcb page
date:   2 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-c007-20220108 (https://download.01.org/0day-ci/ar=
chive/20220110/202201102124.NY2GbE3t-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344=
d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfaff44069ff538ccdfef187c4d7ec83d22dfb3a4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout faff44069ff538ccdfef187c4d7ec83d22dfb3a4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   drivers/base/platform.c:577:3: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pa->name, name);
                   ^~~~~~
   drivers/base/platform.c:577:3: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                   strcpy(pa->name, name);
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> arch/x86/include/asm/mshyperv.h:212:2: warning: Undefined or garbage val=
ue returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return value;
           ^
   drivers/hv/hv.c:275:2: note: Calling 'hv_synic_enable_regs'
           hv_synic_enable_regs(cpu);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hv/hv.c:203:5: note: Loop condition is false.  Exiting loop
                   =3D per_cpu_ptr(hv_context.cpu_context, cpu);
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
   drivers/hv/hv.c:210:19: note: Calling 'hv_get_register'
           simp.as_uint64 =3D hv_get_register(HV_REGISTER_SIMP);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mshyperv.h:206:2: note: 'value' declared without an=
 initial value
           u64 value;
           ^~~~~~~~~
   arch/x86/include/asm/mshyperv.h:208:6: note: Left side of '&&' is true
           if (hv_is_synic_reg(reg) && hv_isolation_type_snp())
               ^
   arch/x86/include/asm/mshyperv.h:208:30: note: Assuming the condition is =
true
           if (hv_is_synic_reg(reg) && hv_isolation_type_snp())
                                       ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mshyperv.h:208:2: note: Taking true branch
           if (hv_is_synic_reg(reg) && hv_isolation_type_snp())
           ^
   arch/x86/include/asm/mshyperv.h:209:3: note: Calling 'hv_ghcb_msr_read'
                   hv_ghcb_msr_read(reg, &value);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mshyperv.h:191:59: note: Returning without writing =
to '*value'
   static inline void hv_ghcb_msr_read(u64 msr, u64 *value) {}
                                                             ^
   arch/x86/include/asm/mshyperv.h:209:3: note: Returning from 'hv_ghcb_msr=
_read'
                   hv_ghcb_msr_read(reg, &value);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mshyperv.h:212:2: note: Undefined or garbage value =
returned to caller
           return value;
           ^      ~~~~~
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
   drivers/extcon/extcon-rt8973a.c:25:8: warning: Excessive padding in 'str=
uct muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-rt8973a.c:25:8: note: Excessive padding in 'struct=
 muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: nam=
e, irq, virq, consider reordering the fields or adding explicit padding mem=
bers
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/extcon/extcon-sm5502.c:24:8: warning: Excessive padding in 'stru=
ct muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-sm5502.c:24:8: note: Excessive padding in 'struct =
muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: name=
, irq, virq, consider reordering the fields or adding explicit padding memb=
ers
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/industrialio-buffer.c:760:2: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
           list_for_each_entry(buffer, &iio_dev_opaque->buffer_list, buffer=
_list) {
           ^
   include/linux/list.h:630:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'

vim +212 arch/x86/include/asm/mshyperv.h

faff44069ff538 Tianyu Lan 2021-10-25  203  =

faff44069ff538 Tianyu Lan 2021-10-25  204  static inline u64 hv_get_registe=
r(unsigned int reg)
faff44069ff538 Tianyu Lan 2021-10-25  205  {
faff44069ff538 Tianyu Lan 2021-10-25  206  	u64 value;
faff44069ff538 Tianyu Lan 2021-10-25  207  =

faff44069ff538 Tianyu Lan 2021-10-25  208  	if (hv_is_synic_reg(reg) && hv_=
isolation_type_snp())
faff44069ff538 Tianyu Lan 2021-10-25  209  		hv_ghcb_msr_read(reg, &value);
faff44069ff538 Tianyu Lan 2021-10-25  210  	else
faff44069ff538 Tianyu Lan 2021-10-25  211  		rdmsrl(reg, value);
faff44069ff538 Tianyu Lan 2021-10-25 @212  	return value;
faff44069ff538 Tianyu Lan 2021-10-25  213  }
faff44069ff538 Tianyu Lan 2021-10-25  214  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0887584998760895134==--

