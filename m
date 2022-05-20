Content-Type: multipart/mixed; boundary="===============2724808357317988823=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 4/6] mm: Add COW PTE fallback function
Date: Fri, 20 May 2022 18:16:00 +0800
Message-ID: <202205201842.2VF5TMYq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2724808357317988823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220519183127.3909598-5-shiyn.lin@gmail.com>
References: <20220519183127.3909598-5-shiyn.lin@gmail.com>
TO: "Chih-En Lin" <shiyn.lin@gmail.com>

Hi Chih-En,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/sched/core]
[also build test WARNING on soc/for-next linus/master v5.18-rc7 next-202205=
19]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chih-En-Lin/Introduc=
e-Copy-On-Write-to-Page-Table/20220520-023243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 734387e=
c2f9d77b00276042b1fa7c95f48ee879d
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20520/202205201842.2VF5TMYq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbb=
ec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e4e2e178c5a43b37925=
972bc0eab9976d41d35c7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chih-En-Lin/Introduce-Copy-On-Writ=
e-to-Page-Table/20220520-023243
        git checkout e4e2e178c5a43b37925972bc0eab9976d41d35c7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 47 warnings (46 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
   net/atm/mpoa_proc.c:152:3: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(ip_string, "%pI4", &in_entry->ctrl_info.in_dst_i=
p);
                   ^~~~~~~
   net/atm/mpoa_proc.c:152:3: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
                   sprintf(ip_string, "%pI4", &in_entry->ctrl_info.in_dst_i=
p);
                   ^~~~~~~
   net/atm/mpoa_proc.c:181:3: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(ip_string, "%pI4", &eg_entry->latest_ip_addr);
                   ^~~~~~~
   net/atm/mpoa_proc.c:181:3: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
                   sprintf(ip_string, "%pI4", &eg_entry->latest_ip_addr);
                   ^~~~~~~
   net/atm/mpoa_proc.c:251:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&qos, 0, sizeof(struct atm_qos));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/atm/mpoa_proc.c:251:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&qos, 0, sizeof(struct atm_qos));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/atm/mpoa_proc.c:253:6: warning: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buff, "del %hhu.%hhu.%hhu.%hhu",
               ^~~~~~
   net/atm/mpoa_proc.c:253:6: note: Call to function 'sscanf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sscanf_s' in case of C11
           if (sscanf(buff, "del %hhu.%hhu.%hhu.%hhu",
               ^~~~~~
   net/atm/mpoa_proc.c:259:6: warning: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buff, "add %hhu.%hhu.%hhu.%hhu tx=3D%d,%d rx=3Dtx",
               ^~~~~~
   net/atm/mpoa_proc.c:259:6: note: Call to function 'sscanf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sscanf_s' in case of C11
           if (sscanf(buff, "add %hhu.%hhu.%hhu.%hhu tx=3D%d,%d rx=3Dtx",
               ^~~~~~
   net/atm/mpoa_proc.c:263:13: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           } else if (sscanf(buff, "add %hhu.%hhu.%hhu.%hhu tx=3D%d,%d rx=
=3D%d,%d",
                      ^~~~~~
   net/atm/mpoa_proc.c:263:13: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
           } else if (sscanf(buff, "add %hhu.%hhu.%hhu.%hhu tx=3D%d,%d rx=
=3D%d,%d",
                      ^~~~~~
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   mm/memory.c:332:2: warning: Value stored to 'p4d' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           p4d =3D p4d_offset(pgd, start);
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:332:2: note: Value stored to 'p4d' is never read
           p4d =3D p4d_offset(pgd, start);
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:495:2: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memset(rss, 0, sizeof(int) * NR_MM_COUNTERS);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   mm/memory.c:495:2: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
           memset(rss, 0, sizeof(int) * NR_MM_COUNTERS);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> mm/memory.c:1013:2: warning: Value stored to 'orig_ptep' is never read [=
clang-analyzer-deadcode.DeadStores]
           orig_ptep =3D ptep;
           ^           ~~~~
   mm/memory.c:1013:2: note: Value stored to 'orig_ptep' is never read
           orig_ptep =3D ptep;
           ^           ~~~~
   mm/memory.c:2586:3: warning: 1st function call argument is an uninitiali=
zed value [clang-analyzer-core.CallAndMessage]
                   pte_unmap_unlock(mapped_pte, ptl);
                   ^
   include/linux/mm.h:2352:2: note: expanded from macro 'pte_unmap_unlock'
           spin_unlock(ptl);                               \
           ^
   mm/memory.c:2758:9: note: Calling '__apply_to_page_range'
           return __apply_to_page_range(mm, addr, size, fn, data, false);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2710:14: note: Assuming 'addr' is < 'end'
           if (WARN_ON(addr >=3D end))
                       ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   mm/memory.c:2710:6: note: Taking false branch
           if (WARN_ON(addr >=3D end))
               ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   mm/memory.c:2710:2: note: Taking false branch
           if (WARN_ON(addr >=3D end))
           ^
   mm/memory.c:2715:10: note: Assuming the condition is false
                   next =3D pgd_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:784:3: note: expanded from macro 'pgd_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2715:10: note: '?' condition is false
                   next =3D pgd_addr_end(addr, end);
                          ^
   include/linux/pgtable.h:784:2: note: expanded from macro 'pgd_addr_end'
           (__boundary - 1 < (end) - 1)? __boundary: (end);                \
           ^
   mm/memory.c:2716:22: note: Left side of '&&' is false
                   if (pgd_none(*pgd) && !create)
                                      ^
   mm/memory.c:2718:7: note: Taking false branch
                   if (WARN_ON_ONCE(pgd_leaf(*pgd)))
                       ^
   include/asm-generic/bug.h:111:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/memory.c:2718:3: note: Taking false branch
                   if (WARN_ON_ONCE(pgd_leaf(*pgd)))
                   ^
   mm/memory.c:2720:7: note: Left side of '&&' is true
                   if (!pgd_none(*pgd) && WARN_ON_ONCE(pgd_bad(*pgd))) {
                       ^
   mm/memory.c:2720:26: note: Taking false branch
                   if (!pgd_none(*pgd) && WARN_ON_ONCE(pgd_bad(*pgd))) {
                                          ^
   include/asm-generic/bug.h:111:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/memory.c:2720:3: note: Taking false branch
                   if (!pgd_none(*pgd) && WARN_ON_ONCE(pgd_bad(*pgd))) {
                   ^
   mm/memory.c:2725:9: note: Calling 'apply_to_p4d_range'
                   err =3D apply_to_p4d_range(mm, pgd, addr, next,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2673:6: note: 'create' is false
           if (create) {
               ^~~~~~
   mm/memory.c:2673:2: note: Taking false branch
           if (create) {
           ^
   mm/memory.c:2682:22: note: Left side of '&&' is false
                   if (p4d_none(*p4d) && !create)
                                      ^
   mm/memory.c:2684:7: note: Taking false branch
                   if (WARN_ON_ONCE(p4d_leaf(*p4d)))
                       ^
   include/asm-generic/bug.h:111:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/memory.c:2684:3: note: Taking false branch
                   if (WARN_ON_ONCE(p4d_leaf(*p4d)))
                   ^
   mm/memory.c:2686:7: note: Left side of '&&' is true
                   if (!p4d_none(*p4d) && WARN_ON_ONCE(p4d_bad(*p4d))) {
                       ^
   mm/memory.c:2686:26: note: Taking false branch
                   if (!p4d_none(*p4d) && WARN_ON_ONCE(p4d_bad(*p4d))) {
                                          ^
   include/asm-generic/bug.h:111:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/memory.c:2686:3: note: Taking false branch
                   if (!p4d_none(*p4d) && WARN_ON_ONCE(p4d_bad(*p4d))) {
                   ^
   mm/memory.c:2691:9: note: Calling 'apply_to_pud_range'
                   err =3D apply_to_pud_range(mm, p4d, addr, next,

vim +/orig_ptep +1013 mm/memory.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1002  =

e4e2e178c5a43b Chih-En Lin    2022-05-20  1003  static inline void cow_pte_=
rss(struct mm_struct *mm, struct vm_area_struct *vma,
e4e2e178c5a43b Chih-En Lin    2022-05-20  1004  	pmd_t *pmdp, unsigned long=
 addr, unsigned long end, bool inc_dec)
e4e2e178c5a43b Chih-En Lin    2022-05-20  1005  {
e4e2e178c5a43b Chih-En Lin    2022-05-20  1006  	int rss[NR_MM_COUNTERS];
e4e2e178c5a43b Chih-En Lin    2022-05-20  1007  	pte_t *orig_ptep, *ptep;
e4e2e178c5a43b Chih-En Lin    2022-05-20  1008  	struct page *page;
e4e2e178c5a43b Chih-En Lin    2022-05-20  1009  =

e4e2e178c5a43b Chih-En Lin    2022-05-20  1010  	init_rss_vec(rss);
e4e2e178c5a43b Chih-En Lin    2022-05-20  1011  =

e4e2e178c5a43b Chih-En Lin    2022-05-20  1012  	ptep =3D pte_offset_map(pm=
dp, addr);
e4e2e178c5a43b Chih-En Lin    2022-05-20 @1013  	orig_ptep =3D ptep;
e4e2e178c5a43b Chih-En Lin    2022-05-20  1014  	arch_enter_lazy_mmu_mode();
e4e2e178c5a43b Chih-En Lin    2022-05-20  1015  	do {
e4e2e178c5a43b Chih-En Lin    2022-05-20  1016  		if (pte_none(*ptep) || pt=
e_special(*ptep))
e4e2e178c5a43b Chih-En Lin    2022-05-20  1017  			continue;
e4e2e178c5a43b Chih-En Lin    2022-05-20  1018  =

e4e2e178c5a43b Chih-En Lin    2022-05-20  1019  		page =3D vm_normal_page(v=
ma, addr, *ptep);
e4e2e178c5a43b Chih-En Lin    2022-05-20  1020  		if (page) {
e4e2e178c5a43b Chih-En Lin    2022-05-20  1021  			if (inc_dec)
e4e2e178c5a43b Chih-En Lin    2022-05-20  1022  				rss[mm_counter(page)]++;
e4e2e178c5a43b Chih-En Lin    2022-05-20  1023  			else
e4e2e178c5a43b Chih-En Lin    2022-05-20  1024  				rss[mm_counter(page)]--;
e4e2e178c5a43b Chih-En Lin    2022-05-20  1025  		}
e4e2e178c5a43b Chih-En Lin    2022-05-20  1026  	} while (ptep++, addr +=3D=
 PAGE_SIZE, addr !=3D end);
e4e2e178c5a43b Chih-En Lin    2022-05-20  1027  	arch_leave_lazy_mmu_mode();
e4e2e178c5a43b Chih-En Lin    2022-05-20  1028  	add_mm_rss_vec(mm, rss);
e4e2e178c5a43b Chih-En Lin    2022-05-20  1029  }
e4e2e178c5a43b Chih-En Lin    2022-05-20  1030  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2724808357317988823==--

