Content-Type: multipart/mixed; boundary="===============2121959901449860405=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/rculist.h:167:14: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 17 Jul 2022 08:22:14 +0800
Message-ID: <202207170800.BO62Vvm7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2121959901449860405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/rculist.h:167:14: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Abeni <pabeni@redhat.com>
CC: Mat Martineau <mathew.j.martineau@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   972a278fe60c361eb8f37619f562f092e8786d7c
commit: a0eea5f10eeb5180d115452b0d77afa6603dfe18 mptcp: fix memory leak on =
address flush
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220715 (https://download.01.org/0day-ci/arch=
ive/20220717/202207170800.BO62Vvm7-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550=
140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da0eea5f10eeb5180d115452b0d77afa6603dfe18
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a0eea5f10eeb5180d115452b0d77afa6603dfe18
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/mptcp/pm_netlink.c:1286:3: note: Calling '__mptcp_pm_release_addr_en=
try'
                   __mptcp_pm_release_addr_entry(cur);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1141:6: note: Assuming field 'lsk' is null
           if (entry->lsk)
               ^~~~~~~~~~
   net/mptcp/pm_netlink.c:1141:2: note: Taking false branch
           if (entry->lsk)
           ^
   net/mptcp/pm_netlink.c:1143:2: note: Memory is released
           kfree(entry);
           ^~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1286:3: note: Returning; memory was released via =
1st parameter
                   __mptcp_pm_release_addr_entry(cur);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1280:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(list)) {
           ^
   net/mptcp/pm_netlink.c:1283:9: note: Left side of '&&' is false
                   cur =3D list_entry(list->next,
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/mptcp/pm_netlink.c:1283:9: note: Taking false branch
                   cur =3D list_entry(list->next,
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/mptcp/pm_netlink.c:1283:9: note: Loop condition is false.  Exiting l=
oop
                   cur =3D list_entry(list->next,
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/mptcp/pm_netlink.c:1285:3: note: Calling 'list_del_rcu'
                   list_del_rcu(&cur->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rculist.h:166:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
>> include/linux/rculist.h:167:14: warning: Use of memory after it is freed=
 [clang-analyzer-unix.Malloc]
           entry->prev =3D LIST_POISON2;
                       ^
   net/mptcp/pm_netlink.c:1311:2: note: Calling '__flush_addrs'
           __flush_addrs(&free_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1280:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(list)) {
           ^
   net/mptcp/pm_netlink.c:1283:9: note: Left side of '&&' is false
                   cur =3D list_entry(list->next,
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/mptcp/pm_netlink.c:1283:9: note: Taking false branch
                   cur =3D list_entry(list->next,
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/mptcp/pm_netlink.c:1283:9: note: Loop condition is false.  Exiting l=
oop
                   cur =3D list_entry(list->next,
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/mptcp/pm_netlink.c:1286:3: note: Calling '__mptcp_pm_release_addr_en=
try'
                   __mptcp_pm_release_addr_entry(cur);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1141:6: note: Assuming field 'lsk' is null
           if (entry->lsk)
               ^~~~~~~~~~
   net/mptcp/pm_netlink.c:1141:2: note: Taking false branch
           if (entry->lsk)
           ^
   net/mptcp/pm_netlink.c:1143:2: note: Memory is released
           kfree(entry);
           ^~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1286:3: note: Returning; memory was released via =
1st parameter
                   __mptcp_pm_release_addr_entry(cur);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1280:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(list)) {
           ^
   net/mptcp/pm_netlink.c:1283:9: note: Left side of '&&' is false
                   cur =3D list_entry(list->next,
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/mptcp/pm_netlink.c:1283:9: note: Taking false branch
                   cur =3D list_entry(list->next,
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)

vim +167 include/linux/rculist.h

82524746c27fa41 Franck Bui-Huu 2008-05-12  139  =

82524746c27fa41 Franck Bui-Huu 2008-05-12  140  /**
82524746c27fa41 Franck Bui-Huu 2008-05-12  141   * list_del_rcu - deletes e=
ntry from list without re-initialization
82524746c27fa41 Franck Bui-Huu 2008-05-12  142   * @entry: the element to d=
elete from the list.
82524746c27fa41 Franck Bui-Huu 2008-05-12  143   *
82524746c27fa41 Franck Bui-Huu 2008-05-12  144   * Note: list_empty() on en=
try does not return true after this,
82524746c27fa41 Franck Bui-Huu 2008-05-12  145   * the entry is in an undef=
ined state. It is useful for RCU based
82524746c27fa41 Franck Bui-Huu 2008-05-12  146   * lockfree traversal.
82524746c27fa41 Franck Bui-Huu 2008-05-12  147   *
82524746c27fa41 Franck Bui-Huu 2008-05-12  148   * In particular, it means =
that we can not poison the forward
82524746c27fa41 Franck Bui-Huu 2008-05-12  149   * pointers that may still =
be used for walking the list.
82524746c27fa41 Franck Bui-Huu 2008-05-12  150   *
82524746c27fa41 Franck Bui-Huu 2008-05-12  151   * The caller must take wha=
tever precautions are necessary
82524746c27fa41 Franck Bui-Huu 2008-05-12  152   * (such as holding appropr=
iate locks) to avoid racing
82524746c27fa41 Franck Bui-Huu 2008-05-12  153   * with another list-mutati=
on primitive, such as list_del_rcu()
82524746c27fa41 Franck Bui-Huu 2008-05-12  154   * or list_add_rcu(), runni=
ng on this same list.
82524746c27fa41 Franck Bui-Huu 2008-05-12  155   * However, it is perfectly=
 legal to run concurrently with
82524746c27fa41 Franck Bui-Huu 2008-05-12  156   * the _rcu list-traversal =
primitives, such as
82524746c27fa41 Franck Bui-Huu 2008-05-12  157   * list_for_each_entry_rcu(=
).
82524746c27fa41 Franck Bui-Huu 2008-05-12  158   *
82524746c27fa41 Franck Bui-Huu 2008-05-12  159   * Note that the caller is =
not permitted to immediately free
82524746c27fa41 Franck Bui-Huu 2008-05-12  160   * the newly deleted entry.=
  Instead, either synchronize_rcu()
82524746c27fa41 Franck Bui-Huu 2008-05-12  161   * or call_rcu() must be us=
ed to defer freeing until an RCU
82524746c27fa41 Franck Bui-Huu 2008-05-12  162   * grace period has elapsed.
82524746c27fa41 Franck Bui-Huu 2008-05-12  163   */
82524746c27fa41 Franck Bui-Huu 2008-05-12  164  static inline void list_del=
_rcu(struct list_head *entry)
82524746c27fa41 Franck Bui-Huu 2008-05-12  165  {
559f9badd11ddf3 Dave Jones     2012-03-14  166  	__list_del_entry(entry);
82524746c27fa41 Franck Bui-Huu 2008-05-12 @167  	entry->prev =3D LIST_POISO=
N2;
82524746c27fa41 Franck Bui-Huu 2008-05-12  168  }
82524746c27fa41 Franck Bui-Huu 2008-05-12  169  =


:::::: The code at line 167 was first introduced by commit
:::::: 82524746c27fa418c250a56dd7606b9d3fc79826 rcu: split list.h and move =
rcu-protected lists into rculist.h

:::::: TO: Franck Bui-Huu <fbuihuu@gmail.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2121959901449860405==--

