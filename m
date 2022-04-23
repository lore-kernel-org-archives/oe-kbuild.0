Content-Type: multipart/mixed; boundary="===============6775725589876168492=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5080/5845] mm/sparse-vmemmap.c:740:17: warning: Value stored to 'next' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 23 Apr 2022 20:24:35 +0800
Message-ID: <202204232000.mYBvdXLb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6775725589876168492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Joao Martins <joao.m.martins@oracle.com>
CC: Muchun Song <songmuchun@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e7d6987e09a328d4a949701db40ef63fbb970670
commit: 7e0f4d6f220853c6b9272c90734f4e4dc30e0303 [5080/5845] mm/sparse-vmem=
map: improve memory savings for compound devmaps
:::::: branch date: 30 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20423/202204232000.mYBvdXLb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd873=
50a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D7e0f4d6f220853c6b9272c90734f4e4dc30e0303
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7e0f4d6f220853c6b9272c90734f4e4dc30e0303
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:2414:3: warning: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(fs_id_buf, "fsid=3D%s: ", sdp->sd_fsname);
                   ^~~~~~~
   fs/gfs2/glock.c:2414:3: note: Call to function 'sprintf' is insecure as =
it does not provide bounding of the memory buffer or security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(fs_id_buf, "fsid=3D%s: ", sdp->sd_fsname);
                   ^~~~~~~
   include/linux/jhash.h:127:5: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
                   b +=3D k[1];
                     ^
   fs/gfs2/glock.c:1747:10: note: Calling 'gfs2_glock_get'
           error =3D gfs2_glock_get(sdp, number, glops, CREATE, &gl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:1165:7: note: Calling 'find_insert_glock'
           gl =3D find_insert_glock(&name, NULL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:1109:26: note: Calling 'glock_waitqueue'
           wait_queue_head_t *wq =3D glock_waitqueue(name);
                                   ^~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:108:13: note: Calling 'jhash2'
           u32 hash =3D jhash2((u32 *)name, ht_parms.key_len / 4, 0);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jhash.h:125:2: note: Loop condition is true.  Entering loo=
p body
           while (length > 3) {
           ^
   include/linux/jhash.h:127:5: note: Assigned value is garbage or undefined
                   b +=3D k[1];
                     ^  ~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   mm/backing-dev.c:293:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(wb, 0, sizeof(*wb));
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
   mm/backing-dev.c:293:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(wb, 0, sizeof(*wb));
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
   mm/backing-dev.c:880:2: warning: Call to function 'vsnprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(bdi->dev_name, sizeof(bdi->dev_name), fmt, args);
           ^~~~~~~~~
   mm/backing-dev.c:880:2: note: Call to function 'vsnprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(bdi->dev_name, sizeof(bdi->dev_name), fmt, args);
           ^~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   mm/sparse-vmemmap.c:573:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, size);
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
   mm/sparse-vmemmap.c:573:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(p, 0, size);
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
>> mm/sparse-vmemmap.c:740:17: warning: Value stored to 'next' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
                   unsigned long next =3D addr, last =3D addr + size;
                                 ^~~~   ~~~~
   mm/sparse-vmemmap.c:740:17: note: Value stored to 'next' during its init=
ialization is never read
                   unsigned long next =3D addr, last =3D addr + size;
                                 ^~~~   ~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/clk/clk.c:1972:3: warning: Value stored to 'best_parent_rate' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
   drivers/clk/clk.c:1972:3: note: Value stored to 'best_parent_rate' is ne=
ver read
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
   drivers/clk/clk.c:2793:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&core->duty, &core->parent->duty, sizeof(core->du=
ty));
                   ^
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
   drivers/clk/clk.c:2793:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&core->duty, &core->parent->duty, sizeof(core->du=
ty));
                   ^
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
   drivers/clk/clk.c:2821:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&core->duty, duty, sizeof(*duty));
                   ^
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
   drivers/clk/clk.c:2821:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&core->duty, duty, sizeof(*duty));
                   ^
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
   drivers/clk/clk.c:2836:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&core->duty, &core->parent->duty, sizeof(core->du=
ty));
                   ^
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
   drivers/clk/clk.c:2836:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&core->duty, &core->parent->duty, sizeof(core->du=
ty));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~

vim +/next +740 mm/sparse-vmemmap.c

7e0f4d6f220853 Joao Martins 2022-04-21  715  =

7e0f4d6f220853 Joao Martins 2022-04-21  716  static int __meminit vmemmap_p=
opulate_compound_pages(unsigned long start_pfn,
7e0f4d6f220853 Joao Martins 2022-04-21  717  						     unsigned long start,
7e0f4d6f220853 Joao Martins 2022-04-21  718  						     unsigned long end, =
int node,
7e0f4d6f220853 Joao Martins 2022-04-21  719  						     struct dev_pagemap =
*pgmap)
7e0f4d6f220853 Joao Martins 2022-04-21  720  {
7e0f4d6f220853 Joao Martins 2022-04-21  721  	unsigned long size, addr;
7e0f4d6f220853 Joao Martins 2022-04-21  722  	pte_t *pte;
7e0f4d6f220853 Joao Martins 2022-04-21  723  	int rc;
7e0f4d6f220853 Joao Martins 2022-04-21  724  =

7e0f4d6f220853 Joao Martins 2022-04-21  725  	if (reuse_compound_section(st=
art_pfn, pgmap)) {
7e0f4d6f220853 Joao Martins 2022-04-21  726  		pte =3D compound_section_tai=
l_page(start);
7e0f4d6f220853 Joao Martins 2022-04-21  727  		if (!pte)
7e0f4d6f220853 Joao Martins 2022-04-21  728  			return -ENOMEM;
7e0f4d6f220853 Joao Martins 2022-04-21  729  =

7e0f4d6f220853 Joao Martins 2022-04-21  730  		/*
7e0f4d6f220853 Joao Martins 2022-04-21  731  		 * Reuse the page that was p=
opulated in the prior iteration
7e0f4d6f220853 Joao Martins 2022-04-21  732  		 * with just tail struct pag=
es.
7e0f4d6f220853 Joao Martins 2022-04-21  733  		 */
7e0f4d6f220853 Joao Martins 2022-04-21  734  		return vmemmap_populate_rang=
e(start, end, node, NULL,
7e0f4d6f220853 Joao Martins 2022-04-21  735  					      pte_page(*pte));
7e0f4d6f220853 Joao Martins 2022-04-21  736  	}
7e0f4d6f220853 Joao Martins 2022-04-21  737  =

7e0f4d6f220853 Joao Martins 2022-04-21  738  	size =3D min(end - start, pgm=
ap_vmemmap_nr(pgmap) * sizeof(struct page));
7e0f4d6f220853 Joao Martins 2022-04-21  739  	for (addr =3D start; addr < e=
nd; addr +=3D size) {
7e0f4d6f220853 Joao Martins 2022-04-21 @740  		unsigned long next =3D addr,=
 last =3D addr + size;
7e0f4d6f220853 Joao Martins 2022-04-21  741  =

7e0f4d6f220853 Joao Martins 2022-04-21  742  		/* Populate the head page vm=
emmap page */
7e0f4d6f220853 Joao Martins 2022-04-21  743  		pte =3D vmemmap_populate_add=
ress(addr, node, NULL, NULL);
7e0f4d6f220853 Joao Martins 2022-04-21  744  		if (!pte)
7e0f4d6f220853 Joao Martins 2022-04-21  745  			return -ENOMEM;
7e0f4d6f220853 Joao Martins 2022-04-21  746  =

7e0f4d6f220853 Joao Martins 2022-04-21  747  		/* Populate the tail pages v=
memmap page */
7e0f4d6f220853 Joao Martins 2022-04-21  748  		next =3D addr + PAGE_SIZE;
7e0f4d6f220853 Joao Martins 2022-04-21  749  		pte =3D vmemmap_populate_add=
ress(next, node, NULL, NULL);
7e0f4d6f220853 Joao Martins 2022-04-21  750  		if (!pte)
7e0f4d6f220853 Joao Martins 2022-04-21  751  			return -ENOMEM;
7e0f4d6f220853 Joao Martins 2022-04-21  752  =

7e0f4d6f220853 Joao Martins 2022-04-21  753  		/*
7e0f4d6f220853 Joao Martins 2022-04-21  754  		 * Reuse the previous page f=
or the rest of tail pages
7e0f4d6f220853 Joao Martins 2022-04-21  755  		 * See layout diagram in Doc=
umentation/vm/vmemmap_dedup.rst
7e0f4d6f220853 Joao Martins 2022-04-21  756  		 */
7e0f4d6f220853 Joao Martins 2022-04-21  757  		next +=3D PAGE_SIZE;
7e0f4d6f220853 Joao Martins 2022-04-21  758  		rc =3D vmemmap_populate_rang=
e(next, last, node, NULL,
7e0f4d6f220853 Joao Martins 2022-04-21  759  					    pte_page(*pte));
7e0f4d6f220853 Joao Martins 2022-04-21  760  		if (rc)
7e0f4d6f220853 Joao Martins 2022-04-21  761  			return -ENOMEM;
7e0f4d6f220853 Joao Martins 2022-04-21  762  	}
7e0f4d6f220853 Joao Martins 2022-04-21  763  =

7e0f4d6f220853 Joao Martins 2022-04-21  764  	return 0;
73e8e90545569b Joao Martins 2022-04-21  765  }
73e8e90545569b Joao Martins 2022-04-21  766  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6775725589876168492==--

