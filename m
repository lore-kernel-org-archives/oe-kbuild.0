Content-Type: multipart/mixed; boundary="===============0079764967361508411=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [ihalip:KSPP20 1/1] arch/x86/mm/pti.c:74:8: warning: syntax error [syntaxError]
Date: Fri, 24 Apr 2020 12:36:20 +0800
Message-ID: <202004241215.KM0i7THs%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0079764967361508411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ilie Halip <ilie.halip@gmail.com>

tree:   https://github.com/ihalip/linux KSPP20
head:   8330d5d8175290b95261a95dddf7f914740d4dbb
commit: 8330d5d8175290b95261a95dddf7f914740d4dbb [1/1] mark some variables =
as __ro_after_init
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/x86/mm/pti.c:74:8: warning: syntax error [syntaxError]
   static enum pti_mode {
          ^

# https://github.com/ihalip/linux/commit/8330d5d8175290b95261a95dddf7f91474=
0d4dbb
git remote add ihalip https://github.com/ihalip/linux
git remote update ihalip
git checkout 8330d5d8175290b95261a95dddf7f914740d4dbb
vim +74 arch/x86/mm/pti.c

41f4c20b57a489 Borislav Petkov  2017-12-12  73  =

4fe64a62e04cfb Valdis Kletnieks 2019-03-12 @74  static enum pti_mode {
8c06c7740d191b Dave Hansen      2018-04-06  75  	PTI_AUTO =3D 0,
8c06c7740d191b Dave Hansen      2018-04-06  76  	PTI_FORCE_OFF,
8c06c7740d191b Dave Hansen      2018-04-06  77  	PTI_FORCE_ON
8330d5d8175290 Ilie Halip       2020-04-15  78  } pti_mode __ro_after_init;
8c06c7740d191b Dave Hansen      2018-04-06  79  =


:::::: The code at line 74 was first introduced by commit
:::::: 4fe64a62e04cfb2dc1daab0d8f05d212aa014161 x86/mm/pti: Make local symb=
ols static

:::::: TO: Valdis Kletnieks <valdis.kletnieks@vt.edu>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0079764967361508411==--

