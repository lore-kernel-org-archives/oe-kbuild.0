Content-Type: multipart/mixed; boundary="===============0811704055630553457=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/core/dev.c:7069:1: warning: Address of stack memory associated with local variable 'list' is still referred to by the global variable 'softnet_data' upon returning to the caller. This will be a dangling reference [clang-analyzer-core.StackAddressEsca...
Date: Fri, 28 Jan 2022 18:17:06 +0800
Message-ID: <202201281845.nL4DUPcq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0811704055630553457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alobakin@pm.me>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23a46422c56144939c091c76cf389aa863ce9c18
commit: fec6e49b63989657bc4076dad99fa51d5ece34da skbuff: remove __kfree_skb=
_flush()
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220121 (https://download.01.org/0day-ci/archi=
ve/20220128/202201281845.nL4DUPcq-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3=
b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfec6e49b63989657bc4076dad99fa51d5ece34da
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fec6e49b63989657bc4076dad99fa51d5ece34da
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/core/dev.c:5885:3: note: Taking false branch
                   if (skb_vlan_tag_present(p))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/dev.c:5887:12: note: Calling 'skb_metadata_dst_cmp'
                   diffs |=3D skb_metadata_dst_cmp(p, skb);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dst_metadata.h:66:6: note: Assuming the condition is false
           if (!(skb_a->_skb_refdst | skb_b->_skb_refdst))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/net/dst_metadata.h:66:2: note: '?' condition is false
           if (!(skb_a->_skb_refdst | skb_b->_skb_refdst))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/net/dst_metadata.h:66:2: note: '?' condition is false
           if (!(skb_a->_skb_refdst | skb_b->_skb_refdst))
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
   include/net/dst_metadata.h:66:2: note: Taking false branch
           if (!(skb_a->_skb_refdst | skb_b->_skb_refdst))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/net/dst_metadata.h:69:2: note: Value assigned to 'a'
           a =3D (const struct metadata_dst *) skb_dst(skb_a);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dst_metadata.h:72:6: note: Assuming 'a' is null
           if (!a !=3D !b || a->type !=3D b->type)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/net/dst_metadata.h:72:12: note: Assuming 'b' is null
           if (!a !=3D !b || a->type !=3D b->type)
                     ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/net/dst_metadata.h:72:6: note: Left side of '||' is false
           if (!a !=3D !b || a->type !=3D b->type)
               ^
   include/net/dst_metadata.h:72:18: note: Access to field 'type' results i=
n a dereference of a null pointer (loaded from variable 'a')
           if (!a !=3D !b || a->type !=3D b->type)
                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/dev.c:1037:2: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, dev->name);
           ^~~~~~
   net/core/dev.c:1037:2: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
           strcpy(name, dev->name);
           ^~~~~~
   net/core/dev.c:3215:4: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           name =3D dev_driver_string(dev->dev.parent);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3215:4: note: Value stored to 'name' is never read
                           name =3D dev_driver_string(dev->dev.parent);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:3217:4: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           name =3D netdev_name(dev);
                           ^      ~~~~~~~~~~~~~~~~
   net/core/dev.c:3217:4: note: Value stored to 'name' is never read
                           name =3D netdev_name(dev);
                           ^      ~~~~~~~~~~~~~~~~
>> net/core/dev.c:7069:1: warning: Address of stack memory associated with =
local variable 'list' is still referred to by the global variable 'softnet_=
data' upon returning to the caller.  This will be a dangling reference [cla=
ng-analyzer-core.StackAddressEscape]
   }
   ^
   net/core/dev.c:7026:28: note: Loop condition is false.  Exiting loop
           struct softnet_data *sd =3D this_cpu_ptr(&softnet_data);
                                     ^
   include/linux/percpu-defs.h:265:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
                                   ^
   include/linux/percpu-defs.h:264:26: note: expanded from macro 'raw_cpu_p=
tr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                   ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   net/core/dev.c:7033:2: note: Loop condition is false.  Exiting loop
           local_irq_disable();
           ^
   include/linux/irqflags.h:224:29: note: expanded from macro 'local_irq_di=
sable'
   #define local_irq_disable()     do { raw_local_irq_disable(); } while (0)
                                   ^
   net/core/dev.c:7035:2: note: Loop condition is false.  Exiting loop
           local_irq_enable();
           ^
   include/linux/irqflags.h:223:28: note: expanded from macro 'local_irq_en=
able'
   #define local_irq_enable()      do { raw_local_irq_enable(); } while (0)
                                   ^
   net/core/dev.c:7037:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   net/core/dev.c:7040:3: note: Assuming the condition is false
                   if (list_empty(&list)) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/dev.c:7040:3: note: '?' condition is false
                   if (list_empty(&list)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/dev.c:7040:3: note: Assuming the condition is false
                   if (list_empty(&list)) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   net/core/dev.c:7040:3: note: '?' condition is true
                   if (list_empty(&list)) {
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
   net/core/dev.c:7040:3: note: Taking true branch
                   if (list_empty(&list)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/dev.c:7041:8: note: Left side of '&&' is true
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
                               ^
   net/core/dev.c:7041:4: note: Assuming the condition is false
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
                           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/dev.c:7041:4: note: '?' condition is false
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/dev.c:7041:8: note: Left side of '&&' is true
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
                               ^
   net/core/dev.c:7041:4: note: Assuming the condition is true
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
                           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   net/core/dev.c:7041:4: note: '?' condition is false
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
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
   net/core/dev.c:7041:4: note: Taking false branch
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/dev.c:7043:4: note:  Execution continues on line 7060
                           break;
                           ^
   net/core/dev.c:7060:2: note: Loop condition is false.  Exiting loop
           local_irq_disable();
           ^
   include/linux/irqflags.h:224:29: note: expanded from macro 'local_irq_di=
sable'
   #define local_irq_disable()     do { raw_local_irq_disable(); } while (0)
                                   ^
   net/core/dev.c:7065:6: note: Assuming the condition is false
           if (!list_empty(&sd->poll_list))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/dev.c:7065:2: note: '?' condition is false
           if (!list_empty(&sd->poll_list))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/dev.c:7065:6: note: Assuming the condition is false
           if (!list_empty(&sd->poll_list))
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
   net/core/dev.c:7065:2: note: '?' condition is false
           if (!list_empty(&sd->poll_list))
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
   net/core/dev.c:7065:2: note: Taking false branch
           if (!list_empty(&sd->poll_list))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/dev.c:7069:1: note: Address of stack memory associated with loc=
al variable 'list' is still referred to by the global variable 'softnet_dat=
a' upon returning to the caller.  This will be a dangling reference
   }
   ^
>> net/core/dev.c:7069:1: warning: Address of stack memory associated with =
local variable 'repoll' is still referred to by the global variable 'softne=
t_data' upon returning to the caller.  This will be a dangling reference [c=
lang-analyzer-core.StackAddressEscape]
   }
   ^
   net/core/dev.c:7026:28: note: Loop condition is false.  Exiting loop
           struct softnet_data *sd =3D this_cpu_ptr(&softnet_data);
                                     ^
   include/linux/percpu-defs.h:265:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
                                   ^
   include/linux/percpu-defs.h:264:26: note: expanded from macro 'raw_cpu_p=
tr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                   ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   net/core/dev.c:7033:2: note: Loop condition is false.  Exiting loop
           local_irq_disable();
           ^
   include/linux/irqflags.h:224:29: note: expanded from macro 'local_irq_di=
sable'
   #define local_irq_disable()     do { raw_local_irq_disable(); } while (0)
                                   ^
   net/core/dev.c:7035:2: note: Loop condition is false.  Exiting loop
           local_irq_enable();
           ^
   include/linux/irqflags.h:223:28: note: expanded from macro 'local_irq_en=
able'
   #define local_irq_enable()      do { raw_local_irq_enable(); } while (0)
                                   ^
   net/core/dev.c:7037:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   net/core/dev.c:7040:3: note: Assuming the condition is false
                   if (list_empty(&list)) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/dev.c:7040:3: note: '?' condition is false
                   if (list_empty(&list)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/dev.c:7040:3: note: Assuming the condition is false
                   if (list_empty(&list)) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   net/core/dev.c:7040:3: note: '?' condition is true
                   if (list_empty(&list)) {
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
   net/core/dev.c:7040:3: note: Taking true branch
                   if (list_empty(&list)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/dev.c:7041:8: note: Left side of '&&' is true
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
                               ^
   net/core/dev.c:7041:4: note: Assuming the condition is false
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
                           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/dev.c:7041:4: note: '?' condition is false
                           if (!sd_has_rps_ipi_waiting(sd) && list_empty(&r=
epoll))
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +7069 net/core/dev.c

29863d41bb6e1d Wei Wang          2021-02-08  7023  =

0766f788eb727e Emese Revfy       2016-06-20  7024  static __latent_entropy =
void net_rx_action(struct softirq_action *h)
726ce70e9e4050 Herbert Xu        2014-12-21  7025  {
726ce70e9e4050 Herbert Xu        2014-12-21  7026  	struct softnet_data *sd=
 =3D this_cpu_ptr(&softnet_data);
7acf8a1e8a28b3 Matthew Whitehead 2017-04-19  7027  	unsigned long time_limi=
t =3D jiffies +
7acf8a1e8a28b3 Matthew Whitehead 2017-04-19  7028  		usecs_to_jiffies(netde=
v_budget_usecs);
726ce70e9e4050 Herbert Xu        2014-12-21  7029  	int budget =3D netdev_b=
udget;
726ce70e9e4050 Herbert Xu        2014-12-21  7030  	LIST_HEAD(list);
726ce70e9e4050 Herbert Xu        2014-12-21  7031  	LIST_HEAD(repoll);
726ce70e9e4050 Herbert Xu        2014-12-21  7032  =

726ce70e9e4050 Herbert Xu        2014-12-21  7033  	local_irq_disable();
726ce70e9e4050 Herbert Xu        2014-12-21  7034  	list_splice_init(&sd->p=
oll_list, &list);
726ce70e9e4050 Herbert Xu        2014-12-21  7035  	local_irq_enable();
726ce70e9e4050 Herbert Xu        2014-12-21  7036  =

ceb8d5bf17d366 Herbert Xu        2014-12-21  7037  	for (;;) {
726ce70e9e4050 Herbert Xu        2014-12-21  7038  		struct napi_struct *n;
726ce70e9e4050 Herbert Xu        2014-12-21  7039  =

ceb8d5bf17d366 Herbert Xu        2014-12-21  7040  		if (list_empty(&list))=
 {
ceb8d5bf17d366 Herbert Xu        2014-12-21  7041  			if (!sd_has_rps_ipi_w=
aiting(sd) && list_empty(&repoll))
fec6e49b639896 Alexander Lobakin 2021-02-13  7042  				return;
ceb8d5bf17d366 Herbert Xu        2014-12-21  7043  			break;
ceb8d5bf17d366 Herbert Xu        2014-12-21  7044  		}
ceb8d5bf17d366 Herbert Xu        2014-12-21  7045  =

6bd373ebbac4b1 Herbert Xu        2014-12-21  7046  		n =3D list_first_entry=
(&list, struct napi_struct, poll_list);
6bd373ebbac4b1 Herbert Xu        2014-12-21  7047  		budget -=3D napi_poll(=
n, &repoll);
6bd373ebbac4b1 Herbert Xu        2014-12-21  7048  =

726ce70e9e4050 Herbert Xu        2014-12-21  7049  		/* If softirq window i=
s exhausted then punt.
726ce70e9e4050 Herbert Xu        2014-12-21  7050  		 * Allow this to run f=
or 2 jiffies since which will allow
726ce70e9e4050 Herbert Xu        2014-12-21  7051  		 * an average latency =
of 1.5/HZ.
726ce70e9e4050 Herbert Xu        2014-12-21  7052  		 */
ceb8d5bf17d366 Herbert Xu        2014-12-21  7053  		if (unlikely(budget <=
=3D 0 ||
ceb8d5bf17d366 Herbert Xu        2014-12-21  7054  			     time_after_eq(ji=
ffies, time_limit))) {
ceb8d5bf17d366 Herbert Xu        2014-12-21  7055  			sd->time_squeeze++;
ceb8d5bf17d366 Herbert Xu        2014-12-21  7056  			break;
ceb8d5bf17d366 Herbert Xu        2014-12-21  7057  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7058  	}
d75b1ade567ffa Eric Dumazet      2014-11-02  7059  =

d75b1ade567ffa Eric Dumazet      2014-11-02  7060  	local_irq_disable();
d75b1ade567ffa Eric Dumazet      2014-11-02  7061  =

d75b1ade567ffa Eric Dumazet      2014-11-02  7062  	list_splice_tail_init(&=
sd->poll_list, &list);
d75b1ade567ffa Eric Dumazet      2014-11-02  7063  	list_splice_tail(&repol=
l, &list);
d75b1ade567ffa Eric Dumazet      2014-11-02  7064  	list_splice(&list, &sd-=
>poll_list);
d75b1ade567ffa Eric Dumazet      2014-11-02  7065  	if (!list_empty(&sd->po=
ll_list))
d75b1ade567ffa Eric Dumazet      2014-11-02  7066  		__raise_softirq_irqoff=
(NET_RX_SOFTIRQ);
d75b1ade567ffa Eric Dumazet      2014-11-02  7067  =

e326bed2f47d03 Eric Dumazet      2010-04-22  7068  	net_rps_action_and_irq_=
enable(sd);
^1da177e4c3f41 Linus Torvalds    2005-04-16 @7069  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  7070  =


:::::: The code at line 7069 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0811704055630553457==--

