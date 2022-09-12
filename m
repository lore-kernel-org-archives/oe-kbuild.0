Content-Type: multipart/mixed; boundary="===============4408715590504309368=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC][PATCH] iov_iter: Add extraction functions
Date: Mon, 12 Sep 2022 22:57:35 +0800
Message-ID: <202209122252.P24P57ob-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4408715590504309368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: lib/iov_i=
ter_extract.c:348:7: warning: The left expression of the compound assignmen=
t is an uninitialized value. The computed value will also be garbage [clang=
-analyzer-core.uninitialized.Assign]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <3750754.1662765490@warthog.procyon.org.uk>
References: <3750754.1662765490@warthog.procyon.org.uk>
TO: David Howells <dhowells@redhat.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc5 next-20220912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/iov_it=
er-Add-extraction-functions/20220910-072102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
ce888220d5c7a805e0e155302a318d5d23e62950
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-c005-20220911
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df=
49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a8df8a897880379087a=
0a9fc4f6fc1391e352217
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Howells/iov_iter-Add-extract=
ion-functions/20220910-072102
        git checkout a8df8a897880379087a0a9fc4f6fc1391e352217
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/mtd/lpddr/lpddr_cmds.c:758:9: note: Calling 'do_xxlock'
           return do_xxlock(mtd, ofs, len, DO_XXLOCK_UNLOCK);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:725:8: note: Calling 'get_chip'
           ret =3D get_chip(map, chip, FL_LOCKING);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/lpddr/lpddr_cmds.c:201:26: note: Dereference of null pointer
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   drivers/mtd/lpddr/lpddr_cmds.c:298:26: warning: Dereference of null poin=
ter [clang-analyzer-core.NullDereference]
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   drivers/mtd/lpddr/lpddr_cmds.c:298:26: note: Dereference of null pointer
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   include/linux/uaccess.h:179:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           current->pagefault_disabled++;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   lib/iov_iter.c:807:16: note: Calling 'kmap_atomic'
           char *kaddr =3D kmap_atomic(page), *p =3D kaddr + offset;
                         ^~~~~~~~~~~~~~~~~
   include/linux/highmem-internal.h:209:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PREEMPT_RT))
           ^
   include/linux/highmem-internal.h:212:3: note: Loop condition is false.  =
Exiting loop
                   preempt_disable();
                   ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   include/linux/highmem-internal.h:213:2: note: Calling 'pagefault_disable'
           pagefault_disable();
           ^~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:196:2: note: Calling 'pagefault_disabled_inc'
           pagefault_disabled_inc();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:179:2: note: Dereference of null pointer
           current->pagefault_disabled++;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
>> lib/iov_iter_extract.c:348:7: warning: The left expression of the compou=
nd assignment is an uninitialized value. The computed value will also be ga=
rbage [clang-analyzer-core.uninitialized.Assign]
                   ret +=3D len;
                       ^
   lib/iov_iter_extract.c:485:2: note: Control jumps to 'case ITER_XARRAY:'=
  at line 496
           switch (iov_iter_type(iter)) {
           ^
   lib/iov_iter_extract.c:498:3: note:  Execution continues on line 501
                   break;
                   ^
   lib/iov_iter_extract.c:504:6: note: Assuming 'sg' is non-null
           if (!sg)
               ^~~
   lib/iov_iter_extract.c:504:2: note: Taking false branch
           if (!sg)
           ^
   lib/iov_iter_extract.c:511:8: note: Calling 'iov_iter_extract_pages'
           ret =3D iov_iter_extract_pages(iter, sgtable, sg_max, len,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/iov_iter_extract.c:368:6: note: Assuming the condition is true
           if (likely(user_backed_iter(iter)))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   lib/iov_iter_extract.c:368:2: note: Taking false branch
           if (likely(user_backed_iter(iter)))
           ^
   lib/iov_iter_extract.c:371:2: note: Taking false branch
           if (iov_iter_is_bvec(iter))
           ^
   lib/iov_iter_extract.c:374:2: note: Taking false branch
           if (iov_iter_is_kvec(iter))
           ^
   lib/iov_iter_extract.c:377:2: note: Taking true branch
           if (iov_iter_is_xarray(iter))
           ^
   lib/iov_iter_extract.c:378:10: note: Calling 'iov_iter_extract_xarray'
                   return iov_iter_extract_xarray(iter, array, array_max, m=
axsize,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/iov_iter_extract.c:329:2: note: 'ret' declared without an initial va=
lue
           ssize_t ret;
           ^~~~~~~~~~~
   lib/iov_iter_extract.c:334:2: note: Loop condition is true.  Entering lo=
op body
           xas_for_each(&xas, folio, ULONG_MAX) {
           ^
   include/linux/xarray.h:1770:2: note: expanded from macro 'xas_for_each'
           for (entry =3D xas_find(xas, max); entry; \
           ^
   lib/iov_iter_extract.c:335:3: note: Taking true branch
                   if (xas_retry(&xas, folio))
                   ^
   lib/iov_iter_extract.c:336:4: note:  Execution continues on line 334
                           continue;
                           ^
   lib/iov_iter_extract.c:334:2: note: Loop condition is true.  Entering lo=
op body
           xas_for_each(&xas, folio, ULONG_MAX) {
           ^
   include/linux/xarray.h:1770:2: note: expanded from macro 'xas_for_each'
           for (entry =3D xas_find(xas, max); entry; \
           ^
   lib/iov_iter_extract.c:335:3: note: Taking false branch
                   if (xas_retry(&xas, folio))
                   ^
   lib/iov_iter_extract.c:337:7: note: Taking false branch
                   if (WARN_ON(xa_is_value(folio)))
                       ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   lib/iov_iter_extract.c:337:7: note: Assuming '__ret_warn_on' is 0
                   if (WARN_ON(xa_is_value(folio)))
                       ^
   arch/s390/include/asm/bug.h:59:7: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   lib/iov_iter_extract.c:337:7: note: Taking false branch
                   if (WARN_ON(xa_is_value(folio)))
                       ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   lib/iov_iter_extract.c:337:3: note: Taking false branch
                   if (WARN_ON(xa_is_value(folio)))
                   ^
   lib/iov_iter_extract.c:339:7: note: Taking false branch
                   if (WARN_ON(folio_test_hugetlb(folio)))
                       ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   lib/iov_iter_extract.c:339:7: note: Taking false branch
                   if (WARN_ON(folio_test_hugetlb(folio)))
                       ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   lib/iov_iter_extract.c:339:3: note: Taking false branch
                   if (WARN_ON(folio_test_hugetlb(folio)))
                   ^
   lib/iov_iter_extract.c:343:9: note: Assuming '__UNIQUE_ID___x503' is >=
=3D '__UNIQUE_ID___y504'
                   len =3D min_t(size_t, maxsize, folio_size(folio) - offse=
t);
                         ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   lib/iov_iter_extract.c:343:9: note: '?' condition is false
                   len =3D min_t(size_t, maxsize, folio_size(folio) - offse=
t);
                         ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   lib/iov_iter_extract.c:348:7: note: The left expression of the compound =
assignment is an uninitialized value. The computed value will also be garba=
ge
                   ret +=3D len;
                   ~~~ ^
>> lib/iov_iter_extract.c:360:2: warning: Undefined or garbage value return=
ed to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   lib/iov_iter_extract.c:485:2: note: Control jumps to 'case ITER_XARRAY:'=
  at line 496
           switch (iov_iter_type(iter)) {
           ^
   lib/iov_iter_extract.c:498:3: note:  Execution continues on line 501
                   break;
                   ^
   lib/iov_iter_extract.c:504:6: note: Assuming 'sg' is non-null
           if (!sg)
               ^~~
   lib/iov_iter_extract.c:504:2: note: Taking false branch
           if (!sg)
           ^
   lib/iov_iter_extract.c:511:8: note: Calling 'iov_iter_extract_pages'
           ret =3D iov_iter_extract_pages(iter, sgtable, sg_max, len,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/iov_iter_extract.c:368:6: note: Assuming the condition is true
           if (likely(user_backed_iter(iter)))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   lib/iov_iter_extract.c:368:2: note: Taking false branch
           if (likely(user_backed_iter(iter)))
           ^
   lib/iov_iter_extract.c:371:2: note: Taking false branch
           if (iov_iter_is_bvec(iter))
           ^
   lib/iov_iter_extract.c:374:2: note: Taking false branch
           if (iov_iter_is_kvec(iter))
           ^
   lib/iov_iter_extract.c:377:2: note: Taking true branch
           if (iov_iter_is_xarray(iter))
           ^
   lib/iov_iter_extract.c:378:10: note: Calling 'iov_iter_extract_xarray'
                   return iov_iter_extract_xarray(iter, array, array_max, m=
axsize,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/iov_iter_extract.c:329:2: note: 'ret' declared without an initial va=
lue
           ssize_t ret;
           ^~~~~~~~~~~
   lib/iov_iter_extract.c:334:2: note: Loop condition is false. Execution c=
ontinues on line 358
           xas_for_each(&xas, folio, ULONG_MAX) {
           ^
   include/linux/xarray.h:1770:2: note: expanded from macro 'xas_for_each'
           for (entry =3D xas_find(xas, max); entry; \
           ^
   lib/iov_iter_extract.c:360:2: note: Undefined or garbage value returned =
to caller
           return ret;
           ^      ~~~
   Suppressed 29 warnings (16 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   arch/s390/include/asm/pgtable.h:1645:7: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           if (!MACHINE_HAS_NX)
                ^
   arch/s390/include/asm/setup.h:94:26: note: expanded from macro 'MACHINE_=
HAS_NX'
   #define MACHINE_HAS_NX          (S390_lowcore.machine_flags & MACHINE_FL=
AG_NX)
                                    ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/rmap.c:1083:2: note: Taking false branch
           if (invalid_mkclean_vma(vma, NULL))
           ^
   mm/rmap.c:1087:16: note: Assuming the condition is false
           VM_BUG_ON_VMA(pvmw.address =3D=3D -EFAULT, vma);
                         ^
   include/linux/mmdebug.h:34:16: note: expanded from macro 'VM_BUG_ON_VMA'
                   if (unlikely(cond)) {                                   \
                       ~~~~~~~~~^~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/rmap.c:1087:2: note: Taking false branch
           VM_BUG_ON_VMA(pvmw.address =3D=3D -EFAULT, vma);
           ^
   include/linux/mmdebug.h:34:3: note: expanded from macro 'VM_BUG_ON_VMA'
                   if (unlikely(cond)) {                                   \
                   ^
   mm/rmap.c:1087:2: note: Loop condition is false.  Exiting loop
           VM_BUG_ON_VMA(pvmw.address =3D=3D -EFAULT, vma);
           ^
   include/linux/mmdebug.h:33:2: note: expanded from macro 'VM_BUG_ON_VMA'
           do {                                                            \
           ^
   mm/rmap.c:1089:9: note: Calling 'page_vma_mkclean_one'
           return page_vma_mkclean_one(&pvmw);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/rmap.c:962:2: note: Loop condition is true.  Entering loop body
           while (page_vma_mapped_walk(pvmw)) {
           ^
   mm/rmap.c:966:7: note: Assuming field 'pte' is null
                   if (pvmw->pte) {

vim +348 lib/iov_iter_extract.c

a8df8a89788037 David Howells 2022-09-10  314  =

a8df8a89788037 David Howells 2022-09-10  315  /*
a8df8a89788037 David Howells 2022-09-10  316   * Extract the pages from an =
XARRAY-class iterator and add them to the
a8df8a89788037 David Howells 2022-09-10  317   * destination buffer.  The p=
ages are not pinned.
a8df8a89788037 David Howells 2022-09-10  318   */
a8df8a89788037 David Howells 2022-09-10  319  static ssize_t iov_iter_extra=
ct_xarray(struct iov_iter *iter,
a8df8a89788037 David Howells 2022-09-10  320  				       void *array, unsig=
ned int array_max,
a8df8a89788037 David Howells 2022-09-10  321  				       ssize_t maxsize,
a8df8a89788037 David Howells 2022-09-10  322  				       enum iter_extract_=
dest dest)
a8df8a89788037 David Howells 2022-09-10  323  {
a8df8a89788037 David Howells 2022-09-10  324  	struct xarray *xa =3D iter->=
xarray;
a8df8a89788037 David Howells 2022-09-10  325  	struct folio *folio;
a8df8a89788037 David Howells 2022-09-10  326  	unsigned int ix;
a8df8a89788037 David Howells 2022-09-10  327  	loff_t start =3D iter->xarra=
y_start + iter->iov_offset;
a8df8a89788037 David Howells 2022-09-10  328  	pgoff_t index =3D start / PA=
GE_SIZE;
a8df8a89788037 David Howells 2022-09-10  329  	ssize_t ret;
a8df8a89788037 David Howells 2022-09-10  330  	size_t offset, len;
a8df8a89788037 David Howells 2022-09-10  331  	XA_STATE(xas, xa, index);
a8df8a89788037 David Howells 2022-09-10  332  =

a8df8a89788037 David Howells 2022-09-10  333  	rcu_read_lock();
a8df8a89788037 David Howells 2022-09-10  334  	xas_for_each(&xas, folio, UL=
ONG_MAX) {
a8df8a89788037 David Howells 2022-09-10  335  		if (xas_retry(&xas, folio))
a8df8a89788037 David Howells 2022-09-10  336  			continue;
a8df8a89788037 David Howells 2022-09-10  337  		if (WARN_ON(xa_is_value(fol=
io)))
a8df8a89788037 David Howells 2022-09-10  338  			break;
a8df8a89788037 David Howells 2022-09-10  339  		if (WARN_ON(folio_test_huge=
tlb(folio)))
a8df8a89788037 David Howells 2022-09-10  340  			break;
a8df8a89788037 David Howells 2022-09-10  341  =

a8df8a89788037 David Howells 2022-09-10  342  		offset =3D offset_in_folio(=
folio, start);
a8df8a89788037 David Howells 2022-09-10  343  		len =3D min_t(size_t, maxsi=
ze, folio_size(folio) - offset);
a8df8a89788037 David Howells 2022-09-10  344  =

a8df8a89788037 David Howells 2022-09-10  345  		ix =3D extract_contig_pages=
(array, folio_page(folio, 0),
a8df8a89788037 David Howells 2022-09-10  346  					  offset, len, dest);
a8df8a89788037 David Howells 2022-09-10  347  		maxsize -=3D len;
a8df8a89788037 David Howells 2022-09-10 @348  		ret +=3D len;
a8df8a89788037 David Howells 2022-09-10  349  		if (ix >=3D array_max) {
a8df8a89788037 David Howells 2022-09-10  350  			WARN_ON_ONCE(ix > array_ma=
x);
a8df8a89788037 David Howells 2022-09-10  351  			break;
a8df8a89788037 David Howells 2022-09-10  352  		}
a8df8a89788037 David Howells 2022-09-10  353  =

a8df8a89788037 David Howells 2022-09-10  354  		if (maxsize <=3D 0)
a8df8a89788037 David Howells 2022-09-10  355  			break;
a8df8a89788037 David Howells 2022-09-10  356  	}
a8df8a89788037 David Howells 2022-09-10  357  =

a8df8a89788037 David Howells 2022-09-10  358  	rcu_read_unlock();
a8df8a89788037 David Howells 2022-09-10  359  	terminate_array(array, dest);
a8df8a89788037 David Howells 2022-09-10 @360  	return ret;
a8df8a89788037 David Howells 2022-09-10  361  }
a8df8a89788037 David Howells 2022-09-10  362  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp

--===============4408715590504309368==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.ksh"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3Mz
OTAgNi4wLjAtcmM0IEtlcm5lbCBDb25maWd1cmF0aW9uCiMKQ09ORklHX0NDX1ZFUlNJT05fVEVY
VD0iY2xhbmcgdmVyc2lvbiAxNi4wLjAgKGdpdDovL2dpdG1pcnJvci9sbHZtX3Byb2plY3QgMTU0
NmRmNDlmNWE2ZDA5ZGY3OGY1NjllNDEzN2RkYjM2NWEzZTgyNykiCkNPTkZJR19HQ0NfVkVSU0lP
Tj0wCkNPTkZJR19DQ19JU19DTEFORz15CkNPTkZJR19DTEFOR19WRVJTSU9OPTE2MDAwMApDT05G
SUdfQVNfSVNfTExWTT15CkNPTkZJR19BU19WRVJTSU9OPTE2MDAwMApDT05GSUdfTERfSVNfQkZE
PXkKQ09ORklHX0xEX1ZFUlNJT049MjM4MDAKQ09ORklHX0xMRF9WRVJTSU9OPTAKQ09ORklHX0ND
X0hBU19BU01fR09UT19PVVRQVVQ9eQpDT05GSUdfQ0NfSEFTX0FTTV9JTkxJTkU9eQpDT05GSUdf
Q0NfSEFTX05PX1BST0ZJTEVfRk5fQVRUUj15CkNPTkZJR19QQUhPTEVfVkVSU0lPTj0xMjMKQ09O
RklHX0lSUV9XT1JLPXkKQ09ORklHX0JVSUxEVElNRV9UQUJMRV9TT1JUPXkKQ09ORklHX1RIUkVB
RF9JTkZPX0lOX1RBU0s9eQoKIwojIEdlbmVyYWwgc2V0dXAKIwpDT05GSUdfSU5JVF9FTlZfQVJH
X0xJTUlUPTMyCiMgQ09ORklHX1dFUlJPUiBpcyBub3Qgc2V0CkNPTkZJR19MT0NBTFZFUlNJT049
IiIKQ09ORklHX0xPQ0FMVkVSU0lPTl9BVVRPPXkKQ09ORklHX0JVSUxEX1NBTFQ9IiIKQ09ORklH
X0hBVkVfS0VSTkVMX0daSVA9eQpDT05GSUdfSEFWRV9LRVJORUxfQlpJUDI9eQpDT05GSUdfSEFW
RV9LRVJORUxfTFpNQT15CkNPTkZJR19IQVZFX0tFUk5FTF9YWj15CkNPTkZJR19IQVZFX0tFUk5F
TF9MWk89eQpDT05GSUdfSEFWRV9LRVJORUxfTFo0PXkKQ09ORklHX0hBVkVfS0VSTkVMX1pTVEQ9
eQpDT05GSUdfSEFWRV9LRVJORUxfVU5DT01QUkVTU0VEPXkKQ09ORklHX0tFUk5FTF9HWklQPXkK
IyBDT05GSUdfS0VSTkVMX0JaSVAyIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX0xaTUEgaXMg
bm90IHNldAojIENPTkZJR19LRVJORUxfWFogaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfTFpP
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX0xaNCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFUk5F
TF9aU1REIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX1VOQ09NUFJFU1NFRCBpcyBub3Qgc2V0
CkNPTkZJR19ERUZBVUxUX0lOSVQ9IiIKQ09ORklHX0RFRkFVTFRfSE9TVE5BTUU9Iihub25lKSIK
Q09ORklHX1NZU1ZJUEM9eQpDT05GSUdfV0FUQ0hfUVVFVUU9eQpDT05GSUdfQ1JPU1NfTUVNT1JZ
X0FUVEFDSD15CiMgQ09ORklHX1VTRUxJQiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfQVVE
SVRTWVNDQUxMPXkKCiMKIyBJUlEgc3Vic3lzdGVtCiMKQ09ORklHX0dFTkVSSUNfSVJRX0lOSkVD
VElPTj15CkNPTkZJR19HRU5FUklDX0lSUV9DSElQPXkKQ09ORklHX0lSUV9ET01BSU49eQpDT05G
SUdfU1BBUlNFX0lSUT15CkNPTkZJR19HRU5FUklDX0lSUV9ERUJVR0ZTPXkKIyBlbmQgb2YgSVJR
IHN1YnN5c3RlbQoKQ09ORklHX0dFTkVSSUNfVElNRV9WU1lTQ0FMTD15CkNPTkZJR19HRU5FUklD
X0NMT0NLRVZFTlRTPXkKQ09ORklHX0NPTlRFWFRfVFJBQ0tJTkc9eQpDT05GSUdfQ09OVEVYVF9U
UkFDS0lOR19JRExFPXkKCiMKIyBUaW1lcnMgc3Vic3lzdGVtCiMKQ09ORklHX1RJQ0tfT05FU0hP
VD15CkNPTkZJR19OT19IWl9DT01NT049eQojIENPTkZJR19IWl9QRVJJT0RJQyBpcyBub3Qgc2V0
CkNPTkZJR19OT19IWl9JRExFPXkKIyBDT05GSUdfTk9fSFogaXMgbm90IHNldAojIENPTkZJR19I
SUdIX1JFU19USU1FUlMgaXMgbm90IHNldAojIGVuZCBvZiBUaW1lcnMgc3Vic3lzdGVtCgpDT05G
SUdfSEFWRV9FQlBGX0pJVD15CkNPTkZJR19BUkNIX1dBTlRfREVGQVVMVF9CUEZfSklUPXkKCiMK
IyBCUEYgc3Vic3lzdGVtCiMKIyBDT05GSUdfQlBGX1NZU0NBTEwgaXMgbm90IHNldAojIGVuZCBv
ZiBCUEYgc3Vic3lzdGVtCgpDT05GSUdfUFJFRU1QVF9WT0xVTlRBUllfQlVJTEQ9eQojIENPTkZJ
R19QUkVFTVBUX05PTkUgaXMgbm90IHNldApDT05GSUdfUFJFRU1QVF9WT0xVTlRBUlk9eQojIENP
TkZJR19QUkVFTVBUIGlzIG5vdCBzZXQKQ09ORklHX1BSRUVNUFRfQ09VTlQ9eQoKIwojIENQVS9U
YXNrIHRpbWUgYW5kIHN0YXRzIGFjY291bnRpbmcKIwpDT05GSUdfVklSVF9DUFVfQUNDT1VOVElO
Rz15CkNPTkZJR19WSVJUX0NQVV9BQ0NPVU5USU5HX05BVElWRT15CiMgQ09ORklHX0JTRF9QUk9D
RVNTX0FDQ1QgaXMgbm90IHNldApDT05GSUdfUFNJPXkKQ09ORklHX1BTSV9ERUZBVUxUX0RJU0FC
TEVEPXkKIyBlbmQgb2YgQ1BVL1Rhc2sgdGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwoKIyBDT05G
SUdfQ1BVX0lTT0xBVElPTiBpcyBub3Qgc2V0CgojCiMgUkNVIFN1YnN5c3RlbQojCkNPTkZJR19U
UkVFX1JDVT15CkNPTkZJR19SQ1VfRVhQRVJUPXkKQ09ORklHX1NSQ1U9eQpDT05GSUdfVFJFRV9T
UkNVPXkKQ09ORklHX1RBU0tTX1JDVV9HRU5FUklDPXkKIyBDT05GSUdfRk9SQ0VfVEFTS1NfUkNV
IGlzIG5vdCBzZXQKQ09ORklHX0ZPUkNFX1RBU0tTX1JVREVfUkNVPXkKQ09ORklHX1RBU0tTX1JV
REVfUkNVPXkKQ09ORklHX0ZPUkNFX1RBU0tTX1RSQUNFX1JDVT15CkNPTkZJR19UQVNLU19UUkFD
RV9SQ1U9eQpDT05GSUdfUkNVX1NUQUxMX0NPTU1PTj15CkNPTkZJR19SQ1VfTkVFRF9TRUdDQkxJ
U1Q9eQpDT05GSUdfUkNVX0ZBTk9VVD02NApDT05GSUdfUkNVX0ZBTk9VVF9MRUFGPTE2CkNPTkZJ
R19SQ1VfTk9DQl9DUFU9eQpDT05GSUdfUkNVX05PQ0JfQ1BVX0RFRkFVTFRfQUxMPXkKQ09ORklH
X1RBU0tTX1RSQUNFX1JDVV9SRUFEX01CPXkKIyBlbmQgb2YgUkNVIFN1YnN5c3RlbQoKQ09ORklH
X0lLQ09ORklHPW0KIyBDT05GSUdfSUtDT05GSUdfUFJPQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lL
SEVBREVSUyBpcyBub3Qgc2V0CkNPTkZJR19MT0dfQlVGX1NISUZUPTE3CkNPTkZJR19MT0dfQ1BV
X01BWF9CVUZfU0hJRlQ9MTIKQ09ORklHX1BSSU5US19TQUZFX0xPR19CVUZfU0hJRlQ9MTMKQ09O
RklHX1BSSU5US19JTkRFWD15CgojCiMgU2NoZWR1bGVyIGZlYXR1cmVzCiMKIyBlbmQgb2YgU2No
ZWR1bGVyIGZlYXR1cmVzCgpDT05GSUdfQVJDSF9TVVBQT1JUU19OVU1BX0JBTEFOQ0lORz15CkNP
TkZJR19DQ19IQVNfSU5UMTI4PXkKQ09ORklHX0NDX0lNUExJQ0lUX0ZBTExUSFJPVUdIPSItV2lt
cGxpY2l0LWZhbGx0aHJvdWdoIgpDT05GSUdfR0NDMTJfTk9fQVJSQVlfQk9VTkRTPXkKQ09ORklH
X0NHUk9VUFM9eQpDT05GSUdfUEFHRV9DT1VOVEVSPXkKIyBDT05GSUdfQ0dST1VQX0ZBVk9SX0RZ
Tk1PRFMgaXMgbm90IHNldApDT05GSUdfTUVNQ0c9eQpDT05GSUdfTUVNQ0dfS01FTT15CkNPTkZJ
R19DR1JPVVBfU0NIRUQ9eQpDT05GSUdfRkFJUl9HUk9VUF9TQ0hFRD15CkNPTkZJR19DRlNfQkFO
RFdJRFRIPXkKIyBDT05GSUdfUlRfR1JPVVBfU0NIRUQgaXMgbm90IHNldAojIENPTkZJR19DR1JP
VVBfUElEUyBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBfUkRNQT15CiMgQ09ORklHX0NHUk9VUF9G
UkVFWkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVU0VUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NH
Uk9VUF9ERVZJQ0UgaXMgbm90IHNldApDT05GSUdfQ0dST1VQX0NQVUFDQ1Q9eQpDT05GSUdfQ0dS
T1VQX1BFUkY9eQojIENPTkZJR19DR1JPVVBfTUlTQyBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBf
REVCVUc9eQpDT05GSUdfTkFNRVNQQUNFUz15CkNPTkZJR19VVFNfTlM9eQojIENPTkZJR19USU1F
X05TIGlzIG5vdCBzZXQKQ09ORklHX0lQQ19OUz15CiMgQ09ORklHX1VTRVJfTlMgaXMgbm90IHNl
dAojIENPTkZJR19QSURfTlMgaXMgbm90IHNldApDT05GSUdfQ0hFQ0tQT0lOVF9SRVNUT1JFPXkK
Q09ORklHX1NDSEVEX0FVVE9HUk9VUD15CkNPTkZJR19TWVNGU19ERVBSRUNBVEVEPXkKIyBDT05G
SUdfU1lTRlNfREVQUkVDQVRFRF9WMiBpcyBub3Qgc2V0CkNPTkZJR19SRUxBWT15CkNPTkZJR19C
TEtfREVWX0lOSVRSRD15CkNPTkZJR19JTklUUkFNRlNfU09VUkNFPSIiCiMgQ09ORklHX1JEX0da
SVAgaXMgbm90IHNldAojIENPTkZJR19SRF9CWklQMiBpcyBub3Qgc2V0CkNPTkZJR19SRF9MWk1B
PXkKIyBDT05GSUdfUkRfWFogaXMgbm90IHNldApDT05GSUdfUkRfTFpPPXkKQ09ORklHX1JEX0xa
ND15CkNPTkZJR19SRF9aU1REPXkKQ09ORklHX0JPT1RfQ09ORklHPXkKIyBDT05GSUdfQk9PVF9D
T05GSUdfRU1CRUQgaXMgbm90IHNldAojIENPTkZJR19JTklUUkFNRlNfUFJFU0VSVkVfTVRJTUUg
aXMgbm90IHNldAojIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfUEVSRk9STUFOQ0UgaXMgbm90IHNl
dApDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1NJWkU9eQpDT05GSUdfU1lTQ1RMX0VYQ0VQVElPTl9U
UkFDRT15CkNPTkZJR19FWFBFUlQ9eQpDT05GSUdfTVVMVElVU0VSPXkKQ09ORklHX1NHRVRNQVNL
X1NZU0NBTEw9eQpDT05GSUdfU1lTRlNfU1lTQ0FMTD15CkNPTkZJR19GSEFORExFPXkKQ09ORklH
X1BPU0lYX1RJTUVSUz15CkNPTkZJR19QUklOVEs9eQpDT05GSUdfQlVHPXkKIyBDT05GSUdfRUxG
X0NPUkUgaXMgbm90IHNldAojIENPTkZJR19CQVNFX0ZVTEwgaXMgbm90IHNldAojIENPTkZJR19G
VVRFWCBpcyBub3Qgc2V0CiMgQ09ORklHX0VQT0xMIGlzIG5vdCBzZXQKIyBDT05GSUdfU0lHTkFM
RkQgaXMgbm90IHNldApDT05GSUdfVElNRVJGRD15CkNPTkZJR19FVkVOVEZEPXkKIyBDT05GSUdf
U0hNRU0gaXMgbm90IHNldApDT05GSUdfQUlPPXkKIyBDT05GSUdfSU9fVVJJTkcgaXMgbm90IHNl
dAojIENPTkZJR19BRFZJU0VfU1lTQ0FMTFMgaXMgbm90IHNldApDT05GSUdfTUVNQkFSUklFUj15
CkNPTkZJR19LQUxMU1lNUz15CkNPTkZJR19LQUxMU1lNU19BTEw9eQpDT05GSUdfS0FMTFNZTVNf
QkFTRV9SRUxBVElWRT15CkNPTkZJR19LQ01QPXkKQ09ORklHX1JTRVE9eQpDT05GSUdfREVCVUdf
UlNFUT15CiMgQ09ORklHX0VNQkVEREVEIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfUEVSRl9FVkVO
VFM9eQpDT05GSUdfUEVSRl9VU0VfVk1BTExPQz15CiMgQ09ORklHX1BDMTA0IGlzIG5vdCBzZXQK
CiMKIyBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRzIEFuZCBDb3VudGVycwojCkNPTkZJR19QRVJG
X0VWRU5UUz15CkNPTkZJR19ERUJVR19QRVJGX1VTRV9WTUFMTE9DPXkKIyBlbmQgb2YgS2VybmVs
IFBlcmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnMKCkNPTkZJR19TWVNURU1fREFUQV9WRVJJ
RklDQVRJT049eQpDT05GSUdfUFJPRklMSU5HPXkKIyBlbmQgb2YgR2VuZXJhbCBzZXR1cAoKQ09O
RklHX01NVT15CkNPTkZJR19DUFVfQklHX0VORElBTj15CkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9
eQpDT05GSUdfU1RBQ0tUUkFDRV9TVVBQT1JUPXkKQ09ORklHX0dFTkVSSUNfSFdFSUdIVD15CkNP
TkZJR19HRU5FUklDX0JVRz15CkNPTkZJR19HRU5FUklDX0JVR19SRUxBVElWRV9QT0lOVEVSUz15
CkNPTkZJR19QR1NURT15CkNPTkZJR19BVURJVF9BUkNIPXkKQ09ORklHX05PX0lPUE9SVF9NQVA9
eQpDT05GSUdfQVJDSF9TVVBQT1JUU19VUFJPQkVTPXkKQ09ORklHX1MzOTA9eQpDT05GSUdfU0NI
RURfT01JVF9GUkFNRV9QT0lOVEVSPXkKQ09ORklHX1BHVEFCTEVfTEVWRUxTPTUKQ09ORklHX0hB
VkVfTElWRVBBVENIPXkKCiMKIyBQcm9jZXNzb3IgdHlwZSBhbmQgZmVhdHVyZXMKIwpDT05GSUdf
SEFWRV9NQVJDSF9aMTBfRkVBVFVSRVM9eQpDT05GSUdfSEFWRV9NQVJDSF9aMTk2X0ZFQVRVUkVT
PXkKQ09ORklHX0hBVkVfTUFSQ0hfWkVDMTJfRkVBVFVSRVM9eQpDT05GSUdfSEFWRV9NQVJDSF9a
MTNfRkVBVFVSRVM9eQojIENPTkZJR19NQVJDSF9aMTAgaXMgbm90IHNldAojIENPTkZJR19NQVJD
SF9aMTk2IGlzIG5vdCBzZXQKIyBDT05GSUdfTUFSQ0hfWkVDMTIgaXMgbm90IHNldApDT05GSUdf
TUFSQ0hfWjEzPXkKIyBDT05GSUdfTUFSQ0hfWjE0IGlzIG5vdCBzZXQKIyBDT05GSUdfTUFSQ0hf
WjE1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUFSQ0hfWjE2IGlzIG5vdCBzZXQKQ09ORklHX01BUkNI
X1oxNV9UVU5FPXkKIyBDT05GSUdfVFVORV9ERUZBVUxUIGlzIG5vdCBzZXQKIyBDT05GSUdfVFVO
RV9aMTAgaXMgbm90IHNldAojIENPTkZJR19UVU5FX1oxOTYgaXMgbm90IHNldAojIENPTkZJR19U
VU5FX1pFQzEyIGlzIG5vdCBzZXQKIyBDT05GSUdfVFVORV9aMTMgaXMgbm90IHNldAojIENPTkZJ
R19UVU5FX1oxNCBpcyBub3Qgc2V0CkNPTkZJR19UVU5FX1oxNT15CiMgQ09ORklHX1RVTkVfWjE2
IGlzIG5vdCBzZXQKQ09ORklHXzY0QklUPXkKQ09ORklHX0NPTU1BTkRfTElORV9TSVpFPTQwOTYK
Q09ORklHX1NNUD15CkNPTkZJR19OUl9DUFVTPTY0CkNPTkZJR19IT1RQTFVHX0NQVT15CiMgQ09O
RklHX1NDSEVEX1RPUE9MT0dZIGlzIG5vdCBzZXQKIyBDT05GSUdfSFpfMTAwIGlzIG5vdCBzZXQK
IyBDT05GSUdfSFpfMjUwIGlzIG5vdCBzZXQKIyBDT05GSUdfSFpfMzAwIGlzIG5vdCBzZXQKQ09O
RklHX0haXzEwMDA9eQpDT05GSUdfSFo9MTAwMApDT05GSUdfS0VYRUM9eQpDT05GSUdfS0VSTkVM
X05PQlA9eQojIENPTkZJR19SRUxPQ0FUQUJMRSBpcyBub3Qgc2V0CiMgZW5kIG9mIFByb2Nlc3Nv
ciB0eXBlIGFuZCBmZWF0dXJlcwoKIwojIE1lbW9yeSBzZXR1cAojCkNPTkZJR19BUkNIX1NQQVJT
RU1FTV9FTkFCTEU9eQpDT05GSUdfQVJDSF9TUEFSU0VNRU1fREVGQVVMVD15CkNPTkZJR19NQVhf
UEhZU01FTV9CSVRTPTQ2CiMgZW5kIG9mIE1lbW9yeSBzZXR1cAoKIwojIEkvTyBzdWJzeXN0ZW0K
IwpDT05GSUdfUURJTz15CkNPTkZJR19DSFNDX1NDSD1tCkNPTkZJR19TQ01fQlVTPXkKIyBDT05G
SUdfRUFETV9TQ0ggaXMgbm90IHNldAojIGVuZCBvZiBJL08gc3Vic3lzdGVtCgojCiMgRHVtcCBz
dXBwb3J0CiMKQ09ORklHX0NSQVNIX0RVTVA9eQojIGVuZCBvZiBEdW1wIHN1cHBvcnQKCkNPTkZJ
R19DQ1c9eQoKIwojIFZpcnR1YWxpemF0aW9uCiMKIyBDT05GSUdfUFJPVEVDVEVEX1ZJUlRVQUxJ
WkFUSU9OX0dVRVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUEZBVUxUIGlzIG5vdCBzZXQKQ09ORklH
X0NNTT15CkNPTkZJR19TMzkwX0hZUEZTX0ZTPXkKQ09ORklHX0hBVkVfS1ZNPXkKQ09ORklHX0hB
VkVfS1ZNX0lSUUNISVA9eQpDT05GSUdfSEFWRV9LVk1fSVJRRkQ9eQpDT05GSUdfSEFWRV9LVk1f
SVJRX1JPVVRJTkc9eQpDT05GSUdfSEFWRV9LVk1fRVZFTlRGRD15CkNPTkZJR19LVk1fQVNZTkNf
UEY9eQpDT05GSUdfS1ZNX0FTWU5DX1BGX1NZTkM9eQpDT05GSUdfSEFWRV9LVk1fQ1BVX1JFTEFY
X0lOVEVSQ0VQVD15CkNPTkZJR19LVk1fVkZJTz15CkNPTkZJR19IQVZFX0tWTV9JTlZBTElEX1dB
S0VVUFM9eQpDT05GSUdfSEFWRV9LVk1fVkNQVV9BU1lOQ19JT0NUTD15CkNPTkZJR19IQVZFX0tW
TV9OT19QT0xMPXkKQ09ORklHX1ZJUlRVQUxJWkFUSU9OPXkKQ09ORklHX0tWTT1tCkNPTkZJR19L
Vk1fUzM5MF9VQ09OVFJPTD15CiMgQ09ORklHX1MzOTBfR1VFU1QgaXMgbm90IHNldAojIGVuZCBv
ZiBWaXJ0dWFsaXphdGlvbgoKIwojIFNlbGZ0ZXN0cwojCiMgZW5kIG9mIFNlbGZ0ZXN0cwoKIwoj
IEdlbmVyYWwgYXJjaGl0ZWN0dXJlLWRlcGVuZGVudCBvcHRpb25zCiMKQ09ORklHX0NSQVNIX0NP
UkU9eQpDT05GSUdfS0VYRUNfQ09SRT15CkNPTkZJR19HRU5FUklDX0VOVFJZPXkKQ09ORklHX0tQ
Uk9CRVM9eQojIENPTkZJR19KVU1QX0xBQkVMIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfRUZGSUNJ
RU5UX1VOQUxJR05FRF9BQ0NFU1M9eQpDT05GSUdfQVJDSF9VU0VfQlVJTFRJTl9CU1dBUD15CkNP
TkZJR19LUkVUUFJPQkVTPXkKQ09ORklHX0hBVkVfS1BST0JFUz15CkNPTkZJR19IQVZFX0tSRVRQ
Uk9CRVM9eQpDT05GSUdfSEFWRV9LUFJPQkVTX09OX0ZUUkFDRT15CkNPTkZJR19BUkNIX0NPUlJF
Q1RfU1RBQ0tUUkFDRV9PTl9LUkVUUFJPQkU9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9FUlJPUl9J
TkpFQ1RJT049eQpDT05GSUdfSEFWRV9OTUk9eQpDT05GSUdfVFJBQ0VfSVJRRkxBR1NfU1VQUE9S
VD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBQ0VIT09LPXkKQ09ORklHX0hBVkVfRE1BX0NPTlRJR1VP
VVM9eQpDT05GSUdfR0VORVJJQ19TTVBfSURMRV9USFJFQUQ9eQpDT05GSUdfQVJDSF9IQVNfRk9S
VElGWV9TT1VSQ0U9eQpDT05GSUdfQVJDSF9IQVNfU0VUX01FTU9SWT15CkNPTkZJR19BUkNIX1dB
TlRTX0RZTkFNSUNfVEFTS19TVFJVQ1Q9eQpDT05GSUdfQVJDSF9XQU5UU19OT19JTlNUUj15CkNP
TkZJR19BUkNIXzMyQklUX1VTVEFUX0ZfVElOT0RFPXkKQ09ORklHX0hBVkVfQVNNX01PRFZFUlNJ
T05TPXkKQ09ORklHX0hBVkVfUkVHU19BTkRfU1RBQ0tfQUNDRVNTX0FQST15CkNPTkZJR19IQVZF
X1JTRVE9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9BUkdfQUNDRVNTX0FQST15CkNPTkZJR19IQVZF
X1BFUkZfUkVHUz15CkNPTkZJR19IQVZFX1BFUkZfVVNFUl9TVEFDS19EVU1QPXkKQ09ORklHX0hB
VkVfQVJDSF9KVU1QX0xBQkVMPXkKQ09ORklHX0hBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZF
PXkKQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRT15CkNPTkZJR19NTVVfR0FUSEVSX1JDVV9U
QUJMRV9GUkVFPXkKQ09ORklHX01NVV9HQVRIRVJfTUVSR0VfVk1BUz15CkNPTkZJR19NTVVfR0FU
SEVSX05PX0dBVEhFUj15CkNPTkZJR19BUkNIX0hBVkVfTk1JX1NBRkVfQ01QWENIRz15CkNPTkZJ
R19IQVZFX0FMSUdORURfU1RSVUNUX1BBR0U9eQpDT05GSUdfSEFWRV9DTVBYQ0hHX0xPQ0FMPXkK
Q09ORklHX0hBVkVfQ01QWENIR19ET1VCTEU9eQpDT05GSUdfQVJDSF9XQU5UX0lQQ19QQVJTRV9W
RVJTSU9OPXkKQ09ORklHX0hBVkVfQVJDSF9TRUNDT01QPXkKQ09ORklHX0hBVkVfQVJDSF9TRUND
T01QX0ZJTFRFUj15CiMgQ09ORklHX1NFQ0NPTVAgaXMgbm90IHNldApDT05GSUdfTFRPX05PTkU9
eQpDT05GSUdfSEFWRV9WSVJUX0NQVV9BQ0NPVU5USU5HPXkKQ09ORklHX0hBVkVfVklSVF9DUFVf
QUNDT1VOVElOR19JRExFPXkKQ09ORklHX0FSQ0hfSEFTX1NDQUxFRF9DUFVUSU1FPXkKQ09ORklH
X0hBVkVfVklSVF9DUFVfQUNDT1VOVElOR19HRU49eQpDT05GSUdfSEFWRV9BUkNIX1RSQU5TUEFS
RU5UX0hVR0VQQUdFPXkKQ09ORklHX0hBVkVfQVJDSF9TT0ZUX0RJUlRZPXkKQ09ORklHX0hBVkVf
TU9EX0FSQ0hfU1BFQ0lGSUM9eQpDT05GSUdfTU9EVUxFU19VU0VfRUxGX1JFTEE9eQpDT05GSUdf
SEFWRV9TT0ZUSVJRX09OX09XTl9TVEFDSz15CkNPTkZJR19TT0ZUSVJRX09OX09XTl9TVEFDSz15
CkNPTkZJR19BTFRFUk5BVEVfVVNFUl9BRERSRVNTX1NQQUNFPXkKQ09ORklHX0FSQ0hfSEFTX0VM
Rl9SQU5ET01JWkU9eQpDT05GSUdfUEFHRV9TSVpFX0xFU1NfVEhBTl82NEtCPXkKQ09ORklHX1BB
R0VfU0laRV9MRVNTX1RIQU5fMjU2S0I9eQpDT05GSUdfSEFWRV9SRUxJQUJMRV9TVEFDS1RSQUNF
PXkKQ09ORklHX0NMT05FX0JBQ0tXQVJEUzI9eQpDT05GSUdfT0xEX1NJR1NVU1BFTkQzPXkKQ09O
RklHX09MRF9TSUdBQ1RJT049eQojIENPTkZJR19DT01QQVRfMzJCSVRfVElNRSBpcyBub3Qgc2V0
CkNPTkZJR19IQVZFX0FSQ0hfVk1BUF9TVEFDSz15CkNPTkZJR19WTUFQX1NUQUNLPXkKQ09ORklH
X0hBVkVfQVJDSF9SQU5ET01JWkVfS1NUQUNLX09GRlNFVD15CkNPTkZJR19SQU5ET01JWkVfS1NU
QUNLX09GRlNFVD15CiMgQ09ORklHX1JBTkRPTUlaRV9LU1RBQ0tfT0ZGU0VUX0RFRkFVTFQgaXMg
bm90IHNldApDT05GSUdfQVJDSF9IQVNfU1RSSUNUX0tFUk5FTF9SV1g9eQpDT05GSUdfU1RSSUNU
X0tFUk5FTF9SV1g9eQpDT05GSUdfQVJDSF9IQVNfU1RSSUNUX01PRFVMRV9SV1g9eQpDT05GSUdf
U1RSSUNUX01PRFVMRV9SV1g9eQojIENPTkZJR19MT0NLX0VWRU5UX0NPVU5UUyBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX0hBU19NRU1fRU5DUllQVD15CkNPTkZJR19BUkNIX0hBU19WRFNPX0RBVEE9
eQpDT05GSUdfQVJDSF9TVVBQT1JUU19ERUJVR19QQUdFQUxMT0M9eQoKIwojIEdDT1YtYmFzZWQg
a2VybmVsIHByb2ZpbGluZwojCiMgQ09ORklHX0dDT1ZfS0VSTkVMIGlzIG5vdCBzZXQKQ09ORklH
X0FSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEw9eQojIGVuZCBvZiBHQ09WLWJhc2VkIGtlcm5lbCBw
cm9maWxpbmcKCkNPTkZJR19IQVZFX0dDQ19QTFVHSU5TPXkKIyBlbmQgb2YgR2VuZXJhbCBhcmNo
aXRlY3R1cmUtZGVwZW5kZW50IG9wdGlvbnMKCkNPTkZJR19CQVNFX1NNQUxMPTEKQ09ORklHX01P
RFVMRV9TSUdfRk9STUFUPXkKQ09ORklHX01PRFVMRVM9eQpDT05GSUdfTU9EVUxFX0ZPUkNFX0xP
QUQ9eQpDT05GSUdfTU9EVUxFX1VOTE9BRD15CkNPTkZJR19NT0RVTEVfRk9SQ0VfVU5MT0FEPXkK
IyBDT05GSUdfTU9EVUxFX1VOTE9BRF9UQUlOVF9UUkFDS0lORyBpcyBub3Qgc2V0CkNPTkZJR19N
T0RWRVJTSU9OUz15CkNPTkZJR19BU01fTU9EVkVSU0lPTlM9eQojIENPTkZJR19NT0RVTEVfU1JD
VkVSU0lPTl9BTEwgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1NJRz15CiMgQ09ORklHX01PRFVM
RV9TSUdfRk9SQ0UgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1NJR19BTEw9eQojIENPTkZJR19N
T0RVTEVfU0lHX1NIQTEgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfU0lHX1NIQTIyNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01PRFVMRV9TSUdfU0hBMjU2IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9E
VUxFX1NJR19TSEEzODQgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1NJR19TSEE1MTI9eQpDT05G
SUdfTU9EVUxFX1NJR19IQVNIPSJzaGE1MTIiCkNPTkZJR19NT0RVTEVfQ09NUFJFU1NfTk9ORT15
CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19HWklQIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxF
X0NPTVBSRVNTX1haIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNTX1pTVEQgaXMg
bm90IHNldApDT05GSUdfTU9EVUxFX0FMTE9XX01JU1NJTkdfTkFNRVNQQUNFX0lNUE9SVFM9eQpD
T05GSUdfTU9EUFJPQkVfUEFUSD0iL3NiaW4vbW9kcHJvYmUiCkNPTkZJR19UUklNX1VOVVNFRF9L
U1lNUz15CkNPTkZJR19VTlVTRURfS1NZTVNfV0hJVEVMSVNUPSIiCkNPTkZJR19NT0RVTEVTX1RS
RUVfTE9PS1VQPXkKIyBDT05GSUdfQkxPQ0sgaXMgbm90IHNldApDT05GSUdfUFJFRU1QVF9OT1RJ
RklFUlM9eQpDT05GSUdfQVNOMT15CkNPTkZJR19BUkNIX0lOTElORV9TUElOX1RSWUxPQ0s9eQpD
T05GSUdfQVJDSF9JTkxJTkVfU1BJTl9UUllMT0NLX0JIPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1NQ
SU5fTE9DSz15CkNPTkZJR19BUkNIX0lOTElORV9TUElOX0xPQ0tfQkg9eQpDT05GSUdfQVJDSF9J
TkxJTkVfU1BJTl9MT0NLX0lSUT15CkNPTkZJR19BUkNIX0lOTElORV9TUElOX0xPQ0tfSVJRU0FW
RT15CkNPTkZJR19BUkNIX0lOTElORV9TUElOX1VOTE9DSz15CkNPTkZJR19BUkNIX0lOTElORV9T
UElOX1VOTE9DS19CSD15CkNPTkZJR19BUkNIX0lOTElORV9TUElOX1VOTE9DS19JUlE9eQpDT05G
SUdfQVJDSF9JTkxJTkVfU1BJTl9VTkxPQ0tfSVJRUkVTVE9SRT15CkNPTkZJR19BUkNIX0lOTElO
RV9SRUFEX1RSWUxPQ0s9eQpDT05GSUdfQVJDSF9JTkxJTkVfUkVBRF9MT0NLPXkKQ09ORklHX0FS
Q0hfSU5MSU5FX1JFQURfTE9DS19CSD15CkNPTkZJR19BUkNIX0lOTElORV9SRUFEX0xPQ0tfSVJR
PXkKQ09ORklHX0FSQ0hfSU5MSU5FX1JFQURfTE9DS19JUlFTQVZFPXkKQ09ORklHX0FSQ0hfSU5M
SU5FX1JFQURfVU5MT0NLPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1JFQURfVU5MT0NLX0JIPXkKQ09O
RklHX0FSQ0hfSU5MSU5FX1JFQURfVU5MT0NLX0lSUT15CkNPTkZJR19BUkNIX0lOTElORV9SRUFE
X1VOTE9DS19JUlFSRVNUT1JFPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1dSSVRFX1RSWUxPQ0s9eQpD
T05GSUdfQVJDSF9JTkxJTkVfV1JJVEVfTE9DSz15CkNPTkZJR19BUkNIX0lOTElORV9XUklURV9M
T0NLX0JIPXkKQ09ORklHX0FSQ0hfSU5MSU5FX1dSSVRFX0xPQ0tfSVJRPXkKQ09ORklHX0FSQ0hf
SU5MSU5FX1dSSVRFX0xPQ0tfSVJRU0FWRT15CkNPTkZJR19BUkNIX0lOTElORV9XUklURV9VTkxP
Q0s9eQpDT05GSUdfQVJDSF9JTkxJTkVfV1JJVEVfVU5MT0NLX0JIPXkKQ09ORklHX0FSQ0hfSU5M
SU5FX1dSSVRFX1VOTE9DS19JUlE9eQpDT05GSUdfQVJDSF9JTkxJTkVfV1JJVEVfVU5MT0NLX0lS
UVJFU1RPUkU9eQpDT05GSUdfVU5JTkxJTkVfU1BJTl9VTkxPQ0s9eQpDT05GSUdfQVJDSF9TVVBQ
T1JUU19BVE9NSUNfUk1XPXkKQ09ORklHX01VVEVYX1NQSU5fT05fT1dORVI9eQpDT05GSUdfUldT
RU1fU1BJTl9PTl9PV05FUj15CkNPTkZJR19MT0NLX1NQSU5fT05fT1dORVI9eQpDT05GSUdfQVJD
SF9IQVNfU1lTQ0FMTF9XUkFQUEVSPXkKCiMKIyBFeGVjdXRhYmxlIGZpbGUgZm9ybWF0cwojCkNP
TkZJR19CSU5GTVRfRUxGPXkKQ09ORklHX0FSQ0hfQklORk1UX0VMRl9TVEFURT15CkNPTkZJR19F
TEZDT1JFPXkKQ09ORklHX0JJTkZNVF9TQ1JJUFQ9bQpDT05GSUdfQklORk1UX01JU0M9bQpDT05G
SUdfQ09SRURVTVA9eQojIGVuZCBvZiBFeGVjdXRhYmxlIGZpbGUgZm9ybWF0cwoKIwojIE1lbW9y
eSBNYW5hZ2VtZW50IG9wdGlvbnMKIwoKIwojIFNMQUIgYWxsb2NhdG9yIG9wdGlvbnMKIwojIENP
TkZJR19TTEFCIGlzIG5vdCBzZXQKQ09ORklHX1NMVUI9eQojIENPTkZJR19TTE9CIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0xBQl9NRVJHRV9ERUZBVUxUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xBQl9G
UkVFTElTVF9SQU5ET00gaXMgbm90IHNldAojIENPTkZJR19TTEFCX0ZSRUVMSVNUX0hBUkRFTkVE
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0xVQl9TVEFUUyBpcyBub3Qgc2V0CkNPTkZJR19TTFVCX0NQ
VV9QQVJUSUFMPXkKIyBlbmQgb2YgU0xBQiBhbGxvY2F0b3Igb3B0aW9ucwoKIyBDT05GSUdfU0hV
RkZMRV9QQUdFX0FMTE9DQVRPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTVBBVF9CUksgaXMgbm90
IHNldApDT05GSUdfU1BBUlNFTUVNPXkKQ09ORklHX1NQQVJTRU1FTV9FWFRSRU1FPXkKQ09ORklH
X1NQQVJTRU1FTV9WTUVNTUFQX0VOQUJMRT15CkNPTkZJR19TUEFSU0VNRU1fVk1FTU1BUD15CkNP
TkZJR19IQVZFX01FTUJMT0NLX1BIWVNfTUFQPXkKQ09ORklHX0hBVkVfRkFTVF9HVVA9eQpDT05G
SUdfTUVNT1JZX0lTT0xBVElPTj15CkNPTkZJR19FWENMVVNJVkVfU1lTVEVNX1JBTT15CkNPTkZJ
R19BUkNIX0VOQUJMRV9NRU1PUllfSE9UUExVRz15CkNPTkZJR19BUkNIX0VOQUJMRV9NRU1PUllf
SE9UUkVNT1ZFPXkKIyBDT05GSUdfTUVNT1JZX0hPVFBMVUcgaXMgbm90IHNldApDT05GSUdfU1BM
SVRfUFRMT0NLX0NQVVM9NApDT05GSUdfQVJDSF9FTkFCTEVfU1BMSVRfUE1EX1BUTE9DSz15CkNP
TkZJR19DT01QQUNUSU9OPXkKQ09ORklHX1BBR0VfUkVQT1JUSU5HPXkKQ09ORklHX01JR1JBVElP
Tj15CkNPTkZJR19DT05USUdfQUxMT0M9eQpDT05GSUdfUEhZU19BRERSX1RfNjRCSVQ9eQpDT05G
SUdfTU1VX05PVElGSUVSPXkKQ09ORklHX0tTTT15CkNPTkZJR19ERUZBVUxUX01NQVBfTUlOX0FE
RFI9NDA5NgpDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0U9eQpDT05GSUdfVFJBTlNQQVJFTlRf
SFVHRVBBR0VfQUxXQVlTPXkKIyBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0VfTUFEVklTRSBp
cyBub3Qgc2V0CkNPTkZJR19DTUE9eQpDT05GSUdfQ01BX0RFQlVHPXkKIyBDT05GSUdfQ01BX0RF
QlVHRlMgaXMgbm90IHNldAojIENPTkZJR19DTUFfU1lTRlMgaXMgbm90IHNldApDT05GSUdfQ01B
X0FSRUFTPTcKQ09ORklHX01FTV9TT0ZUX0RJUlRZPXkKIyBDT05GSUdfREVGRVJSRURfU1RSVUNU
X1BBR0VfSU5JVCBpcyBub3Qgc2V0CkNPTkZJR19QQUdFX0lETEVfRkxBRz15CkNPTkZJR19JRExF
X1BBR0VfVFJBQ0tJTkc9eQpDT05GSUdfQVJDSF9IQVNfQ1VSUkVOVF9TVEFDS19QT0lOVEVSPXkK
Q09ORklHX1pPTkVfRE1BPXkKQ09ORklHX1ZNX0VWRU5UX0NPVU5URVJTPXkKQ09ORklHX1BFUkNQ
VV9TVEFUUz15CiMgQ09ORklHX0dVUF9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1BU
RV9TUEVDSUFMPXkKIyBDT05GSUdfVVNFUkZBVUxURkQgaXMgbm90IHNldAoKIwojIERhdGEgQWNj
ZXNzIE1vbml0b3JpbmcKIwpDT05GSUdfREFNT049eQojIENPTkZJR19EQU1PTl9WQUREUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RBTU9OX1BBRERSIGlzIG5vdCBzZXQKQ09ORklHX0RBTU9OX1NZU0ZT
PXkKIyBlbmQgb2YgRGF0YSBBY2Nlc3MgTW9uaXRvcmluZwojIGVuZCBvZiBNZW1vcnkgTWFuYWdl
bWVudCBvcHRpb25zCgojIENPTkZJR19ORVQgaXMgbm90IHNldAoKIwojIERldmljZSBEcml2ZXJz
CiMKQ09ORklHX0hBVkVfUENJPXkKIyBDT05GSUdfUENJIGlzIG5vdCBzZXQKQ09ORklHX1BDQ0FS
RD15CkNPTkZJR19QQ01DSUE9eQojIENPTkZJR19QQ01DSUFfTE9BRF9DSVMgaXMgbm90IHNldAoK
IwojIFBDLWNhcmQgYnJpZGdlcwojCgojCiMgR2VuZXJpYyBEcml2ZXIgT3B0aW9ucwojCkNPTkZJ
R19BVVhJTElBUllfQlVTPXkKQ09ORklHX1VFVkVOVF9IRUxQRVI9eQpDT05GSUdfVUVWRU5UX0hF
TFBFUl9QQVRIPSIiCiMgQ09ORklHX0RFVlRNUEZTIGlzIG5vdCBzZXQKQ09ORklHX1NUQU5EQUxP
TkU9eQpDT05GSUdfUFJFVkVOVF9GSVJNV0FSRV9CVUlMRD15CgojCiMgRmlybXdhcmUgbG9hZGVy
CiMKQ09ORklHX0ZXX0xPQURFUj15CkNPTkZJR19GV19MT0FERVJfUEFHRURfQlVGPXkKQ09ORklH
X0VYVFJBX0ZJUk1XQVJFPSIiCiMgQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUiBpcyBub3Qg
c2V0CkNPTkZJR19GV19MT0FERVJfQ09NUFJFU1M9eQpDT05GSUdfRldfTE9BREVSX0NPTVBSRVNT
X1haPXkKQ09ORklHX0ZXX0xPQURFUl9DT01QUkVTU19aU1REPXkKIyBDT05GSUdfRldfVVBMT0FE
IGlzIG5vdCBzZXQKIyBlbmQgb2YgRmlybXdhcmUgbG9hZGVyCgpDT05GSUdfV0FOVF9ERVZfQ09S
RURVTVA9eQpDT05GSUdfQUxMT1dfREVWX0NPUkVEVU1QPXkKQ09ORklHX0RFVl9DT1JFRFVNUD15
CkNPTkZJR19ERUJVR19EUklWRVI9eQojIENPTkZJR19ERUJVR19ERVZSRVMgaXMgbm90IHNldApD
T05GSUdfREVCVUdfVEVTVF9EUklWRVJfUkVNT1ZFPXkKIyBDT05GSUdfVEVTVF9BU1lOQ19EUklW
RVJfUFJPQkUgaXMgbm90IHNldApDT05GSUdfU1lTX0hZUEVSVklTT1I9eQpDT05GSUdfR0VORVJJ
Q19DUFVfQVVUT1BST0JFPXkKQ09ORklHX0dFTkVSSUNfQ1BVX1ZVTE5FUkFCSUxJVElFUz15CkNP
TkZJR19SRUdNQVA9eQpDT05GSUdfUkVHTUFQX1NQTUk9bQpDT05GSUdfUkVHTUFQX01NSU89eQoj
IGVuZCBvZiBHZW5lcmljIERyaXZlciBPcHRpb25zCgojCiMgQnVzIGRldmljZXMKIwojIENPTkZJ
R19NSElfQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUhJX0JVU19FUCBpcyBub3Qgc2V0CiMgZW5k
IG9mIEJ1cyBkZXZpY2VzCgojCiMgRmlybXdhcmUgRHJpdmVycwojCgojCiMgQVJNIFN5c3RlbSBD
b250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFjZSBQcm90b2NvbAojCiMgZW5kIG9mIEFSTSBT
eXN0ZW0gQ29udHJvbCBhbmQgTWFuYWdlbWVudCBJbnRlcmZhY2UgUHJvdG9jb2wKCkNPTkZJR19G
SVJNV0FSRV9NRU1NQVA9eQojIENPTkZJR19HT09HTEVfRklSTVdBUkUgaXMgbm90IHNldAoKIwoj
IFRlZ3JhIGZpcm13YXJlIGRyaXZlcgojCiMgZW5kIG9mIFRlZ3JhIGZpcm13YXJlIGRyaXZlcgoj
IGVuZCBvZiBGaXJtd2FyZSBEcml2ZXJzCgpDT05GSUdfR05TUz15CkNPTkZJR19NVEQ9bQojIENP
TkZJR19NVERfVEVTVFMgaXMgbm90IHNldAoKIwojIFBhcnRpdGlvbiBwYXJzZXJzCiMKQ09ORklH
X01URF9BUjdfUEFSVFM9bQojIENPTkZJR19NVERfQ01ETElORV9QQVJUUyBpcyBub3Qgc2V0CiMg
Q09ORklHX01URF9PRl9QQVJUUyBpcyBub3Qgc2V0CkNPTkZJR19NVERfUkVEQk9PVF9QQVJUUz1t
CkNPTkZJR19NVERfUkVEQk9PVF9ESVJFQ1RPUllfQkxPQ0s9LTEKIyBDT05GSUdfTVREX1JFREJP
T1RfUEFSVFNfVU5BTExPQ0FURUQgaXMgbm90IHNldAojIENPTkZJR19NVERfUkVEQk9PVF9QQVJU
U19SRUFET05MWSBpcyBub3Qgc2V0CiMgZW5kIG9mIFBhcnRpdGlvbiBwYXJzZXJzCgojCiMgVXNl
ciBNb2R1bGVzIEFuZCBUcmFuc2xhdGlvbiBMYXllcnMKIwojIENPTkZJR19NVERfT09QUyBpcyBu
b3Qgc2V0CkNPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSPXkKCiMKIyBSQU0vUk9NL0ZsYXNo
IGNoaXAgZHJpdmVycwojCiMgQ09ORklHX01URF9DRkkgaXMgbm90IHNldApDT05GSUdfTVREX0pF
REVDUFJPQkU9bQpDT05GSUdfTVREX0dFTl9QUk9CRT1tCkNPTkZJR19NVERfQ0ZJX0FEVl9PUFRJ
T05TPXkKIyBDT05GSUdfTVREX0NGSV9OT1NXQVAgaXMgbm90IHNldApDT05GSUdfTVREX0NGSV9C
RV9CWVRFX1NXQVA9eQojIENPTkZJR19NVERfQ0ZJX0xFX0JZVEVfU1dBUCBpcyBub3Qgc2V0CkNP
TkZJR19NVERfQ0ZJX0dFT01FVFJZPXkKQ09ORklHX01URF9NQVBfQkFOS19XSURUSF8xPXkKIyBD
T05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzIgaXMgbm90IHNldAojIENPTkZJR19NVERfTUFQX0JB
TktfV0lEVEhfNCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9NQVBfQkFOS19XSURUSF84IGlzIG5v
dCBzZXQKIyBDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzE2IGlzIG5vdCBzZXQKQ09ORklHX01U
RF9NQVBfQkFOS19XSURUSF8zMj15CkNPTkZJR19NVERfQ0ZJX0kxPXkKIyBDT05GSUdfTVREX0NG
SV9JMiBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9DRklfSTQgaXMgbm90IHNldAojIENPTkZJR19N
VERfQ0ZJX0k4IGlzIG5vdCBzZXQKQ09ORklHX01URF9PVFA9eQpDT05GSUdfTVREX0NGSV9JTlRF
TEVYVD1tCkNPTkZJR19NVERfQ0ZJX0FNRFNURD1tCkNPTkZJR19NVERfQ0ZJX1NUQUE9bQpDT05G
SUdfTVREX0NGSV9VVElMPW0KQ09ORklHX01URF9SQU09bQojIENPTkZJR19NVERfUk9NIGlzIG5v
dCBzZXQKQ09ORklHX01URF9BQlNFTlQ9bQojIGVuZCBvZiBSQU0vUk9NL0ZsYXNoIGNoaXAgZHJp
dmVycwoKIwojIE5BTkQKIwpDT05GSUdfTVREX05BTkRfQ09SRT1tCkNPTkZJR19NVERfUkFXX05B
TkQ9bQoKIwojIFJhdy9wYXJhbGxlbCBOQU5EIGZsYXNoIGNvbnRyb2xsZXJzCiMKCiMKIyBNaXNj
CiMKQ09ORklHX01URF9OQU5EX05BTkRTSU09bQoKIwojIEVDQyBlbmdpbmUgc3VwcG9ydAojCkNP
TkZJR19NVERfTkFORF9FQ0M9eQpDT05GSUdfTVREX05BTkRfRUNDX1NXX0hBTU1JTkc9eQpDT05G
SUdfTVREX05BTkRfRUNDX1NXX0hBTU1JTkdfU01DPXkKQ09ORklHX01URF9OQU5EX0VDQ19TV19C
Q0g9eQojIGVuZCBvZiBFQ0MgZW5naW5lIHN1cHBvcnQKIyBlbmQgb2YgTkFORAoKIwojIExQRERS
ICYgTFBERFIyIFBDTSBtZW1vcnkgZHJpdmVycwojCkNPTkZJR19NVERfTFBERFI9bQpDT05GSUdf
TVREX1FJTkZPX1BST0JFPW0KIyBlbmQgb2YgTFBERFIgJiBMUEREUjIgUENNIG1lbW9yeSBkcml2
ZXJzCgpDT05GSUdfTVREX1VCST1tCkNPTkZJR19NVERfVUJJX1dMX1RIUkVTSE9MRD00MDk2CkNP
TkZJR19NVERfVUJJX0JFQl9MSU1JVD0yMAojIENPTkZJR19NVERfVUJJX0ZBU1RNQVAgaXMgbm90
IHNldApDT05GSUdfTVREX1VCSV9HTFVFQkk9bQpDT05GSUdfT0Y9eQojIENPTkZJR19PRl9VTklU
VEVTVCBpcyBub3Qgc2V0CkNPTkZJR19PRl9LT0JKPXkKQ09ORklHX09GX0lSUT15CiMgQ09ORklH
X09GX09WRVJMQVkgaXMgbm90IHNldAoKIwojIE5WTUUgU3VwcG9ydAojCiMgZW5kIG9mIE5WTUUg
U3VwcG9ydAoKIwojIE1pc2MgZGV2aWNlcwojCkNPTkZJR19EVU1NWV9JUlE9eQpDT05GSUdfRU5D
TE9TVVJFX1NFUlZJQ0VTPXkKIyBDT05GSUdfQzJQT1JUIGlzIG5vdCBzZXQKCiMKIyBFRVBST00g
c3VwcG9ydAojCiMgQ09ORklHX0VFUFJPTV85M0NYNiBpcyBub3Qgc2V0CiMgZW5kIG9mIEVFUFJP
TSBzdXBwb3J0CgojCiMgVGV4YXMgSW5zdHJ1bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5lIGRp
c2NpcGxpbmUKIwojIGVuZCBvZiBUZXhhcyBJbnN0cnVtZW50cyBzaGFyZWQgdHJhbnNwb3J0IGxp
bmUgZGlzY2lwbGluZQoKIwojIEFsdGVyYSBGUEdBIGZpcm13YXJlIGRvd25sb2FkIG1vZHVsZSAo
cmVxdWlyZXMgSTJDKQojCiMgQ09ORklHX0VDSE8gaXMgbm90IHNldApDT05GSUdfVUFDQ0U9bQoj
IENPTkZJR19QVlBBTklDIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzYyBkZXZpY2VzCgojCiMgU0NT
SSBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19TQ1NJX01PRD15CiMgZW5kIG9mIFNDU0kgZGV2aWNl
IHN1cHBvcnQKCiMKIyBJbnB1dCBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19JTlBVVD1tCkNPTkZJ
R19JTlBVVF9GRl9NRU1MRVNTPW0KQ09ORklHX0lOUFVUX1NQQVJTRUtNQVA9bQpDT05GSUdfSU5Q
VVRfTUFUUklYS01BUD1tCgojCiMgVXNlcmxhbmQgaW50ZXJmYWNlcwojCkNPTkZJR19JTlBVVF9N
T1VTRURFVj1tCiMgQ09ORklHX0lOUFVUX01PVVNFREVWX1BTQVVYIGlzIG5vdCBzZXQKQ09ORklH
X0lOUFVUX01PVVNFREVWX1NDUkVFTl9YPTEwMjQKQ09ORklHX0lOUFVUX01PVVNFREVWX1NDUkVF
Tl9ZPTc2OApDT05GSUdfSU5QVVRfSk9ZREVWPW0KQ09ORklHX0lOUFVUX0VWREVWPW0KQ09ORklH
X0lOUFVUX0VWQlVHPW0KCiMKIyBJbnB1dCBEZXZpY2UgRHJpdmVycwojCiMgQ09ORklHX0lOUFVU
X0tFWUJPQVJEIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01PVVNFPXkKIyBDT05GSUdfTU9VU0Vf
UFMyIGlzIG5vdCBzZXQKQ09ORklHX01PVVNFX1NFUklBTD1tCkNPTkZJR19NT1VTRV9WU1hYWEFB
PW0KQ09ORklHX01PVVNFX0dQSU89bQpDT05GSUdfSU5QVVRfSk9ZU1RJQ0s9eQojIENPTkZJR19K
T1lTVElDS19BTkFMT0cgaXMgbm90IHNldApDT05GSUdfSk9ZU1RJQ0tfQTNEPW0KQ09ORklHX0pP
WVNUSUNLX0FEQz1tCiMgQ09ORklHX0pPWVNUSUNLX0FESSBpcyBub3Qgc2V0CkNPTkZJR19KT1lT
VElDS19DT0JSQT1tCkNPTkZJR19KT1lTVElDS19HRjJLPW0KQ09ORklHX0pPWVNUSUNLX0dSSVA9
bQojIENPTkZJR19KT1lTVElDS19HUklQX01QIGlzIG5vdCBzZXQKQ09ORklHX0pPWVNUSUNLX0dV
SUxMRU1PVD1tCkNPTkZJR19KT1lTVElDS19JTlRFUkFDVD1tCkNPTkZJR19KT1lTVElDS19TSURF
V0lOREVSPW0KQ09ORklHX0pPWVNUSUNLX1RNREM9bQpDT05GSUdfSk9ZU1RJQ0tfSUZPUkNFPW0K
Q09ORklHX0pPWVNUSUNLX0lGT1JDRV8yMzI9bQojIENPTkZJR19KT1lTVElDS19XQVJSSU9SIGlz
IG5vdCBzZXQKQ09ORklHX0pPWVNUSUNLX01BR0VMTEFOPW0KQ09ORklHX0pPWVNUSUNLX1NQQUNF
T1JCPW0KQ09ORklHX0pPWVNUSUNLX1NQQUNFQkFMTD1tCkNPTkZJR19KT1lTVElDS19TVElOR0VS
PW0KIyBDT05GSUdfSk9ZU1RJQ0tfVFdJREpPWSBpcyBub3Qgc2V0CkNPTkZJR19KT1lTVElDS19a
SEVOSFVBPW0KQ09ORklHX0pPWVNUSUNLX0pPWURVTVA9bQojIENPTkZJR19KT1lTVElDS19GU0lB
NkIgaXMgbm90IHNldApDT05GSUdfSU5QVVRfVEFCTEVUPXkKQ09ORklHX1RBQkxFVF9TRVJJQUxf
V0FDT000PW0KIyBDT05GSUdfSU5QVVRfVE9VQ0hTQ1JFRU4gaXMgbm90IHNldApDT05GSUdfSU5Q
VVRfTUlTQz15CkNPTkZJR19JTlBVVF9BRDcxNFg9bQpDT05GSUdfSU5QVVRfRTNYMF9CVVRUT049
bQpDT05GSUdfSU5QVVRfR1BJT19CRUVQRVI9bQojIENPTkZJR19JTlBVVF9HUElPX0RFQ09ERVIg
aXMgbm90IHNldApDT05GSUdfSU5QVVRfR1BJT19WSUJSQT1tCkNPTkZJR19JTlBVVF9VSU5QVVQ9
bQpDT05GSUdfSU5QVVRfUFdNX0JFRVBFUj1tCiMgQ09ORklHX0lOUFVUX1BXTV9WSUJSQSBpcyBu
b3Qgc2V0CkNPTkZJR19JTlBVVF9HUElPX1JPVEFSWV9FTkNPREVSPW0KIyBDT05GSUdfSU5QVVRf
QURYTDM0WCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0NNQTMwMDAgaXMgbm90IHNldAojIENP
TkZJR19STUk0X0NPUkUgaXMgbm90IHNldAoKIwojIEhhcmR3YXJlIEkvTyBwb3J0cwojCkNPTkZJ
R19TRVJJTz1tCkNPTkZJR19TRVJJT19TRVJQT1JUPW0KQ09ORklHX1NFUklPX0xJQlBTMj1tCkNP
TkZJR19TRVJJT19SQVc9bQojIENPTkZJR19TRVJJT19QUzJNVUxUIGlzIG5vdCBzZXQKQ09ORklH
X1NFUklPX0dQSU9fUFMyPW0KQ09ORklHX1VTRVJJTz1tCkNPTkZJR19HQU1FUE9SVD1tCkNPTkZJ
R19HQU1FUE9SVF9OUzU1OD1tCkNPTkZJR19HQU1FUE9SVF9MND1tCiMgZW5kIG9mIEhhcmR3YXJl
IEkvTyBwb3J0cwojIGVuZCBvZiBJbnB1dCBkZXZpY2Ugc3VwcG9ydAoKIwojIENoYXJhY3RlciBk
ZXZpY2VzCiMKQ09ORklHX1RUWT15CiMgQ09ORklHX1ZUIGlzIG5vdCBzZXQKQ09ORklHX1VOSVg5
OF9QVFlTPXkKQ09ORklHX0xFR0FDWV9QVFlTPXkKQ09ORklHX0xFR0FDWV9QVFlfQ09VTlQ9MjU2
CiMgQ09ORklHX0xESVNDX0FVVE9MT0FEIGlzIG5vdCBzZXQKIyBDT05GSUdfTlVMTF9UVFkgaXMg
bm90IHNldApDT05GSUdfSFZDX0RSSVZFUj15CiMgQ09ORklHX1JQTVNHX1RUWSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF9ERVZfQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfVFRZX1BSSU5USyBp
cyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fQ09OU09MRT15CkNPTkZJR19IV19SQU5ET009eQpDT05G
SUdfSFdfUkFORE9NX1ZJUlRJTz15CkNPTkZJR19IV19SQU5ET01fUzM5MD15CgojCiMgUENNQ0lB
IGNoYXJhY3RlciBkZXZpY2VzCiMKQ09ORklHX1NZTkNMSU5LX0NTPXkKQ09ORklHX0NBUkRNQU5f
NDAwMD1tCkNPTkZJR19DQVJETUFOXzQwNDA9eQojIENPTkZJR19TQ1IyNFggaXMgbm90IHNldAoj
IGVuZCBvZiBQQ01DSUEgY2hhcmFjdGVyIGRldmljZXMKCkNPTkZJR19ERVZNRU09eQojIENPTkZJ
R19IQU5HQ0hFQ0tfVElNRVIgaXMgbm90IHNldAoKIwojIFMvMzkwIGNoYXJhY3RlciBkZXZpY2Ug
ZHJpdmVycwojCkNPTkZJR19UTjMyNzA9eQpDT05GSUdfVE4zMjcwX1RUWT15CiMgQ09ORklHX1RO
MzI3MF9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1ROMzI3MF9DT05TT0xFIGlzIG5vdCBzZXQKQ09O
RklHX1ROMzIxNT15CiMgQ09ORklHX1ROMzIxNV9DT05TT0xFIGlzIG5vdCBzZXQKQ09ORklHX1ND
TFBfVFRZPXkKIyBDT05GSUdfU0NMUF9DT05TT0xFIGlzIG5vdCBzZXQKQ09ORklHX1NDTFBfVlQy
MjBfVFRZPXkKIyBDT05GSUdfU0NMUF9WVDIyMF9DT05TT0xFIGlzIG5vdCBzZXQKIyBDT05GSUdf
SE1DX0RSViBpcyBub3Qgc2V0CiMgQ09ORklHX1NDTFBfT0ZCIGlzIG5vdCBzZXQKQ09ORklHX1Mz
OTBfVVZfVUFQST15CkNPTkZJR19TMzkwX1RBUEU9eQoKIwojIFMvMzkwIHRhcGUgaGFyZHdhcmUg
c3VwcG9ydAojCkNPTkZJR19TMzkwX1RBUEVfMzRYWD1tCkNPTkZJR19TMzkwX1RBUEVfMzU5MD1t
CiMgQ09ORklHX1ZNQ1AgaXMgbm90IHNldAojIENPTkZJR19NT05XUklURVIgaXMgbm90IHNldApD
T05GSUdfUzM5MF9WTVVSPXkKIyBDT05GSUdfWElMTFlCVVMgaXMgbm90IHNldApDT05GSUdfUkFO
RE9NX1RSVVNUX0NQVT15CkNPTkZJR19SQU5ET01fVFJVU1RfQk9PVExPQURFUj15CiMgZW5kIG9m
IENoYXJhY3RlciBkZXZpY2VzCgojCiMgSTJDIHN1cHBvcnQKIwojIENPTkZJR19JMkMgaXMgbm90
IHNldAojIGVuZCBvZiBJMkMgc3VwcG9ydAoKIyBDT05GSUdfSTNDIGlzIG5vdCBzZXQKQ09ORklH
X1NQTUk9eQojIENPTkZJR19IU0kgaXMgbm90IHNldApDT05GSUdfUFBTPW0KIyBDT05GSUdfUFBT
X0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBQUFMgY2xpZW50cyBzdXBwb3J0CiMKQ09ORklHX1BQU19D
TElFTlRfS1RJTUVSPW0KQ09ORklHX1BQU19DTElFTlRfTERJU0M9bQojIENPTkZJR19QUFNfQ0xJ
RU5UX0dQSU8gaXMgbm90IHNldAoKIwojIFBQUyBnZW5lcmF0b3JzIHN1cHBvcnQKIwoKIwojIFBU
UCBjbG9jayBzdXBwb3J0CiMKQ09ORklHX1BUUF8xNTg4X0NMT0NLX09QVElPTkFMPXkKCiMKIyBF
bmFibGUgUEhZTElCIGFuZCBORVRXT1JLX1BIWV9USU1FU1RBTVBJTkcgdG8gc2VlIHRoZSBhZGRp
dGlvbmFsIGNsb2Nrcy4KIwojIGVuZCBvZiBQVFAgY2xvY2sgc3VwcG9ydAoKQ09ORklHX1BJTkNU
Ukw9eQojIENPTkZJR19ERUJVR19QSU5DVFJMIGlzIG5vdCBzZXQKCiMKIyBSZW5lc2FzIHBpbmN0
cmwgZHJpdmVycwojCiMgZW5kIG9mIFJlbmVzYXMgcGluY3RybCBkcml2ZXJzCgpDT05GSUdfR1BJ
T0xJQj15CkNPTkZJR19HUElPTElCX0ZBU1RQQVRIX0xJTUlUPTUxMgpDT05GSUdfREVCVUdfR1BJ
Tz15CiMgQ09ORklHX0dQSU9fU1lTRlMgaXMgbm90IHNldApDT05GSUdfR1BJT19DREVWPXkKIyBD
T05GSUdfR1BJT19DREVWX1YxIGlzIG5vdCBzZXQKCiMKIyBNRkQgR1BJTyBleHBhbmRlcnMKIwoj
IGVuZCBvZiBNRkQgR1BJTyBleHBhbmRlcnMKCiMKIyBWaXJ0dWFsIEdQSU8gZHJpdmVycwojCkNP
TkZJR19HUElPX0FHR1JFR0FUT1I9eQojIENPTkZJR19HUElPX01PQ0tVUCBpcyBub3Qgc2V0CiMg
Q09ORklHX0dQSU9fVklSVElPIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19TSU0gaXMgbm90IHNl
dAojIGVuZCBvZiBWaXJ0dWFsIEdQSU8gZHJpdmVycwoKIyBDT05GSUdfUE9XRVJfUkVTRVQgaXMg
bm90IHNldAojIENPTkZJR19QT1dFUl9TVVBQTFkgaXMgbm90IHNldApDT05GSUdfVEhFUk1BTD15
CkNPTkZJR19USEVSTUFMX1NUQVRJU1RJQ1M9eQpDT05GSUdfVEhFUk1BTF9FTUVSR0VOQ1lfUE9X
RVJPRkZfREVMQVlfTVM9MApDT05GSUdfVEhFUk1BTF9PRj15CkNPTkZJR19USEVSTUFMX1dSSVRB
QkxFX1RSSVBTPXkKQ09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1ZfU1RFUF9XSVNFPXkKIyBDT05G
SUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9GQUlSX1NIQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhF
Uk1BTF9ERUZBVUxUX0dPVl9VU0VSX1NQQUNFIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfR09W
X0ZBSVJfU0hBUkU9eQpDT05GSUdfVEhFUk1BTF9HT1ZfU1RFUF9XSVNFPXkKIyBDT05GSUdfVEhF
Uk1BTF9HT1ZfQkFOR19CQU5HIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfR09WX1VTRVJfU1BB
Q0U9eQojIENPTkZJR19DUFVfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFVkZSRVFfVEhF
Uk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfRU1VTEFUSU9OIGlzIG5vdCBzZXQKIyBD
T05GSUdfR0VORVJJQ19BRENfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX1dBVENIRE9HIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SIGlzIG5vdCBzZXQKQ09ORklHX1JDX0NPUkU9bQpD
T05GSUdfTElSQz15CkNPTkZJR19SQ19NQVA9bQpDT05GSUdfUkNfREVDT0RFUlM9eQojIENPTkZJ
R19JUl9JTU9OX0RFQ09ERVIgaXMgbm90IHNldAojIENPTkZJR19JUl9KVkNfREVDT0RFUiBpcyBu
b3Qgc2V0CkNPTkZJR19JUl9NQ0VfS0JEX0RFQ09ERVI9bQpDT05GSUdfSVJfTkVDX0RFQ09ERVI9
bQpDT05GSUdfSVJfUkM1X0RFQ09ERVI9bQpDT05GSUdfSVJfUkM2X0RFQ09ERVI9bQojIENPTkZJ
R19JUl9SQ01NX0RFQ09ERVIgaXMgbm90IHNldAojIENPTkZJR19JUl9TQU5ZT19ERUNPREVSIGlz
IG5vdCBzZXQKQ09ORklHX0lSX1NIQVJQX0RFQ09ERVI9bQpDT05GSUdfSVJfU09OWV9ERUNPREVS
PW0KQ09ORklHX0lSX1hNUF9ERUNPREVSPW0KIyBDT05GSUdfUkNfREVWSUNFUyBpcyBub3Qgc2V0
CgojCiMgQ0VDIHN1cHBvcnQKIwojIENPTkZJR19NRURJQV9DRUNfU1VQUE9SVCBpcyBub3Qgc2V0
CiMgZW5kIG9mIENFQyBzdXBwb3J0CgojCiMgR3JhcGhpY3Mgc3VwcG9ydAojCiMgZW5kIG9mIEdy
YXBoaWNzIHN1cHBvcnQKCiMKIyBISUQgc3VwcG9ydAojCiMgQ09ORklHX0hJRCBpcyBub3Qgc2V0
CiMgZW5kIG9mIEhJRCBzdXBwb3J0CgpDT05GSUdfVVNCX09IQ0lfTElUVExFX0VORElBTj15CkNP
TkZJR19NRU1TVElDSz15CiMgQ09ORklHX01FTVNUSUNLX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBN
ZW1vcnlTdGljayBkcml2ZXJzCiMKQ09ORklHX01FTVNUSUNLX1VOU0FGRV9SRVNVTUU9eQoKIwoj
IE1lbW9yeVN0aWNrIEhvc3QgQ29udHJvbGxlciBEcml2ZXJzCiMKQ09ORklHX05FV19MRURTPXkK
IyBDT05GSUdfTEVEU19DTEFTUyBpcyBub3Qgc2V0CgojCiMgTEVEIGRyaXZlcnMKIwoKIwojIExF
RCBkcml2ZXIgZm9yIGJsaW5rKDEpIFVTQiBSR0IgTEVEIGlzIHVuZGVyIFNwZWNpYWwgSElEIGRy
aXZlcnMgKEhJRF9USElOR00pCiMKCiMKIyBGbGFzaCBhbmQgVG9yY2ggTEVEIGRyaXZlcnMKIwoK
IwojIFJHQiBMRUQgZHJpdmVycwojCgojCiMgTEVEIFRyaWdnZXJzCiMKCiMKIyBTaW1wbGUgTEVE
IGRyaXZlcnMKIwpDT05GSUdfQUNDRVNTSUJJTElUWT15CgojCiMgU3BlYWt1cCBjb25zb2xlIHNw
ZWVjaAojCiMgZW5kIG9mIFNwZWFrdXAgY29uc29sZSBzcGVlY2gKCkNPTkZJR19ETUFERVZJQ0VT
PXkKQ09ORklHX0RNQURFVklDRVNfREVCVUc9eQpDT05GSUdfRE1BREVWSUNFU19WREVCVUc9eQoK
IwojIERNQSBEZXZpY2VzCiMKQ09ORklHX0RNQV9FTkdJTkU9eQpDT05GSUdfRE1BX1ZJUlRVQUxf
Q0hBTk5FTFM9bQpDT05GSUdfRE1BX09GPXkKQ09ORklHX0ZTTF9FRE1BPW0KQ09ORklHX0lOVEVM
X0lETUE2ND1tCiMgQ09ORklHX1FDT01fSElETUEgaXMgbm90IHNldAoKIwojIERNQSBDbGllbnRz
CiMKIyBDT05GSUdfQVNZTkNfVFhfRE1BIGlzIG5vdCBzZXQKQ09ORklHX0RNQVRFU1Q9eQpDT05G
SUdfRE1BX0VOR0lORV9SQUlEPXkKCiMKIyBETUFCVUYgb3B0aW9ucwojCiMgQ09ORklHX1NZTkNf
RklMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQUJVRl9IRUFQUyBpcyBub3Qgc2V0CiMgZW5kIG9m
IERNQUJVRiBvcHRpb25zCgojIENPTkZJR19BVVhESVNQTEFZIGlzIG5vdCBzZXQKIyBDT05GSUdf
VUlPIGlzIG5vdCBzZXQKQ09ORklHX1ZGSU89eQpDT05GSUdfVkZJT19JT01NVV9UWVBFMT15CiMg
Q09ORklHX1ZGSU9fTk9JT01NVSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZGSU9fTURFViBpcyBub3Qg
c2V0CkNPTkZJR19WSVJUX0RSSVZFUlM9eQpDT05GSUdfVklSVElPX0FOQ0hPUj15CkNPTkZJR19W
SVJUSU89eQojIENPTkZJR19WSVJUSU9fTUVOVSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZIT1NUX01F
TlUgaXMgbm90IHNldAoKIwojIE1pY3Jvc29mdCBIeXBlci1WIGd1ZXN0IHN1cHBvcnQKIwojIGVu
ZCBvZiBNaWNyb3NvZnQgSHlwZXItViBndWVzdCBzdXBwb3J0CgojIENPTkZJR19HUkVZQlVTIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ09NRURJIGlzIG5vdCBzZXQKQ09ORklHX1NUQUdJTkc9eQoKIwoj
IElJTyBzdGFnaW5nIGRyaXZlcnMKIwoKIwojIEFjY2VsZXJvbWV0ZXJzCiMKIyBlbmQgb2YgQWNj
ZWxlcm9tZXRlcnMKCiMKIyBBbmFsb2cgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMKIyBlbmQgb2Yg
QW5hbG9nIHRvIGRpZ2l0YWwgY29udmVydGVycwoKIwojIEFuYWxvZyBkaWdpdGFsIGJpLWRpcmVj
dGlvbiBjb252ZXJ0ZXJzCiMKQ09ORklHX0FEVDczMTY9bQojIGVuZCBvZiBBbmFsb2cgZGlnaXRh
bCBiaS1kaXJlY3Rpb24gY29udmVydGVycwoKIwojIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29u
dmVydGVycwojCiMgZW5kIG9mIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwgY29udmVydGVycwoKIwoj
IERpcmVjdCBEaWdpdGFsIFN5bnRoZXNpcwojCiMgZW5kIG9mIERpcmVjdCBEaWdpdGFsIFN5bnRo
ZXNpcwoKIwojIE5ldHdvcmsgQW5hbHl6ZXIsIEltcGVkYW5jZSBDb252ZXJ0ZXJzCiMKIyBlbmQg
b2YgTmV0d29yayBBbmFseXplciwgSW1wZWRhbmNlIENvbnZlcnRlcnMKCiMKIyBBY3RpdmUgZW5l
cmd5IG1ldGVyaW5nIElDCiMKIyBlbmQgb2YgQWN0aXZlIGVuZXJneSBtZXRlcmluZyBJQwoKIwoj
IFJlc29sdmVyIHRvIGRpZ2l0YWwgY29udmVydGVycwojCiMgZW5kIG9mIFJlc29sdmVyIHRvIGRp
Z2l0YWwgY29udmVydGVycwojIGVuZCBvZiBJSU8gc3RhZ2luZyBkcml2ZXJzCgpDT05GSUdfU1RB
R0lOR19NRURJQT15CiMgQ09ORklHX01PU1RfQ09NUE9ORU5UUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZJRUxEQlVTX0RFViBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEsgaXMgbm90IHNldAoj
IENPTkZJR19IV1NQSU5MT0NLIGlzIG5vdCBzZXQKCiMKIyBDbG9jayBTb3VyY2UgZHJpdmVycwoj
CkNPTkZJR19USU1FUl9PRj15CkNPTkZJR19USU1FUl9QUk9CRT15CkNPTkZJR19NSUNST0NISVBf
UElUNjRCPXkKIyBlbmQgb2YgQ2xvY2sgU291cmNlIGRyaXZlcnMKCkNPTkZJR19NQUlMQk9YPXkK
Q09ORklHX0lPTU1VX0FQST15CkNPTkZJR19JT01NVV9TVVBQT1JUPXkKCiMKIyBHZW5lcmljIElP
TU1VIFBhZ2V0YWJsZSBTdXBwb3J0CiMKIyBlbmQgb2YgR2VuZXJpYyBJT01NVSBQYWdldGFibGUg
U3VwcG9ydAoKIyBDT05GSUdfSU9NTVVfREVCVUdGUyBpcyBub3Qgc2V0CkNPTkZJR19JT01NVV9E
RUZBVUxUX0RNQV9TVFJJQ1Q9eQojIENPTkZJR19JT01NVV9ERUZBVUxUX0RNQV9MQVpZIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU9NTVVfREVGQVVMVF9QQVNTVEhST1VHSCBpcyBub3Qgc2V0CkNPTkZJ
R19PRl9JT01NVT15CkNPTkZJR19TMzkwX0NDV19JT01NVT15CiMgQ09ORklHX1MzOTBfQVBfSU9N
TVUgaXMgbm90IHNldAoKIwojIFJlbW90ZXByb2MgZHJpdmVycwojCkNPTkZJR19SRU1PVEVQUk9D
PXkKIyBDT05GSUdfUkVNT1RFUFJPQ19DREVWIGlzIG5vdCBzZXQKIyBlbmQgb2YgUmVtb3RlcHJv
YyBkcml2ZXJzCgojCiMgUnBtc2cgZHJpdmVycwojCkNPTkZJR19SUE1TRz15CkNPTkZJR19SUE1T
R19DVFJMPXkKQ09ORklHX1JQTVNHX05TPXkKQ09ORklHX1JQTVNHX1ZJUlRJTz15CiMgZW5kIG9m
IFJwbXNnIGRyaXZlcnMKCkNPTkZJR19TT1VORFdJUkU9eQoKIwojIFNvdW5kV2lyZSBEZXZpY2Vz
CiMKCiMKIyBTT0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxv
Z2ljIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQW1sb2dpYyBTb0MgZHJpdmVycwoKIwojIEJyb2Fk
Y29tIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQnJvYWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAv
RnJlZXNjYWxlIFFvcklRIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgTlhQL0ZyZWVzY2FsZSBRb3JJ
USBTb0MgZHJpdmVycwoKIwojIGZ1aml0c3UgU29DIGRyaXZlcnMKIwojIGVuZCBvZiBmdWppdHN1
IFNvQyBkcml2ZXJzCgojCiMgaS5NWCBTb0MgZHJpdmVycwojCiMgZW5kIG9mIGkuTVggU29DIGRy
aXZlcnMKCiMKIyBFbmFibGUgTGl0ZVggU29DIEJ1aWxkZXIgc3BlY2lmaWMgZHJpdmVycwojCiMg
ZW5kIG9mIEVuYWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBkcml2ZXJzCgojCiMgUXVh
bGNvbW0gU29DIGRyaXZlcnMKIwojIGVuZCBvZiBRdWFsY29tbSBTb0MgZHJpdmVycwoKQ09ORklH
X1NPQ19UST15CgojCiMgWGlsaW54IFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgWGlsaW54IFNvQyBk
cml2ZXJzCiMgZW5kIG9mIFNPQyAoU3lzdGVtIE9uIENoaXApIHNwZWNpZmljIERyaXZlcnMKCkNP
TkZJR19QTV9ERVZGUkVRPXkKCiMKIyBERVZGUkVRIEdvdmVybm9ycwojCkNPTkZJR19ERVZGUkVR
X0dPVl9TSU1QTEVfT05ERU1BTkQ9eQpDT05GSUdfREVWRlJFUV9HT1ZfUEVSRk9STUFOQ0U9bQpD
T05GSUdfREVWRlJFUV9HT1ZfUE9XRVJTQVZFPW0KQ09ORklHX0RFVkZSRVFfR09WX1VTRVJTUEFD
RT15CiMgQ09ORklHX0RFVkZSRVFfR09WX1BBU1NJVkUgaXMgbm90IHNldAoKIwojIERFVkZSRVEg
RHJpdmVycwojCkNPTkZJR19QTV9ERVZGUkVRX0VWRU5UPXkKQ09ORklHX0VYVENPTj1tCgojCiMg
RXh0Y29uIERldmljZSBEcml2ZXJzCiMKIyBDT05GSUdfRVhUQ09OX0FEQ19KQUNLIGlzIG5vdCBz
ZXQKQ09ORklHX0VYVENPTl9HUElPPW0KQ09ORklHX0VYVENPTl9NQVgzMzU1PW0KIyBDT05GSUdf
RVhUQ09OX1VTQl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVNT1JZIGlzIG5vdCBzZXQKQ09O
RklHX0lJTz1tCkNPTkZJR19JSU9fQlVGRkVSPXkKQ09ORklHX0lJT19CVUZGRVJfQ0I9bQpDT05G
SUdfSUlPX0JVRkZFUl9ETUE9bQpDT05GSUdfSUlPX0JVRkZFUl9ETUFFTkdJTkU9bQpDT05GSUdf
SUlPX0JVRkZFUl9IV19DT05TVU1FUj1tCkNPTkZJR19JSU9fS0ZJRk9fQlVGPW0KQ09ORklHX0lJ
T19UUklHR0VSRURfQlVGRkVSPW0KQ09ORklHX0lJT19DT05GSUdGUz1tCkNPTkZJR19JSU9fVFJJ
R0dFUj15CkNPTkZJR19JSU9fQ09OU1VNRVJTX1BFUl9UUklHR0VSPTIKIyBDT05GSUdfSUlPX1NX
X0RFVklDRSBpcyBub3Qgc2V0CkNPTkZJR19JSU9fU1dfVFJJR0dFUj1tCkNPTkZJR19JSU9fVFJJ
R0dFUkVEX0VWRU5UPW0KCiMKIyBBY2NlbGVyb21ldGVycwojCkNPTkZJR19CTUE0MDA9bQpDT05G
SUdfQk1DMTUwX0FDQ0VMPW0KQ09ORklHX0tYU0Q5PW0KIyBlbmQgb2YgQWNjZWxlcm9tZXRlcnMK
CiMKIyBBbmFsb2cgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMKIyBDT05GSUdfRU5WRUxPUEVfREVU
RUNUT1IgaXMgbm90IHNldAojIENPTkZJR19IWDcxMSBpcyBub3Qgc2V0CkNPTkZJR19RQ09NX1ZB
RENfQ09NTU9OPW0KQ09ORklHX1FDT01fU1BNSV9JQURDPW0KQ09ORklHX1FDT01fU1BNSV9WQURD
PW0KQ09ORklHX1FDT01fU1BNSV9BREM1PW0KIyBDT05GSUdfU0RfQURDX01PRFVMQVRPUiBpcyBu
b3Qgc2V0CiMgZW5kIG9mIEFuYWxvZyB0byBkaWdpdGFsIGNvbnZlcnRlcnMKCiMKIyBBbmFsb2cg
dG8gZGlnaXRhbCBhbmQgZGlnaXRhbCB0byBhbmFsb2cgY29udmVydGVycwojCiMgZW5kIG9mIEFu
YWxvZyB0byBkaWdpdGFsIGFuZCBkaWdpdGFsIHRvIGFuYWxvZyBjb252ZXJ0ZXJzCgojCiMgQW5h
bG9nIEZyb250IEVuZHMKIwojIENPTkZJR19JSU9fUkVTQ0FMRSBpcyBub3Qgc2V0CiMgZW5kIG9m
IEFuYWxvZyBGcm9udCBFbmRzCgojCiMgQW1wbGlmaWVycwojCkNPTkZJR19ITUM0MjU9bQojIGVu
ZCBvZiBBbXBsaWZpZXJzCgojCiMgQ2FwYWNpdGFuY2UgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMK
IyBlbmQgb2YgQ2FwYWNpdGFuY2UgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCgojCiMgQ2hlbWljYWwg
U2Vuc29ycwojCiMgQ09ORklHX1NDRDMwX0NPUkUgaXMgbm90IHNldAojIGVuZCBvZiBDaGVtaWNh
bCBTZW5zb3JzCgojCiMgSGlkIFNlbnNvciBJSU8gQ29tbW9uCiMKIyBlbmQgb2YgSGlkIFNlbnNv
ciBJSU8gQ29tbW9uCgojCiMgSUlPIFNDTUkgU2Vuc29ycwojCiMgZW5kIG9mIElJTyBTQ01JIFNl
bnNvcnMKCiMKIyBTU1AgU2Vuc29yIENvbW1vbgojCiMgZW5kIG9mIFNTUCBTZW5zb3IgQ29tbW9u
CgojCiMgRGlnaXRhbCB0byBhbmFsb2cgY29udmVydGVycwojCkNPTkZJR19EUE9UX0RBQz1tCiMg
ZW5kIG9mIERpZ2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKCiMKIyBJSU8gZHVtbXkgZHJpdmVy
CiMKIyBlbmQgb2YgSUlPIGR1bW15IGRyaXZlcgoKIwojIEZpbHRlcnMKIwojIGVuZCBvZiBGaWx0
ZXJzCgojCiMgRnJlcXVlbmN5IFN5bnRoZXNpemVycyBERFMvUExMCiMKCiMKIyBDbG9jayBHZW5l
cmF0b3IvRGlzdHJpYnV0aW9uCiMKIyBlbmQgb2YgQ2xvY2sgR2VuZXJhdG9yL0Rpc3RyaWJ1dGlv
bgoKIwojIFBoYXNlLUxvY2tlZCBMb29wIChQTEwpIGZyZXF1ZW5jeSBzeW50aGVzaXplcnMKIwoj
IGVuZCBvZiBQaGFzZS1Mb2NrZWQgTG9vcCAoUExMKSBmcmVxdWVuY3kgc3ludGhlc2l6ZXJzCiMg
ZW5kIG9mIEZyZXF1ZW5jeSBTeW50aGVzaXplcnMgRERTL1BMTAoKIwojIERpZ2l0YWwgZ3lyb3Nj
b3BlIHNlbnNvcnMKIwojIGVuZCBvZiBEaWdpdGFsIGd5cm9zY29wZSBzZW5zb3JzCgojCiMgSGVh
bHRoIFNlbnNvcnMKIwoKIwojIEhlYXJ0IFJhdGUgTW9uaXRvcnMKIwojIGVuZCBvZiBIZWFydCBS
YXRlIE1vbml0b3JzCiMgZW5kIG9mIEhlYWx0aCBTZW5zb3JzCgojCiMgSHVtaWRpdHkgc2Vuc29y
cwojCiMgQ09ORklHX0RIVDExIGlzIG5vdCBzZXQKIyBlbmQgb2YgSHVtaWRpdHkgc2Vuc29ycwoK
IwojIEluZXJ0aWFsIG1lYXN1cmVtZW50IHVuaXRzCiMKIyBlbmQgb2YgSW5lcnRpYWwgbWVhc3Vy
ZW1lbnQgdW5pdHMKCiMKIyBMaWdodCBzZW5zb3JzCiMKIyBDT05GSUdfQ00zNjA1IGlzIG5vdCBz
ZXQKIyBlbmQgb2YgTGlnaHQgc2Vuc29ycwoKIwojIE1hZ25ldG9tZXRlciBzZW5zb3JzCiMKIyBl
bmQgb2YgTWFnbmV0b21ldGVyIHNlbnNvcnMKCiMKIyBNdWx0aXBsZXhlcnMKIwojIENPTkZJR19J
SU9fTVVYIGlzIG5vdCBzZXQKIyBlbmQgb2YgTXVsdGlwbGV4ZXJzCgojCiMgSW5jbGlub21ldGVy
IHNlbnNvcnMKIwojIGVuZCBvZiBJbmNsaW5vbWV0ZXIgc2Vuc29ycwoKIwojIFRyaWdnZXJzIC0g
c3RhbmRhbG9uZQojCkNPTkZJR19JSU9fSFJUSU1FUl9UUklHR0VSPW0KQ09ORklHX0lJT19JTlRF
UlJVUFRfVFJJR0dFUj1tCiMgQ09ORklHX0lJT19USUdIVExPT1BfVFJJR0dFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0lJT19TWVNGU19UUklHR0VSIGlzIG5vdCBzZXQKIyBlbmQgb2YgVHJpZ2dlcnMg
LSBzdGFuZGFsb25lCgojCiMgTGluZWFyIGFuZCBhbmd1bGFyIHBvc2l0aW9uIHNlbnNvcnMKIwoj
IGVuZCBvZiBMaW5lYXIgYW5kIGFuZ3VsYXIgcG9zaXRpb24gc2Vuc29ycwoKIwojIERpZ2l0YWwg
cG90ZW50aW9tZXRlcnMKIwojIGVuZCBvZiBEaWdpdGFsIHBvdGVudGlvbWV0ZXJzCgojCiMgRGln
aXRhbCBwb3RlbnRpb3N0YXRzCiMKIyBlbmQgb2YgRGlnaXRhbCBwb3RlbnRpb3N0YXRzCgojCiMg
UHJlc3N1cmUgc2Vuc29ycwojCkNPTkZJR19NUzU2MTE9bQpDT05GSUdfWlBBMjMyNj1tCiMgZW5k
IG9mIFByZXNzdXJlIHNlbnNvcnMKCiMKIyBMaWdodG5pbmcgc2Vuc29ycwojCiMgZW5kIG9mIExp
Z2h0bmluZyBzZW5zb3JzCgojCiMgUHJveGltaXR5IGFuZCBkaXN0YW5jZSBzZW5zb3JzCiMKQ09O
RklHX1BJTkc9bQpDT05GSUdfU1JGMDQ9bQojIGVuZCBvZiBQcm94aW1pdHkgYW5kIGRpc3RhbmNl
IHNlbnNvcnMKCiMKIyBSZXNvbHZlciB0byBkaWdpdGFsIGNvbnZlcnRlcnMKIwojIGVuZCBvZiBS
ZXNvbHZlciB0byBkaWdpdGFsIGNvbnZlcnRlcnMKCiMKIyBUZW1wZXJhdHVyZSBzZW5zb3JzCiMK
IyBlbmQgb2YgVGVtcGVyYXR1cmUgc2Vuc29ycwoKQ09ORklHX1BXTT15CkNPTkZJR19QV01fU1lT
RlM9eQojIENPTkZJR19QV01fREVCVUcgaXMgbm90IHNldApDT05GSUdfUFdNX0FUTUVMX1RDQj15
CgojCiMgSVJRIGNoaXAgc3VwcG9ydAojCkNPTkZJR19JUlFDSElQPXkKQ09ORklHX0FMX0ZJQz15
CiMgZW5kIG9mIElSUSBjaGlwIHN1cHBvcnQKCkNPTkZJR19SRVNFVF9DT05UUk9MTEVSPXkKQ09O
RklHX1JFU0VUX1RJX1RQUzM4MFg9eQoKIwojIFBIWSBTdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJ
Q19QSFk9eQpDT05GSUdfUEhZX0NBTl9UUkFOU0NFSVZFUj15CgojCiMgUEhZIGRyaXZlcnMgZm9y
IEJyb2FkY29tIHBsYXRmb3JtcwojCiMgZW5kIG9mIFBIWSBkcml2ZXJzIGZvciBCcm9hZGNvbSBw
bGF0Zm9ybXMKIyBlbmQgb2YgUEhZIFN1YnN5c3RlbQoKIyBDT05GSUdfUE9XRVJDQVAgaXMgbm90
IHNldAoKIwojIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAojCiMgZW5kIG9mIFBlcmZvcm1h
bmNlIG1vbml0b3Igc3VwcG9ydAoKIyBDT05GSUdfUkFTIGlzIG5vdCBzZXQKCiMKIyBBbmRyb2lk
CiMKQ09ORklHX0FORFJPSURfQklOREVSX0lQQz15CkNPTkZJR19BTkRST0lEX0JJTkRFUkZTPXkK
Q09ORklHX0FORFJPSURfQklOREVSX0RFVklDRVM9ImJpbmRlcixod2JpbmRlcix2bmRiaW5kZXIi
CkNPTkZJR19BTkRST0lEX0JJTkRFUl9JUENfU0VMRlRFU1Q9eQojIGVuZCBvZiBBbmRyb2lkCgoj
IENPTkZJR19EQVggaXMgbm90IHNldApDT05GSUdfTlZNRU09eQojIENPTkZJR19OVk1FTV9TWVNG
UyBpcyBub3Qgc2V0CkNPTkZJR19OVk1FTV9TUE1JX1NEQU09bQoKIwojIEhXIHRyYWNpbmcgc3Vw
cG9ydAojCiMgQ09ORklHX1NUTSBpcyBub3Qgc2V0CiMgZW5kIG9mIEhXIHRyYWNpbmcgc3VwcG9y
dAoKQ09ORklHX0ZQR0E9eQpDT05GSUdfQUxURVJBX1BSX0lQX0NPUkU9bQpDT05GSUdfRlBHQV9C
UklER0U9eQpDT05GSUdfRlBHQV9SRUdJT049eQojIENPTkZJR19PRl9GUEdBX1JFR0lPTiBpcyBu
b3Qgc2V0CkNPTkZJR19GU0k9bQpDT05GSUdfRlNJX05FV19ERVZfTk9ERT15CkNPTkZJR19GU0lf
TUFTVEVSX0dQSU89bQojIENPTkZJR19GU0lfTUFTVEVSX0hVQiBpcyBub3Qgc2V0CkNPTkZJR19G
U0lfU0NPTT1tCkNPTkZJR19NVUxUSVBMRVhFUj15CgojCiMgTXVsdGlwbGV4ZXIgZHJpdmVycwoj
CiMgQ09ORklHX01VWF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTVVYX01NSU8gaXMgbm90IHNl
dAojIGVuZCBvZiBNdWx0aXBsZXhlciBkcml2ZXJzCgpDT05GSUdfUE1fT1BQPXkKQ09ORklHX1NJ
T1g9eQpDT05GSUdfU0lPWF9CVVNfR1BJTz1tCiMgQ09ORklHX1NMSU1CVVMgaXMgbm90IHNldApD
T05GSUdfSU5URVJDT05ORUNUPXkKQ09ORklHX0NPVU5URVI9eQpDT05GSUdfSU5URVJSVVBUX0NO
VD1tCkNPTkZJR19NT1NUPW0KIyBDT05GSUdfTU9TVF9DREVWIGlzIG5vdCBzZXQKQ09ORklHX1BF
Q0k9eQpDT05GSUdfUEVDSV9DUFU9eQojIENPTkZJR19IVEUgaXMgbm90IHNldAojIGVuZCBvZiBE
ZXZpY2UgRHJpdmVycwoKIwojIEZpbGUgc3lzdGVtcwojCiMgQ09ORklHX1ZBTElEQVRFX0ZTX1BB
UlNFUiBpcyBub3Qgc2V0CkNPTkZJR19FWFBPUlRGUz15CkNPTkZJR19FWFBPUlRGU19CTE9DS19P
UFM9eQojIENPTkZJR19GSUxFX0xPQ0tJTkcgaXMgbm90IHNldAojIENPTkZJR19GU19FTkNSWVBU
SU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRlNfVkVSSVRZIGlzIG5vdCBzZXQKQ09ORklHX0ZTTk9U
SUZZPXkKQ09ORklHX0ROT1RJRlk9eQpDT05GSUdfSU5PVElGWV9VU0VSPXkKIyBDT05GSUdfRkFO
T1RJRlkgaXMgbm90IHNldApDT05GSUdfUVVPVEE9eQojIENPTkZJR19QUklOVF9RVU9UQV9XQVJO
SU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfUVVPVEFfREVCVUcgaXMgbm90IHNldApDT05GSUdfUVVP
VEFfVFJFRT1tCiMgQ09ORklHX1FGTVRfVjEgaXMgbm90IHNldApDT05GSUdfUUZNVF9WMj1tCkNP
TkZJR19RVU9UQUNUTD15CiMgQ09ORklHX0FVVE9GUzRfRlMgaXMgbm90IHNldApDT05GSUdfQVVU
T0ZTX0ZTPW0KIyBDT05GSUdfRlVTRV9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09WRVJMQVlfRlMg
aXMgbm90IHNldAoKIwojIENhY2hlcwojCkNPTkZJR19ORVRGU19TVVBQT1JUPXkKQ09ORklHX05F
VEZTX1NUQVRTPXkKQ09ORklHX0ZTQ0FDSEU9eQpDT05GSUdfRlNDQUNIRV9TVEFUUz15CiMgQ09O
RklHX0ZTQ0FDSEVfREVCVUcgaXMgbm90IHNldAojIGVuZCBvZiBDYWNoZXMKCiMKIyBQc2V1ZG8g
ZmlsZXN5c3RlbXMKIwpDT05GSUdfUFJPQ19GUz15CkNPTkZJR19QUk9DX0tDT1JFPXkKIyBDT05G
SUdfUFJPQ19WTUNPUkUgaXMgbm90IHNldAojIENPTkZJR19QUk9DX1NZU0NUTCBpcyBub3Qgc2V0
CkNPTkZJR19QUk9DX1BBR0VfTU9OSVRPUj15CkNPTkZJR19QUk9DX0NISUxEUkVOPXkKQ09ORklH
X0tFUk5GUz15CkNPTkZJR19TWVNGUz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0hVR0VUTEJGUz15
CiMgQ09ORklHX0hVR0VUTEJGUyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19Q
QUdFPXkKQ09ORklHX0NPTkZJR0ZTX0ZTPW0KIyBlbmQgb2YgUHNldWRvIGZpbGVzeXN0ZW1zCgoj
IENPTkZJR19NSVNDX0ZJTEVTWVNURU1TIGlzIG5vdCBzZXQKQ09ORklHX05MUz1tCkNPTkZJR19O
TFNfREVGQVVMVD0iaXNvODg1OS0xIgpDT05GSUdfTkxTX0NPREVQQUdFXzQzNz1tCiMgQ09ORklH
X05MU19DT0RFUEFHRV83MzcgaXMgbm90IHNldApDT05GSUdfTkxTX0NPREVQQUdFXzc3NT1tCkNP
TkZJR19OTFNfQ09ERVBBR0VfODUwPW0KQ09ORklHX05MU19DT0RFUEFHRV84NTI9bQpDT05GSUdf
TkxTX0NPREVQQUdFXzg1NT1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODU3PW0KQ09ORklHX05MU19D
T0RFUEFHRV84NjA9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg2MT1tCiMgQ09ORklHX05MU19DT0RF
UEFHRV84NjIgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYzIGlzIG5vdCBzZXQK
Q09ORklHX05MU19DT0RFUEFHRV84NjQ9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg2NT1tCkNPTkZJ
R19OTFNfQ09ERVBBR0VfODY2PW0KQ09ORklHX05MU19DT0RFUEFHRV84Njk9bQpDT05GSUdfTkxT
X0NPREVQQUdFXzkzNj1tCkNPTkZJR19OTFNfQ09ERVBBR0VfOTUwPW0KQ09ORklHX05MU19DT0RF
UEFHRV85MzI9bQpDT05GSUdfTkxTX0NPREVQQUdFXzk0OT1tCkNPTkZJR19OTFNfQ09ERVBBR0Vf
ODc0PW0KIyBDT05GSUdfTkxTX0lTTzg4NTlfOCBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBB
R0VfMTI1MD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfMTI1MT1tCkNPTkZJR19OTFNfQVNDSUk9bQoj
IENPTkZJR19OTFNfSVNPODg1OV8xIGlzIG5vdCBzZXQKQ09ORklHX05MU19JU084ODU5XzI9bQpD
T05GSUdfTkxTX0lTTzg4NTlfMz1tCiMgQ09ORklHX05MU19JU084ODU5XzQgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfSVNPODg1OV81IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfNiBp
cyBub3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV83PW0KQ09ORklHX05MU19JU084ODU5Xzk9bQpD
T05GSUdfTkxTX0lTTzg4NTlfMTM9bQpDT05GSUdfTkxTX0lTTzg4NTlfMTQ9bQpDT05GSUdfTkxT
X0lTTzg4NTlfMTU9bQojIENPTkZJR19OTFNfS09JOF9SIGlzIG5vdCBzZXQKQ09ORklHX05MU19L
T0k4X1U9bQpDT05GSUdfTkxTX01BQ19ST01BTj1tCkNPTkZJR19OTFNfTUFDX0NFTFRJQz1tCkNP
TkZJR19OTFNfTUFDX0NFTlRFVVJPPW0KQ09ORklHX05MU19NQUNfQ1JPQVRJQU49bQpDT05GSUdf
TkxTX01BQ19DWVJJTExJQz1tCiMgQ09ORklHX05MU19NQUNfR0FFTElDIGlzIG5vdCBzZXQKQ09O
RklHX05MU19NQUNfR1JFRUs9bQojIENPTkZJR19OTFNfTUFDX0lDRUxBTkQgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfTUFDX0lOVUlUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19ST01BTklB
TiBpcyBub3Qgc2V0CkNPTkZJR19OTFNfTUFDX1RVUktJU0g9bQpDT05GSUdfTkxTX1VURjg9bQpD
T05GSUdfVU5JQ09ERT1tCkNPTkZJR19VTklDT0RFX05PUk1BTElaQVRJT05fU0VMRlRFU1Q9bQoj
IGVuZCBvZiBGaWxlIHN5c3RlbXMKCiMKIyBTZWN1cml0eSBvcHRpb25zCiMKQ09ORklHX0tFWVM9
eQojIENPTkZJR19LRVlTX1JFUVVFU1RfQ0FDSEUgaXMgbm90IHNldApDT05GSUdfUEVSU0lTVEVO
VF9LRVlSSU5HUz15CiMgQ09ORklHX1RSVVNURURfS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VO
Q1JZUFRFRF9LRVlTIGlzIG5vdCBzZXQKQ09ORklHX0tFWV9ESF9PUEVSQVRJT05TPXkKQ09ORklH
X0tFWV9OT1RJRklDQVRJT05TPXkKQ09ORklHX1NFQ1VSSVRZX0RNRVNHX1JFU1RSSUNUPXkKIyBD
T05GSUdfU0VDVVJJVFkgaXMgbm90IHNldApDT05GSUdfU0VDVVJJVFlGUz15CkNPTkZJR19IQVZF
X0hBUkRFTkVEX1VTRVJDT1BZX0FMTE9DQVRPUj15CiMgQ09ORklHX0hBUkRFTkVEX1VTRVJDT1BZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfRk9SVElGWV9TT1VSQ0UgaXMgbm90IHNldAojIENPTkZJR19T
VEFUSUNfVVNFUk1PREVIRUxQRVIgaXMgbm90IHNldAojIENPTkZJR19JTUFfU0VDVVJFX0FORF9P
Ul9UUlVTVEVEX0JPT1QgaXMgbm90IHNldApDT05GSUdfREVGQVVMVF9TRUNVUklUWV9EQUM9eQpD
T05GSUdfTFNNPSJsYW5kbG9jayxsb2NrZG93bix5YW1hLGxvYWRwaW4sc2FmZXNldGlkLGludGVn
cml0eSxicGYiCgojCiMgS2VybmVsIGhhcmRlbmluZyBvcHRpb25zCiMKCiMKIyBNZW1vcnkgaW5p
dGlhbGl6YXRpb24KIwpDT05GSUdfQ0NfSEFTX0FVVE9fVkFSX0lOSVRfUEFUVEVSTj15CkNPTkZJ
R19DQ19IQVNfQVVUT19WQVJfSU5JVF9aRVJPPXkKQ09ORklHX0lOSVRfU1RBQ0tfTk9ORT15CiMg
Q09ORklHX0lOSVRfU1RBQ0tfQUxMX1BBVFRFUk4gaXMgbm90IHNldAojIENPTkZJR19JTklUX1NU
QUNLX0FMTF9aRVJPIGlzIG5vdCBzZXQKQ09ORklHX0lOSVRfT05fQUxMT0NfREVGQVVMVF9PTj15
CkNPTkZJR19JTklUX09OX0ZSRUVfREVGQVVMVF9PTj15CiMgZW5kIG9mIE1lbW9yeSBpbml0aWFs
aXphdGlvbgoKQ09ORklHX0NDX0hBU19SQU5EU1RSVUNUPXkKIyBDT05GSUdfUkFORFNUUlVDVF9O
T05FIGlzIG5vdCBzZXQKQ09ORklHX1JBTkRTVFJVQ1RfRlVMTD15CkNPTkZJR19SQU5EU1RSVUNU
PXkKIyBlbmQgb2YgS2VybmVsIGhhcmRlbmluZyBvcHRpb25zCiMgZW5kIG9mIFNlY3VyaXR5IG9w
dGlvbnMKCkNPTkZJR19DUllQVE89eQoKIwojIENyeXB0byBjb3JlIG9yIGhlbHBlcgojCiMgQ09O
RklHX0NSWVBUT19GSVBTIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19BTEdBUEk9eQpDT05GSUdf
Q1JZUFRPX0FMR0FQSTI9eQpDT05GSUdfQ1JZUFRPX0FFQUQ9eQpDT05GSUdfQ1JZUFRPX0FFQUQy
PXkKQ09ORklHX0NSWVBUT19TS0NJUEhFUj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVIyPXkKQ09O
RklHX0NSWVBUT19IQVNIPXkKQ09ORklHX0NSWVBUT19IQVNIMj15CkNPTkZJR19DUllQVE9fUk5H
PXkKQ09ORklHX0NSWVBUT19STkcyPXkKQ09ORklHX0NSWVBUT19STkdfREVGQVVMVD15CkNPTkZJ
R19DUllQVE9fQUtDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19BS0NJUEhFUj15CkNPTkZJR19DUllQ
VE9fS1BQMj15CkNPTkZJR19DUllQVE9fS1BQPXkKQ09ORklHX0NSWVBUT19BQ09NUDI9eQpDT05G
SUdfQ1JZUFRPX01BTkFHRVI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVIyPXkKIyBDT05GSUdfQ1JZ
UFRPX01BTkFHRVJfRElTQUJMRV9URVNUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19NQU5B
R0VSX0VYVFJBX1RFU1RTIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19HRjEyOE1VTD1tCkNPTkZJ
R19DUllQVE9fTlVMTD15CkNPTkZJR19DUllQVE9fTlVMTDI9eQojIENPTkZJR19DUllQVE9fUENS
WVBUIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19DUllQVEQ9bQpDT05GSUdfQ1JZUFRPX0FVVEhF
TkM9eQojIENPTkZJR19DUllQVE9fVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRU5HSU5F
PXkKCiMKIyBQdWJsaWMta2V5IGNyeXB0b2dyYXBoeQojCkNPTkZJR19DUllQVE9fUlNBPXkKQ09O
RklHX0NSWVBUT19ESD15CiMgQ09ORklHX0NSWVBUT19ESF9SRkM3OTE5X0dST1VQUyBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fRUNDPXkKQ09ORklHX0NSWVBUT19FQ0RIPW0KQ09ORklHX0NSWVBU
T19FQ0RTQT1tCkNPTkZJR19DUllQVE9fRUNSRFNBPXkKIyBDT05GSUdfQ1JZUFRPX1NNMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DVVJWRTI1NTE5IGlzIG5vdCBzZXQKCiMKIyBBdXRoZW50
aWNhdGVkIEVuY3J5cHRpb24gd2l0aCBBc3NvY2lhdGVkIERhdGEKIwpDT05GSUdfQ1JZUFRPX0ND
TT1tCiMgQ09ORklHX0NSWVBUT19HQ00gaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0NIQUNIQTIw
UE9MWTEzMDU9bQpDT05GSUdfQ1JZUFRPX0FFR0lTMTI4PW0KQ09ORklHX0NSWVBUT19TRVFJVj1t
CkNPTkZJR19DUllQVE9fRUNIQUlOSVY9bQoKIwojIEJsb2NrIG1vZGVzCiMKQ09ORklHX0NSWVBU
T19DQkM9eQojIENPTkZJR19DUllQVE9fQ0ZCIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19DVFI9
eQpDT05GSUdfQ1JZUFRPX0NUUz15CkNPTkZJR19DUllQVE9fRUNCPXkKQ09ORklHX0NSWVBUT19M
Ulc9bQpDT05GSUdfQ1JZUFRPX09GQj15CiMgQ09ORklHX0NSWVBUT19QQ0JDIGlzIG5vdCBzZXQK
Q09ORklHX0NSWVBUT19YVFM9eQpDT05GSUdfQ1JZUFRPX0tFWVdSQVA9bQpDT05GSUdfQ1JZUFRP
X05IUE9MWTEzMDU9bQpDT05GSUdfQ1JZUFRPX0FESUFOVFVNPW0KIyBDT05GSUdfQ1JZUFRPX0hD
VFIyIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19FU1NJVj15CgojCiMgSGFzaCBtb2RlcwojCkNP
TkZJR19DUllQVE9fQ01BQz15CkNPTkZJR19DUllQVE9fSE1BQz15CkNPTkZJR19DUllQVE9fWENC
Qz1tCiMgQ09ORklHX0NSWVBUT19WTUFDIGlzIG5vdCBzZXQKCiMKIyBEaWdlc3QKIwojIENPTkZJ
R19DUllQVE9fQ1JDMzJDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NSQzMyIGlzIG5vdCBz
ZXQKQ09ORklHX0NSWVBUT19DUkMzMl9TMzkwPW0KIyBDT05GSUdfQ1JZUFRPX1hYSEFTSCBpcyBu
b3Qgc2V0CkNPTkZJR19DUllQVE9fQkxBS0UyQj15CiMgQ09ORklHX0NSWVBUT19DUkNUMTBESUYg
aXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0NSQzY0X1JPQ0tTT0ZUPW0KIyBDT05GSUdfQ1JZUFRP
X0dIQVNIIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19QT0xZMTMwNT15CiMgQ09ORklHX0NSWVBU
T19NRDQgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX01ENT15CkNPTkZJR19DUllQVE9fTUlDSEFF
TF9NSUM9bQpDT05GSUdfQ1JZUFRPX1JNRDE2MD15CkNPTkZJR19DUllQVE9fU0hBMT15CiMgQ09O
RklHX0NSWVBUT19TSEE1MTJfUzM5MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TSEExX1Mz
OTAgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1NIQTI1Nj15CiMgQ09ORklHX0NSWVBUT19TSEEy
NTZfUzM5MCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fU0hBNTEyPXkKQ09ORklHX0NSWVBUT19T
SEEzPXkKQ09ORklHX0NSWVBUT19TSEEzXzI1Nl9TMzkwPW0KQ09ORklHX0NSWVBUT19TSEEzXzUx
Ml9TMzkwPXkKQ09ORklHX0NSWVBUT19TTTM9eQpDT05GSUdfQ1JZUFRPX1NNM19HRU5FUklDPXkK
Q09ORklHX0NSWVBUT19TVFJFRUJPRz15CiMgQ09ORklHX0NSWVBUT19XUDUxMiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19HSEFTSF9TMzkwIGlzIG5vdCBzZXQKCiMKIyBDaXBoZXJzCiMKQ09O
RklHX0NSWVBUT19BRVM9eQpDT05GSUdfQ1JZUFRPX0FFU19UST1tCkNPTkZJR19DUllQVE9fQUVT
X1MzOTA9eQpDT05GSUdfQ1JZUFRPX0JMT1dGSVNIPW0KQ09ORklHX0NSWVBUT19CTE9XRklTSF9D
T01NT049bQpDT05GSUdfQ1JZUFRPX0NBTUVMTElBPW0KQ09ORklHX0NSWVBUT19DQVNUX0NPTU1P
Tj1tCkNPTkZJR19DUllQVE9fQ0FTVDU9bQojIENPTkZJR19DUllQVE9fQ0FTVDYgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fREVTIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVNfUzM5MD1t
CkNPTkZJR19DUllQVE9fRkNSWVBUPW0KQ09ORklHX0NSWVBUT19DSEFDSEEyMD15CkNPTkZJR19D
UllQVE9fQ0hBQ0hBX1MzOTA9bQpDT05GSUdfQ1JZUFRPX0FSSUE9eQpDT05GSUdfQ1JZUFRPX1NF
UlBFTlQ9eQpDT05GSUdfQ1JZUFRPX1NNND15CiMgQ09ORklHX0NSWVBUT19TTTRfR0VORVJJQyBp
cyBub3Qgc2V0CkNPTkZJR19DUllQVE9fVFdPRklTSD15CkNPTkZJR19DUllQVE9fVFdPRklTSF9D
T01NT049eQoKIwojIENvbXByZXNzaW9uCiMKQ09ORklHX0NSWVBUT19ERUZMQVRFPW0KIyBDT05G
SUdfQ1JZUFRPX0xaTyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fODQyPXkKQ09ORklHX0NSWVBU
T19MWjQ9bQpDT05GSUdfQ1JZUFRPX0xaNEhDPXkKIyBDT05GSUdfQ1JZUFRPX1pTVEQgaXMgbm90
IHNldAoKIwojIFJhbmRvbSBOdW1iZXIgR2VuZXJhdGlvbgojCiMgQ09ORklHX0NSWVBUT19BTlNJ
X0NQUk5HIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19EUkJHX01FTlU9eQpDT05GSUdfQ1JZUFRP
X0RSQkdfSE1BQz15CiMgQ09ORklHX0NSWVBUT19EUkJHX0hBU0ggaXMgbm90IHNldApDT05GSUdf
Q1JZUFRPX0RSQkdfQ1RSPXkKQ09ORklHX0NSWVBUT19EUkJHPXkKQ09ORklHX0NSWVBUT19KSVRU
RVJFTlRST1BZPXkKQ09ORklHX0NSWVBUT19LREY4MDAxMDhfQ1RSPXkKQ09ORklHX0NSWVBUT19I
QVNIX0lORk89eQpDT05GSUdfQ1JZUFRPX0hXPXkKQ09ORklHX1pDUllQVD15CiMgQ09ORklHX1pD
UllQVF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19aQ1JZUFRfTVVMVElERVZOT0RFUz15CkNPTkZJ
R19QS0VZPW0KIyBDT05GSUdfQ1JZUFRPX1BBRVNfUzM5MCBpcyBub3Qgc2V0CkNPTkZJR19TMzkw
X1BSTkc9eQpDT05GSUdfQ1JZUFRPX0RFVl9WSVJUSU89eQpDT05GSUdfQ1JZUFRPX0RFVl9DQ1JF
RT15CkNPTkZJR19BU1lNTUVUUklDX0tFWV9UWVBFPXkKQ09ORklHX0FTWU1NRVRSSUNfUFVCTElD
X0tFWV9TVUJUWVBFPXkKQ09ORklHX1g1MDlfQ0VSVElGSUNBVEVfUEFSU0VSPXkKQ09ORklHX1BL
Q1M4X1BSSVZBVEVfS0VZX1BBUlNFUj15CkNPTkZJR19QS0NTN19NRVNTQUdFX1BBUlNFUj15CkNP
TkZJR19QS0NTN19URVNUX0tFWT15CiMgQ09ORklHX1NJR05FRF9QRV9GSUxFX1ZFUklGSUNBVElP
TiBpcyBub3Qgc2V0CkNPTkZJR19GSVBTX1NJR05BVFVSRV9TRUxGVEVTVD15CgojCiMgQ2VydGlm
aWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKIwpDT05GSUdfTU9EVUxFX1NJR19LRVk9ImNl
cnRzL3NpZ25pbmdfa2V5LnBlbSIKQ09ORklHX01PRFVMRV9TSUdfS0VZX1RZUEVfUlNBPXkKIyBD
T05GSUdfTU9EVUxFX1NJR19LRVlfVFlQRV9FQ0RTQSBpcyBub3Qgc2V0CkNPTkZJR19TWVNURU1f
VFJVU1RFRF9LRVlSSU5HPXkKQ09ORklHX1NZU1RFTV9UUlVTVEVEX0tFWVM9IiIKQ09ORklHX1NZ
U1RFTV9FWFRSQV9DRVJUSUZJQ0FURT15CkNPTkZJR19TWVNURU1fRVhUUkFfQ0VSVElGSUNBVEVf
U0laRT00MDk2CkNPTkZJR19TRUNPTkRBUllfVFJVU1RFRF9LRVlSSU5HPXkKIyBDT05GSUdfU1lT
VEVNX0JMQUNLTElTVF9LRVlSSU5HIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2VydGlmaWNhdGVzIGZv
ciBzaWduYXR1cmUgY2hlY2tpbmcKCiMKIyBMaWJyYXJ5IHJvdXRpbmVzCiMKIyBDT05GSUdfUEFD
S0lORyBpcyBub3Qgc2V0CkNPTkZJR19CSVRSRVZFUlNFPXkKQ09ORklHX0dFTkVSSUNfU1RSTkNQ
WV9GUk9NX1VTRVI9eQpDT05GSUdfR0VORVJJQ19TVFJOTEVOX1VTRVI9eQpDT05GSUdfQ09SRElD
PW0KIyBDT05GSUdfUFJJTUVfTlVNQkVSUyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1VTRV9DTVBY
Q0hHX0xPQ0tSRUY9eQoKIwojIENyeXB0byBsaWJyYXJ5IHJvdXRpbmVzCiMKQ09ORklHX0NSWVBU
T19MSUJfQUVTPXkKQ09ORklHX0NSWVBUT19MSUJfQkxBS0UyU19HRU5FUklDPXkKQ09ORklHX0NS
WVBUT19BUkNIX0hBVkVfTElCX0NIQUNIQT1tCkNPTkZJR19DUllQVE9fTElCX0NIQUNIQV9HRU5F
UklDPXkKQ09ORklHX0NSWVBUT19MSUJfQ0hBQ0hBPW0KQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUy
NTUxOV9HRU5FUklDPW0KQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUyNTUxOT1tCkNPTkZJR19DUllQ
VE9fTElCX0RFUz15CkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1X1JTSVpFPTEKQ09ORklHX0NS
WVBUT19MSUJfUE9MWTEzMDVfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1PXkK
IyBDT05GSUdfQ1JZUFRPX0xJQl9DSEFDSEEyMFBPTFkxMzA1IGlzIG5vdCBzZXQKQ09ORklHX0NS
WVBUT19MSUJfU0hBMT15CkNPTkZJR19DUllQVE9fTElCX1NIQTI1Nj15CiMgZW5kIG9mIENyeXB0
byBsaWJyYXJ5IHJvdXRpbmVzCgpDT05GSUdfTElCX01FTU5FUT15CkNPTkZJR19DUkNfQ0NJVFQ9
eQpDT05GSUdfQ1JDMTY9bQojIENPTkZJR19DUkNfVDEwRElGIGlzIG5vdCBzZXQKQ09ORklHX0NS
QzY0X1JPQ0tTT0ZUPW0KQ09ORklHX0NSQ19JVFVfVD15CkNPTkZJR19DUkMzMj15CiMgQ09ORklH
X0NSQzMyX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDMzJfU0xJQ0VCWTggaXMgbm90
IHNldAojIENPTkZJR19DUkMzMl9TTElDRUJZNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX1NB
UldBVEUgaXMgbm90IHNldApDT05GSUdfQ1JDMzJfQklUPXkKQ09ORklHX0NSQzY0PW0KQ09ORklH
X0NSQzQ9eQpDT05GSUdfQ1JDNz1tCiMgQ09ORklHX0xJQkNSQzMyQyBpcyBub3Qgc2V0CiMgQ09O
RklHX0NSQzggaXMgbm90IHNldApDT05GSUdfWFhIQVNIPXkKIyBDT05GSUdfUkFORE9NMzJfU0VM
RlRFU1QgaXMgbm90IHNldApDT05GSUdfODQyX0NPTVBSRVNTPXkKQ09ORklHXzg0Ml9ERUNPTVBS
RVNTPXkKQ09ORklHX1pMSUJfSU5GTEFURT1tCkNPTkZJR19aTElCX0RFRkxBVEU9bQojIENPTkZJ
R19aTElCX0RGTFRDQyBpcyBub3Qgc2V0CkNPTkZJR19MWk9fREVDT01QUkVTUz15CkNPTkZJR19M
WjRfQ09NUFJFU1M9bQpDT05GSUdfTFo0SENfQ09NUFJFU1M9eQpDT05GSUdfTFo0X0RFQ09NUFJF
U1M9eQpDT05GSUdfWlNURF9ERUNPTVBSRVNTPXkKQ09ORklHX1haX0RFQz15CkNPTkZJR19YWl9E
RUNfWDg2PXkKQ09ORklHX1haX0RFQ19QT1dFUlBDPXkKIyBDT05GSUdfWFpfREVDX0lBNjQgaXMg
bm90IHNldAojIENPTkZJR19YWl9ERUNfQVJNIGlzIG5vdCBzZXQKQ09ORklHX1haX0RFQ19BUk1U
SFVNQj15CkNPTkZJR19YWl9ERUNfU1BBUkM9eQojIENPTkZJR19YWl9ERUNfTUlDUk9MWk1BIGlz
IG5vdCBzZXQKQ09ORklHX1haX0RFQ19CQ0o9eQpDT05GSUdfWFpfREVDX1RFU1Q9eQpDT05GSUdf
REVDT01QUkVTU19MWk1BPXkKQ09ORklHX0RFQ09NUFJFU1NfTFpPPXkKQ09ORklHX0RFQ09NUFJF
U1NfTFo0PXkKQ09ORklHX0RFQ09NUFJFU1NfWlNURD15CkNPTkZJR19HRU5FUklDX0FMTE9DQVRP
Uj15CkNPTkZJR19CQ0g9bQpDT05GSUdfSU5URVJWQUxfVFJFRT15CkNPTkZJR19YQVJSQVlfTVVM
VEk9eQpDT05GSUdfQVNTT0NJQVRJVkVfQVJSQVk9eQpDT05GSUdfSEFTX0RNQT15CkNPTkZJR19O
RUVEX0RNQV9NQVBfU1RBVEU9eQpDT05GSUdfQVJDSF9ETUFfQUREUl9UXzY0QklUPXkKQ09ORklH
X0FSQ0hfSEFTX0ZPUkNFX0RNQV9VTkVOQ1JZUFRFRD15CkNPTkZJR19TV0lPVExCPXkKQ09ORklH
X0RNQV9DTUE9eQojIENPTkZJR19ETUFfUEVSTlVNQV9DTUEgaXMgbm90IHNldAoKIwojIERlZmF1
bHQgY29udGlndW91cyBtZW1vcnkgYXJlYSBzaXplOgojCkNPTkZJR19DTUFfU0laRV9NQllURVM9
MTYKQ09ORklHX0NNQV9TSVpFX1BFUkNFTlRBR0U9MTAKIyBDT05GSUdfQ01BX1NJWkVfU0VMX01C
WVRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NNQV9TSVpFX1NFTF9QRVJDRU5UQUdFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ01BX1NJWkVfU0VMX01JTiBpcyBub3Qgc2V0CkNPTkZJR19DTUFfU0laRV9T
RUxfTUFYPXkKQ09ORklHX0NNQV9BTElHTk1FTlQ9OApDT05GSUdfRE1BX0FQSV9ERUJVRz15CiMg
Q09ORklHX0RNQV9BUElfREVCVUdfU0cgaXMgbm90IHNldApDT05GSUdfRE1BX01BUF9CRU5DSE1B
Uks9eQpDT05GSUdfU0dMX0FMTE9DPXkKIyBDT05GSUdfQ1BVTUFTS19PRkZTVEFDSyBpcyBub3Qg
c2V0CkNPTkZJR19DTFpfVEFCPXkKIyBDT05GSUdfSVJRX1BPTEwgaXMgbm90IHNldApDT05GSUdf
TVBJTElCPXkKQ09ORklHX09JRF9SRUdJU1RSWT15CkNPTkZJR19IQVZFX0dFTkVSSUNfVkRTTz15
CkNPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWT15CkNPTkZJR19HRU5FUklDX1ZEU09fVElNRV9O
Uz15CkNPTkZJR19BUkNIX1NUQUNLV0FMSz15CkNPTkZJR19TVEFDS0RFUE9UPXkKQ09ORklHX1NU
QUNLREVQT1RfQUxXQVlTX0lOSVQ9eQpDT05GSUdfUkVGX1RSQUNLRVI9eQojIGVuZCBvZiBMaWJy
YXJ5IHJvdXRpbmVzCgojCiMgS2VybmVsIGhhY2tpbmcKIwoKIwojIHByaW50ayBhbmQgZG1lc2cg
b3B0aW9ucwojCkNPTkZJR19QUklOVEtfVElNRT15CkNPTkZJR19QUklOVEtfQ0FMTEVSPXkKIyBD
T05GSUdfU1RBQ0tUUkFDRV9CVUlMRF9JRCBpcyBub3Qgc2V0CkNPTkZJR19DT05TT0xFX0xPR0xF
VkVMX0RFRkFVTFQ9NwpDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9RVUlFVD00CkNPTkZJR19NRVNT
QUdFX0xPR0xFVkVMX0RFRkFVTFQ9NApDT05GSUdfRFlOQU1JQ19ERUJVRz15CkNPTkZJR19EWU5B
TUlDX0RFQlVHX0NPUkU9eQpDT05GSUdfU1lNQk9MSUNfRVJSTkFNRT15CiMgQ09ORklHX0RFQlVH
X0JVR1ZFUkJPU0UgaXMgbm90IHNldAojIGVuZCBvZiBwcmludGsgYW5kIGRtZXNnIG9wdGlvbnMK
CkNPTkZJR19ERUJVR19LRVJORUw9eQojIENPTkZJR19ERUJVR19NSVNDIGlzIG5vdCBzZXQKCiMK
IyBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCiMKQ09ORklHX0RFQlVH
X0lORk89eQojIENPTkZJR19ERUJVR19JTkZPX05PTkUgaXMgbm90IHNldAojIENPTkZJR19ERUJV
R19JTkZPX0RXQVJGX1RPT0xDSEFJTl9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0lO
Rk9fRFdBUkY0PXkKIyBDT05GSUdfREVCVUdfSU5GT19EV0FSRjUgaXMgbm90IHNldAojIENPTkZJ
R19ERUJVR19JTkZPX1JFRFVDRUQgaXMgbm90IHNldApDT05GSUdfREVCVUdfSU5GT19TUExJVD15
CkNPTkZJR19QQUhPTEVfSEFTX1NQTElUX0JURj15CkNPTkZJR19QQUhPTEVfSEFTX0JURl9UQUc9
eQojIENPTkZJR19HREJfU0NSSVBUUyBpcyBub3Qgc2V0CkNPTkZJR19GUkFNRV9XQVJOPTIwNDgK
IyBDT05GSUdfU1RSSVBfQVNNX1NZTVMgaXMgbm90IHNldApDT05GSUdfSEVBREVSU19JTlNUQUxM
PXkKQ09ORklHX1NFQ1RJT05fTUlTTUFUQ0hfV0FSTl9PTkxZPXkKIyBDT05GSUdfVk1MSU5VWF9N
QVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19GT1JDRV9XRUFLX1BFUl9DUFUgaXMgbm90IHNl
dAojIGVuZCBvZiBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25zCgojCiMg
R2VuZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCiMKIyBDT05GSUdfTUFHSUNfU1lT
UlEgaXMgbm90IHNldApDT05GSUdfREVCVUdfRlM9eQojIENPTkZJR19ERUJVR19GU19BTExPV19B
TEwgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19GU19ESVNBTExPV19NT1VOVCBpcyBub3Qgc2V0
CkNPTkZJR19ERUJVR19GU19BTExPV19OT05FPXkKQ09ORklHX0FSQ0hfSEFTX1VCU0FOX1NBTklU
SVpFX0FMTD15CkNPTkZJR19VQlNBTj15CiMgQ09ORklHX1VCU0FOX1RSQVAgaXMgbm90IHNldApD
T05GSUdfQ0NfSEFTX1VCU0FOX0JPVU5EUz15CkNPTkZJR19DQ19IQVNfVUJTQU5fQVJSQVlfQk9V
TkRTPXkKQ09ORklHX1VCU0FOX0JPVU5EUz15CkNPTkZJR19VQlNBTl9BUlJBWV9CT1VORFM9eQoj
IENPTkZJR19VQlNBTl9TSElGVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VCU0FOX1VOUkVBQ0hBQkxF
IGlzIG5vdCBzZXQKIyBDT05GSUdfVUJTQU5fQk9PTCBpcyBub3Qgc2V0CkNPTkZJR19VQlNBTl9F
TlVNPXkKQ09ORklHX1VCU0FOX0FMSUdOTUVOVD15CkNPTkZJR19VQlNBTl9TQU5JVElaRV9BTEw9
eQpDT05GSUdfVEVTVF9VQlNBTj1tCkNPTkZJR19IQVZFX0FSQ0hfS0NTQU49eQpDT05GSUdfSEFW
RV9LQ1NBTl9DT01QSUxFUj15CiMgQ09ORklHX0tDU0FOIGlzIG5vdCBzZXQKIyBlbmQgb2YgR2Vu
ZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCgojCiMgTmV0d29ya2luZyBEZWJ1Z2dp
bmcKIwpDT05GSUdfTkVUX0RFVl9SRUZDTlRfVFJBQ0tFUj15CkNPTkZJR19ORVRfTlNfUkVGQ05U
X1RSQUNLRVI9eQojIGVuZCBvZiBOZXR3b3JraW5nIERlYnVnZ2luZwoKIwojIE1lbW9yeSBEZWJ1
Z2dpbmcKIwojIENPTkZJR19QQUdFX0VYVEVOU0lPTiBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19Q
QUdFQUxMT0M9eQojIENPTkZJR19ERUJVR19QQUdFQUxMT0NfRU5BQkxFX0RFRkFVTFQgaXMgbm90
IHNldApDT05GSUdfU0xVQl9ERUJVRz15CkNPTkZJR19TTFVCX0RFQlVHX09OPXkKIyBDT05GSUdf
UEFHRV9PV05FUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBR0VfUE9JU09OSU5HIGlzIG5vdCBzZXQK
IyBDT05GSUdfREVCVUdfUk9EQVRBX1RFU1QgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfREVC
VUdfV1g9eQpDT05GSUdfREVCVUdfV1g9eQpDT05GSUdfR0VORVJJQ19QVERVTVA9eQpDT05GSUdf
UFREVU1QX0NPUkU9eQojIENPTkZJR19QVERVTVBfREVCVUdGUyBpcyBub3Qgc2V0CkNPTkZJR19E
RUJVR19PQkpFQ1RTPXkKQ09ORklHX0RFQlVHX09CSkVDVFNfU0VMRlRFU1Q9eQojIENPTkZJR19E
RUJVR19PQkpFQ1RTX0ZSRUUgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19PQkpFQ1RTX1RJTUVS
UyBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19PQkpFQ1RTX1dPUks9eQpDT05GSUdfREVCVUdfT0JK
RUNUU19SQ1VfSEVBRD15CkNPTkZJR19ERUJVR19PQkpFQ1RTX1BFUkNQVV9DT1VOVEVSPXkKQ09O
RklHX0RFQlVHX09CSkVDVFNfRU5BQkxFX0RFRkFVTFQ9MQojIENPTkZJR19TSFJJTktFUl9ERUJV
RyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0RFQlVHX0tNRU1MRUFLPXkKQ09ORklHX0RFQlVHX0tN
RU1MRUFLPXkKQ09ORklHX0RFQlVHX0tNRU1MRUFLX01FTV9QT09MX1NJWkU9MTYwMDAKQ09ORklH
X0RFQlVHX0tNRU1MRUFLX1RFU1Q9bQojIENPTkZJR19ERUJVR19LTUVNTEVBS19ERUZBVUxUX09G
RiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0tNRU1MRUFLX0FVVE9fU0NBTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0RFQlVHX1NUQUNLX1VTQUdFIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX1NUQUNL
X0VORF9DSEVDSz15CkNPTkZJR19BUkNIX0hBU19ERUJVR19WTV9QR1RBQkxFPXkKQ09ORklHX0RF
QlVHX1ZNPXkKIyBDT05GSUdfREVCVUdfVk1fVk1BQ0FDSEUgaXMgbm90IHNldApDT05GSUdfREVC
VUdfVk1fUkI9eQpDT05GSUdfREVCVUdfVk1fUEdGTEFHUz15CkNPTkZJR19ERUJVR19WTV9QR1RB
QkxFPXkKQ09ORklHX0RFQlVHX01FTU9SWV9JTklUPXkKQ09ORklHX0RFQlVHX1BFUl9DUFVfTUFQ
Uz15CkNPTkZJR19IQVZFX0FSQ0hfS0FTQU49eQpDT05GSUdfSEFWRV9BUkNIX0tBU0FOX1ZNQUxM
T0M9eQpDT05GSUdfQ0NfSEFTX0tBU0FOX0dFTkVSSUM9eQpDT05GSUdfQ0NfSEFTX1dPUktJTkdf
Tk9TQU5JVElaRV9BRERSRVNTPXkKIyBDT05GSUdfS0FTQU4gaXMgbm90IHNldApDT05GSUdfSEFW
RV9BUkNIX0tGRU5DRT15CiMgQ09ORklHX0tGRU5DRSBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9y
eSBEZWJ1Z2dpbmcKCkNPTkZJR19ERUJVR19TSElSUT15CgojCiMgRGVidWcgT29wcywgTG9ja3Vw
cyBhbmQgSGFuZ3MKIwpDT05GSUdfUEFOSUNfT05fT09QUz15CkNPTkZJR19QQU5JQ19PTl9PT1BT
X1ZBTFVFPTEKQ09ORklHX1BBTklDX1RJTUVPVVQ9MApDT05GSUdfREVURUNUX0hVTkdfVEFTSz15
CkNPTkZJR19ERUZBVUxUX0hVTkdfVEFTS19USU1FT1VUPTEyMAojIENPTkZJR19CT09UUEFSQU1f
SFVOR19UQVNLX1BBTklDIGlzIG5vdCBzZXQKQ09ORklHX1dRX1dBVENIRE9HPXkKQ09ORklHX1RF
U1RfTE9DS1VQPW0KIyBlbmQgb2YgRGVidWcgT29wcywgTG9ja3VwcyBhbmQgSGFuZ3MKCiMKIyBT
Y2hlZHVsZXIgRGVidWdnaW5nCiMKQ09ORklHX1NDSEVEX0RFQlVHPXkKQ09ORklHX1NDSEVEX0lO
Rk89eQpDT05GSUdfU0NIRURTVEFUUz15CiMgZW5kIG9mIFNjaGVkdWxlciBEZWJ1Z2dpbmcKCkNP
TkZJR19ERUJVR19USU1FS0VFUElORz15CgojCiMgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2Nrcywg
bXV0ZXhlcywgZXRjLi4uKQojCkNPTkZJR19MT0NLX0RFQlVHR0lOR19TVVBQT1JUPXkKIyBDT05G
SUdfUFJPVkVfTE9DS0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX0xPQ0tfU1RBVCBpcyBub3Qgc2V0
CkNPTkZJR19ERUJVR19TUElOTE9DSz15CkNPTkZJR19ERUJVR19NVVRFWEVTPXkKQ09ORklHX0RF
QlVHX1dXX01VVEVYX1NMT1dQQVRIPXkKQ09ORklHX0RFQlVHX1JXU0VNUz15CkNPTkZJR19ERUJV
R19MT0NLX0FMTE9DPXkKQ09ORklHX0xPQ0tERVA9eQpDT05GSUdfTE9DS0RFUF9CSVRTPTE1CkNP
TkZJR19MT0NLREVQX0NIQUlOU19CSVRTPTE2CkNPTkZJR19MT0NLREVQX1NUQUNLX1RSQUNFX0JJ
VFM9MTkKQ09ORklHX0xPQ0tERVBfU1RBQ0tfVFJBQ0VfSEFTSF9CSVRTPTE0CkNPTkZJR19MT0NL
REVQX0NJUkNVTEFSX1FVRVVFX0JJVFM9MTIKIyBDT05GSUdfREVCVUdfTE9DS0RFUCBpcyBub3Qg
c2V0CkNPTkZJR19ERUJVR19BVE9NSUNfU0xFRVA9eQpDT05GSUdfREVCVUdfTE9DS0lOR19BUElf
U0VMRlRFU1RTPXkKQ09ORklHX0xPQ0tfVE9SVFVSRV9URVNUPXkKQ09ORklHX1dXX01VVEVYX1NF
TEZURVNUPW0KQ09ORklHX1NDRl9UT1JUVVJFX1RFU1Q9eQpDT05GSUdfQ1NEX0xPQ0tfV0FJVF9E
RUJVRz15CiMgZW5kIG9mIExvY2sgRGVidWdnaW5nIChzcGlubG9ja3MsIG11dGV4ZXMsIGV0Yy4u
LikKCkNPTkZJR19ERUJVR19JUlFGTEFHUz15CkNPTkZJR19TVEFDS1RSQUNFPXkKQ09ORklHX1dB
Uk5fQUxMX1VOU0VFREVEX1JBTkRPTT15CkNPTkZJR19ERUJVR19LT0JKRUNUPXkKCiMKIyBEZWJ1
ZyBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCiMKIyBDT05GSUdfREVCVUdfTElTVCBpcyBub3Qgc2V0
CkNPTkZJR19ERUJVR19QTElTVD15CkNPTkZJR19ERUJVR19TRz15CkNPTkZJR19ERUJVR19OT1RJ
RklFUlM9eQojIENPTkZJR19CVUdfT05fREFUQV9DT1JSVVBUSU9OIGlzIG5vdCBzZXQKIyBlbmQg
b2YgRGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJlcwoKQ09ORklHX0RFQlVHX0NSRURFTlRJQUxT
PXkKCiMKIyBSQ1UgRGVidWdnaW5nCiMKQ09ORklHX1RPUlRVUkVfVEVTVD15CkNPTkZJR19SQ1Vf
U0NBTEVfVEVTVD15CiMgQ09ORklHX1JDVV9UT1JUVVJFX1RFU1QgaXMgbm90IHNldApDT05GSUdf
UkNVX1JFRl9TQ0FMRV9URVNUPW0KQ09ORklHX1JDVV9DUFVfU1RBTExfVElNRU9VVD0yMQpDT05G
SUdfUkNVX0VYUF9DUFVfU1RBTExfVElNRU9VVD0wCkNPTkZJR19SQ1VfVFJBQ0U9eQojIENPTkZJ
R19SQ1VfRVFTX0RFQlVHIGlzIG5vdCBzZXQKIyBlbmQgb2YgUkNVIERlYnVnZ2luZwoKQ09ORklH
X0RFQlVHX1dRX0ZPUkNFX1JSX0NQVT15CiMgQ09ORklHX0NQVV9IT1RQTFVHX1NUQVRFX0NPTlRS
T0wgaXMgbm90IHNldApDT05GSUdfTEFURU5DWVRPUD15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX1RS
QUNFUj15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUj15CkNPTkZJR19IQVZFX0RZ
TkFNSUNfRlRSQUNFPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTPXkKQ09O
RklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFM9eQpDT05GSUdfSEFWRV9E
WU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1M9eQpDT05GSUdfSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09S
RD15CkNPTkZJR19IQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFM9eQpDT05GSUdfSEFWRV9GRU5UUlk9
eQpDT05GSUdfSEFWRV9OT1BfTUNPVU5UPXkKQ09ORklHX1RSQUNFX0NMT0NLPXkKQ09ORklHX1RS
QUNJTkdfU1VQUE9SVD15CiMgQ09ORklHX0ZUUkFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBTVBM
RVMgaXMgbm90IHNldApDT05GSUdfSEFWRV9TQU1QTEVfRlRSQUNFX0RJUkVDVD15CkNPTkZJR19I
QVZFX1NBTVBMRV9GVFJBQ0VfRElSRUNUX01VTFRJPXkKQ09ORklHX0FSQ0hfSEFTX0RFVk1FTV9J
U19BTExPV0VEPXkKQ09ORklHX1NUUklDVF9ERVZNRU09eQpDT05GSUdfSU9fU1RSSUNUX0RFVk1F
TT15CgojCiMgczM5MCBEZWJ1Z2dpbmcKIwpDT05GSUdfRUFSTFlfUFJJTlRLPXkKQ09ORklHX0RF
QlVHX0VOVFJZPXkKQ09ORklHX0NJT19JTkpFQ1Q9eQojIGVuZCBvZiBzMzkwIERlYnVnZ2luZwoK
IwojIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQojCiMgQ09ORklHX0tVTklUIGlzIG5vdCBz
ZXQKQ09ORklHX05PVElGSUVSX0VSUk9SX0lOSkVDVElPTj1tCkNPTkZJR19GVU5DVElPTl9FUlJP
Ul9JTkpFQ1RJT049eQojIENPTkZJR19GQVVMVF9JTkpFQ1RJT04gaXMgbm90IHNldApDT05GSUdf
QVJDSF9IQVNfS0NPVj15CkNPTkZJR19DQ19IQVNfU0FOQ09WX1RSQUNFX1BDPXkKQ09ORklHX0tD
T1Y9eQpDT05GSUdfS0NPVl9FTkFCTEVfQ09NUEFSSVNPTlM9eQojIENPTkZJR19LQ09WX0lOU1RS
VU1FTlRfQUxMIGlzIG5vdCBzZXQKQ09ORklHX0tDT1ZfSVJRX0FSRUFfU0laRT0weDQwMDAwCkNP
TkZJR19SVU5USU1FX1RFU1RJTkdfTUVOVT15CkNPTkZJR19MS0RUTT1tCkNPTkZJR19URVNUX01J
Tl9IRUFQPXkKIyBDT05GSUdfVEVTVF9ESVY2NCBpcyBub3Qgc2V0CkNPTkZJR19CQUNLVFJBQ0Vf
U0VMRl9URVNUPXkKIyBDT05GSUdfVEVTVF9SRUZfVFJBQ0tFUiBpcyBub3Qgc2V0CkNPTkZJR19S
QlRSRUVfVEVTVD1tCiMgQ09ORklHX1JFRURfU09MT01PTl9URVNUIGlzIG5vdCBzZXQKQ09ORklH
X0lOVEVSVkFMX1RSRUVfVEVTVD15CkNPTkZJR19QRVJDUFVfVEVTVD1tCkNPTkZJR19BVE9NSUM2
NF9TRUxGVEVTVD15CkNPTkZJR19URVNUX0hFWERVTVA9bQojIENPTkZJR19TVFJJTkdfU0VMRlRF
U1QgaXMgbm90IHNldApDT05GSUdfVEVTVF9TVFJJTkdfSEVMUEVSUz15CiMgQ09ORklHX1RFU1Rf
U1RSU0NQWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfS1NUUlRPWCBpcyBub3Qgc2V0CkNPTkZJ
R19URVNUX1BSSU5URj15CkNPTkZJR19URVNUX1NDQU5GPXkKQ09ORklHX1RFU1RfQklUTUFQPW0K
IyBDT05GSUdfVEVTVF9VVUlEIGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfWEFSUkFZPXkKIyBDT05G
SUdfVEVTVF9SSEFTSFRBQkxFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9TSVBIQVNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfVEVTVF9JREEgaXMgbm90IHNldAojIENPTkZJR19URVNUX0xLTSBpcyBu
b3Qgc2V0CkNPTkZJR19URVNUX0JJVE9QUz1tCkNPTkZJR19URVNUX1ZNQUxMT0M9bQpDT05GSUdf
VEVTVF9VU0VSX0NPUFk9bQojIENPTkZJR19GSU5EX0JJVF9CRU5DSE1BUksgaXMgbm90IHNldApD
T05GSUdfVEVTVF9GSVJNV0FSRT1tCkNPTkZJR19URVNUX1VERUxBWT1tCkNPTkZJR19URVNUX1NU
QVRJQ19LRVlTPW0KQ09ORklHX1RFU1RfTUVNQ0FUX1A9eQojIENPTkZJR19URVNUX01FTUlOSVQg
aXMgbm90IHNldApDT05GSUdfVEVTVF9GUkVFX1BBR0VTPXkKIyBlbmQgb2YgS2VybmVsIFRlc3Rp
bmcgYW5kIENvdmVyYWdlCiMgZW5kIG9mIEtlcm5lbCBoYWNraW5nCg==

--===============4408715590504309368==--

