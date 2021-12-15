Content-Type: multipart/mixed; boundary="===============2891449237480390511=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5928/6993] kernel/rcu/tree.c:1187:2: warning: Value stored to 'rnp' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 16 Dec 2021 03:34:24 +0800
Message-ID: <202112160351.xsOT1S4r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2891449237480390511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   0bafb8f3ebc84525d0ae0fcea22d12151b99312f
commit: ee418df93691657d27f6118d1ff8f681c52f4aa3 [5928/6993] rcu: Create an=
d use a rcu_rdp_cpu_online()
:::::: branch date: 21 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007-20211213 (https://download.01.org/0day-ci/ar=
chive/20211216/202112160351.xsOT1S4r-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dee418df93691657d27f6118d1ff8f681c52f4aa3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ee418df93691657d27f6118d1ff8f681c52f4aa3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/pwm/core.c:427:20: warning: Value stored to 'last' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pwm_state *last =3D &pwm->last;
                             ^~~~   ~~~~~~~~~~
   drivers/pwm/core.c:427:20: note: Value stored to 'last' during its initi=
alization is never read
           struct pwm_state *last =3D &pwm->last;
                             ^~~~   ~~~~~~~~~~
   drivers/pwm/core.c:428:19: warning: Value stored to 'chip' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pwm_chip *chip =3D pwm->chip;
                            ^~~~   ~~~~~~~~~
   drivers/pwm/core.c:428:19: note: Value stored to 'chip' during its initi=
alization is never read
           struct pwm_chip *chip =3D pwm->chip;
                            ^~~~   ~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   kernel/trace/trace_events.c:1363:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "*");
                   ^~~~~~
   kernel/trace/trace_events.c:1363:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(buf, "*");
                   ^~~~~~
   kernel/trace/trace_events.c:1365:2: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   kernel/trace/trace_events.c:1365:2: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   kernel/rcu/tree.c:289:2: warning: Value stored to 'seq' is never read [c=
lang-analyzer-deadcode.DeadStores]
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:289:2: note: Value stored to 'seq' is never read
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:308:2: warning: Value stored to 'seq' is never read [c=
lang-analyzer-deadcode.DeadStores]
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:308:2: note: Value stored to 'seq' is never read
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/tree.c:1187:2: warning: Value stored to 'rnp' is never read [=
clang-analyzer-deadcode.DeadStores]
           rnp =3D rdp->mynode;
           ^     ~~~~~~~~~~~
   kernel/rcu/tree.c:1187:2: note: Value stored to 'rnp' is never read
           rnp =3D rdp->mynode;
           ^     ~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   include/linux/hid.h:1007:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-lcpower.c:24:6: note: Assuming the condition is false
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_LOGIVENDOR)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-lcpower.c:24:2: note: Taking false branch
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_LOGIVENDOR)
           ^
   drivers/hid/hid-lcpower.c:27:2: note: Control jumps to 'case 36:'  at li=
ne 35
           switch (usage->hid & HID_USAGE) {
           ^
   drivers/hid/hid-lcpower.c:35:21: note: Calling 'hid_map_usage_clear'
           case 0x024: ts_map_key_clear(KEY_MENU);           break;
                       ^
   drivers/hid/hid-lcpower.c:18:29: note: expanded from macro 'ts_map_key_c=
lear'
   #define ts_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1035:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:982:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:986:2: note: Control jumps to 'case 1:'  at line 995
           switch (type) {
           ^
   include/linux/hid.h:998:3: note:  Execution continues on line 1005
                   break;
                   ^
   include/linux/hid.h:1005:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1005:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1006:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:639:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1006:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:639:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1006:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \

vim +/rnp +1187 kernel/rcu/tree.c

c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1163  =

c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1164  /*
5554788e1d4253 kernel/rcu/tree.c Paul E. McKenney 2018-05-15  1165   * Is t=
he current CPU online as far as RCU is concerned?
2036d94a7b61ca kernel/rcutree.c  Paul E. McKenney 2012-01-30  1166   *
5554788e1d4253 kernel/rcu/tree.c Paul E. McKenney 2018-05-15  1167   * Disa=
ble preemption to avoid false positives that could otherwise
5554788e1d4253 kernel/rcu/tree.c Paul E. McKenney 2018-05-15  1168   * happ=
en due to the current CPU number being sampled, this task being
5554788e1d4253 kernel/rcu/tree.c Paul E. McKenney 2018-05-15  1169   * pree=
mpted, its old CPU being taken offline, resuming on some other CPU,
49918a54e63c99 kernel/rcu/tree.c Paul E. McKenney 2018-07-07  1170   * then=
 determining that its old CPU is now offline.
c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1171   *
5554788e1d4253 kernel/rcu/tree.c Paul E. McKenney 2018-05-15  1172   * Disa=
ble checking if in an NMI handler because we cannot safely
5554788e1d4253 kernel/rcu/tree.c Paul E. McKenney 2018-05-15  1173   * repo=
rt errors from NMI handlers anyway.  In addition, it is OK to use
5554788e1d4253 kernel/rcu/tree.c Paul E. McKenney 2018-05-15  1174   * RCU =
on an offline processor during initial boot, hence the check for
5554788e1d4253 kernel/rcu/tree.c Paul E. McKenney 2018-05-15  1175   * rcu_=
scheduler_fully_active.
c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1176   */
c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1177  bool rc=
u_lockdep_current_cpu_online(void)
c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1178  {
2036d94a7b61ca kernel/rcutree.c  Paul E. McKenney 2012-01-30  1179  	struct=
 rcu_data *rdp;
2036d94a7b61ca kernel/rcutree.c  Paul E. McKenney 2012-01-30  1180  	struct=
 rcu_node *rnp;
b97d23c51c9fee kernel/rcu/tree.c Paul E. McKenney 2018-07-04  1181  	bool r=
et =3D false;
c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1182  =

5554788e1d4253 kernel/rcu/tree.c Paul E. McKenney 2018-05-15  1183  	if (in=
_nmi() || !rcu_scheduler_fully_active)
f6f7ee9af7554e kernel/rcu/tree.c Fengguang Wu     2013-10-10  1184  		retur=
n true;
ff5c4f5cad3306 kernel/rcu/tree.c Thomas Gleixner  2020-03-13  1185  	preemp=
t_disable_notrace();
da1df50d16171f kernel/rcu/tree.c Paul E. McKenney 2018-07-03  1186  	rdp =
=3D this_cpu_ptr(&rcu_data);
2036d94a7b61ca kernel/rcutree.c  Paul E. McKenney 2012-01-30 @1187  	rnp =
=3D rdp->mynode;
defd1f8a1f4efe kernel/rcu/tree.c David Woodhouse  2021-02-16  1188  	/*
defd1f8a1f4efe kernel/rcu/tree.c David Woodhouse  2021-02-16  1189  	 * Str=
ictly, we care here about the case where the current CPU is
defd1f8a1f4efe kernel/rcu/tree.c David Woodhouse  2021-02-16  1190  	 * in =
rcu_cpu_starting() and thus has an excuse for rdp->grpmask
defd1f8a1f4efe kernel/rcu/tree.c David Woodhouse  2021-02-16  1191  	 * not=
 being up to date. So arch_spin_is_locked() might have a
defd1f8a1f4efe kernel/rcu/tree.c David Woodhouse  2021-02-16  1192  	 * fal=
se positive if it's held by some *other* CPU, but that's
defd1f8a1f4efe kernel/rcu/tree.c David Woodhouse  2021-02-16  1193  	 * OK =
because that just means a false *negative* on the warning.
defd1f8a1f4efe kernel/rcu/tree.c David Woodhouse  2021-02-16  1194  	 */
ee418df9369165 kernel/rcu/tree.c Paul E. McKenney 2021-12-10  1195  	if (rc=
u_rdp_cpu_online(rdp) || arch_spin_is_locked(&rcu_state.ofl_lock))
b97d23c51c9fee kernel/rcu/tree.c Paul E. McKenney 2018-07-04  1196  		ret =
=3D true;
ff5c4f5cad3306 kernel/rcu/tree.c Thomas Gleixner  2020-03-13  1197  	preemp=
t_enable_notrace();
b97d23c51c9fee kernel/rcu/tree.c Paul E. McKenney 2018-07-04  1198  	return=
 ret;
c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1199  }
c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1200  EXPORT_=
SYMBOL_GPL(rcu_lockdep_current_cpu_online);
c0d6d01bffdce1 kernel/rcutree.c  Paul E. McKenney 2012-01-23  1201  =


:::::: The code at line 1187 was first introduced by commit
:::::: 2036d94a7b61ca5032ce90f2bda06afec0fe713e rcu: Rework detection of us=
e of RCU by offline CPUs

:::::: TO: Paul E. McKenney <paul.mckenney@linaro.org>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2891449237480390511==--

