Content-Type: multipart/mixed; boundary="===============6157549074918274142=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/ceph/mdsmap.h:56:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Wed, 02 Feb 2022 18:16:05 +0800
Message-ID: <202202021820.DpghlOur-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6157549074918274142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xiubo Li <xiubli@redhat.com>
CC: Ilya Dryomov <idryomov@gmail.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f7fb8de5d9bac17b6392a14af40baf555d9129b
commit: d517b3983dd3106ca92d6c5d0d09415a4a09481c ceph: reconnect to the exp=
ort targets on new mdsmaps
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220129 (https://download.01.org/0day-ci/arc=
hive/20220202/202202021820.DpghlOur-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd517b3983dd3106ca92d6c5d0d09415a4a09481c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d517b3983dd3106ca92d6c5d0d09415a4a09481c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/ceph/mds_client.c:4934:8: note: 'session' is non-null
                   if (!session)
                        ^~~~~~~
   fs/ceph/mds_client.c:4934:3: note: Taking false branch
                   if (!session)
                   ^
   fs/ceph/mds_client.c:4937:7: note: Assuming field 's_state' is equal to =
CEPH_MDS_SESSION_REJECTED
                   if (session->s_state =3D=3D CEPH_MDS_SESSION_REJECTED)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4937:3: note: Taking true branch
                   if (session->s_state =3D=3D CEPH_MDS_SESSION_REJECTED)
                   ^
   fs/ceph/mds_client.c:4938:4: note: Calling '__unregister_session'
                           __unregister_session(mdsc, session);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:786:2: note: Taking false branch
           dout("__unregister_session mds%d %p\n", s->s_mds, s);
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   fs/ceph/mds_client.c:786:2: note: Loop condition is false.  Exiting loop
           dout("__unregister_session mds%d %p\n", s->s_mds, s);
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   fs/ceph/mds_client.c:787:2: note: Assuming the condition is false
           BUG_ON(mdsc->sessions[s->s_mds] !=3D s);
           ^
   include/asm-generic/bug.h:161:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:787:2: note: Taking false branch
           BUG_ON(mdsc->sessions[s->s_mds] !=3D s);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ceph/mds_client.c:787:2: note: Loop condition is false.  Exiting loop
           BUG_ON(mdsc->sessions[s->s_mds] !=3D s);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ceph/mds_client.c:790:2: note: Calling 'ceph_put_mds_session'
           ceph_put_mds_session(s);
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:668:2: note: Taking false branch
           if (IS_ERR_OR_NULL(s))
           ^
   fs/ceph/mds_client.c:671:2: note: Taking false branch
           dout("mdsc put_session %p %d -> %d\n", s,
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   fs/ceph/mds_client.c:671:2: note: Loop condition is false.  Exiting loop
           dout("mdsc put_session %p %d -> %d\n", s,
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   fs/ceph/mds_client.c:673:2: note: Taking true branch
           if (refcount_dec_and_test(&s->s_ref)) {
           ^
   fs/ceph/mds_client.c:674:7: note: Assuming field 'authorizer' is null
                   if (s->s_auth.authorizer)
                       ^~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:674:3: note: Taking false branch
                   if (s->s_auth.authorizer)
                   ^
   fs/ceph/mds_client.c:676:3: note: Assuming the condition is false
                   WARN_ON(mutex_is_locked(&s->s_mutex));
                   ^
   include/asm-generic/bug.h:166:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   fs/ceph/mds_client.c:678:3: note: Memory is released
                   kfree(s);
                   ^~~~~~~~
   fs/ceph/mds_client.c:790:2: note: Returning; memory was released via 1st=
 parameter
           ceph_put_mds_session(s);
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4938:4: note: Returning; memory was released via 2n=
d parameter
                           __unregister_session(mdsc, session);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4943:3: note: Use of memory after it is freed
                   __close_session(mdsc, session);
                   ^                     ~~~~~~~
   fs/ceph/mds_client.c:5083:2: warning: Value stored to 'maplen' is never =
read [clang-analyzer-deadcode.DeadStores]
           maplen =3D ceph_decode_32(&p);
           ^        ~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:5083:2: note: Value stored to 'maplen' is never read
           maplen =3D ceph_decode_32(&p);
           ^        ~~~~~~~~~~~~~~~~~~
>> include/linux/ceph/mdsmap.h:56:9: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
           return m->m_info[w].state;
                  ^
   fs/ceph/mds_client.c:4180:2: note: Taking false branch
           dout("check_new_map new %u old %u\n",
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   fs/ceph/mds_client.c:4180:2: note: Loop condition is false.  Exiting loop
           dout("check_new_map new %u old %u\n",
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   fs/ceph/mds_client.c:4183:6: note: Assuming field 'm_info' is null
           if (newmap->m_info) {
               ^~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4183:2: note: Taking false branch
           if (newmap->m_info) {
           ^
   fs/ceph/mds_client.c:4190:14: note: Assuming 'i' is >=3D field 'possible=
_max_rank'
           for (i =3D 0; i < oldmap->possible_max_rank && i < mdsc->max_ses=
sions; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4190:44: note: Left side of '&&' is false
           for (i =3D 0; i < oldmap->possible_max_rank && i < mdsc->max_ses=
sions; i++) {
                                                     ^
   fs/ceph/mds_client.c:4269:14: note: Assuming 'i' is < field 'possible_ma=
x_rank'
           for (i =3D 0; i < newmap->possible_max_rank; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/mds_client.c:4269:2: note: Loop condition is true.  Entering loo=
p body
           for (i =3D 0; i < newmap->possible_max_rank; i++) {
           ^
   fs/ceph/mds_client.c:4282:14: note: Calling 'ceph_mdsmap_get_state'
                   newstate =3D ceph_mdsmap_get_state(newmap, i);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/mdsmap.h:53:2: note: Taking false branch
           BUG_ON(w < 0);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/ceph/mdsmap.h:53:2: note: Loop condition is false.  Exitin=
g loop
           BUG_ON(w < 0);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   include/linux/ceph/mdsmap.h:54:6: note: 'w' is < field 'possible_max_ran=
k'
           if (w >=3D m->possible_max_rank)
               ^
   include/linux/ceph/mdsmap.h:54:2: note: Taking false branch
           if (w >=3D m->possible_max_rank)
           ^
   include/linux/ceph/mdsmap.h:56:9: note: Dereference of null pointer
           return m->m_info[w].state;
                  ^~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/percpu_test.c:115:2: warning: Value stored to 'ul' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           ul =3D 3;
           ^    ~
   lib/percpu_test.c:115:2: note: Value stored to 'ul' is never read
           ul =3D 3;
           ^    ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +56 include/linux/ceph/mdsmap.h

2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  50  =

2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  51  static=
 inline int ceph_mdsmap_get_state(struct ceph_mdsmap *m, int w)
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  52  {
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  53  	BUG_O=
N(w < 0);
b38c9eb4757d5b include/linux/ceph/mdsmap.h Xiubo Li  2019-12-04  54  	if (w=
 >=3D m->possible_max_rank)
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  55  		retu=
rn CEPH_MDS_STATE_DNE;
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06 @56  	retur=
n m->m_info[w].state;
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  57  }
2f2dc053404feb fs/ceph/mdsmap.h            Sage Weil 2009-10-06  58  =


:::::: The code at line 56 was first introduced by commit
:::::: 2f2dc053404febedc9c273452d9d518fb31fde72 ceph: MDS client

:::::: TO: Sage Weil <sage@newdream.net>
:::::: CC: Sage Weil <sage@newdream.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6157549074918274142==--

