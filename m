Content-Type: multipart/mixed; boundary="===============1547711561567053181=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/list.h:320:27: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 10 Jan 2022 23:26:03 +0800
Message-ID: <202201102349.Ho1R2PX0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1547711561567053181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   9 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-c007-20220106 (https://download.01.org/0day-ci/ar=
chive/20220110/202201102349.Ho1R2PX0-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe=
09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/spinlock.h:253:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/md/raid5.c:332:4: note: Loop condition is false.  Exiting loop
                           spin_lock_irqsave(conf->hash_locks + hash, flags=
);
                           ^
   include/linux/spinlock.h:390:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/md/raid5.c:333:8: note: Assuming the condition is true
                           if (list_empty(conf->inactive_list + hash) &&
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:333:8: note: Left side of '&&' is true
   drivers/md/raid5.c:334:9: note: Calling 'list_empty'
                               !list_empty(list))
                                ^~~~~~~~~~~~~~~~
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is true
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   include/linux/list.h:284:9: note: Taking false branch
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:314:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:284:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:312:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:284:31: note: The left operand of '=3D=3D' is a gar=
bage value
           return READ_ONCE(head->next) =3D=3D head;
                                        ^
>> include/linux/list.h:320:27: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
           struct list_head *next =3D smp_load_acquire(&head->next);
                                    ^
   include/asm-generic/barrier.h:171:2: note: expanded from macro 'smp_load=
_acquire'
           __unqual_scalar_typeof(*p) ___p1 =3D READ_ONCE(*p);             =
  \
           ^
   include/linux/compiler_types.h:290:35: note: expanded from macro '__unqu=
al_scalar_typeof'
   #define __unqual_scalar_typeof(x) typeof(                               \
                                     ^
   drivers/md/raid5.c:8630:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/md/raid5.c:8630:2: note: Taking false branch
           if (err)
           ^
   drivers/md/raid5.c:8633:6: note: Assuming 'conf' is non-null
           if (!conf) {
               ^~~~~
   drivers/md/raid5.c:8633:2: note: Taking false branch
           if (!conf) {
           ^
   drivers/md/raid5.c:8638:2: note: Taking true branch
           if (strncmp(buf, "ppl", 3) =3D=3D 0) {
           ^
   drivers/md/raid5.c:8640:7: note: Assuming the condition is true
                   if (!raid5_has_ppl(conf) && conf->level =3D=3D 5) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/md/raid5.c:8640:7: note: Left side of '&&' is true
   drivers/md/raid5.c:8640:31: note: Assuming field 'level' is equal to 5
                   if (!raid5_has_ppl(conf) && conf->level =3D=3D 5) {
                                               ^~~~~~~~~~~~~~~~
   drivers/md/raid5.c:8640:3: note: Taking true branch
                   if (!raid5_has_ppl(conf) && conf->level =3D=3D 5) {
                   ^
   drivers/md/raid5.c:8642:8: note: Assuming 'err' is 0
                           if (!err) {
                               ^~~~
   drivers/md/raid5.c:8642:4: note: Taking true branch
                           if (!err) {
                           ^
   drivers/md/raid5.c:8643:11: note: Calling 'resize_stripes'
                                   err =3D resize_stripes(conf, conf->pool_=
size);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/md/raid5.c:2500:6: note: Assuming 'sc' is non-null
           if (!sc)
               ^~~
   drivers/md/raid5.c:2500:2: note: Taking false branch
           if (!sc)
           ^
   drivers/md/raid5.c:2506:2: note: Loop condition is true.  Entering loop =
body
           for (i =3D conf->max_nr_stripes; i; i--) {
           ^
   drivers/md/raid5.c:2508:8: note: 'nsh' is non-null
                   if (!nsh)
                        ^~~
   drivers/md/raid5.c:2508:3: note: Taking false branch
                   if (!nsh)
                   ^
   drivers/md/raid5.c:2506:2: note: Loop condition is false. Execution cont=
inues on line 2513
           for (i =3D conf->max_nr_stripes; i; i--) {
           ^
   drivers/md/raid5.c:2513:6: note: 'i' is 0
           if (i) {
               ^
   drivers/md/raid5.c:2513:2: note: Taking false branch
           if (i) {
           ^
   drivers/md/raid5.c:2530:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry(nsh, &newstripes, lru) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/md/raid5.c:2533:9: note: Assuming the condition is false
                                       !list_empty(conf->inactive_list + ha=
sh),
                                       ^
   include/linux/wait.h:446:6: note: expanded from macro 'wait_event_cmd'
           if (condition)                                                  =
        \
               ^~~~~~~~~
   drivers/md/raid5.c:2532:3: note: Taking false branch
                   wait_event_cmd(conf->wait_for_stripe,
                   ^
   include/linux/wait.h:446:2: note: expanded from macro 'wait_event_cmd'
           if (condition)                                                  =
        \
           ^
   drivers/md/raid5.c:2532:3: note: '?' condition is false
                   wait_event_cmd(conf->wait_for_stripe,
                   ^
   include/linux/wait.h:448:2: note: expanded from macro 'wait_event_cmd'
           __wait_event_cmd(wq_head, condition, cmd1, cmd2);               =
        \
           ^
   include/linux/wait.h:427:64: note: expanded from macro '__wait_event_cmd'
           (void)___wait_event(wq_head, condition, TASK_UNINTERRUPTIBLE, 0,=
 0,     \
                                                                         ^
   drivers/md/raid5.c:2532:3: note: Loop condition is true.  Entering loop =
body
                   wait_event_cmd(conf->wait_for_stripe,
                   ^
   include/linux/wait.h:448:2: note: expanded from macro 'wait_event_cmd'
           __wait_event_cmd(wq_head, condition, cmd1, cmd2);               =
        \
           ^
   include/linux/wait.h:427:8: note: expanded from macro '__wait_event_cmd'

vim +320 include/linux/list.h

c6fe44d96fc153 Linus Torvalds   2020-07-23  304  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  305  /**
fe96e57d77481c Randy Dunlap     2006-06-25  306   * list_empty_careful - te=
sts whether a list is empty and not being modified
fe96e57d77481c Randy Dunlap     2006-06-25  307   * @head: the list to test
fe96e57d77481c Randy Dunlap     2006-06-25  308   *
fe96e57d77481c Randy Dunlap     2006-06-25  309   * Description:
fe96e57d77481c Randy Dunlap     2006-06-25  310   * tests whether a list is=
 empty _and_ checks that no other CPU might be
fe96e57d77481c Randy Dunlap     2006-06-25  311   * in the process of modif=
ying either member (next or prev)
^1da177e4c3f41 Linus Torvalds   2005-04-16  312   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  313   * NOTE: using list_empty_=
careful() without synchronization
^1da177e4c3f41 Linus Torvalds   2005-04-16  314   * can only be safe if the=
 only activity that can happen
^1da177e4c3f41 Linus Torvalds   2005-04-16  315   * to the list entry is li=
st_del_init(). Eg. it cannot be used
^1da177e4c3f41 Linus Torvalds   2005-04-16  316   * if another CPU could re=
-list_add() it.
^1da177e4c3f41 Linus Torvalds   2005-04-16  317   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  318  static inline int list_emp=
ty_careful(const struct list_head *head)
^1da177e4c3f41 Linus Torvalds   2005-04-16  319  {
c6fe44d96fc153 Linus Torvalds   2020-07-23 @320  	struct list_head *next =
=3D smp_load_acquire(&head->next);
^1da177e4c3f41 Linus Torvalds   2005-04-16  321  	return (next =3D=3D head)=
 && (next =3D=3D head->prev);
99602572812442 Masami Hiramatsu 2008-04-28  322  }
99602572812442 Masami Hiramatsu 2008-04-28  323  =


:::::: The code at line 320 was first introduced by commit
:::::: c6fe44d96fc1536af5b11cd859686453d1b7bfd1 list: add "list_del_init_ca=
reful()" to go with "list_empty_careful()"

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1547711561567053181==--

