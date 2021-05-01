Content-Type: multipart/mixed; boundary="===============3987008306167957365=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/openrisc/mm/init.c:125:10: warning: Uninitialized variable: region [uninitvar]
Date: Sat, 01 May 2021 11:14:36 +0800
Message-ID: <202105011132.Pw8WFV2s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3987008306167957365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mike Rapoport <rppt@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f67672a817ec046f7554a885f0fe0d60e1bf99f
commit: b10d6bca87204cdafd0cd7aaa837ad30b4eb8c20 arch, drivers: replace for=
_each_membock() with for_each_mem_range()
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/openrisc/mm/init.c:125:10: warning: Uninitialized variable: region =
[uninitvar]
            region->base, region->base + region->size);
            ^

vim +125 arch/openrisc/mm/init.c

61e85e367535a7 Jonas Bonn          2011-06-04   58  =

61e85e367535a7 Jonas Bonn          2011-06-04   59  /*
61e85e367535a7 Jonas Bonn          2011-06-04   60   * Map all physical mem=
ory into kernel's address space.
61e85e367535a7 Jonas Bonn          2011-06-04   61   *
61e85e367535a7 Jonas Bonn          2011-06-04   62   * This is explicitly c=
oded for two-level page tables, so if you need
61e85e367535a7 Jonas Bonn          2011-06-04   63   * something else then =
this needs to change.
61e85e367535a7 Jonas Bonn          2011-06-04   64   */
61e85e367535a7 Jonas Bonn          2011-06-04   65  static void __init map_=
ram(void)
61e85e367535a7 Jonas Bonn          2011-06-04   66  {
b10d6bca87204c Mike Rapoport       2020-10-13   67  	phys_addr_t start, end;
61e85e367535a7 Jonas Bonn          2011-06-04   68  	unsigned long v, p, e;
61e85e367535a7 Jonas Bonn          2011-06-04   69  	pgprot_t prot;
61e85e367535a7 Jonas Bonn          2011-06-04   70  	pgd_t *pge;
b187fb7fca9cc4 Mike Rapoport       2020-06-04   71  	p4d_t *p4e;
61e85e367535a7 Jonas Bonn          2011-06-04   72  	pud_t *pue;
61e85e367535a7 Jonas Bonn          2011-06-04   73  	pmd_t *pme;
61e85e367535a7 Jonas Bonn          2011-06-04   74  	pte_t *pte;
b10d6bca87204c Mike Rapoport       2020-10-13   75  	u64 i;
61e85e367535a7 Jonas Bonn          2011-06-04   76  	/* These mark extents =
of read-only kernel pages...
61e85e367535a7 Jonas Bonn          2011-06-04   77  	 * ...from vmlinux.lds=
.S
61e85e367535a7 Jonas Bonn          2011-06-04   78  	 */
61e85e367535a7 Jonas Bonn          2011-06-04   79  	struct memblock_region=
 *region;
61e85e367535a7 Jonas Bonn          2011-06-04   80  =

61e85e367535a7 Jonas Bonn          2011-06-04   81  	v =3D PAGE_OFFSET;
61e85e367535a7 Jonas Bonn          2011-06-04   82  =

b10d6bca87204c Mike Rapoport       2020-10-13   83  	for_each_mem_range(i, =
&start, &end) {
b10d6bca87204c Mike Rapoport       2020-10-13   84  		p =3D (u32) start & P=
AGE_MASK;
b10d6bca87204c Mike Rapoport       2020-10-13   85  		e =3D (u32) end;
61e85e367535a7 Jonas Bonn          2011-06-04   86  =

61e85e367535a7 Jonas Bonn          2011-06-04   87  		v =3D (u32) __va(p);
61e85e367535a7 Jonas Bonn          2011-06-04   88  		pge =3D pgd_offset_k(=
v);
61e85e367535a7 Jonas Bonn          2011-06-04   89  =

61e85e367535a7 Jonas Bonn          2011-06-04   90  		while (p < e) {
61e85e367535a7 Jonas Bonn          2011-06-04   91  			int j;
b187fb7fca9cc4 Mike Rapoport       2020-06-04   92  			p4e =3D p4d_offset(p=
ge, v);
b187fb7fca9cc4 Mike Rapoport       2020-06-04   93  			pue =3D pud_offset(p=
4e, v);
61e85e367535a7 Jonas Bonn          2011-06-04   94  			pme =3D pmd_offset(p=
ue, v);
61e85e367535a7 Jonas Bonn          2011-06-04   95  =

61e85e367535a7 Jonas Bonn          2011-06-04   96  			if ((u32) pue !=3D (=
u32) pge || (u32) pme !=3D (u32) pge) {
61e85e367535a7 Jonas Bonn          2011-06-04   97  				panic("%s: OR1K ker=
nel hardcoded for "
61e85e367535a7 Jonas Bonn          2011-06-04   98  				      "two-level pa=
ge tables",
61e85e367535a7 Jonas Bonn          2011-06-04   99  				     __func__);
61e85e367535a7 Jonas Bonn          2011-06-04  100  			}
61e85e367535a7 Jonas Bonn          2011-06-04  101  =

61e85e367535a7 Jonas Bonn          2011-06-04  102  			/* Alloc one page fo=
r holding PTE's... */
fb054d0d91dbe3 Mike Rapoport       2019-03-11  103  			pte =3D memblock_all=
oc_raw(PAGE_SIZE, PAGE_SIZE);
fb054d0d91dbe3 Mike Rapoport       2019-03-11  104  			if (!pte)
fb054d0d91dbe3 Mike Rapoport       2019-03-11  105  				panic("%s: Failed t=
o allocate page for PTEs\n",
fb054d0d91dbe3 Mike Rapoport       2019-03-11  106  				      __func__);
61e85e367535a7 Jonas Bonn          2011-06-04  107  			set_pmd(pme, __pmd(_=
KERNPG_TABLE + __pa(pte)));
61e85e367535a7 Jonas Bonn          2011-06-04  108  =

61e85e367535a7 Jonas Bonn          2011-06-04  109  			/* Fill the newly al=
located page with PTE'S */
f47706099bdb8c Stefan Kristiansson 2014-01-11  110  			for (j =3D 0; p < e =
&& j < PTRS_PER_PTE;
61e85e367535a7 Jonas Bonn          2011-06-04  111  			     v +=3D PAGE_SIZ=
E, p +=3D PAGE_SIZE, j++, pte++) {
61e85e367535a7 Jonas Bonn          2011-06-04  112  				if (v >=3D (u32) _e=
_kernel_ro ||
61e85e367535a7 Jonas Bonn          2011-06-04  113  				    v < (u32) _s_ke=
rnel_ro)
61e85e367535a7 Jonas Bonn          2011-06-04  114  					prot =3D PAGE_KERN=
EL;
61e85e367535a7 Jonas Bonn          2011-06-04  115  				else
61e85e367535a7 Jonas Bonn          2011-06-04  116  					prot =3D PAGE_KERN=
EL_RO;
61e85e367535a7 Jonas Bonn          2011-06-04  117  =

61e85e367535a7 Jonas Bonn          2011-06-04  118  				set_pte(pte, mk_pte=
_phys(p, prot));
61e85e367535a7 Jonas Bonn          2011-06-04  119  			}
61e85e367535a7 Jonas Bonn          2011-06-04  120  =

61e85e367535a7 Jonas Bonn          2011-06-04  121  			pge++;
61e85e367535a7 Jonas Bonn          2011-06-04  122  		}
61e85e367535a7 Jonas Bonn          2011-06-04  123  =

61e85e367535a7 Jonas Bonn          2011-06-04  124  		printk(KERN_INFO "%s:=
 Memory: 0x%x-0x%x\n", __func__,
61e85e367535a7 Jonas Bonn          2011-06-04 @125  		       region->base, =
region->base + region->size);
61e85e367535a7 Jonas Bonn          2011-06-04  126  	}
61e85e367535a7 Jonas Bonn          2011-06-04  127  }
61e85e367535a7 Jonas Bonn          2011-06-04  128  =


:::::: The code at line 125 was first introduced by commit
:::::: 61e85e367535a7b6385b404bef93928768140f96 OpenRISC: Memory management

:::::: TO: Jonas Bonn <jonas@southpole.se>
:::::: CC: Jonas Bonn <jonas@southpole.se>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3987008306167957365==--

