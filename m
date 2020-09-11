Content-Type: multipart/mixed; boundary="===============4295263192286086499=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/lib/code-patching.c:455:6: warning: Variable 'err' is reassigned a value before the old one has been used.
Date: Fri, 11 Sep 2020 09:37:01 +0800
Message-ID: <202009110948.oDqeizeY%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4295263192286086499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jordan Niethe <jniethe5@gmail.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Alistair Popple <alistair@popple.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7fe10096c1508c7f033d34d0741809f8eecc1ed4
commit: 7c95d8893fb55869882c9f68f4c94840dc43f18f powerpc: Change calling co=
nvention for create_branch() et. al.
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/powerpc/lib/code-patching.c:455:6: warning: Variable 'err' is reass=
igned a value before the old one has been used. [redundantAssignment]
    err =3D create_branch(&instr, &instr, addr - 0x100, BRANCH_SET_LINK);
        ^
   arch/powerpc/lib/code-patching.c:451:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_branch(&instr, &instr, addr, BRANCH_SET_LINK);
        ^
   arch/powerpc/lib/code-patching.c:455:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_branch(&instr, &instr, addr - 0x100, BRANCH_SET_LINK);
        ^
   arch/powerpc/lib/code-patching.c:459:6: warning: Variable 'err' is reass=
igned a value before the old one has been used. [redundantAssignment]
    err =3D create_branch(&instr, &instr, addr + 0x100, 0);
        ^
   arch/powerpc/lib/code-patching.c:455:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_branch(&instr, &instr, addr - 0x100, BRANCH_SET_LINK);
        ^
   arch/powerpc/lib/code-patching.c:459:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_branch(&instr, &instr, addr + 0x100, 0);
        ^
   arch/powerpc/lib/code-patching.c:463:6: warning: Variable 'err' is reass=
igned a value before the old one has been used. [redundantAssignment]
    err =3D create_branch(&instr, &instr, addr - 0x2000000, BRANCH_SET_LINK=
);
        ^
   arch/powerpc/lib/code-patching.c:459:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_branch(&instr, &instr, addr + 0x100, 0);
        ^
   arch/powerpc/lib/code-patching.c:463:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_branch(&instr, &instr, addr - 0x2000000, BRANCH_SET_LINK=
);
        ^
   arch/powerpc/lib/code-patching.c:467:6: warning: Variable 'err' is reass=
igned a value before the old one has been used. [redundantAssignment]
    err =3D create_branch(&instr, &instr, addr - 0x2000004, BRANCH_SET_LINK=
);
        ^
   arch/powerpc/lib/code-patching.c:463:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_branch(&instr, &instr, addr - 0x2000000, BRANCH_SET_LINK=
);
        ^
   arch/powerpc/lib/code-patching.c:467:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_branch(&instr, &instr, addr - 0x2000004, BRANCH_SET_LINK=
);
        ^
   arch/powerpc/lib/code-patching.c:540:6: warning: Variable 'err' is reass=
igned a value before the old one has been used. [redundantAssignment]
    err =3D create_cond_branch(&instr, iptr, addr - 0x100, flags);
        ^
   arch/powerpc/lib/code-patching.c:536:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_cond_branch(&instr, iptr, addr, flags);
        ^
   arch/powerpc/lib/code-patching.c:540:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_cond_branch(&instr, iptr, addr - 0x100, flags);
        ^
   arch/powerpc/lib/code-patching.c:544:6: warning: Variable 'err' is reass=
igned a value before the old one has been used. [redundantAssignment]
    err =3D create_cond_branch(&instr, iptr, addr + 0x100, flags);
        ^
   arch/powerpc/lib/code-patching.c:540:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_cond_branch(&instr, iptr, addr - 0x100, flags);
        ^
   arch/powerpc/lib/code-patching.c:544:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_cond_branch(&instr, iptr, addr + 0x100, flags);
        ^
   arch/powerpc/lib/code-patching.c:548:6: warning: Variable 'err' is reass=
igned a value before the old one has been used. [redundantAssignment]
    err =3D create_cond_branch(&instr, iptr, addr - 0x8000, flags);
        ^
   arch/powerpc/lib/code-patching.c:544:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_cond_branch(&instr, iptr, addr + 0x100, flags);
        ^
   arch/powerpc/lib/code-patching.c:548:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_cond_branch(&instr, iptr, addr - 0x8000, flags);
        ^
   arch/powerpc/lib/code-patching.c:552:6: warning: Variable 'err' is reass=
igned a value before the old one has been used. [redundantAssignment]
    err =3D create_cond_branch(&instr, iptr, addr - 0x8004, flags);
        ^
   arch/powerpc/lib/code-patching.c:548:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_cond_branch(&instr, iptr, addr - 0x8000, flags);
        ^
   arch/powerpc/lib/code-patching.c:552:6: note: Variable 'err' is reassign=
ed a value before the old one has been used.
    err =3D create_cond_branch(&instr, iptr, addr - 0x8004, flags);
        ^
>> arch/powerpc/mm/nohash/tlb.c:304:8: warning: Possible null pointer deref=
erence: mm [nullPointer]
    pid =3D mm->context.id;
          ^
   arch/powerpc/mm/nohash/tlb.c:342:23: note: Calling function '__flush_tlb=
_page', 1st argument 'vma?vma->vm_mm:NULL' value is 0
    __flush_tlb_page(vma ? vma->vm_mm : NULL, vmaddr,
                         ^
   arch/powerpc/mm/nohash/tlb.c:304:8: note: Null pointer dereference
    pid =3D mm->context.id;
          ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D7c95d8893fb55869882c9f68f4c94840dc43f18f
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 7c95d8893fb55869882c9f68f4c94840dc43f18f
vim +/err +455 arch/powerpc/lib/code-patching.c

ae0dc73625f9b0 Michael Ellerman 2008-06-24  404  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  405  #define check(x)	\
ae0dc73625f9b0 Michael Ellerman 2008-06-24  406  	if (!(x)) printk("code-pa=
tching: test failed at line %d\n", __LINE__);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  407  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  408  static void __init test_br=
anch_iform(void)
ae0dc73625f9b0 Michael Ellerman 2008-06-24  409  {
7c95d8893fb558 Jordan Niethe    2020-05-06  410  	int err;
ae0dc73625f9b0 Michael Ellerman 2008-06-24  411  	unsigned int instr;
ae0dc73625f9b0 Michael Ellerman 2008-06-24  412  	unsigned long addr;
ae0dc73625f9b0 Michael Ellerman 2008-06-24  413  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  414  	addr =3D (unsigned long)&=
instr;
ae0dc73625f9b0 Michael Ellerman 2008-06-24  415  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  416  	/* The simplest case, bra=
nch to self, no flags */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  417  	check(instr_is_branch_ifo=
rm(0x48000000));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  418  	/* All bits of target set=
, and flags */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  419  	check(instr_is_branch_ifo=
rm(0x4bffffff));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  420  	/* High bit of opcode set=
, which is wrong */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  421  	check(!instr_is_branch_if=
orm(0xcbffffff));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  422  	/* Middle bits of opcode =
set, which is wrong */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  423  	check(!instr_is_branch_if=
orm(0x7bffffff));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  424  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  425  	/* Simplest case, branch =
to self with link */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  426  	check(instr_is_branch_ifo=
rm(0x48000001));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  427  	/* All bits of targets se=
t */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  428  	check(instr_is_branch_ifo=
rm(0x4bfffffd));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  429  	/* Some bits of targets s=
et */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  430  	check(instr_is_branch_ifo=
rm(0x4bff00fd));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  431  	/* Must be a valid branch=
 to start with */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  432  	check(!instr_is_branch_if=
orm(0x7bfffffd));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  433  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  434  	/* Absolute branch to 0x1=
00 */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  435  	instr =3D 0x48000103;
ae0dc73625f9b0 Michael Ellerman 2008-06-24  436  	check(instr_is_branch_to_=
addr(&instr, 0x100));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  437  	/* Absolute branch to 0x4=
20fc */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  438  	instr =3D 0x480420ff;
ae0dc73625f9b0 Michael Ellerman 2008-06-24  439  	check(instr_is_branch_to_=
addr(&instr, 0x420fc));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  440  	/* Maximum positive relat=
ive branch, + 20MB - 4B */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  441  	instr =3D 0x49fffffc;
ae0dc73625f9b0 Michael Ellerman 2008-06-24  442  	check(instr_is_branch_to_=
addr(&instr, addr + 0x1FFFFFC));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  443  	/* Smallest negative rela=
tive branch, - 4B */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  444  	instr =3D 0x4bfffffc;
ae0dc73625f9b0 Michael Ellerman 2008-06-24  445  	check(instr_is_branch_to_=
addr(&instr, addr - 4));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  446  	/* Largest negative relat=
ive branch, - 32 MB */
ae0dc73625f9b0 Michael Ellerman 2008-06-24  447  	instr =3D 0x4a000000;
ae0dc73625f9b0 Michael Ellerman 2008-06-24  448  	check(instr_is_branch_to_=
addr(&instr, addr - 0x2000000));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  449  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  450  	/* Branch to self, with l=
ink */
7c95d8893fb558 Jordan Niethe    2020-05-06  451  	err =3D create_branch(&in=
str, &instr, addr, BRANCH_SET_LINK);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  452  	check(instr_is_branch_to_=
addr(&instr, addr));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  453  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  454  	/* Branch to self - 0x100=
, with link */
7c95d8893fb558 Jordan Niethe    2020-05-06 @455  	err =3D create_branch(&in=
str, &instr, addr - 0x100, BRANCH_SET_LINK);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  456  	check(instr_is_branch_to_=
addr(&instr, addr - 0x100));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  457  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  458  	/* Branch to self + 0x100=
, no link */
7c95d8893fb558 Jordan Niethe    2020-05-06  459  	err =3D create_branch(&in=
str, &instr, addr + 0x100, 0);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  460  	check(instr_is_branch_to_=
addr(&instr, addr + 0x100));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  461  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  462  	/* Maximum relative negat=
ive offset, - 32 MB */
7c95d8893fb558 Jordan Niethe    2020-05-06  463  	err =3D create_branch(&in=
str, &instr, addr - 0x2000000, BRANCH_SET_LINK);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  464  	check(instr_is_branch_to_=
addr(&instr, addr - 0x2000000));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  465  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  466  	/* Out of range relative =
negative offset, - 32 MB + 4*/
7c95d8893fb558 Jordan Niethe    2020-05-06  467  	err =3D create_branch(&in=
str, &instr, addr - 0x2000004, BRANCH_SET_LINK);
7c95d8893fb558 Jordan Niethe    2020-05-06  468  	check(err);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  469  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  470  	/* Out of range relative =
positive offset, + 32 MB */
7c95d8893fb558 Jordan Niethe    2020-05-06  471  	err =3D create_branch(&in=
str, &instr, addr + 0x2000000, BRANCH_SET_LINK);
7c95d8893fb558 Jordan Niethe    2020-05-06  472  	check(err);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  473  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  474  	/* Unaligned target */
7c95d8893fb558 Jordan Niethe    2020-05-06  475  	err =3D create_branch(&in=
str, &instr, addr + 3, BRANCH_SET_LINK);
7c95d8893fb558 Jordan Niethe    2020-05-06  476  	check(err);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  477  =

ae0dc73625f9b0 Michael Ellerman 2008-06-24  478  	/* Check flags are masked=
 correctly */
7c95d8893fb558 Jordan Niethe    2020-05-06  479  	err =3D create_branch(&in=
str, &instr, addr, 0xFFFFFFFC);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  480  	check(instr_is_branch_to_=
addr(&instr, addr));
ae0dc73625f9b0 Michael Ellerman 2008-06-24  481  	check(instr =3D=3D 0x4800=
0000);
ae0dc73625f9b0 Michael Ellerman 2008-06-24  482  }
ae0dc73625f9b0 Michael Ellerman 2008-06-24  483  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4295263192286086499==--

