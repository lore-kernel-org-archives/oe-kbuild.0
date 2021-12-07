Content-Type: multipart/mixed; boundary="===============6331266218780396706=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/hda/intel-dsp-config.c:29:8: warning: Excessive padding in 'struct config_entry' (8 padding bytes, where 0 is optimal).
Date: Tue, 07 Dec 2021 15:46:56 +0800
Message-ID: <202112071528.xE1J5Vv0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6331266218780396706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Huajun Li <huajun.li@intel.com>
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: 9d36ceab94151f07cf3fcb067213ac87937adf12 ALSA: intel-dsp-config: ad=
d quirk for APL/GLK/TGL devices based on ES8336 codec
date:   9 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-c007-20211205 (https://download.01.org/0day-ci/ar=
chive/20211207/202112071528.xE1J5Vv0-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6e8678=
903523019903222e4521a5e41af743cab0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9d36ceab94151f07cf3fcb067213ac87937adf12
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9d36ceab94151f07cf3fcb067213ac87937adf12
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mmc/host/usdhi6rol0.c:1693:4: note: Calling 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO1),
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:226:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "%s(0x%p + 0x%x) =3D 0x%x\n", __fun=
c__,
           ^
   include/linux/dev_printk.h:261:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/usdhi6rol0.c:228:2: note: Returning without writing to =
'host->wait', which participates in a condition later
           return data;
           ^
   drivers/mmc/host/usdhi6rol0.c:1693:4: note: Returning from 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO1),
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1694:4: note: Calling 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO2), host->irq_status);
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:226:2: note: Taking false branch
           dev_vdbg(mmc_dev(host->mmc), "%s(0x%p + 0x%x) =3D 0x%x\n", __fun=
c__,
           ^
   include/linux/dev_printk.h:261:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/mmc/host/usdhi6rol0.c:228:2: note: Returning without writing to =
'host->wait', which participates in a condition later
           return data;
           ^
   drivers/mmc/host/usdhi6rol0.c:1694:4: note: Returning from 'usdhi6_read'
                    usdhi6_read(host, USDHI6_SD_INFO2), host->irq_status);
                    ^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
                                                                           =
    ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/mmc/host/usdhi6rol0.c:1696:12: note: Field 'dma_active' is false
           if (host->dma_active) {
                     ^
   drivers/mmc/host/usdhi6rol0.c:1696:2: note: Taking false branch
           if (host->dma_active) {
           ^
   drivers/mmc/host/usdhi6rol0.c:1701:2: note: Control jumps to 'case USDHI=
6_WAIT_FOR_DATA_END:'  at line 1727
           switch (host->wait) {
           ^
   drivers/mmc/host/usdhi6rol0.c:1729:15: note: Access to field 'error' res=
ults in a dereference of a null pointer (loaded from variable 'data')
                   data->error =3D -ETIMEDOUT;
                   ~~~~        ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   lib/zstd/fse_compress.c:114:2: warning: Value stored to 'workspace' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           workspace =3D (U32 *)workspace + spaceUsed32;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:114:2: note: Value stored to 'workspace' is neve=
r read
           workspace =3D (U32 *)workspace + spaceUsed32;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:115:2: warning: Value stored to 'workspaceSize' =
is never read [clang-analyzer-deadcode.DeadStores]
           workspaceSize -=3D (spaceUsed32 << 2);
           ^                ~~~~~~~~~~~~~~~~~~
   lib/zstd/fse_compress.c:115:2: note: Value stored to 'workspaceSize' is =
never read
           workspaceSize -=3D (spaceUsed32 << 2);
           ^                ~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   7 warnings generated.
   Suppressed 7 warnings (4 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> sound/hda/intel-dsp-config.c:29:8: warning: Excessive padding in 'struct=
 config_entry' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   dmi_table, =

   flags, =

   device, =

   acpi_hid, =

   codec_hid, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct config_entry {
   ~~~~~~~^~~~~~~~~~~~~~
   sound/hda/intel-dsp-config.c:29:8: note: Excessive padding in 'struct co=
nfig_entry' (8 padding bytes, where 0 is optimal). Optimal fields order: dm=
i_table, flags, device, acpi_hid, codec_hid, consider reordering the fields=
 or adding explicit padding members
   struct config_entry {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   sound/virtio/virtio_ctl_msg.c:238:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   sound/virtio/virtio_ctl_msg.c:238:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&queue->lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   sound/virtio/virtio_ctl_msg.c:239:2: note: Loop condition is true.  Ente=
ring loop body
           while (!list_empty(&snd->ctl_msgs)) {
           ^
   sound/virtio/virtio_ctl_msg.c:241:4: note: Left side of '&&' is false
                           list_first_entry(&snd->ctl_msgs, struct virtio_s=
nd_msg,
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/virtio/virtio_ctl_msg.c:241:4: note: Taking false branch
                           list_first_entry(&snd->ctl_msgs, struct virtio_s=
nd_msg,
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/virtio/virtio_ctl_msg.c:241:4: note: Loop condition is false.  Exi=
ting loop
                           list_first_entry(&snd->ctl_msgs, struct virtio_s=
nd_msg,
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)

vim +29 sound/hda/intel-dsp-config.c

0650857570d1614 Pierre-Louis Bossart 2020-04-09  25  =

0650857570d1614 Pierre-Louis Bossart 2020-04-09  26  #define FLAG_SOF_ONLY_=
IF_DMIC_OR_SOUNDWIRE (FLAG_SOF_ONLY_IF_DMIC | \
0650857570d1614 Pierre-Louis Bossart 2020-04-09  27  					    FLAG_SOF_ONLY=
_IF_SOUNDWIRE)
82d9d54a6c0ee8b Jaroslav Kysela      2019-10-22  28  =

82d9d54a6c0ee8b Jaroslav Kysela      2019-10-22 @29  struct config_entry {
82d9d54a6c0ee8b Jaroslav Kysela      2019-10-22  30  	u32 flags;
82d9d54a6c0ee8b Jaroslav Kysela      2019-10-22  31  	u16 device;
b5682305297db24 Pierre-Louis Bossart 2020-11-12  32  	u8 acpi_hid[ACPI_ID_L=
EN];
82d9d54a6c0ee8b Jaroslav Kysela      2019-10-22  33  	const struct dmi_syst=
em_id *dmi_table;
9d36ceab94151f0 Pierre-Louis Bossart 2021-10-04  34  	u8 codec_hid[ACPI_ID_=
LEN];
82d9d54a6c0ee8b Jaroslav Kysela      2019-10-22  35  };
82d9d54a6c0ee8b Jaroslav Kysela      2019-10-22  36  =


:::::: The code at line 29 was first introduced by commit
:::::: 82d9d54a6c0ee8b12211fa4e59fd940a2da4e063 ALSA: hda: add Intel DSP co=
nfiguration / probe code

:::::: TO: Jaroslav Kysela <perex@perex.cz>
:::::: CC: Takashi Iwai <tiwai@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6331266218780396706==--

