Content-Type: multipart/mixed; boundary="===============7803773335728468968=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/landlock/syscalls.c:329:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Fri, 11 Mar 2022 00:03:59 +0800
Message-ID: <202203110046.u5F6fTWJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7803773335728468968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Micka=C3=ABl Sala=C3=BCn" <mic@linux.microsoft.com>
CC: James Morris <jamorris@linux.microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1db333d9a51f3459fba1bcaa564d95befe79f0b3
commit: 265885daf3e5082eb9f6e2a23bdbf9ba4456a21b landlock: Add syscall impl=
ementations
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c004-20220227 (https://download.01.org/0day-ci/arch=
ive/20220311/202203110046.u5F6fTWJ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
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
           if (!buf->data)
               ^~~~~~~~~~
   include/linux/tpm.h:332:2: note: Taking false branch
           if (!buf->data)
           ^
   include/linux/tpm.h:337:2: note: Returning zero, which participates in a=
 condition later
           return 0;
           ^~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:488:7: note: Returning from 'tpm_buf_init'
           rc =3D tpm_buf_init(&buf, TPM_TAG_RQU_COMMAND, TPM_ORD_GET_CAP);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:489:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/char/tpm/tpm1-cmd.c:489:2: note: Taking false branch
           if (rc)
           ^
   drivers/char/tpm/tpm1-cmd.c:492:6: note: 'subcap_id' is not equal to TPM=
_CAP_VERSION_1_1
           if (subcap_id =3D=3D TPM_CAP_VERSION_1_1 ||
               ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:492:6: note: Left side of '||' is false
   drivers/char/tpm/tpm1-cmd.c:493:6: note: 'subcap_id' is not equal to TPM=
_CAP_VERSION_1_2
               subcap_id =3D=3D TPM_CAP_VERSION_1_2) {
               ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:492:2: note: Taking false branch
           if (subcap_id =3D=3D TPM_CAP_VERSION_1_1 ||
           ^
   drivers/char/tpm/tpm1-cmd.c:497:7: note: 'subcap_id' is not equal to TPM=
_CAP_FLAG_PERM
                   if (subcap_id =3D=3D TPM_CAP_FLAG_PERM ||
                       ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:497:7: note: Left side of '||' is false
   drivers/char/tpm/tpm1-cmd.c:498:7: note: 'subcap_id' is not equal to TPM=
_CAP_FLAG_VOL
                       subcap_id =3D=3D TPM_CAP_FLAG_VOL)
                       ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:497:3: note: Taking false branch
                   if (subcap_id =3D=3D TPM_CAP_FLAG_PERM ||
                   ^
   drivers/char/tpm/tpm1-cmd.c:506:7: note: Value assigned to field 'durati=
on_adjusted', which participates in a condition later
           rc =3D tpm_transmit_cmd(chip, &buf, min_cap_length, desc);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:507:6: note: Assuming 'rc' is 0, which parti=
cipates in a condition later
           if (!rc)
               ^~~
   drivers/char/tpm/tpm1-cmd.c:507:2: note: Taking true branch
           if (!rc)
           ^
   drivers/char/tpm/tpm1-cmd.c:510:2: note: Returning zero (loaded from 'rc=
'), which participates in a condition later
           return rc;
           ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:417:7: note: Returning from 'tpm1_getcap'
           rc =3D tpm1_getcap(chip, TPM_CAP_PROP_TIS_DURATION, &cap,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:420:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/char/tpm/tpm1-cmd.c:420:2: note: Taking false branch
           if (rc)
           ^
   drivers/char/tpm/tpm1-cmd.c:435:6: note: Assuming field 'update_duration=
s' is null
           if (chip->ops->update_durations)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:435:2: note: Taking false branch
           if (chip->ops->update_durations)
           ^
   drivers/char/tpm/tpm1-cmd.c:438:6: note: Assuming field 'duration_adjust=
ed' is true
           if (chip->duration_adjusted) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:438:2: note: Taking true branch
           if (chip->duration_adjusted) {
           ^
   drivers/char/tpm/tpm1-cmd.c:440:29: note: Assigned value is garbage or u=
ndefined
                   chip->duration[TPM_SHORT] =3D durations[0];
                                             ^ ~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:747:3: warning: Value stored to 'rc' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   rc =3D tpm1_pcr_extend(chip, tpm_suspend_pcr, dummy_hash,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:747:3: note: Value stored to 'rc' is never r=
ead
                   rc =3D tpm1_pcr_extend(chip, tpm_suspend_pcr, dummy_hash,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   6 warnings generated.
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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
   include/linux/uaccess.h:157:33: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
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
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   security/landlock/syscalls.c:315:8: note: Returning from 'copy_from_user'

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
--===============7803773335728468968==--

