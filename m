Content-Type: multipart/mixed; boundary="===============5400124077250244207=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7804/9472] drivers/md/dm-table.c:1601:21: warning: Value stored to 'ti' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 12 Jul 2022 05:00:58 +0800
Message-ID: <202207120400.SvvYq0nk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5400124077250244207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
d/dm-table.c:1601:21: warning: Value stored to 'ti' during its initializati=
on is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4112a8699ae2eac797415b9be1d7901b3f79e772
commit: 564b5c5476cdb71b717340897b2b50f9c45df158 [7804/9472] dm table: audi=
t all dm_table_get_target() callers
:::::: branch date: 10 hours ago
:::::: commit date: 4 days ago
config: s390-randconfig-c005-20220710 (https://download.01.org/0day-ci/arch=
ive/20220712/202207120400.SvvYq0nk-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6ce63e=
267aab79ca87bf63453d34dd3909ab978d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D564b5c5476cdb71b717340897b2b50f9c45df158
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 564b5c5476cdb71b717340897b2b50f9c45df158
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                   ^
   include/linux/lockdep.h:518:48: note: expanded from macro 'lock_acquire_=
exclusive'
   #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, =
s, t, 0, 1, n, i)
                                                           ^
   include/linux/lockdep.h:356:44: note: expanded from macro 'lock_acquire'
   # define lock_acquire(l, s, t, r, c, n, i)      do { } while (0)
                                                   ^
   include/linux/spinlock_api_smp.h:111:44: note: Calling 'do_raw_spin_lock'
           LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
                                                     ^
   include/linux/lockdep.h:477:2: note: expanded from macro 'LOCK_CONTENDED'
           lock(_lock)
           ^~~~~~~~~~~
   include/linux/spinlock.h:185:2: note: Calling 'arch_spin_lock'
           arch_spin_lock(&lock->raw_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:66:7: note: Calling 'arch_spin_trylock_=
once'
           if (!arch_spin_trylock_once(lp))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/s390/include/asm/spinlock.h:61:52: note: Dereference of null pointer
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKV=
AL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINL=
OCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   drivers/md/dm-table.c:118:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(n_highs, -1, sizeof(*n_highs) * num);
           ^~~~~~
   drivers/md/dm-table.c:118:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(n_highs, -1, sizeof(*n_highs) * num);
           ^~~~~~
   drivers/md/dm-table.c:357:6: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(path, "%u:%u%c", &major, &minor, &dummy) =3D=3D 2) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-table.c:357:6: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
           if (sscanf(path, "%u:%u%c", &major, &minor, &dummy) =3D=3D 2) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-table.c:488:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(argv, old_argv, *size * sizeof(*argv));
                   ^~~~~~
   drivers/md/dm-table.c:488:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(argv, old_argv, *size * sizeof(*argv));
                   ^~~~~~
   drivers/md/dm-table.c:649:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(tgt, 0, sizeof(*tgt));
           ^~~~~~
   drivers/md/dm-table.c:649:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(tgt, 0, sizeof(*tgt));
           ^~~~~~
   drivers/md/dm-table.c:743:7: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
               (sscanf(arg_str, "%u%c", value, &dummy) !=3D 1) ||
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-table.c:743:7: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
               (sscanf(arg_str, "%u%c", value, &dummy) !=3D 1) ||
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-table.c:1310:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(profile->modes_supported, 0xFF,
           ^~~~~~
   drivers/md/dm-table.c:1310:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(profile->modes_supported, 0xFF,
           ^~~~~~
>> drivers/md/dm-table.c:1601:21: warning: Value stored to 'ti' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct dm_target *ti =3D dm_table_get_target(t, i);
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-table.c:1601:21: note: Value stored to 'ti' during its ini=
tialization is never read
                   struct dm_target *ti =3D dm_table_get_target(t, i);
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKV=
AL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINL=
OCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   drivers/md/bcache/alloc.c:625:2: note: Calling 'spin_lock'
           spin_lock(&c->data_bucket_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:349:2: note: Calling '__raw_spin_lock'
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:215:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:47:30: note: expanded from macro '_raw_=
spin_lock'
   #define _raw_spin_lock(lock) __raw_spin_lock(lock)
                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:133:2: note: Loop condition is false.  =
Exiting loop
           spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
           ^
   include/linux/lockdep.h:522:35: note: expanded from macro 'spin_acquire'
   #define spin_acquire(l, s, t, i)                lock_acquire_exclusive(l=
, s, t, NULL, i)
                                                   ^
   include/linux/lockdep.h:518:48: note: expanded from macro 'lock_acquire_=
exclusive'
   #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, =
s, t, 0, 1, n, i)
                                                           ^
   include/linux/lockdep.h:356:44: note: expanded from macro 'lock_acquire'
   # define lock_acquire(l, s, t, r, c, n, i)      do { } while (0)
                                                   ^
   include/linux/spinlock_api_smp.h:134:44: note: Calling 'do_raw_spin_lock'
           LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
                                                     ^
   include/linux/lockdep.h:477:2: note: expanded from macro 'LOCK_CONTENDED'
           lock(_lock)
           ^~~~~~~~~~~
   include/linux/spinlock.h:185:2: note: Calling 'arch_spin_lock'
           arch_spin_lock(&lock->raw_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/spinlock.h:66:7: note: Calling 'arch_spin_trylock_=
once'
           if (!arch_spin_trylock_once(lp))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/s390/include/asm/spinlock.h:61:52: note: Dereference of null pointer
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKV=
AL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINL=
OCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/md/bcache/alloc.c:192:30: warning: Access to field 'prio' result=
s in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                   else if (bucket_max_cmp(b, heap_peek(&ca->heap))) {
                                              ^
   drivers/md/bcache/util.h:110:22: note: expanded from macro 'heap_peek'
   #define heap_peek(h)    ((h)->used ? (h)->data[0] : NULL)
                           ^
   drivers/md/bcache/alloc.c:176:60: note: expanded from macro 'bucket_max_=
cmp'
   #define bucket_max_cmp(l, r)    (bucket_prio(l) < bucket_prio(r))
                                                                 ^
   drivers/md/bcache/alloc.c:173:3: note: expanded from macro 'bucket_prio'
           (b->prio - ca->set->min_prio + min_prio) * GC_SECTORS_USED(b);  \
            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/bcache/alloc.c:186:18: note: Assuming the condition is true
           for_each_bucket(b, ca) {
                           ^
   drivers/md/bcache/bcache.h:889:7: note: expanded from macro 'for_each_bu=
cket'
                b < (ca)->buckets + (ca)->sb.nbuckets; b++)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/alloc.c:186:2: note: Loop condition is true.  Entering=
 loop body
           for_each_bucket(b, ca) {
           ^
   drivers/md/bcache/bcache.h:888:2: note: expanded from macro 'for_each_bu=
cket'
           for (b =3D (ca)->buckets + (ca)->sb.first_bucket;               =
  \
           ^
   drivers/md/bcache/alloc.c:187:7: note: Assuming the condition is false
                   if (!bch_can_invalidate_bucket(ca, b))

vim +/ti +1601 drivers/md/dm-table.c

dd88d313bef027 Damien Le Moal       2017-05-08  1589  =

2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1590  /*
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1591   * Check the device z=
oned model based on the target feature flag. If the target
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1592   * has the DM_TARGET_=
ZONED_HM feature flag set, host-managed zoned devices are
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1593   * also accepted but =
all devices must have the same zoned model. If the target
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1594   * has the DM_TARGET_=
MIXED_ZONED_MODEL feature set, the devices can have any
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1595   * zoned model with a=
ll zoned devices having the same zone size.
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1596   */
dd88d313bef027 Damien Le Moal       2017-05-08  1597  static bool dm_table_=
supports_zoned_model(struct dm_table *t,
dd88d313bef027 Damien Le Moal       2017-05-08  1598  					  enum blk_zoned=
_model zoned_model)
dd88d313bef027 Damien Le Moal       2017-05-08  1599  {
564b5c5476cdb7 Mike Snitzer         2022-07-05  1600  	for (unsigned int i =
=3D 0; i < t->num_targets; i++) {
564b5c5476cdb7 Mike Snitzer         2022-07-05 @1601  		struct dm_target *t=
i =3D dm_table_get_target(t, i);
dd88d313bef027 Damien Le Moal       2017-05-08  1602  =

2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1603  		if (dm_target_suppo=
rts_zoned_hm(ti->type)) {
dd88d313bef027 Damien Le Moal       2017-05-08  1604  			if (!ti->type->ite=
rate_devices ||
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1605  			    ti->type->iter=
ate_devices(ti, device_not_zoned_model,
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1606  						      &zoned_mo=
del))
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1607  				return false;
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1608  		} else if (!dm_targ=
et_supports_mixed_zoned_model(ti->type)) {
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1609  			if (zoned_model =
=3D=3D BLK_ZONED_HM)
dd88d313bef027 Damien Le Moal       2017-05-08  1610  				return false;
dd88d313bef027 Damien Le Moal       2017-05-08  1611  		}
2d669ceb69c276 Shin'ichiro Kawasaki 2021-03-16  1612  	}
dd88d313bef027 Damien Le Moal       2017-05-08  1613  =

dd88d313bef027 Damien Le Moal       2017-05-08  1614  	return true;
dd88d313bef027 Damien Le Moal       2017-05-08  1615  }
dd88d313bef027 Damien Le Moal       2017-05-08  1616  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5400124077250244207==--

