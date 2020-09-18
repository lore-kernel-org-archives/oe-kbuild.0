Content-Type: multipart/mixed; boundary="===============5975631843903201750=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/mm/pat/set_memory.c:2238:9: warning: Variable 'retval' is reassigned a value before the old one has been used.
Date: Sat, 19 Sep 2020 01:28:25 +0800
Message-ID: <202009190114.aJDcKdLW%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5975631843903201750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   10b82d5176488acee2820e5a2cf0f2ec5c3488b6
commit: f9b57cf80c8b585614ba223732be0d8f19d558d8 x86/mm/pat: Move the memty=
pe related files to arch/x86/mm/pat/
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/x86/mm/pat/set_memory.c:2238:9: warning: Variable 'retval' is reass=
igned a value before the old one has been used. [redundantAssignment]
    retval =3D __change_page_attr_set_clr(&cpa, 0);
           ^
   arch/x86/mm/pat/set_memory.c:2210:0: note: Variable 'retval' is reassign=
ed a value before the old one has been used.
    int retval =3D -EINVAL;
   ^
   arch/x86/mm/pat/set_memory.c:2238:9: note: Variable 'retval' is reassign=
ed a value before the old one has been used.
    retval =3D __change_page_attr_set_clr(&cpa, 0);
           ^
>> arch/x86/mm/pat/set_memory.c:382:52: warning: Same expression on both si=
des of '||' because 'r1_start<=3Dr2_end&&r1_end>=3Dr2_start' and 'r2_start<=
=3Dr1_end&&r2_end>=3Dr1_start' represent the same value. [knownConditionTru=
eFalse]
    return (r1_start <=3D r2_end && r1_end >=3D r2_start) ||
                                                      ^
>> arch/x86/mm/pat/set_memory.c:1005:17: warning: Local variable pfn shadow=
s outer variable [shadowVar]
     unsigned long pfn =3D PFN_DOWN(__pa(address));
                   ^
   arch/x86/mm/pat/set_memory.c:943:40: note: Shadowed declaration
    unsigned long lpaddr, lpinc, ref_pfn, pfn, pfninc =3D 1;
                                          ^
   arch/x86/mm/pat/set_memory.c:1005:17: note: Shadow variable
     unsigned long pfn =3D PFN_DOWN(__pa(address));
                   ^
>> arch/x86/mm/pat/set_memory.c:365:17: warning: Local variable addr shadow=
s outer variable [shadowVar]
     unsigned long addr =3D __cpa_addr(cpa, i);
                   ^
   arch/x86/mm/pat/cpa-test.c:111:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:365:17: note: Shadow variable
     unsigned long addr =3D __cpa_addr(cpa, i);
                   ^
   arch/x86/mm/pat/set_memory.c:1996:16: warning: Local variable addr shado=
ws outer variable [shadowVar]
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:111:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:1996:16: note: Shadow variable
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/set_memory.c:2068:16: warning: Local variable addr shado=
ws outer variable [shadowVar]
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:111:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2068:16: note: Shadow variable
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/set_memory.c:2101:16: warning: Local variable addr shado=
ws outer variable [shadowVar]
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:111:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2101:16: note: Shadow variable
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/set_memory.c:2108:16: warning: Local variable addr shado=
ws outer variable [shadowVar]
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:111:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2108:16: note: Shadow variable
    unsigned long addr =3D (unsigned long)page_address(page);
                  ^
>> arch/x86/mm/pat/cpa-test.c:59:17: warning: Local variable addr shadows o=
uter variable [shadowVar]
     unsigned long addr =3D (unsigned long)__va(i << PAGE_SHIFT);
                   ^
   arch/x86/mm/pat/cpa-test.c:111:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/cpa-test.c:59:17: note: Shadow variable
     unsigned long addr =3D (unsigned long)__va(i << PAGE_SHIFT);
                   ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Df9b57cf80c8b585614ba223732be0d8f19d558d8
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout f9b57cf80c8b585614ba223732be0d8f19d558d8
vim +/retval +2238 arch/x86/mm/pat/set_memory.c

8a235efad548abd arch/x86/mm/pageattr.c Rafael J. Wysocki    2008-02-20  220=
6  =

7e0dabd3010d604 arch/x86/mm/pageattr.c Sai Praneeth Prakhya 2018-11-29  220=
7  int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn, unsigned long ad=
dress,
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  220=
8  				   unsigned numpages, unsigned long page_flags)
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  220=
9  {
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
0  	int retval =3D -EINVAL;
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
1  =

82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
2  	struct cpa_data cpa =3D {
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
3  		.vaddr =3D &address,
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
4  		.pfn =3D pfn,
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
5  		.pgd =3D pgd,
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
6  		.numpages =3D numpages,
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
7  		.mask_set =3D __pgprot(0),
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
8  		.mask_clr =3D __pgprot(0),
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  221=
9  		.flags =3D 0,
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  222=
0  	};
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  222=
1  =

7e0dabd3010d604 arch/x86/mm/pageattr.c Sai Praneeth Prakhya 2018-11-29  222=
2  	WARN_ONCE(num_online_cpus() > 1, "Don't call after initializing SMP");
7e0dabd3010d604 arch/x86/mm/pageattr.c Sai Praneeth Prakhya 2018-11-29  222=
3  =

82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  222=
4  	if (!(__supported_pte_mask & _PAGE_NX))
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  222=
5  		goto out;
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  222=
6  =

82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  222=
7  	if (!(page_flags & _PAGE_NX))
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  222=
8  		cpa.mask_clr =3D __pgprot(_PAGE_NX);
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  222=
9  =

15f003d20782a40 arch/x86/mm/pageattr.c Sai Praneeth         2016-02-17  223=
0  	if (!(page_flags & _PAGE_RW))
15f003d20782a40 arch/x86/mm/pageattr.c Sai Praneeth         2016-02-17  223=
1  		cpa.mask_clr =3D __pgprot(_PAGE_RW);
15f003d20782a40 arch/x86/mm/pageattr.c Sai Praneeth         2016-02-17  223=
2  =

21729f81ce8ae76 arch/x86/mm/pageattr.c Tom Lendacky         2017-07-17  223=
3  	if (!(page_flags & _PAGE_ENC))
21729f81ce8ae76 arch/x86/mm/pageattr.c Tom Lendacky         2017-07-17  223=
4  		cpa.mask_clr =3D pgprot_encrypted(cpa.mask_clr);
21729f81ce8ae76 arch/x86/mm/pageattr.c Tom Lendacky         2017-07-17  223=
5  =

82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  223=
6  	cpa.mask_set =3D __pgprot(_PAGE_PRESENT | page_flags);
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  223=
7  =

82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31 @223=
8  	retval =3D __change_page_attr_set_clr(&cpa, 0);
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  223=
9  	__flush_tlb_all();
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  224=
0  =

82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  224=
1  out:
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  224=
2  	return retval;
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  224=
3  }
82f0712ca0f9471 arch/x86/mm/pageattr.c Borislav Petkov      2013-10-31  224=
4  =


:::::: The code at line 2238 was first introduced by commit
:::::: 82f0712ca0f947170e785300b5c39d9c25e2f6ff x86/mm/cpa: Map in an arbit=
rary pgd

:::::: TO: Borislav Petkov <bp@suse.de>
:::::: CC: Matt Fleming <matt.fleming@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5975631843903201750==--

