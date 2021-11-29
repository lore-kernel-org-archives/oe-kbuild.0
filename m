Content-Type: multipart/mixed; boundary="===============7066979740864030865=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:117:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Tue, 30 Nov 2021 00:08:21 +0800
Message-ID: <202111300014.aRxYVvja-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7066979740864030865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d58071a8a76d779eedab38033ae4c821c30295a5
commit: 7954c8503b8709660d93505a40f1847634d9c3ba svcrdma: Remove chunk list=
 pointers
date:   12 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007-20211124 (https://download.01.org/0day-ci/ar=
chive/20211130/202111300014.aRxYVvja-lkp(a)intel.com/config)
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
                 ^
   fs/cifs/cifsproto.h:51:2: note: expanded from macro 'get_xid'
           cifs_dbg(FYI, "VFS: in %s as Xid: %u with uid: %d\n",           \
           ^
   fs/cifs/cifs_debug.h:137:38: note: expanded from macro 'cifs_dbg'
   #define cifs_dbg(type, fmt, ...)                                        \
                                                                           ^
   fs/cifs/inode.c:1876:6: note: Assuming 'full_path' is not equal to NULL
           if (full_path =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~
   fs/cifs/inode.c:1876:2: note: Taking false branch
           if (full_path =3D=3D NULL) {
           ^
   fs/cifs/inode.c:1883:6: note: Assuming field 'posix_mkdir' is null
           if ((server->ops->posix_mkdir) && (tcon->posix_extensions)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/inode.c:1883:33: note: Left side of '&&' is false
           if ((server->ops->posix_mkdir) && (tcon->posix_extensions)) {
                                          ^
   fs/cifs/inode.c:1890:6: note: Assuming the condition is false
           if (cap_unix(tcon->ses) && (CIFS_UNIX_POSIX_PATH_OPS_CAP &
               ^~~~~~~~~~~~~~~~~~~
   fs/cifs/inode.c:1890:26: note: Left side of '&&' is false
           if (cap_unix(tcon->ses) && (CIFS_UNIX_POSIX_PATH_OPS_CAP &
                                   ^
   fs/cifs/inode.c:1898:6: note: Assuming field 'mkdir' is non-null
           if (!server->ops->mkdir) {
               ^~~~~~~~~~~~~~~~~~~
   fs/cifs/inode.c:1898:2: note: Taking false branch
           if (!server->ops->mkdir) {
           ^
   fs/cifs/inode.c:1905:6: note: Assuming 'rc' is 0
           if (rc) {
               ^~
   fs/cifs/inode.c:1905:2: note: Taking false branch
           if (rc) {
           ^
   fs/cifs/inode.c:1912:7: note: Calling 'cifs_mkdir_qinfo'
           rc =3D cifs_mkdir_qinfo(inode, direntry, mode, full_path, cifs_s=
b, tcon,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/cifs/inode.c:1723:2: note: 'inode' initialized to a null pointer value
           struct inode *inode =3D NULL;
           ^~~~~~~~~~~~~~~~~~~
   fs/cifs/inode.c:1725:6: note: Assuming field 'posix_extensions' is true
           if (tcon->posix_extensions)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/inode.c:1725:2: note: Taking true branch
           if (tcon->posix_extensions)
           ^
   fs/cifs/inode.c:1726:8: note: Calling 'smb311_posix_get_inode_info'
                   rc =3D smb311_posix_get_inode_info(&inode, full_path, pa=
rent->i_sb, xid);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   fs/cifs/inode.c:1131:6: note: Calling 'IS_ERR'
           if (IS_ERR(tlink))
               ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
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
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/inode.c:1131:6: note: Returning from 'IS_ERR'
           if (IS_ERR(tlink))
               ^~~~~~~~~~~~~
   fs/cifs/inode.c:1131:2: note: Taking true branch
           if (IS_ERR(tlink))
           ^
   fs/cifs/inode.c:1132:3: note: Returning without writing to '*inode'
                   return PTR_ERR(tlink);
                   ^
   fs/cifs/inode.c:1132:3: note: Returning value, which participates in a c=
ondition later
                   return PTR_ERR(tlink);
                   ^~~~~~~~~~~~~~~~~~~~~
   fs/cifs/inode.c:1726:8: note: Returning from 'smb311_posix_get_inode_inf=
o'
                   rc =3D smb311_posix_get_inode_info(&inode, full_path, pa=
rent->i_sb, xid);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   fs/cifs/inode.c:1734:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   fs/cifs/inode.c:1734:2: note: Taking false branch
           if (rc)
           ^
   fs/cifs/inode.c:1742:6: note: Dereference of null pointer
           if (inode->i_nlink < 2)
               ^~~~~~~~~~~~~~
   fs/cifs/inode.c:2633:2: warning: Value stored to 'rc' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           rc =3D 0;
           ^    ~
   fs/cifs/inode.c:2633:2: note: Value stored to 'rc' is never read
           rc =3D 0;
           ^    ~
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
--===============7066979740864030865==--

