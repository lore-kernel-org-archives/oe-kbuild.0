Content-Type: multipart/mixed; boundary="===============7293376551268091967=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/m68k/include/asm/bitops.h:216 arch___test_and_set_bit() warn: signedness bug returning '(-128)'
Date: Fri, 16 Sep 2022 21:09:19 +0800
Message-ID: <202209162126.9dRakIrI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7293376551268091967==
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
head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
commit: 0e862838f290147ea9c16db852d8d494b552d38d bitops: unify non-atomic b=
itops prototypes across architectures
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: m68k-randconfig-m031-20220914 (https://download.01.org/0day-ci/arch=
ive/20220916/202209162126.9dRakIrI-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/m68k/include/asm/bitops.h:216 arch___test_and_set_bit() warn: signedne=
ss bug returning '(-128)'
arch/m68k/include/asm/bitops.h:269 arch___test_and_clear_bit() warn: signed=
ness bug returning '(-128)'

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

171d809df1896c Greg Ungerer      2011-05-17  219  static inline int bclr_re=
g_test_and_clear_bit(int nr,
171d809df1896c Greg Ungerer      2011-05-17  220  					      volatile unsig=
ned long *vaddr)
171d809df1896c Greg Ungerer      2011-05-17  221  {
171d809df1896c Greg Ungerer      2011-05-17  222  	char *p =3D (char *)vadd=
r + (nr ^ 31) / 8;
171d809df1896c Greg Ungerer      2011-05-17  223  	char retval;
171d809df1896c Greg Ungerer      2011-05-17  224  =

171d809df1896c Greg Ungerer      2011-05-17  225  	__asm__ __volatile__ ("b=
clr %2,(%1); sne %0"
171d809df1896c Greg Ungerer      2011-05-17  226  		: "=3Dd" (retval)
171d809df1896c Greg Ungerer      2011-05-17  227  		: "a" (p), "di" (nr & 7)
171d809df1896c Greg Ungerer      2011-05-17  228  		: "memory");
171d809df1896c Greg Ungerer      2011-05-17  229  	return retval;
171d809df1896c Greg Ungerer      2011-05-17  230  }
171d809df1896c Greg Ungerer      2011-05-17  231  =

171d809df1896c Greg Ungerer      2011-05-17  232  static inline int bclr_me=
m_test_and_clear_bit(int nr,
171d809df1896c Greg Ungerer      2011-05-17  233  					      volatile unsig=
ned long *vaddr)
171d809df1896c Greg Ungerer      2011-05-17  234  {
171d809df1896c Greg Ungerer      2011-05-17  235  	char *p =3D (char *)vadd=
r + (nr ^ 31) / 8;
171d809df1896c Greg Ungerer      2011-05-17  236  	char retval;
171d809df1896c Greg Ungerer      2011-05-17  237  =

171d809df1896c Greg Ungerer      2011-05-17  238  	__asm__ __volatile__ ("b=
clr %2,%1; sne %0"
171d809df1896c Greg Ungerer      2011-05-17  239  		: "=3Dd" (retval), "+m"=
 (*p)
171d809df1896c Greg Ungerer      2011-05-17  240  		: "di" (nr & 7));
171d809df1896c Greg Ungerer      2011-05-17  241  	return retval;
171d809df1896c Greg Ungerer      2011-05-17  242  }
171d809df1896c Greg Ungerer      2011-05-17  243  =

171d809df1896c Greg Ungerer      2011-05-17  244  static inline int bfclr_m=
em_test_and_clear_bit(int nr,
171d809df1896c Greg Ungerer      2011-05-17  245  					       volatile unsi=
gned long *vaddr)
171d809df1896c Greg Ungerer      2011-05-17  246  {
171d809df1896c Greg Ungerer      2011-05-17  247  	char retval;
171d809df1896c Greg Ungerer      2011-05-17  248  =

171d809df1896c Greg Ungerer      2011-05-17  249  	__asm__ __volatile__ ("b=
fclr %2{%1:#1}; sne %0"
171d809df1896c Greg Ungerer      2011-05-17  250  		: "=3Dd" (retval)
171d809df1896c Greg Ungerer      2011-05-17  251  		: "d" (nr ^ 31), "o" (*=
vaddr)
171d809df1896c Greg Ungerer      2011-05-17  252  		: "memory");
171d809df1896c Greg Ungerer      2011-05-17  253  	return retval;
171d809df1896c Greg Ungerer      2011-05-17  254  }
171d809df1896c Greg Ungerer      2011-05-17  255  =

171d809df1896c Greg Ungerer      2011-05-17  256  #if defined(CONFIG_COLDFI=
RE)
171d809df1896c Greg Ungerer      2011-05-17  257  #define	test_and_clear_bi=
t(nr, vaddr)	bclr_reg_test_and_clear_bit(nr, vaddr)
171d809df1896c Greg Ungerer      2011-05-17  258  #elif defined(CONFIG_CPU_=
HAS_NO_BITFIELDS)
171d809df1896c Greg Ungerer      2011-05-17  259  #define	test_and_clear_bi=
t(nr, vaddr)	bclr_mem_test_and_clear_bit(nr, vaddr)
171d809df1896c Greg Ungerer      2011-05-17  260  #else
171d809df1896c Greg Ungerer      2011-05-17  261  #define test_and_clear_bi=
t(nr, vaddr)	(__builtin_constant_p(nr) ? \
171d809df1896c Greg Ungerer      2011-05-17  262  					bclr_mem_test_and_cl=
ear_bit(nr, vaddr) : \
171d809df1896c Greg Ungerer      2011-05-17  263  					bfclr_mem_test_and_c=
lear_bit(nr, vaddr))
171d809df1896c Greg Ungerer      2011-05-17  264  #endif
171d809df1896c Greg Ungerer      2011-05-17  265  =

0e862838f29014 Alexander Lobakin 2022-06-24  266  static __always_inline bo=
ol
0e862838f29014 Alexander Lobakin 2022-06-24  267  arch___test_and_clear_bit=
(unsigned long nr, volatile unsigned long *addr)
0e862838f29014 Alexander Lobakin 2022-06-24  268  {
0e862838f29014 Alexander Lobakin 2022-06-24 @269  	return test_and_clear_bi=
t(nr, addr);
0e862838f29014 Alexander Lobakin 2022-06-24  270  }
171d809df1896c Greg Ungerer      2011-05-17  271  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7293376551268091967==--

