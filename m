Content-Type: multipart/mixed; boundary="===============2290961967624024923=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ptp/ptp_ocp.c:1845:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-an...
Date: Tue, 04 Jan 2022 02:29:05 +0800
Message-ID: <202201040222.3fGkD7jz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2290961967624024923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Lemon <jonathan.lemon@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: f67bf662d2cffa2ddf19ffa23381d49c9cffd783 ptp: ocp: Add debugfs entr=
y for timecard
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-c001-20211215 (https://download.01.org/0day-ci/arch=
ive/20220104/202201040222.3fGkD7jz-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df67bf662d2cffa2ddf19ffa23381d49c9cffd783
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f67bf662d2cffa2ddf19ffa23381d49c9cffd783
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/x86/include/asm/bug.h:78:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_begin();                                \
           ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   net/caif/cfcnfg.c:407:2: note: Loop condition is false.  Exiting loop
           caif_assert(phyinfo->phy_layer !=3D NULL);
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_asse=
rt'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:79:2: note: expanded from macro '__WARN_FLAGS'
           _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));           \
           ^
   arch/x86/include/asm/bug.h:25:37: note: expanded from macro '_BUG_FLAGS'
   #define _BUG_FLAGS(ins, flags)                                          \
                                                                           ^
   net/caif/cfcnfg.c:407:2: note: Loop condition is false.  Exiting loop
           caif_assert(phyinfo->phy_layer !=3D NULL);
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_asse=
rt'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:81:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_end();                                  \
           ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   net/caif/cfcnfg.c:407:2: note: Loop condition is false.  Exiting loop
           caif_assert(phyinfo->phy_layer !=3D NULL);
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_asse=
rt'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:76:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   net/caif/cfcnfg.c:407:2: note: Loop condition is false.  Exiting loop
           caif_assert(phyinfo->phy_layer !=3D NULL);
           ^
   include/net/caif/caif_layer.h:27:33: note: expanded from macro 'caif_ass=
ert'
   #define caif_assert(assert)                                     \
                                                                   ^
   net/caif/cfcnfg.c:408:14: note: Access to field 'id' results in a derefe=
rence of a null pointer (loaded from field 'phy_layer')
           caif_assert(phyinfo->phy_layer->id =3D=3D phyid);
                       ^
   include/net/caif/caif_layer.h:29:8: note: expanded from macro 'caif_asse=
rt'
           if (!(assert)) {                                        \
                 ^~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/gma500/psb_irq.c:185:3: warning: Value stored to 'val' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   val =3D PSB_RSGX32(PSB_CR_2D_BLIT_STATUS);
                   ^
   drivers/gpu/drm/gma500/psb_irq.c:185:3: note: Value stored to 'val' is n=
ever read
   Suppressed 11 warnings (9 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/ptp/ptp_ocp.c:1845:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ans, def);
           ^~~~~~
   drivers/ptp/ptp_ocp.c:1845:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(ans, def);
           ^~~~~~
>> drivers/ptp/ptp_ocp.c:1849:3: warning: Value stored to 'ans' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   ans +=3D sprintf(ans, "%s ", sec);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:1849:3: note: Value stored to 'ans' is never read
                   ans +=3D sprintf(ans, "%s ", sec);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:1975:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buf, "unknown");
                   ^~~~~~
   drivers/ptp/ptp_ocp.c:1975:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(buf, "unknown");
                   ^~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/linux/hid.h:1007:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-belkin.c:32:6: note: Assuming the condition is false
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_CONSUMER ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-belkin.c:32:6: note: Left side of '||' is false
   drivers/hid/hid-belkin.c:33:4: note: Assuming the condition is false
                           !(quirks & BELKIN_WKBD))
                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-belkin.c:32:2: note: Taking false branch
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_CONSUMER ||
           ^
   drivers/hid/hid-belkin.c:36:2: note: Control jumps to 'case 60:'  at lin=
e 39
           switch (usage->hid & HID_USAGE) {
           ^
   drivers/hid/hid-belkin.c:39:14: note: Calling 'hid_map_usage_clear'
           case 0x03c: belkin_map_key_clear(KEY_DOCUMENTS);        break;
                       ^
   drivers/hid/hid-belkin.c:24:33: note: expanded from macro 'belkin_map_ke=
y_clear'
   #define belkin_map_key_clear(c) hid_map_usage_clear(hi, usage, bit, max,=
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
   include/linux/hid.h:1006:3: note: Left side of '&&' is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'

vim +1845 drivers/ptp/ptp_ocp.c

f67bf662d2cffa Jonathan Lemon 2021-09-14  1838  =

f67bf662d2cffa Jonathan Lemon 2021-09-14  1839  static void
f67bf662d2cffa Jonathan Lemon 2021-09-14  1840  gpio_multi_map(char *buf, u=
32 gpio, u32 bit,
f67bf662d2cffa Jonathan Lemon 2021-09-14  1841  	       const char *pri, co=
nst char *sec, const char *def)
f67bf662d2cffa Jonathan Lemon 2021-09-14  1842  {
f67bf662d2cffa Jonathan Lemon 2021-09-14  1843  	char *ans =3D buf;
f67bf662d2cffa Jonathan Lemon 2021-09-14  1844  =

f67bf662d2cffa Jonathan Lemon 2021-09-14 @1845  	strcpy(ans, def);
f67bf662d2cffa Jonathan Lemon 2021-09-14  1846  	if (gpio & (1 << bit))
f67bf662d2cffa Jonathan Lemon 2021-09-14  1847  		ans +=3D sprintf(ans, "%s=
 ", pri);
f67bf662d2cffa Jonathan Lemon 2021-09-14  1848  	if (gpio & (1 << (bit + 16=
)))
f67bf662d2cffa Jonathan Lemon 2021-09-14 @1849  		ans +=3D sprintf(ans, "%s=
 ", sec);
f67bf662d2cffa Jonathan Lemon 2021-09-14  1850  }
f67bf662d2cffa Jonathan Lemon 2021-09-14  1851  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2290961967624024923==--

