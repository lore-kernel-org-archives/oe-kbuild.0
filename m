Content-Type: multipart/mixed; boundary="===============4483545488131826762=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-omap2/id.c:158:2: warning: Value stored to 'rev' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 08 Jan 2022 12:25:29 +0800
Message-ID: <202201081249.yKErZhBh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4483545488131826762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Russell King <rmk+kernel@armlinux.org.uk>

Hi Randy,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ddec8ed2d4905d0967ce2ec432e440e582aa52c6
commit: fd749fe4bcb00ad80d9eece709f804bb4ac6bf1e ARM: 9065/1: OABI compat: =
fix build when EPOLL is not enabled
date:   11 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220103 (https://download.01.org/0day-ci/archi=
ve/20220108/202201081249.yKErZhBh-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea=
47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfd749fe4bcb00ad80d9eece709f804bb4ac6bf1e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fd749fe4bcb00ad80d9eece709f804bb4ac6bf1e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                      ^
   include/linux/cred.h:330:12: note: expanded from macro 'get_current_cred'
           (get_cred(current_cred()))
                     ^
   include/linux/cred.h:298:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:548:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:367:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:331:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   security/keys/process_keys.c:626:13: note: Loop condition is false.  Exi=
ting loop
           ctx.cred =3D get_current_cred();
                      ^
   include/linux/cred.h:330:12: note: expanded from macro 'get_current_cred'
           (get_cred(current_cred()))
                     ^
   include/linux/cred.h:298:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:548:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:367:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:331:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   security/keys/process_keys.c:629:2: note: Control jumps to 'case -5:'  a=
t line 703
           switch (id) {
           ^
   security/keys/process_keys.c:704:9: note: Calling 'look_up_user_keyrings'
                   ret =3D look_up_user_keyrings(NULL, &key);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/process_keys.c:77:28: note: Left side of '&&' is false
           const struct cred *cred =3D current_cred();
                                     ^
   include/linux/cred.h:298:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:548:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:367:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:331:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   security/keys/process_keys.c:77:28: note: Loop condition is false.  Exit=
ing loop
           const struct cred *cred =3D current_cred();
                                     ^
   include/linux/cred.h:298:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:548:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:367:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:331:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   security/keys/process_keys.c:88:2: note: Taking false branch
           kenter("%u", uid);
           ^
   security/keys/internal.h:34:2: note: expanded from macro 'kenter'
           no_printk(KERN_DEBUG "=3D=3D> %s("FMT")\n", __func__, ##__VA_ARG=
S__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/process_keys.c:91:2: note: Taking true branch
           if (IS_ERR(reg_keyring))
           ^
   security/keys/process_keys.c:92:3: note: Returning without writing to '*=
_user_session_keyring'
                   return PTR_ERR(reg_keyring);
                   ^
   security/keys/process_keys.c:704:9: note: Returning from 'look_up_user_k=
eyrings'
                   ret =3D look_up_user_keyrings(NULL, &key);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/process_keys.c:705:7: note: 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~
   security/keys/process_keys.c:705:3: note: Taking false branch
                   if (ret < 0)
                   ^
   security/keys/process_keys.c:707:13: note: 1st function call argument is=
 an uninitialized value
                   key_ref =3D make_key_ref(key, 1);
                             ^            ~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> arch/arm/mach-omap2/id.c:158:2: warning: Value stored to 'rev' is never =
read [clang-analyzer-deadcode.DeadStores]
           rev =3D (idcode >> 28) & 0x0f;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:158:2: note: Value stored to 'rev' is never read
           rev =3D (idcode >> 28) & 0x0f;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:191:3: warning: Value stored to 'j' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   j =3D i;
                   ^   ~
   arch/arm/mach-omap2/id.c:191:3: note: Value stored to 'j' is never read
                   j =3D i;
                   ^   ~
   arch/arm/mach-omap2/id.c:266:2: warning: Value stored to 'n' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           n +=3D scnprintf(buf + n, sizeof(buf) - n, ")\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:266:2: note: Value stored to 'n' is never read
           n +=3D scnprintf(buf + n, sizeof(buf) - n, ")\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:363:3: warning: Value stored to 'cpu_rev' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   cpu_rev =3D "1.0";
                   ^         ~~~~~
   arch/arm/mach-omap2/id.c:363:3: note: Value stored to 'cpu_rev' is never=
 read
                   cpu_rev =3D "1.0";
                   ^         ~~~~~
   arch/arm/mach-omap2/id.c:773:9: warning: 3rd function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                  ^                    ~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:41: note: Calling 'omap_type'
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                                                  ^~~~~~~~~~~
   arch/arm/mach-omap2/id.c:52:2: note: 'val' initialized to 1792
           static u32 val =3D OMAP2_DEVICETYPE_MASK;
           ^~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:54:2: note: Taking false branch
           if (val < OMAP2_DEVICETYPE_MASK)
           ^
   arch/arm/mach-omap2/id.c:57:2: note: Taking false branch
           if (soc_is_omap24xx()) {
           ^
   arch/arm/mach-omap2/id.c:59:9: note: Taking false branch
           } else if (soc_is_ti81xx()) {
                  ^
   arch/arm/mach-omap2/id.c:61:13: note: Left side of '||' is false
           } else if (soc_is_am33xx() || soc_is_am43xx()) {
                      ^
   arch/arm/mach-omap2/soc.h:174:27: note: expanded from macro 'soc_is_am33=
xx'
   #define soc_is_am33xx()                 0
                                           ^
   arch/arm/mach-omap2/id.c:61:9: note: Taking false branch
           } else if (soc_is_am33xx() || soc_is_am43xx()) {
                  ^
   arch/arm/mach-omap2/id.c:63:9: note: Taking false branch
           } else if (soc_is_omap34xx()) {
                  ^
   arch/arm/mach-omap2/id.c:65:9: note: Taking false branch
           } else if (soc_is_omap44xx()) {
                  ^
   arch/arm/mach-omap2/id.c:67:13: note: Left side of '||' is false
           } else if (soc_is_omap54xx() || soc_is_dra7xx()) {
                      ^
   arch/arm/mach-omap2/soc.h:309:29: note: expanded from macro 'soc_is_omap=
54xx'
   # define soc_is_omap54xx()              is_omap54xx()
                                           ^
   arch/arm/mach-omap2/id.c:67:9: note: Taking false branch
           } else if (soc_is_omap54xx() || soc_is_dra7xx()) {
                  ^
   arch/arm/mach-omap2/id.c:74:3: note: Control jumps to line 81
                   goto out;
                   ^
   arch/arm/mach-omap2/id.c:81:2: note: Returning the value 1792 (loaded fr=
om 'val')
           return val;
           ^~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:41: note: Returning from 'omap_type'
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                                                  ^~~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:9: note: 3rd function call argument is an u=
ninitialized value
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                  ^                    ~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/xfs/scrub/parent.c:197:13: warning: The left operand of '!=3D' is a g=
arbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (nlink !=3D expected_nlink)
                             ^
   fs/xfs/scrub/parent.c:277:7: note: Assuming the condition is true
           if (!S_ISDIR(VFS_I(sc->ip)->i_mode))
                ^
   include/uapi/linux/stat.h:23:21: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:277:2: note: Taking false branch
           if (!S_ISDIR(VFS_I(sc->ip)->i_mode))
           ^
   fs/xfs/scrub/parent.c:281:6: note: Assuming the condition is false
           if (!xfs_verify_dir_ino(mp, sc->ip->i_ino)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:281:2: note: Taking false branch
           if (!xfs_verify_dir_ino(mp, sc->ip->i_ino)) {
           ^
   fs/xfs/scrub/parent.c:298:6: note: Assuming the condition is false
--
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2069:6: note: Assuming the cond=
ition is false
           if (atomic_read(&md->active) =3D=3D 0)
               ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
   #define READ_ONCE(x)                                                    \
                                                                           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2069:2: note: Taking false bran=
ch
           if (atomic_read(&md->active) =3D=3D 0)
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2072:2: note: Control jumps to =
'case 2149084421:'  at line 2073
           switch (cmd) {
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2074:10: note: Calling 'rio_mpo=
rt_maint_rd'
                   return rio_mport_maint_rd(data, (void __user *)arg, 1);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:266:6: note: 'ret' declared wit=
hout an initial value
           int ret, i;
               ^~~
   drivers/rapidio/devices/rio_mport_cdev.c:268:2: note: Taking false branch
           if (unlikely(copy_from_user(&maint_io, arg, sizeof(maint_io))))
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:271:7: note: Assuming the condi=
tion is false
           if ((maint_io.offset % 4) ||
                ^~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:271:6: note: Left side of '||' =
is false
           if ((maint_io.offset % 4) ||
               ^
   drivers/rapidio/devices/rio_mport_cdev.c:272:7: note: Assuming field 'le=
ngth' is not equal to 0
               (maint_io.length =3D=3D 0) || (maint_io.length % 4) ||
                ^~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:271:6: note: Left side of '||' =
is false
           if ((maint_io.offset % 4) ||
               ^
   drivers/rapidio/devices/rio_mport_cdev.c:272:33: note: Assuming the cond=
ition is false
               (maint_io.length =3D=3D 0) || (maint_io.length % 4) ||
                                          ^~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:271:6: note: Left side of '||' =
is false
           if ((maint_io.offset % 4) ||
               ^
   drivers/rapidio/devices/rio_mport_cdev.c:273:6: note: Assuming the condi=
tion is false
               (maint_io.length + maint_io.offset) > RIO_MAINT_SPACE_SZ)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:271:2: note: Taking false branch
           if ((maint_io.offset % 4) ||
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:277:6: note: Assuming 'buffer' =
is not equal to NULL
           if (buffer =3D=3D NULL)
               ^~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:277:2: note: Taking false branch
           if (buffer =3D=3D NULL)
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:282:14: note: Assuming 'i' is >=
=3D 'length'
           for (i =3D 0; i < length; i++) {
                       ^~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:282:2: note: Loop condition is =
false. Execution continues on line 295
           for (i =3D 0; i < length; i++) {
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:295:6: note: Assuming the condi=
tion is true
           if (unlikely(copy_to_user((void __user *)(uintptr_t)maint_io.buf=
fer,
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/rapidio/devices/rio_mport_cdev.c:295:2: note: Taking false branch
           if (unlikely(copy_to_user((void __user *)(uintptr_t)maint_io.buf=
fer,
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:300:2: note: Undefined or garba=
ge value returned to caller
           return ret;
           ^      ~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   4 warnings generated.
>> drivers/bus/omap_l3_noc.c:96:3: warning: Value stored to 'err_descriptio=
n' is never read [clang-analyzer-deadcode.DeadStores]
                   err_description =3D "Standard";
                   ^                 ~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:96:3: note: Value stored to 'err_description' =
is never read
                   err_description =3D "Standard";
                   ^                 ~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:107:3: warning: Value stored to 'err_descripti=
on' is never read [clang-analyzer-deadcode.DeadStores]
                   err_description =3D "Custom";
                   ^                 ~~~~~~~~
   drivers/bus/omap_l3_noc.c:107:3: note: Value stored to 'err_description'=
 is never read
                   err_description =3D "Custom";
                   ^                 ~~~~~~~~
>> drivers/bus/omap_l3_noc.c:127:4: warning: Value stored to 'master_name' =
is never read [clang-analyzer-deadcode.DeadStores]
                           master_name =3D master->name;
                           ^             ~~~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:127:4: note: Value stored to 'master_name' is =
never read
                           master_name =3D master->name;
                           ^             ~~~~~~~~~~~~
>> drivers/bus/omap_l3_noc.c:132:2: warning: Value stored to 'op_code' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           op_code =3D readl_relaxed(l3_targ_hdr) & 0x7;
           ^
   drivers/bus/omap_l3_noc.c:132:2: note: Value stored to 'op_code' is neve=
r read
   2 warnings generated.
   drivers/clk/tegra/clk-tegra-super-gen4.c:141:3: warning: Value stored to=
 'clk' is never read [clang-analyzer-deadcode.DeadStores]
                   clk =3D clk_register_divider(NULL, "hclk_div", "sclk", 0,
                   ^
   drivers/clk/tegra/clk-tegra-super-gen4.c:141:3: note: Value stored to 'c=
lk' is never read
   drivers/clk/tegra/clk-tegra-super-gen4.c:156:2: warning: Value stored to=
 'clk' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_divider(NULL, "pclk_div", "hclk", 0,
           ^
   drivers/clk/tegra/clk-tegra-super-gen4.c:156:2: note: Value stored to 'c=
lk' is never read
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/clk/clk-axi-clkgen.c:406:11: warning: The left operand of '&' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (val2 & MMCM_CLKOUT_NOCOUNT)
                    ^
   drivers/clk/clk-axi-clkgen.c:434:9: note: Calling 'axi_clkgen_get_div'
           dout =3D axi_clkgen_get_div(axi_clkgen, MMCM_REG_CLKOUT0_1,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-axi-clkgen.c:402:21: note: 'val2' declared without an in=
itial value
           unsigned int val1, val2;
                              ^~~~
   drivers/clk/clk-axi-clkgen.c:405:2: note: Calling 'axi_clkgen_mmcm_read'
           axi_clkgen_mmcm_read(axi_clkgen, reg2, &val2);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-axi-clkgen.c:258:6: note: Assuming 'ret' is < 0
           if (ret < 0)
               ^~~~~~~
   drivers/clk/clk-axi-clkgen.c:258:2: note: Taking true branch
           if (ret < 0)
           ^
   drivers/clk/clk-axi-clkgen.c:259:3: note: Returning without writing to '=
*val'
                   return ret;
                   ^
   drivers/clk/clk-axi-clkgen.c:405:2: note: Returning from 'axi_clkgen_mmc=
m_read'
           axi_clkgen_mmcm_read(axi_clkgen, reg2, &val2);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-axi-clkgen.c:406:11: note: The left operand of '&' is a =
garbage value
           if (val2 & MMCM_CLKOUT_NOCOUNT)
               ~~~~ ^
   drivers/clk/clk-axi-clkgen.c:411:14: warning: The left operand of '&' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           div =3D (val1 & 0x3f) + ((val1 >> 6) & 0x3f);
                       ^
   drivers/clk/clk-axi-clkgen.c:434:9: note: Calling 'axi_clkgen_get_div'
           dout =3D axi_clkgen_get_div(axi_clkgen, MMCM_REG_CLKOUT0_1,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-axi-clkgen.c:402:15: note: 'val1' declared without an in=
itial value
           unsigned int val1, val2;
                        ^~~~
   drivers/clk/clk-axi-clkgen.c:406:6: note: Assuming the condition is false
           if (val2 & MMCM_CLKOUT_NOCOUNT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-axi-clkgen.c:406:2: note: Taking false branch
           if (val2 & MMCM_CLKOUT_NOCOUNT)
           ^
   drivers/clk/clk-axi-clkgen.c:409:2: note: Calling 'axi_clkgen_mmcm_read'
           axi_clkgen_mmcm_read(axi_clkgen, reg1, &val1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-axi-clkgen.c:258:6: note: Assuming 'ret' is < 0
           if (ret < 0)
               ^~~~~~~
   drivers/clk/clk-axi-clkgen.c:258:2: note: Taking true branch
           if (ret < 0)
           ^
   drivers/clk/clk-axi-clkgen.c:259:3: note: Returning without writing to '=
*val'
                   return ret;
                   ^
   drivers/clk/clk-axi-clkgen.c:409:2: note: Returning from 'axi_clkgen_mmc=
m_read'
           axi_clkgen_mmcm_read(axi_clkgen, reg1, &val1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-axi-clkgen.c:411:14: note: The left operand of '&' is a =
garbage value
           div =3D (val1 & 0x3f) + ((val1 >> 6) & 0x3f);
                  ~~~~ ^
   drivers/clk/clk-axi-clkgen.c:440:10: warning: The left operand of '&' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (val & MMCM_CLK_DIV_NOCOUNT)
               ~~~ ^
   drivers/clk/clk-axi-clkgen.c:432:2: note: 'val' declared without an init=
ial value
           unsigned int val;
           ^~~~~~~~~~~~~~~~
   drivers/clk/clk-axi-clkgen.c:439:2: note: Calling 'axi_clkgen_mmcm_read'
           axi_clkgen_mmcm_read(axi_clkgen, MMCM_REG_CLK_DIV, &val);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
                           ^
   kernel/rcu/rcutorture.c:1108:4: note: Left side of '||' is false
                           WRITE_ONCE(old_rp->rtort_pipe_count,
                           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:288:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/rcu/rcutorture.c:1108:4: note: Left side of '||' is false
                           WRITE_ONCE(old_rp->rtort_pipe_count,
                           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:288:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/rcu/rcutorture.c:1108:4: note: Left side of '||' is true
                           WRITE_ONCE(old_rp->rtort_pipe_count,
                           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:289:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   kernel/rcu/rcutorture.c:1108:4: note: Taking false branch
                           WRITE_ONCE(old_rp->rtort_pipe_count,
                           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/rcu/rcutorture.c:1108:4: note: Loop condition is false.  Exiting =
loop
                           WRITE_ONCE(old_rp->rtort_pipe_count,
                           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/rcu/rcutorture.c:1108:4: note: Loop condition is false.  Exiting =
loop
                           WRITE_ONCE(old_rp->rtort_pipe_count,
                           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:53:35: note: expanded from macro '__WRITE_O=
NCE'
   #define __WRITE_ONCE(x, val)                                            \
                                                                           ^
   kernel/rcu/rcutorture.c:1108:4: note: Loop condition is false.  Exiting =
loop
                           WRITE_ONCE(old_rp->rtort_pipe_count,
                           ^
   include/asm-generic/rwonce.h:58:33: note: expanded from macro 'WRITE_ONC=
E'
   #define WRITE_ONCE(x, val)                                              \
                                                                           ^
   kernel/rcu/rcutorture.c:1110:43: note: Division by zero
                           switch (synctype[torture_random(&rand) % nsyncty=
pes]) {
                                            ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~=
~~~
   kernel/rcu/rcutorture.c:2434:4: warning: Value stored to 'errexit' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           errexit =3D true;
                           ^         ~~~~
   kernel/rcu/rcutorture.c:2434:4: note: Value stored to 'errexit' is never=
 read
                           errexit =3D true;
                           ^         ~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> arch/arm/mach-imx/tzic.c:160:2: warning: Value stored to 'i' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           i =3D imx_readl(tzic_base + TZIC_INTCNTL);
           ^
   arch/arm/mach-imx/tzic.c:160:2: note: Value stored to 'i' is never read
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   lib/oid_registry.c:125:3: warning: Value stored to 'num' is never read [=
clang-analyzer-deadcode.DeadStores]
                   num =3D 0;
                   ^     ~
   lib/oid_registry.c:125:3: note: Value stored to 'num' is never read
                   num =3D 0;
                   ^     ~
   11 warnings generated.
   Suppressed 11 warnings (11 with check filters).
   3 warnings generated.
   drivers/clk/clk-si5341.c:667:2: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
           err =3D si5341_encode_44_32(synth->data->regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5341.c:667:2: note: Value stored to 'err' is never read
           err =3D si5341_encode_44_32(synth->data->regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5341.c:827:23: warning: Division by zero [clang-analyz=
er-core.DivideZero]
                   rate =3D *parent_rate / (r << 1);
                          ~~~~~~~~~~~~~^~~~~~~~~~
   drivers/clk/clk-si5341.c:812:6: note: Assuming 'r' is 0
           if (r && !(r % rate))
               ^
   drivers/clk/clk-si5341.c:812:8: note: Left side of '&&' is false
           if (r && !(r % rate))
                 ^
   drivers/clk/clk-si5341.c:815:6: note: Assuming the condition is false
           if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5341.c:815:2: note: Taking false branch
           if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
           ^
   drivers/clk/clk-si5341.c:827:23: note: Division by zero
                   rate =3D *parent_rate / (r << 1);
                          ~~~~~~~~~~~~~^~~~~~~~~~
   drivers/clk/clk-si5341.c:861:2: warning: Value stored to 'err' is never =
read [clang-analyzer-deadcode.DeadStores]
           err =3D regmap_bulk_write(output->data->regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-si5341.c:861:2: note: Value stored to 'err' is never read
           err =3D regmap_bulk_write(output->data->regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   include/linux/math64.h:91:15: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:240:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                                         ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:230:6: note: Assuming field 'fla=
gs' is not equal to 0
           if (c->flags =3D=3D 0) {
               ^~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:230:2: note: Taking false branch
           if (c->flags =3D=3D 0) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:236:6: note: Assuming 'parent_ra=
te' is equal to field 'parent_rate'
           if (parent_rate !=3D c->parent_rate) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:236:2: note: Taking false branch
           if (parent_rate !=3D c->parent_rate) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:247:6: note: Assuming 'target_ra=
te' is not equal to 'parent_rate'
           if (target_rate =3D=3D parent_rate) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:247:2: note: Taking false branch
           if (target_rate =3D=3D parent_rate) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:255:9: note: Calling '__wrpll_ca=
lc_divq'
           divq =3D __wrpll_calc_divq(target_rate, &target_vco_rate);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:149:7: note: 'vco_rate' is non-n=
ull
           if (!vco_rate) {
                ^~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:149:2: note: Taking false branch
           if (!vco_rate) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:155:6: note: Assuming 's' is <=
=3D 1
           if (s <=3D 1) {
               ^~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:155:2: note: Taking true branch
           if (s <=3D 1) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:167:2: note: Returning the value=
 1 (loaded from 'divq'), which participates in a condition later
           return divq;
           ^~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:255:9: note: Returning from '__w=
rpll_calc_divq'
           divq =3D __wrpll_calc_divq(target_rate, &target_vco_rate);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:256:7: note: 'divq' is 1
           if (!divq)
                ^~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:256:2: note: Taking false branch
           if (!divq)
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:264:2: note: The value 0 is assi=
gned to 'best_r'
           best_r =3D 0;
--
           ^     ~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/video/fbdev/savage/savagefb-i2c.c:139:3: warning: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecur=
eAPI.strcpy]
                   strcpy(chan->adapter.name, name);
                   ^~~~~~
   drivers/video/fbdev/savage/savagefb-i2c.c:139:3: note: Call to function =
'strcpy' is insecure as it does not provide bounding of the memory buffer. =
Replace unbounded copy functions with analogous functions that support leng=
th arguments such as 'strlcpy'. CWE-119
                   strcpy(chan->adapter.name, name);
                   ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/endpoint/pci-epc-mem.c:29:7: warning: Assigned value is garb=
age or undefined [clang-analyzer-core.uninitialized.Assign]
           size >>=3D page_shift;
                ^
   drivers/pci/endpoint/pci-epc-mem.c:244:7: note: 'mem' is non-null
           if (!mem) {
                ^~~
   drivers/pci/endpoint/pci-epc-mem.c:244:2: note: Taking false branch
           if (!mem) {
           ^
   drivers/pci/endpoint/pci-epc-mem.c:250:15: note: '?' condition is false
           page_shift =3D ilog2(page_size);
                        ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:250:15: note: '?' condition is true
           page_shift =3D ilog2(page_size);
                        ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:254:10: note: Calling 'pci_epc_mem_ge=
t_order'
           order =3D pci_epc_mem_get_order(mem, size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: '?' condition is false
           unsigned int page_shift =3D ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: '?' condition is true
           unsigned int page_shift =3D ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: Calling '__ilog2_u32'
           unsigned int page_shift =3D ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:26:28: note: Returning from '__ilog2_=
u32'
           unsigned int page_shift =3D ilog2(mem->window.page_size);
                                     ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:26:2: note: 'page_shift' initialized =
to 4294967295
           unsigned int page_shift =3D ilog2(mem->window.page_size);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epc-mem.c:29:7: note: Assigned value is garbage=
 or undefined
           size >>=3D page_shift;
                ^   ~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pinctrl/pinctrl-st.c:582:4: warning: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage [clang-analyzer-core.uninitialized.Assign]
                           ST_PINCONF_PACK_OE(*config);
                           ^
   drivers/pinctrl/pinctrl-st.c:138:34: note: expanded from macro 'ST_PINCO=
NF_PACK_OE'
   #define ST_PINCONF_PACK_OE(conf)        ST_PINCONF_PACK(conf, 1, OE)
                                           ^
   drivers/pinctrl/pinctrl-st.c:129:49: note: expanded from macro 'ST_PINCO=
NF_PACK'
   #define ST_PINCONF_PACK(conf, val, param)       (conf |=3D\
                                                         ^
   drivers/pinctrl/pinctrl-st.c:1013:6: note: 'function' is 0
           if (function)
               ^~~~~~~~
   drivers/pinctrl/pinctrl-st.c:1013:2: note: Taking false branch
           if (function)
           ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Left side of '&&' is false
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Taking false branch
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Loop condition is false.  Ex=
iting loop
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pinctrl/pinctrl-st.c:1018:7: note: Calling 'st_gpio_get_directio=
n'
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:739:2: note: 'config' declared without an i=
nitial value
           unsigned long config;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:746:13: note: Calling 'st_pctl_get_pin_func=
tion'
           function =3D st_pctl_get_pin_function(&pc, offset);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:440:6: note: Assuming 'alt' is non-null
           if (!alt)
               ^~~~
   drivers/pinctrl/pinctrl-st.c:440:2: note: Taking false branch
           if (!alt)
           ^
   drivers/pinctrl/pinctrl-st.c:445:2: note: Returning without writing to '=
pc->oe', which participates in a condition later
           return (val >> offset) & 0xf;
           ^
   drivers/pinctrl/pinctrl-st.c:746:13: note: Returning from 'st_pctl_get_p=
in_function'
           function =3D st_pctl_get_pin_function(&pc, offset);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:747:6: note: Assuming 'function' is not equ=
al to 0
           if (function) {
               ^~~~~~~~
   drivers/pinctrl/pinctrl-st.c:747:2: note: Taking true branch
           if (function) {
           ^
   drivers/pinctrl/pinctrl-st.c:748:3: note: Calling 'st_pinconf_get_direct=
ion'
                   st_pinconf_get_direction(&pc, offset, &config);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:579:6: note: Assuming field 'oe' is non-null
           if (pc->oe) {
               ^~~~~~
   drivers/pinctrl/pinctrl-st.c:579:2: note: Taking true branch
           if (pc->oe) {
--
   16 warnings generated.
   fs/nilfs2/btree.c:377:2: warning: Value stored to 'flags' is never read =
[clang-analyzer-deadcode.DeadStores]
           flags =3D nilfs_btree_node_get_flags(node);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:377:2: note: Value stored to 'flags' is never read
           flags =3D nilfs_btree_node_get_flags(node);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:1430:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/nilfs2/btree.c:1430:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   fs/nilfs2/btree.c:2332:7: warning: 1st function call argument is an unin=
itialized value [clang-analyzer-core.CallAndMessage]
           if (!buffer_dirty(bh))
                ^            ~~
   fs/nilfs2/btree.c:2312:2: note: 'bh' declared without an initial value
           struct buffer_head *bh;
           ^~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:2318:6: note: Assuming 'path' is not equal to NULL
           if (path =3D=3D NULL)
               ^~~~~~~~~~~~
   fs/nilfs2/btree.c:2318:2: note: Taking false branch
           if (path =3D=3D NULL)
           ^
   fs/nilfs2/btree.c:2322:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   fs/nilfs2/btree.c:2322:2: note: Taking false branch
           if (ret < 0) {
           ^
   fs/nilfs2/btree.c:2326:8: note: Calling 'nilfs_btree_get_block'
           ret =3D nilfs_btree_get_block(btree, ptr, &bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:532:9: note: Calling '__nilfs_btree_get_block'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:480:6: note: Assuming 'ret' is not equal to 0
           if (ret) {
               ^~~
   fs/nilfs2/btree.c:480:2: note: Taking true branch
           if (ret) {
           ^
   fs/nilfs2/btree.c:481:7: note: Assuming the condition is true
                   if (ret !=3D -EEXIST)
                       ^~~~~~~~~~~~~~
   fs/nilfs2/btree.c:481:3: note: Taking true branch
                   if (ret !=3D -EEXIST)
                   ^
   fs/nilfs2/btree.c:482:4: note: Returning without writing to '*bhp'
                           return ret;
                           ^
   fs/nilfs2/btree.c:532:9: note: Returning from '__nilfs_btree_get_block'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:532:2: note: Returning without writing to '*bhp'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
           ^
   fs/nilfs2/btree.c:2326:8: note: Returning from 'nilfs_btree_get_block'
           ret =3D nilfs_btree_get_block(btree, ptr, &bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:2327:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   fs/nilfs2/btree.c:2327:2: note: Taking false branch
           if (ret < 0) {
           ^
   fs/nilfs2/btree.c:2332:7: note: 1st function call argument is an uniniti=
alized value
           if (!buffer_dirty(bh))
                ^            ~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/controller/pci-v3-semi.c:604:6: warning: Value stored to 'pc=
i_end' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-v3-semi.c:604:6: note: Value stored to 'pci_e=
nd' during its initialization is never read
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/controller/pci-versatile.c:37:10: warning: Although the valu=
e stored to 'retval' is used in the enclosing expression, the value is neve=
r actually read from 'retval' [clang-analyzer-deadcode.DeadStores]
           while ((retval =3D get_option(&str, &slot))) {
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-versatile.c:37:10: note: Although the value s=
tored to 'retval' is used in the enclosing expression, the value is never a=
ctually read from 'retval'
           while ((retval =3D get_option(&str, &slot))) {
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/pci/controller/pcie-iproc.c:861:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:861:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:1065:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:1065:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1955:41: warnin=
g: Assigned value is garbage or undefined [clang-analyzer-core.uninitialize=
d.Assign]
                   single_dpm_table->dpm_levels[i].value =3D clk;
                                                         ^ ~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1934:2: note: '=
clk' declared without an initial value
           uint32_t clk;
           ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1937:8: note: C=
alling 'smu_v11_0_get_dpm_level_count'
           ret =3D smu_v11_0_get_dpm_level_count(smu,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1923:9: note: C=
alling 'smu_v11_0_get_dpm_freq_by_index'
           return smu_v11_0_get_dpm_freq_by_index(smu,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1889:6: note: A=
ssuming 'value' is non-null, which participates in a condition later
           if (!value)
               ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1889:2: note: T=
aking false branch
           if (!value)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1892:6: note: A=
ssuming the condition is true
           if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1892:2: note: T=
aking true branch
           if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1893:3: note: R=
eturning zero, which participates in a condition later
                   return 0;
                   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1923:9: note: R=
eturning from 'smu_v11_0_get_dpm_freq_by_index'
           return smu_v11_0_get_dpm_freq_by_index(smu,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1923:2: note: R=
eturning zero, which participates in a condition later
           return smu_v11_0_get_dpm_freq_by_index(smu,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1937:8: note: R=
eturning from 'smu_v11_0_get_dpm_level_count'
           ret =3D smu_v11_0_get_dpm_level_count(smu,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1940:6: note: '=
ret' is 0
           if (ret) {
               ^~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1940:2: note: T=
aking false branch
           if (ret) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1945:14: note: =
Assuming 'i' is < field 'count'
           for (i =3D 0; i < single_dpm_table->count; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1945:2: note: L=
oop condition is true.  Entering loop body
           for (i =3D 0; i < single_dpm_table->count; i++) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1946:9: note: C=
alling 'smu_v11_0_get_dpm_freq_by_index'
                   ret =3D smu_v11_0_get_dpm_freq_by_index(smu,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1889:7: note: '=
value' is non-null
           if (!value)
                ^~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1889:2: note: T=
aking false branch
           if (!value)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1892:6: note: A=
ssuming the condition is true
           if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1892:2: note: T=
aking true branch
           if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1893:3: note: R=
eturning without writing to '*value'
                   return 0;
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1893:3: note: R=
eturning zero, which participates in a condition later
                   return 0;
                   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1946:9: note: R=
eturning from 'smu_v11_0_get_dpm_freq_by_index'
                   ret =3D smu_v11_0_get_dpm_freq_by_index(smu,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1950:7: note: '=
ret' is 0
                   if (ret) {
                       ^~~
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1950:3: note: T=
aking false branch
                   if (ret) {
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/smu_v11_0.c:1955:41: note: =
Assigned value is garbage or undefined
                   single_dpm_table->dpm_levels[i].value =3D clk;
                                                         ^ ~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   drivers/gpu/drm/drm_ioctl.c:389:6: note: Assuming the condition is true
           if (sv->drm_di_major !=3D -1) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:389:2: note: Taking true branch
           if (sv->drm_di_major !=3D -1) {
           ^
   drivers/gpu/drm/drm_ioctl.c:390:7: note: Assuming field 'drm_di_major' i=
s equal to DRM_IF_MAJOR
                   if (sv->drm_di_major !=3D DRM_IF_MAJOR ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:390:7: note: Left side of '||' is false
   drivers/gpu/drm/drm_ioctl.c:391:7: note: Assuming field 'drm_di_minor' i=
s >=3D 0
                       sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MI=
NOR) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:390:7: note: Left side of '||' is false
                   if (sv->drm_di_major !=3D DRM_IF_MAJOR ||
                       ^
   drivers/gpu/drm/drm_ioctl.c:391:31: note: Assuming field 'drm_di_minor' =
is <=3D DRM_IF_MINOR
                       sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MI=
NOR) {
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/drm_ioctl.c:390:3: note: Taking false branch
                   if (sv->drm_di_major !=3D DRM_IF_MAJOR ||
                   ^
   drivers/gpu/drm/drm_ioctl.c:397:21: note: Assuming '__UNIQUE_ID___x267' =
is <=3D '__UNIQUE_ID___y268'
                   dev->if_version =3D max(if_version, dev->if_version);
                                     ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:397:21: note: '?' condition is false
                   dev->if_version =3D max(if_version, dev->if_version);
                                     ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/drm_ioctl.c:398:7: note: Assuming field 'drm_di_minor' i=
s >=3D 1
                   if (sv->drm_di_minor >=3D 1) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:398:3: note: Taking true branch
                   if (sv->drm_di_minor >=3D 1) {
                   ^
   drivers/gpu/drm/drm_ioctl.c:403:14: note: Calling 'drm_set_busid'
                           retcode =3D drm_set_busid(dev, file_priv);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:150:6: note: Assuming field 'unique' is equa=
l to NULL
           if (master->unique !=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:150:2: note: Taking false branch
           if (master->unique !=3D NULL)
           ^
   drivers/gpu/drm/drm_ioctl.c:153:6: note: Assuming field 'dev' is null
           if (dev->dev && dev_is_pci(dev->dev)) {
               ^~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:153:15: note: Left side of '&&' is false
           if (dev->dev && dev_is_pci(dev->dev)) {
                        ^
   drivers/gpu/drm/drm_ioctl.c:160:11: note: Assuming field 'unique' is null
                   WARN_ON(!dev->unique);
                           ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:162:7: note: Assuming field 'unique' is non-=
null
                   if (master->unique)
                       ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:162:3: note: Taking true branch
                   if (master->unique)
                   ^
   drivers/gpu/drm/drm_ioctl.c:163:25: note: Null pointer passed as 1st arg=
ument to string length function
                           master->unique_len =3D strlen(dev->unique);
                                                ^      ~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/pinctrl/aspeed/pinctrl-aspeed.c:183:4: warning: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureA=
PI.strcpy]
                           strcat(found, str);
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:183:4: note: Call to function 's=
trcat' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcat'. CWE-119
                           strcat(found, str);
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:184:4: warning: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureA=
PI.strcpy]
                           strcat(found, ", ");
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:184:4: note: Call to function 's=
trcat' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcat'. CWE-119
                           strcat(found, ", ");
                           ^~~~~~
   1 warning generated.
>> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2660:5: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D regmap_update_bits(ctx->maps[des=
c->ip],
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2660:5: note: Value stored to=
 'ret' is never read
                                   ret =3D regmap_update_bits(ctx->maps[des=
c->ip],
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   fs/jfs/jfs_types.h:61:33: warning: The left operand of '&' is a garbage =
value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(~0xffffff)) |
                                          ^
   fs/jfs/xattr.c:957:2: note: Taking false branch
           if (is_known_namespace(name))
           ^
   fs/jfs/xattr.c:959:9: note: Calling '__jfs_xattr_set'
           return __jfs_xattr_set(inode, name, value, size, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:917:7: note: Calling '__jfs_setxattr'
           rc =3D __jfs_setxattr(tid, inode, name, value, size, flags);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:671:15: note: Calling 'ea_get'
           xattr_size =3D ea_get(inode, &ea_buf, 0);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:438:6: note: Assuming field 'flag' is not equal to 0
           if (ji->ea.flag =3D=3D 0)
               ^~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:438:2: note: Taking false branch
           if (ji->ea.flag =3D=3D 0)
           ^
   fs/jfs/xattr.c:441:6: note: Assuming 'ea_size' is equal to 0
           if (ea_size =3D=3D 0) {
               ^~~~~~~~~~~~
   fs/jfs/xattr.c:441:2: note: Taking true branch
           if (ea_size =3D=3D 0) {
           ^
   fs/jfs/xattr.c:442:7: note: 'min_size' is equal to 0
                   if (min_size =3D=3D 0) {
                       ^~~~~~~~
   fs/jfs/xattr.c:442:3: note: Taking true branch
                   if (min_size =3D=3D 0) {
                   ^
   fs/jfs/xattr.c:446:4: note: Returning without writing to 'ea_buf->new_ea=
.loc.len_addr'
                           return 0;
                           ^
   fs/jfs/xattr.c:671:15: note: Returning from 'ea_get'
           xattr_size =3D ea_get(inode, &ea_buf, 0);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:672:6: note: 'xattr_size' is >=3D 0
           if (xattr_size < 0) {
               ^~~~~~~~~~
   fs/jfs/xattr.c:672:2: note: Taking false branch
           if (xattr_size < 0) {
           ^
   fs/jfs/xattr.c:681:6: note: 'xattr_size' is 0
           if (xattr_size) {
               ^~~~~~~~~~
   fs/jfs/xattr.c:681:2: note: Taking false branch
           if (xattr_size) {
           ^
   fs/jfs/xattr.c:699:7: note: 'found' is 0
           if (!found) {
                ^~~~~
   fs/jfs/xattr.c:699:2: note: Taking true branch
           if (!found) {
           ^
   fs/jfs/xattr.c:700:7: note: Assuming the condition is false
                   if (flags & XATTR_REPLACE) {
                       ^~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:700:3: note: Taking false branch
                   if (flags & XATTR_REPLACE) {
                   ^
   fs/jfs/xattr.c:704:7: note: Assuming 'value' is not equal to NULL
                   if (value =3D=3D NULL) {
                       ^~~~~~~~~~~~~
   fs/jfs/xattr.c:704:3: note: Taking false branch
                   if (value =3D=3D NULL) {
                   ^
   fs/jfs/xattr.c:709:6: note: 'value' is non-null
           if (value)
               ^~~~~
   fs/jfs/xattr.c:709:2: note: Taking true branch
           if (value)
           ^
   fs/jfs/xattr.c:712:6: note: Assuming 'new_size' is > field 'max_size'
           if (new_size > ea_buf.max_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:712:2: note: Taking true branch
           if (new_size > ea_buf.max_size) {
           ^
   fs/jfs/xattr.c:717:3: note: Calling 'ea_release'
                   ea_release(inode, &ea_buf);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/xattr.c:580:2: note: Taking false branch
           if (ea_buf->flag & EA_MALLOC)
           ^
   fs/jfs/xattr.c:582:7: note: Taking false branch
           else if (ea_buf->flag & EA_EXTENT) {
                ^
   fs/jfs/xattr.c:590:1: note: Returning without writing to 'ea_buf->new_ea=
.loc.len_addr'
--
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/setup-bus.c:459:2: note: Taking false branch
           list_for_each_entry(dev_res, head, list)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pci/setup-bus.c:459:2: note: Loop condition is false.  Exiting l=
oop
           list_for_each_entry(dev_res, head, list)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/setup-bus.c:459:2: note: Loop condition is true.  Entering l=
oop body
           list_for_each_entry(dev_res, head, list)
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/setup-bus.c:460:7: note: Use of memory after it is freed
                   if (dev_res->res->parent)
                       ^~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/clk/tegra/clk-tegra114.c:910:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:910:2: note: Value stored to 'clk' is n=
ever read
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: note: Value stored to 'clk' is n=
ever read
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: note: Value stored to 'clk' is n=
ever read
           clk =3D clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:1049:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
           ^
   drivers/clk/tegra/clk-tegra114.c:1049:2: note: Value stored to 'clk' is =
never read
   2 warnings generated.
>> drivers/clk/tegra/clk-tegra124.c:1098:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1098:2: note: Value stored to 'clk' is =
never read
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: note: Value stored to 'clk' is =
never read
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/ext4/move_extent.c:635:5: warning: Value stored to 'o_start' is never=
 read [clang-analyzer-deadcode.DeadStores]
                                   o_start =3D o_end;
                                   ^         ~~~~~
   fs/ext4/move_extent.c:635:5: note: Value stored to 'o_start' is never re=
ad
                                   o_start =3D o_end;
                                   ^         ~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   fs/ext4/namei.c:398:46: warning: Access to field 'b_data' results in a d=
ereference of a null pointer (loaded from variable 'bh') [clang-analyzer-co=
re.NullDereference]
           t->det_checksum =3D ext4_dirblock_csum(inode, bh->b_data,
                                                       ^
   fs/ext4/namei.c:3724:6: note: Assuming field 'inode' is null
           if (new.inode && new.inode->i_nlink =3D=3D 0) {
               ^~~~~~~~~
   fs/ext4/namei.c:3724:16: note: Left side of '&&' is false
           if (new.inode && new.inode->i_nlink =3D=3D 0) {
                         ^
   fs/ext4/namei.c:3730:7: note: Assuming the condition is false
           if ((ext4_test_inode_flag(new_dir, EXT4_INODE_PROJINHERIT)) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/namei.c:3730:62: note: Left side of '&&' is false
           if ((ext4_test_inode_flag(new_dir, EXT4_INODE_PROJINHERIT)) &&
                                                                       ^
   fs/ext4/namei.c:3736:6: note: 'retval' is 0
           if (retval)
               ^~~~~~
   fs/ext4/namei.c:3736:2: note: Taking false branch
           if (retval)
           ^
   fs/ext4/namei.c:3739:6: note: 'retval' is 0
           if (retval)
               ^~~~~~
   fs/ext4/namei.c:3739:2: note: Taking false branch
           if (retval)
           ^
   fs/ext4/namei.c:3744:10: note: Field 'inode' is null
           if (new.inode) {
                   ^
   fs/ext4/namei.c:3744:2: note: Taking false branch
           if (new.inode) {
           ^
   fs/ext4/namei.c:3751:2: note: Taking false branch
           if (IS_ERR(old.bh))
           ^
   fs/ext4/namei.c:3760:6: note: Assuming field 'bh' is non-null
           if (!old.bh || le32_to_cpu(old.de->inode) !=3D old.inode->i_ino)
               ^~~~~~~
   fs/ext4/namei.c:3760:6: note: Left side of '||' is false
   fs/ext4/namei.c:3760:17: note: Assuming field 'inode' is equal to field =
'i_ino'
           if (!old.bh || le32_to_cpu(old.de->inode) !=3D old.inode->i_ino)
                          ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   fs/ext4/namei.c:3760:2: note: Taking false branch
           if (!old.bh || le32_to_cpu(old.de->inode) !=3D old.inode->i_ino)
           ^
   fs/ext4/namei.c:3765:2: note: Taking false branch
           if (IS_ERR(new.bh)) {
           ^
   fs/ext4/namei.c:3770:10: note: Field 'bh' is null
           if (new.bh) {
                   ^
   fs/ext4/namei.c:3770:2: note: Taking false branch
           if (new.bh) {
           ^
--
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:798:15: note: Returning from 'kzalloc'
           pcie_table =3D kzalloc(struct_size(pcie_table, entries, atom_pci=
e_table->ucNumEntries),
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:800:6: note: Assuming 'pcie_table' is non-null
           if (!pcie_table)
               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:800:2: note: Taking false branch
           if (!pcie_table)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:803:15: note: Access to field 'count' results in a dereference of a null =
pointer (loaded from field 'vdd_dep_on_sclk')
           pcie_count =3D table_info->vdd_dep_on_sclk->count;
                        ^           ~~~~~~~~~~~~~~~
   Suppressed 15 warnings (14 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   mm/shmem.c:1087:24: warning: Value stored to 'sbinfo' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct shmem_sb_info *sbinfo =3D SHMEM_SB(inode->i_sb);
                                 ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1087:24: note: Value stored to 'sbinfo' during its initializa=
tion is never read
           struct shmem_sb_info *sbinfo =3D SHMEM_SB(inode->i_sb);
                                 ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1542:29: warning: The result of the left shift is undefined b=
ecause the right operand is negative [clang-analyzer-core.UndefinedBinaryOp=
eratorResult]
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:24: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                          ^
   include/linux/math.h:34:50: note: expanded from macro 'round_down'
   #define round_down(x, y) ((x) & ~__round_mask(x, y))
                                    ~~~~~~~~~~~~~~~~^~
   include/linux/math.h:14:46: note: expanded from macro '__round_mask'
   #define __round_mask(x, y) ((__typeof__(x))((y)-1))
                                                ^
   mm/shmem.c:1542:29: note: Taking true branch
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:26: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                            ^
   include/linux/huge_mm.h:106:26: note: expanded from macro 'HPAGE_PMD_ORD=
ER'
   #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                            ^
   include/linux/huge_mm.h:325:28: note: expanded from macro 'HPAGE_PMD_SHI=
FT'
   #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                              ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/shmem.c:1542:29: note: Loop condition is false.  Exiting loop
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:26: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                            ^
   include/linux/huge_mm.h:106:26: note: expanded from macro 'HPAGE_PMD_ORD=
ER'
   #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                            ^
   include/linux/huge_mm.h:325:28: note: expanded from macro 'HPAGE_PMD_SHI=
FT'
   #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                              ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/shmem.c:1542:29: note: The result of the left shift is undefined beca=
use the right operand is negative
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:24: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                          ^
   include/linux/math.h:34:50: note: expanded from macro 'round_down'
   #define round_down(x, y) ((x) & ~__round_mask(x, y))
                                    ~~~~~~~~~~~~~~~~^~
   include/linux/math.h:14:46: note: expanded from macro '__round_mask'
   #define __round_mask(x, y) ((__typeof__(x))((y)-1))
                                                ^
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/ti/clockdomain.c:115:2: warning: Value stored to 'clk_name' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk_name =3D __clk_get_name(hw->clk);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clockdomain.c:115:2: note: Value stored to 'clk_name' is =
never read
           clk_name =3D __clk_get_name(hw->clk);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/clk/ti/divider.c:240:9: warning: Division by zero [clang-analyze=
r-core.DivideZero]
           return DIV_ROUND_UP(*prate, div);
                  ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/ti/divider.c:238:8: note: Calling 'ti_clk_divider_bestdiv'
           div =3D ti_clk_divider_bestdiv(hw, rate, prate);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/divider.c:179:37: note: Left side of '&&' is false
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/ti/divider.c:179:37: note: Taking false branch
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/clk/ti/divider.c:179:37: note: Loop condition is false.  Exiting=
 loop
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/clk/ti/divider.c:184:6: note: Assuming 'rate' is not equal to 0
           if (!rate)
               ^~~~~
   drivers/clk/ti/divider.c:184:2: note: Taking false branch
           if (!rate)
           ^
   drivers/clk/ti/divider.c:189:6: note: Assuming the condition is false
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/divider.c:189:2: note: Taking false branch
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
           ^
   drivers/clk/ti/divider.c:201:11: note: Assuming '__UNIQUE_ID___x112' is =
>=3D '__UNIQUE_ID___y113'
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/clk/ti/divider.c:201:11: note: '?' condition is false
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
--
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   crypto/tcrypt.c:292:2: warning: Value stored to 'ret' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           ret =3D crypto_aead_setauthsize(tfm, authsize);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/tcrypt.c:292:2: note: Value stored to 'ret' is never read
           ret =3D crypto_aead_setauthsize(tfm, authsize);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/tcrypt.c:614:4: warning: Value stored to 'ret' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                           ret =3D crypto_aead_setkey(tfm, key, *keysize);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/tcrypt.c:614:4: note: Value stored to 'ret' is never read
                           ret =3D crypto_aead_setkey(tfm, key, *keysize);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:68:3: warning: Call to f=
unction 'strcpy' is insecure as it does not provide bounding of the memory =
buffer. Replace unbounded copy functions with analogous functions that supp=
ort length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.in=
secureAPI.strcpy]
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:68:3: note: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:71:3: warning: Call to f=
unction 'strcpy' is insecure as it does not provide bounding of the memory =
buffer. Replace unbounded copy functions with analogous functions that supp=
ort length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.in=
secureAPI.strcpy]
                   strcpy(dst, src);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:71:3: note: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, src);
                   ^~~~~~
   18 warnings generated.
   Suppressed 18 warnings (12 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (14 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   kernel/resource.c:80:2: warning: The expression is an uninitialized valu=
e. The computed value will also be garbage [clang-analyzer-core.uninitializ=
ed.Assign]
           (*pos)++;
           ^
   kernel/resource.c:1614:2: note: 'l' declared without an initial value
           loff_t l;
           ^~~~~~~~
   kernel/resource.c:1617:2: note: Loop condition is true.  Entering loop b=
ody
           for (p =3D p->child; p ; p =3D r_next(NULL, p, &l)) {
           ^
   kernel/resource.c:1622:7: note: Assuming the condition is true
                   if (p->start >=3D addr + size)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/resource.c:1622:3: note: Taking true branch
                   if (p->start >=3D addr + size)
                   ^
   kernel/resource.c:1623:4: note:  Execution continues on line 1617
                           continue;
                           ^
   kernel/resource.c:1617:29: note: Calling 'r_next'
           for (p =3D p->child; p ; p =3D r_next(NULL, p, &l)) {
                                      ^~~~~~~~~~~~~~~~~~~
   kernel/resource.c:80:2: note: The expression is an uninitialized value. =
The computed value will also be garbage
           (*pos)++;
           ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (12 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/clk/spear/spear1310_clock.c:872:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_30m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:872:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_30m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:879:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_48m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:879:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_48m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:896:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spear/spear1310_clock.c:896:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spear/spear1310_clock.c:899:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, 0, 5=
0000000);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/clk/spear/spear1310_clock.c:899:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, 0, 5=
0000000);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 1 warnings (1 with check filters).
   14 warnings generated.
   include/drm/drm_crtc.h:1235:9: warning: Access to field 'index' results =
in a dereference of a null pointer (loaded from variable 'crtc') [clang-ana=
lyzer-core.NullDereference]
           return crtc->index;
                  ^
   drivers/gpu/drm/msm/msm_atomic.c:208:2: note: 'async_crtc' initialized t=
o a null pointer value
           struct drm_crtc *async_crtc =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:210:15: note: Assuming field 'vsync_tim=
e' is non-null
           bool async =3D kms->funcs->vsync_time &&
                        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:210:15: note: Left side of '&&' is true
   drivers/gpu/drm/msm/msm_atomic.c:211:4: note: Calling 'can_do_async'
                           can_do_async(state, &async_crtc);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:169:8: note: Assuming field 'legacy_cur=
sor_update' is true
           if (!(state->legacy_cursor_update || state->async_update))
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:169:36: note: Left side of '||' is true
           if (!(state->legacy_cursor_update || state->async_update))
                                             ^
   drivers/gpu/drm/msm/msm_atomic.c:169:2: note: Taking false branch
           if (!(state->legacy_cursor_update || state->async_update))
           ^
   drivers/gpu/drm/msm/msm_atomic.c:173:2: note: Assuming 'i' is >=3D field=
 'num_connector'
           for_each_new_connector_in_state(state, connector, connector_stat=
e, i)
           ^
   include/drm/drm_atomic.h:757:7: note: expanded from macro 'for_each_new_=
connector_in_state'
                (__i) < (__state)->num_connector;                          =
        \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:173:2: note: Loop condition is false. E=
xecution continues on line 176
           for_each_new_connector_in_state(state, connector, connector_stat=
e, i)
           ^
   include/drm/drm_atomic.h:756:2: note: expanded from macro 'for_each_new_=
connector_in_state'
           for ((__i) =3D 0;                                               =
          \
           ^
   drivers/gpu/drm/msm/msm_atomic.c:176:2: note: Assuming 'i' is >=3D field=
 'num_crtc'
           for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
           ^
   include/drm/drm_atomic.h:822:7: note: expanded from macro 'for_each_new_=
crtc_in_state'
                (__i) < (__state)->dev->mode_config.num_crtc;              \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:176:2: note: Loop condition is false. E=
xecution continues on line 184
           for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
           ^
   include/drm/drm_atomic.h:821:2: note: expanded from macro 'for_each_new_=
crtc_in_state'
           for ((__i) =3D 0;                                               =
  \
           ^
   drivers/gpu/drm/msm/msm_atomic.c:184:2: note: Returning without writing =
to '*async_crtc'
           return true;
           ^
   drivers/gpu/drm/msm/msm_atomic.c:211:4: note: Returning from 'can_do_asy=
nc'
                           can_do_async(state, &async_crtc);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:239:6: note: 'async' is true
           if (async) {
               ^~~~~
   drivers/gpu/drm/msm/msm_atomic.c:239:2: note: Taking true branch
           if (async) {
           ^
   drivers/gpu/drm/msm/msm_atomic.c:241:40: note: Passing null pointer valu=
e via 1st parameter 'crtc'
                           &kms->pending_timers[drm_crtc_index(async_crtc)];
                                                               ^~~~~~~~~~
   drivers/gpu/drm/msm/msm_atomic.c:241:25: note: Calling 'drm_crtc_index'
                           &kms->pending_timers[drm_crtc_index(async_crtc)];
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_crtc.h:1235:9: note: Access to field 'index' results in =
a dereference of a null pointer (loaded from variable 'crtc')
           return crtc->index;
                  ^~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   fs/xfs/libxfs/xfs_dir2_node.c:873:43: warning: Access to field 'b_addr' =
results in a dereference of a null pointer (loaded from variable 'curbp') [=
clang-analyzer-core.NullDereference]
                   dep =3D (xfs_dir2_data_entry_t *)((char *)curbp->b_addr +
                                                           ^
   fs/xfs/libxfs/xfs_dir2_node.c:938:6: note: Assuming the condition is fal=
se
           if (args->op_flags & XFS_DA_OP_ADDNAME)
--
           } else if (ctrl->link_rate =3D=3D DP_LINK_BW_2_7) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/edp/edp_ctrl.c:1353:9: note: Taking false branch
           } else if (ctrl->link_rate =3D=3D DP_LINK_BW_2_7) {
                  ^
   drivers/gpu/drm/msm/edp/edp_ctrl.c:1357:3: note: Returning without writi=
ng to '*pm'
                   return false;
                   ^
   drivers/gpu/drm/msm/edp/edp_ctrl.c:914:3: note: Returning from 'msm_edp_=
ctrl_pixel_clock_valid'
                   msm_edp_ctrl_pixel_clock_valid(ctrl, ctrl->pixel_rate, &=
m, &n);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/msm/edp/edp_ctrl.c:915:3: note: 2nd function call argume=
nt is an uninitialized value
                   edp_sw_mvid_nvid(ctrl, m, n);
                   ^                      ~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   fs/sysfs/file.c:54:2: warning: Null pointer passed as 1st argument to me=
mory set function [clang-analyzer-unix.cstring.NullArg]
           memset(buf, 0, PAGE_SIZE);
           ^      ~~~
   fs/sysfs/file.c:49:10: note: Calling 'seq_get_buf'
           count =3D seq_get_buf(sf, &buf);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:65:9: note: Assuming field 'count' is <=3D fiel=
d 'size'
           BUG_ON(m->count > m->size);
                  ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/seq_file.h:65:2: note: Taking false branch
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/seq_file.h:65:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(m->count > m->size);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   include/linux/seq_file.h:66:6: note: Assuming field 'count' is >=3D fiel=
d 'size'
           if (m->count < m->size)
               ^~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:66:2: note: Taking false branch
           if (m->count < m->size)
           ^
   include/linux/seq_file.h:69:3: note: Null pointer value stored to 'buf'
                   *bufp =3D NULL;
                   ^~~~~~~~~~~~
   fs/sysfs/file.c:49:10: note: Returning from 'seq_get_buf'
           count =3D seq_get_buf(sf, &buf);
                   ^~~~~~~~~~~~~~~~~~~~~
   fs/sysfs/file.c:50:6: note: Assuming the condition is false
           if (count < PAGE_SIZE) {
               ^~~~~~~~~~~~~~~~~
   fs/sysfs/file.c:50:2: note: Taking false branch
           if (count < PAGE_SIZE) {
           ^
   fs/sysfs/file.c:54:2: note: Null pointer passed as 1st argument to memor=
y set function
           memset(buf, 0, PAGE_SIZE);
           ^      ~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:195:2: warning: Value stored=
 to 'pm_pg_lock' is never read [clang-analyzer-deadcode.DeadStores]
           pm_pg_lock =3D use_bank =3D use_ring =3D false;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:195:2: note: Value stored to=
 'pm_pg_lock' is never read
           pm_pg_lock =3D use_bank =3D use_ring =3D false;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/omapdrm/omap_crtc.c:234:21: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:234:21: note: Value stored to 'dev' =
during its initialization is never read
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:253:21: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:253:21: note: Value stored to 'dev' =
during its initialization is never read
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/omapdrm/omap_encoder.c:104:16: warning: Access to field =
'bridge' results in a dereference of a null pointer (loaded from variable '=
output') [clang-analyzer-core.NullDereference]
           for (bridge =3D output->bridge; bridge;
                         ^~~~~~
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Left side of '&&' is=
 false
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Taking false branch
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Loop condition is fa=
lse.  Exiting loop
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:77:2: note: 'output' initialized =
here
           struct omap_dss_device *output =3D omap_encoder->output;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_encoder.c:85:2: note: Left side of '&&' is =
false
           list_for_each_entry(connector, &dev->mode_config.connector_list,=
 head) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:85:2: note: Taking false branch
           list_for_each_entry(connector, &dev->mode_config.connector_list,=
 head) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
--
                                 ^
   drivers/gpu/drm/meson/meson_crtc.c:381:3: note: Taking true branch
                   if (priv->viu.osd1_afbcd) {
                   ^
   drivers/gpu/drm/meson/meson_crtc.c:382:4: note: Access to field 'reset' =
results in a dereference of a null pointer (loaded from field 'ops')
                           priv->afbcd.ops->reset(priv);
                           ^           ~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/drm_framebuffer.c:855:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(fb->comm, current->comm);
           ^~~~~~
   drivers/gpu/drm/drm_framebuffer.c:855:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(fb->comm, current->comm);
           ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/rapidio/rio-scan.c:561:10: warning: Although the value stored to=
 'tmp' is used in the enclosing expression, the value is never actually rea=
d from 'tmp' [clang-analyzer-deadcode.DeadStores]
           while ((tmp =3D rio_get_host_deviceid_lock(port, hopcount))
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio-scan.c:561:10: note: Although the value stored to 't=
mp' is used in the enclosing expression, the value is never actually read f=
rom 'tmp'
           while ((tmp =3D rio_get_host_deviceid_lock(port, hopcount))
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/venc.c:697:2: warning: Value stored to 'rev_=
id' is never read [clang-analyzer-deadcode.DeadStores]
           rev_id =3D (u8)(venc_read_reg(venc, VENC_REV_ID) & 0xff);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/venc.c:697:2: note: Value stored to 'rev_id'=
 is never read
           rev_id =3D (u8)(venc_read_reg(venc, VENC_REV_ID) & 0xff);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:1197:3: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(mmSRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:1197:3: note: Value stored to 'tmp=
' is never read
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:827:17: warning: The result of t=
he left shift is undefined because the right operand is negative [clang-ana=
lyzer-core.UndefinedBinaryOperatorResult]
                           created |=3D 1 << session_idx;
                                        ^  ~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:727:2: note: 'session_idx' initi=
alized to -1
           int session_idx =3D -1;
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:739:2: note: Loop condition is f=
alse. Execution continues on line 805
           for (idx =3D 0; idx < ib->length_dw;) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:805:2: note: Loop condition is t=
rue.  Entering loop body
           for (idx =3D 0; idx < ib->length_dw;) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:809:3: note: Control jumps to 'c=
ase 16777217:'  at line 826
                   switch (cmd) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:827:17: note: The result of the =
left shift is undefined because the right operand is negative
                           created |=3D 1 << session_idx;
                                        ^  ~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:868:8: warning: 5th function cal=
l argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                           r =3D amdgpu_vce_cs_reloc(p, ib_idx, idx + 10, i=
dx + 9,
                               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:731:11: note: 'tmp' declared wit=
hout an initial value
           uint32_t tmp, handle =3D 0;
                    ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:739:2: note: Loop condition is f=
alse. Execution continues on line 805
           for (idx =3D 0; idx < ib->length_dw;) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:805:2: note: Loop condition is t=
rue.  Entering loop body
           for (idx =3D 0; idx < ib->length_dw;) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:809:3: note: Control jumps to 'c=
ase 50331649:'  at line 867
                   switch (cmd) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:868:8: note: 5th function call a=
rgument is an uninitialized value
                           r =3D amdgpu_vce_cs_reloc(p, ib_idx, idx + 10, i=
dx + 9,
                               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:880:19: warning: The result of t=
he left shift is undefined because the right operand is negative [clang-ana=
lyzer-core.UndefinedBinaryOperatorResult]
                           destroyed |=3D 1 << session_idx;
                                          ^  ~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:727:2: note: 'session_idx' initi=
alized to -1
           int session_idx =3D -1;
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:739:2: note: Loop condition is f=
alse. Execution continues on line 805
           for (idx =3D 0; idx < ib->length_dw;) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:805:2: note: Loop condition is t=
rue.  Entering loop body
           for (idx =3D 0; idx < ib->length_dw;) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:809:3: note: Control jumps to 'c=
ase 33554433:'  at line 879
                   switch (cmd) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:880:19: note: The result of the =
left shift is undefined because the right operand is negative
--
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/video/fbdev/i740fb.c:332:2: warning: Undefined or garbage value =
returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return wm;
           ^      ~~
   drivers/video/fbdev/i740fb.c:219:2: note: 'wm' declared without an initi=
al value
           u32 wm;
           ^~~~~~
   drivers/video/fbdev/i740fb.c:221:2: note: 'Default' branch taken. Execut=
ion continues on line 332
           switch (bpp) {
           ^
   drivers/video/fbdev/i740fb.c:332:2: note: Undefined or garbage value ret=
urned to caller
           return wm;
           ^      ~~
   drivers/video/fbdev/i740fb.c:354:21: warning: The result of the left shi=
ft is undefined because the right operand is negative [clang-analyzer-core.=
UndefinedBinaryOperatorResult]
           f_vco =3D (freq * (1 << p_best)) / I740_RFREQ_FIX;
                              ^  ~~~~~~
   drivers/video/fbdev/i740fb.c:353:19: note: '?' condition is false
           p_best =3D min(15, ilog2(I740_MAX_VCO_FREQ / (freq / I740_RFREQ_=
FIX)));
                            ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/video/fbdev/i740fb.c:353:19: note: '?' condition is true
           p_best =3D min(15, ilog2(I740_MAX_VCO_FREQ / (freq / I740_RFREQ_=
FIX)));
                            ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/video/fbdev/i740fb.c:353:11: note: '__UNIQUE_ID___x256' is >=3D =
'__UNIQUE_ID___y257'
           p_best =3D min(15, ilog2(I740_MAX_VCO_FREQ / (freq / I740_RFREQ_=
FIX)));
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/video/fbdev/i740fb.c:353:11: note: '?' condition is false
           p_best =3D min(15, ilog2(I740_MAX_VCO_FREQ / (freq / I740_RFREQ_=
FIX)));
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/video/fbdev/i740fb.c:353:2: note: The value -1 is assigned to 'p=
_best'
           p_best =3D min(15, ilog2(I740_MAX_VCO_FREQ / (freq / I740_RFREQ_=
FIX)));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/video/fbdev/i740fb.c:354:21: note: The result of the left shift =
is undefined because the right operand is negative
           f_vco =3D (freq * (1 << p_best)) / I740_RFREQ_FIX;
                              ^  ~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clk/ti/apll.c:100:2: warning: Value stored to 'state' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           state <<=3D __ffs(ad->idlest_mask);
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/apll.c:100:2: note: Value stored to 'state' is never read
           state <<=3D __ffs(ad->idlest_mask);
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> drivers/clk/ti/clkt_dpll.c:305:2: warning: Value stored to 'clk_name' is=
 never read [clang-analyzer-deadcode.DeadStores]
           clk_name =3D clk_hw_get_name(hw);
           ^          ~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clkt_dpll.c:305:2: note: Value stored to 'clk_name' is ne=
ver read
           clk_name =3D clk_hw_get_name(hw);
           ^          ~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/clk/ti/clkt_dflt.c:234:2: warning: Value stored to 'v' is never =
read [clang-analyzer-deadcode.DeadStores]
           v =3D ti_clk_ll_ops->clk_readl(&clk->enable_reg); /* OCP barrier=
 */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clkt_dflt.c:234:2: note: Value stored to 'v' is never read
           v =3D ti_clk_ll_ops->clk_readl(&clk->enable_reg); /* OCP barrier=
 */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (12 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   mm/page_alloc.c:8794:2: note: Calling 'zone_set_pageset_high_and_batch'
           zone_set_pageset_high_and_batch(zone);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6388:6: note: Assuming 'percpu_pagelist_fraction' is 0
           if (percpu_pagelist_fraction) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6388:2: note: Taking false branch
           if (percpu_pagelist_fraction) {
           ^
   mm/page_alloc.c:6394:15: note: Calling 'zone_batchsize'
                   new_batch =3D zone_batchsize(zone);
                               ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6286:6: note: Assuming the condition is false
           if (batch * PAGE_SIZE > 1024 * 1024)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6286:2: note: Taking false branch
           if (batch * PAGE_SIZE > 1024 * 1024)
           ^
   mm/page_alloc.c:6289:6: note: Assuming 'batch' is >=3D 1
           if (batch < 1)
               ^~~~~~~~~
   mm/page_alloc.c:6289:2: note: Taking false branch
           if (batch < 1)
           ^
   mm/page_alloc.c:6302:10: note: '?' condition is false
           batch =3D rounddown_pow_of_two(batch + batch/2) - 1;
                   ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __builtin_constant_p(n) ? (             \
           ^
   mm/page_alloc.c:6302:10: note: Calling '__rounddown_pow_of_two'
           batch =3D rounddown_pow_of_two(batch + batch/2) - 1;
                   ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:4832:4: warning: 4th function call argument is an uninit=
ialized value [clang-analyzer-core.CallAndMessage]
                           should_compact_retry(ac, order, alloc_flags,
                           ^
   mm/page_alloc.c:4973:15: note: Assuming 'order' is < 11
           if (unlikely(order >=3D MAX_ORDER)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/page_alloc.c:4973:2: note: Taking false branch
           if (unlikely(order >=3D MAX_ORDER)) {
           ^
   mm/page_alloc.c:4980:7: note: Calling 'prepare_alloc_pages'
           if (!prepare_alloc_pages(gfp_mask, order, preferred_nid, nodemas=
k, &ac, &alloc_mask, &alloc_flags))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:4921:2: note: Taking false branch
           if (cpusets_enabled()) {
           ^
   mm/page_alloc.c:4936:2: note: Taking true branch
           might_sleep_if(gfp_mask & __GFP_DIRECT_RECLAIM);
           ^
--
   drivers/gpu/drm/msm/dp/dp_ctrl.c:965:2: note: Returning from '_dp_ctrl_c=
alc_tu'
           _dp_ctrl_calc_tu(&in, tu_table);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:966:1: note: Returning without writing =
to 'tu_table->tu_size_minus1'
   }
   ^
   drivers/gpu/drm/msm/dp/dp_ctrl.c:975:2: note: Returning from 'dp_ctrl_ca=
lc_tu_parameters'
           dp_ctrl_calc_tu_parameters(ctrl, &tu_calc_table);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:977:8: note: Assigned value is garbage =
or undefined
           dp_tu |=3D tu_calc_table.tu_size_minus1;
                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1103:2: warning: Value stored to 'tries=
' is never read [clang-analyzer-deadcode.DeadStores]
           tries =3D 0;
           ^       ~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:1103:2: note: Value stored to 'tries' i=
s never read
           tries =3D 0;
           ^       ~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/kmb/kmb_drv.c:60:2: warning: Value stored to 'ret' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ret =3D  kmb_dsi_clk_init(kmb->kmb_dsi);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/kmb/kmb_drv.c:60:2: note: Value stored to 'ret' is never=
 read
           ret =3D  kmb_dsi_clk_init(kmb->kmb_dsi);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/kmb/kmb_drv.c:186:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret =3D kmb_dsi_encoder_init(drm, kmb->kmb_dsi);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/kmb/kmb_drv.c:186:2: note: Value stored to 'ret' is neve=
r read
           ret =3D kmb_dsi_encoder_init(drm, kmb->kmb_dsi);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/kmb/kmb_drv.c:563:13: warning: Access to field 'state' r=
esults in a dereference of a null pointer (loaded from variable 'kmb') [cla=
ng-analyzer-core.NullDereference]
           kmb->state =3D drm_atomic_helper_suspend(drm);
           ~~~        ^
   drivers/gpu/drm/kmb/kmb_drv.c:559:32: note: Assuming 'drm' is null
           struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
                                         ^~~
   drivers/gpu/drm/kmb/kmb_drv.c:559:32: note: '?' condition is false
   drivers/gpu/drm/kmb/kmb_drv.c:559:2: note: 'kmb' initialized to a null p=
ointer value
           struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/kmb/kmb_drv.c:563:13: note: Access to field 'state' resu=
lts in a dereference of a null pointer (loaded from variable 'kmb')
           kmb->state =3D drm_atomic_helper_suspend(drm);
           ~~~        ^
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/clk/clk-cdce925.c:118:3: warning: Value stored to 'rate' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   rate =3D parent_rate;
                   ^      ~~~~~~~~~~~
   drivers/clk/clk-cdce925.c:118:3: note: Value stored to 'rate' is never r=
ead
                   rate =3D parent_rate;
                   ^      ~~~~~~~~~~~
   drivers/clk/clk-cdce925.c:444:20: warning: Division by zero [clang-analy=
zer-core.DivideZero]
           if (l_parent_rate / divider !=3D rate) {
               ~~~~~~~~~~~~~~^~~~~~~~~
   drivers/clk/clk-cdce925.c:442:16: note: Calling 'cdce925_calc_divider'
           u16 divider =3D cdce925_calc_divider(rate, l_parent_rate);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-cdce925.c:383:6: note: Assuming 'rate' is 0, which parti=
cipates in a condition later
           if (!rate)
               ^~~~~
   drivers/clk/clk-cdce925.c:383:2: note: Taking true branch
           if (!rate)
           ^
   drivers/clk/clk-cdce925.c:384:3: note: Returning zero
                   return 0;
                   ^~~~~~~~
   drivers/clk/clk-cdce925.c:442:16: note: Returning from 'cdce925_calc_div=
ider'
           u16 divider =3D cdce925_calc_divider(rate, l_parent_rate);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-cdce925.c:442:2: note: 'divider' initialized to 0
           u16 divider =3D cdce925_calc_divider(rate, l_parent_rate);
           ^~~~~~~~~~~
   drivers/clk/clk-cdce925.c:444:20: note: Division by zero
           if (l_parent_rate / divider !=3D rate) {
               ~~~~~~~~~~~~~~^~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/sti/sti_hqvdp.c:741:6: warning: Division by zero [clang-=
analyzer-core.DivideZero]
           lfw /=3D max(src_w, dst_w) * mode->clock / 1000;
               ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Left side of '&&' is false
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Taking false branch
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Loop condition is false. =
 Exiting loop
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Left side of '&&' is false
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Taking false branch
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Loop condition is false. =
 Exiting loop
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
--
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1103:2: note: Assuming 'debug_lock=
s' is 0
           lockdep_assert_held(&gpu->lock);
           ^
   include/linux/lockdep.h:298:11: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks && !lockdep_is_held(l));    \
                           ^~~~~~~~~~~
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1103:2: note: Left side of '&&' is=
 false
           lockdep_assert_held(&gpu->lock);
           ^
   include/linux/lockdep.h:298:23: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks && !lockdep_is_held(l));    \
                                       ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1103:2: note: Loop condition is fa=
lse.  Exiting loop
           lockdep_assert_held(&gpu->lock);
           ^
   include/linux/lockdep.h:297:32: note: expanded from macro 'lockdep_asser=
t_held'
   #define lockdep_assert_held(l)  do {                            \
                                   ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1105:6: note: Calling 'kzalloc'
           f =3D kzalloc(sizeof(*f), GFP_KERNEL);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:540:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:557:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1105:6: note: Returning from 'kzal=
loc'
           f =3D kzalloc(sizeof(*f), GFP_KERNEL);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1106:6: note: Assuming 'f' is non-=
null, which participates in a condition later
           if (!f)
               ^~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1106:2: note: Taking false branch
           if (!f)
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1114:2: note: Returning pointer, w=
hich participates in a condition later
           return &f->base;
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1347:14: note: Returning from 'etn=
aviv_gpu_fence_alloc'
           gpu_fence =3D etnaviv_gpu_fence_alloc(gpu);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1348:7: note: 'gpu_fence' is non-n=
ull
           if (!gpu_fence) {
                ^~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1348:2: note: Taking false branch
           if (!gpu_fence) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1355:6: note: Assuming field 'mmu_=
context' is non-null
           if (!gpu->mmu_context) {
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1355:2: note: Taking false branch
           if (!gpu->mmu_context) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1364:14: note: Field 'nr_pmrs' is 0
           if (submit->nr_pmrs) {
                       ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1364:2: note: Taking false branch
           if (submit->nr_pmrs) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1376:6: note: Assuming field 'nr_p=
mrs' is not equal to 0
           if (submit->nr_pmrs) {
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1376:2: note: Taking true branch
           if (submit->nr_pmrs) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1377:3: note: Array subscript is u=
ndefined
                   gpu->event[event[2]].sync_point =3D &sync_point_perfmon_=
sample_post;
                   ^          ~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/imx/clk-imx6q.c:251:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents=
",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/imx/clk-imx6q.c:251:2: note: Value stored to 'ret' is never =
read
           ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents=
",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:155:50: warning: The result of th=
e left shift is undefined due to shifting by '4294967295', which is greater=
 or equal to the width of type 'unsigned long long' [clang-analyzer-core.Un=
definedBinaryOperatorResult]
                   return round_up(adev->vm_manager.max_pfn, 1ULL << shift)
                                                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2955:26: note: Assuming field 'as=
ic_type' is not equal to CHIP_RAVEN
           bool pte_support_ats =3D (adev->asic_type =3D=3D CHIP_RAVEN);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2959:6: note: 'r' is 0
           if (r)
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2959:2: note: Taking false branch
           if (r)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2963:6: note: Calling 'amdgpu_vm_=
check_clean_reserved'
           r =3D amdgpu_vm_check_clean_reserved(adev, vm);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2917:25: note: Calling 'amdgpu_vm=
_num_entries'
           unsigned int entries =3D amdgpu_vm_num_entries(adev, root);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:150:19: note: Calling 'amdgpu_vm_=
level_shift'
           unsigned shift =3D amdgpu_vm_level_shift(adev,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:125:2: note: Control jumps to the=
 'default' case at line 133
           switch (level) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:134:3: note: Returning the value =
4294967295
                   return ~0;
                   ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:150:19: note: Returning from 'amd=
gpu_vm_level_shift'
           unsigned shift =3D amdgpu_vm_level_shift(adev,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:150:2: note: 'shift' initialized =
to 4294967295
           unsigned shift =3D amdgpu_vm_level_shift(adev,
           ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:153:6: note: 'level' is equal to =
field 'root_level'
           if (level =3D=3D adev->vm_manager.root_level)
               ^~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:153:2: note: Taking true branch
           if (level =3D=3D adev->vm_manager.root_level)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:155:50: note: The result of the l=
eft shift is undefined due to shifting by '4294967295', which is greater or=
 equal to the width of type 'unsigned long long'
                   return round_up(adev->vm_manager.max_pfn, 1ULL << shift)
                                                                  ^
   include/linux/math.h:24:52: note: expanded from macro 'round_up'
   #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
                                                      ^
   include/linux/math.h:14:46: note: expanded from macro '__round_mask'
   #define __round_mask(x, y) ((__typeof__(x))((y)-1))
                                                ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:927:29: warning: Dereference of n=
ull pointer [clang-analyzer-core.NullDereference]
           pt->parent =3D amdgpu_bo_ref(cursor->parent->base.bo);
                                      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3305:6: note: Assuming 'vm' is no=
n-null
           if (vm)
               ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3305:2: note: Taking true branch
           if (vm)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3311:6: note: Assuming 'root' is =
non-null
           if (!root)
               ^~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3311:2: note: Taking false branch
           if (!root)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3315:6: note: 'r' is 0
           if (r)
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3315:2: note: Taking false branch
           if (r)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3321:6: note: Assuming 'vm' is no=
n-null
           if (vm && vm->root.base.bo !=3D root)
               ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3321:6: note: Left side of '&&' i=
s true
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3321:12: note: Assuming 'root' is=
 equal to field 'bo'
           if (vm && vm->root.base.bo !=3D root)
                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3321:2: note: Taking false branch
           if (vm && vm->root.base.bo !=3D root)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3324:7: note: 'vm' is non-null
           if (!vm)
                ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3324:2: note: Taking false branch
           if (!vm)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3331:6: note: Assuming field 'is_=
compute_context' is false
           if (vm->is_compute_context) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3331:2: note: Taking false branch
--
                          ^
   drivers/net/hamradio/baycom_epp.c:568:7: note: Assuming the condition is=
 false
                   if (cnt2 !=3D pp->ops->epp_read_data(pp, tmp, cnt2, 0)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/hamradio/baycom_epp.c:568:3: note: Taking false branch
                   if (cnt2 !=3D pp->ops->epp_read_data(pp, tmp, cnt2, 0)) {
                   ^
   drivers/net/hamradio/baycom_epp.c:573:3: note: Loop condition is true.  =
Entering loop body
                   for (; cnt2 > 0; cnt2--, cp++) {
                   ^
   drivers/net/hamradio/baycom_epp.c:580:4: note: Loop condition is true.  =
Entering loop body
                           for (j =3D 0; j < 8; j++) {
                           ^
   drivers/net/hamradio/baycom_epp.c:583:25: note: Assuming the condition i=
s false
                                   if (unlikely(!(notbitstream & (0x0fc << =
j)))) {
                                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/hamradio/baycom_epp.c:583:12: note: Taking false branch
                                   if (unlikely(!(notbitstream & (0x0fc << =
j)))) {
                                   ^
   drivers/net/hamradio/baycom_epp.c:601:23: note: Assuming the condition i=
s true
                                   else if (unlikely((bitstream & (0x1f8 <<=
 j)) =3D=3D (0xf8 << j))) {
                                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/hamradio/baycom_epp.c:601:10: note: Taking true branch
                                   else if (unlikely((bitstream & (0x1f8 <<=
 j)) =3D=3D (0xf8 << j))) {
                                        ^
   drivers/net/hamradio/baycom_epp.c:603:34: note: The result of the left s=
hift is undefined because the left operand is negative
                                           bitbuf =3D (bitbuf & ((~0xff) <<=
 j)) | ((bitbuf & ~((~0xff) << j)) << 1);
                                                               ~~~~~~~ ^
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/host1x/cdma.c:563:15: warning: Value stored to 'space' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/cdma.c:563:15: note: Value stored to 'space' during i=
ts initialization is never read
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   drivers/power/supply/twl4030_charger.c:364:2: warning: Value stored to '=
cur_reg' is never read [clang-analyzer-deadcode.DeadStores]
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:364:2: note: Value stored to 'cur=
_reg' is never read
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: warning: Value stored to '=
status' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: note: Value stored to 'sta=
tus' is never read
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:487:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:487:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/base.c:213:21: warning: Value stored to 'dss=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct dss_device *dss =3D src ? src->dss : dst->dss;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/base.c:213:21: note: Value stored to 'dss' d=
uring its initialization is never read
           struct dss_device *dss =3D src ? src->dss : dst->dss;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/omapdrm/dss/dispc.c:871:56: warning: The result of the l=
eft shift is undefined because the left operand is negative [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->g=
cb, ct->gcr));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:867:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:6: note: Assuming the condition=
 is true
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:51:2: note: expanded from macro 'REG=
_GET'
           FLD_GET(dispc_read_reg(dispc, idx), start, end)
           ^
   drivers/gpu/drm/omapdrm/dss/dss.h:66:34: note: expanded from macro 'FLD_=
GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:2: note: Taking true branch
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4902:3: note: Calling '_omap_dispc_i=
nitial_config'
                   _omap_dispc_initial_config(dispc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3911:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV)) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:6: note: Assuming field 'has_ga=
mma_table' is false
           if (dispc->feat->has_gamma_table)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:2: note: Taking false branch
           if (dispc->feat->has_gamma_table)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:6: note: Left side of '||' is f=
alse
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3930:19: note: Field 'has_gamma_tabl=
e' is false
               dispc->feat->has_gamma_table)
                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3933:2: note: Calling 'dispc_setup_c=
olor_conv_coef'
           dispc_setup_color_conv_coef(dispc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:14: note: Assuming 'i' is < 'num=
_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:920:3: note: Calling 'dispc_ovl_writ=
e_color_conv_coef'
                   dispc_ovl_write_color_conv_coef(dispc, i, &coefs_yuv2rgb=
_bt601_lim);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:871:56: note: The result of the left=
 shift is undefined because the left operand is negative
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->g=
cb, ct->gcr));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:867:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:889:56: warning: The result of the l=
eft shift is undefined because the left operand is negative [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->c=
rb, ct->crg));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:885:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:6: note: Assuming the condition=
 is true
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:51:2: note: expanded from macro 'REG=
_GET'
           FLD_GET(dispc_read_reg(dispc, idx), start, end)
           ^
   drivers/gpu/drm/omapdrm/dss/dss.h:66:34: note: expanded from macro 'FLD_=
GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:2: note: Taking true branch
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4902:3: note: Calling '_omap_dispc_i=
nitial_config'
                   _omap_dispc_initial_config(dispc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3911:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV)) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:6: note: Assuming field 'has_ga=
mma_table' is false
           if (dispc->feat->has_gamma_table)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:2: note: Taking false branch
           if (dispc->feat->has_gamma_table)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:6: note: Left side of '||' is f=
alse
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3930:19: note: Field 'has_gamma_tabl=
e' is false
               dispc->feat->has_gamma_table)
                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3933:2: note: Calling 'dispc_setup_c=
olor_conv_coef'
           dispc_setup_color_conv_coef(dispc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:14: note: Assuming 'i' is >=3D '=
num_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:2: note: Loop condition is false=
. Execution continues on line 922
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:922:6: note: Assuming field 'has_wri=
teback' is true
           if (dispc->feat->has_writeback)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:922:2: note: Taking true branch
           if (dispc->feat->has_writeback)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:923:3: note: Calling 'dispc_wb_write=
_color_conv_coef'
                   dispc_wb_write_color_conv_coef(dispc, &coefs_rgb2yuv_bt6=
01_lim);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:889:56: note: The result of the left=
 shift is undefined because the left operand is negative
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->c=
rb, ct->crg));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:885:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
>> drivers/gpu/drm/omapdrm/dss/dispc.c:3215:3: warning: Value stored to 'ht=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ht =3D vm->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3215:3: note: Value stored to 'ht' i=
s never read
                   ht =3D vm->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/omapdrm/dss/dispc.c:3216:3: warning: Value stored to 'vt=
' is never read [clang-analyzer-deadcode.DeadStores]
                   vt =3D vm->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3216:3: note: Value stored to 'vt' i=
s never read
                   vt =3D vm->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/omapdrm/dss/dispc.c:4822:2: warning: Value stored to 're=
v' is never read [clang-analyzer-deadcode.DeadStores]
           rev =3D dispc_read_reg(dispc, DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:4822:2: note: Value stored to 'rev' =
is never read
           rev =3D dispc_read_reg(dispc, DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/mfd/menelaus.c:453:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:453:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:525:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:525:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:734:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:734:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   16 warnings generated.
   drivers/mfd/twl-core.c:574:15: warning: The left operand of '&' is a gar=
bage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           switch (ctrl & 0x3) {
                   ~~~~ ^
   drivers/mfd/twl-core.c:569:2: note: 'ctrl' declared without an initial v=
alue
           u8 ctrl;
           ^~~~~~~
   drivers/mfd/twl-core.c:572:2: note: Calling 'twl_i2c_read_u8'
           twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &ctrl, R_CFG_BOOT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:9: note: Calling 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:473:7: note: 'regmap' is null
           if (!regmap)
                ^~~~~~
   drivers/mfd/twl-core.c:473:2: note: Taking true branch
           if (!regmap)
           ^
   drivers/mfd/twl-core.c:474:3: note: Returning without writing to '*value'
                   return -EPERM;
                   ^
   include/linux/mfd/twl.h:180:9: note: Returning from 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:2: note: Returning without writing to '*val'
           return twl_i2c_read(mod_no, val, reg, 1);
           ^
   drivers/mfd/twl-core.c:572:2: note: Returning from 'twl_i2c_read_u8'
           twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &ctrl, R_CFG_BOOT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:574:15: note: The left operand of '&' is a garbag=
e value
           switch (ctrl & 0x3) {
                   ~~~~ ^
   drivers/mfd/twl-core.c:1205:8: warning: The left expression of the compo=
und assignment is an uninitialized value. The computed value will also be g=
arbage [clang-analyzer-core.uninitialized.Assign]
                   temp &=3D ~(SR_I2C_SDA_CTRL_PU | SR_I2C_SCL_CTRL_PU | \
                   ~~~~ ^
   drivers/mfd/twl-core.c:1078:6: note: Assuming 'node' is non-null
           if (!node && !pdata) {
               ^~~~~
   drivers/mfd/twl-core.c:1078:12: note: Left side of '&&' is false
           if (!node && !pdata) {
                     ^
   drivers/mfd/twl-core.c:1083:6: note: Assuming 'twl_priv' is null
           if (twl_priv) {
               ^~~~~~~~
   drivers/mfd/twl-core.c:1083:2: note: Taking false branch
           if (twl_priv) {
           ^
   drivers/mfd/twl-core.c:1090:6: note: Assuming 'pdev' is non-null
           if (!pdev) {
               ^~~~~
   drivers/mfd/twl-core.c:1090:2: note: Taking false branch
           if (!pdev) {
           ^
   drivers/mfd/twl-core.c:1096:6: note: Assuming 'status' is 0
           if (status) {
               ^~~~~~
   drivers/mfd/twl-core.c:1096:2: note: Taking false branch
           if (status) {
           ^
   drivers/mfd/twl-core.c:1101:2: note: Taking false branch
           if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C) =3D=
=3D 0) {
           ^
   drivers/mfd/twl-core.c:1109:6: note: Assuming 'twl_priv' is non-null
           if (!twl_priv) {
               ^~~~~~~~~
   drivers/mfd/twl-core.c:1109:2: note: Taking false branch
           if (!twl_priv) {
           ^
   drivers/mfd/twl-core.c:1114:6: note: Assuming the condition is true
           if ((id->driver_data) & TWL6030_CLASS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1114:2: note: Taking true branch
           if ((id->driver_data) & TWL6030_CLASS) {
           ^
   drivers/mfd/twl-core.c:1118:7: note: Assuming the condition is false
                   if ((id->driver_data) & TWL6032_SUBCLASS)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1118:3: note: Taking false branch
                   if ((id->driver_data) & TWL6032_SUBCLASS)
                   ^
   drivers/mfd/twl-core.c:1129:26: note: Calling 'devm_kcalloc'
--
                           i =3D bgp->conf->sensor_count;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/ti-soc-thermal/ti-bandgap.c:1028:4: note: Value stored t=
o 'i' is never read
                           i =3D bgp->conf->sensor_count;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/ti-soc-thermal/ti-bandgap.c:1146:4: warning: Value store=
d to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                           val =3D ti_bandgap_readl(bgp, tsr->bgap_counter);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/ti-soc-thermal/ti-bandgap.c:1146:4: note: Value stored t=
o 'val' is never read
                           val =3D ti_bandgap_readl(bgp, tsr->bgap_counter);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/phy/mediatek/phy-mtk-xsphy.c:211:6: warning: Value stored to 'in=
dex' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-xsphy.c:211:6: note: Value stored to 'index=
' during its initialization is never read
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-xsphy.c:230:6: warning: Value stored to 'in=
dex' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-xsphy.c:230:6: note: Value stored to 'index=
' during its initialization is never read
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c:243:3: warning: Value stored to =
'temp' is never read [clang-analyzer-deadcode.DeadStores]
                   temp =3D hdmi_read_reg(core->base, HDMI_CEC_INT_STATUS_1=
);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c:243:3: note: Value stored to 'te=
mp' is never read
                   temp =3D hdmi_read_reg(core->base, HDMI_CEC_INT_STATUS_1=
);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/hwmon/ltc2945.c:286:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/hwmon/ltc2945.c:286:2: note: Value stored to 'ret' is never read
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   17 warnings generated.
   fs/gfs2/super.c:73:3: warning: Use of memory after it is freed [clang-an=
alyzer-unix.Malloc]
                   gfs2_free_journal_extents(jd);
                   ^
   fs/gfs2/super.c:688:2: note: '?' condition is true
           set_bit(SDF_NORECOVERY, &sdp->sd_flags);
           ^
   arch/arm/include/asm/bitops.h:189:25: note: expanded from macro 'set_bit'
   #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   fs/gfs2/super.c:694:2: note: Left side of '&&' is false
           list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/gfs2/super.c:694:2: note: Taking false branch
           list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/gfs2/super.c:694:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/gfs2/super.c:694:2: note: Loop condition is false. Execution continue=
s on line 702
           list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
--
                   ^~~~~~~~~~~~~
   drivers/mtd/mtd_blkdevs.c:247:2: note: Returning; memory was released
           kref_put(&dev->ref, blktrans_dev_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtd_blkdevs.c:250:2: note: Use of memory after it is freed
           blktrans_dev_put(dev);
           ^                ~~~
   drivers/mtd/mtd_blkdevs.c:268:13: warning: Use of memory after it is fre=
ed [clang-analyzer-unix.Malloc]
           module_put(dev->tr->owner);
                      ^~~~~~~
   drivers/mtd/mtd_blkdevs.c:256:33: note: Calling 'blktrans_dev_get'
           struct mtd_blktrans_dev *dev =3D blktrans_dev_get(disk);
                                          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtd_blkdevs.c:49:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   drivers/mtd/mtd_blkdevs.c:49:2: note: Taking false branch
           if (!dev)
           ^
   drivers/mtd/mtd_blkdevs.c:256:33: note: Returning from 'blktrans_dev_get'
           struct mtd_blktrans_dev *dev =3D blktrans_dev_get(disk);
                                          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtd_blkdevs.c:258:7: note: 'dev' is non-null
           if (!dev)
                ^~~
   drivers/mtd/mtd_blkdevs.c:258:2: note: Taking false branch
           if (!dev)
           ^
   drivers/mtd/mtd_blkdevs.c:264:6: note: Assuming the condition is false
           if (--dev->open)
               ^~~~~~~~~~~
   drivers/mtd/mtd_blkdevs.c:264:2: note: Taking false branch
           if (--dev->open)
           ^
   drivers/mtd/mtd_blkdevs.c:267:2: note: Calling 'kref_put'
           kref_put(&dev->ref, blktrans_dev_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'blktrans_dev_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/mtd/mtd_blkdevs.c:31:3: note: Left side of '&&' is false
                   container_of(kref, struct mtd_blktrans_dev, ref);
                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/mtd/mtd_blkdevs.c:31:3: note: Taking false branch
                   container_of(kref, struct mtd_blktrans_dev, ref);
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/mtd/mtd_blkdevs.c:31:3: note: Loop condition is false.  Exiting =
loop
                   container_of(kref, struct mtd_blktrans_dev, ref);
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/mtd/mtd_blkdevs.c:39:2: note: Memory is released
           kfree(dev);
           ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/mtd/mtd_blkdevs.c:267:2: note: Returning; memory was released
           kref_put(&dev->ref, blktrans_dev_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtd_blkdevs.c:268:13: note: Use of memory after it is freed
           module_put(dev->tr->owner);
                      ^~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/mtd/devices/st_spi_fsm.c:275:8: warning: Excessive padding in 's=
truct seq_rw_config' (6 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   flags, =

   write, =

   cmd, =

   addr_pads, =

   data_pads, =

   mode_data, =

   mode_cycles, =

   dummy_cycles, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct seq_rw_config {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/mtd/devices/st_spi_fsm.c:275:8: note: Excessive padding in 'stru=
ct seq_rw_config' (6 padding bytes, where 2 is optimal). Optimal fields ord=
er: flags, write, cmd, addr_pads, data_pads, mode_data, mode_cycles, dummy_=
cycles, consider reordering the fields or adding explicit padding members
   struct seq_rw_config {
   ~~~~~~~^~~~~~~~~~~~~~~
>> drivers/mtd/devices/st_spi_fsm.c:287:8: warning: Excessive padding in 's=
truct flash_info' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   jedec_id, =

   sector_size, =

   flags, =

   max_freq, =

   config, =

   ext_id, =

   n_sectors, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct flash_info {
   ~~~~~~~^~~~~~~~~~~~
   drivers/mtd/devices/st_spi_fsm.c:287:8: note: Excessive padding in 'stru=
ct flash_info' (4 padding bytes, where 0 is optimal). Optimal fields order:=
 name, jedec_id, sector_size, flags, max_freq, config, ext_id, n_sectors, c=
onsider reordering the fields or adding explicit padding members
   struct flash_info {
   ~~~~~~~^~~~~~~~~~~~
>> drivers/mtd/devices/st_spi_fsm.c:1427:3: warning: Value stored to 'offs'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   offs =3D 0;
                   ^      ~
   drivers/mtd/devices/st_spi_fsm.c:1427:3: note: Value stored to 'offs' is=
 never read
                   offs =3D 0;
                   ^      ~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/hwtracing/intel_th/sth.c:73:15: warning: Value stored to 'outp' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u64 __iomem *outp =3D &out->Dn;
                        ^~~~   ~~~~~~~~
   drivers/hwtracing/intel_th/sth.c:73:15: note: Value stored to 'outp' dur=
ing its initialization is never read
           u64 __iomem *outp =3D &out->Dn;
                        ^~~~   ~~~~~~~~
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/hwtracing/intel_th/sth.c:70:27: note: Left side of '&&' is false
           struct sth_device *sth =3D container_of(stm_data, struct sth_dev=
ice, stm);
                                    ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwtracing/intel_th/sth.c:70:27: note: Taking false branch
           struct sth_device *sth =3D container_of(stm_data, struct sth_dev=
ice, stm);
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwtracing/intel_th/sth.c:70:27: note: Loop condition is false.  =
Exiting loop
           struct sth_device *sth =3D container_of(stm_data, struct sth_dev=
ice, stm);
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwtracing/intel_th/sth.c:77:6: note: Assuming 'size' is <=3D 4
           if (size > 4)
               ^~~~~~~~
   drivers/hwtracing/intel_th/sth.c:77:2: note: Taking false branch
           if (size > 4)
           ^
   drivers/hwtracing/intel_th/sth.c:81:9: note: '?' condition is false
           size =3D rounddown_pow_of_two(size);
                  ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/hwtracing/intel_th/sth.c:81:9: note: Calling '__rounddown_pow_of=
_two'
           size =3D rounddown_pow_of_two(size);
                  ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:485:2: note: Value stored to 'ret' is never r=
ead
           ret =3D blinkm_transfer_hw(client, BLM_GO_RGB);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:546:18: warning: The left operand of '=3D=3D'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (tmpargs[0] =3D=3D 0x09)
                       ~~~~~~~~~~ ^
   drivers/leds/leds-blinkm.c:528:7: note: Calling 'i2c_check_functionality'
           if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:882:9: note: Assuming the condition is true
           return (func & i2c_get_functionality(adap)) =3D=3D func;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:882:2: note: Returning the value 1, which participat=
es in a condition later
           return (func & i2c_get_functionality(adap)) =3D=3D func;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:528:7: note: Returning from 'i2c_check_functi=
onality'
           if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:528:2: note: Taking false branch
           if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
           ^
   drivers/leds/leds-blinkm.c:537:2: note: Loop condition is true.  Enterin=
g loop body
           while (count > 0) {
           ^
   drivers/leds/leds-blinkm.c:539:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/leds/leds-blinkm.c:539:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/leds/leds-blinkm.c:542:9: note: Calling 'blinkm_read'
                   ret =3D blinkm_read(client, BLM_GET_ADDR, tmpargs);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:320:14: note: Assuming 'i' is >=3D 'retlen'
           for (i =3D 0; i < retlen; i++) {
                       ^~~~~~~~~~
   drivers/leds/leds-blinkm.c:320:2: note: Loop condition is false. Executi=
on continues on line 328
           for (i =3D 0; i < retlen; i++) {
           ^
   drivers/leds/leds-blinkm.c:328:2: note: Returning without writing to '*a=
rg'
           return 0;
           ^
   drivers/leds/leds-blinkm.c:328:2: note: Returning zero, which participat=
es in a condition later
           return 0;
           ^~~~~~~~
   drivers/leds/leds-blinkm.c:542:9: note: Returning from 'blinkm_read'
                   ret =3D blinkm_read(client, BLM_GET_ADDR, tmpargs);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:543:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/leds/leds-blinkm.c:543:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/leds/leds-blinkm.c:546:18: note: The left operand of '=3D=3D' is=
 a garbage value
                   if (tmpargs[0] =3D=3D 0x09)
                       ~~~~~~~~~~ ^
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/input/keyboard/samsung-keypad.c:88:23: warning: The result of th=
e left shift is undefined because the left operand is negative [clang-analy=
zer-core.UndefinedBinaryOperatorResult]
                           val &=3D ~(1 << col) << 8;
                                              ^
   drivers/input/keyboard/samsung-keypad.c:156:3: note: Loop condition is f=
alse.  Exiting loop
                   writel(~0x0, keypad->base + SAMSUNG_KEYIFSTSCLR);
                   ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:166:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/input/keyboard/samsung-keypad.c:158:3: note: Calling 'samsung_ke=
ypad_scan'
                   samsung_keypad_scan(keypad, row_state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:85:16: note: Assuming 'col' is <=
 field 'cols'
           for (col =3D 0; col < keypad->cols; col++) {
                         ^~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:85:2: note: Loop condition is tr=
ue.  Entering loop body
           for (col =3D 0; col < keypad->cols; col++) {
           ^
   drivers/input/keyboard/samsung-keypad.c:86:7: note: Assuming field 'type=
' is equal to KEYPAD_TYPE_S5PV210
                   if (keypad->type =3D=3D KEYPAD_TYPE_S5PV210) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:86:3: note: Taking true branch
                   if (keypad->type =3D=3D KEYPAD_TYPE_S5PV210) {
                   ^
   drivers/input/keyboard/samsung-keypad.c:88:23: note: The result of the l=
eft shift is undefined because the left operand is negative
                           val &=3D ~(1 << col) << 8;
                                  ~~~~~~~~~~~ ^
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/nvmem/sunxi_sid.c:107:2: warning: Null pointer passed as 1st arg=
ument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(val, &word, bytes);
           ^      ~~~
   drivers/nvmem/sunxi_sid.c:89:9: note: Assuming 'bytes' is >=3D 4
           while (bytes >=3D 4) {
                  ^~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:89:2: note: Loop condition is true.  Entering =
loop body
           while (bytes >=3D 4) {
           ^
   drivers/nvmem/sunxi_sid.c:90:9: note: Calling 'sun8i_sid_register_readou=
t'
                   ret =3D sun8i_sid_register_readout(sid, offset, val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:61:2: note: Loop condition is false.  Exiting =
loop
           writel(reg_val, sid->base + SUN8I_SID_PRCTL);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:166:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/nvmem/sunxi_sid.c:63:8: note: '__sleep_us' is not equal to 0
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeo=
ut'
           might_sleep_if((__sleep_us) !=3D 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:160:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/nvmem/sunxi_sid.c:63:8: note: Taking true branch
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:152:29: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                               ^
   include/linux/kernel.h:87:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:152:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
--
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   mm/workingset.c:206:2: warning: Value stored to 'nid' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           nid =3D entry & ((1UL << NODES_SHIFT) - 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/workingset.c:206:2: note: Value stored to 'nid' is never read
           nid =3D entry & ((1UL << NODES_SHIFT) - 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/base/power/main.c:468:3: warning: Value stored to 'usecs' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   usecs =3D 1;
                   ^       ~
   drivers/base/power/main.c:468:3: note: Value stored to 'usecs' is never =
read
                   usecs =3D 1;
                   ^       ~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/video/fbdev/s3c-fb.c:491:16: warning: Value stored to 'buf' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           void __iomem *buf =3D regs;
                         ^~~   ~~~~
   drivers/video/fbdev/s3c-fb.c:491:16: note: Value stored to 'buf' during =
its initialization is never read
           void __iomem *buf =3D regs;
                         ^~~   ~~~~
   drivers/video/fbdev/s3c-fb.c:1201:2: warning: Value stored to 'var' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           var =3D &fbinfo->var;
           ^     ~~~~~~~~~~~~
   drivers/video/fbdev/s3c-fb.c:1201:2: note: Value stored to 'var' is neve=
r read
           var =3D &fbinfo->var;
           ^     ~~~~~~~~~~~~
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/hsi/controllers/omap_ssi_port.c:481:2: warning: Value stored to =
'val' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(ssr + SSI_SSR_MODE_REG);
           ^
   drivers/hsi/controllers/omap_ssi_port.c:481:2: note: Value stored to 'va=
l' is never read
   drivers/hsi/controllers/omap_ssi_port.c:764:2: warning: Value stored to =
'mode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D readl(omap_port->ssr_base + SSI_SSR_MODE_REG);
           ^
   drivers/hsi/controllers/omap_ssi_port.c:764:2: note: Value stored to 'mo=
de' is never read
   drivers/hsi/controllers/omap_ssi_port.c:1332:2: warning: Value stored to=
 'mode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D readl(omap_port->ssr_base + SSI_SSR_MODE_REG);
           ^
   drivers/hsi/controllers/omap_ssi_port.c:1332:2: note: Value stored to 'm=
ode' is never read
   Suppressed 14 warnings (12 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/hsi/clients/ssi_protocol.c:458:21: warning: Value stored to 'cl'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct hsi_client *cl =3D ssi->cl;
                              ^~   ~~~~~~~
   drivers/hsi/clients/ssi_protocol.c:458:21: note: Value stored to 'cl' du=
ring its initialization is never read
           struct hsi_client *cl =3D ssi->cl;
                              ^~   ~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/hwmon/adm1031.c:245:6: warning: Value stored to 'range' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           int range =3D val - AUTO_TEMP_MIN_FROM_REG(reg);
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adm1031.c:245:6: note: Value stored to 'range' during its =
initialization is never read
           int range =3D val - AUTO_TEMP_MIN_FROM_REG(reg);
               ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/misc/lkdtm/bugs.c:93:24: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           *((volatile int *) 0) =3D 0;
           ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/misc/lkdtm/bugs.c:93:24: note: Dereference of null pointer
           *((volatile int *) 0) =3D 0;
           ~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/misc/lkdtm/bugs.c:527:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(target.a, src);
           ^~~~~~
   drivers/misc/lkdtm/bugs.c:527:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(target.a, src);
           ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:400:7: warning: Value stored to=
 'is_hi_req' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           bool is_hi_req =3D pstate =3D=3D AMDGPU_XGMI_PSTATE_MAX_VEGA20;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:400:7: note: Value stored to 'i=
s_hi_req' during its initialization is never read
           bool is_hi_req =3D pstate =3D=3D AMDGPU_XGMI_PSTATE_MAX_VEGA20;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:407:2: warning: Value stored to=
 'request_adev' is never read [clang-analyzer-deadcode.DeadStores]
           request_adev =3D hive->hi_req_gpu ? hive->hi_req_gpu : adev;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:64:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:64:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/iio/chemical/bme680_core.c:741:2: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/bme680_core.c:741:2: note: Value stored to 'ret' is=
 never read
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/rtc/rtc-rs5c372.c:564:2: warning: Value stored to 'addr' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           addr   =3D RS5C_ADDR(RS5C_REG_CTRL1);
           ^
   drivers/rtc/rtc-rs5c372.c:564:2: note: Value stored to 'addr' is never r=
ead
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/rtc/rtc-rx8025.c:165:3: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   status &=3D RX8025_BIT_CTRL2_DAFG;
                   ^
   drivers/rtc/rtc-rx8025.c:165:3: note: Value stored to 'status' is never =
read
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/cpufreq/mediatek-cpufreq.c:305:14: warning: Value stored to 'cpu=
_clk' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct clk *cpu_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/cpufreq/mediatek-cpufreq.c:305:14: note: Value stored to 'cpu_cl=
k' during its initialization is never read
           struct clk *cpu_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~   ~~~~~~~~~~~~~~~~
>> drivers/cpufreq/mediatek-cpufreq.c:306:14: warning: Value stored to 'int=
er_clk' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct clk *inter_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/cpufreq/mediatek-cpufreq.c:306:14: note: Value stored to 'inter_=
clk' during its initialization is never read
           struct clk *inter_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/hwmon/occ/common.c:1108:3: warning: Value stored to 'old_offset'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   old_offset =3D offset;
                   ^            ~~~~~~
   drivers/hwmon/occ/common.c:1108:3: note: Value stored to 'old_offset' is=
 never read
                   old_offset =3D offset;
                   ^            ~~~~~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/i2c/busses/i2c-sis5595.c:229:8: warning: Although the value stor=
ed to 'temp' is used in the enclosing expression, the value is never actual=
ly read from 'temp' [clang-analyzer-deadcode.DeadStores]
                   if ((temp =3D sis5595_read(SMB_STS_LO) + (sis5595_read(S=
MB_STS_HI) << 8)) !=3D 0x00) {
                        ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-sis5595.c:229:8: note: Although the value stored =
to 'temp' is used in the enclosing expression, the value is never actually =
read from 'temp'
                   if ((temp =3D sis5595_read(SMB_STS_LO) + (sis5595_read(S=
MB_STS_HI) << 8)) !=3D 0x00) {
                        ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/i2c/busses/i2c-aspeed.c:253:2: warning: Value stored to 'command=
' is never read [clang-analyzer-deadcode.DeadStores]
           command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
           ^
   drivers/i2c/busses/i2c-aspeed.c:253:2: note: Value stored to 'command' i=
s never read
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
           ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/affs/bitmap.c:320:6: note: Assuming 'mask' is 0
           if (mask) {
               ^~~~
   fs/affs/bitmap.c:320:2: note: Taking false branch
           if (mask) {
           ^
   fs/affs/bitmap.c:337:9: note: Assuming the condition is true
           while (++offset < sb->s_blocksize / 4)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/bitmap.c:337:2: note: Loop condition is true.  Entering loop body
           while (++offset < sb->s_blocksize / 4)
           ^
   fs/affs/bitmap.c:338:14: note: Access to field 'b_data' results in a der=
eference of a null pointer (loaded from variable 'bh')
                   ((__be32 *)bh->b_data)[offset] =3D 0;
                              ^~
   fs/affs/bitmap.c:339:13: warning: Access to field 'b_data' results in a =
dereference of a null pointer (loaded from variable 'bh') [clang-analyzer-c=
ore.NullDereference]
           ((__be32 *)bh->b_data)[0] =3D 0;
                      ^~
   fs/affs/bitmap.c:247:39: note: 'bh' initialized to a null pointer value
           struct buffer_head *bmap_bh =3D NULL, *bh =3D NULL;
                                                ^~
   fs/affs/bitmap.c:253:6: note: Assuming the condition is false
           if (*flags & SB_RDONLY)
               ^~~~~~~~~~~~~~~~~~
   fs/affs/bitmap.c:253:2: note: Taking false branch
           if (*flags & SB_RDONLY)
           ^
   fs/affs/bitmap.c:256:6: note: Assuming field 'bm_flag' is not equal to 0
           if (!AFFS_ROOT_TAIL(sb, sbi->s_root_bh)->bm_flag) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/bitmap.c:256:2: note: Taking false branch
           if (!AFFS_ROOT_TAIL(sb, sbi->s_root_bh)->bm_flag) {
           ^
   fs/affs/bitmap.c:268:23: note: Calling 'kzalloc'
           bm =3D sbi->s_bitmap =3D kzalloc(size, GFP_KERNEL);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:540:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:557:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/bitmap.c:268:23: note: Returning from 'kzalloc'
           bm =3D sbi->s_bitmap =3D kzalloc(size, GFP_KERNEL);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/bitmap.c:269:6: note: Assuming field 's_bitmap' is non-null
           if (!sbi->s_bitmap) {
               ^~~~~~~~~~~~~~
   fs/affs/bitmap.c:269:2: note: Taking false branch
           if (!sbi->s_bitmap) {
           ^
   fs/affs/bitmap.c:278:30: note: Assuming 'i' is <=3D 0
           for (i =3D sbi->s_bmap_count; i > 0; bm++, i--) {
                                       ^~~~~
   fs/affs/bitmap.c:278:2: note: Loop condition is false. Execution continu=
es on line 315
           for (i =3D sbi->s_bmap_count; i > 0; bm++, i--) {
           ^
   fs/affs/bitmap.c:317:2: note: Taking false branch
           pr_debug("last word: %d %d %d\n", offset, offset / 32 + 1, mask);
           ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/affs/bitmap.c:320:6: note: Assuming 'mask' is 0
           if (mask) {
               ^~~~
   fs/affs/bitmap.c:320:2: note: Taking false branch
           if (mask) {
           ^
   fs/affs/bitmap.c:337:9: note: Assuming the condition is false
           while (++offset < sb->s_blocksize / 4)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/bitmap.c:337:2: note: Loop condition is false. Execution continu=
es on line 339
           while (++offset < sb->s_blocksize / 4)
           ^
   fs/affs/bitmap.c:339:13: note: Access to field 'b_data' results in a der=
eference of a null pointer (loaded from variable 'bh')
           ((__be32 *)bh->b_data)[0] =3D 0;
                      ^~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> arch/arm/mach-omap2/id.c:158:2: warning: Value stored to 'rev' is never =
read [clang-analyzer-deadcode.DeadStores]
           rev =3D (idcode >> 28) & 0x0f;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:158:2: note: Value stored to 'rev' is never read
           rev =3D (idcode >> 28) & 0x0f;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:191:3: warning: Value stored to 'j' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   j =3D i;
                   ^   ~
   arch/arm/mach-omap2/id.c:191:3: note: Value stored to 'j' is never read
                   j =3D i;
                   ^   ~
   arch/arm/mach-omap2/id.c:266:2: warning: Value stored to 'n' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           n +=3D scnprintf(buf + n, sizeof(buf) - n, ")\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:266:2: note: Value stored to 'n' is never read
           n +=3D scnprintf(buf + n, sizeof(buf) - n, ")\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:363:3: warning: Value stored to 'cpu_rev' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   cpu_rev =3D "1.0";
                   ^         ~~~~~
   arch/arm/mach-omap2/id.c:363:3: note: Value stored to 'cpu_rev' is never=
 read
                   cpu_rev =3D "1.0";
                   ^         ~~~~~
   arch/arm/mach-omap2/id.c:773:9: warning: 3rd function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                  ^                    ~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:41: note: Calling 'omap_type'
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                                                  ^~~~~~~~~~~
   arch/arm/mach-omap2/id.c:52:2: note: 'val' initialized to 1792
           static u32 val =3D OMAP2_DEVICETYPE_MASK;
           ^~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:54:2: note: Taking false branch
           if (val < OMAP2_DEVICETYPE_MASK)
           ^
   arch/arm/mach-omap2/id.c:57:2: note: Taking false branch
           if (soc_is_omap24xx()) {
           ^
   arch/arm/mach-omap2/id.c:59:9: note: Taking false branch
           } else if (soc_is_ti81xx()) {
                  ^
   arch/arm/mach-omap2/id.c:61:13: note: Left side of '||' is false
           } else if (soc_is_am33xx() || soc_is_am43xx()) {
                      ^
   arch/arm/mach-omap2/soc.h:174:27: note: expanded from macro 'soc_is_am33=
xx'
   #define soc_is_am33xx()                 0
                                           ^
   arch/arm/mach-omap2/id.c:61:9: note: Taking false branch
           } else if (soc_is_am33xx() || soc_is_am43xx()) {
                  ^
   arch/arm/mach-omap2/id.c:63:9: note: Taking false branch
           } else if (soc_is_omap34xx()) {
                  ^
   arch/arm/mach-omap2/id.c:65:9: note: Taking false branch
           } else if (soc_is_omap44xx()) {
                  ^
   arch/arm/mach-omap2/id.c:67:13: note: Left side of '||' is false
           } else if (soc_is_omap54xx() || soc_is_dra7xx()) {
                      ^
   arch/arm/mach-omap2/soc.h:309:29: note: expanded from macro 'soc_is_omap=
54xx'
   # define soc_is_omap54xx()              is_omap54xx()
                                           ^
   arch/arm/mach-omap2/id.c:67:9: note: Taking false branch
           } else if (soc_is_omap54xx() || soc_is_dra7xx()) {
                  ^
   arch/arm/mach-omap2/id.c:74:3: note: Control jumps to line 81
                   goto out;
                   ^
   arch/arm/mach-omap2/id.c:81:2: note: Returning the value 1792 (loaded fr=
om 'val')
           return val;
           ^~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:41: note: Returning from 'omap_type'
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                                                  ^~~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:9: note: 3rd function call argument is an u=
ninitialized value
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                  ^                    ~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   crypto/sha512_generic.c:148:2: warning: Value stored to 'a' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D t1 =3D t2 =3D 0;
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sha512_generic.c:148:2: note: Value stored to 'a' is never read
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D t1 =3D t2 =3D 0;
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sha512_generic.c:148:6: warning: Although the value stored to 'b'=
 is used in the enclosing expression, the value is never actually read from=
 'b' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D t1 =3D t2 =3D 0;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sha512_generic.c:148:6: note: Although the value stored to 'b' is=
 used in the enclosing expression, the value is never actually read from 'b'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D t1 =3D t2 =3D 0;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sha512_generic.c:148:10: warning: Although the value stored to 'c=
' is used in the enclosing expression, the value is never actually read fro=
m 'c' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D t1 =3D t2 =3D 0;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sha512_generic.c:148:10: note: Although the value stored to 'c' i=
s used in the enclosing expression, the value is never actually read from '=
c'
--
           ^
   drivers/gpio/gpio-pca953x.c:450:14: note: Assuming the condition is true
           for (i =3D 0; i < NBANK(chip); i++)
                       ^~~~~~~~~~~~~~~
   drivers/gpio/gpio-pca953x.c:450:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < NBANK(chip); i++)
           ^
   drivers/gpio/gpio-pca953x.c:451:3: note: Calling 'bitmap_set_value8'
                   bitmap_set_value8(val, value[i], i * BANK_SZ);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:573:2: note: 'index' initialized to 0
           const size_t index =3D BIT_WORD(start);
           ^~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:576:13: note: The left expression of the compound=
 assignment is an uninitialized value. The computed value will also be garb=
age
           map[index] &=3D ~(0xFFUL << offset);
           ~~~~~~~~~~ ^
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/gpio/gpio-bcm-kona.c:285:30: warning: The result of the left shi=
ft is undefined due to shifting by '4294967294', which is greater or equal =
to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOp=
eratorResult]
                   if (res > 0 && (debounce & BIT(res - 1)))
                                              ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   drivers/gpio/gpio-bcm-kona.c:315:6: note: Assuming the condition is false
           if (pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUN=
CE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:315:2: note: Taking false branch
           if (pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUN=
CE)
           ^
   drivers/gpio/gpio-bcm-kona.c:319:9: note: Calling 'bcm_kona_gpio_set_deb=
ounce'
           return bcm_kona_gpio_set_debounce(chip, gpio, debounce);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:272:7: note: Assuming 'debounce' is > 0
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
                ^~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:272:7: note: Left side of '&&' is true
   drivers/gpio/gpio-bcm-kona.c:272:23: note: Assuming 'debounce' is >=3D 1=
000
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
                                ^~~~~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:272:6: note: Left side of '||' is false
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
               ^
   drivers/gpio/gpio-bcm-kona.c:272:43: note: Assuming 'debounce' is <=3D 1=
28000
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
                                                    ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:272:2: note: Taking false branch
           if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
           ^
   drivers/gpio/gpio-bcm-kona.c:279:6: note: 'debounce' is not equal to 0
           if (debounce !=3D 0) {
               ^~~~~~~~
   drivers/gpio/gpio-bcm-kona.c:279:2: note: Taking true branch
           if (debounce !=3D 0) {
           ^
   drivers/gpio/gpio-bcm-kona.c:285:7: note: 'res' is > 0
                   if (res > 0 && (debounce & BIT(res - 1)))
                       ^~~
   drivers/gpio/gpio-bcm-kona.c:285:7: note: Left side of '&&' is true
   drivers/gpio/gpio-bcm-kona.c:285:30: note: The result of the left shift =
is undefined due to shifting by '4294967294', which is greater or equal to =
the width of type 'unsigned long'
                   if (res > 0 && (debounce & BIT(res - 1)))
                                              ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (13 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pinctrl/pinctrl-st.c:582:4: warning: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage [clang-analyzer-core.uninitialized.Assign]
                           ST_PINCONF_PACK_OE(*config);
                           ^
   drivers/pinctrl/pinctrl-st.c:138:34: note: expanded from macro 'ST_PINCO=
NF_PACK_OE'
   #define ST_PINCONF_PACK_OE(conf)        ST_PINCONF_PACK(conf, 1, OE)
                                           ^
   drivers/pinctrl/pinctrl-st.c:129:49: note: expanded from macro 'ST_PINCO=
NF_PACK'
   #define ST_PINCONF_PACK(conf, val, param)       (conf |=3D\
                                                         ^
   drivers/pinctrl/pinctrl-st.c:1013:6: note: 'function' is 0
           if (function)
               ^~~~~~~~
   drivers/pinctrl/pinctrl-st.c:1013:2: note: Taking false branch
           if (function)
           ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Left side of '&&' is false
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Taking false branch
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Loop condition is false.  Ex=
iting loop
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pinctrl/pinctrl-st.c:1018:7: note: Calling 'st_gpio_get_directio=
n'
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:739:2: note: 'config' declared without an i=
nitial value
           unsigned long config;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:746:13: note: Calling 'st_pctl_get_pin_func=
tion'
           function =3D st_pctl_get_pin_function(&pc, offset);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:440:6: note: Assuming 'alt' is non-null
           if (!alt)
               ^~~~
   drivers/pinctrl/pinctrl-st.c:440:2: note: Taking false branch
           if (!alt)
           ^
   drivers/pinctrl/pinctrl-st.c:445:2: note: Returning without writing to '=
pc->oe', which participates in a condition later
           return (val >> offset) & 0xf;
           ^
   drivers/pinctrl/pinctrl-st.c:746:13: note: Returning from 'st_pctl_get_p=
in_function'
           function =3D st_pctl_get_pin_function(&pc, offset);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:747:6: note: Assuming 'function' is not equ=
al to 0
           if (function) {
               ^~~~~~~~
   drivers/pinctrl/pinctrl-st.c:747:2: note: Taking true branch
           if (function) {
           ^
   drivers/pinctrl/pinctrl-st.c:748:3: note: Calling 'st_pinconf_get_direct=
ion'
                   st_pinconf_get_direction(&pc, offset, &config);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:579:6: note: Assuming field 'oe' is non-null
           if (pc->oe) {
               ^~~~~~
   drivers/pinctrl/pinctrl-st.c:579:2: note: Taking true branch
           if (pc->oe) {
--
                                  ^~~~~~~~
   note: expanded from here
   include/linux/math64.h:91:15: note: Left side of '&&' is true
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:231:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   arch/arm/include/asm/div64.h:64:31: note: expanded from macro '__div64_c=
onst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   include/linux/math64.h:91:15: note: Left side of '&&' is false
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:232:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   include/linux/math64.h:91:15: note: Assuming the condition is true
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:239:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/math64.h:91:15: note: Taking true branch
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:239:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   include/linux/math64.h:91:2: note: Value assigned to 'mod', which partic=
ipates in a condition later
           *remainder =3D do_div(dividend, divisor);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:5449:3: note: Returning from 'div_u64_rem'
                   div_u64_rem(del.br_startblock, mp->m_sb.sb_rextsize, &mo=
d);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/xfs/libxfs/xfs_bmap.c:5450:7: note: Assuming 'mod' is not equal to 0
                   if (mod) {
                       ^~~
   fs/xfs/libxfs/xfs_bmap.c:5450:3: note: Taking true branch
                   if (mod) {
                   ^
   fs/xfs/libxfs/xfs_bmap.c:5458:8: note: Assuming 'off' is >=3D field 'br_=
blockcount'
                           if (del.br_blockcount > off) {
                               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:5458:4: note: Taking false branch
                           if (del.br_blockcount > off) {
                           ^
   fs/xfs/libxfs/xfs_bmap.c:5462:15: note: Assuming 'start' is equal to fie=
ld 'br_startoff'
                           } else if (del.br_startoff =3D=3D start &&
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:5462:15: note: Left side of '&&' is true
   fs/xfs/libxfs/xfs_bmap.c:5463:9: note: Assuming field 'br_state' is not =
equal to XFS_EXT_UNWRITTEN
                                      (del.br_state =3D=3D XFS_EXT_UNWRITTE=
N ||
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:5463:9: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_bmap.c:5464:9: note: Access to field 't_blk_res' resul=
ts in a dereference of a null pointer (loaded from variable 'tp')
                                       tp->t_blk_res =3D=3D 0)) {
                                       ^~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/controller/pci-v3-semi.c:604:6: warning: Value stored to 'pc=
i_end' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-v3-semi.c:604:6: note: Value stored to 'pci_e=
nd' during its initialization is never read
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/controller/pci-versatile.c:37:10: warning: Although the valu=
e stored to 'retval' is used in the enclosing expression, the value is neve=
r actually read from 'retval' [clang-analyzer-deadcode.DeadStores]
           while ((retval =3D get_option(&str, &slot))) {
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-versatile.c:37:10: note: Although the value s=
tored to 'retval' is used in the enclosing expression, the value is never a=
ctually read from 'retval'
           while ((retval =3D get_option(&str, &slot))) {
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/pci/controller/pcie-iproc.c:861:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:861:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:1065:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:1065:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   arch/arm/mach-omap2/omap_hwmod.c:3587:3: warning: Value stored to 'error=
' is never read [clang-analyzer-deadcode.DeadStores]
                   error =3D _register(oh);
                   ^       ~~~~~~~~~~~~~
   arch/arm/mach-omap2/omap_hwmod.c:3587:3: note: Value stored to 'error' i=
s never read
                   error =3D _register(oh);
                   ^       ~~~~~~~~~~~~~
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/soc/tegra/pmc.c:1126:11: warning: Use of memory after it is free=
d [clang-analyzer-unix.Malloc]
                   clk_put(pg->clks[pg->num_clks]);
                           ^
   drivers/soc/tegra/pmc.c:2457:14: note: Assuming field 'base' is non-null
           if (WARN_ON(!pmc->base || !pmc->soc))
                       ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/soc/tegra/pmc.c:2457:14: note: Left side of '||' is false
           if (WARN_ON(!pmc->base || !pmc->soc))
                       ^
   drivers/soc/tegra/pmc.c:2457:28: note: Assuming field 'soc' is non-null
           if (WARN_ON(!pmc->base || !pmc->soc))
                                     ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/soc/tegra/pmc.c:2457:2: note: Taking false branch
           if (WARN_ON(!pmc->base || !pmc->soc))
           ^
   drivers/soc/tegra/pmc.c:2461:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   drivers/soc/tegra/pmc.c:2461:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/soc/tegra/pmc.c:2467:2: note: Taking false branch
           if (IS_ERR(base))
           ^
   drivers/soc/tegra/pmc.c:2471:6: note: Assuming 'res' is null
           if (res) {
               ^~~
   drivers/soc/tegra/pmc.c:2471:2: note: Taking false branch
           if (res) {
           ^
   drivers/soc/tegra/pmc.c:2480:6: note: Assuming 'res' is null
           if (res) {
               ^~~
   drivers/soc/tegra/pmc.c:2480:2: note: Taking false branch
           if (res) {
           ^
   drivers/soc/tegra/pmc.c:2489:6: note: Assuming 'res' is null
           if (res) {
               ^~~
   drivers/soc/tegra/pmc.c:2489:2: note: Taking false branch
           if (res) {
           ^
   drivers/soc/tegra/pmc.c:2498:2: note: Taking false branch
           if (IS_ERR(pmc->clk)) {
           ^
   drivers/soc/tegra/pmc.c:2514:6: note: Assuming field 'clk' is null
           if (pmc->clk) {
               ^~~~~~~~
   drivers/soc/tegra/pmc.c:2514:2: note: Taking false branch
           if (pmc->clk) {
           ^
   drivers/soc/tegra/pmc.c:2534:2: note: Taking true branch
           if (IS_ENABLED(CONFIG_DEBUG_FS)) {
           ^
   drivers/soc/tegra/pmc.c:2536:7: note: 'err' is >=3D 0
                   if (err < 0)
--
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/setup-bus.c:447:2: note: Loop condition is false. Execution =
continues on line 457
           list_for_each_entry_safe(dev_res, tmp_res, head, list)
           ^
   include/linux/list.h:715:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/pci/setup-bus.c:459:2: note: Left side of '&&' is false
           list_for_each_entry(dev_res, head, list)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/setup-bus.c:459:2: note: Taking false branch
           list_for_each_entry(dev_res, head, list)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pci/setup-bus.c:459:2: note: Loop condition is false.  Exiting l=
oop
           list_for_each_entry(dev_res, head, list)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/setup-bus.c:459:2: note: Loop condition is true.  Entering l=
oop body
           list_for_each_entry(dev_res, head, list)
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/setup-bus.c:460:7: note: Use of memory after it is freed
                   if (dev_res->res->parent)
                       ^~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   4 warnings generated.
>> drivers/bus/omap_l3_noc.c:96:3: warning: Value stored to 'err_descriptio=
n' is never read [clang-analyzer-deadcode.DeadStores]
                   err_description =3D "Standard";
                   ^                 ~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:96:3: note: Value stored to 'err_description' =
is never read
                   err_description =3D "Standard";
                   ^                 ~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:107:3: warning: Value stored to 'err_descripti=
on' is never read [clang-analyzer-deadcode.DeadStores]
                   err_description =3D "Custom";
                   ^                 ~~~~~~~~
   drivers/bus/omap_l3_noc.c:107:3: note: Value stored to 'err_description'=
 is never read
                   err_description =3D "Custom";
                   ^                 ~~~~~~~~
>> drivers/bus/omap_l3_noc.c:127:4: warning: Value stored to 'master_name' =
is never read [clang-analyzer-deadcode.DeadStores]
                           master_name =3D master->name;
                           ^             ~~~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:127:4: note: Value stored to 'master_name' is =
never read
                           master_name =3D master->name;
                           ^             ~~~~~~~~~~~~
>> drivers/bus/omap_l3_noc.c:132:2: warning: Value stored to 'op_code' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           op_code =3D readl_relaxed(l3_targ_hdr) & 0x7;
           ^
   drivers/bus/omap_l3_noc.c:132:2: note: Value stored to 'op_code' is neve=
r read
   16 warnings generated.
   drivers/gpu/drm/amd/amdgpu/atom.c:959:2: warning: Value stored to 'dst' =
is never read [clang-analyzer-deadcode.DeadStores]
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:959:2: note: Value stored to 'dst' is =
never read
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:978:2: warning: Value stored to 'dst' =
is never read [clang-analyzer-deadcode.DeadStores]
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:978:2: note: Value stored to 'dst' is =
never read
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/ti/clockdomain.c:115:2: warning: Value stored to 'clk_name' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk_name =3D __clk_get_name(hw->clk);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clockdomain.c:115:2: note: Value stored to 'clk_name' is =
never read
           clk_name =3D __clk_get_name(hw->clk);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/clk/ti/divider.c:240:9: warning: Division by zero [clang-analyze=
r-core.DivideZero]
           return DIV_ROUND_UP(*prate, div);
                  ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/ti/divider.c:238:8: note: Calling 'ti_clk_divider_bestdiv'
           div =3D ti_clk_divider_bestdiv(hw, rate, prate);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/divider.c:179:37: note: Left side of '&&' is false
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/ti/divider.c:179:37: note: Taking false branch
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/clk/ti/divider.c:179:37: note: Loop condition is false.  Exiting=
 loop
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/clk/ti/divider.c:184:6: note: Assuming 'rate' is not equal to 0
           if (!rate)
               ^~~~~
   drivers/clk/ti/divider.c:184:2: note: Taking false branch
           if (!rate)
           ^
   drivers/clk/ti/divider.c:189:6: note: Assuming the condition is false
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/divider.c:189:2: note: Taking false branch
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
           ^
   drivers/clk/ti/divider.c:201:11: note: Assuming '__UNIQUE_ID___x112' is =
>=3D '__UNIQUE_ID___y113'
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/clk/ti/divider.c:201:11: note: '?' condition is false
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
--
   fs/xfs/xfs_log.c:2352:3: note: Taking true branch
                   if (!*start_lsn)
                   ^
   fs/xfs/xfs_log.c:2353:17: note: '?' condition is false
                           *start_lsn =3D be64_to_cpu(iclog->ic_header.h_ls=
n);
                                        ^
   include/linux/byteorder/generic.h:93:21: note: expanded from macro 'be64=
_to_cpu'
   #define be64_to_cpu __be64_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:38:26: note: expanded from =
macro '__be64_to_cpu'
   #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
                            ^
   include/uapi/linux/swab.h:131:3: note: expanded from macro '__swab64'
           (__builtin_constant_p((__u64)(x)) ?     \
            ^
   fs/xfs/xfs_log.c:2359:10: note: 'lv' is non-null
                   while (lv && (!lv->lv_niovecs || index < lv->lv_niovecs)=
) {
                          ^~
   fs/xfs/xfs_log.c:2359:10: note: Left side of '&&' is true
   fs/xfs/xfs_log.c:2359:22: note: Field 'lv_niovecs' is 1
                   while (lv && (!lv->lv_niovecs || index < lv->lv_niovecs)=
) {
                                      ^
   fs/xfs/xfs_log.c:2359:17: note: Left side of '||' is false
                   while (lv && (!lv->lv_niovecs || index < lv->lv_niovecs)=
) {
                                 ^
   fs/xfs/xfs_log.c:2359:3: note: Loop condition is true.  Entering loop bo=
dy
                   while (lv && (!lv->lv_niovecs || index < lv->lv_niovecs)=
) {
                   ^
   fs/xfs/xfs_log.c:2367:4: note: Taking false branch
                           if (lv->lv_buf_len =3D=3D XFS_LOG_VEC_ORDERED) {
                           ^
   fs/xfs/xfs_log.c:2382:8: note: 'need_start_rec' is false
                           if (need_start_rec) {
                               ^~~~~~~~~~~~~~
   fs/xfs/xfs_log.c:2382:4: note: Taking false branch
                           if (need_start_rec) {
                           ^
   fs/xfs/xfs_log.c:2388:12: note: Calling 'xlog_write_setup_ophdr'
                           ophdr =3D xlog_write_setup_ophdr(log, ptr, ticke=
t, flags);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/xfs/xfs_log.c:2129:18: note: '?' condition is false
           ophdr->oh_tid =3D cpu_to_be32(ticket->t_tid);
                           ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^
   include/uapi/linux/byteorder/little_endian.h:39:43: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                             ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   fs/xfs/xfs_log.c:2141:2: note: Control jumps to 'case 170:'  at line 2144
           switch (ophdr->oh_clientid)  {
           ^
   fs/xfs/xfs_log.c:2145:3: note:  Execution continues on line 2153
                   break;
                   ^
   fs/xfs/xfs_log.c:2153:2: note: Returning pointer (loaded from 'ophdr'), =
which participates in a condition later
           return ophdr;
           ^~~~~~~~~~~~
   fs/xfs/xfs_log.c:2388:12: note: Returning from 'xlog_write_setup_ophdr'
                           ophdr =3D xlog_write_setup_ophdr(log, ptr, ticke=
t, flags);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/xfs/xfs_log.c:2389:9: note: 'ophdr' is non-null
                           if (!ophdr)
                                ^~~~~
   fs/xfs/xfs_log.c:2389:4: note: Taking false branch
                           if (!ophdr)
                           ^
   fs/xfs/xfs_log.c:2412:8: note: Assuming 'copy_len' is > 0
                           if (copy_len > 0) {
                               ^~~~~~~~~~~~
   fs/xfs/xfs_log.c:2412:4: note: Taking true branch
                           if (copy_len > 0) {
                           ^
   fs/xfs/xfs_log.c:2413:5: note: Null pointer passed as 2nd argument to me=
mory copy function
                                   memcpy(ptr, reg->i_addr + copy_off, copy=
_len);
                                   ^           ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/omapdrm/omap_crtc.c:234:21: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:234:21: note: Value stored to 'dev' =
during its initialization is never read
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:253:21: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:253:21: note: Value stored to 'dev' =
during its initialization is never read
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/omapdrm/omap_encoder.c:104:16: warning: Access to field =
'bridge' results in a dereference of a null pointer (loaded from variable '=
output') [clang-analyzer-core.NullDereference]
           for (bridge =3D output->bridge; bridge;
                         ^~~~~~
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Left side of '&&' is=
 false
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Taking false branch
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Loop condition is fa=
lse.  Exiting loop
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:77:2: note: 'output' initialized =
here
           struct omap_dss_device *output =3D omap_encoder->output;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_encoder.c:85:2: note: Left side of '&&' is =
false
           list_for_each_entry(connector, &dev->mode_config.connector_list,=
 head) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:85:2: note: Taking false branch
           list_for_each_entry(connector, &dev->mode_config.connector_list,=
 head) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
--
           if (priv->fbdev) {
           ^
   drivers/gpu/drm/msm/msm_debugfs.c:156:2: note: Left side of '&&' is false
           list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/msm/msm_debugfs.c:156:2: note: Taking false branch
           list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/msm/msm_debugfs.c:156:2: note: Loop condition is false. =
 Exiting loop
           list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/msm/msm_debugfs.c:156:22: note: Value assigned to 'fb'
           list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
                               ^
   include/linux/list.h:628:7: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_debugfs.c:156:2: note: Loop condition is true.  =
Entering loop body
           list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/gpu/drm/msm/msm_debugfs.c:157:7: note: Assuming 'fb' is equal to=
 'fbdev_fb'
                   if (fb =3D=3D fbdev_fb)
                       ^~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_debugfs.c:157:3: note: Taking true branch
                   if (fb =3D=3D fbdev_fb)
                   ^
   drivers/gpu/drm/msm/msm_debugfs.c:158:4: note:  Execution continues on l=
ine 156
                           continue;
                           ^
   drivers/gpu/drm/msm/msm_debugfs.c:156:2: note: Dereference of null point=
er
           list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
           ^
   include/linux/list.h:630:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:693:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/clk/spear/spear1310_clock.c:872:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_30m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:872:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_30m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:879:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_48m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:879:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_48m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:896:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spear/spear1310_clock.c:896:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spear/spear1310_clock.c:899:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, 0, 5=
0000000);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/clk/spear/spear1310_clock.c:899:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, 0, 5=
0000000);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/exynos/exynos_mixer.c:464:9: warning: The result of the =
left shift is undefined because the left operand is negative [clang-analyze=
r-core.UndefinedBinaryOperatorResult]
                                       MXR_LAYER_CFG_GRP0_MASK);
                                       ^
   drivers/gpu/drm/exynos/regs-mixer.h:153:34: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_MASK'
   #define MXR_LAYER_CFG_GRP0_MASK         MXR_LAYER_CFG_GRP0_VAL(~0)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:152:35: note: expanded from macro 'M=
XR_LAYER_CFG_GRP0_VAL'
   #define MXR_LAYER_CFG_GRP0_VAL(x)       MXR_MASK_VAL(x, 7, 4)
                                           ^
   drivers/gpu/drm/exynos/regs-mixer.h:70:10: note: expanded from macro 'MX=
R_MASK_VAL'
           (((val) << (low_bit)) & MXR_MASK(high_bit, low_bit))
                   ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1026:6: note: Assuming the conditi=
on is false
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:1026:2: note: Taking false branch
           if (!test_bit(MXR_BIT_POWERED, &ctx->flags))
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1032:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < MIXER_WIN_NR; i++)
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:1033:3: note: Calling 'mixer_disab=
le_plane'
                   mixer_disable_plane(crtc, &ctx->planes[i]);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:973:6: note: Assuming the conditio=
n is false
           if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/exynos/exynos_mixer.c:973:2: note: Taking false branch
           if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:976:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&mixer_ctx->reg_slock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/gpu/drm/exynos/exynos_mixer.c:976:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&mixer_ctx->reg_slock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/gpu/drm/exynos/exynos_mixer.c:977:2: note: Calling 'mixer_cfg_la=
yer'
           mixer_cfg_layer(mixer_ctx, plane->index, 0, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/misc/lkdtm/heap.c:48:15: warning: Use of memory after it is free=
d [clang-analyzer-unix.Malloc]
           base[offset] =3D 0x0abcdef0;
           ~~~~~~~~~~~~ ^
   drivers/misc/lkdtm/heap.c:42:6: note: Assuming 'base' is non-null
           if (!base)
               ^~~~~
   drivers/misc/lkdtm/heap.c:42:2: note: Taking false branch
           if (!base)
           ^
   drivers/misc/lkdtm/heap.c:47:2: note: Memory is released
           kfree(base);
           ^~~~~~~~~~~
   drivers/misc/lkdtm/heap.c:48:15: note: Use of memory after it is freed
           base[offset] =3D 0x0abcdef0;
           ~~~~~~~~~~~~ ^
   drivers/misc/lkdtm/heap.c:88:8: warning: Use of memory after it is freed=
 [clang-analyzer-unix.Malloc]
           saw =3D base[offset];
                 ^~~~~~~~~~~~
   drivers/misc/lkdtm/heap.c:69:6: note: Assuming 'base' is non-null
           if (!base) {
               ^~~~~
   drivers/misc/lkdtm/heap.c:69:2: note: Taking false branch
           if (!base) {
           ^
   drivers/misc/lkdtm/heap.c:75:6: note: Assuming 'val' is non-null
           if (!val) {
               ^~~~
   drivers/misc/lkdtm/heap.c:75:2: note: Taking false branch
           if (!val) {
           ^
   drivers/misc/lkdtm/heap.c:85:2: note: Memory is released
           kfree(base);
           ^~~~~~~~~~~
   drivers/misc/lkdtm/heap.c:88:8: note: Use of memory after it is freed
           saw =3D base[offset];
                 ^~~~~~~~~~~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clk/ti/apll.c:100:2: warning: Value stored to 'state' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           state <<=3D __ffs(ad->idlest_mask);
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/apll.c:100:2: note: Value stored to 'state' is never read
           state <<=3D __ffs(ad->idlest_mask);
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> drivers/clk/ti/clkt_dpll.c:305:2: warning: Value stored to 'clk_name' is=
 never read [clang-analyzer-deadcode.DeadStores]
           clk_name =3D clk_hw_get_name(hw);
           ^          ~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clkt_dpll.c:305:2: note: Value stored to 'clk_name' is ne=
ver read
           clk_name =3D clk_hw_get_name(hw);
           ^          ~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/clk/ti/clkt_dflt.c:234:2: warning: Value stored to 'v' is never =
read [clang-analyzer-deadcode.DeadStores]
           v =3D ti_clk_ll_ops->clk_readl(&clk->enable_reg); /* OCP barrier=
 */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clkt_dflt.c:234:2: note: Value stored to 'v' is never read
           v =3D ti_clk_ll_ops->clk_readl(&clk->enable_reg); /* OCP barrier=
 */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_powertune.c:978:3:=
 warning: Value stored to 'value' is never read [clang-analyzer-deadcode.De=
adStores]
                   value =3D 0;
                   ^       ~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_powertune.c:978:3:=
 note: Value stored to 'value' is never read
                   value =3D 0;
                   ^       ~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:803:15: warning: Access to field 'count' results in a dereference of a nu=
ll pointer (loaded from field 'vdd_dep_on_sclk') [clang-analyzer-core.NullD=
ereference]
           pcie_count =3D table_info->vdd_dep_on_sclk->count;
                        ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1155:23: note: Assuming field 'pptable' is not equal to null
           PP_ASSERT_WITH_CODE((hwmgr->pptable !=3D NULL),
                                ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:9: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                         ^~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1155:2: note: Taking false branch
           PP_ASSERT_WITH_CODE((hwmgr->pptable !=3D NULL),
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:3: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1155:2: note: Loop condition is false.  Exiting loop
           PP_ASSERT_WITH_CODE((hwmgr->pptable !=3D NULL),
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:38:2: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
           do {                                    \
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1160:23: note: 'powerplay_table' is not equal to null
           PP_ASSERT_WITH_CODE((powerplay_table !=3D NULL),
                                ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:9: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                         ^~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1160:2: note: Taking false branch
           PP_ASSERT_WITH_CODE((powerplay_table !=3D NULL),
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:3: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1160:2: note: Loop condition is false.  Exiting loop
           PP_ASSERT_WITH_CODE((powerplay_table !=3D NULL),
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:38:2: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
           do {                                    \
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1165:23: note: 'result' is equal to 0
           PP_ASSERT_WITH_CODE((result =3D=3D 0),
                                ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:9: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                         ^~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1165:2: note: Taking false branch
           PP_ASSERT_WITH_CODE((result =3D=3D 0),
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:3: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1165:2: note: Loop condition is false.  Exiting loop
           PP_ASSERT_WITH_CODE((result =3D=3D 0),
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:38:2: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
           do {                                    \
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1171:23: note: 'result' is equal to 0
           PP_ASSERT_WITH_CODE((result =3D=3D 0),
                                ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:9: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                         ^~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1171:2: note: Taking false branch
           PP_ASSERT_WITH_CODE((result =3D=3D 0),
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:3: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:1171:2: note: Loop condition is false.  Exiting loop
           PP_ASSERT_WITH_CODE((result =3D=3D 0),
           ^
--
                                            ~~~~~~~~~ ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:78:8: note: Calling 'clk_=
prepare_enable'
           ret =3D clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:929:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:929:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:932:6: note: Assuming 'ret' is 0, which participates=
 in a condition later
           if (ret)
               ^~~
   include/linux/clk.h:932:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:935:2: note: Returning zero (loaded from 'ret'), whi=
ch participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:78:8: note: Returning fro=
m 'clk_prepare_enable'
           ret =3D clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:79:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:79:2: note: Taking false =
branch
           if (ret)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:104:6: note: Assuming fie=
ld 'fixed_clksrc' is true
           if (!crtc->dc->desc->fixed_clksrc) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:104:2: note: Taking false=
 branch
           if (!crtc->dc->desc->fixed_clksrc) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:111:6: note: Assuming 'di=
v' is >=3D 2
           if (div < 2) {
               ^~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:111:2: note: Taking false=
 branch
           if (div < 2) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:113:13: note: Assuming th=
e condition is true
           } else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
                      ^
   include/linux/mfd/atmel-hlcdc.h:44:34: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:113:9: note: Taking true =
branch
           } else if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK) {
                  ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:118:7: note: Assuming the=
 condition is true
                   if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
                       ^
   include/linux/mfd/atmel-hlcdc.h:44:34: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:118:3: note: Taking true =
branch
                   if (ATMEL_HLCDC_CLKDIV(div) & ~ATMEL_HLCDC_CLKDIV_MASK)
                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c:134:9: note: The result o=
f the left shift is undefined due to shifting '16711678' by '16', which is =
unrepresentable in the unsigned version of the return type 'int'
           cfg |=3D ATMEL_HLCDC_CLKDIV(div);
                  ^
   include/linux/mfd/atmel-hlcdc.h:44:45: note: expanded from macro 'ATMEL_=
HLCDC_CLKDIV'
   #define ATMEL_HLCDC_CLKDIV(div)         ((div - 2) << ATMEL_HLCDC_CLKDIV=
_SHFT)
                                            ~~~~~~~~~ ^
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/imx/clk-imx6q.c:251:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents=
",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/imx/clk-imx6q.c:251:2: note: Value stored to 'ret' is never =
read
           ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents=
",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   arch/arm/mach-tegra/reset.c:44:2: warning: Value stored to 'reg' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           reg =3D readl(evp_cpu_reset);
           ^
   arch/arm/mach-tegra/reset.c:44:2: note: Value stored to 'reg' is never r=
ead
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/pinctrl/aspeed/pinctrl-aspeed.c:183:4: warning: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureA=
PI.strcpy]
                           strcat(found, str);
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:183:4: note: Call to function 's=
trcat' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcat'. CWE-119
                           strcat(found, str);
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:184:4: warning: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureA=
PI.strcpy]
                           strcat(found, ", ");
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:184:4: note: Call to function 's=
trcat' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcat'. CWE-119
                           strcat(found, ", ");
                           ^~~~~~
   1 warning generated.
>> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2660:5: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D regmap_update_bits(ctx->maps[des=
c->ip],
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2660:5: note: Value stored to=
 'ret' is never read
                                   ret =3D regmap_update_bits(ctx->maps[des=
c->ip],
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   mm/shmem.c:1087:24: warning: Value stored to 'sbinfo' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct shmem_sb_info *sbinfo =3D SHMEM_SB(inode->i_sb);
                                 ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1087:24: note: Value stored to 'sbinfo' during its initializa=
tion is never read
           struct shmem_sb_info *sbinfo =3D SHMEM_SB(inode->i_sb);
                                 ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1542:29: warning: The result of the left shift is undefined b=
ecause the right operand is negative [clang-analyzer-core.UndefinedBinaryOp=
eratorResult]
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:24: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                          ^
   include/linux/math.h:34:50: note: expanded from macro 'round_down'
   #define round_down(x, y) ((x) & ~__round_mask(x, y))
                                    ~~~~~~~~~~~~~~~~^~
   include/linux/math.h:14:46: note: expanded from macro '__round_mask'
   #define __round_mask(x, y) ((__typeof__(x))((y)-1))
                                                ^
   mm/shmem.c:1542:29: note: Taking true branch
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:26: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                            ^
   include/linux/huge_mm.h:106:26: note: expanded from macro 'HPAGE_PMD_ORD=
ER'
   #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                            ^
   include/linux/huge_mm.h:325:28: note: expanded from macro 'HPAGE_PMD_SHI=
FT'
   #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                              ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/shmem.c:1542:29: note: Loop condition is false.  Exiting loop
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:26: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                            ^
   include/linux/huge_mm.h:106:26: note: expanded from macro 'HPAGE_PMD_ORD=
ER'
   #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                            ^
   include/linux/huge_mm.h:325:28: note: expanded from macro 'HPAGE_PMD_SHI=
FT'
   #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                              ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/shmem.c:1542:29: note: The result of the left shift is undefined beca=
use the right operand is negative
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:24: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                          ^
   include/linux/math.h:34:50: note: expanded from macro 'round_down'
   #define round_down(x, y) ((x) & ~__round_mask(x, y))
                                    ~~~~~~~~~~~~~~~~^~
   include/linux/math.h:14:46: note: expanded from macro '__round_mask'
   #define __round_mask(x, y) ((__typeof__(x))((y)-1))
                                                ^
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/clk/tegra/clk-tegra114.c:910:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:910:2: note: Value stored to 'clk' is n=
ever read
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: note: Value stored to 'clk' is n=
ever read
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: note: Value stored to 'clk' is n=
ever read
           clk =3D clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:1049:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
           ^
   drivers/clk/tegra/clk-tegra114.c:1049:2: note: Value stored to 'clk' is =
never read
   2 warnings generated.
>> drivers/clk/tegra/clk-tegra124.c:1098:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1098:2: note: Value stored to 'clk' is =
never read
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: note: Value stored to 'clk' is =
never read
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (12 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/omapdrm/omap_fb.c:397:14: warning: 1st function call arg=
ument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   if (size > omap_gem_mmap_size(bos[i]) - mode_cmd->offset=
s[i]) {
                              ^
   drivers/gpu/drm/omapdrm/omap_fb.c:313:14: note: Assuming 'i' is >=3D 'nu=
m_planes'
           for (i =3D 0; i < num_planes; i++) {
                       ^~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_fb.c:313:2: note: Loop condition is false. =
Execution continues on line 321
           for (i =3D 0; i < num_planes; i++) {
           ^
   drivers/gpu/drm/omapdrm/omap_fb.c:321:7: note: Calling 'omap_framebuffer=
_init'
           fb =3D omap_framebuffer_init(dev, mode_cmd, bos);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_fb.c:349:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(formats); i++) {
           ^
   drivers/gpu/drm/omapdrm/omap_fb.c:350:7: note: Assuming the condition is=
 true
                   if (formats[i] =3D=3D mode_cmd->pixel_format)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_fb.c:350:3: note: Taking true branch
                   if (formats[i] =3D=3D mode_cmd->pixel_format)
                   ^
   drivers/gpu/drm/omapdrm/omap_fb.c:351:4: note:  Execution continues on l=
ine 354
                           break;
                           ^
   drivers/gpu/drm/omapdrm/omap_fb.c:354:6: note: Assuming 'format' is non-=
null
           if (!format || i =3D=3D ARRAY_SIZE(formats)) {
               ^~~~~~~
   drivers/gpu/drm/omapdrm/omap_fb.c:354:6: note: Left side of '||' is false
   drivers/gpu/drm/omapdrm/omap_fb.c:354:2: note: Taking false branch
           if (!format || i =3D=3D ARRAY_SIZE(formats)) {
           ^
   drivers/gpu/drm/omapdrm/omap_fb.c:361:12: note: Calling 'kzalloc'
           omap_fb =3D kzalloc(sizeof(*omap_fb), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:540:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:557:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_fb.c:361:12: note: Returning from 'kzalloc'
           omap_fb =3D kzalloc(sizeof(*omap_fb), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_fb.c:362:6: note: Assuming 'omap_fb' is non=
-null
           if (!omap_fb) {
               ^~~~~~~~
   drivers/gpu/drm/omapdrm/omap_fb.c:362:2: note: Taking false branch
           if (!omap_fb) {
           ^
   drivers/gpu/drm/omapdrm/omap_fb.c:369:2: note: Loop condition is false. =
 Exiting loop
           mutex_init(&omap_fb->lock);
           ^
   include/linux/mutex.h:115:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/gpu/drm/omapdrm/omap_fb.c:376:6: note: Assuming field 'num_plane=
s' is not equal to 2
           if (format->num_planes =3D=3D 2 && pitch !=3D mode_cmd->pitches[=
1]) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_fb.c:376:30: note: Left side of '&&' is fal=
se
           if (format->num_planes =3D=3D 2 && pitch !=3D mode_cmd->pitches[=
1]) {
                                       ^
--
           do {                                                            \
           ^
   drivers/gpu/drm/drm_file.c:593:7: note: 'e' is not equal to NULL
                   if (e =3D=3D NULL) {
                       ^
   drivers/gpu/drm/drm_file.c:593:3: note: Taking false branch
                   if (e =3D=3D NULL) {
                   ^
   drivers/gpu/drm/drm_file.c:612:8: note: Assuming the condition is false
                           if (length > count - ret) {
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:612:4: note: Taking false branch
                           if (length > count - ret) {
                           ^
   drivers/gpu/drm/drm_file.c:623:8: note: Assuming the condition is false
                           if (copy_to_user(buffer + ret, e->event, length)=
) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:623:4: note: Taking false branch
                           if (copy_to_user(buffer + ret, e->event, length)=
) {
                           ^
   drivers/gpu/drm/drm_file.c:630:4: note: Memory is released
                           kfree(e);
                           ^~~~~~~~
   drivers/gpu/drm/drm_file.c:581:2: note: Loop condition is true.  Enterin=
g loop body
           for (;;) {
           ^
   drivers/gpu/drm/drm_file.c:585:7: note: Assuming the condition is true
                   if (!list_empty(&file_priv->event_list)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:585:3: note: Taking true branch
                   if (!list_empty(&file_priv->event_list)) {
                   ^
   drivers/gpu/drm/drm_file.c:586:8: note: Left side of '&&' is false
                           e =3D list_first_entry(&file_priv->event_list,
                               ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/drm_file.c:586:8: note: Taking false branch
                           e =3D list_first_entry(&file_priv->event_list,
                               ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/drm_file.c:586:8: note: Loop condition is false.  Exitin=
g loop
                           e =3D list_first_entry(&file_priv->event_list,
                               ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/drm_file.c:588:30: note: Use of memory after it is freed
                           file_priv->event_space +=3D e->event->length;
                                                     ^~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/sti/sti_hqvdp.c:741:6: warning: Division by zero [clang-=
analyzer-core.DivideZero]
           lfw /=3D max(src_w, dst_w) * mode->clock / 1000;
               ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Left side of '&&' is false
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Taking false branch
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Loop condition is false. =
 Exiting loop
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Left side of '&&' is false
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Taking false branch
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Loop condition is false. =
 Exiting loop
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
--
   drivers/dma-buf/dma-buf.c:365:3: note: Taking false branch
                   if (copy_from_user(&sync, (void __user *) arg, sizeof(sy=
nc)))
                   ^
   drivers/dma-buf/dma-buf.c:368:7: note: Assuming the condition is false
                   if (sync.flags & ~DMA_BUF_SYNC_VALID_FLAGS_MASK)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:368:3: note: Taking false branch
                   if (sync.flags & ~DMA_BUF_SYNC_VALID_FLAGS_MASK)
                   ^
   drivers/dma-buf/dma-buf.c:371:3: note: Control jumps to 'case 3:'  at li=
ne 378
                   switch (sync.flags & DMA_BUF_SYNC_RW) {
                   ^
   drivers/dma-buf/dma-buf.c:380:4: note:  Execution continues on line 385
                           break;
                           ^
   drivers/dma-buf/dma-buf.c:385:7: note: Assuming the condition is true
                   if (sync.flags & DMA_BUF_SYNC_END)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:385:3: note: Taking true branch
                   if (sync.flags & DMA_BUF_SYNC_END)
                   ^
   drivers/dma-buf/dma-buf.c:386:33: note: Passing value via 1st parameter =
'dmabuf'
                           ret =3D dma_buf_end_cpu_access(dmabuf, direction=
);
                                                        ^~~~~~
   drivers/dma-buf/dma-buf.c:386:10: note: Calling 'dma_buf_end_cpu_access'
                           ret =3D dma_buf_end_cpu_access(dmabuf, direction=
);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:1142:10: note: Assuming 'dmabuf' is null
           WARN_ON(!dmabuf);
                   ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/dma-buf/dma-buf.c:1144:6: note: Access to field 'ops' results in=
 a dereference of a null pointer (loaded from variable 'dmabuf')
           if (dmabuf->ops->end_cpu_access)
               ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/phy/mediatek/phy-mtk-xsphy.c:211:6: warning: Value stored to 'in=
dex' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-xsphy.c:211:6: note: Value stored to 'index=
' during its initialization is never read
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-xsphy.c:230:6: warning: Value stored to 'in=
dex' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-xsphy.c:230:6: note: Value stored to 'index=
' during its initialization is never read
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/tty/serial/uartlite.c:368:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret =3D uart_in32(ULITE_CONTROL, port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/uartlite.c:368:2: note: Value stored to 'ret' is neve=
r read
           ret =3D uart_in32(ULITE_CONTROL, port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/tty/serial/omap-serial.c:1176:3: warning: Value stored to 'tmout=
' is never read [clang-analyzer-deadcode.DeadStores]
                   tmout =3D 1000000;
                   ^       ~~~~~~~
   drivers/tty/serial/omap-serial.c:1176:3: note: Value stored to 'tmout' i=
s never read
                   tmout =3D 1000000;
                   ^       ~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c:243:3: warning: Value stored to =
'temp' is never read [clang-analyzer-deadcode.DeadStores]
                   temp =3D hdmi_read_reg(core->base, HDMI_CEC_INT_STATUS_1=
);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c:243:3: note: Value stored to 'te=
mp' is never read
                   temp =3D hdmi_read_reg(core->base, HDMI_CEC_INT_STATUS_1=
);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/rcar-du/rcar_du_group.c:335:10: warning: Assigned value =
is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                           doflr |=3D doflr_values[i];
                                 ^
   drivers/gpu/drm/rcar-du/rcar_du_group.c:353:6: note: Assuming the condit=
ion is false
           if (rcdu->dpad1_source =3D=3D rgrp->index * 2)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_group.c:353:2: note: Taking false branch
           if (rcdu->dpad1_source =3D=3D rgrp->index * 2)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_group.c:360:2: note: Calling 'rcar_du_gr=
oup_set_dpad_levels'
           rcar_du_group_set_dpad_levels(rgrp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_group.c:314:6: note: Assuming field 'gen=
' is >=3D 2
           if (rcdu->info->gen < 2)
               ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_group.c:314:2: note: Taking false branch
           if (rcdu->info->gen < 2)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_group.c:327:14: note: Assuming 'i' is < =
field 'num_crtcs'
           for (i =3D 0; i < rgrp->num_crtcs; ++i) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_group.c:327:2: note: Loop condition is t=
rue.  Entering loop body
           for (i =3D 0; i < rgrp->num_crtcs; ++i) {
           ^
   drivers/gpu/drm/rcar-du/rcar_du_group.c:332:12: note: Left side of '&&' =
is false
                   rstate =3D to_rcar_crtc_state(rcrtc->crtc.state);
                            ^
   drivers/gpu/drm/rcar-du/rcar_du_crtc.h:94:31: note: expanded from macro =
'to_rcar_crtc_state'
   #define to_rcar_crtc_state(s) container_of(s, struct rcar_du_crtc_state,=
 state)
                                 ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/rcar-du/rcar_du_group.c:332:12: note: Taking false branch
                   rstate =3D to_rcar_crtc_state(rcrtc->crtc.state);
                            ^
   drivers/gpu/drm/rcar-du/rcar_du_crtc.h:94:31: note: expanded from macro =
'to_rcar_crtc_state'
   #define to_rcar_crtc_state(s) container_of(s, struct rcar_du_crtc_state,=
 state)
                                 ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_group.c:332:12: note: Loop condition is =
false.  Exiting loop
                   rstate =3D to_rcar_crtc_state(rcrtc->crtc.state);
                            ^
   drivers/gpu/drm/rcar-du/rcar_du_crtc.h:94:31: note: expanded from macro =
'to_rcar_crtc_state'
   #define to_rcar_crtc_state(s) container_of(s, struct rcar_du_crtc_state,=
 state)
                                 ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
--
   include/linux/uaccess.h:157:6: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:30: note: Left side of '&&' is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                       ^
   include/linux/uaccess.h:161:6: note: Assuming 'res' is not equal to 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking true branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:162:3: note: Null pointer passed as 1st argument=
 to memory set function
                   memset(to + (n - res), 0, res);
                   ^      ~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/affs/namei.c:22:34: warning: Although the value stored to 'ch' is use=
d in the enclosing expression, the value is never actually read from 'ch' [=
clang-analyzer-deadcode.DeadStores]
           return ch >=3D 'a' && ch <=3D 'z' ? ch -=3D ('a' - 'A') : ch;
                                           ^     ~~~~~~~~~~~
   fs/affs/namei.c:22:34: note: Although the value stored to 'ch' is used i=
n the enclosing expression, the value is never actually read from 'ch'
           return ch >=3D 'a' && ch <=3D 'z' ? ch -=3D ('a' - 'A') : ch;
                                           ^     ~~~~~~~~~~~
   fs/affs/namei.c:484:2: warning: Value stored to 'retval' is never read [=
clang-analyzer-deadcode.DeadStores]
           retval =3D affs_insert_hash(new_dir, bh_old);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/namei.c:484:2: note: Value stored to 'retval' is never read
           retval =3D affs_insert_hash(new_dir, bh_old);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   fs/affs/file.c:888:4: warning: Value stored to 'res' is never read [clan=
g-analyzer-deadcode.DeadStores]
                           res =3D mapping->a_ops->write_end(NULL, mapping,=
 isize, 0, 0, page, fsdata);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/affs/file.c:888:4: note: Value stored to 'res' is never read
                           res =3D mapping->a_ops->write_end(NULL, mapping,=
 isize, 0, 0, page, fsdata);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   fs/fat/fatent.c:482:2: warning: Value stored to 'err' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           err =3D nr_bhs =3D idx_clus =3D 0;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   fs/fat/fatent.c:482:2: note: Value stored to 'err' is never read
           err =3D nr_bhs =3D idx_clus =3D 0;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/mfd/tps65010.c:650:5: warning: Value stored to 'status' is never=
 read [clang-analyzer-deadcode.DeadStores]
                                   status =3D 0;
                                   ^        ~
   drivers/mfd/tps65010.c:650:5: note: Value stored to 'status' is never re=
ad
                                   status =3D 0;
                                   ^        ~
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/mfd/menelaus.c:453:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:453:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:525:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:525:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:734:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:734:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   16 warnings generated.
   drivers/mfd/twl-core.c:574:15: warning: The left operand of '&' is a gar=
bage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           switch (ctrl & 0x3) {
                   ~~~~ ^
   drivers/mfd/twl-core.c:569:2: note: 'ctrl' declared without an initial v=
alue
           u8 ctrl;
           ^~~~~~~
   drivers/mfd/twl-core.c:572:2: note: Calling 'twl_i2c_read_u8'
           twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &ctrl, R_CFG_BOOT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:9: note: Calling 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:473:7: note: 'regmap' is null
           if (!regmap)
                ^~~~~~
   drivers/mfd/twl-core.c:473:2: note: Taking true branch
           if (!regmap)
           ^
   drivers/mfd/twl-core.c:474:3: note: Returning without writing to '*value'
                   return -EPERM;
                   ^
   include/linux/mfd/twl.h:180:9: note: Returning from 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:2: note: Returning without writing to '*val'
           return twl_i2c_read(mod_no, val, reg, 1);
           ^
   drivers/mfd/twl-core.c:572:2: note: Returning from 'twl_i2c_read_u8'
           twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &ctrl, R_CFG_BOOT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:574:15: note: The left operand of '&' is a garbag=
e value
           switch (ctrl & 0x3) {
                   ~~~~ ^
   drivers/mfd/twl-core.c:1205:8: warning: The left expression of the compo=
und assignment is an uninitialized value. The computed value will also be g=
arbage [clang-analyzer-core.uninitialized.Assign]
                   temp &=3D ~(SR_I2C_SDA_CTRL_PU | SR_I2C_SCL_CTRL_PU | \
                   ~~~~ ^
   drivers/mfd/twl-core.c:1078:6: note: Assuming 'node' is non-null
           if (!node && !pdata) {
               ^~~~~
   drivers/mfd/twl-core.c:1078:12: note: Left side of '&&' is false
           if (!node && !pdata) {
                     ^
   drivers/mfd/twl-core.c:1083:6: note: Assuming 'twl_priv' is null
           if (twl_priv) {
               ^~~~~~~~
   drivers/mfd/twl-core.c:1083:2: note: Taking false branch
           if (twl_priv) {
           ^
   drivers/mfd/twl-core.c:1090:6: note: Assuming 'pdev' is non-null
           if (!pdev) {
               ^~~~~
   drivers/mfd/twl-core.c:1090:2: note: Taking false branch
           if (!pdev) {
           ^
   drivers/mfd/twl-core.c:1096:6: note: Assuming 'status' is 0
           if (status) {
               ^~~~~~
   drivers/mfd/twl-core.c:1096:2: note: Taking false branch
           if (status) {
           ^
   drivers/mfd/twl-core.c:1101:2: note: Taking false branch
           if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C) =3D=
=3D 0) {
           ^
   drivers/mfd/twl-core.c:1109:6: note: Assuming 'twl_priv' is non-null
           if (!twl_priv) {
               ^~~~~~~~~
   drivers/mfd/twl-core.c:1109:2: note: Taking false branch
           if (!twl_priv) {
           ^
   drivers/mfd/twl-core.c:1114:6: note: Assuming the condition is true
           if ((id->driver_data) & TWL6030_CLASS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1114:2: note: Taking true branch
           if ((id->driver_data) & TWL6030_CLASS) {
           ^
   drivers/mfd/twl-core.c:1118:7: note: Assuming the condition is false
                   if ((id->driver_data) & TWL6032_SUBCLASS)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1118:3: note: Taking false branch
                   if ((id->driver_data) & TWL6032_SUBCLASS)
                   ^
   drivers/mfd/twl-core.c:1129:26: note: Calling 'devm_kcalloc'
--
           if (of_device_is_compatible(devbus->dev->of_node, "marvell,mvebu=
-devbus")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/memory/mvebu-devbus.c:156:2: note: Taking false branch
           if (of_device_is_compatible(devbus->dev->of_node, "marvell,mvebu=
-devbus")) {
           ^
   drivers/memory/mvebu-devbus.c:179:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   drivers/memory/mvebu-devbus.c:179:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/memory/mvebu-devbus.c:184:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   drivers/memory/mvebu-devbus.c:184:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/memory/mvebu-devbus.c:189:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   drivers/memory/mvebu-devbus.c:189:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/memory/mvebu-devbus.c:192:2: note: Returning without writing to =
'w->sync_enable'
           return 0;
           ^
   drivers/memory/mvebu-devbus.c:301:9: note: Returning from 'devbus_get_ti=
ming_params'
                   err =3D devbus_get_timing_params(devbus, node, &r, &w);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/mvebu-devbus.c:302:7: note: 'err' is >=3D 0
                   if (err < 0)
                       ^~~
   drivers/memory/mvebu-devbus.c:302:3: note: Taking false branch
                   if (err < 0)
                   ^
   drivers/memory/mvebu-devbus.c:306:7: note: Assuming the condition is fal=
se
                   if (of_device_is_compatible(node, "marvell,orion-devbus"=
))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/mvebu-devbus.c:306:3: note: Taking false branch
                   if (of_device_is_compatible(node, "marvell,orion-devbus"=
))
                   ^
   drivers/memory/mvebu-devbus.c:309:4: note: Calling 'devbus_armada_set_ti=
ming_params'
                           devbus_armada_set_timing_params(devbus, node, &r=
, &w);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/memory/mvebu-devbus.c:244:2: note: Taking false branch
           dev_dbg(devbus->dev, "read parameters register 0x%p =3D 0x%x\n",
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/memory/mvebu-devbus.c:248:2: note: Loop condition is false.  Exi=
ting loop
           writel(value, devbus->base + ARMADA_READ_PARAM_OFFSET);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:166:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/memory/mvebu-devbus.c:251:26: note: The left operand of '<<' is =
a garbage value
           value =3D w->sync_enable  << ARMADA_SYNC_ENABLE_SHIFT |
                   ~~~~~~~~~~~~~~  ^
   1 warning generated.
   arch/arm/mach-omap2/prminst44xx.c:193:2: warning: Value stored to 'v' is=
 never read [clang-analyzer-deadcode.DeadStores]
           v =3D omap4_prminst_read_inst_reg(OMAP4430_PRM_PARTITION,
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/prminst44xx.c:193:2: note: Value stored to 'v' is ne=
ver read
           v =3D omap4_prminst_read_inst_reg(OMAP4430_PRM_PARTITION,
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
   drivers/gpio/gpio-ml-ioh.c:556:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D pci_enable_wake(pdev, PCI_D0, 0);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-ml-ioh.c:556:2: note: Value stored to 'ret' is never r=
ead
           ret =3D pci_enable_wake(pdev, PCI_D0, 0);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:68:3: warning: Call to f=
unction 'strcpy' is insecure as it does not provide bounding of the memory =
buffer. Replace unbounded copy functions with analogous functions that supp=
ort length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.in=
secureAPI.strcpy]
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:68:3: note: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:71:3: warning: Call to f=
unction 'strcpy' is insecure as it does not provide bounding of the memory =
buffer. Replace unbounded copy functions with analogous functions that supp=
ort length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.in=
secureAPI.strcpy]
                   strcpy(dst, src);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:71:3: note: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, src);
                   ^~~~~~
   13 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/base.c:213:21: warning: Value stored to 'dss=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct dss_device *dss =3D src ? src->dss : dst->dss;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/base.c:213:21: note: Value stored to 'dss' d=
uring its initialization is never read
           struct dss_device *dss =3D src ? src->dss : dst->dss;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/omapdrm/dss/dispc.c:871:56: warning: The result of the l=
eft shift is undefined because the left operand is negative [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->g=
cb, ct->gcr));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:867:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:6: note: Assuming the condition=
 is true
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:51:2: note: expanded from macro 'REG=
_GET'
           FLD_GET(dispc_read_reg(dispc, idx), start, end)
           ^
   drivers/gpu/drm/omapdrm/dss/dss.h:66:34: note: expanded from macro 'FLD_=
GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:2: note: Taking true branch
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4902:3: note: Calling '_omap_dispc_i=
nitial_config'
                   _omap_dispc_initial_config(dispc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3911:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV)) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:6: note: Assuming field 'has_ga=
mma_table' is false
           if (dispc->feat->has_gamma_table)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:2: note: Taking false branch
           if (dispc->feat->has_gamma_table)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:6: note: Left side of '||' is f=
alse
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3930:19: note: Field 'has_gamma_tabl=
e' is false
               dispc->feat->has_gamma_table)
                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3933:2: note: Calling 'dispc_setup_c=
olor_conv_coef'
           dispc_setup_color_conv_coef(dispc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:14: note: Assuming 'i' is < 'num=
_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:920:3: note: Calling 'dispc_ovl_writ=
e_color_conv_coef'
                   dispc_ovl_write_color_conv_coef(dispc, i, &coefs_yuv2rgb=
_bt601_lim);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:871:56: note: The result of the left=
 shift is undefined because the left operand is negative
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->g=
cb, ct->gcr));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:867:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:889:56: warning: The result of the l=
eft shift is undefined because the left operand is negative [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->c=
rb, ct->crg));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:885:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:6: note: Assuming the condition=
 is true
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:51:2: note: expanded from macro 'REG=
_GET'
           FLD_GET(dispc_read_reg(dispc, idx), start, end)
           ^
   drivers/gpu/drm/omapdrm/dss/dss.h:66:34: note: expanded from macro 'FLD_=
GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:2: note: Taking true branch
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4902:3: note: Calling '_omap_dispc_i=
nitial_config'
                   _omap_dispc_initial_config(dispc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3911:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV)) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:6: note: Assuming field 'has_ga=
mma_table' is false
           if (dispc->feat->has_gamma_table)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:2: note: Taking false branch
           if (dispc->feat->has_gamma_table)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:6: note: Left side of '||' is f=
alse
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3930:19: note: Field 'has_gamma_tabl=
e' is false
               dispc->feat->has_gamma_table)
                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3933:2: note: Calling 'dispc_setup_c=
olor_conv_coef'
           dispc_setup_color_conv_coef(dispc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:14: note: Assuming 'i' is >=3D '=
num_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:2: note: Loop condition is false=
. Execution continues on line 922
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:922:6: note: Assuming field 'has_wri=
teback' is true
           if (dispc->feat->has_writeback)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:922:2: note: Taking true branch
           if (dispc->feat->has_writeback)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:923:3: note: Calling 'dispc_wb_write=
_color_conv_coef'
                   dispc_wb_write_color_conv_coef(dispc, &coefs_rgb2yuv_bt6=
01_lim);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:889:56: note: The result of the left=
 shift is undefined because the left operand is negative
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->c=
rb, ct->crg));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:885:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
>> drivers/gpu/drm/omapdrm/dss/dispc.c:3215:3: warning: Value stored to 'ht=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ht =3D vm->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3215:3: note: Value stored to 'ht' i=
s never read
                   ht =3D vm->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/omapdrm/dss/dispc.c:3216:3: warning: Value stored to 'vt=
' is never read [clang-analyzer-deadcode.DeadStores]
                   vt =3D vm->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3216:3: note: Value stored to 'vt' i=
s never read
                   vt =3D vm->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/omapdrm/dss/dispc.c:4822:2: warning: Value stored to 're=
v' is never read [clang-analyzer-deadcode.DeadStores]
           rev =3D dispc_read_reg(dispc, DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:4822:2: note: Value stored to 'rev' =
is never read
           rev =3D dispc_read_reg(dispc, DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/gfs2/glock.c:643:3: warning: Called function pointer is null (null de=
reference) [clang-analyzer-core.CallAndMessage]
                   glops->go_inval(gl, target =3D=3D LM_ST_DEFERRED ? 0 : D=
IO_METADATA);
                   ^~~~~~~~~~~~~~~
   fs/gfs2/glock.c:586:42: note: Assuming 'gh' is null
           unsigned int lck_flags =3D (unsigned int)(gh ? gh->gh_flags : 0);
                                                   ^~
   fs/gfs2/glock.c:586:42: note: '?' condition is false
   fs/gfs2/glock.c:589:6: note: Assuming 'target' is not equal to LM_ST_UNL=
OCKED
           if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) =
&&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:589:6: note: Left side of '&&' is true
   fs/gfs2/glock.c:589:34: note: Calling 'glock_blocked_by_withdraw'
           if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) =
&&
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:152:2: note: Taking false branch
           if (likely(!gfs2_withdrawn(sdp)))
           ^
   fs/gfs2/glock.c:154:6: note: Assuming the condition is true
           if (gl->gl_ops->go_flags & GLOF_NONDISK)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:154:2: note: Taking true branch
           if (gl->gl_ops->go_flags & GLOF_NONDISK)
           ^
   fs/gfs2/glock.c:155:3: note: Returning zero, which participates in a con=
dition later
                   return false;
                   ^~~~~~~~~~~~
   fs/gfs2/glock.c:589:34: note: Returning from 'glock_blocked_by_withdraw'
           if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) =
&&
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:589:64: note: Left side of '&&' is false
           if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) =
&&
                                                                         ^
   fs/gfs2/glock.c:594:19: note: Assuming 'target' is not equal to field 'g=
l_state'
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D target);
                            ^
   fs/gfs2/glock.h:205:46: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/gfs2/glock.c:594:2: note: Taking false branch
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D target);
           ^
   fs/gfs2/glock.h:205:33: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                                   ^
   fs/gfs2/glock.c:594:2: note: Loop condition is false.  Exiting loop
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D target);
           ^
   fs/gfs2/glock.h:205:28: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                              ^
   fs/gfs2/glock.c:595:19: note: Assuming field 'gl_state' is not equal to =
field 'gl_target'
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D gl->gl_target);
                            ^
   fs/gfs2/glock.h:205:46: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/gfs2/glock.c:595:2: note: Taking false branch
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D gl->gl_target);
           ^
   fs/gfs2/glock.h:205:33: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                                   ^
   fs/gfs2/glock.c:595:2: note: Loop condition is false.  Exiting loop
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D gl->gl_target);
           ^
   fs/gfs2/glock.h:205:28: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                              ^
   fs/gfs2/glock.c:596:7: note: 'target' is not equal to LM_ST_UNLOCKED
           if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRE=
D) &&
                ^~~~~~
   fs/gfs2/glock.c:596:7: note: Left side of '||' is false
   fs/gfs2/glock.c:596:35: note: Assuming 'target' is equal to LM_ST_DEFERR=
ED
           if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRE=
D) &&
                                            ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:596:6: note: Left side of '&&' is true
           if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRE=
D) &&
               ^
   fs/gfs2/glock.c:597:6: note: Assuming field 'go_inval' is null
               glops->go_inval) {
               ^~~~~~~~~~~~~~~
   fs/gfs2/glock.c:596:6: note: Assuming pointer value is null
           if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRE=
D) &&
--
               ^~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:297:2: note: Taking false branch
           if (!keypad_data)
           ^
   drivers/input/keyboard/tca8418_keypad.c:305:6: note: 'error' is 0
           if (error)
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:305:2: note: Taking false branch
           if (error)
           ^
   drivers/input/keyboard/tca8418_keypad.c:310:6: note: Assuming 'input' is=
 non-null
           if (!input)
               ^~~~~~
   drivers/input/keyboard/tca8418_keypad.c:310:2: note: Taking false branch
           if (!input)
           ^
   drivers/input/keyboard/tca8418_keypad.c:322:6: note: Assuming 'error' is=
 0
           if (error) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:322:2: note: Taking false branch
           if (error) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:327:6: note: Assuming the condit=
ion is false
           if (device_property_read_bool(dev, "keypad,autorepeat"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:327:2: note: Taking false branch
           if (device_property_read_bool(dev, "keypad,autorepeat"))
           ^
   drivers/input/keyboard/tca8418_keypad.c:336:6: note: Assuming 'error' is=
 0
           if (error) {
               ^~~~~
   drivers/input/keyboard/tca8418_keypad.c:336:2: note: Taking false branch
           if (error) {
           ^
   drivers/input/keyboard/tca8418_keypad.c:343:10: note: Calling 'tca8418_c=
onfigure'
           error =3D tca8418_configure(keypad_data, rows, cols);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/tca8418_keypad.c:241:15: note: The result of the =
left shift is undefined because the left operand is negative
           reg +=3D (~(~0 << cols)) << 8;
                     ~~ ^
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/clk/ti/clkctrl.c:634:2: warning: Call to function 'strcat' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(provider->clkdm_name, "clkdm");
           ^~~~~~
   drivers/clk/ti/clkctrl.c:634:2: note: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119
           strcat(provider->clkdm_name, "clkdm");
           ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clocksource/timer-ixp4xx.c:56:8: warning: Excessive padding in '=
struct ixp4xx_timer' (108 padding bytes, where 44 is optimal). =

   Optimal fields order: =

   clkevt, =

   base, =

   tick_rate, =

   latch, =

   delay_timer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ixp4xx_timer {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/clocksource/timer-ixp4xx.c:56:8: note: Excessive padding in 'str=
uct ixp4xx_timer' (108 padding bytes, where 44 is optimal). Optimal fields =
order: clkevt, base, tick_rate, latch, delay_timer, consider reordering the=
 fields or adding explicit padding members
   struct ixp4xx_timer {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> arch/arm/mach-imx/tzic.c:160:2: warning: Value stored to 'i' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           i =3D imx_readl(tzic_base + TZIC_INTCNTL);
           ^
   arch/arm/mach-imx/tzic.c:160:2: note: Value stored to 'i' is never read
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   block/blk-mq.c:1901:3: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
                   struct blk_mq_hw_ctx *this_hctx =3D head_rq->mq_hctx;
                   ^                                 ~~~~~~~~~~~~~~~~
   block/blk-mq.c:1888:6: note: Assuming the condition is false
           if (list_empty(&plug->mq_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:1888:2: note: Taking false branch
           if (list_empty(&plug->mq_list))
           ^
   block/blk-mq.c:1890:2: note: Calling 'list_splice_init'
           list_splice_init(&plug->mq_list, &list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:481:6: note: Assuming the condition is false
           if (!list_empty(list)) {
               ^~~~~~~~~~~~~~~~~
   include/linux/list.h:481:2: note: Taking false branch
           if (!list_empty(list)) {
           ^
   block/blk-mq.c:1890:2: note: Returning from 'list_splice_init'
           list_splice_init(&plug->mq_list, &list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq.c:1892:6: note: Assuming field 'rq_count' is <=3D 2
           if (plug->rq_count > 2 && plug->multiple_queues)
               ^~~~~~~~~~~~~~~~~~
   block/blk-mq.c:1892:25: note: Left side of '&&' is false
           if (plug->rq_count > 2 && plug->multiple_queues)
                                  ^
   block/blk-mq.c:1899:34: note: Left side of '&&' is false
                   struct request *rq, *head_rq =3D list_entry_rq(list.next=
);
                                                  ^
   include/linux/blkdev.h:683:28: note: expanded from macro 'list_entry_rq'
   #define list_entry_rq(ptr)      list_entry((ptr), struct request, queuel=
ist)
                                   ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   block/blk-mq.c:1899:34: note: Taking false branch
                   struct request *rq, *head_rq =3D list_entry_rq(list.next=
);
                                                  ^
   include/linux/blkdev.h:683:28: note: expanded from macro 'list_entry_rq'
   #define list_entry_rq(ptr)      list_entry((ptr), struct request, queuel=
ist)
                                   ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   block/blk-mq.c:1899:34: note: Loop condition is false.  Exiting loop
                   struct request *rq, *head_rq =3D list_entry_rq(list.next=
);
                                                  ^
   include/linux/blkdev.h:683:28: note: expanded from macro 'list_entry_rq'
   #define list_entry_rq(ptr)      list_entry((ptr), struct request, queuel=
ist)
--
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/vfio/pci/vfio_pci.c:1499:8: note: Assuming the condition is false
                           if (mmget_not_zero(mm))
                               ^~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci.c:1499:4: note: Taking false branch
                           if (mmget_not_zero(mm))
                           ^
   drivers/vfio/pci/vfio_pci.c:1503:4: note: Memory is released
                           kfree(mmap_vma);
                           ^~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci.c:1494:3: note: Loop condition is true.  Enter=
ing loop body
                   while (!list_empty(&vdev->vma_list)) {
                   ^
   drivers/vfio/pci/vfio_pci.c:1495:15: note: Left side of '&&' is false
                           mmap_vma =3D list_first_entry(&vdev->vma_list,
                                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/vfio/pci/vfio_pci.c:1495:15: note: Taking false branch
                           mmap_vma =3D list_first_entry(&vdev->vma_list,
                                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/vfio/pci/vfio_pci.c:1495:15: note: Loop condition is false.  Exi=
ting loop
                           mmap_vma =3D list_first_entry(&vdev->vma_list,
                                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/vfio/pci/vfio_pci.c:1498:9: note: Use of memory after it is freed
                           mm =3D mmap_vma->vma->vm_mm;
                                ^~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/venc.c:697:2: warning: Value stored to 'rev_=
id' is never read [clang-analyzer-deadcode.DeadStores]
           rev_id =3D (u8)(venc_read_reg(venc, VENC_REV_ID) & 0xff);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/venc.c:697:2: note: Value stored to 'rev_id'=
 is never read
           rev_id =3D (u8)(venc_read_reg(venc, VENC_REV_ID) & 0xff);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:118:11: warning: V=
alue stored to 'period' during its initialization is never read [clang-anal=
yzer-deadcode.DeadStores]
           uint32_t period =3D ts->period;
                    ^~~~~~   ~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:118:11: note: Valu=
e stored to 'period' during its initialization is never read
           uint32_t period =3D ts->period;
                    ^~~~~~   ~~~~~~~~~~
   include/linux/math64.h:91:15: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:240:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                                         ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:122:6: note: Assum=
ing 'fifo_nb' is not equal to 0
           if (fifo_nb =3D=3D 0)
               ^~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:122:2: note: Takin=
g false branch
           if (fifo_nb =3D=3D 0)
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:130:6: note: Assum=
ing field 'lo' is not equal to 0
           if (it->lo !=3D 0) {
               ^~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:130:2: note: Takin=
g true branch
           if (it->lo !=3D 0) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:133:11: note: Call=
ing 'inv_compute_chip_period'
                   valid =3D inv_compute_chip_period(ts, fifo_mult, period);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:101:2: note: Takin=
g false branch
           if (!inv_validate_period(period, mult))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:106:2: note: Calli=
ng 'inv_update_acc'
           inv_update_acc(&ts->chip_period, new_chip_period);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:6: note: Assumi=
ng the condition is false
           if (acc->idx >=3D ARRAY_SIZE(acc->values))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:2: note: Taking=
 false branch
           if (acc->idx >=3D ARRAY_SIZE(acc->values))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:7: note: The va=
lue 0 is assigned to 'i'
           for (i =3D 0; i < ARRAY_SIZE(acc->values); ++i) {
                ^~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:2: note: Loop c=
ondition is true.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(acc->values); ++i) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:7: note: Assumi=
ng the condition is true
                   if (acc->values[i] =3D=3D 0)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:3: note: Taking=
 true branch
                   if (acc->values[i] =3D=3D 0)
                   ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:36:4: note:  Execu=
tion continues on line 40
                           break;
                           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:40:26: note: Passi=
ng the value 0 via 2nd parameter 'divisor'
           acc->val =3D div_u64(sum, i);
                                   ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:40:13: note: Calli=
ng 'div_u64'
           acc->val =3D div_u64(sum, i);
                      ^~~~~~~~~~~~~~~
   include/linux/math64.h:127:31: note: Passing the value 0 via 2nd paramet=
er 'divisor'
           return div_u64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:127:9: note: Calling 'div_u64_rem'
           return div_u64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:91:15: note: '__base' initialized to 0
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:224:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                       \
           ^~~~~~~~~~~~~~~
   include/linux/math64.h:91:15: note: Left side of '&&' is false
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:227:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   include/linux/math64.h:91:15: note: 4 is >=3D 4
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:231:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/div64.h:64:32: note: expanded from macro '__div64_c=
onst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   include/linux/math64.h:91:15: note: Left side of '&&' is true
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:231:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   arch/arm/include/asm/div64.h:64:31: note: expanded from macro '__div64_c=
onst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   include/linux/math64.h:91:15: note: Left side of '&&' is false
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:232:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   include/linux/math64.h:91:15: note: Taking true branch
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:239:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   include/linux/math64.h:91:15: note: Division by zero
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:240:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/nvmem/sunxi_sid.c:107:2: warning: Null pointer passed as 1st arg=
ument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(val, &word, bytes);
           ^      ~~~
   drivers/nvmem/sunxi_sid.c:89:9: note: Assuming 'bytes' is >=3D 4
           while (bytes >=3D 4) {
                  ^~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:89:2: note: Loop condition is true.  Entering =
loop body
           while (bytes >=3D 4) {
           ^
   drivers/nvmem/sunxi_sid.c:90:9: note: Calling 'sun8i_sid_register_readou=
t'
                   ret =3D sun8i_sid_register_readout(sid, offset, val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:61:2: note: Loop condition is false.  Exiting =
loop
           writel(reg_val, sid->base + SUN8I_SID_PRCTL);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:166:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/nvmem/sunxi_sid.c:63:8: note: '__sleep_us' is not equal to 0
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeo=
ut'
           might_sleep_if((__sleep_us) !=3D 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:160:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/nvmem/sunxi_sid.c:63:8: note: Taking true branch
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:152:29: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                               ^
   include/linux/kernel.h:87:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:152:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
--
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:331:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   net/8021q/vlan_core.c:377:14: note: Loop condition is false.  Exiting lo=
op
           vlan_info =3D rtnl_dereference(dev->vlan_info);
                       ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:548:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:367:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:331:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   net/8021q/vlan_core.c:378:7: note: 'vlan_info' is non-null
           if (!vlan_info)
                ^~~~~~~~~
   net/8021q/vlan_core.c:378:2: note: Taking false branch
           if (!vlan_info)
           ^
   net/8021q/vlan_core.c:381:13: note: Calling 'vlan_vid_info_get'
           vid_info =3D vlan_vid_info_get(vlan_info, proto, vid);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan_core.c:184:2: note: Left side of '&&' is false
           list_for_each_entry(vid_info, &vlan_info->vid_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/8021q/vlan_core.c:184:2: note: Taking false branch
           list_for_each_entry(vid_info, &vlan_info->vid_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/8021q/vlan_core.c:184:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry(vid_info, &vlan_info->vid_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/8021q/vlan_core.c:184:2: note: Loop condition is true.  Entering loo=
p body
           list_for_each_entry(vid_info, &vlan_info->vid_list, list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   net/8021q/vlan_core.c:185:7: note: Use of memory after it is freed
                   if (vid_info->proto =3D=3D proto && vid_info->vid =3D=3D=
 vid)
                       ^~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/mtd/devices/st_spi_fsm.c:275:8: warning: Excessive padding in 's=
truct seq_rw_config' (6 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   flags, =

   write, =

   cmd, =

   addr_pads, =

   data_pads, =

   mode_data, =

   mode_cycles, =

   dummy_cycles, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct seq_rw_config {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/mtd/devices/st_spi_fsm.c:275:8: note: Excessive padding in 'stru=
ct seq_rw_config' (6 padding bytes, where 2 is optimal). Optimal fields ord=
er: flags, write, cmd, addr_pads, data_pads, mode_data, mode_cycles, dummy_=
cycles, consider reordering the fields or adding explicit padding members
   struct seq_rw_config {
   ~~~~~~~^~~~~~~~~~~~~~~
>> drivers/mtd/devices/st_spi_fsm.c:287:8: warning: Excessive padding in 's=
truct flash_info' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   jedec_id, =

   sector_size, =

   flags, =

   max_freq, =

   config, =

   ext_id, =

   n_sectors, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct flash_info {
   ~~~~~~~^~~~~~~~~~~~
   drivers/mtd/devices/st_spi_fsm.c:287:8: note: Excessive padding in 'stru=
ct flash_info' (4 padding bytes, where 0 is optimal). Optimal fields order:=
 name, jedec_id, sector_size, flags, max_freq, config, ext_id, n_sectors, c=
onsider reordering the fields or adding explicit padding members
   struct flash_info {
   ~~~~~~~^~~~~~~~~~~~
>> drivers/mtd/devices/st_spi_fsm.c:1427:3: warning: Value stored to 'offs'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   offs =3D 0;
                   ^      ~
   drivers/mtd/devices/st_spi_fsm.c:1427:3: note: Value stored to 'offs' is=
 never read
                   offs =3D 0;
                   ^      ~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   net/netlink/genetlink.c:1439:24: warning: Access to field 'genl_sock' re=
sults in a dereference of a null pointer (loaded from variable 'prev') [cla=
ng-analyzer-core.NullDereference]
           err =3D nlmsg_multicast(prev->genl_sock, skb, portid, group, fla=
gs);
                                 ^
   net/netlink/genetlink.c:1397:8: note: Calling 'genl_register_family'
           err =3D genl_register_family(&genl_ctrl);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netlink/genetlink.c:398:6: note: 'err' is 0
           if (err)
               ^~~
   net/netlink/genetlink.c:398:2: note: Taking false branch
           if (err)
           ^
   net/netlink/genetlink.c:403:6: note: Assuming the condition is false
           if (genl_family_find_byname(family->name)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netlink/genetlink.c:403:2: note: Taking false branch
           if (genl_family_find_byname(family->name)) {
           ^
   net/netlink/genetlink.c:415:2: note: Taking true branch
           if (family =3D=3D &genl_ctrl) {
           ^
   net/netlink/genetlink.c:426:6: note: Assuming field 'id' is >=3D 0
           if (family->id < 0) {
               ^~~~~~~~~~~~~~
   net/netlink/genetlink.c:426:2: note: Taking false branch
           if (family->id < 0) {
           ^
   net/netlink/genetlink.c:432:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/netlink/genetlink.c:432:2: note: Taking false branch
           if (err)
           ^
   net/netlink/genetlink.c:438:2: note: Calling 'genl_ctrl_event'
           genl_ctrl_event(CTRL_CMD_NEWFAMILY, family, NULL, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netlink/genetlink.c:1079:6: note: Assuming field 'genl_sock' is non-=
null
           if (!init_net.genl_sock)
               ^~~~~~~~~~~~~~~~~~~
   net/netlink/genetlink.c:1079:2: note: Taking false branch
           if (!init_net.genl_sock)
           ^
   net/netlink/genetlink.c:1082:2: note: Control jumps to 'case CTRL_CMD_NE=
WFAMILY:' @line 1083
           switch (event) {
           ^
   net/netlink/genetlink.c:1087:3: note:  Execution continues on line 1097
                   break;
                   ^
   net/netlink/genetlink.c:1097:2: note: Taking false branch
           if (IS_ERR(msg))
           ^
   net/netlink/genetlink.c:1100:6: note: Assuming field 'netnsok' is not eq=
ual to 0
           if (!family->netnsok) {
               ^~~~~~~~~~~~~~~~
   net/netlink/genetlink.c:1100:2: note: Taking false branch
           if (!family->netnsok) {
           ^
   net/netlink/genetlink.c:1105:3: note: Calling 'genlmsg_multicast_allns'
                   genlmsg_multicast_allns(&genl_ctrl, msg, 0,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netlink/genetlink.c:1454:19: note: Assuming 'group' is < field 'n_mc=
grps'
           if (WARN_ON_ONCE(group >=3D family->n_mcgrps))
                            ^
   include/asm-generic/bug.h:201:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/netlink/genetlink.c:1454:2: note: Taking false branch
           if (WARN_ON_ONCE(group >=3D family->n_mcgrps))
           ^
   net/netlink/genetlink.c:1457:9: note: Calling 'genlmsg_mcast'
           return genlmsg_mcast(skb, portid, group, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netlink/genetlink.c:1417:20: note: 'prev' initialized to a null poin=
ter value
           struct net *net, *prev =3D NULL;
                             ^~~~
   net/netlink/genetlink.c:1421:2: note: Left side of '||' is false
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:336:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
--
   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c:1290:3: note: Value stored to 'tm=
p' is never read
   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c:3087:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(mmSRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c:3087:3: note: Value stored to 'tm=
p' is never read
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/thermal/qcom/tsens-8960.c:194:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(priv->tm_map, CONFIG_ADDR,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/qcom/tsens-8960.c:194:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(priv->tm_map, CONFIG_ADDR,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/qcom/tsens-8960.c:202:14: warning: The result of the rig=
ht shift is undefined due to shifting by '32', which is greater or equal to=
 the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOper=
atorResult]
           reg_cntl |=3D GENMASK(priv->num_sensors - 1, 0) << SENSOR0_SHIFT;
                       ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/qcom/tsens-8960.c:171:6: note: Assuming field 'tm_map' i=
s non-null
           if (!priv->tm_map)
               ^~~~~~~~~~~~~
   drivers/thermal/qcom/tsens-8960.c:171:2: note: Taking false branch
           if (!priv->tm_map)
           ^
   drivers/thermal/qcom/tsens-8960.c:180:14: note: Assuming 'i' is >=3D fie=
ld 'num_sensors'
           for (i =3D 0; i < priv->num_sensors; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/qcom/tsens-8960.c:180:2: note: Loop condition is false. =
Execution continues on line 186
           for (i =3D 0; i < priv->num_sensors; i++) {
           ^
   drivers/thermal/qcom/tsens-8960.c:188:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/thermal/qcom/tsens-8960.c:188:2: note: Taking false branch
           if (ret)
           ^
   drivers/thermal/qcom/tsens-8960.c:191:12: note: Field 'num_sensors' is <=
=3D 1
           if (priv->num_sensors > 1) {
                     ^
   drivers/thermal/qcom/tsens-8960.c:191:2: note: Taking false branch
           if (priv->num_sensors > 1) {
           ^
   drivers/thermal/qcom/tsens-8960.c:202:14: note: The result of the right =
shift is undefined due to shifting by '32', which is greater or equal to th=
e width of type 'unsigned long'
           reg_cntl |=3D GENMASK(priv->num_sensors - 1, 0) << SENSOR0_SHIFT;
                       ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/thermal/tegra/soctherm.c:2255:2: warning: Value stored to 'err' =
is never read [clang-analyzer-deadcode.DeadStores]
           err =3D soctherm_interrupts_init(pdev, tegra);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/tegra/soctherm.c:2255:2: note: Value stored to 'err' is =
never read
           err =3D soctherm_interrupts_init(pdev, tegra);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/hsi/controllers/omap_ssi_port.c:481:2: warning: Value stored to =
'val' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(ssr + SSI_SSR_MODE_REG);
           ^
   drivers/hsi/controllers/omap_ssi_port.c:481:2: note: Value stored to 'va=
l' is never read
   drivers/hsi/controllers/omap_ssi_port.c:764:2: warning: Value stored to =
'mode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D readl(omap_port->ssr_base + SSI_SSR_MODE_REG);
           ^
   drivers/hsi/controllers/omap_ssi_port.c:764:2: note: Value stored to 'mo=
de' is never read
   drivers/hsi/controllers/omap_ssi_port.c:1332:2: warning: Value stored to=
 'mode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D readl(omap_port->ssr_base + SSI_SSR_MODE_REG);
           ^
   drivers/hsi/controllers/omap_ssi_port.c:1332:2: note: Value stored to 'm=
ode' is never read
   Suppressed 14 warnings (12 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/hsi/clients/ssi_protocol.c:458:21: warning: Value stored to 'cl'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct hsi_client *cl =3D ssi->cl;
                              ^~   ~~~~~~~
   drivers/hsi/clients/ssi_protocol.c:458:21: note: Value stored to 'cl' du=
ring its initialization is never read
           struct hsi_client *cl =3D ssi->cl;
                              ^~   ~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/hwspinlock/qcom_hwspinlock.c:158:24: warning: Passed-by-value st=
ruct argument contains uninitialized data (e.g., field: 'id_size') [clang-a=
nalyzer-core.CallAndMessage]
                   bank->lock[i].priv =3D devm_regmap_field_alloc(&pdev->de=
v,
                                        ^
   drivers/hwspinlock/qcom_hwspinlock.c:132:2: note: 'field' initialized he=
re
           struct reg_field field;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:140:21: note: Left side of '&&' is =
false
           if (IS_ERR(regmap) && PTR_ERR(regmap) =3D=3D -ENODEV)
                              ^
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Calling 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:6: note: Returning from 'IS_ERR'
           if (IS_ERR(regmap))
               ^~~~~~~~~~~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:143:2: note: Taking false branch
           if (IS_ERR(regmap))
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:148:6: note: Assuming 'bank' is non=
-null
           if (!bank)
               ^~~~~
   drivers/hwspinlock/qcom_hwspinlock.c:148:2: note: Taking false branch
           if (!bank)
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:153:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < QCOM_MUTEX_NUM_LOCKS; i++) {
           ^
   drivers/hwspinlock/qcom_hwspinlock.c:158:24: note: Passed-by-value struc=
t argument contains uninitialized data (e.g., field: 'id_size')
                   bank->lock[i].priv =3D devm_regmap_field_alloc(&pdev->de=
v,
                                        ^
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/meson/meson_dw_hdmi.c:179:2: warning: Value stored to 'd=
ata' is never read [clang-analyzer-deadcode.DeadStores]
           data =3D readl(dw_hdmi->hdmitx + HDMITX_TOP_DATA_REG);
           ^
   drivers/gpu/drm/meson/meson_dw_hdmi.c:179:2: note: Value stored to 'data=
' is never read
   drivers/gpu/drm/meson/meson_dw_hdmi.c:243:2: warning: Value stored to 'd=
ata' is never read [clang-analyzer-deadcode.DeadStores]
           data =3D readl(dw_hdmi->hdmitx + HDMITX_DWC_DATA_REG);
           ^
   drivers/gpu/drm/meson/meson_dw_hdmi.c:243:2: note: Value stored to 'data=
' is never read
   drivers/gpu/drm/meson/meson_dw_hdmi.c:694:3: warning: Value stored to 'v=
enc_freq' is never read [clang-analyzer-deadcode.DeadStores]
                   venc_freq /=3D 2;
                   ^            ~
   drivers/gpu/drm/meson/meson_dw_hdmi.c:694:3: note: Value stored to 'venc=
_freq' is never read
                   venc_freq /=3D 2;
                   ^            ~
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:866:3: warning: Value =
stored to 'dbgstr' is never read [clang-analyzer-deadcode.DeadStores]
                   dbgstr =3D "DPU IRQ already set:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:866:3: note: Value sto=
red to 'dbgstr' is never read
                   dbgstr =3D "DPU IRQ already set:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:868:3: warning: Value =
stored to 'dbgstr' is never read [clang-analyzer-deadcode.DeadStores]
                   dbgstr =3D "DPU IRQ enabled:";
                   ^        ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:868:3: note: Value sto=
red to 'dbgstr' is never read
                   dbgstr =3D "DPU IRQ enabled:";
                   ^        ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:911:3: warning: Value =
stored to 'dbgstr' is never read [clang-analyzer-deadcode.DeadStores]
                   dbgstr =3D "DPU IRQ is already cleared:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:911:3: note: Value sto=
red to 'dbgstr' is never read
                   dbgstr =3D "DPU IRQ is already cleared:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:913:3: warning: Value =
stored to 'dbgstr' is never read [clang-analyzer-deadcode.DeadStores]
                   dbgstr =3D "DPU IRQ mask disable:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:913:3: note: Value sto=
red to 'dbgstr' is never read
                   dbgstr =3D "DPU IRQ mask disable:";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/leds/leds-lp5523.c:811:2: warning: Undefined or garbage value re=
turned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/leds/leds-lp5523.c:798:2: note: 'ret' declared without an initia=
l value
           int ret;
           ^~~~~~~
   drivers/leds/leds-lp5523.c:802:14: note: Assuming 'i' is >=3D field 'num=
_colors'
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-lp5523.c:802:2: note: Loop condition is false. Executi=
on continues on line 810
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
           ^
   drivers/leds/leds-lp5523.c:811:2: note: Undefined or garbage value retur=
ned to caller
           return ret;
           ^      ~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/cpufreq/mediatek-cpufreq.c:305:14: warning: Value stored to 'cpu=
_clk' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct clk *cpu_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/cpufreq/mediatek-cpufreq.c:305:14: note: Value stored to 'cpu_cl=
k' during its initialization is never read
           struct clk *cpu_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~   ~~~~~~~~~~~~~~~~
>> drivers/cpufreq/mediatek-cpufreq.c:306:14: warning: Value stored to 'int=
er_clk' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct clk *inter_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/cpufreq/mediatek-cpufreq.c:306:14: note: Value stored to 'inter_=
clk' during its initialization is never read
           struct clk *inter_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   kernel/kexec_core.c:769:4: warning: Value stored to 'addr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           addr =3D old_addr;
                           ^      ~~~~~~~~
   kernel/kexec_core.c:769:4: note: Value stored to 'addr' is never read
                           addr =3D old_addr;
                           ^      ~~~~~~~~
   kernel/kexec_core.c:789:2: warning: Value stored to 'result' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           result =3D 0;
           ^        ~
   kernel/kexec_core.c:789:2: note: Value stored to 'result' is never read
           result =3D 0;
           ^        ~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   kernel/cgroup/cgroup-v1.c:1080:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(root->release_agent_path, ctx->release_agent);
                   ^~~~~~
   kernel/cgroup/cgroup-v1.c:1080:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(root->release_agent_path, ctx->release_agent);
                   ^~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu8_smumgr.c:96:2: wa=
rning: Value stored to 'elapsed_us' is never read [clang-analyzer-deadcode.=
DeadStores]
           elapsed_us =3D ktime_us_delta(ktime_get(), t_start);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu8_smumgr.c:96:2: no=
te: Value stored to 'elapsed_us' is never read
           elapsed_us =3D ktime_us_delta(ktime_get(), t_start);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).

vim +/rev +158 arch/arm/mach-omap2/id.c

de26804b60d460 Linus Walleij    2013-09-05  146  =

4de34f3572882f Vaibhav Hiremath 2011-12-19  147  void __init omap2xxx_check=
_revision(void)
1dbae815a72430 Tony Lindgren    2005-11-10  148  {
1dbae815a72430 Tony Lindgren    2005-11-10  149  	int i, j;
a88231430384f4 Tony Lindgren    2008-12-10  150  	u32 idcode, prod_id;
1dbae815a72430 Tony Lindgren    2005-11-10  151  	u16 hawkeye;
a88231430384f4 Tony Lindgren    2008-12-10  152  	u8  dev_type, rev;
c46732bbf3477f Kan-Ru Chen      2010-08-02  153  	struct omap_die_id odi;
1dbae815a72430 Tony Lindgren    2005-11-10  154  =

1dbae815a72430 Tony Lindgren    2005-11-10  155  	idcode =3D read_tap_reg(O=
MAP_TAP_IDCODE);
0e564848693b06 Tony Lindgren    2008-10-06  156  	prod_id =3D read_tap_reg(=
tap_prod_id);
1dbae815a72430 Tony Lindgren    2005-11-10  157  	hawkeye =3D (idcode >> 12=
) & 0xffff;
1dbae815a72430 Tony Lindgren    2005-11-10 @158  	rev =3D (idcode >> 28) & =
0x0f;
1dbae815a72430 Tony Lindgren    2005-11-10  159  	dev_type =3D (prod_id >> =
16) & 0x0f;
c46732bbf3477f Kan-Ru Chen      2010-08-02  160  	omap_get_die_id(&odi);
1dbae815a72430 Tony Lindgren    2005-11-10  161  =

097c584cd48844 Paul Walmsley    2008-07-03  162  	pr_debug("OMAP_TAP_IDCODE=
 0x%08x REV %i HAWKEYE 0x%04x MANF %03x\n",
1dbae815a72430 Tony Lindgren    2005-11-10  163  		 idcode, rev, hawkeye, (=
idcode >> 1) & 0x7ff);
c46732bbf3477f Kan-Ru Chen      2010-08-02  164  	pr_debug("OMAP_TAP_DIE_ID=
_0: 0x%08x\n", odi.id_0);
097c584cd48844 Paul Walmsley    2008-07-03  165  	pr_debug("OMAP_TAP_DIE_ID=
_1: 0x%08x DEV_REV: %i\n",
c46732bbf3477f Kan-Ru Chen      2010-08-02  166  		 odi.id_1, (odi.id_1 >> =
28) & 0xf);
c46732bbf3477f Kan-Ru Chen      2010-08-02  167  	pr_debug("OMAP_TAP_DIE_ID=
_2: 0x%08x\n", odi.id_2);
c46732bbf3477f Kan-Ru Chen      2010-08-02  168  	pr_debug("OMAP_TAP_DIE_ID=
_3: 0x%08x\n", odi.id_3);
097c584cd48844 Paul Walmsley    2008-07-03  169  	pr_debug("OMAP_TAP_PROD_I=
D_0: 0x%08x DEV_TYPE: %i\n",
1dbae815a72430 Tony Lindgren    2005-11-10  170  		 prod_id, dev_type);
097c584cd48844 Paul Walmsley    2008-07-03  171  =

1dbae815a72430 Tony Lindgren    2005-11-10  172  	/* Check hawkeye ids */
1dbae815a72430 Tony Lindgren    2005-11-10  173  	for (i =3D 0; i < ARRAY_S=
IZE(omap_ids); i++) {
1dbae815a72430 Tony Lindgren    2005-11-10  174  		if (hawkeye =3D=3D omap_=
ids[i].hawkeye)
1dbae815a72430 Tony Lindgren    2005-11-10  175  			break;
1dbae815a72430 Tony Lindgren    2005-11-10  176  	}
1dbae815a72430 Tony Lindgren    2005-11-10  177  =

1dbae815a72430 Tony Lindgren    2005-11-10  178  	if (i =3D=3D ARRAY_SIZE(o=
map_ids)) {
1dbae815a72430 Tony Lindgren    2005-11-10  179  		printk(KERN_ERR "Unknown=
 OMAP CPU id\n");
1dbae815a72430 Tony Lindgren    2005-11-10  180  		return;
1dbae815a72430 Tony Lindgren    2005-11-10  181  	}
1dbae815a72430 Tony Lindgren    2005-11-10  182  =

1dbae815a72430 Tony Lindgren    2005-11-10  183  	for (j =3D i; j < ARRAY_S=
IZE(omap_ids); j++) {
1dbae815a72430 Tony Lindgren    2005-11-10  184  		if (dev_type =3D=3D omap=
_ids[j].dev)
1dbae815a72430 Tony Lindgren    2005-11-10  185  			break;
1dbae815a72430 Tony Lindgren    2005-11-10  186  	}
1dbae815a72430 Tony Lindgren    2005-11-10  187  =

1dbae815a72430 Tony Lindgren    2005-11-10  188  	if (j =3D=3D ARRAY_SIZE(o=
map_ids)) {
7852ec0536ca39 Paul Walmsley    2012-07-26  189  		pr_err("Unknown OMAP dev=
ice type. Handling it as OMAP%04x\n",
1dbae815a72430 Tony Lindgren    2005-11-10  190  		       omap_ids[i].type =
>> 16);
1dbae815a72430 Tony Lindgren    2005-11-10  191  		j =3D i;
1dbae815a72430 Tony Lindgren    2005-11-10  192  	}
1dbae815a72430 Tony Lindgren    2005-11-10  193  =

f9d41eefcfbb91 Ruslan Bilovol   2013-02-14  194  	sprintf(soc_name, "OMAP%0=
4x", omap_rev() >> 16);
f9d41eefcfbb91 Ruslan Bilovol   2013-02-14  195  	sprintf(soc_rev, "ES%x", =
(omap_rev() >> 12) & 0xf);
f9d41eefcfbb91 Ruslan Bilovol   2013-02-14  196  =

f9d41eefcfbb91 Ruslan Bilovol   2013-02-14  197  	pr_info("%s", soc_name);
84a34344ea1f2f Lauri Leukkunen  2008-12-10  198  	if ((omap_rev() >> 8) & 0=
x0f)
04a92358b39649 Aaro Koskinen    2018-11-19  199  		pr_cont("%s", soc_rev);
04a92358b39649 Aaro Koskinen    2018-11-19  200  	pr_cont("\n");
a88231430384f4 Tony Lindgren    2008-12-10  201  }
a88231430384f4 Tony Lindgren    2008-12-10  202  =


:::::: The code at line 158 was first introduced by commit
:::::: 1dbae815a724303b46ab4663b5fc23c13e9d9690 [ARM] 3145/1: OMAP 3a/5: Ad=
d support for omap24xx

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4483545488131826762==--

