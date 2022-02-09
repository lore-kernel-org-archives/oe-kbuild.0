Content-Type: multipart/mixed; boundary="===============8385094290366580399=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10 9909/9999] mm/mmu_notifier.c:635:4: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Wed, 09 Feb 2022 23:09:31 +0800
Message-ID: <202202092334.G8KAhgqd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8385094290366580399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Suren Baghdasaryan <surenb@google.com>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android12-5.10
head:   2a2327c4e8ac335069586354b280031105b9980e
commit: 5d8520b5572a79257ea18410a0eca98000f872a7 [9909/9999] ANDROID: fix A=
BI breakage caused by mm_struct->mmu_notifier_lock addition
:::::: branch date: 12 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-c007-20220207 (https://download.01.org/0day-ci/ar=
chive/20220209/202202092334.G8KAhgqd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850=
ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/5d8520b5572a792=
57ea18410a0eca98000f872a7
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android12-5.10
        git checkout 5d8520b5572a79257ea18410a0eca98000f872a7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^
   drivers/gpio/gpiolib-of.c:1012:6: note: Assuming field 'of_node' is non-=
null
           if (!chip->of_node)
               ^~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:1012:2: note: Taking false branch
           if (!chip->of_node)
           ^
   drivers/gpio/gpiolib-of.c:1015:6: note: Assuming field 'of_xlate' is non=
-null
           if (!chip->of_xlate) {
               ^~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:1015:2: note: Taking false branch
           if (!chip->of_xlate) {
           ^
   drivers/gpio/gpiolib-of.c:1020:6: note: Assuming field 'of_gpio_n_cells'=
 is <=3D MAX_PHANDLE_ARGS
           if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:1020:2: note: Taking false branch
           if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
           ^
   drivers/gpio/gpiolib-of.c:1026:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpio/gpiolib-of.c:1026:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpio/gpiolib-of.c:1031:8: note: Calling 'of_gpiochip_scan_gpios'
           ret =3D of_gpiochip_scan_gpios(chip);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:689:50: note: Assuming 'np' is not equal to nu=
ll
           for_each_available_child_of_node(chip->of_node, np) {
                                                           ^
   include/linux/of.h:1278:58: note: expanded from macro 'for_each_availabl=
e_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
                                                                   ^~~~~~~~=
~~~~~
   drivers/gpio/gpiolib-of.c:689:2: note: Loop condition is true.  Entering=
 loop body
           for_each_available_child_of_node(chip->of_node, np) {
           ^
   include/linux/of.h:1278:2: note: expanded from macro 'for_each_available=
_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
           ^
   drivers/gpio/gpiolib-of.c:690:3: note: Taking false branch
                   if (!of_property_read_bool(np, "gpio-hog"))
                   ^
   drivers/gpio/gpiolib-of.c:693:9: note: Calling 'of_gpiochip_add_hog'
                   ret =3D of_gpiochip_add_hog(chip, np);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:655:2: note: 'name' declared without an initia=
l value
           const char *name;
           ^~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:659:2: note: Loop condition is true.  Entering=
 loop body
           for (i =3D 0;; i++) {
           ^
   drivers/gpio/gpiolib-of.c:660:10: note: Calling 'of_parse_own_gpio'
                   desc =3D of_parse_own_gpio(hog, chip, i, &name, &lflags,=
 &dflags);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpio/gpiolib-of.c:591:7: note: 'chip_np' is non-null
           if (!chip_np)
                ^~~~~~~
   drivers/gpio/gpiolib-of.c:591:2: note: Taking false branch
           if (!chip_np)
           ^
   drivers/gpio/gpiolib-of.c:599:6: note: 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/gpio/gpiolib-of.c:599:2: note: Taking true branch
           if (ret)
           ^
   drivers/gpio/gpiolib-of.c:600:3: note: Returning without writing to '*na=
me'
                   return ERR_PTR(ret);
                   ^
   drivers/gpio/gpiolib-of.c:660:10: note: Returning from 'of_parse_own_gpi=
o'
                   desc =3D of_parse_own_gpio(hog, chip, i, &name, &lflags,=
 &dflags);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpio/gpiolib-of.c:661:7: note: Calling 'IS_ERR'
                   if (IS_ERR(desc))
                       ^~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:661:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(desc))
                       ^~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c:661:3: note: Taking false branch
                   if (IS_ERR(desc))
                   ^
   drivers/gpio/gpiolib-of.c:664:9: note: 2nd function call argument is an =
uninitialized value
                   ret =3D gpiod_hog(desc, name, lflags, dflags);
                         ^               ~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> mm/mmu_notifier.c:635:4: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
                   &mm->notifier_subscriptions->hdr.mmu_notifier_lock->rw_s=
em);
                    ^
   mm/mmu_notifier.c:1071:2: note: Calling 'mmap_assert_write_locked'
           mmap_assert_write_locked(mm);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:86:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held_write(&mm->mmap_lock);
           ^
   include/linux/lockdep.h:309:11: note: expanded from macro 'lockdep_asser=
t_held_write'
                   WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));    \
                           ^~~~~~~~~~~
   include/asm-generic/bug.h:119:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/linux/mmap_lock.h:86:2: note: Left side of '&&' is false
           lockdep_assert_held_write(&mm->mmap_lock);
           ^
   include/linux/lockdep.h:309:23: note: expanded from macro 'lockdep_asser=
t_held_write'
                   WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));    \
                                       ^
   include/linux/mmap_lock.h:86:2: note: Taking false branch
           lockdep_assert_held_write(&mm->mmap_lock);
           ^
   include/linux/lockdep.h:309:3: note: expanded from macro 'lockdep_assert=
_held_write'
                   WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));    \
                   ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/mmap_lock.h:86:2: note: Loop condition is false.  Exiting =
loop
           lockdep_assert_held_write(&mm->mmap_lock);
           ^
   include/linux/lockdep.h:308:38: note: expanded from macro 'lockdep_asser=
t_held_write'
   #define lockdep_assert_held_write(l)    do {                    \
                                           ^
   include/linux/mmap_lock.h:87:2: note: Taking false branch
           VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
           ^
   include/linux/mmdebug.h:35:3: note: expanded from macro 'VM_BUG_ON_MM'
                   if (unlikely(cond)) {                                   \
                   ^
   include/linux/mmap_lock.h:87:2: note: Loop condition is false.  Exiting =
loop
           VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
           ^
   include/linux/mmdebug.h:34:2: note: expanded from macro 'VM_BUG_ON_MM'
           do {                                                            \
           ^
   include/linux/mmap_lock.h:88:1: note: Returning without writing to 'mm->=
.notifier_subscriptions'
   }
   ^
   mm/mmu_notifier.c:1071:2: note: Returning from 'mmap_assert_write_locked'
           mmap_assert_write_locked(mm);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mmu_notifier.c:1073:6: note: Assuming 'subscriptions' is null
           if (!subscriptions || !subscriptions->has_itree) {
               ^~~~~~~~~~~~~~
   mm/mmu_notifier.c:1073:21: note: Left side of '||' is true
           if (!subscriptions || !subscriptions->has_itree) {
                              ^
   mm/mmu_notifier.c:1074:9: note: Calling '__mmu_notifier_register'
                   ret =3D __mmu_notifier_register(NULL, mm);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mmu_notifier.c:672:2: note: Calling 'mmap_assert_write_locked'
           mmap_assert_write_locked(mm);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:86:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held_write(&mm->mmap_lock);
           ^
   include/linux/lockdep.h:309:11: note: expanded from macro 'lockdep_asser=
t_held_write'
                   WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));    \
                           ^~~~~~~~~~~
   include/asm-generic/bug.h:119:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/linux/mmap_lock.h:86:2: note: Left side of '&&' is false
           lockdep_assert_held_write(&mm->mmap_lock);
           ^
   include/linux/lockdep.h:309:23: note: expanded from macro 'lockdep_asser=
t_held_write'
                   WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));    \
                                       ^
   include/linux/mmap_lock.h:86:2: note: Taking false branch
           lockdep_assert_held_write(&mm->mmap_lock);
           ^
   include/linux/lockdep.h:309:3: note: expanded from macro 'lockdep_assert=
_held_write'
                   WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));    \
                   ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/mmap_lock.h:86:2: note: Loop condition is false.  Exiting =
loop
           lockdep_assert_held_write(&mm->mmap_lock);
           ^
   include/linux/lockdep.h:308:38: note: expanded from macro 'lockdep_asser=
t_held_write'
   #define lockdep_assert_held_write(l)    do {                    \
                                           ^
   include/linux/mmap_lock.h:87:2: note: Taking false branch
           VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
           ^
   include/linux/mmdebug.h:35:3: note: expanded from macro 'VM_BUG_ON_MM'
                   if (unlikely(cond)) {                                   \

vim +635 mm/mmu_notifier.c

6971350406a366f Suren Baghdasaryan 2021-11-04  631  =

6971350406a366f Suren Baghdasaryan 2021-11-04  632  static inline void mmu_=
notifier_write_lock(struct mm_struct *mm)
6971350406a366f Suren Baghdasaryan 2021-11-04  633  {
5d8520b5572a792 Suren Baghdasaryan 2021-11-24  634  	percpu_down_write(
5d8520b5572a792 Suren Baghdasaryan 2021-11-24 @635  		&mm->notifier_subscri=
ptions->hdr.mmu_notifier_lock->rw_sem);
6971350406a366f Suren Baghdasaryan 2021-11-04  636  }
6971350406a366f Suren Baghdasaryan 2021-11-04  637  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8385094290366580399==--

