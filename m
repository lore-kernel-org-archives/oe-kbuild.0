Content-Type: multipart/mixed; boundary="===============4961722393258074311=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/char/applicom.c:383:10: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Fri, 04 Mar 2022 01:19:36 +0800
Message-ID: <202203040129.a7SqmLzF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4961722393258074311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Florian Fainelli <f.fainelli@gmail.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5859a2b1991101d6b978f3feb5325dad39421f29
commit: 1d987052e32f3554e84a296c4494551bc60f3877 MIPS: BMIPS: Enable PCI Kc=
onfig
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-c004-20220227 (https://download.01.org/0day-ci/arch=
ive/20220304/202203040129.a7SqmLzF-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1d987052e32f3554e84a296c4494551bc60f3877
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1d987052e32f3554e84a296c4494551bc60f3877
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^
   mm/zsmalloc.c:723:9: note: Left side of '&&' is false
           head =3D list_first_entry_or_null(&class->fullness_list[fullness=
],
                  ^
   include/linux/list.h:546:20: note: expanded from macro 'list_first_entry=
_or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
                             ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   mm/zsmalloc.c:723:9: note: Taking false branch
           head =3D list_first_entry_or_null(&class->fullness_list[fullness=
],
                  ^
   include/linux/list.h:546:20: note: expanded from macro 'list_first_entry=
_or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
                             ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/zsmalloc.c:723:9: note: Loop condition is false.  Exiting loop
           head =3D list_first_entry_or_null(&class->fullness_list[fullness=
],
                  ^
   include/linux/list.h:546:20: note: expanded from macro 'list_first_entry=
_or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
                             ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/zsmalloc.c:729:6: note: Assuming pointer value is null
           if (head && get_zspage_inuse(zspage) < get_zspage_inuse(head))
               ^~~~
   mm/zsmalloc.c:729:6: note: Assuming 'head' is null
           if (head && get_zspage_inuse(zspage) < get_zspage_inuse(head))
               ^~~~
   mm/zsmalloc.c:729:11: note: Left side of '&&' is false
           if (head && get_zspage_inuse(zspage) < get_zspage_inuse(head))
                    ^
   mm/zsmalloc.c:732:3: note: Calling 'list_add'
                   list_add(&zspage->list, &class->fullness_list[fullness]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:86:24: note: Passing null pointer value via 3rd par=
ameter 'next'
           __list_add(new, head, head->next);
                                 ^~~~~~~~~~
   include/linux/list.h:86:2: note: Calling '__list_add'
           __list_add(new, head, head->next);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:67:6: note: Assuming the condition is false
           if (!__list_add_valid(new, prev, next))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:67:2: note: Taking false branch
           if (!__list_add_valid(new, prev, next))
           ^
   include/linux/list.h:70:13: note: Access to field 'prev' results in a de=
reference of a null pointer (loaded from variable 'next')
           next->prev =3D new;
           ~~~~       ^
   mm/zsmalloc.c:942:2: warning: Value stored to 'next' is never read [clan=
g-analyzer-deadcode.DeadStores]
           next =3D page =3D get_first_page(zspage);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:942:2: note: Value stored to 'next' is never read
           next =3D page =3D get_first_page(zspage);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/char/applicom.c:383:10: warning: Assigned value is garbage or un=
defined [clang-analyzer-core.uninitialized.Assign]
           NumCard =3D st_loc.num_card;      /* board number to send       =
   */
                   ^ ~~~~~~~~~~~~~~~
   drivers/char/applicom.c:366:6: note: Assuming the condition is false
           if (count !=3D sizeof(struct st_ram_io) + sizeof(struct mailbox)=
) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/applicom.c:366:2: note: Taking false branch
           if (count !=3D sizeof(struct st_ram_io) + sizeof(struct mailbox)=
) {
           ^
   drivers/char/applicom.c:376:5: note: Calling 'copy_from_user'
           if(copy_from_user(&st_loc, buf, sizeof(struct st_ram_io))) =

              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->num_card'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->n=
um_card'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->n=
um_card'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/char/applicom.c:376:5: note: Returning from 'copy_from_user'
           if(copy_from_user(&st_loc, buf, sizeof(struct st_ram_io))) =

              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/applicom.c:376:2: note: Taking false branch
           if(copy_from_user(&st_loc, buf, sizeof(struct st_ram_io))) =

           ^
   drivers/char/applicom.c:379:5: note: Calling 'copy_from_user'
           if(copy_from_user(&tmpmailbox, &buf[sizeof(struct st_ram_io)],
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
--
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to '*to'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/rapidio/rio_cm.c:1625:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&entries, arg, sizeof(entries)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio_cm.c:1625:2: note: Taking false branch
           if (copy_from_user(&entries, arg, sizeof(entries)))
           ^
   drivers/rapidio/rio_cm.c:1627:14: note: The left operand of '=3D=3D' is =
a garbage value
           if (entries =3D=3D 0 || entries > RIO_MAX_MPORTS)
               ~~~~~~~ ^
   drivers/rapidio/rio_cm.c:1720:20: warning: The left operand of '>=3D' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (chan.mport_id >=3D RIO_MAX_MPORTS)
                             ^
   drivers/rapidio/rio_cm.c:1899:2: note: Control jumps to 'case 2148033285=
:'  at line 1908
           switch (cmd) {
           ^
   drivers/rapidio/rio_cm.c:1909:10: note: Calling 'cm_chan_bind'
                   return cm_chan_bind((void __user *)arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio_cm.c:1718:6: note: Calling 'copy_from_user'
           if (copy_from_user(&chan, arg, sizeof(chan)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->mport_id'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->m=
port_id'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->m=
port_id'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/rapidio/rio_cm.c:1718:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&chan, arg, sizeof(chan)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio_cm.c:1718:2: note: Taking false branch
           if (copy_from_user(&chan, arg, sizeof(chan)))
           ^
   drivers/rapidio/rio_cm.c:1720:20: note: The left operand of '>=3D' is a =
garbage value
           if (chan.mport_id >=3D RIO_MAX_MPORTS)
               ~~~~~~~~~~~~~ ^
>> drivers/rapidio/rio_cm.c:1758:14: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
           accept_to =3D param.wait_to ?
                       ^
   drivers/rapidio/rio_cm.c:1899:2: note: Control jumps to 'case 3221775111=
:'  at line 1912
           switch (cmd) {
           ^
   drivers/rapidio/rio_cm.c:1913:10: note: Calling 'cm_chan_accept'
                   return cm_chan_accept(filp, (void __user *)arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio_cm.c:1752:6: note: Calling 'copy_from_user'
           if (copy_from_user(&param, arg, sizeof(param)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->wait_to'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->w=
ait_to'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->w=
ait_to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/rapidio/rio_cm.c:1752:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&param, arg, sizeof(param)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio_cm.c:1752:2: note: Taking false branch
           if (copy_from_user(&param, arg, sizeof(param)))
           ^
   drivers/rapidio/rio_cm.c:1755:2: note: Assuming the condition is false
           riocm_debug(CHOP, "on ch_%d by %s(%d)",
           ^
   drivers/rapidio/rio_cm.c:53:7: note: expanded from macro 'riocm_debug'
                   if (DBG_##level & dbg_level) \
                       ^~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/rapidio/rio_cm.c:1755:2: note: Taking false branch
           riocm_debug(CHOP, "on ch_%d by %s(%d)",
           ^
   drivers/rapidio/rio_cm.c:53:3: note: expanded from macro 'riocm_debug'
                   if (DBG_##level & dbg_level) \
                   ^
   drivers/rapidio/rio_cm.c:1755:2: note: Loop condition is false.  Exiting=
 loop
           riocm_debug(CHOP, "on ch_%d by %s(%d)",
           ^
   drivers/rapidio/rio_cm.c:52:2: note: expanded from macro 'riocm_debug'
           do { \
           ^
   drivers/rapidio/rio_cm.c:1758:14: note: Branch condition evaluates to a =
garbage value
           accept_to =3D param.wait_to ?
                       ^~~~~~~~~~~~~
   drivers/rapidio/rio_cm.c:1787:20: warning: The left operand of '>=3D' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (chan.mport_id >=3D RIO_MAX_MPORTS)
                             ^
   drivers/rapidio/rio_cm.c:1899:2: note: Control jumps to 'case 2148033288=
:'  at line 1914
           switch (cmd) {
           ^
   drivers/rapidio/rio_cm.c:1915:10: note: Calling 'cm_chan_connect'
--
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->v=
oice'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->v=
oice'
           return n;
           ^
   sound/drivers/opl3/opl3_synth.c:116:8: note: Returning from 'copy_from_u=
ser'
                           if (copy_from_user(&note, argp, sizeof(struct sn=
d_dm_fm_note)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   sound/drivers/opl3/opl3_synth.c:116:4: note: Taking false branch
                           if (copy_from_user(&note, argp, sizeof(struct sn=
d_dm_fm_note)))
                           ^
   sound/drivers/opl3/opl3_synth.c:118:11: note: Calling 'snd_opl3_play_not=
e'
                           return snd_opl3_play_note(opl3, &note);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/opl3/opl3_synth.c:400:23: note: Assuming field 'fm_mode' i=
s not equal to SNDRV_DM_FM_MODE_OPL3
           if (note->voice >=3D ((opl3->fm_mode =3D=3D SNDRV_DM_FM_MODE_OPL=
3) ?
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/opl3/opl3_synth.c:400:22: note: '?' condition is false
           if (note->voice >=3D ((opl3->fm_mode =3D=3D SNDRV_DM_FM_MODE_OPL=
3) ?
                               ^
   sound/drivers/opl3/opl3_synth.c:400:18: note: The left operand of '>=3D'=
 is a garbage value
           if (note->voice >=3D ((opl3->fm_mode =3D=3D SNDRV_DM_FM_MODE_OPL=
3) ?
               ~~~~~~~~~~~ ^
   sound/drivers/opl3/opl3_synth.c:447:16: warning: The left operand of '>'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (voice->op > 1)
                         ^
   sound/drivers/opl3/opl3_synth.c:85:17: note: Assuming 'opl3' is non-null
           if (snd_BUG_ON(!opl3))
                          ^
   include/sound/core.h:413:25: note: expanded from macro 'snd_BUG_ON'
           int __ret_warn_on =3D !!(condition); \
                                  ^~~~~~~~~
   sound/drivers/opl3/opl3_synth.c:85:2: note: Taking false branch
           if (snd_BUG_ON(!opl3))
           ^
   sound/drivers/opl3/opl3_synth.c:88:2: note: Control jumps to 'case 21486=
81763:'  at line 121
           switch (cmd) {
           ^
   sound/drivers/opl3/opl3_synth.c:127:8: note: Calling 'copy_from_user'
                           if (copy_from_user(&voice, argp, sizeof(struct s=
nd_dm_fm_voice)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->op'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->o=
p'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->o=
p'
           return n;
           ^
   sound/drivers/opl3/opl3_synth.c:127:8: note: Returning from 'copy_from_u=
ser'
                           if (copy_from_user(&voice, argp, sizeof(struct s=
nd_dm_fm_voice)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
   sound/drivers/opl3/opl3_synth.c:127:4: note: Taking false branch
                           if (copy_from_user(&voice, argp, sizeof(struct s=
nd_dm_fm_voice)))
                           ^
   sound/drivers/opl3/opl3_synth.c:129:11: note: Calling 'snd_opl3_set_voic=
e'
                           return snd_opl3_set_voice(opl3, &voice);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/opl3/opl3_synth.c:447:16: note: The left operand of '>' is=
 a garbage value
           if (voice->op > 1)
               ~~~~~~~~~ ^
>> sound/drivers/opl3/opl3_synth.c:547:6: warning: Branch condition evaluat=
es to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (params->kbd_split)
               ^
   sound/drivers/opl3/opl3_synth.c:85:17: note: Assuming 'opl3' is non-null
           if (snd_BUG_ON(!opl3))
                          ^
   include/sound/core.h:413:25: note: expanded from macro 'snd_BUG_ON'
           int __ret_warn_on =3D !!(condition); \
                                  ^~~~~~~~~
   sound/drivers/opl3/opl3_synth.c:85:2: note: Taking false branch
           if (snd_BUG_ON(!opl3))
           ^
   sound/drivers/opl3/opl3_synth.c:88:2: note: Control jumps to 'case 21480=
91940:'  at line 132
           switch (cmd) {
           ^
   sound/drivers/opl3/opl3_synth.c:138:8: note: Calling 'copy_from_user'
                           if (copy_from_user(&params, argp, sizeof(struct =
snd_dm_fm_params)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->kbd_split'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->k=
bd_split'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->k=
bd_split'
           return n;
           ^
   sound/drivers/opl3/opl3_synth.c:138:8: note: Returning from 'copy_from_u=
ser'
                           if (copy_from_user(&params, argp, sizeof(struct =
snd_dm_fm_params)))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   sound/drivers/opl3/opl3_synth.c:138:4: note: Taking false branch
                           if (copy_from_user(&params, argp, sizeof(struct =
snd_dm_fm_params)))
                           ^
   sound/drivers/opl3/opl3_synth.c:140:11: note: Calling 'snd_opl3_set_para=
ms'
                           return snd_opl3_set_params(opl3, &params);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/opl3/opl3_synth.c:547:6: note: Branch condition evaluates =
to a garbage value
           if (params->kbd_split)
               ^~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/comedi/drivers/amplc_pci230.c:1477:24: warning: Division by zero=
 [clang-analyzer-core.DivideZero]
           if (cmd->chanlist_len % subseq_len) {
               ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   drivers/comedi/drivers/amplc_pci230.c:1416:14: note: Assuming 'i' is >=
=3D field 'chanlist_len'
           for (i =3D 0; i < cmd->chanlist_len; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/amplc_pci230.c:1416:2: note: Loop condition is fa=
lse. Execution continues on line 1474
           for (i =3D 0; i < cmd->chanlist_len; i++) {
           ^
   drivers/comedi/drivers/amplc_pci230.c:1474:6: note: 'subseq_len' is equa=
l to 0
           if (subseq_len =3D=3D 0)
               ^~~~~~~~~~
   drivers/comedi/drivers/amplc_pci230.c:1474:2: note: Taking true branch
           if (subseq_len =3D=3D 0)
           ^
   drivers/comedi/drivers/amplc_pci230.c:1475:3: note: The value 0 is assig=
ned to 'subseq_len'
                   subseq_len =3D cmd->chanlist_len;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/amplc_pci230.c:1477:24: note: Division by zero
           if (cmd->chanlist_len % subseq_len) {
               ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/core/control.c:2197:13: note: Loop condition is false.  Exiting lo=
op
                   control =3D snd_kcontrol(card->controls.next);
                             ^
   include/sound/control.h:87:25: note: expanded from macro 'snd_kcontrol'
   #define snd_kcontrol(n) list_entry(n, struct snd_kcontrol, list)
                           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/core/control.c:2198:3: note: Use of memory after it is freed
                   snd_ctl_remove(card, control);
                   ^                    ~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   sound/pci/riptide/riptide.c:860:2: warning: Value stored to 'err' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   sound/pci/riptide/riptide.c:860:2: note: Value stored to 'err' is never =
read
           err =3D 0;
           ^     ~
   sound/pci/riptide/riptide.c:947:15: warning: The left operand of '<' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (sink[i] < E2SINK_MAX) {
                       ~~~~~~~ ^
   sound/pci/riptide/riptide.c:945:7: note: The value 0 is assigned to 'i'
           for (i =3D 0; i < E2SINK_MAX; i++) {
                ^~~~~
   sound/pci/riptide/riptide.c:945:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < E2SINK_MAX; i++) {
           ^
   sound/pci/riptide/riptide.c:946:3: note: Calling 'getsourcesink'
                   getsourcesink(cif, i, i, &src[i], &sink[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/riptide/riptide.c:961:6: note: Assuming the condition is true
           if (SEND_RSSV(cif, source, sink, &rptr) &&
               ^
   sound/pci/riptide/riptide.c:249:36: note: expanded from macro 'SEND_RSSV'
   #define SEND_RSSV(p,b,c,d)         sendcmd(p,PARM|RESP,RSSV,BYTE2(b)|BYT=
E3(c),RET(d))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   sound/pci/riptide/riptide.c:961:6: note: Left side of '&&' is true
           if (SEND_RSSV(cif, source, sink, &rptr) &&
               ^
   sound/pci/riptide/riptide.c:249:36: note: expanded from macro 'SEND_RSSV'
   #define SEND_RSSV(p,b,c,d)         sendcmd(p,PARM|RESP,RSSV,BYTE2(b)|BYT=
E3(c),RET(d))
                                      ^
   sound/pci/riptide/riptide.c:962:6: note: Assuming the condition is true
               SEND_RSSV(cif, source, sink, &rptr))
               ^
   sound/pci/riptide/riptide.c:249:36: note: expanded from macro 'SEND_RSSV'
   #define SEND_RSSV(p,b,c,d)         sendcmd(p,PARM|RESP,RSSV,BYTE2(b)|BYT=
E3(c),RET(d))
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   sound/pci/riptide/riptide.c:961:2: note: Taking true branch
           if (SEND_RSSV(cif, source, sink, &rptr) &&
           ^
   sound/pci/riptide/riptide.c:963:3: note: Returning without writing to '*=
b'
                   return -EIO;
                   ^
   sound/pci/riptide/riptide.c:946:3: note: Returning from 'getsourcesink'
                   getsourcesink(cif, i, i, &src[i], &sink[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/riptide/riptide.c:947:15: note: The left operand of '<' is a g=
arbage value
                   if (sink[i] < E2SINK_MAX) {
                       ~~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   sound/pci/rme9652/hdsp.c:3314:28: warning: Although the value stored to =
'kctl' is used in the enclosing expression, the value is never actually rea=
d from 'kctl' [clang-analyzer-deadcode.DeadStores]
                           err =3D snd_ctl_add(card, kctl =3D snd_ctl_new1(=
&snd_hdsp_rpm_controls[idx], hdsp));
                                                   ^      ~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdsp.c:3314:28: note: Although the value stored to 'kc=
tl' is used in the enclosing expression, the value is never actually read f=
rom 'kctl'
                           err =3D snd_ctl_add(card, kctl =3D snd_ctl_new1(=
&snd_hdsp_rpm_controls[idx], hdsp));
                                                   ^      ~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/pci/rme9652/hdsp.c:4887:17: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
                   firmware_data =3D (u32 __user *)firmware.firmware_data;
                                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdsp.c:4757:2: note: Control jumps to 'case 2147764290=
:'  at line 4871
           switch (cmd) {
           ^
   sound/pci/rme9652/hdsp.c:4876:7: note: Assuming field 'io_type' is not e=
qual to H9652
                   if (hdsp->io_type =3D=3D H9652 || hdsp->io_type =3D=3D H=
9632) return -EINVAL;
                       ^~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdsp.c:4876:7: note: Left side of '||' is false
   sound/pci/rme9652/hdsp.c:4876:33: note: Assuming field 'io_type' is not =
equal to H9632
                   if (hdsp->io_type =3D=3D H9652 || hdsp->io_type =3D=3D H=
9632) return -EINVAL;
                                                 ^~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdsp.c:4876:3: note: Taking false branch
                   if (hdsp->io_type =3D=3D H9652 || hdsp->io_type =3D=3D H=
9632) return -EINVAL;
                   ^
   sound/pci/rme9652/hdsp.c:4878:7: note: Assuming field 'io_type' is not e=
qual to Undefined
                   if (hdsp->io_type =3D=3D Undefined) return -EINVAL;
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/rme9652/hdsp.c:4878:3: note: Taking false branch
                   if (hdsp->io_type =3D=3D Undefined) return -EINVAL;
                   ^
   sound/pci/rme9652/hdsp.c:4880:7: note: Assuming the condition is false
                   if (hdsp->state & (HDSP_FirmwareCached | HDSP_FirmwareLo=
aded))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   sound/pci/rme9652/hdsp.c:4880:3: note: Taking false branch
                   if (hdsp->state & (HDSP_FirmwareCached | HDSP_FirmwareLo=
aded))
                   ^
   sound/pci/rme9652/hdsp.c:4883:3: note: Left side of '&&' is true
                   dev_info(hdsp->card->dev,
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   sound/pci/rme9652/hdsp.c:4883:3: note: Taking true branch
                   dev_info(hdsp->card->dev,
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   sound/pci/rme9652/hdsp.c:4883:3: note: '?' condition is true
                   dev_info(hdsp->card->dev,
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   sound/pci/rme9652/hdsp.c:4883:3: note: '?' condition is true
                   dev_info(hdsp->card->dev,
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   sound/pci/rme9652/hdsp.c:4883:3: note: Loop condition is false.  Exiting=
 loop
--
                               ^~~~~~~~~~~~
   net/sched/cls_flow.c:316:3: note: Loop condition is false. Execution con=
tinues on line 322
                   for (n =3D 0; n < f->nkeys; n++) {
                   ^
   net/sched/cls_flow.c:322:7: note: Assuming field 'mode' is not equal to =
FLOW_MODE_HASH
                   if (f->mode =3D=3D FLOW_MODE_HASH)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_flow.c:322:3: note: Taking false branch
                   if (f->mode =3D=3D FLOW_MODE_HASH)
                   ^
   net/sched/cls_flow.c:325:12: note: Assigned value is garbage or undefined
                           classid =3D keys[0];
                                   ^ ~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_display.c:148:9: warning: Dereference of=
 null pointer (loaded from variable 'kind') [clang-analyzer-core.NullDerefe=
rence]
                   *kind =3D 0;
                         ^
   drivers/gpu/drm/nouveau/nouveau_display.c:173:6: note: Assuming the cond=
ition is true
           if (fb->flags & DRM_MODE_FB_MODIFIERS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:173:2: note: Taking true branch
           if (fb->flags & DRM_MODE_FB_MODIFIERS) {
           ^
   drivers/gpu/drm/nouveau/nouveau_display.c:176:52: note: Passing value vi=
a 4th parameter 'kind'
                   nouveau_decode_mod(drm, fb->modifier, tile_mode, kind);
                                                                    ^~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:176:3: note: Calling 'nouveau_=
decode_mod'
                   nouveau_decode_mod(drm, fb->modifier, tile_mode, kind);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:143:9: note: Assuming 'tile_mo=
de' is non-null
           BUG_ON(!tile_mode || !kind);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/gpu/drm/nouveau/nouveau_display.c:143:9: note: Left side of '||'=
 is false
           BUG_ON(!tile_mode || !kind);
                  ^
   drivers/gpu/drm/nouveau/nouveau_display.c:143:23: note: Assuming 'kind' =
is null
           BUG_ON(!tile_mode || !kind);
                                ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/gpu/drm/nouveau/nouveau_display.c:145:6: note: Assuming the cond=
ition is true
           if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:145:2: note: Taking true branch
           if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR) {
           ^
   drivers/gpu/drm/nouveau/nouveau_display.c:148:9: note: Dereference of nu=
ll pointer (loaded from variable 'kind')
                   *kind =3D 0;
                    ~~~~ ^
   drivers/gpu/drm/nouveau/nouveau_display.c:161:9: warning: Dereference of=
 null pointer (loaded from variable 'kind') [clang-analyzer-core.NullDerefe=
rence]
                   *kind =3D (uint8_t)((modifier >> 12) & 0xFF);
                         ^
   drivers/gpu/drm/nouveau/nouveau_display.c:173:6: note: Assuming the cond=
ition is true
           if (fb->flags & DRM_MODE_FB_MODIFIERS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:173:2: note: Taking true branch
           if (fb->flags & DRM_MODE_FB_MODIFIERS) {
           ^
   drivers/gpu/drm/nouveau/nouveau_display.c:176:52: note: Passing value vi=
a 4th parameter 'kind'
                   nouveau_decode_mod(drm, fb->modifier, tile_mode, kind);
                                                                    ^~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:176:3: note: Calling 'nouveau_=
decode_mod'
                   nouveau_decode_mod(drm, fb->modifier, tile_mode, kind);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:143:9: note: Assuming 'tile_mo=
de' is non-null
           BUG_ON(!tile_mode || !kind);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/gpu/drm/nouveau/nouveau_display.c:143:9: note: Left side of '||'=
 is false
           BUG_ON(!tile_mode || !kind);
                  ^
   drivers/gpu/drm/nouveau/nouveau_display.c:143:23: note: Assuming 'kind' =
is null
           BUG_ON(!tile_mode || !kind);
                                ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/gpu/drm/nouveau/nouveau_display.c:145:6: note: Assuming the cond=
ition is false
           if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:145:2: note: Taking false bran=
ch
           if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR) {
           ^
   drivers/gpu/drm/nouveau/nouveau_display.c:155:7: note: Assuming the cond=
ition is false
                   if ((modifier & (0xffull << 12)) =3D=3D 0ull) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:155:3: note: Taking false bran=
ch
                   if ((modifier & (0xffull << 12)) =3D=3D 0ull) {
                   ^
   drivers/gpu/drm/nouveau/nouveau_display.c:161:9: note: Dereference of nu=
ll pointer (loaded from variable 'kind')
                   *kind =3D (uint8_t)((modifier >> 12) & 0xFF);
                    ~~~~ ^
>> drivers/gpu/drm/nouveau/nouveau_display.c:211:8: warning: Array access (=
via field 'format_modifiers') results in a null pointer dereference [clang-=
analyzer-core.NullDereference]
                (disp->format_modifiers[mod] !=3D DRM_FORMAT_MOD_INVALID) &&
                 ^
   drivers/gpu/drm/nouveau/nouveau_display.c:390:6: note: Assuming 'gem' is=
 non-null
           if (!gem)
               ^~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:390:2: note: Taking false bran=
ch
           if (!gem)
           ^
   drivers/gpu/drm/nouveau/nouveau_display.c:393:8: note: Calling 'nouveau_=
framebuffer_new'
           ret =3D nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:315:6: note: Assuming field 'f=
amily' is >=3D NV_DEVICE_INFO_V0_TESLA
           if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:315:63: note: Left side of '&&=
' is false
           if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
                                                                        ^
   drivers/gpu/drm/nouveau/nouveau_display.c:331:6: note: Assuming the cond=
ition is true
           if (mode_cmd->flags & DRM_MODE_FB_MODIFIERS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:331:2: note: Taking true branch
           if (mode_cmd->flags & DRM_MODE_FB_MODIFIERS) {
           ^
   drivers/gpu/drm/nouveau/nouveau_display.c:332:7: note: Calling 'nouveau_=
validate_decode_mod'
                   if (nouveau_validate_decode_mod(drm, mode_cmd->modifier[=
0],
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:204:30: note: Field 'family' i=
s >=3D NV_DEVICE_INFO_V0_TESLA
           if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
                                       ^
   drivers/gpu/drm/nouveau/nouveau_display.c:204:2: note: Taking false bran=
ch
           if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
           ^
   drivers/gpu/drm/nouveau/nouveau_display.c:208:9: note: Assuming field 'f=
ormat_modifiers' is null
           BUG_ON(!disp->format_modifiers);
                  ^
   arch/mips/include/asm/bug.h:34:44: note: expanded from macro 'BUG_ON'
   #define BUG_ON(C) __BUG_ON((unsigned long)(C))
                                              ^
   drivers/gpu/drm/nouveau/nouveau_display.c:211:8: note: Array access (via=
 field 'format_modifiers') results in a null pointer dereference
                (disp->format_modifiers[mod] !=3D DRM_FORMAT_MOD_INVALID) &&
                 ^     ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:346:3: warning: Value stored t=
o 'width' is never read [clang-analyzer-deadcode.DeadStores]
                   width =3D drm_format_info_plane_width(info,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_display.c:346:3: note: Value stored to '=
width' is never read
                   width =3D drm_format_info_plane_width(info,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/leds/leds-pca9532.c:516:23: warning: Value stored to 'data' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca9532.c:516:23: note: Value stored to 'data' during =
its initialization is never read
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   sound/core/pcm_lib.c:240:43: warning: The right operand of '!=3D' is a g=
arbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (runtime->status->audio_tstamp.tv_sec !=3D audio_tstamp->tv_s=
ec ||

vim +383 drivers/char/applicom.c

^1da177e4c3f415 Linus Torvalds      2005-04-16  351  =

^1da177e4c3f415 Linus Torvalds      2005-04-16  352  =

^1da177e4c3f415 Linus Torvalds      2005-04-16  353  static ssize_t ac_writ=
e(struct file *file, const char __user *buf, size_t count, loff_t * ppos)
^1da177e4c3f415 Linus Torvalds      2005-04-16  354  {
^1da177e4c3f415 Linus Torvalds      2005-04-16  355  	unsigned int NumCard;=
	/* Board number 1 -> 8           */
^1da177e4c3f415 Linus Torvalds      2005-04-16  356  	unsigned int IndexCar=
d;	/* Index board number 0 -> 7     */
^1da177e4c3f415 Linus Torvalds      2005-04-16  357  	unsigned char TicCard=
;	/* Board TIC to send             */
^1da177e4c3f415 Linus Torvalds      2005-04-16  358  	unsigned long flags;	=
/* Current priority              */
^1da177e4c3f415 Linus Torvalds      2005-04-16  359  	struct st_ram_io st_l=
oc;
^1da177e4c3f415 Linus Torvalds      2005-04-16  360  	struct mailbox tmpmai=
lbox;
^1da177e4c3f415 Linus Torvalds      2005-04-16  361  #ifdef DEBUG
^1da177e4c3f415 Linus Torvalds      2005-04-16  362  	int c;
^1da177e4c3f415 Linus Torvalds      2005-04-16  363  #endif
^1da177e4c3f415 Linus Torvalds      2005-04-16  364  	DECLARE_WAITQUEUE(wai=
t, current);
^1da177e4c3f415 Linus Torvalds      2005-04-16  365  =

^1da177e4c3f415 Linus Torvalds      2005-04-16  366  	if (count !=3D sizeof=
(struct st_ram_io) + sizeof(struct mailbox)) {
^1da177e4c3f415 Linus Torvalds      2005-04-16  367  		static int warncount=
 =3D 5;
^1da177e4c3f415 Linus Torvalds      2005-04-16  368  		if (warncount) {
^1da177e4c3f415 Linus Torvalds      2005-04-16  369  			printk(KERN_INFO "H=
mmm. write() of Applicom card, length %zd !=3D expected %zd\n",
^1da177e4c3f415 Linus Torvalds      2005-04-16  370  			       count, sizeo=
f(struct st_ram_io) + sizeof(struct mailbox));
^1da177e4c3f415 Linus Torvalds      2005-04-16  371  			warncount--;
^1da177e4c3f415 Linus Torvalds      2005-04-16  372  		}
^1da177e4c3f415 Linus Torvalds      2005-04-16  373  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds      2005-04-16  374  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  375  =

^1da177e4c3f415 Linus Torvalds      2005-04-16  376  	if(copy_from_user(&st=
_loc, buf, sizeof(struct st_ram_io))) =

^1da177e4c3f415 Linus Torvalds      2005-04-16  377  		return -EFAULT;
^1da177e4c3f415 Linus Torvalds      2005-04-16  378  	=

^1da177e4c3f415 Linus Torvalds      2005-04-16  379  	if(copy_from_user(&tm=
pmailbox, &buf[sizeof(struct st_ram_io)],
^1da177e4c3f415 Linus Torvalds      2005-04-16  380  			  sizeof(struct mai=
lbox))) =

^1da177e4c3f415 Linus Torvalds      2005-04-16  381  		return -EFAULT;
^1da177e4c3f415 Linus Torvalds      2005-04-16  382  =

^1da177e4c3f415 Linus Torvalds      2005-04-16 @383  	NumCard =3D st_loc.nu=
m_card;	/* board number to send          */
^1da177e4c3f415 Linus Torvalds      2005-04-16  384  	TicCard =3D st_loc.ti=
c_des_from_pc;	/* tic number to send            */
^1da177e4c3f415 Linus Torvalds      2005-04-16  385  	IndexCard =3D NumCard=
 - 1;
^1da177e4c3f415 Linus Torvalds      2005-04-16  386  =

d7ac3c6ef5d8ce1 Gustavo A. R. Silva 2019-01-09  387  	if (IndexCard >=3D MA=
X_BOARD)
d7ac3c6ef5d8ce1 Gustavo A. R. Silva 2019-01-09  388  		return -EINVAL;
d7ac3c6ef5d8ce1 Gustavo A. R. Silva 2019-01-09  389  	IndexCard =3D array_i=
ndex_nospec(IndexCard, MAX_BOARD);
d7ac3c6ef5d8ce1 Gustavo A. R. Silva 2019-01-09  390  =

d7ac3c6ef5d8ce1 Gustavo A. R. Silva 2019-01-09  391  	if (!apbs[IndexCard].=
RamIO)
^1da177e4c3f415 Linus Torvalds      2005-04-16  392  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds      2005-04-16  393  =


:::::: The code at line 383 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4961722393258074311==--

