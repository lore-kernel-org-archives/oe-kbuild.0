Content-Type: multipart/mixed; boundary="===============4912522234452452080=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/cpu/common.c:187:45: warning: Parameter 's' can be declared with const [constParameter]
Date: Tue, 14 Jun 2022 11:28:55 +0800
Message-ID: <202206141115.KVr3yKXL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4912522234452452080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/x86/=
kernel/cpu/common.c:187:45: warning: Parameter 's' can be declared with con=
st [constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 8a1dc55a3f3ef0a723c3c117a567e7b5dd2c1793 x86/cpu: Sanitize X86_FEAT=
URE_OSPKE
date:   12 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 12 months ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8a1dc55a3f3ef0a723c3c117a567e7b5dd2c1793
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> arch/x86/mm/tlb.c:1225:8: warning: %ld in format string (no. 1) requires=
 'long' but the argument type is 'unsigned long'. [invalidPrintfArgType_sin=
t]
    len =3D sprintf(buf, "%ldn", tlb_single_page_flush_ceiling);
          ^
--
>> arch/x86/mm/pat/set_memory.c:1033:17: warning: Local variable 'pfn' shad=
ows outer variable [shadowVariable]
     unsigned long pfn =3D PFN_DOWN(__pa(address));
                   ^
   arch/x86/mm/pat/set_memory.c:971:40: note: Shadowed declaration
    unsigned long lpaddr, lpinc, ref_pfn, pfn, pfninc =3D 1;
                                          ^
   arch/x86/mm/pat/set_memory.c:1033:17: note: Shadow variable
     unsigned long pfn =3D PFN_DOWN(__pa(address));
                   ^
>> arch/x86/mm/pat/set_memory.c:2040:16: warning: Local variable 'addr' sha=
dows outer variable [shadowVariable]
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2040:16: note: Shadow variable
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/set_memory.c:2112:16: warning: Local variable 'addr' sha=
dows outer variable [shadowVariable]
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2112:16: note: Shadow variable
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/set_memory.c:2145:16: warning: Local variable 'addr' sha=
dows outer variable [shadowVariable]
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2145:16: note: Shadow variable
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/set_memory.c:2152:16: warning: Local variable 'addr' sha=
dows outer variable [shadowVariable]
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2152:16: note: Shadow variable
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/mm/tlb.c:1225:8: warning: %ld in format string (no. 1) requires=
 'long' but the argument type is 'unsigned long'. [invalidPrintfArgType_sin=
t]
    len =3D sprintf(buf, "%ldn", tlb_single_page_flush_ceiling);
          ^
--
   arch/x86/kernel/cpu/common.c:1366:40: warning: Comparing pointers that p=
oint to different objects [comparePointers]
    for (cdev =3D __x86_cpu_dev_start; cdev < __x86_cpu_dev_end; cdev++) {
                                          ^
   arch/x86/kernel/cpu/cpu.h:44:36: note: Variable declared here.
   extern const struct cpu_dev *const __x86_cpu_dev_start[],
                                      ^
   arch/x86/kernel/cpu/common.c:1366:14: note: Array decayed to pointer her=
e.
    for (cdev =3D __x86_cpu_dev_start; cdev < __x86_cpu_dev_end; cdev++) {
                ^
   arch/x86/kernel/cpu/cpu.h:45:15: note: Variable declared here.
          *const __x86_cpu_dev_end[];
                 ^
   arch/x86/kernel/cpu/common.c:1366:42: note: Array decayed to pointer her=
e.
    for (cdev =3D __x86_cpu_dev_start; cdev < __x86_cpu_dev_end; cdev++) {
                                            ^
   arch/x86/kernel/cpu/common.c:1366:40: note: Comparing pointers that poin=
t to different objects
    for (cdev =3D __x86_cpu_dev_start; cdev < __x86_cpu_dev_end; cdev++) {
                                          ^
>> arch/x86/kernel/cpu/common.c:187:45: warning: Parameter 's' can be decla=
red with const [constParameter]
   static int __init x86_noinvpcid_setup(char *s)
                                               ^
>> arch/x86/kernel/cpu/common.c:467:59: warning: Parameter 'c' can be decla=
red with const [constParameter]
   static __always_inline void setup_pku(struct cpuinfo_x86 *c)
                                                             ^
>> drivers/acpi/processor_idle.c:162:32: warning: Parameter 'cx' can be dec=
lared with const [constParameter]
        struct acpi_processor_cx *cx)
                                  ^
--
>> arch/x86/mm/pat/set_memory.c:399:52: warning: Same expression on both si=
des of '||' because 'r1_start<=3Dr2_end&&r1_end>=3Dr2_start' and 'r2_start<=
=3Dr1_end&&r2_end>=3Dr1_start' represent the same value. [knownConditionTru=
eFalse]
    return (r1_start <=3D r2_end && r1_end >=3D r2_start) ||
                                                      ^

vim +/s +187 arch/x86/kernel/cpu/common.c

0790c9aad84901 Andy Lutomirski 2017-06-29  186  =

d12a72b844a49d Andy Lutomirski 2016-01-29 @187  static int __init x86_noinv=
pcid_setup(char *s)
d12a72b844a49d Andy Lutomirski 2016-01-29  188  {
d12a72b844a49d Andy Lutomirski 2016-01-29  189  	/* noinvpcid doesn't accep=
t parameters */
d12a72b844a49d Andy Lutomirski 2016-01-29  190  	if (s)
d12a72b844a49d Andy Lutomirski 2016-01-29  191  		return -EINVAL;
d12a72b844a49d Andy Lutomirski 2016-01-29  192  =

d12a72b844a49d Andy Lutomirski 2016-01-29  193  	/* do not emit a message i=
f the feature is not present */
d12a72b844a49d Andy Lutomirski 2016-01-29  194  	if (!boot_cpu_has(X86_FEAT=
URE_INVPCID))
d12a72b844a49d Andy Lutomirski 2016-01-29  195  		return 0;
d12a72b844a49d Andy Lutomirski 2016-01-29  196  =

d12a72b844a49d Andy Lutomirski 2016-01-29  197  	setup_clear_cpu_cap(X86_FE=
ATURE_INVPCID);
d12a72b844a49d Andy Lutomirski 2016-01-29  198  	pr_info("noinvpcid: INVPCI=
D feature disabled\n");
d12a72b844a49d Andy Lutomirski 2016-01-29  199  	return 0;
d12a72b844a49d Andy Lutomirski 2016-01-29  200  }
d12a72b844a49d Andy Lutomirski 2016-01-29  201  early_param("noinvpcid", x8=
6_noinvpcid_setup);
d12a72b844a49d Andy Lutomirski 2016-01-29  202  =


:::::: The code at line 187 was first introduced by commit
:::::: d12a72b844a49d4162f24cefdab30bed3f86730e x86/mm: Add a 'noinvpcid' b=
oot option to turn off INVPCID

:::::: TO: Andy Lutomirski <luto@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4912522234452452080==--

