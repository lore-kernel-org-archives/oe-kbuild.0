Content-Type: multipart/mixed; boundary="===============7533630327138390771=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v11 1/5] bpf: Add "live packet" mode for XDP in BPF_PROG_RUN
Date: Fri, 11 Mar 2022 01:46:19 +0800
Message-ID: <202203110108.Nlnr17an-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7533630327138390771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220309105346.100053-2-toke@redhat.com>
References: <20220309105346.100053-2-toke@redhat.com>
TO: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>

Hi "Toke,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Toke-H-iland-J-rgensen/Add=
-support-for-transmitting-packets-using-XDP-in-bpf_prog_run/20220309-185524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
311/202203110108.Nlnr17an-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/429da9d7b2fa526bfcd4230a2=
a2e9bf19dd10902
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Toke-H-iland-J-rgensen/Add-support=
-for-transmitting-packets-using-XDP-in-bpf_prog_run/20220309-185524
        git checkout 429da9d7b2fa526bfcd4230a2a2e9bf19dd10902
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ext4/inode.c:6034:2: note: Taking true branch
           if (ext4_should_journal_data(inode))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6035:3: note: Control jumps to line 6085
                   goto retry_alloc;
                   ^
   fs/ext4/inode.c:6087:2: note: '?' condition is false
           if (IS_ERR(handle)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inode.c:6087:2: note: '?' condition is false
           if (IS_ERR(handle)) {
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
   fs/ext4/inode.c:6087:2: note: Taking false branch
           if (IS_ERR(handle)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6096:6: note: Assuming the condition is false
           if (!ext4_should_journal_data(inode)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/inode.c:6096:2: note: '?' condition is false
           if (!ext4_should_journal_data(inode)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inode.c:6096:6: note: Assuming the condition is true
           if (!ext4_should_journal_data(inode)) {
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
   fs/ext4/inode.c:6096:2: note: '?' condition is true
           if (!ext4_should_journal_data(inode)) {
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
   fs/ext4/inode.c:6096:2: note: Taking true branch
           if (!ext4_should_journal_data(inode)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6097:9: note: 3rd function call argument is an uninitial=
ized value
                   err =3D block_page_mkwrite(vma, vmf, get_block);
                         ^                            ~~~~~~~~~
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
--
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/target/target_core_fabric_configfs.c:1009:2: note: Taking false =
branch
           if (kstrtoint(page, 0, &compl_val))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/target/target_core_fabric_configfs.c:1012:2: note: Control jumps=
 to the 'default' case at line 1019
           switch (compl_val) {
           ^
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Assuming 'com=
pl_val' is >=3D 0
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Left side of =
'||' is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   drivers/target/target_core_fabric_configfs.c:1020:24: note: Assuming 'co=
mpl_val' is < 1
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Left side of =
'||' is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   drivers/target/target_core_fabric_configfs.c:1020:3: note: '?' condition=
 is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/target/target_core_fabric_configfs.c:1020:7: note: 'compl_val' i=
s >=3D 0
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
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
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Left side of =
'||' is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   drivers/target/target_core_fabric_configfs.c:1020:24: note: 'compl_val' =
is < 1
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
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
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Left side of =
'||' is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   drivers/target/target_core_fabric_configfs.c:1020:3: note: '?' condition=
 is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
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
   drivers/target/target_core_fabric_configfs.c:1020:3: note: Taking false =
branch
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/target/target_core_fabric_configfs.c:1027:27: note: Access to fi=
eld 'cmd_compl_affinity' results in a dereference of a null pointer (loaded=
 from variable 'wwn')
                   wwn->cmd_compl_affinity =3D compl_val;
                   ~~~                     ^
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

vim +104 net/bpf/test_run.c

429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  103  =

429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09 @104  struct xdp=
_test_data {
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  105  	struct xd=
p_buff *orig_ctx;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  106  	struct xd=
p_rxq_info rxq;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  107  	struct ne=
t_device *dev;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  108  	struct pa=
ge_pool *pp;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  109  	struct xd=
p_frame **frames;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  110  	struct sk=
_buff **skbs;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  111  	u32 batch=
_size;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  112  	u32 frame=
_cnt;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  113  };
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  114  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7533630327138390771==--

