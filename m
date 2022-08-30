Content-Type: multipart/mixed; boundary="===============6324783944280468714=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/m68k/include/asm/bitops.h:216 arch___test_and_set_bit() warn: signedness bug returning '(-128)'
Date: Tue, 30 Aug 2022 18:12:45 +0800
Message-ID: <202208301849.ufEmY96P-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6324783944280468714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
commit: 0e862838f290147ea9c16db852d8d494b552d38d bitops: unify non-atomic b=
itops prototypes across architectures
date:   9 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 weeks ago
config: m68k-randconfig-m041-20220830 (https://download.01.org/0day-ci/arch=
ive/20220830/202208301849.ufEmY96P-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/m68k/include/asm/bitops.h:216 arch___test_and_set_bit() warn: signedne=
ss bug returning '(-128)'

vim +216 arch/m68k/include/asm/bitops.h

171d809df1896c Greg Ungerer      2011-05-17  212  =

0e862838f29014 Alexander Lobakin 2022-06-24  213  static __always_inline bo=
ol
0e862838f29014 Alexander Lobakin 2022-06-24  214  arch___test_and_set_bit(u=
nsigned long nr, volatile unsigned long *addr)
0e862838f29014 Alexander Lobakin 2022-06-24  215  {
0e862838f29014 Alexander Lobakin 2022-06-24 @216  	return test_and_set_bit(=
nr, addr);
0e862838f29014 Alexander Lobakin 2022-06-24  217  }
171d809df1896c Greg Ungerer      2011-05-17  218  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6324783944280468714==--

