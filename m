Content-Type: multipart/mixed; boundary="===============8561022494606475914=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/net/netlink.h:1477:32: warning: Null pointer passed as 1st argument to string length function [clang-analyzer-unix.cstring.NullArg]
Date: Mon, 11 Jul 2022 14:15:23 +0800
Message-ID: <202207111444.P9b63WMn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8561022494606475914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/net/netlink.h:1477:32: warning: Null pointer passed as 1st argumen=
t to string length function [clang-analyzer-unix.cstring.NullArg]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yajun Deng <yajun.deng@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   32346491ddf24599decca06190ebca03ff9de7f8
commit: b37a466837393af72fe8bcb8f1436410f3f173f3 netdevice: add the case if=
 dev is NULL
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220707 (https://download.01.org/0day-ci/arch=
ive/20220711/202207111444.P9b63WMn-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c34=
67a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db37a466837393af72fe8bcb8f1436410f3f173f3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b37a466837393af72fe8bcb8f1436410f3f173f3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~
   include/linux/netdevice.h:4163:6: note: Assuming 'dev' is non-null
           if (dev) {
               ^~~
   include/linux/netdevice.h:4163:2: note: Taking true branch
           if (dev) {
           ^
   include/linux/netdevice.h:4165:3: note: Loop condition is false.  Exitin=
g loop
                   this_cpu_inc(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_siz=
e_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/netdevice.h:4165:3: note: Control jumps to 'case 4:'  at l=
ine 4165
                   this_cpu_inc(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:376:2: note: expanded from macro '__pcpu_siz=
e_call'
           switch(sizeof(variable)) {                                      \
           ^
   include/linux/netdevice.h:4165:3: note: Loop condition is false.  Exitin=
g loop
                   this_cpu_inc(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:90:34: note: expanded from macro 'this_cp=
u_add_4'
   #define this_cpu_add_4(pcp, val) arch_this_cpu_add(pcp, val, "laa", "asi=
", int)
                                    ^
   arch/s390/include/asm/percpu.h:71:2: note: expanded from macro 'arch_thi=
s_cpu_add'
           preempt_disable_notrace();                                      \
           ^
   include/linux/preempt.h:228:35: note: expanded from macro 'preempt_disab=
le_notrace'
   #define preempt_disable_notrace() \
                                     ^
   include/linux/netdevice.h:4165:3: note: Loop condition is false.  Exitin=
g loop
                   this_cpu_inc(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:72:10: note: expanded from macro 'arch_th=
is_cpu_add'
           ptr__ =3D raw_cpu_ptr(&(pcp));                            \
                   ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/netdevice.h:4165:3: note: Dereference of null pointer
                   this_cpu_inc(*dev->pcpu_refcnt);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:188:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
>> include/net/netlink.h:1477:32: warning: Null pointer passed as 1st argum=
ent to string length function [clang-analyzer-unix.cstring.NullArg]
           return nla_put(skb, attrtype, strlen(str) + 1, str);
                                         ^
   net/ieee802154/nl-phy.c:172:2: note: Taking false branch
           pr_debug("%s\n", __func__);
           ^
   include/linux/printk.h:477:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:140:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/ieee802154/nl-phy.c:174:6: note: Assuming the condition is false
           if (!info->attrs[IEEE802154_ATTR_PHY_NAME])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:174:2: note: Taking false branch
           if (!info->attrs[IEEE802154_ATTR_PHY_NAME])
           ^
   net/ieee802154/nl-phy.c:178:6: note: Assuming the condition is false
           if (name[nla_len(info->attrs[IEEE802154_ATTR_PHY_NAME]) - 1] !=
=3D '\0')
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/ieee802154/nl-phy.c:178:2: note: Taking false branch
           if (name[nla_len(info->attrs[IEEE802154_ATTR_PHY_NAME]) - 1] !=
=3D '\0')
           ^
   net/ieee802154/nl-phy.c:181:6: note: Assuming the condition is false
           if (info->attrs[IEEE802154_ATTR_DEV_NAME]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:181:2: note: Taking false branch
           if (info->attrs[IEEE802154_ATTR_DEV_NAME]) {
           ^
   net/ieee802154/nl-phy.c:192:2: note: Taking false branch
           if (strlen(devname) >=3D IFNAMSIZ)
           ^
   net/ieee802154/nl-phy.c:196:6: note: Assuming 'phy' is non-null
           if (!phy)
               ^~~~
   net/ieee802154/nl-phy.c:196:2: note: Taking false branch
           if (!phy)
           ^
   net/ieee802154/nl-phy.c:200:6: note: Assuming 'msg' is non-null
           if (!msg)
               ^~~~
   net/ieee802154/nl-phy.c:200:2: note: Taking false branch
           if (!msg)
           ^
   net/ieee802154/nl-phy.c:203:6: note: Assuming pointer value is null
           if (info->attrs[IEEE802154_ATTR_HW_ADDR] &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:203:43: note: Left side of '&&' is false
           if (info->attrs[IEEE802154_ATTR_HW_ADDR] &&
                                                    ^
   net/ieee802154/nl-phy.c:210:6: note: Assuming the condition is false
           if (info->attrs[IEEE802154_ATTR_DEV_TYPE]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-phy.c:210:2: note: Taking false branch
           if (info->attrs[IEEE802154_ATTR_DEV_TYPE]) {
           ^
   net/ieee802154/nl-phy.c:220:2: note: Taking false branch
           if (IS_ERR(dev)) {
           ^
   net/ieee802154/nl-phy.c:226:2: note: Taking false branch
           if (info->attrs[IEEE802154_ATTR_HW_ADDR]) {
           ^
   net/ieee802154/nl-phy.c:243:6: note: Assuming the condition is false
           if (nla_put_string(msg, IEEE802154_ATTR_PHY_NAME, wpan_phy_name(=
phy)) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   net/ieee802154/nl-phy.c:243:6: note: Left side of '||' is false
   net/ieee802154/nl-phy.c:244:52: note: Passing null pointer value via 3rd=
 parameter 'str'
               nla_put_string(msg, IEEE802154_ATTR_DEV_NAME, dev->name)) {
                                                             ^~~~~~~~~
   net/ieee802154/nl-phy.c:244:6: note: Calling 'nla_put_string'
               nla_put_string(msg, IEEE802154_ATTR_DEV_NAME, dev->name)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1477:32: note: Null pointer passed as 1st argument=
 to string length function
           return nla_put(skb, attrtype, strlen(str) + 1, str);
                                         ^      ~~~
   Suppressed 24 warnings (12 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   arch/s390/include/asm/preempt.h:17:9: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   net/netlink/af_netlink.c:2537:6: note: Assuming 'group' is 0
           if (group) {
               ^~~~~
   net/netlink/af_netlink.c:2537:2: note: Taking false branch
           if (group) {
           ^
   net/netlink/af_netlink.c:2552:6: note: Assuming 'report' is not equal to=
 0
           if (report) {
               ^~~~~~
   net/netlink/af_netlink.c:2552:2: note: Taking true branch
           if (report) {
           ^
   net/netlink/af_netlink.c:2555:10: note: Calling 'nlmsg_unicast'

vim +1477 include/net/netlink.h

4778e0be16c291 Jiri Pirko  2012-07-27  1467  =

bfa83a9e03cf8d Thomas Graf 2005-11-10  1468  /**
bfa83a9e03cf8d Thomas Graf 2005-11-10  1469   * nla_put_string - Add a stri=
ng netlink attribute to a socket buffer
bfa83a9e03cf8d Thomas Graf 2005-11-10  1470   * @skb: socket buffer to add =
attribute to
bfa83a9e03cf8d Thomas Graf 2005-11-10  1471   * @attrtype: attribute type
bfa83a9e03cf8d Thomas Graf 2005-11-10  1472   * @str: NUL terminated string
bfa83a9e03cf8d Thomas Graf 2005-11-10  1473   */
bfa83a9e03cf8d Thomas Graf 2005-11-10  1474  static inline int nla_put_stri=
ng(struct sk_buff *skb, int attrtype,
bfa83a9e03cf8d Thomas Graf 2005-11-10  1475  				 const char *str)
bfa83a9e03cf8d Thomas Graf 2005-11-10  1476  {
bfa83a9e03cf8d Thomas Graf 2005-11-10 @1477  	return nla_put(skb, attrtype,=
 strlen(str) + 1, str);
bfa83a9e03cf8d Thomas Graf 2005-11-10  1478  }
bfa83a9e03cf8d Thomas Graf 2005-11-10  1479  =


:::::: The code at line 1477 was first introduced by commit
:::::: bfa83a9e03cf8d501c6272999843470afecb32ed [NETLINK]: Type-safe netlin=
k messages/attributes interface

:::::: TO: Thomas Graf <tgraf@suug.ch>
:::::: CC: Thomas Graf <tgr@axs.localdomain>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8561022494606475914==--

