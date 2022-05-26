Content-Type: multipart/mixed; boundary="===============7388436648580092276=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/net/sch_generic.h:877:20: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Fri, 27 May 2022 07:04:52 +0800
Message-ID: <202205270635.N32swCmg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7388436648580092276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   babf0bb978e3c9fce6c4eba6b744c8754fd43d8e
commit: c4fef01ba4793a85b2d38a472bddd1e3b56d9585 net: sched: implement TCQ_=
F_CAN_BYPASS for lockless qdisc
date:   11 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220518 (https://download.01.org/0day-ci/arch=
ive/20220527/202205270635.N32swCmg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc4fef01ba4793a85b2d38a472bddd1e3b56d9585
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c4fef01ba4793a85b2d38a472bddd1e3b56d9585
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/dev.c:5996:7: note: Field 'vlan_present' is 0
                   if (skb_vlan_tag_present(p))
                       ^
   include/linux/if_vlan.h:77:47: note: expanded from macro 'skb_vlan_tag_p=
resent'
   #define skb_vlan_tag_present(__skb)     ((__skb)->vlan_present)
                                                     ^
   net/core/dev.c:5996:3: note: '?' condition is false
                   if (skb_vlan_tag_present(p))
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
   net/core/dev.c:5996:3: note: Taking false branch
                   if (skb_vlan_tag_present(p))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/dev.c:5998:12: note: Calling 'skb_metadata_dst_cmp'
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
>> include/net/sch_generic.h:877:20: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
           bstats_cpu_update(this_cpu_ptr(sch->cpu_bstats), skb);
                             ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:182:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   net/core/dev.c:3854:2: note: Assuming the condition is false
           if (q->flags & TCQ_F_NOLOCK) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/dev.c:3854:2: note: '?' condition is false
           if (q->flags & TCQ_F_NOLOCK) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/dev.c:3854:2: note: '?' condition is true
           if (q->flags & TCQ_F_NOLOCK) {
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
   net/core/dev.c:3854:2: note: Taking true branch
           if (q->flags & TCQ_F_NOLOCK) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/dev.c:3855:7: note: Assuming the condition is true
                   if (q->flags & TCQ_F_CAN_BYPASS && nolock_qdisc_is_empty=
(q) &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/dev.c:3855:7: note: Left side of '&&' is true
                   if (q->flags & TCQ_F_CAN_BYPASS && nolock_qdisc_is_empty=
(q) &&
                       ^
   net/core/dev.c:3855:7: note: Left side of '&&' is true
   net/core/dev.c:3855:3: note: Assuming the condition is false
                   if (q->flags & TCQ_F_CAN_BYPASS && nolock_qdisc_is_empty=
(q) &&
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/dev.c:3855:3: note: '?' condition is false
                   if (q->flags & TCQ_F_CAN_BYPASS && nolock_qdisc_is_empty=
(q) &&
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/dev.c:3855:7: note: Assuming the condition is true
                   if (q->flags & TCQ_F_CAN_BYPASS && nolock_qdisc_is_empty=
(q) &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
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
   net/core/dev.c:3855:7: note: Left side of '&&' is true
                   if (q->flags & TCQ_F_CAN_BYPASS && nolock_qdisc_is_empty=
(q) &&
                       ^
   net/core/dev.c:3855:7: note: Left side of '&&' is true

vim +877 include/net/sch_generic.h

22e0f8b9322cb1 John Fastabend 2014-09-28  873  =

24ea591d2201c3 Eric Dumazet   2015-07-06  874  static inline void qdisc_bst=
ats_cpu_update(struct Qdisc *sch,
24ea591d2201c3 Eric Dumazet   2015-07-06  875  					   const struct sk_buff=
 *skb)
24ea591d2201c3 Eric Dumazet   2015-07-06  876  {
24ea591d2201c3 Eric Dumazet   2015-07-06 @877  	bstats_cpu_update(this_cpu_=
ptr(sch->cpu_bstats), skb);
24ea591d2201c3 Eric Dumazet   2015-07-06  878  }
24ea591d2201c3 Eric Dumazet   2015-07-06  879  =


:::::: The code at line 877 was first introduced by commit
:::::: 24ea591d2201c3257d666466e8fac50a6cf3c52f net: sched: extend percpu s=
tats helpers

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7388436648580092276==--

