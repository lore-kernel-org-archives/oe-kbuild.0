Content-Type: multipart/mixed; boundary="===============0456185222228359571=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/intel/iwlegacy/common.c:1434:39: warning: Value stored to 'scan_notif' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 03 Jan 2022 10:47:02 +0800
Message-ID: <202201031008.of9ldCoK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0456185222228359571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: fa9f5d0e0b45a06802f7cb3afed237be6066821e iwlegacy: avoid -Wempty-bo=
dy warning
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-c001-20211215 (https://download.01.org/0day-ci/arch=
ive/20220103/202201031008.of9ldCoK-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfa9f5d0e0b45a06802f7cb3afed237be6066821e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fa9f5d0e0b45a06802f7cb3afed237be6066821e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^     ~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (15 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   16 warnings generated.
   drivers/video/fbdev/aty/atyfb_base.c:167:10: warning: 1st function call =
argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   return aty_ld_le32(lt_lcd_regs[index], par);
                          ^
   drivers/video/fbdev/aty/atyfb_base.c:2220:32: note: Passing the value 20=
 via 1st parameter 'index'
           unsigned int reg =3D aty_ld_lcd(LCD_MISC_CNTL, par);
                                         ^
   include/video/mach64.h:1273:24: note: expanded from macro 'LCD_MISC_CNTL'
   #define LCD_MISC_CNTL           0x14
                                   ^~~~
   drivers/video/fbdev/aty/atyfb_base.c:2220:21: note: Calling 'aty_ld_lcd'
           unsigned int reg =3D aty_ld_lcd(LCD_MISC_CNTL, par);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/aty/atyfb_base.c:166:6: note: Assuming the condition=
 is true
           if (M64_HAS(LT_LCD_REGS)) {
               ^
   drivers/video/fbdev/aty/atyfb.h:197:27: note: expanded from macro 'M64_H=
AS'
   #define M64_HAS(feature)        ((par)->features & (M64F_##feature))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/aty/atyfb_base.c:166:2: note: Taking true branch
           if (M64_HAS(LT_LCD_REGS)) {
           ^
   drivers/video/fbdev/aty/atyfb_base.c:167:10: note: 1st function call arg=
ument is an uninitialized value
                   return aty_ld_le32(lt_lcd_regs[index], par);
                          ^           ~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/mtd/nand/raw/nand_bbt.c:550:3: warning: Value stored to 'bbtbloc=
ks' is never read [clang-analyzer-deadcode.DeadStores]
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_bbt.c:550:3: note: Value stored to 'bbtblocks'=
 is never read
                   bbtblocks =3D mtd->size >> this->bbt_erase_shift;
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> drivers/net/wireless/intel/iwlegacy/common.c:1434:39: warning: Value sto=
red to 'scan_notif' during its initialization is never read [clang-analyzer=
-deadcode.DeadStores]
           struct il_scancomplete_notification *scan_notif =3D (void *)pkt-=
>u.raw;
                                                ^~~~~~~~~~   ~~~~~~~~~~~~~~=
~~~~
   drivers/net/wireless/intel/iwlegacy/common.c:1434:39: note: Value stored=
 to 'scan_notif' during its initialization is never read
           struct il_scancomplete_notification *scan_notif =3D (void *)pkt-=
>u.raw;
                                                ^~~~~~~~~~   ~~~~~~~~~~~~~~=
~~~~
   drivers/net/wireless/intel/iwlegacy/common.c:5491:2: warning: Value stor=
ed to 'inta_mask' is never read [clang-analyzer-deadcode.DeadStores]
           inta_mask =3D _il_rd(il, CSR_INT_MASK);   /* just for debug */
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/common.c:5491:2: note: Value stored =
to 'inta_mask' is never read
           inta_mask =3D _il_rd(il, CSR_INT_MASK);   /* just for debug */
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:254:3: warning: Use of me=
mory after it is freed [clang-analyzer-unix.Malloc]
                   list_del(element);
                   ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2826:2: note: Taking fals=
e branch
           D_MAC80211("enter\n");
           ^
   drivers/net/wireless/intel/iwlegacy/common.h:3025:29: note: expanded fro=
m macro 'D_MAC80211'
   #define D_MAC80211(f, a...)     IL_DBG(IL_DL_MAC80211, f, ## a)
                                   ^
   drivers/net/wireless/intel/iwlegacy/common.h:2940:37: note: expanded fro=
m macro 'IL_DBG'
   #define IL_DBG(level, fmt, args...) no_printk(fmt, ##args)
                                       ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2828:6: note: Assuming fi=
eld 'is_open' is not equal to 0
           if (!il->is_open) {
               ^~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2828:2: note: Taking fals=
e branch
           if (!il->is_open) {
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2835:2: note: Calling 'il=
3945_down'
           il3945_down(il);
           ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2312:2: note: Calling '__=
il3945_down'
           __il3945_down(il);
           ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2227:2: note: Taking fals=
e branch
           D_INFO(DRV_NAME " is going down\n");
           ^
   drivers/net/wireless/intel/iwlegacy/common.h:3024:26: note: expanded fro=
m macro 'D_INFO'
   #define D_INFO(f, a...)         IL_DBG(IL_DL_INFO, f, ## a)
                                   ^
   drivers/net/wireless/intel/iwlegacy/common.h:2940:37: note: expanded fro=
m macro 'IL_DBG'
   #define IL_DBG(level, fmt, args...) no_printk(fmt, ##args)
                                       ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2247:6: note: Assuming 'e=
xit_pending' is not equal to 0
           if (!exit_pending)
               ^~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2247:2: note: Taking fals=
e branch
           if (!exit_pending)
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2254:2: note: Loop condit=
ion is false.  Exiting loop
           spin_lock_irqsave(&il->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2254:2: note: Loop condit=
ion is false.  Exiting loop
           spin_lock_irqsave(&il->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2259:6: note: Assuming fi=
eld 'mac80211_registered' is 0
           if (il->mac80211_registered)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2259:2: note: Taking fals=
e branch
           if (il->mac80211_registered)
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2264:6: note: Assuming th=
e condition is true
           if (!il_is_init(il)) {
               ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2264:2: note: Taking true=
 branch
           if (!il_is_init(il)) {
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2269:3: note: Control jum=
ps to line 2300
                   goto exit;
                   ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:2305:2: note: Calling 'il=
3945_clear_free_frames'
           il3945_clear_free_frames(il);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:250:2: note: Taking false=
 branch
           D_INFO("%d frames on pre-allocated heap on clear.\n", il->frames=
_count);
           ^
   drivers/net/wireless/intel/iwlegacy/common.h:3024:26: note: expanded fro=
m macro 'D_INFO'
   #define D_INFO(f, a...)         IL_DBG(IL_DL_INFO, f, ## a)
                                   ^
   drivers/net/wireless/intel/iwlegacy/common.h:2940:37: note: expanded fro=
m macro 'IL_DBG'
   #define IL_DBG(level, fmt, args...) no_printk(fmt, ##args)
                                       ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:252:2: note: Loop conditi=
on is true.  Entering loop body
           while (!list_empty(&il->free_frames)) {
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:255:9: note: Left side of=
 '&&' is false
                   kfree(list_entry(element, struct il3945_frame, list));
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:255:9: note: Taking false=
 branch
                   kfree(list_entry(element, struct il3945_frame, list));
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:255:9: note: Loop conditi=
on is false.  Exiting loop
                   kfree(list_entry(element, struct il3945_frame, list));
                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:255:3: note: Memory is re=
leased
                   kfree(list_entry(element, struct il3945_frame, list));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:252:2: note: Loop conditi=
on is true.  Entering loop body
           while (!list_empty(&il->free_frames)) {
           ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:254:3: note: Use of memor=
y after it is freed
                   list_del(element);
                   ^        ~~~~~~~
>> drivers/net/wireless/intel/iwlegacy/3945-mac.c:754:20: warning: Value st=
ored to 'pkt' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct il_rx_pkt *pkt =3D rxb_addr(rxb);
                             ^~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:754:20: note: Value store=
d to 'pkt' during its initialization is never read
           struct il_rx_pkt *pkt =3D rxb_addr(rxb);
                             ^~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:1222:3: warning: Value st=
ored to 'len' is never read [clang-analyzer-deadcode.DeadStores]
                   len +=3D sizeof(u32);     /* account for status word */
                   ^      ~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:1222:3: note: Value store=
d to 'len' is never read
                   len +=3D sizeof(u32);     /* account for status word */
                   ^      ~~~~~~~~~~~
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:1429:3: warning: Value st=
ored to 'handled' is never read [clang-analyzer-deadcode.DeadStores]
                   handled |=3D CSR_INT_BIT_HW_ERR;
                   ^
   drivers/net/wireless/intel/iwlegacy/3945-mac.c:1429:3: note: Value store=
d to 'handled' is never read
   Suppressed 17 warnings (16 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/net/wireless/broadcom/b43legacy/main.c:746:3: warning: Value sto=
red to 'dummy' is never read [clang-analyzer-deadcode.DeadStores]
                   dummy =3D b43legacy_read32(dev, B43legacy_MMIO_XMITSTAT_=
1);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/b43legacy/main.c:746:3: note: Value stored=
 to 'dummy' is never read
                   dummy =3D b43legacy_read32(dev, B43legacy_MMIO_XMITSTAT_=
1);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/b43legacy/main.c:807:35: warning: The left=
 operand of '=3D=3D' is a garbage value [clang-analyzer-core.UndefinedBinar=
yOperatorResult]
           if (noise[0] =3D=3D 0x7F || noise[1] =3D=3D 0x7F ||
                                   ~~~~~~~~ ^
   drivers/net/wireless/broadcom/b43legacy/main.c:803:20: note: Assuming fi=
eld 'calculation_running' is true
           B43legacy_WARN_ON(!dev->noisecalc.calculation_running);
                             ^
   drivers/net/wireless/broadcom/b43legacy/b43legacy.h:348:69: note: expand=
ed from macro 'B43legacy_WARN_ON'
   # define B43legacy_WARN_ON(x)   __b43legacy_warn_on_dummy(unlikely(!!(x)=
))
                                                                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/wireless/broadcom/b43legacy/main.c:804:6: note: Assuming fie=
ld 'channel_at_start' is equal to field 'channel'
           if (dev->noisecalc.channel_at_start !=3D phy->channel)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/b43legacy/main.c:804:2: note: Taking false=
 branch
           if (dev->noisecalc.channel_at_start !=3D phy->channel)
           ^
   drivers/net/wireless/broadcom/b43legacy/main.c:807:6: note: Assuming the=
 condition is false
           if (noise[0] =3D=3D 0x7F || noise[1] =3D=3D 0x7F ||
               ^~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/b43legacy/main.c:807:6: note: Left side of=
 '||' is false
   drivers/net/wireless/broadcom/b43legacy/main.c:807:35: note: The left op=
erand of '=3D=3D' is a garbage value
           if (noise[0] =3D=3D 0x7F || noise[1] =3D=3D 0x7F ||
                                   ~~~~~~~~ ^
   drivers/net/wireless/broadcom/b43legacy/main.c:1423:13: warning: Access =
to field 'wl' results in a dereference of a null pointer (loaded from varia=
ble 'dev') [clang-analyzer-core.NullDereference]
           spin_lock(&dev->wl->irq_lock);
                      ^~~
   drivers/net/wireless/broadcom/b43legacy/main.c:1418:2: note: 'dev' initi=
alized here
           struct b43legacy_wldev *dev =3D dev_id;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/b43legacy/main.c:1421:20: note: Assuming '=
dev' is null
           B43legacy_WARN_ON(!dev);
                             ^
   drivers/net/wireless/broadcom/b43legacy/b43legacy.h:348:69: note: expand=
ed from macro 'B43legacy_WARN_ON'
   # define B43legacy_WARN_ON(x)   __b43legacy_warn_on_dummy(unlikely(!!(x)=
))
                                                                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/wireless/broadcom/b43legacy/main.c:1423:13: note: Access to =
field 'wl' results in a dereference of a null pointer (loaded from variable=
 'dev')
           spin_lock(&dev->wl->irq_lock);
                      ^~~
   drivers/net/wireless/broadcom/b43legacy/main.c:1643:2: warning: Value st=
ored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err =3D -ENODEV;
           ^     ~~~~~~~
   drivers/net/wireless/broadcom/b43legacy/main.c:1643:2: note: Value store=
d to 'err' is never read
           err =3D -ENODEV;
           ^     ~~~~~~~
   drivers/net/wireless/broadcom/b43legacy/main.c:3777:28: warning: Access =
to field 'hw' results in a dereference of a null pointer (loaded from varia=
ble 'wl') [clang-analyzer-core.NullDereference]
           struct ieee80211_hw *hw =3D wl->hw;
                                     ^
   drivers/net/wireless/broadcom/b43legacy/main.c:3850:7: note: Calling 'ss=
b_get_devtypedata'
           wl =3D ssb_get_devtypedata(dev);
                ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ssb/ssb.h:312:2: note: Returning without writing to 'dev->=
devtypedata', which participates in a condition later
           return dev->devtypedata;
           ^
   include/linux/ssb/ssb.h:312:2: note: Returning without writing to 'dev->=
devtypedata'
   include/linux/ssb/ssb.h:312:2: note: Returning pointer, which participat=
es in a condition later
           return dev->devtypedata;
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/b43legacy/main.c:3850:7: note: Returning f=
rom 'ssb_get_devtypedata'
           wl =3D ssb_get_devtypedata(dev);
                ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/broadcom/b43legacy/main.c:3851:6: note: Assuming 'w=
l' is null
           if (!wl) {
               ^~~
   drivers/net/wireless/broadcom/b43legacy/main.c:3851:2: note: Taking true=
 branch
           if (!wl) {
           ^
   drivers/net/wireless/broadcom/b43legacy/main.c:3854:9: note: Value assig=
ned to field 'devtypedata'
                   err =3D b43legacy_wireless_init(dev);

vim +/scan_notif +1434 drivers/net/wireless/intel/iwlegacy/common.c

0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1432  =

0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1433  	struct il_rx_pkt *pkt =3D rxb_addr(rxb);
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15 @1434  	struct il_scancomplete_notification *scan_notif =3D (=
void *)pkt->u.raw;
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1435  =

e7392364fcd100 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1436  	D_SCAN("Scan complete: %d channels (TSF 0x%08X:%08X) =
- %d\n",
e7392364fcd100 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1437  	       scan_notif->scanned_channels, scan_notif->tsf_=
low,
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1438  	       scan_notif->tsf_high, scan_notif->status);
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1439  =

0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1440  	/* The HW is no longer scanning */
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1441  	clear_bit(S_SCAN_HW, &il->status);
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1442  =

0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1443  	D_SCAN("Scan on %sGHz took %dms\n",
57fbcce37be7c1 drivers/net/wireless/intel/iwlegacy/common.c Johannes Berg  =
   2016-04-12  1444  	       (il->scan_band =3D=3D NL80211_BAND_2GHZ) ? "2.=
4" : "5.2",
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1445  	       jiffies_to_msecs(jiffies - il->scan_start));
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1446  =

0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1447  	queue_work(il->workqueue, &il->scan_completed);
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1448  }
0cdc21363cc279 drivers/net/wireless/iwlegacy/common.c       Stanislaw Grusz=
ka 2011-11-15  1449  =


:::::: The code at line 1434 was first introduced by commit
:::::: 0cdc21363cc27989fe9aa1cde614ef4c0429d62f iwlegacy: merge common .c f=
iles

:::::: TO: Stanislaw Gruszka <sgruszka@redhat.com>
:::::: CC: Stanislaw Gruszka <sgruszka@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0456185222228359571==--

