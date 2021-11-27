Content-Type: multipart/mixed; boundary="===============5485970139540447363=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/sunrpc/svc_rdma_pcl.h:64:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 28 Nov 2021 02:35:43 +0800
Message-ID: <202111280230.DQRSZtYn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5485970139540447363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 78147ca8b4a9b6cf0e597ddd6bf17959e08376c2 svcrdma: Add a "parsed chu=
nk list" data structure
date:   12 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007-20211124 (https://download.01.org/0day-ci/ar=
chive/20211128/202111280230.DQRSZtYn-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c4=
5def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D78147ca8b4a9b6cf0e597ddd6bf17959e08376c2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 78147ca8b4a9b6cf0e597ddd6bf17959e08376c2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^     ~
   net/9p/client.c:2153:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2153:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2184:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2184:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2214:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2214:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2247:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2247:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2281:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2281:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> include/linux/sunrpc/svc_rdma_pcl.h:64:2: warning: Use of memory after i=
t is freed [clang-analyzer-unix.Malloc]
           return list_first_entry(&pcl->cl_chunks, struct svc_rdma_chunk,
           ^
   net/sunrpc/xprtrdma/svc_rdma_pcl.c:19:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&pcl->cl_chunks)) {
           ^
   net/sunrpc/xprtrdma/svc_rdma_pcl.c:24:3: note: Memory is released
                   kfree(chunk);
                   ^~~~~~~~~~~~
   net/sunrpc/xprtrdma/svc_rdma_pcl.c:19:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&pcl->cl_chunks)) {
           ^
   net/sunrpc/xprtrdma/svc_rdma_pcl.c:22:11: note: Calling 'pcl_first_chunk'
                   chunk =3D pcl_first_chunk(pcl);
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/sunrpc/svc_rdma_pcl.h:62:6: note: Assuming the condition i=
s false
           if (pcl_is_empty(pcl))
               ^~~~~~~~~~~~~~~~~
   include/linux/sunrpc/svc_rdma_pcl.h:62:2: note: Taking false branch
           if (pcl_is_empty(pcl))
           ^
   include/linux/sunrpc/svc_rdma_pcl.h:64:9: note: Left side of '&&' is fal=
se
           return list_first_entry(&pcl->cl_chunks, struct svc_rdma_chunk,
                  ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   include/linux/sunrpc/svc_rdma_pcl.h:64:9: note: Taking false branch
           return list_first_entry(&pcl->cl_chunks, struct svc_rdma_chunk,
                  ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   include/linux/sunrpc/svc_rdma_pcl.h:64:9: note: Loop condition is false.=
  Exiting loop
           return list_first_entry(&pcl->cl_chunks, struct svc_rdma_chunk,
                  ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/sunrpc/svc_rdma_pcl.h:64:2: note: Use of memory after it i=
s freed
           return list_first_entry(&pcl->cl_chunks, struct svc_rdma_chunk,
           ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   net/ceph/mon_client.c:140:6: warning: Value stored to 'old_mon' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           int old_mon =3D monc->cur_mon;
               ^~~~~~~   ~~~~~~~~~~~~~
   net/ceph/mon_client.c:140:6: note: Value stored to 'old_mon' during its =
initialization is never read
           int old_mon =3D monc->cur_mon;
               ^~~~~~~   ~~~~~~~~~~~~~

vim +64 include/linux/sunrpc/svc_rdma_pcl.h

78147ca8b4a9b6 Chuck Lever 2020-06-22  52  =

78147ca8b4a9b6 Chuck Lever 2020-06-22  53  /**
78147ca8b4a9b6 Chuck Lever 2020-06-22  54   * pcl_first_chunk - Return firs=
t chunk in a parsed chunk list
78147ca8b4a9b6 Chuck Lever 2020-06-22  55   * @pcl: parsed chunk list
78147ca8b4a9b6 Chuck Lever 2020-06-22  56   *
78147ca8b4a9b6 Chuck Lever 2020-06-22  57   * Returns the first chunk in th=
e list, or NULL if the list is empty.
78147ca8b4a9b6 Chuck Lever 2020-06-22  58   */
78147ca8b4a9b6 Chuck Lever 2020-06-22  59  static inline struct svc_rdma_ch=
unk *
78147ca8b4a9b6 Chuck Lever 2020-06-22  60  pcl_first_chunk(const struct svc=
_rdma_pcl *pcl)
78147ca8b4a9b6 Chuck Lever 2020-06-22  61  {
78147ca8b4a9b6 Chuck Lever 2020-06-22  62  	if (pcl_is_empty(pcl))
78147ca8b4a9b6 Chuck Lever 2020-06-22  63  		return NULL;
78147ca8b4a9b6 Chuck Lever 2020-06-22 @64  	return list_first_entry(&pcl->c=
l_chunks, struct svc_rdma_chunk,
78147ca8b4a9b6 Chuck Lever 2020-06-22  65  				ch_list);
78147ca8b4a9b6 Chuck Lever 2020-06-22  66  }
78147ca8b4a9b6 Chuck Lever 2020-06-22  67  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5485970139540447363==--

