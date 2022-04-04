Content-Type: multipart/mixed; boundary="===============1883451452895249987=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [deller-parisc:for-next 4/7] arch/parisc/kernel/processor.c:470:2: warning: There is an unknown macro here somewhere. Configuration is required. If for_each_possible_cpu is a macro then please configure it. [unknownMacro]
Date: Mon, 04 Apr 2022 10:51:34 +0800
Message-ID: <202204041059.UOoIM2w6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1883451452895249987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux=
.git for-next
head:   c240d602a90de0e3e7b4a8b43b515a84345c0a93
commit: 7d968f702772eebbff1ad246534f3bb761eca32a [4/7] parisc: Only list ex=
isting CPUs in cpu_possible_mask
:::::: branch date: 7 hours ago
:::::: commit date: 3 days ago
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/parisc/kernel/processor.c:470:2: warning: There is an unknown macro=
 here somewhere. Configuration is required. If for_each_possible_cpu is a m=
acro then please configure it. [unknownMacro]
    for_each_possible_cpu(cpu)
    ^

vim +470 arch/parisc/kernel/processor.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  457  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  458  /**
7022672e4046fac Simon Arlott   2007-05-11  459   * processor_init - Process=
or initialization procedure.
^1da177e4c3f415 Linus Torvalds 2005-04-16  460   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  461   * Register this driver.
^1da177e4c3f415 Linus Torvalds 2005-04-16  462   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  463  void __init processor_init(=
void)
^1da177e4c3f415 Linus Torvalds 2005-04-16  464  {
7d968f702772eeb Helge Deller   2022-04-01  465  	unsigned int cpu;
7d968f702772eeb Helge Deller   2022-04-01  466  =

62773112acc55d2 Helge Deller   2022-03-24  467  	reset_cpu_topology();
7d968f702772eeb Helge Deller   2022-04-01  468  =

7d968f702772eeb Helge Deller   2022-04-01  469  	/* reset possible mask. We=
 will mark those which are possible. */
7d968f702772eeb Helge Deller   2022-04-01 @470  	for_each_possible_cpu(cpu)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1883451452895249987==--

