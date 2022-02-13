Content-Type: multipart/mixed; boundary="===============1936520465831770194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/landlock/syscalls.c:329:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 13 Feb 2022 12:33:18 +0800
Message-ID: <202202131248.sMsQRNzO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1936520465831770194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Micka=C3=ABl Sala=C3=BCn" <mic@linux.microsoft.com>
CC: James Morris <jamorris@linux.microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b81b1829e7e39f6cebdf6e4d5484eacbceda8554
commit: 265885daf3e5082eb9f6e2a23bdbf9ba4456a21b landlock: Add syscall impl=
ementations
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: mips-randconfig-c004-20220211 (https://download.01.org/0day-ci/arch=
ive/20220213/202202131248.sMsQRNzO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D265885daf3e5082eb9f6e2a23bdbf9ba4456a21b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 265885daf3e5082eb9f6e2a23bdbf9ba4456a21b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (fwnode_property_present(fwnode, "color")) {
           ^
   drivers/leds/led-core.c:391:6: note: Assuming the condition is true
           if (!fwnode_property_present(fwnode, "function"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:391:2: note: Taking true branch
           if (!fwnode_property_present(fwnode, "function"))
           ^
   drivers/leds/led-core.c:392:3: note: Returning without writing to 'props=
->label', which participates in a condition later
                   return;
                   ^
   drivers/leds/led-core.c:392:3: note: Returning without writing to 'props=
->function', which participates in a condition later
   drivers/leds/led-core.c:392:3: note: Returning without writing to 'props=
->color_present', which participates in a condition later
   drivers/leds/led-core.c:429:2: note: Returning from 'led_parse_fwnode_pr=
ops'
           led_parse_fwnode_props(dev, fwnode, &props);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:431:12: note: Field 'label' is null
           if (props.label) {
                     ^
   drivers/leds/led-core.c:431:2: note: Taking false branch
           if (props.label) {
           ^
   drivers/leds/led-core.c:445:19: note: Field 'function' is null
           } else if (props.function || props.color_present) {
                            ^
   drivers/leds/led-core.c:445:13: note: Left side of '||' is false
           } else if (props.function || props.color_present) {
                      ^
   drivers/leds/led-core.c:445:37: note: Field 'color_present' is false
           } else if (props.function || props.color_present) {
                                              ^
   drivers/leds/led-core.c:445:9: note: Taking false branch
           } else if (props.function || props.color_present) {
                  ^
   drivers/leds/led-core.c:464:13: note: Assuming field 'default_label' is =
null
           } else if (init_data->default_label) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:464:9: note: Taking false branch
           } else if (init_data->default_label) {
                  ^
   drivers/leds/led-core.c:471:13: note: Assuming the condition is true
           } else if (is_of_node(fwnode)) {
                      ^~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:471:9: note: Taking true branch
           } else if (is_of_node(fwnode)) {
                  ^
   drivers/leds/led-core.c:472:30: note: Assuming the condition is false
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:472:30: note: '?' condition is false
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/leds/led-core.c:472:30: note: Access to field 'name' results in =
a dereference of a null pointer
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/scsi/scsi_transport_spi.c:1623:2: warning: Value stored to 'erro=
r' is never read [clang-analyzer-deadcode.DeadStores]
           error =3D anon_transport_class_register(&spi_device_class);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_transport_spi.c:1623:2: note: Value stored to 'error' =
is never read
           error =3D anon_transport_class_register(&spi_device_class);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   security/device_cgroup.c:264:3: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(str, "*");
                   ^~~~~~
   security/device_cgroup.c:264:3: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
                   strcpy(str, "*");
                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> security/landlock/syscalls.c:329:6: warning: Branch condition evaluates =
to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!path_beneath_attr.allowed_access) {
               ^
   security/landlock/syscalls.c:295:1: note: Calling '__do_sys_landlock_add=
_rule'
   SYSCALL_DEFINE4(landlock_add_rule,
   ^
   include/linux/syscalls.h:219:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
   #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:248:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   security/landlock/syscalls.c:304:6: note: Assuming 'landlock_initialized=
' is true
           if (!landlock_initialized)
               ^~~~~~~~~~~~~~~~~~~~~
   security/landlock/syscalls.c:304:2: note: Taking false branch
           if (!landlock_initialized)
           ^
   security/landlock/syscalls.c:308:6: note: Assuming 'flags' is 0
           if (flags)
               ^~~~~
   security/landlock/syscalls.c:308:2: note: Taking false branch
           if (flags)
           ^
   security/landlock/syscalls.c:311:6: note: Assuming 'rule_type' is equal =
to LANDLOCK_RULE_PATH_BENEATH
           if (rule_type !=3D LANDLOCK_RULE_PATH_BENEATH)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/landlock/syscalls.c:311:2: note: Taking false branch
           if (rule_type !=3D LANDLOCK_RULE_PATH_BENEATH)
           ^
   security/landlock/syscalls.c:315:8: note: Calling 'copy_from_user'
           res =3D copy_from_user(&path_beneath_attr, rule_attr,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:616:2: note: Taking false branch
           if (eva_kernel_access())
           ^
   arch/mips/include/asm/uaccess.h:619:3: note: Returning without writing t=
o 'to->allowed_access'
                   return __invoke_copy_from_user(to, from, n);
                   ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->a=
llowed_access'
           return res;
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->a=
llowed_access'

vim +329 security/landlock/syscalls.c

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  265  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  266  /**
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  267   * sys_landlock_ad=
d_rule - Add a new rule to a ruleset
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  268   *
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  269   * @ruleset_fd: Fi=
le descriptor tied to the ruleset that should be extended
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  270   *		with the new r=
ule.
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  271   * @rule_type: Ide=
ntify the structure type pointed to by @rule_attr (only
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  272   *             LAN=
DLOCK_RULE_PATH_BENEATH for now).
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  273   * @rule_attr: Poi=
nter to a rule (only of type &struct
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  274   *             lan=
dlock_path_beneath_attr for now).
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  275   * @flags: Must be=
 0.
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  276   *
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  277   * This system cal=
l enables to define a new rule and add it to an existing
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  278   * ruleset.
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  279   *
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  280   * Possible return=
ed errors are:
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  281   *
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  282   * - EOPNOTSUPP: L=
andlock is supported by the kernel but disabled at boot time;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  283   * - EINVAL: @flag=
s is not 0, or inconsistent access in the rule (i.e.
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  284   *   &landlock_pat=
h_beneath_attr.allowed_access is not a subset of the rule's
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  285   *   accesses);
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  286   * - ENOMSG: Empty=
 accesses (e.g. &landlock_path_beneath_attr.allowed_access);
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  287   * - EBADF: @rules=
et_fd is not a file descriptor for the current thread, or a
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  288   *   member of @ru=
le_attr is not a file descriptor as expected;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  289   * - EBADFD: @rule=
set_fd is not a ruleset file descriptor, or a member of
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  290   *   @rule_attr is=
 not the expected file descriptor type (e.g. file open
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  291   *   without O_PAT=
H);
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  292   * - EPERM: @rules=
et_fd has no write access to the underlying ruleset;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  293   * - EFAULT: @rule=
_attr inconsistency.
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  294   */
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  295  SYSCALL_DEFINE4(la=
ndlock_add_rule,
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  296  		const int, rules=
et_fd, const enum landlock_rule_type, rule_type,
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  297  		const void __use=
r *const, rule_attr, const __u32, flags)
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  298  {
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  299  	struct landlock_p=
ath_beneath_attr path_beneath_attr;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  300  	struct path path;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  301  	struct landlock_r=
uleset *ruleset;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  302  	int res, err;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  303  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  304  	if (!landlock_ini=
tialized)
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  305  		return -EOPNOTSU=
PP;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  306  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  307  	/* No flag for no=
w. */
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  308  	if (flags)
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  309  		return -EINVAL;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  310  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  311  	if (rule_type !=
=3D LANDLOCK_RULE_PATH_BENEATH)
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  312  		return -EINVAL;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  313  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  314  	/* Copies raw use=
r space buffer, only one type for now. */
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  315  	res =3D copy_from=
_user(&path_beneath_attr, rule_attr,
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  316  			sizeof(path_ben=
eath_attr));
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  317  	if (res)
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  318  		return -EFAULT;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  319  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  320  	/* Gets and check=
s the ruleset. */
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  321  	ruleset =3D get_r=
uleset_from_fd(ruleset_fd, FMODE_CAN_WRITE);
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  322  	if (IS_ERR(rulese=
t))
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  323  		return PTR_ERR(r=
uleset);
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  324  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  325  	/*
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  326  	 * Informs about =
useless rule: empty allowed_access (i.e. deny rules)
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  327  	 * are ignored in=
 path walks.
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  328  	 */
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22 @329  	if (!path_beneath=
_attr.allowed_access) {
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  330  		err =3D -ENOMSG;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  331  		goto out_put_rul=
eset;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  332  	}
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  333  	/*
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  334  	 * Checks that al=
lowed_access matches the @ruleset constraints
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  335  	 * (ruleset->fs_a=
ccess_masks[0] is automatically upgraded to 64-bits).
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  336  	 */
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  337  	if ((path_beneath=
_attr.allowed_access | ruleset->fs_access_masks[0]) !=3D
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  338  			ruleset->fs_acc=
ess_masks[0]) {
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  339  		err =3D -EINVAL;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  340  		goto out_put_rul=
eset;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  341  	}
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  342  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  343  	/* Gets and check=
s the new rule. */
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  344  	err =3D get_path_=
from_fd(path_beneath_attr.parent_fd, &path);
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  345  	if (err)
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  346  		goto out_put_rul=
eset;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  347  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  348  	/* Imports the ne=
w rule. */
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  349  	err =3D landlock_=
append_fs_rule(ruleset, &path,
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  350  			path_beneath_at=
tr.allowed_access);
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  351  	path_put(&path);
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  352  =

265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  353  out_put_ruleset:
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  354  	landlock_put_rule=
set(ruleset);
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  355  	return err;
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  356  }
265885daf3e508 Micka=C3=ABl Sala=C3=BCn 2021-04-22  357  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1936520465831770194==--

