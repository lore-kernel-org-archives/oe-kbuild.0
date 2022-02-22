Content-Type: multipart/mixed; boundary="===============8007629846447835374=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5970/6564] mm/huge_memory.c:2145:4: warning: Value stored to 'page' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 22 Feb 2022 09:23:56 +0800
Message-ID: <202202220917.CFUvfxmY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8007629846447835374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hugh Dickins <hughd@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
commit: c1879365d325d0f44337fedcfffe8bf200092f95 [5970/6564] mm/munlock: rm=
ap call mlock_vma_page() munlock_vma_page()
:::::: branch date: 5 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c007-20220221 (https://download.01.org/0day-ci/ar=
chive/20220222/202202220917.CFUvfxmY-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dc1879365d325d0f44337fedcfffe8bf200092f95
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c1879365d325d0f44337fedcfffe8bf200092f95
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~
   drivers/base/bus.c:53:2: note: Taking true branch
           if (bus)
           ^
   drivers/base/bus.c:55:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:147:3: note: Returning from 'bus_put'
                   bus_put(bus);
                   ^~~~~~~~~~~~
   drivers/base/bus.c:149:1: note: Returning without writing to '->p'
   }
   ^
   drivers/base/bus.c:573:2: note: Returning from 'bus_remove_file'
           bus_remove_file(bus, &bus_attr_drivers_probe);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:574:1: note: Returning without writing to 'bus->p'
   }
   ^
   drivers/base/bus.c:872:2: note: Returning from 'remove_probe_files'
           remove_probe_files(bus);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:873:18: note: Access to field 'drivers_kset' results =
in a dereference of a null pointer (loaded from field 'p')
           kset_unregister(bus->p->drivers_kset);
                           ^    ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/char/tpm/eventlog/tpm1.c:276:2: warning: Value stored to 'len' i=
s never read [clang-analyzer-deadcode.DeadStores]
           len +=3D get_event_name(eventname, event, event_entry);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/eventlog/tpm1.c:276:2: note: Value stored to 'len' is n=
ever read
           len +=3D get_event_name(eventname, event, event_entry);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (7 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/char/tpm/tpm_tis_core.c:423:2: warning: Value stored to 'rc' is =
never read [clang-analyzer-deadcode.DeadStores]
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.c:423:2: note: Value stored to 'rc' is nev=
er read
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   mm/huge_memory.c:583:9: warning: Value stored to 'off' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           loff_t off =3D (loff_t)pgoff << PAGE_SHIFT;
                  ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c:583:9: note: Value stored to 'off' during its initializ=
ation is never read
           loff_t off =3D (loff_t)pgoff << PAGE_SHIFT;
                  ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/huge_memory.c:2145:4: warning: Value stored to 'page' is never read [=
clang-analyzer-deadcode.DeadStores]
                           page =3D pmd_page(*pmd);
                           ^
   mm/huge_memory.c:2145:4: note: Value stored to 'page' is never read
   mm/huge_memory.c:2991:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(file_path, tok);
                           ^~~~~~
   mm/huge_memory.c:2991:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(file_path, tok);
                           ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   mm/khugepaged.c:1651:3: warning: Value stored to 'result' is never read =
[clang-analyzer-deadcode.DeadStores]
                   result =3D SCAN_ALLOC_HUGE_PAGE_FAIL;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1651:3: note: Value stored to 'result' is never read
                   result =3D SCAN_ALLOC_HUGE_PAGE_FAIL;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1656:3: warning: Value stored to 'result' is never read =
[clang-analyzer-deadcode.DeadStores]
                   result =3D SCAN_CGROUP_CHARGE_FAIL;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1656:3: note: Value stored to 'result' is never read
                   result =3D SCAN_CGROUP_CHARGE_FAIL;
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1672:4: warning: Value stored to 'result' is never read =
[clang-analyzer-deadcode.DeadStores]
                           result =3D SCAN_FAIL;
                           ^        ~~~~~~~~~
   mm/khugepaged.c:1672:4: note: Value stored to 'result' is never read
                           result =3D SCAN_FAIL;
                           ^        ~~~~~~~~~
   mm/khugepaged.c:1904:3: warning: Assigned value is garbage or undefined =
[clang-analyzer-core.uninitialized.Assign]
                   list_for_each_entry_safe(page, tmp, &pagelist, lru) {
                   ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   mm/khugepaged.c:1638:2: note: '?' condition is false
           XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
           ^
   include/linux/xarray.h:1367:21: note: expanded from macro 'XA_STATE_ORDE=
R'
                           order - (order % XA_CHUNK_SHIFT),       \
                                            ^
   include/linux/xarray.h:1110:26: note: expanded from macro 'XA_CHUNK_SHIF=
T'
   #define XA_CHUNK_SHIFT          (CONFIG_BASE_SMALL ? 4 : 6)
                                    ^
   ./include/generated/autoconf.h:2359:27: note: expanded from macro 'CONFI=
G_BASE_SMALL'
   #define CONFIG_BASE_SMALL 0
                             ^
   mm/khugepaged.c:1638:2: note: '?' condition is false
           XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
           ^
   include/linux/xarray.h:1368:20: note: expanded from macro 'XA_STATE_ORDE=
R'
                           (1U << (order % XA_CHUNK_SHIFT)) - 1)
                                           ^
   include/linux/xarray.h:1110:26: note: expanded from macro 'XA_CHUNK_SHIF=
T'
   #define XA_CHUNK_SHIFT          (CONFIG_BASE_SMALL ? 4 : 6)
                                    ^
   ./include/generated/autoconf.h:2359:27: note: expanded from macro 'CONFI=
G_BASE_SMALL'
   #define CONFIG_BASE_SMALL 0
                             ^
   mm/khugepaged.c:1643:12: note: Left side of '&&' is true
           VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
                     ^
   mm/khugepaged.c:1643:56: note: Assuming 'is_shmem' is true
           VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
                                                                 ^
   include/linux/mmdebug.h:17:32: note: expanded from macro 'VM_BUG_ON'
   #define VM_BUG_ON(cond) BUG_ON(cond)
                                  ^~~~
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/khugepaged.c:1643:2: note: Taking false branch
           VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
           ^
   include/linux/mmdebug.h:17:25: note: expanded from macro 'VM_BUG_ON'
   #define VM_BUG_ON(cond) BUG_ON(cond)
                           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   mm/khugepaged.c:1643:2: note: Loop condition is false.  Exiting loop
           VM_BUG_ON(!IS_ENABLED(CONFIG_READ_ONLY_THP_FOR_FS) && !is_shmem);
           ^
   include/linux/mmdebug.h:17:25: note: expanded from macro 'VM_BUG_ON'
   #define VM_BUG_ON(cond) BUG_ON(cond)
                           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'

vim +/page +2145 mm/huge_memory.c

eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2119  =

eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2120  void __split_huge_pmd(s=
truct vm_area_struct *vma, pmd_t *pmd,
33f4751e99601b Naoya Horiguchi    2016-07-14  2121  		unsigned long address=
, bool freeze, struct page *page)
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2122  {
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2123  	spinlock_t *ptl;
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  2124  	struct mmu_n=
otifier_range range;
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2125  =

7269f999934b28 J=C3=A9r=C3=B4me Glisse      2019-05-13  2126  	mmu_notifier=
_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
6f4f13e8d9e27c J=C3=A9r=C3=B4me Glisse      2019-05-13  2127  				address &=
 HPAGE_PMD_MASK,
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  2128  				(address =
& HPAGE_PMD_MASK) + HPAGE_PMD_SIZE);
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  2129  	mmu_notifier=
_invalidate_range_start(&range);
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  2130  	ptl =3D pmd_=
lock(vma->vm_mm, pmd);
33f4751e99601b Naoya Horiguchi    2016-07-14  2131  =

33f4751e99601b Naoya Horiguchi    2016-07-14  2132  	/*
33f4751e99601b Naoya Horiguchi    2016-07-14  2133  	 * If caller asks to s=
etup a migration entries, we need a page to check
33f4751e99601b Naoya Horiguchi    2016-07-14  2134  	 * pmd against. Otherw=
ise we can end up replacing wrong page.
33f4751e99601b Naoya Horiguchi    2016-07-14  2135  	 */
33f4751e99601b Naoya Horiguchi    2016-07-14  2136  	VM_BUG_ON(freeze && !p=
age);
c444eb564fb166 Andrea Arcangeli   2020-05-27  2137  	if (page) {
c444eb564fb166 Andrea Arcangeli   2020-05-27  2138  		VM_WARN_ON_ONCE(!Page=
Locked(page));
c444eb564fb166 Andrea Arcangeli   2020-05-27  2139  		if (page !=3D pmd_pag=
e(*pmd))
33f4751e99601b Naoya Horiguchi    2016-07-14  2140  			goto out;
c444eb564fb166 Andrea Arcangeli   2020-05-27  2141  	}
33f4751e99601b Naoya Horiguchi    2016-07-14  2142  =

5c7fb56e5e3f70 Dan Williams       2016-01-15  2143  	if (pmd_trans_huge(*pm=
d)) {
dbe67be3d9f30a David Hildenbrand  2022-02-16  2144  		if (!page)
33f4751e99601b Naoya Horiguchi    2016-07-14 @2145  			page =3D pmd_page(*p=
md);
84c3fc4e9c563d Zi Yan             2017-09-08  2146  	} else if (!(pmd_devma=
p(*pmd) || is_pmd_migration_entry(*pmd)))
5c7fb56e5e3f70 Dan Williams       2016-01-15  2147  		goto out;
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  2148  	__split_huge=
_pmd_locked(vma, pmd, range.start, freeze);
e90309c9f7722d Kirill A. Shutemov 2016-01-15  2149  out:
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2150  	spin_unlock(ptl);
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2151  	/*
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2152  	 * No need t=
o double call mmu_notifier->invalidate_range() callback.
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2153  	 * They are =
3 cases to consider inside __split_huge_pmd_locked():
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2154  	 *  1) pmdp_=
huge_clear_flush_notify() call invalidate_range() obvious
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2155  	 *  2) __spl=
it_huge_zero_page_pmd() read only zero page and any write
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2156  	 *    fault =
will trigger a flush_notify before pointing to a new page
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2157  	 *    (it is=
 fine if the secondary mmu keeps pointing to the old zero
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2158  	 *    page i=
n the meantime)
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2159  	 *  3) Split=
 a huge pmd into pte pointing to the same page. No need
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2160  	 *     to in=
validate secondary tlb entry they are all still valid.
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2161  	 *     any f=
urther changes to individual pte will notify. So no need
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2162  	 *     to ca=
ll mmu_notifier->invalidate_range()
4645b9fe84bf48 J=C3=A9r=C3=B4me Glisse      2017-11-15  2163  	 */
ac46d4f3c43241 J=C3=A9r=C3=B4me Glisse      2018-12-28  2164  	mmu_notifier=
_invalidate_range_only_end(&range);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2165  }
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2166  =


:::::: The code at line 2145 was first introduced by commit
:::::: 33f4751e99601b7bfd1d66aedabd3ee9140922de mm: thp: move pmd check ins=
ide ptl for freeze_page()

:::::: TO: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8007629846447835374==--

