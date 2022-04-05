Content-Type: multipart/mixed; boundary="===============6268474760633604994=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/cpu/common.c:187:45: warning: Parameter 's' can be declared with const [constParameter]
Date: Tue, 05 Apr 2022 09:15:01 +0800
Message-ID: <202204050912.G1AdnabG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6268474760633604994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: 8a1dc55a3f3ef0a723c3c117a567e7b5dd2c1793 x86/cpu: Sanitize X86_FEAT=
URE_OSPKE
date:   10 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 10 months ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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
>> arch/x86/kernel/cpu/mce/core.c:991:2: warning: There is an unknown macro=
 here somewhere. Configuration is required. If for_each_possible_cpu is a m=
acro then please configure it. [unknownMacro]
    for_each_possible_cpu(cpu)
    ^

vim +/s +187 arch/x86/kernel/cpu/common.c

0790c9aad84901c Andy Lutomirski 2017-06-29  186  =

d12a72b844a49d4 Andy Lutomirski 2016-01-29 @187  static int __init x86_noin=
vpcid_setup(char *s)
d12a72b844a49d4 Andy Lutomirski 2016-01-29  188  {
d12a72b844a49d4 Andy Lutomirski 2016-01-29  189  	/* noinvpcid doesn't acce=
pt parameters */
d12a72b844a49d4 Andy Lutomirski 2016-01-29  190  	if (s)
d12a72b844a49d4 Andy Lutomirski 2016-01-29  191  		return -EINVAL;
d12a72b844a49d4 Andy Lutomirski 2016-01-29  192  =

d12a72b844a49d4 Andy Lutomirski 2016-01-29  193  	/* do not emit a message =
if the feature is not present */
d12a72b844a49d4 Andy Lutomirski 2016-01-29  194  	if (!boot_cpu_has(X86_FEA=
TURE_INVPCID))
d12a72b844a49d4 Andy Lutomirski 2016-01-29  195  		return 0;
d12a72b844a49d4 Andy Lutomirski 2016-01-29  196  =

d12a72b844a49d4 Andy Lutomirski 2016-01-29  197  	setup_clear_cpu_cap(X86_F=
EATURE_INVPCID);
d12a72b844a49d4 Andy Lutomirski 2016-01-29  198  	pr_info("noinvpcid: INVPC=
ID feature disabled\n");
d12a72b844a49d4 Andy Lutomirski 2016-01-29  199  	return 0;
d12a72b844a49d4 Andy Lutomirski 2016-01-29  200  }
d12a72b844a49d4 Andy Lutomirski 2016-01-29  201  early_param("noinvpcid", x=
86_noinvpcid_setup);
d12a72b844a49d4 Andy Lutomirski 2016-01-29  202  =


:::::: The code at line 187 was first introduced by commit
:::::: d12a72b844a49d4162f24cefdab30bed3f86730e x86/mm: Add a 'noinvpcid' b=
oot option to turn off INVPCID

:::::: TO: Andy Lutomirski <luto@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6268474760633604994==--

