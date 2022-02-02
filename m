Content-Type: multipart/mixed; boundary="===============7824518145892485360=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC bpf-next v2 2/5] bpf: Introduce inherit list for dir tag.
Date: Wed, 02 Feb 2022 22:00:39 +0800
Message-ID: <202202022147.xPerjqdl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7824518145892485360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220201205534.1962784-3-haoluo@google.com>
References: <20220201205534.1962784-3-haoluo@google.com>
TO: Hao Luo <haoluo@google.com>

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Extend-cgroup-inte=
rface-with-bpf/20220202-045743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
202/202202022147.xPerjqdl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e84=
4b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f6c6ca7ed744371ccc22d4c3b=
945ebdb3651efaf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hao-Luo/Extend-cgroup-interface-wi=
th-bpf/20220202-045743
        git checkout f6c6ca7ed744371ccc22d4c3b945ebdb3651efaf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/ntfs3/fsntfs.c:1203:4: note: Taking false branch
                           if (buf) {
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs3/fsntfs.c:1208:4: note: '?' condition is false
                           if (!nb) {
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ntfs3/fsntfs.c:1208:9: note: 'nb' is null
                           if (!nb) {
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
   fs/ntfs3/fsntfs.c:1208:4: note: '?' condition is true
                           if (!nb) {
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
   fs/ntfs3/fsntfs.c:1208:4: note: Taking true branch
                           if (!nb) {
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs3/fsntfs.c:1219:8: note: Assuming 'bytes' is not equal to 0
                           if (!bytes)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ntfs3/fsntfs.c:1219:4: note: '?' condition is false
                           if (!bytes)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ntfs3/fsntfs.c:1219:9: note: 'bytes' is not equal to 0
                           if (!bytes)
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
   fs/ntfs3/fsntfs.c:1219:4: note: '?' condition is false
                           if (!bytes)
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
   fs/ntfs3/fsntfs.c:1219:4: note: Taking false branch
                           if (!bytes)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs3/fsntfs.c:1191:3: note: Loop condition is false.  Exiting loop
                   do {
                   ^
   fs/ntfs3/fsntfs.c:1227:18: note: The right operand of '+' is a garbage v=
alue
                   vcn_next =3D vcn + clen;
                                  ^ ~~~~
   2 warnings generated.
>> kernel/bpf/inode.c:71:2: warning: Use of memory after it is freed [clang=
-analyzer-unix.Malloc]
           list_for_each_entry(e, &list->list, list) {
           ^
   include/linux/list.h:640:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   kernel/bpf/inode.c:571:2: note: Assuming the condition is false
           if (inode_tag(dir)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/bpf/inode.c:571:2: note: '?' condition is false
           if (inode_tag(dir)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/bpf/inode.c:571:2: note: '?' condition is true
           if (inode_tag(dir)) {
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
   kernel/bpf/inode.c:571:2: note: Taking true branch
           if (inode_tag(dir)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/bpf/inode.c:573:3: note: Calling 'untag_dir_inode'
                   untag_dir_inode(dir);
                   ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/inode.c:561:10: note: Assuming field 'type' is equal to BPF_D=
IR_KERNFS_REP
           WARN_ON(tag->type !=3D BPF_DIR_KERNFS_REP);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/bpf/inode.c:561:2: note: '?' condition is false
           WARN_ON(tag->type !=3D BPF_DIR_KERNFS_REP);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/bpf/inode.c:561:2: note: '?' condition is false
           WARN_ON(tag->type !=3D BPF_DIR_KERNFS_REP);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
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
   kernel/bpf/inode.c:561:2: note: Taking false branch
           WARN_ON(tag->type !=3D BPF_DIR_KERNFS_REP);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/bpf/inode.c:565:2: note: Calling 'kref_put'
           kref_put(&tag->inherit_objects->refcnt, free_obj_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Assuming the condition is false
           if (refcount_dec_and_test(&kref->refcount)) {

vim +71 kernel/bpf/inode.c

b2197755b2633e Daniel Borkmann 2015-10-29  64  =

f6c6ca7ed74437 Hao Luo         2022-02-01  65  static void free_obj_list(st=
ruct kref *kref)
f6c6ca7ed74437 Hao Luo         2022-02-01  66  {
f6c6ca7ed74437 Hao Luo         2022-02-01  67  	struct obj_list *list;
f6c6ca7ed74437 Hao Luo         2022-02-01  68  	struct bpf_inherit_entry *e;
f6c6ca7ed74437 Hao Luo         2022-02-01  69  =

f6c6ca7ed74437 Hao Luo         2022-02-01  70  	list =3D container_of(kref,=
 struct obj_list, refcnt);
f6c6ca7ed74437 Hao Luo         2022-02-01 @71  	list_for_each_entry(e, &lis=
t->list, list) {
f6c6ca7ed74437 Hao Luo         2022-02-01  72  		list_del_rcu(&e->list);
f6c6ca7ed74437 Hao Luo         2022-02-01  73  		bpf_any_put(e->obj, e->typ=
e);
f6c6ca7ed74437 Hao Luo         2022-02-01  74  		kfree(e);
f6c6ca7ed74437 Hao Luo         2022-02-01  75  	}
f6c6ca7ed74437 Hao Luo         2022-02-01  76  	kfree(list);
f6c6ca7ed74437 Hao Luo         2022-02-01  77  }
f6c6ca7ed74437 Hao Luo         2022-02-01  78  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7824518145892485360==--

