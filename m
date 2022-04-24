Content-Type: multipart/mixed; boundary="===============8144319126873245643=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sj:damon/next 37/43] include/linux/damon.h:454:9: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 24 Apr 2022 21:19:21 +0800
Message-ID: <202204242116.1oPTc3QQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8144319126873245643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/=
next
head:   d1c689a09becfabde8f6822e9b2992a88c4f5cbb
commit: de6c7dc77241d471a97f5ad838cdbc04100747de [37/43] mm/damon/vaddr: mo=
ve 'damon_adjust_region_ranges()' to core
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220424 (https://download.01.org/0day-ci/archi=
ve/20220424/202204242116.1oPTc3QQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/comm=
it/?id=3Dde6c7dc77241d471a97f5ad838cdbc04100747de
        git remote add sj https://git.kernel.org/pub/scm/linux/kernel/git/s=
j/linux.git
        git fetch --no-tags sj damon/next
        git checkout de6c7dc77241d471a97f5ad838cdbc04100747de
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   crypto/drbg.c:2081:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(alg->base.cra_name, "stdrng", 6);
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
   crypto/drbg.c:2083:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(alg->base.cra_driver_name, "drbg_pr_", 8);
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
   crypto/drbg.c:2083:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(alg->base.cra_driver_name, "drbg_pr_", 8);
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
   crypto/drbg.c:2086:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(alg->base.cra_driver_name, "drbg_nopr_", 10);
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
   crypto/drbg.c:2086:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(alg->base.cra_driver_name, "drbg_nopr_", 10);
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
   crypto/drbg.c:2089:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(alg->base.cra_driver_name + pos, core->cra_name,
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
   crypto/drbg.c:2089:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(alg->base.cra_driver_name + pos, core->cra_name,
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
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
>> include/linux/damon.h:454:9: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           return container_of(r->list.prev, struct damon_region, list);
                  ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   mm/damon/core.c:198:2: note: Loop condition is true.  Entering loop body
           damon_for_each_region_safe(r, next, t) {
           ^
   include/linux/damon.h:466:2: note: expanded from macro 'damon_for_each_r=
egion_safe'
           list_for_each_entry_safe(r, next, &t->regions_list, list)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   mm/damon/core.c:199:15: note: Assuming 'i' is < 'nr_ranges'
                   for (i =3D 0; i < nr_ranges; i++) {
                               ^~~~~~~~~~~~~
   mm/damon/core.c:199:3: note: Loop condition is true.  Entering loop body
                   for (i =3D 0; i < nr_ranges; i++) {
                   ^
   mm/damon/core.c:200:4: note: Taking false branch
                           if (damon_intersect(r, &ranges[i]))
                           ^
   mm/damon/core.c:199:15: note: Assuming 'i' is >=3D 'nr_ranges'
                   for (i =3D 0; i < nr_ranges; i++) {
                               ^~~~~~~~~~~~~
   mm/damon/core.c:199:3: note: Loop condition is false. Execution continue=
s on line 203
                   for (i =3D 0; i < nr_ranges; i++) {
                   ^
   mm/damon/core.c:203:7: note: 'i' is equal to 'nr_ranges'
                   if (i =3D=3D nr_ranges)
                       ^
   mm/damon/core.c:203:3: note: Taking true branch
                   if (i =3D=3D nr_ranges)
                   ^
   mm/damon/core.c:204:4: note: Calling 'damon_destroy_region'
                           damon_destroy_region(r, t);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:167:2: note: Calling 'damon_free_region'
           damon_free_region(r);
           ^~~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:161:2: note: Memory is released
           kfree(r);
           ^~~~~~~~
   mm/damon/core.c:167:2: note: Returning; memory was released
           damon_free_region(r);
           ^~~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:204:4: note: Returning; memory was released
                           damon_destroy_region(r, t);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:198:2: note: Loop condition is false. Execution continue=
s on line 208
           damon_for_each_region_safe(r, next, t) {
           ^
   include/linux/damon.h:466:2: note: expanded from macro 'damon_for_each_r=
egion_safe'
           list_for_each_entry_safe(r, next, &t->regions_list, list)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   mm/damon/core.c:208:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < nr_ranges; i++) {
           ^
   mm/damon/core.c:214:3: note: Loop condition is false. Execution continue=
s on line 223
                   damon_for_each_region(r, t) {
                   ^
   include/linux/damon.h:463:2: note: expanded from macro 'damon_for_each_r=
egion'
           list_for_each_entry(r, &t->regions_list, list)
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   mm/damon/core.c:223:8: note: 'first' is null
                   if (!first) {
                        ^~~~~
   mm/damon/core.c:223:3: note: Taking true branch
                   if (!first) {
                   ^
   mm/damon/core.c:229:8: note: Assuming 'newr' is non-null
                           if (!newr)
                               ^~~~~
   mm/damon/core.c:229:4: note: Taking false branch
                           if (!newr)
                           ^
   mm/damon/core.c:231:30: note: Calling 'damon_prev_region'
                           damon_insert_region(newr, damon_prev_region(r), =
r, t);
                                                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/damon.h:454:9: note: Use of memory after it is freed
           return container_of(r->list.prev, struct damon_region, list);
                  ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   mm/damon/core.c:178:11: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
           return !(r->ar.end <=3D re->start || re->end <=3D r->ar.start);
                    ^
   mm/damon/core.c:198:2: note: Loop condition is true.  Entering loop body
           damon_for_each_region_safe(r, next, t) {
           ^
   include/linux/damon.h:466:2: note: expanded from macro 'damon_for_each_r=
egion_safe'
           list_for_each_entry_safe(r, next, &t->regions_list, list)

vim +454 include/linux/damon.h

f23b8eee1871a6 SeongJae Park 2021-09-07  451  =

88f86dcfa45478 SeongJae Park 2022-01-14  452  static inline struct damon_re=
gion *damon_prev_region(struct damon_region *r)
88f86dcfa45478 SeongJae Park 2022-01-14  453  {
88f86dcfa45478 SeongJae Park 2022-01-14 @454  	return container_of(r->list.=
prev, struct damon_region, list);
88f86dcfa45478 SeongJae Park 2022-01-14  455  }
f23b8eee1871a6 SeongJae Park 2021-09-07  456  =


:::::: The code at line 454 was first introduced by commit
:::::: 88f86dcfa454784f7de550966c60fc78a3e95d6d mm/damon: convert macro fun=
ctions to static inline functions

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8144319126873245643==--

