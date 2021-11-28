Content-Type: multipart/mixed; boundary="===============1959999081053911852=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:117:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 28 Nov 2021 17:45:43 +0800
Message-ID: <202111281744.pmYRdJOc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1959999081053911852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: 7954c8503b8709660d93505a40f1847634d9c3ba svcrdma: Remove chunk list=
 pointers
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007-20211124 (https://download.01.org/0day-ci/ar=
chive/20211128/202111281744.pmYRdJOc-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c4=
5def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7954c8503b8709660d93505a40f1847634d9c3ba
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7954c8503b8709660d93505a40f1847634d9c3ba
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           result_msg =3D p;
           ^            ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/ceph/auth_x.c:35:22: warning: Value stored to 'xi' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct ceph_x_info *xi =3D ac->private;
                               ^~   ~~~~~~~~~~~
   net/ceph/auth_x.c:35:22: note: Value stored to 'xi' during its initializ=
ation is never read
           struct ceph_x_info *xi =3D ac->private;
                               ^~   ~~~~~~~~~~~
   net/ceph/auth_x.c:591:2: warning: Value stored to 'result' is never read=
 [clang-analyzer-deadcode.DeadStores]
           result =3D le32_to_cpu(head->result);
           ^
   net/ceph/auth_x.c:591:2: note: Value stored to 'result' is never read
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   lib/zstd/decompress.c:1557:4: warning: Value stored to 'remainingSize' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           remainingSize -=3D 4;
                           ^                ~
   lib/zstd/decompress.c:1557:4: note: Value stored to 'remainingSize' is n=
ever read
                           remainingSize -=3D 4;
                           ^                ~
   Suppressed 8 warnings (3 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:117:2: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           return list_first_entry_or_null(list, struct svc_rdma_recv_ctxt,
           ^
   net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:377:17: note: Calling 'svc_rdma_=
next_recv_ctxt'
           while ((ctxt =3D svc_rdma_next_recv_ctxt(&rdma->sc_read_complete=
_q))) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:117:9: note: Left side of '||' i=
s false
           return list_first_entry_or_null(list, struct svc_rdma_recv_ctxt,
                  ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:277:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:117:9: note: Left side of '||' i=
s false
           return list_first_entry_or_null(list, struct svc_rdma_recv_ctxt,
                  ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:277:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:117:9: note: Left side of '||' i=
s false
           return list_first_entry_or_null(list, struct svc_rdma_recv_ctxt,
                  ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:277:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:117:9: note: Left side of '||' i=
s true
           return list_first_entry_or_null(list, struct svc_rdma_recv_ctxt,
                  ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:117:9: note: Taking false branch
           return list_first_entry_or_null(list, struct svc_rdma_recv_ctxt,
                  ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:117:9: note: Loop condition is f=
alse.  Exiting loop
           return list_first_entry_or_null(list, struct svc_rdma_recv_ctxt,
                  ^
   include/linux/list.h:545:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)

vim +117 net/sunrpc/xprtrdma/svc_rdma_recvfrom.c

ecf85b2384ea5f Chuck Lever 2018-05-07  113  =

ecf85b2384ea5f Chuck Lever 2018-05-07  114  static inline struct svc_rdma_r=
ecv_ctxt *
ecf85b2384ea5f Chuck Lever 2018-05-07  115  svc_rdma_next_recv_ctxt(struct =
list_head *list)
ecf85b2384ea5f Chuck Lever 2018-05-07  116  {
ecf85b2384ea5f Chuck Lever 2018-05-07 @117  	return list_first_entry_or_nul=
l(list, struct svc_rdma_recv_ctxt,
ecf85b2384ea5f Chuck Lever 2018-05-07  118  					rc_list);
ecf85b2384ea5f Chuck Lever 2018-05-07  119  }
ecf85b2384ea5f Chuck Lever 2018-05-07  120  =


:::::: The code at line 117 was first introduced by commit
:::::: ecf85b2384ea5f7cb0577bf6143bc46d9ecfe4d3 svcrdma: Introduce svc_rdma=
_recv_ctxt

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1959999081053911852==--

