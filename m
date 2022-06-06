Content-Type: multipart/mixed; boundary="===============0939554391163449620=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/boot/compressed/misc.c:156:49: warning: Subtracting pointers that point to different objects [comparePointers]
Date: Mon, 06 Jun 2022 18:44:36 +0800
Message-ID: <202206061859.9Qpl05sl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0939554391163449620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/arm/boot/compressed/misc.c:156:49: warning: Subtracting pointers that=
 point to different objects [comparePointers]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: 424953cf3c6657f1e67e1a2c5d6e3bb518ea4e9a qcom_scm: hide Kconfig sym=
bol
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 424953cf3c6657f1e67e1a2c5d6e3bb518ea4e9a
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm/boot/compressed/misc.c:156:49: warning: Subtracting pointers th=
at point to different objects [comparePointers]
    ret =3D do_decompress(input_data, input_data_end - input_data,
                                                   ^
   arch/arm/boot/compressed/misc.c:104:13: note: Variable declared here.
   extern char input_data_end[];
               ^
   arch/arm/boot/compressed/misc.c:156:34: note: Array decayed to pointer h=
ere.
    ret =3D do_decompress(input_data, input_data_end - input_data,
                                    ^
   arch/arm/boot/compressed/misc.c:103:13: note: Variable declared here.
   extern char input_data[];
               ^
   arch/arm/boot/compressed/misc.c:156:51: note: Array decayed to pointer h=
ere.
    ret =3D do_decompress(input_data, input_data_end - input_data,
                                                     ^
   arch/arm/boot/compressed/misc.c:156:49: note: Subtracting pointers that =
point to different objects
    ret =3D do_decompress(input_data, input_data_end - input_data,
                                                   ^
>> arch/arm/boot/compressed/misc.c:44:11: warning: Uninitialized variable: =
status [uninitvar]
    } while (status & (1 << 29));
             ^
   arch/arm/boot/compressed/misc.c:61:11: warning: Uninitialized variable: =
status [uninitvar]
    } while (status & (1 << 28));
             ^
   arch/arm/boot/compressed/misc.c:77:11: warning: Uninitialized variable: =
status [uninitvar]
    } while (status & 2);
             ^

vim +156 arch/arm/boot/compressed/misc.c

7d95ded9114956 Tony Lindgren                  2006-09-20   34  =

7d95ded9114956 Tony Lindgren                  2006-09-20   35  static void =
icedcc_putc(int ch)
7d95ded9114956 Tony Lindgren                  2006-09-20   36  {
7d95ded9114956 Tony Lindgren                  2006-09-20   37  	int status,=
 i =3D 0x4000000;
7d95ded9114956 Tony Lindgren                  2006-09-20   38  =

7d95ded9114956 Tony Lindgren                  2006-09-20   39  	do {
7d95ded9114956 Tony Lindgren                  2006-09-20   40  		if (--i < =
0)
7d95ded9114956 Tony Lindgren                  2006-09-20   41  			return;
7d95ded9114956 Tony Lindgren                  2006-09-20   42  =

7d95ded9114956 Tony Lindgren                  2006-09-20   43  		asm volati=
le ("mrc p14, 0, %0, c0, c1, 0" : "=3Dr" (status));
7d95ded9114956 Tony Lindgren                  2006-09-20  @44  	} while (st=
atus & (1 << 29));
7d95ded9114956 Tony Lindgren                  2006-09-20   45  =

7d95ded9114956 Tony Lindgren                  2006-09-20   46  	asm("mcr p1=
4, 0, %0, c0, c5, 0" : : "r" (ch));
7d95ded9114956 Tony Lindgren                  2006-09-20   47  }
200b7a8dc09504 Tony Lindgren                  2010-01-19   48  =

200b7a8dc09504 Tony Lindgren                  2010-01-19   49  =

c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   50  #elif define=
d(CONFIG_CPU_XSCALE)
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   51  =

c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   52  static void =
icedcc_putc(int ch)
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   53  {
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   54  	int status,=
 i =3D 0x4000000;
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   55  =

c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   56  	do {
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   57  		if (--i < =
0)
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   58  			return;
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   59  =

c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   60  		asm volati=
le ("mrc p14, 0, %0, c14, c0, 0" : "=3Dr" (status));
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   61  	} while (st=
atus & (1 << 28));
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   62  =

c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   63  	asm("mcr p1=
4, 0, %0, c8, c0, 0" : : "r" (ch));
c633c3cfcf41ef Jean-Christop PLAGNIOL-VILLARD 2009-02-25   64  }
7d95ded9114956 Tony Lindgren                  2006-09-20   65  =

7d95ded9114956 Tony Lindgren                  2006-09-20   66  #else
7d95ded9114956 Tony Lindgren                  2006-09-20   67  =

de4533a04eb4f6 Russell King                   2006-03-28   68  static void =
icedcc_putc(int ch)
de4533a04eb4f6 Russell King                   2006-03-28   69  {
de4533a04eb4f6 Russell King                   2006-03-28   70  	int status,=
 i =3D 0x4000000;
de4533a04eb4f6 Russell King                   2006-03-28   71  =

de4533a04eb4f6 Russell King                   2006-03-28   72  	do {
de4533a04eb4f6 Russell King                   2006-03-28   73  		if (--i < =
0)
de4533a04eb4f6 Russell King                   2006-03-28   74  			return;
de4533a04eb4f6 Russell King                   2006-03-28   75  =

b2556da55f78a9 Uwe Zeisberger                 2006-05-02   76  		asm volati=
le ("mrc p14, 0, %0, c0, c0, 0" : "=3Dr" (status));
de4533a04eb4f6 Russell King                   2006-03-28   77  	} while (st=
atus & 2);
de4533a04eb4f6 Russell King                   2006-03-28   78  =

b2556da55f78a9 Uwe Zeisberger                 2006-05-02   79  	asm("mcr p1=
4, 0, %0, c1, c0, 0" : : "r" (ch));
de4533a04eb4f6 Russell King                   2006-03-28   80  }
de4533a04eb4f6 Russell King                   2006-03-28   81  =

7d95ded9114956 Tony Lindgren                  2006-09-20   82  #endif
7d95ded9114956 Tony Lindgren                  2006-09-20   83  =

a081568d701606 Russell King                   2006-03-28   84  #define putc=
(ch)	icedcc_putc(ch)
a081568d701606 Russell King                   2006-03-28   85  #endif
^1da177e4c3f41 Linus Torvalds                 2005-04-16   86  =

a081568d701606 Russell King                   2006-03-28   87  static void =
putstr(const char *ptr)
^1da177e4c3f41 Linus Torvalds                 2005-04-16   88  {
a081568d701606 Russell King                   2006-03-28   89  	char c;
a081568d701606 Russell King                   2006-03-28   90  =

a081568d701606 Russell King                   2006-03-28   91  	while ((c =
=3D *ptr++) !=3D '\0') {
a081568d701606 Russell King                   2006-03-28   92  		if (c =3D=
=3D '\n')
a081568d701606 Russell King                   2006-03-28   93  			putc('\r'=
);
a081568d701606 Russell King                   2006-03-28   94  		putc(c);
^1da177e4c3f41 Linus Torvalds                 2005-04-16   95  	}
a081568d701606 Russell King                   2006-03-28   96  =

a081568d701606 Russell King                   2006-03-28   97  	flush();
^1da177e4c3f41 Linus Torvalds                 2005-04-16   98  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16   99  =

^1da177e4c3f41 Linus Torvalds                 2005-04-16  100  /*
e40f1e9fb342a2 Nicolas Pitre                  2011-04-19  101   * gzip decl=
arations
^1da177e4c3f41 Linus Torvalds                 2005-04-16  102   */
^1da177e4c3f41 Linus Torvalds                 2005-04-16  103  extern char =
input_data[];
^1da177e4c3f41 Linus Torvalds                 2005-04-16  104  extern char =
input_data_end[];
^1da177e4c3f41 Linus Torvalds                 2005-04-16  105  =

5de813b6cd0646 Russell King                   2010-02-25  106  unsigned cha=
r *output_data;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  107  =

5de813b6cd0646 Russell King                   2010-02-25  108  unsigned lon=
g free_mem_ptr;
5de813b6cd0646 Russell King                   2010-02-25  109  unsigned lon=
g free_mem_end_ptr;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  110  =

f8c905d368c757 Ben Dooks                      2005-11-08  111  #ifndef arch=
_error
f8c905d368c757 Ben Dooks                      2005-11-08  112  #define arch=
_error(x)
f8c905d368c757 Ben Dooks                      2005-11-08  113  #endif
f8c905d368c757 Ben Dooks                      2005-11-08  114  =

5de813b6cd0646 Russell King                   2010-02-25  115  void error(c=
har *x)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  116  {
f8c905d368c757 Ben Dooks                      2005-11-08  117  	arch_error(=
x);
f8c905d368c757 Ben Dooks                      2005-11-08  118  =

^1da177e4c3f41 Linus Torvalds                 2005-04-16  119  	putstr("\n\=
n");
^1da177e4c3f41 Linus Torvalds                 2005-04-16  120  	putstr(x);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  121  	putstr("\n\=
n -- System halted");
^1da177e4c3f41 Linus Torvalds                 2005-04-16  122  =

^1da177e4c3f41 Linus Torvalds                 2005-04-16  123  	while(1);	/=
* Halt */
^1da177e4c3f41 Linus Torvalds                 2005-04-16  124  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  125  =

e7db7b4270ed2a Albin Tonnerre                 2010-01-08  126  asmlinkage v=
oid __div0(void)
e7db7b4270ed2a Albin Tonnerre                 2010-01-08  127  {
e7db7b4270ed2a Albin Tonnerre                 2010-01-08  128  	error("Atte=
mpting division by 0!");
e7db7b4270ed2a Albin Tonnerre                 2010-01-08  129  }
e7db7b4270ed2a Albin Tonnerre                 2010-01-08  130  =

7bbaf27d9c8303 Huacai Chen                    2018-04-05  131  const unsign=
ed long __stack_chk_guard =3D 0x000a0dff;
8779657d29c0eb Kees Cook                      2013-12-19  132  =

8779657d29c0eb Kees Cook                      2013-12-19  133  void __stack=
_chk_fail(void)
8779657d29c0eb Kees Cook                      2013-12-19  134  {
8779657d29c0eb Kees Cook                      2013-12-19  135  	error("stac=
k-protector: Kernel stack is corrupted\n");
8779657d29c0eb Kees Cook                      2013-12-19  136  }
8779657d29c0eb Kees Cook                      2013-12-19  137  =

ccc1c7c6c25661 Nicolas Pitre                  2011-04-21  138  extern int d=
o_decompress(u8 *input, int len, u8 *output, void (*error)(char *x));
5de813b6cd0646 Russell King                   2010-02-25  139  =

^1da177e4c3f41 Linus Torvalds                 2005-04-16  140  =

e40f1e9fb342a2 Nicolas Pitre                  2011-04-19  141  void
e7db7b4270ed2a Albin Tonnerre                 2010-01-08  142  decompress_k=
ernel(unsigned long output_start, unsigned long free_mem_ptr_p,
e7db7b4270ed2a Albin Tonnerre                 2010-01-08  143  		unsigned l=
ong free_mem_ptr_end_p,
^1da177e4c3f41 Linus Torvalds                 2005-04-16  144  		int arch_i=
d)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  145  {
ccc1c7c6c25661 Nicolas Pitre                  2011-04-21  146  	int ret;
e7db7b4270ed2a Albin Tonnerre                 2010-01-08  147  =

e7db7b4270ed2a Albin Tonnerre                 2010-01-08  148  	output_data=
		=3D (unsigned char *)output_start;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  149  	free_mem_pt=
r		=3D free_mem_ptr_p;
2d6ffcca623a9a Thomas Petazzoni               2008-07-25  150  	free_mem_en=
d_ptr	=3D free_mem_ptr_end_p;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  151  	__machine_a=
rch_type	=3D arch_id;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  152  =

^1da177e4c3f41 Linus Torvalds                 2005-04-16  153  	arch_decomp=
_setup();
^1da177e4c3f41 Linus Torvalds                 2005-04-16  154  =

^1da177e4c3f41 Linus Torvalds                 2005-04-16  155  	putstr("Unc=
ompressing Linux...");
ccc1c7c6c25661 Nicolas Pitre                  2011-04-21 @156  	ret =3D do_=
decompress(input_data, input_data_end - input_data,
5de813b6cd0646 Russell King                   2010-02-25  157  			    outpu=
t_data, error);
ccc1c7c6c25661 Nicolas Pitre                  2011-04-21  158  	if (ret)
ccc1c7c6c25661 Nicolas Pitre                  2011-04-21  159  		error("dec=
ompressor returned an error");
ccc1c7c6c25661 Nicolas Pitre                  2011-04-21  160  	else
^1da177e4c3f41 Linus Torvalds                 2005-04-16  161  		putstr(" d=
one, booting the kernel.\n");
^1da177e4c3f41 Linus Torvalds                 2005-04-16  162  }
ee333554fed555 Jinbum Park                    2018-03-06  163  =


:::::: The code@line 156 was first introduced by commit
:::::: ccc1c7c6c25661f0071a7ebe997abcbf529df3e9 ARM: zImage: don't ignore e=
rror returned from decompress()

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Nicolas Pitre <nico@fluxnic.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0939554391163449620==--

