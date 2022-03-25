Content-Type: multipart/mixed; boundary="===============4278181462593215495=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bpf/test_run.c:104:8: warning: Excessive padding in 'struct xdp_test_data' (100 padding bytes, where 36 is optimal).
Date: Sat, 26 Mar 2022 06:55:30 +0800
Message-ID: <202203260614.ZiSl5dwH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4278181462593215495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aa5b537b0ecc16992577b013f11112d54c7ce869
commit: b530e9e1063ed2b817eae7eec6ed2daa8be11608 bpf: Add "live packet" mod=
e for XDP in BPF_PROG_RUN
date:   2 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
326/202203260614.ZiSl5dwH-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db530e9e1063ed2b817eae7eec6ed2daa8be11608
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b530e9e1063ed2b817eae7eec6ed2daa8be11608
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/namei.c:1677:6: note: 'err' is not equal to 0
           if (err)
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
   fs/ext4/namei.c:1677:2: note: '?' condition is true
           if (err)
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
   fs/ext4/namei.c:1677:2: note: Taking true branch
           if (err)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/namei.c:1678:3: note: Returning without writing to '*res_dir'
                   return ERR_PTR(err);
                   ^
   fs/ext4/namei.c:3979:11: note: Returning from 'ext4_find_entry'
           new.bh =3D ext4_find_entry(new.dir, &new.dentry->d_name,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/namei.c:3981:2: note: '?' condition is false
           if (IS_ERR(new.bh)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/namei.c:3981:2: note: '?' condition is false
           if (IS_ERR(new.bh)) {
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
   fs/ext4/namei.c:3981:2: note: Taking false branch
           if (IS_ERR(new.bh)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/namei.c:3988:6: note: Assuming field 'bh' is non-null
           if (!new.bh || le32_to_cpu(new.de->inode) !=3D new.inode->i_ino)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/namei.c:3988:6: note: Left side of '||' is false
           if (!new.bh || le32_to_cpu(new.de->inode) !=3D new.inode->i_ino)
               ^
   fs/ext4/namei.c:3988:17: note: Access to field 'inode' results in a dere=
ference of a null pointer (loaded from field 'de')
           if (!new.bh || le32_to_cpu(new.de->inode) !=3D new.inode->i_ino)
                          ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> net/bpf/test_run.c:104:8: warning: Excessive padding in 'struct xdp_test=
_data' (100 padding bytes, where 36 is optimal). =

   Optimal fields order: =

   rxq, =

   orig_ctx, =

   dev, =

   pp, =

   frames, =

   skbs, =

   batch_size, =

   frame_cnt, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct xdp_test_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   net/bpf/test_run.c:104:8: note: Excessive padding in 'struct xdp_test_da=
ta' (100 padding bytes, where 36 is optimal). Optimal fields order: rxq, or=
ig_ctx, dev, pp, frames, skbs, batch_size, frame_cnt, consider reordering t=
he fields or adding explicit padding members
   struct xdp_test_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   net/bpf/test_run.c:1329:8: warning: 6th function call argument is an uni=
nitialized value [clang-analyzer-core.CallAndMessage]
           ret =3D bpf_test_finish(kattr, uattr, xdp.data_meta, sinfo, size,
                 ^
   net/bpf/test_run.c:1212:6: note: 'retval' declared without an initial va=
lue
           u32 retval, duration, max_data_sz;
               ^~~~~~
   net/bpf/test_run.c:1221:6: note: Assuming field 'expected_attach_type' i=
s not equal to BPF_XDP_DEVMAP
           if (prog->expected_attach_type =3D=3D BPF_XDP_DEVMAP ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/bpf/test_run.c:1221:6: note: Left side of '||' is false
           if (prog->expected_attach_type =3D=3D BPF_XDP_DEVMAP ||
               ^
   net/bpf/test_run.c:1222:6: note: Assuming field 'expected_attach_type' i=
s not equal to BPF_XDP_CPUMAP
               prog->expected_attach_type =3D=3D BPF_XDP_CPUMAP)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/bpf/test_run.c:1221:2: note: '?' condition is false
           if (prog->expected_attach_type =3D=3D BPF_XDP_DEVMAP ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/bpf/test_run.c:1221:12: note: Field 'expected_attach_type' is not eq=
ual to BPF_XDP_DEVMAP
           if (prog->expected_attach_type =3D=3D BPF_XDP_DEVMAP ||
                     ^
   net/bpf/test_run.c:1221:6: note: Left side of '||' is false
           if (prog->expected_attach_type =3D=3D BPF_XDP_DEVMAP ||
               ^
   net/bpf/test_run.c:1222:12: note: Field 'expected_attach_type' is not eq=
ual to BPF_XDP_CPUMAP
               prog->expected_attach_type =3D=3D BPF_XDP_CPUMAP)
                     ^
   net/bpf/test_run.c:1221:2: note: '?' condition is false
           if (prog->expected_attach_type =3D=3D BPF_XDP_DEVMAP ||
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
   net/bpf/test_run.c:1221:2: note: Taking false branch
           if (prog->expected_attach_type =3D=3D BPF_XDP_DEVMAP ||
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/bpf/test_run.c:1225:2: note: Assuming the condition is true
           if (kattr->test.flags & ~BPF_F_TEST_XDP_LIVE_FRAMES)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/bpf/test_run.c:1225:2: note: '?' condition is false
           if (kattr->test.flags & ~BPF_F_TEST_XDP_LIVE_FRAMES)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/bpf/test_run.c:1225:2: note: '?' condition is false
           if (kattr->test.flags & ~BPF_F_TEST_XDP_LIVE_FRAMES)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
--
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/nilfs2/recovery.c:636:8: note: Assuming 'err' is not equal to 0
                           if (unlikely(err))
                               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/nilfs2/recovery.c:636:4: note: '?' condition is false
                           if (unlikely(err))
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/nilfs2/recovery.c:636:17: note: 'err' is not equal to 0
                           if (unlikely(err))
                                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
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
   fs/nilfs2/recovery.c:636:4: note: '?' condition is true
                           if (unlikely(err))
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
   fs/nilfs2/recovery.c:636:4: note: Taking true branch
                           if (unlikely(err))
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/nilfs2/recovery.c:637:5: note: Control jumps to line 683
                                   goto failed;
                                   ^
   fs/nilfs2/recovery.c:686:2: note: Control jumps to line 676
           goto out;
           ^
   fs/nilfs2/recovery.c:677:2: note: Calling 'dispose_recovery_list'
           dispose_recovery_list(&dsync_blocks);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/recovery.c:377:9: note: Assuming the condition is true
           while (!list_empty(head)) {
                  ^~~~~~~~~~~~~~~~~
   fs/nilfs2/recovery.c:377:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(head)) {
           ^
   fs/nilfs2/recovery.c:382:3: note: Memory is released
                   kfree(rb);
                   ^~~~~~~~~
   fs/nilfs2/recovery.c:377:9: note: Assuming the condition is true
           while (!list_empty(head)) {
                  ^~~~~~~~~~~~~~~~~
   fs/nilfs2/recovery.c:377:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(head)) {
           ^
   fs/nilfs2/recovery.c:381:3: note: Calling 'list_del'
                   list_del(&rb->list);
                   ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   1 warning generated.
   net/core/net-sysfs.c:1769:2: warning: Value stored to 'txq' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           txq =3D real_tx;
           ^     ~~~~~~~
   net/core/net-sysfs.c:1769:2: note: Value stored to 'txq' is never read
           txq =3D real_tx;
           ^     ~~~~~~~
   1 warning generated.
>> net/core/page_pool.c:774:7: warning: Use of memory after it is freed [cl=
ang-analyzer-unix.Malloc]
           if (!page_pool_release(pool))
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
   net/core/page_pool.c:766:6: note: Assuming 'pool' is non-null
           if (!pool)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/page_pool.c:766:2: note: '?' condition is false
           if (!pool)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/page_pool.c:766:7: note: 'pool' is non-null
           if (!pool)
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
   net/core/page_pool.c:766:2: note: '?' condition is false
           if (!pool)
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
   net/core/page_pool.c:766:2: note: Taking false branch
           if (!pool)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/page_pool.c:769:2: note: '?' condition is false
           if (!page_pool_put(pool))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/page_pool.c:769:2: note: '?' condition is false
           if (!page_pool_put(pool))
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
   net/core/page_pool.c:769:2: note: Taking false branch
           if (!page_pool_put(pool))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/page_pool.c:774:7: note: Calling 'page_pool_release'
           if (!page_pool_release(pool))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/page_pool.c:727:6: note: Assuming 'inflight' is 0
           if (!inflight)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +104 net/bpf/test_run.c

b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  103  =

b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09 @104  struct xd=
p_test_data {
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  105  	struct x=
dp_buff *orig_ctx;
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  106  	struct x=
dp_rxq_info rxq;
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  107  	struct n=
et_device *dev;
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  108  	struct p=
age_pool *pp;
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  109  	struct x=
dp_frame **frames;
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  110  	struct s=
k_buff **skbs;
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  111  	u32 batc=
h_size;
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  112  	u32 fram=
e_cnt;
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  113  };
b530e9e1063ed2b Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  114  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4278181462593215495==--

