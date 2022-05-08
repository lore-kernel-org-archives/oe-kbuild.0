Content-Type: multipart/mixed; boundary="===============9014705652725928599=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9659/9759] drivers/nvme/host/ioctl.c:693:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 08 May 2022 17:58:28 +0800
Message-ID: <202205081711.ssgxsL9Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9014705652725928599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kanchan Joshi <joshi.k@samsung.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Anuj Gupta <anuj20.g@samsung.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 86116c2f6fee81a0be72a71cc2f1f7c087df8efa [9659/9759] nvme: wire-up =
uring-cmd support for io-passthru on char-device.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
508/202205081711.ssgxsL9Z-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D86116c2f6fee81a0be72a71cc2f1f7c087df8efa
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 86116c2f6fee81a0be72a71cc2f1f7c087df8efa
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                 ^
   drivers/nvme/host/ioctl.c:243:2: note: '?' condition is true
           if (IS_ERR(req))
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
   drivers/nvme/host/ioctl.c:243:2: note: Taking true branch
           if (IS_ERR(req))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/ioctl.c:244:3: note: Returning without writing to '*re=
sult'
                   return PTR_ERR(req);
                   ^
   drivers/nvme/host/ioctl.c:360:11: note: Returning from 'nvme_submit_user=
_cmd'
           status =3D nvme_submit_user_cmd(ns ? ns->queue : ctrl->admin_q, =
&c,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:365:6: note: 'status' is >=3D 0
           if (status >=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/ioctl.c:365:2: note: '?' condition is false
           if (status >=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/ioctl.c:365:6: note: 'status' is >=3D 0
           if (status >=3D 0) {
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
   drivers/nvme/host/ioctl.c:365:2: note: '?' condition is true
           if (status >=3D 0) {
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
   drivers/nvme/host/ioctl.c:365:2: note: Taking true branch
           if (status >=3D 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/ioctl.c:366:7: note: Assigned value is garbage or unde=
fined
                   if (put_user(result, &ucmd->result))
                       ^
   arch/x86/include/asm/uaccess.h:225:44: note: expanded from macro 'put_us=
er'
   #define put_user(x, ptr) ({ might_fault(); do_put_user_call(put_user,x,p=
tr); })
                                              ^
   arch/x86/include/asm/uaccess.h:197:11: note: expanded from macro 'do_put=
_user_call'
           __val_pu =3D (x);                                               =
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
   drivers/nvme/host/ioctl.c:390:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&c, 0, sizeof(c));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:390:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&c, 0, sizeof(c));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/nvme/host/ioctl.c:693:2: warning: Undefined or garbage value ret=
urned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/nvme/host/ioctl.c:688:2: note: 'ret' declared without an initial=
 value
           int ret;
           ^~~~~~~
   drivers/nvme/host/ioctl.c:690:2: note: Assuming 'ns' is null
           if (ns)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/ioctl.c:690:2: note: '?' condition is false
           if (ns)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/ioctl.c:690:6: note: 'ns' is null
           if (ns)
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
   drivers/nvme/host/ioctl.c:690:2: note: '?' condition is false
           if (ns)
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
   drivers/nvme/host/ioctl.c:690:2: note: Taking false branch
           if (ns)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/ioctl.c:693:2: note: Undefined or garbage value return=
ed to caller
           return ret;
           ^      ~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   105 warnings generated.
   net/ipv4/fib_trie.c:215:14: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return (1ul << tn->bits) & ~(1ul);
                       ^
   net/ipv4/fib_trie.c:852:26: note: Assuming the condition is false
           struct key_vector *tp =3D node_parent(tn);
                                   ^
   net/ipv4/fib_trie.c:194:25: note: expanded from macro 'node_parent'
   #define node_parent(tn) rtnl_dereference(tn_info(tn)->parent)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/rcupdate.h:319:8: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                   ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv4/fib_trie.c:852:26: note: Left side of '&&' is false
           struct key_vector *tp =3D node_parent(tn);
                                   ^
   net/ipv4/fib_trie.c:194:25: note: expanded from macro 'node_parent'
   #define node_parent(tn) rtnl_dereference(tn_info(tn)->parent)
                           ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
ence_protected'

vim +693 drivers/nvme/host/ioctl.c

86116c2f6fee81 Kanchan Joshi     2022-05-05  680  =

86116c2f6fee81 Kanchan Joshi     2022-05-05  681  int nvme_ns_head_chr_urin=
g_cmd(struct io_uring_cmd *ioucmd,
86116c2f6fee81 Kanchan Joshi     2022-05-05  682  		unsigned int issue_flag=
s)
86116c2f6fee81 Kanchan Joshi     2022-05-05  683  {
86116c2f6fee81 Kanchan Joshi     2022-05-05  684  	struct cdev *cdev =3D fi=
le_inode(ioucmd->file)->i_cdev;
86116c2f6fee81 Kanchan Joshi     2022-05-05  685  	struct nvme_ns_head *hea=
d =3D container_of(cdev, struct nvme_ns_head, cdev);
86116c2f6fee81 Kanchan Joshi     2022-05-05  686  	int srcu_idx =3D srcu_re=
ad_lock(&head->srcu);
86116c2f6fee81 Kanchan Joshi     2022-05-05  687  	struct nvme_ns *ns =3D n=
vme_find_path(head);
86116c2f6fee81 Kanchan Joshi     2022-05-05  688  	int ret;
86116c2f6fee81 Kanchan Joshi     2022-05-05  689  =

86116c2f6fee81 Kanchan Joshi     2022-05-05  690  	if (ns)
86116c2f6fee81 Kanchan Joshi     2022-05-05  691  		ret =3D nvme_ns_uring_c=
md(ns, ioucmd, issue_flags);
86116c2f6fee81 Kanchan Joshi     2022-05-05  692  	srcu_read_unlock(&head->=
srcu, srcu_idx);
86116c2f6fee81 Kanchan Joshi     2022-05-05 @693  	return ret;
86116c2f6fee81 Kanchan Joshi     2022-05-05  694  }
2405252a680e21 Christoph Hellwig 2021-04-10  695  #endif /* CONFIG_NVME_MUL=
TIPATH */
2405252a680e21 Christoph Hellwig 2021-04-10  696  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9014705652725928599==--

