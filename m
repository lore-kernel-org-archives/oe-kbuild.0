Content-Type: multipart/mixed; boundary="===============0585332174309902906=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH mptcp-next v2 1/3] mptcp: set fullmesh flag in pm_netlink
Date: Sat, 15 Jan 2022 21:00:15 +0800
Message-ID: <202201152053.18RZ72y4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0585332174309902906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <503652e15fb983e53f4b20a95eb24dbde773e12e.1641868545.git.gelia=
ng.tang@suse.com>
References: <503652e15fb983e53f4b20a95eb24dbde773e12e.1641868545.git.gelian=
g.tang@suse.com>
TO: Geliang Tang <geliang.tang@suse.com>

Hi Geliang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mptcp/export]
[also build test WARNING on linus/master next-20220115]
[cannot apply to shuah-kselftest/next v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Geliang-Tang/fullmesh-flag=
-setting-support/20220111-104417
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
115/202201152053.18RZ72y4-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 84654f=
2733f63dc725a7b3d7c55d56849d2d9358)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/83615876cb132bd3d75b44a28=
869443648e64a08
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Geliang-Tang/fullmesh-flag-setting=
-support/20220111-104417
        git checkout 83615876cb132bd3d75b44a28869443648e64a08
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   net/mptcp/pm_netlink.c:63:2: note: Taking false branch
           if (a->family =3D=3D b->family) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mptcp/pm_netlink.c:69:16: note: Field 'family' is not equal to 2
           } else if (a->family =3D=3D AF_INET) {
                         ^
   net/mptcp/pm_netlink.c:69:9: note: '?' condition is false
           } else if (a->family =3D=3D AF_INET) {
                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/mptcp/pm_netlink.c:69:16: note: Field 'family' is not equal to 2
           } else if (a->family =3D=3D AF_INET) {
                         ^
   net/mptcp/pm_netlink.c:69:9: note: '?' condition is false
           } else if (a->family =3D=3D AF_INET) {
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
   net/mptcp/pm_netlink.c:69:9: note: Taking false branch
           } else if (a->family =3D=3D AF_INET) {
                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mptcp/pm_netlink.c:72:13: note: Assuming field 'family' is equal to 2
           } else if (b->family =3D=3D AF_INET) {
                      ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/mptcp/pm_netlink.c:72:9: note: '?' condition is false
           } else if (b->family =3D=3D AF_INET) {
                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/mptcp/pm_netlink.c:72:16: note: Field 'family' is equal to 2
           } else if (b->family =3D=3D AF_INET) {
                         ^
   net/mptcp/pm_netlink.c:72:9: note: '?' condition is true
           } else if (b->family =3D=3D AF_INET) {
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
   net/mptcp/pm_netlink.c:72:9: note: Taking true branch
           } else if (b->family =3D=3D AF_INET) {
                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mptcp/pm_netlink.c:73:7: note: Calling 'ipv6_addr_v4mapped'
                   if (ipv6_addr_v4mapped(&a->addr6))
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/net/ipv6.h:696:43: note: The left operand of '|' is a garbage va=
lue
                   (__force unsigned long)(a->s6_addr32[0] | a->s6_addr32[1=
]) |
                                           ~~~~~~~~~~~~~~~ ^
>> net/mptcp/pm_netlink.c:274:2: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
           list_for_each_entry(entry, &msk->pm.anno_list, list) {
           ^
   include/linux/list.h:632:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   net/mptcp/pm_netlink.c:514:15: note: Assuming the condition is false
           if (unlikely(!(msk->pm.status & BIT(MPTCP_PM_MPC_ENDPOINT_ACCOUN=
TED))) && msk->first) {
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
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/mptcp/pm_netlink.c:514:73: note: Left side of '&&' is false
           if (unlikely(!(msk->pm.status & BIT(MPTCP_PM_MPC_ENDPOINT_ACCOUN=
TED))) && msk->first) {
                                                                           =
       ^
   net/mptcp/pm_netlink.c:514:2: note: '?' condition is false
           if (unlikely(!(msk->pm.status & BIT(MPTCP_PM_MPC_ENDPOINT_ACCOUN=
TED))) && msk->first) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/mptcp/pm_netlink.c:514:73: note: Left side of '&&' is false
           if (unlikely(!(msk->pm.status & BIT(MPTCP_PM_MPC_ENDPOINT_ACCOUN=
TED))) && msk->first) {
                                                                           =
       ^
   net/mptcp/pm_netlink.c:514:2: note: '?' condition is false
           if (unlikely(!(msk->pm.status & BIT(MPTCP_PM_MPC_ENDPOINT_ACCOUN=
TED))) && msk->first) {
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
   net/mptcp/pm_netlink.c:514:2: note: Taking false branch
           if (unlikely(!(msk->pm.status & BIT(MPTCP_PM_MPC_ENDPOINT_ACCOUN=
TED))) && msk->first) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/mptcp/pm_netlink.c:526:2: note: '?' condition is false
           pr_debug("local %d:%d signal %d:%d subflows %d:%d\n",
           ^
   include/linux/printk.h:574:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/mptcp/pm_netlink.c:526:2: note: '?' condition is false
           pr_debug("local %d:%d signal %d:%d subflows %d:%d\n",
           ^
   include/linux/printk.h:574:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'

vim +274 net/mptcp/pm_netlink.c

01cacb00b35cb6 Paolo Abeni      2020-03-27  265  =

d88c476f4a7dd6 Geliang Tang     2021-03-26  266  struct mptcp_pm_add_entry *
d88c476f4a7dd6 Geliang Tang     2021-03-26  267  mptcp_lookup_anno_list_by_=
saddr(struct mptcp_sock *msk,
b6c08380860b92 Geliang Tang     2020-09-24  268  				struct mptcp_addr_info=
 *addr)
b6c08380860b92 Geliang Tang     2020-09-24  269  {
0abd40f823cbd3 Geliang Tang     2020-09-24  270  	struct mptcp_pm_add_entry=
 *entry;
b6c08380860b92 Geliang Tang     2020-09-24  271  =

3abc05d9ef6fe9 Florian Westphal 2021-02-04  272  	lockdep_assert_held(&msk-=
>pm.lock);
3abc05d9ef6fe9 Florian Westphal 2021-02-04  273  =

b6c08380860b92 Geliang Tang     2020-09-24 @274  	list_for_each_entry(entry=
, &msk->pm.anno_list, list) {
60b57bf76cfff5 Geliang Tang     2021-02-01  275  		if (addresses_equal(&ent=
ry->addr, addr, true))
00cfd77b9063dc Geliang Tang     2020-09-24  276  			return entry;
b6c08380860b92 Geliang Tang     2020-09-24  277  	}
b6c08380860b92 Geliang Tang     2020-09-24  278  =

00cfd77b9063dc Geliang Tang     2020-09-24  279  	return NULL;
00cfd77b9063dc Geliang Tang     2020-09-24  280  }
00cfd77b9063dc Geliang Tang     2020-09-24  281  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0585332174309902906==--

