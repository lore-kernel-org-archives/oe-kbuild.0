Content-Type: multipart/mixed; boundary="===============7583370637698537605=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.19-rc5 77/104] drivers/iommu/iommufd/io_pagetable.c:492:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 17 Jul 2022 14:23:13 +0800
Message-ID: <202207171431.nz0q9n34-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7583370637698537605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/iommu/iommufd/io_pagetable.c:492:2: warning: Undefined or garbage =
value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: a636dff3ade41bd1c61e16bc697af82ffe07f8c6 [77/104] vfio: Add iommufd=
 VFIO compat support to group_fd
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: s390-randconfig-c005-20220715 (https://download.01.org/0day-ci/arch=
ive/20220717/202207171431.nz0q9n34-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e=
6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/luxis1999/iommufd/commit/a636dff3ade41bd1c61e1=
6bc697af82ffe07f8c6
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommu=
fd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.19-rc5
        git checkout a636dff3ade41bd1c61e16bc697af82ffe07f8c6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:188:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 113 warnings (101 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/pps/sysfs.c:26:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld.%09d#%d\n",
                  ^~~~~~~
   drivers/pps/sysfs.c:26:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld.%09d#%d\n",
                  ^~~~~~~
   drivers/pps/sysfs.c:40:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld.%09d#%d\n",
                  ^~~~~~~
   drivers/pps/sysfs.c:40:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld.%09d#%d\n",
                  ^~~~~~~
   drivers/pps/sysfs.c:51:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%4x\n", pps->info.mode);
                  ^~~~~~~
   drivers/pps/sysfs.c:51:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%4x\n", pps->info.mode);
                  ^~~~~~~
   drivers/pps/sysfs.c:60:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!pps->info.echo);
                  ^~~~~~~
   drivers/pps/sysfs.c:60:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!pps->info.echo);
                  ^~~~~~~
   drivers/pps/sysfs.c:69:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%s\n", pps->info.name);
                  ^~~~~~~
   drivers/pps/sysfs.c:69:9: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%s\n", pps->info.name);
                  ^~~~~~~
   drivers/pps/sysfs.c:78:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%s\n", pps->info.path);
                  ^~~~~~~
   drivers/pps/sysfs.c:78:9: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%s\n", pps->info.path);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/i2c/i2c-core-of.c:28:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-of.c:28:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/i2c/i2c-dev.c:607:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(client->name, I2C_NAME_SIZE, "i2c-dev %d", adap->nr);
           ^~~~~~~~
   drivers/i2c/i2c-dev.c:607:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(client->name, I2C_NAME_SIZE, "i2c-dev %d", adap->nr);
           ^~~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
>> drivers/iommu/iommufd/io_pagetable.c:492:2: warning: Undefined or garbag=
e value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return rc;
           ^      ~~
   drivers/iommu/iommufd/io_pagetable.c:430:2: note: 'rc' declared without =
an initial value
           int rc;
           ^~~~~~
   drivers/iommu/iommufd/io_pagetable.c:432:6: note: Assuming 'length' is n=
ot equal to 0
           if (!length)
               ^~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:432:2: note: Taking false branch
           if (!length)
           ^
   drivers/iommu/iommufd/io_pagetable.c:434:2: note: Taking false branch
           if (check_add_overflow(iova, length - 1, &last_iova))
           ^
   drivers/iommu/iommufd/io_pagetable.c:438:2: note: Loop condition is fals=
e. Execution continues on line 482
           for (area =3D iopt_area_iter_first(iopt, iova, last_iova); area;
           ^
   drivers/iommu/iommufd/io_pagetable.c:482:6: note: Assuming 'cur_iova' is=
 not equal to 'last_iova'
           if (cur_iova !=3D last_iova)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:482:2: note: Taking true branch
           if (cur_iova !=3D last_iova)
           ^
   drivers/iommu/iommufd/io_pagetable.c:483:3: note: Control jumps to line =
489
                   goto out_remove;
                   ^
   drivers/iommu/iommufd/io_pagetable.c:489:6: note: 'cur_iova' is equal to=
 'iova'
           if (cur_iova !=3D iova)
               ^~~~~~~~
   drivers/iommu/iommufd/io_pagetable.c:489:2: note: Taking false branch
           if (cur_iova !=3D iova)
           ^
   drivers/iommu/iommufd/io_pagetable.c:492:2: note: Undefined or garbage v=
alue returned to caller
           return rc;
           ^      ~~
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
>> drivers/iommu/iommufd/pages.c:91:2: warning: Value stored to 'rc' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           rc =3D check_add_overflow(pages->npinned, npages, &pages->npinne=
d);
           ^
   drivers/iommu/iommufd/pages.c:91:2: note: Value stored to 'rc' is never =
read
   drivers/iommu/iommufd/pages.c:100:2: warning: Value stored to 'rc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           rc =3D check_sub_overflow(pages->npinned, npages, &pages->npinne=
d);
           ^
   drivers/iommu/iommufd/pages.c:100:2: note: Value stored to 'rc' is never=
 read
   drivers/iommu/iommufd/pages.c:413:25: warning: The left operand of '>' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (batch->npfns[cur] > offset)
                                         ^
   drivers/iommu/iommufd/pages.c:1310:15: note: 'user' is non-null
           if (WARN_ON(!user))
                        ^
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   drivers/iommu/iommufd/pages.c:1310:6: note: Taking false branch
           if (WARN_ON(!user))
               ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/iommu/iommufd/pages.c:1310:6: note: Taking false branch
           if (WARN_ON(!user))
               ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   drivers/iommu/iommufd/pages.c:1310:2: note: Taking false branch
           if (WARN_ON(!user))
           ^
   drivers/iommu/iommufd/pages.c:1313:2: note: Taking false branch
           if (!refcount_dec_and_test(&user->refcount))
           ^
   drivers/iommu/iommufd/pages.c:1317:2: note: Calling 'iopt_pages_unfill_x=
array'
           iopt_pages_unfill_xarray(pages, start, last);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:1090:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:309:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Left side of '&&' is false
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Taking false branch
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Taking false branch
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   drivers/iommu/iommufd/pages.c:1090:2: note: Loop condition is false.  Ex=
iting loop
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/iommu/iommufd/pages.c:1092:2: note: Taking false branch
           if (interval_tree_fully_covers(&pages->domains_itree, start, las=
t))
           ^
   drivers/iommu/iommufd/pages.c:1095:2: note: Calling 'batch_init_backup'
           batch_init_backup(&batch, last + 1, backup, sizeof(backup));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:216:2: note: Calling '__batch_init'
           __batch_init(batch, max_pages, backup, backup_len);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/iommu/iommufd/pages.c:572:2: note: Taking false branch
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   drivers/iommu/iommufd/pages.c:572:2: note: Loop condition is false.  Exi=
ting loop
           lockdep_assert_held(&pages->mutex);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/iommu/iommufd/pages.c:576:8: note: Calling 'interval_tree_span_i=
ter_done'
                !interval_tree_span_iter_done(&user_span);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree.h:68:9: note: Assuming the condition is false
           return state->is_hole =3D=3D -1;
                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree.h:68:2: note: Returning without writing to '=
state->is_hole', which participates in a condition later
           return state->is_hole =3D=3D -1;
           ^
   drivers/iommu/iommufd/pages.c:576:8: note: Returning from 'interval_tree=
_span_iter_done'
                !interval_tree_span_iter_done(&user_span);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:574:2: note: Loop condition is true.  Ente=
ring loop body
           for (interval_tree_span_iter_first(&user_span, &pages->users_itr=
ee, 0,
           ^
   drivers/iommu/iommufd/pages.c:578:7: note: Assuming field 'is_hole' is n=
ot equal to 0
                   if (!user_span.is_hole)
                       ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:578:3: note: Taking false branch
                   if (!user_span.is_hole)
                   ^
   drivers/iommu/iommufd/pages.c:584:9: note: Calling 'interval_tree_span_i=
ter_done'
                        !interval_tree_span_iter_done(&area_span);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree.h:68:9: note: Assuming the condition is false
           return state->is_hole =3D=3D -1;
                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/interval_tree.h:68:2: note: Returning without writing to '=
state->is_hole', which participates in a condition later
           return state->is_hole =3D=3D -1;
           ^
   drivers/iommu/iommufd/pages.c:584:9: note: Returning from 'interval_tree=
_span_iter_done'
                        !interval_tree_span_iter_done(&area_span);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:581:3: note: Loop condition is true.  Ente=
ring loop body
                   for (interval_tree_span_iter_first(
                   ^
   drivers/iommu/iommufd/pages.c:586:8: note: Assuming field 'is_hole' is n=
ot equal to 0
                           if (!area_span.is_hole)
                               ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:586:4: note: Taking false branch
                           if (!area_span.is_hole)
                           ^
   drivers/iommu/iommufd/pages.c:589:4: note: Calling 'batch_unpin'
                           batch_unpin(batch, pages, area_span.start_hole -=
 index,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iommu/iommufd/pages.c:412:2: note: Loop condition is true.  Ente=
ring loop body
           while (offset) {
           ^
   drivers/iommu/iommufd/pages.c:413:3: note: Taking false branch
                   if (batch->npfns[cur] > offset)
                   ^
   drivers/iommu/iommufd/pages.c:416:3: note: The value 1 is assigned to 'c=
ur'
                   cur++;
                   ^~~~~
   drivers/iommu/iommufd/pages.c:412:2: note: Loop condition is false. Exec=
ution continues on line 419
           while (offset) {
           ^
   drivers/iommu/iommufd/pages.c:419:2: note: Loop condition is true.  Ente=
ring loop body
           while (npages) {
           ^
   drivers/iommu/iommufd/pages.c:421:44: note: The left operand of '-' is a=
 garbage value
                           min_t(size_t, npages, batch->npfns[cur] - offset=
);
                                                                   ^
   include/linux/minmax.h:104:59: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                                                   ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
>> drivers/iommu/iommufd/pages.c:760:21: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           pages->source_mm =3D current->mm;
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/iommu/iommufd/pages.c:750:6: note: Assuming the condition is fal=
se
           if (length > SIZE_MAX - PAGE_SIZE || length =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:750:6: note: Left side of '||' is false
   drivers/iommu/iommufd/pages.c:750:39: note: Assuming 'length' is not equ=
al to 0
           if (length > SIZE_MAX - PAGE_SIZE || length =3D=3D 0)
                                                ^~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:750:2: note: Taking false branch
           if (length > SIZE_MAX - PAGE_SIZE || length =3D=3D 0)
           ^
   drivers/iommu/iommufd/pages.c:753:10: note: Calling 'kzalloc'
           pages =3D kzalloc(sizeof(*pages), GFP_KERNEL_ACCOUNT);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:588:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:605:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:753:10: note: Returning from 'kzalloc'
           pages =3D kzalloc(sizeof(*pages), GFP_KERNEL_ACCOUNT);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:754:6: note: Assuming 'pages' is non-null
           if (!pages)
               ^~~~~~
   drivers/iommu/iommufd/pages.c:754:2: note: Taking false branch
           if (!pages)
           ^
   drivers/iommu/iommufd/pages.c:759:2: note: Loop condition is false.  Exi=
ting loop
           mutex_init(&pages->mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/iommu/iommufd/pages.c:760:21: note: Dereference of null pointer
           pages->source_mm =3D current->mm;
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/iommu/iommufd/pages.c:995:19: warning: The right operand of '<=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (unmap_index <=3D index)
                                   ^  ~~~~~
   drivers/iommu/iommufd/pages.c:957:2: note: 'index' declared without an i=
nitial value
           unsigned long index;
           ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/pages.c:960:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&area->iopt->domains_rwsem);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:309:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                  ^
   drivers/iommu/iommufd/pages.c:960:2: note: Left side of '&&' is false
           lockdep_assert_held(&area->iopt->domains_rwsem);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/iommu/iommufd/pages.c:960:2: note: Taking false branch
           lockdep_assert_held(&area->iopt->domains_rwsem);
           ^
   include/linux/lockdep.h:315:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:309:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/iommu/iommufd/pages.c:960:2: note: Taking false branch
--
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ipv4/proc.c:436:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buff, 0, TCPUDP_MIB_MAX * sizeof(unsigned long));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ipv4/proc.c:436:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(buff, 0, TCPUDP_MIB_MAX * sizeof(unsigned long));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ipv4/proc.c:501:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buff64, 0, ip_cnt * sizeof(u64));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ipv4/proc.c:501:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(buff64, 0, ip_cnt * sizeof(u64));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 133 warnings (121 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/power/supply/sbs-battery.c:419:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(values, block_buffer + 1, block_length);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/power/supply/sbs-battery.c:419:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(values, block_buffer + 1, block_length);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/power/supply/sbs-battery.c:833:2: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(sbs_serial, "%04x", ret);
           ^~~~~~~
   drivers/power/supply/sbs-battery.c:833:2: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(sbs_serial, "%04x", ret);
           ^~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   Suppressed 68 warnings (56 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
>> drivers/iommu/iommufd/vfio_compat.c:362:3: warning: Value stored to 'rc'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:362:3: note: Value stored to 'rc' is=
 never read
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   drivers/iommu/iommu.c:449:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:449:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", group->name);
                  ^~~~~~~
   drivers/iommu/iommu.c:568:10: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:568:10: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   str +=3D sprintf(str, "0x%016llx 0x%016llx %s\n",
                          ^~~~~~~
   drivers/iommu/iommu.c:605:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:605:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(buf, type);
           ^~~~~~
   drivers/iommu/iommu.c:1695:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&gtype, 0, sizeof(gtype));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1695:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&gtype, 0, sizeof(gtype));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   include/linux/iommu.h:437:9: warning: Access to field 'iommu_dev' result=
s in a dereference of a null pointer (loaded from field 'iommu') [clang-ana=
lyzer-core.NullDereference]
           return dev->iommu->iommu_dev->ops;
                  ^
   drivers/iommu/iommu.c:1649:6: note: Assuming 'action' is equal to BUS_NO=
TIFY_ADD_DEVICE
           if (action =3D=3D BUS_NOTIFY_ADD_DEVICE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:1649:2: note: Taking true branch
           if (action =3D=3D BUS_NOTIFY_ADD_DEVICE) {
           ^
   drivers/iommu/iommu.c:1652:9: note: Calling 'iommu_probe_device'
                   ret =3D iommu_probe_device(dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:303:8: note: Calling '__iommu_probe_device'
           ret =3D __iommu_probe_device(dev, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:251:6: note: Assuming 'ops' is non-null
           if (!ops)
               ^~~~
   drivers/iommu/iommu.c:251:2: note: Taking false branch
           if (!ops)
           ^
   drivers/iommu/iommu.c:254:7: note: Calling 'dev_iommu_get'
           if (!dev_iommu_get(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:202:6: note: Assuming 'param' is non-null
           if (param)
               ^~~~~
   drivers/iommu/iommu.c:202:2: note: Taking true branch
           if (param)
           ^
   drivers/iommu/iommu.c:203:3: note: Returning without writing to 'dev->io=
mmu'
                   return param;
                   ^
   drivers/iommu/iommu.c:254:7: note: Returning from 'dev_iommu_get'
           if (!dev_iommu_get(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:254:2: note: Taking false branch
           if (!dev_iommu_get(dev))
           ^
   drivers/iommu/iommu.c:257:2: note: Taking false branch
           if (!try_module_get(ops->owner)) {
           ^
   drivers/iommu/iommu.c:263:2: note: Taking true branch
           if (IS_ERR(iommu_dev)) {
           ^
   drivers/iommu/iommu.c:265:3: note: Control jumps to line 289
                   goto out_module_put;
                   ^
   drivers/iommu/iommu.c:292:2: note: Calling 'dev_iommu_free'
           dev_iommu_free(dev);

vim +492 drivers/iommu/iommufd/io_pagetable.c

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  403  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  404  /**
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  405   * iopt_access_pages() - R=
eturn a list of pages under the iova
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  406   * @iopt: io_pagetable to =
act on
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  407   * @iova: Starting IOVA
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  408   * @length: Number of byte=
s to access
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  409   * @out_pages: Output page=
 list
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  410   * @write: True if access =
is for writing
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  411   *
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  412   * Reads @npages starting =
at iova and returns the struct page * pointers. These
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  413   * can be kmap'd by the ca=
ller for CPU access.
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  414   *
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  415   * The caller must perform=
 iopt_unaccess_pages() when done to balance this.
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  416   *
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  417   * iova can be unaligned f=
rom PAGE_SIZE. The first returned byte starts at
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  418   * page_to_phys(out_pages[=
0]) + (iova % PAGE_SIZE). The caller promises not to
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  419   * touch memory outside th=
e requested iova slice.
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  420   *
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  421   * FIXME: callers that nee=
d a DMA mapping via a sgl should create another
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  422   * interface to build the =
SGL efficiently
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  423   */
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  424  int iopt_access_pages(stru=
ct io_pagetable *iopt, unsigned long iova,
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  425  		      unsigned long leng=
th, struct page **out_pages, bool write)
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  426  {
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  427  	unsigned long cur_iova =
=3D iova;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  428  	unsigned long last_iova;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  429  	struct iopt_area *area;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  430  	int rc;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  431  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  432  	if (!length)
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  433  		return -EINVAL;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  434  	if (check_add_overflow(io=
va, length - 1, &last_iova))
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  435  		return -EOVERFLOW;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  436  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  437  	down_read(&iopt->iova_rws=
em);
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  438  	for (area =3D iopt_area_i=
ter_first(iopt, iova, last_iova); area;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  439  	     area =3D iopt_area_i=
ter_next(area, iova, last_iova)) {
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  440  		unsigned long last =3D m=
in(last_iova, iopt_area_last_iova(area));
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  441  		unsigned long last_index;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  442  		unsigned long index;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  443  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  444  		/* Need contiguous areas=
 in the access */
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  445  		if (iopt_area_iova(area)=
 > cur_iova || !area->pages) {
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  446  			rc =3D -EINVAL;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  447  			goto out_remove;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  448  		}
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  449  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  450  		index =3D iopt_area_iova=
_to_index(area, cur_iova);
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  451  		last_index =3D iopt_area=
_iova_to_index(area, last);
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  452  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  453  		/*
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  454  		 * The API can only retu=
rn aligned pages, so the starting point
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  455  		 * must be at a page bou=
ndary.
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  456  		 */
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  457  		if ((cur_iova - (iopt_ar=
ea_iova(area) - area->page_offset)) %
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  458  		    PAGE_SIZE) {
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  459  			rc =3D -EINVAL;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  460  			goto out_remove;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  461  		}
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  462  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  463  		/*
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  464  		 * and an interior endin=
g point must be at a page boundary
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  465  		 */
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  466  		if (last !=3D last_iova =
&&
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  467  		    (iopt_area_last_iova=
(area) - cur_iova + 1) % PAGE_SIZE) {
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  468  			rc =3D -EINVAL;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  469  			goto out_remove;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  470  		}
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  471  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  472  		rc =3D iopt_pages_add_us=
er(area->pages, index, last_index,
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  473  					 out_pages, write);
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  474  		if (rc)
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  475  			goto out_remove;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  476  		if (last =3D=3D last_iov=
a)
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  477  			break;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  478  		cur_iova =3D last + 1;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  479  		out_pages +=3D last_inde=
x - index;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  480  		atomic_inc(&area->num_us=
ers);
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  481  	}
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  482  	if (cur_iova !=3D last_io=
va)
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  483  		goto out_remove;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  484  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  485  	up_read(&iopt->iova_rwsem=
);
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  486  	return 0;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  487  =

a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  488  out_remove:
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  489  	if (cur_iova !=3D iova)
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  490  		iopt_unaccess_pages(iopt=
, iova, cur_iova - iova);
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  491  	up_read(&iopt->iova_rwsem=
);
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11 @492  	return rc;
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  493  }
a60b4da80cbd4b3 Jason Gunthorpe 2021-11-11  494  =


:::::: The code at line 492 was first introduced by commit
:::::: a60b4da80cbd4b3c7db5414158d16c6374d6707e iommufd: Data structure to =
provide IOVA to PFN mapping

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Yi Liu <yi.l.liu@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7583370637698537605==--

