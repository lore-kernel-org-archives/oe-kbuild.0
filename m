Content-Type: multipart/mixed; boundary="===============6253966759479536672=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/cifs/misc.c:74:3: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 29 May 2022 11:24:46 +0800
Message-ID: <202205291139.VRGkzKAQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6253966759479536672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Rohith Surabattula <rohiths@microsoft.com>
CC: Steve French <stfrench@microsoft.com>
CC: Shyam Prasad N <sprasad@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 9e992755be8f2d458a0bcbefd19e493483c1dba2 cifs: Call close synchrono=
usly during unlink/rename/lease break.
date:   10 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-c005-20220518 (https://download.01.org/0day-ci/arch=
ive/20220529/202205291139.VRGkzKAQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9e992755be8f2d458a0bcbefd19e493483c1dba2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9e992755be8f2d458a0bcbefd19e493483c1dba2
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/coda/upcall.c:747:2: note: '?' condition is false
           if (req->uc_flags & CODA_REQ_ASYNC) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/coda/upcall.c:747:2: note: '?' condition is false
           if (req->uc_flags & CODA_REQ_ASYNC) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/coda/upcall.c:747:2: note: Taking false branch
           if (req->uc_flags & CODA_REQ_ASYNC) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/coda/upcall.c:765:2: note: Assuming the condition is true
           if (req->uc_flags & CODA_REQ_WRITE) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/coda/upcall.c:765:2: note: '?' condition is false
           if (req->uc_flags & CODA_REQ_WRITE) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/coda/upcall.c:765:2: note: '?' condition is false
           if (req->uc_flags & CODA_REQ_WRITE) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/coda/upcall.c:765:2: note: Taking false branch
           if (req->uc_flags & CODA_REQ_WRITE) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/coda/upcall.c:774:7: note: Assuming the condition is false
           if ((req->uc_flags & CODA_REQ_ABORT) || !signal_pending(current)=
) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/coda/upcall.c:774:6: note: Left side of '||' is false
           if ((req->uc_flags & CODA_REQ_ABORT) || !signal_pending(current)=
) {
               ^
   fs/coda/upcall.c:774:58: note: Dereference of null pointer
           if ((req->uc_flags & CODA_REQ_ABORT) || !signal_pending(current)=
) {
                                                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 27 warnings (5 in non-user code, 22 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> fs/cifs/misc.c:74:3: warning: The expression is an uninitialized value. =
The computed value will also be garbage [clang-analyzer-core.uninitialized.=
Assign]
                   ++ret_buf->ses_count;
                   ^ ~~~~~~~~~~~~~~~~~~
   fs/cifs/misc.c:70:12: note: Calling 'kzalloc'
           ret_buf =3D kzalloc(sizeof(struct cifs_ses), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 's=
es_count'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/misc.c:70:12: note: Returning from 'kzalloc'
           ret_buf =3D kzalloc(sizeof(struct cifs_ses), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/misc.c:71:2: note: Assuming 'ret_buf' is non-null
           if (ret_buf) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/misc.c:71:2: note: '?' condition is false
           if (ret_buf) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/misc.c:71:6: note: 'ret_buf' is non-null
           if (ret_buf) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/cifs/misc.c:71:6: note: 'ret_buf' is non-null
           if (ret_buf) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/cifs/misc.c:71:2: note: '?' condition is true
           if (ret_buf) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/cifs/misc.c:71:2: note: Taking true branch
           if (ret_buf) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/misc.c:74:3: note: The expression is an uninitialized value. The=
 computed value will also be garbage
                   ++ret_buf->ses_count;
                   ^ ~~~~~~~~~~~~~~~~~~
   fs/cifs/misc.c:119:2: warning: The expression is an uninitialized value.=
 The computed value will also be garbage [clang-analyzer-core.uninitialized=
.Assign]
           ++ret_buf->tc_count;
           ^ ~~~~~~~~~~~~~~~~~
   fs/cifs/misc.c:108:12: note: Calling 'kzalloc'
           ret_buf =3D kzalloc(sizeof(*ret_buf), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 't=
c_count'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/misc.c:108:12: note: Returning from 'kzalloc'
           ret_buf =3D kzalloc(sizeof(*ret_buf), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/misc.c:109:6: note: Assuming 'ret_buf' is non-null
           if (!ret_buf)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/misc.c:109:2: note: '?' condition is false
           if (!ret_buf)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +74 fs/cifs/misc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  64  =

96daf2b09178d8 Steve French   2011-05-27  65  struct cifs_ses *
^1da177e4c3f41 Linus Torvalds 2005-04-16  66  sesInfoAlloc(void)
^1da177e4c3f41 Linus Torvalds 2005-04-16  67  {
96daf2b09178d8 Steve French   2011-05-27  68  	struct cifs_ses *ret_buf;
^1da177e4c3f41 Linus Torvalds 2005-04-16  69  =

96daf2b09178d8 Steve French   2011-05-27  70  	ret_buf =3D kzalloc(sizeof(s=
truct cifs_ses), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds 2005-04-16  71  	if (ret_buf) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  72  		atomic_inc(&sesInfoAllocCou=
nt);
^1da177e4c3f41 Linus Torvalds 2005-04-16  73  		ret_buf->status =3D CifsNew;
14fbf50d695207 Jeff Layton    2008-11-14 @74  		++ret_buf->ses_count;
14fbf50d695207 Jeff Layton    2008-11-14  75  		INIT_LIST_HEAD(&ret_buf->sm=
b_ses_list);
f1987b44f642e9 Jeff Layton    2008-11-15  76  		INIT_LIST_HEAD(&ret_buf->tc=
on_list);
d7b619cf562187 Steve French   2010-02-25  77  		mutex_init(&ret_buf->sessio=
n_mutex);
b6f0dd5d75f968 Aurelien Aptel 2018-06-14  78  		spin_lock_init(&ret_buf->if=
ace_lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16  79  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  80  	return ret_buf;
^1da177e4c3f41 Linus Torvalds 2005-04-16  81  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  82  =


:::::: The code at line 74 was first introduced by commit
:::::: 14fbf50d695207754daeb96270b3027a3821121f cifs: reinstate sharing of =
SMB sessions sans races

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6253966759479536672==--

