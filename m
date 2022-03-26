Content-Type: multipart/mixed; boundary="===============4578291937340014965=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/xmon/xmon.c:3745:6: warning: Uninitialized variable: name [uninitvar]
Date: Sat, 26 Mar 2022 20:15:50 +0800
Message-ID: <202203262007.U2Tu6bG9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4578291937340014965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52d543b5497cf31d6baeb0bcfe5a5474c3238578
commit: a2305e3de819394a7adf68078964a92d06f9db33 powerpc: mark local variab=
les around longjmp as volatile
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/powerpc/xmon/xmon.c:3745:6: warning: Uninitialized variable: name [=
uninitvar]
    if (name) {
        ^

vim +3745 arch/powerpc/xmon/xmon.c

^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3722  =

^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3723  =

^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3724  /*=
 Print an address in numeric and symbolic form (if possible) */
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3725  st=
atic void xmon_print_symbol(unsigned long address, const char *mid,
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3726  		=
	      const char *after)
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3727  {
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3728  	c=
har *modname;
a2305e3de81939 arch/powerpc/xmon/xmon.c Arnd Bergmann  2021-04-29  3729  	c=
onst char *volatile name =3D NULL;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3730  	u=
nsigned long offset, size;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3731  =

f78541dcec327b arch/powerpc/xmon/xmon.c Paul Mackerras 2005-10-28  3732  	p=
rintf(REG, address);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3733  	i=
f (setjmp(bus_error_jmp) =3D=3D 0) {
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3734  		=
catch_memory_errors =3D 1;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3735  		=
sync();
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3736  		=
name =3D kallsyms_lookup(address, &size, &offset, &modname,
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3737  		=
		       tmpstr);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3738  		=
sync();
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3739  		=
/* wait a little while to see if we get a machine check */
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3740  		=
__delay(200);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3741  	}
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3742  =

^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3743  	c=
atch_memory_errors =3D 0;
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3744  =

^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16 @3745  	i=
f (name) {
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3746  		=
printf("%s%s+%#lx/%#lx", mid, name, offset, size);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3747  		=
if (modname)
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3748  		=
	printf(" [%s]", modname);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3749  	}
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3750  	p=
rintf("%s", after);
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3751  }
^1da177e4c3f41 arch/ppc64/xmon/xmon.c   Linus Torvalds 2005-04-16  3752  =


:::::: The code at line 3745 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4578291937340014965==--

