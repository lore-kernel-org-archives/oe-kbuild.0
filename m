Content-Type: multipart/mixed; boundary="===============7675204621969105078=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/ufs/ufshcd-pci.c:83:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 31 Jan 2022 14:09:08 +0800
Message-ID: <202201311445.oLOuio87-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7675204621969105078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: b2c57925df1ffc9c930629a39c1680035f735ffb scsi: ufs: ufs-pci: Add su=
pport for Intel LKF
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220130 (https://download.01.org/0day-ci/archi=
ve/20220131/202201311445.oLOuio87-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db2c57925df1ffc9c930629a39c1680035f735ffb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b2c57925df1ffc9c930629a39c1680035f735ffb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
            ^
   fs/btrfs/transaction.c:986:6: note: Left side of '||' is true
           if (TRANS_ABORTED(trans) ||
               ^
   fs/btrfs/transaction.h:152:41: note: expanded from macro 'TRANS_ABORTED'
   #define TRANS_ABORTED(trans)            (unlikely(READ_ONCE((trans)->abo=
rted)))
                                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:282:59: note: expanded from macro '__nati=
ve_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
                                                                    ^
   fs/btrfs/transaction.c:986:6: note: Taking false branch
           if (TRANS_ABORTED(trans) ||
               ^
   fs/btrfs/transaction.h:152:41: note: expanded from macro 'TRANS_ABORTED'
   #define TRANS_ABORTED(trans)            (unlikely(READ_ONCE((trans)->abo=
rted)))
                                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   fs/btrfs/transaction.c:986:6: note: Loop condition is false.  Exiting lo=
op
           if (TRANS_ABORTED(trans) ||
               ^
   fs/btrfs/transaction.h:152:41: note: expanded from macro 'TRANS_ABORTED'
   #define TRANS_ABORTED(trans)            (unlikely(READ_ONCE((trans)->abo=
rted)))
                                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   fs/btrfs/transaction.c:986:6: note: Assuming the condition is true
           if (TRANS_ABORTED(trans) ||
               ^
   fs/btrfs/transaction.h:152:32: note: expanded from macro 'TRANS_ABORTED'
   #define TRANS_ABORTED(trans)            (unlikely(READ_ONCE((trans)->abo=
rted)))
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/btrfs/transaction.c:986:6: note: Left side of '||' is false
           if (TRANS_ABORTED(trans) ||
               ^
   fs/btrfs/transaction.h:152:31: note: expanded from macro 'TRANS_ABORTED'
   #define TRANS_ABORTED(trans)            (unlikely(READ_ONCE((trans)->abo=
rted)))
                                           ^
   fs/btrfs/transaction.c:987:6: note: Assuming the condition is false
               test_bit(BTRFS_FS_STATE_ERROR, &info->fs_state)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:986:2: note: Taking false branch
           if (TRANS_ABORTED(trans) ||
           ^
   fs/btrfs/transaction.c:1001:9: note: Returning; memory was released
           return __btrfs_end_transaction(trans, 0);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:1921:2: note: Returning; memory was released
           btrfs_end_transaction(trans);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:1927:2: note: Taking true branch
           if (ac->newtrans->type & __TRANS_FREEZABLE)
           ^
   fs/btrfs/transaction.c:1933:6: note: Assuming 'wait_for_unblock' is 0
           if (wait_for_unblock)
               ^~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:1933:2: note: Taking false branch
           if (wait_for_unblock)
           ^
   fs/btrfs/transaction.c:1936:3: note: Use of memory after it is freed
                   wait_current_trans_commit_start(fs_info, cur_trans);
                   ^                                        ~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/scsi/ufs/ufshcd-pci.c:83:2: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           err =3D __intel_dsm(intel_host, dev, INTEL_DSM_FNS, &intel_host-=
>dsm_fns);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/scsi/ufs/ufshcd-pci.c:83:2: note: Value stored to 'err' is never=
 read
           err =3D __intel_dsm(intel_host, dev, INTEL_DSM_FNS, &intel_host-=
>dsm_fns);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/scsi/initio.c:403:8: warning: Although the value stored to 'rb' =
is used in the enclosing expression, the value is never actually read from =
'rb' [clang-analyzer-deadcode.DeadStores]
                   if ((rb =3D inb(base + TUL_NVRAM)) & SE2DI)
                        ^
   drivers/scsi/initio.c:403:8: note: Although the value stored to 'rb' is =
used in the enclosing expression, the value is never actually read from 'rb'
   drivers/scsi/initio.c:1170:9: warning: Although the value stored to 'scb=
' is used in the enclosing expression, the value is never actually read fro=
m 'scb' [clang-analyzer-deadcode.DeadStores]
                           if ((scb =3D host->active) !=3D NULL)
                                ^     ~~~~~~~~~~~~
   drivers/scsi/initio.c:1170:9: note: Although the value stored to 'scb' i=
s used in the enclosing expression, the value is never actually read from '=
scb'
                           if ((scb =3D host->active) !=3D NULL)
                                ^     ~~~~~~~~~~~~
   1 warning generated.
   drivers/scsi/a100u2w.c:1142:2: warning: Value stored to 'biosaddr' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           biosaddr =3D (biosaddr << 4);
           ^          ~~~~~~~~~~~~~~~
   drivers/scsi/a100u2w.c:1142:2: note: Value stored to 'biosaddr' is never=
 read
           biosaddr =3D (biosaddr << 4);
           ^          ~~~~~~~~~~~~~~~
   3 warnings generated.
   drivers/media/i2c/adv7175.c:416:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7175_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7175.c:416:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7175_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7175.c:417:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7175_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7175.c:417:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7175_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   18 warnings generated.
   drivers/media/i2c/adv7842.c:1566:32: warning: The result of the left shi=
ft is undefined because the left operand is negative [clang-analyzer-core.U=
ndefinedBinaryOperatorResult]
                   freq =3D ((hdmi_read(sd, 0x51) << 1) + (hdmi_read(sd, 0x=
52) >> 7)) * 1000000;
                                                ^
   drivers/media/i2c/adv7842.c:2708:36: note: Assuming the condition is fal=
se
           v4l2_info(sd, "Chip power: %s\n", no_power(sd) ? "off" : "on");
                                             ^
   include/media/v4l2-common.h:67:39: note: expanded from macro 'v4l2_info'
           v4l2_printk(KERN_INFO, dev, fmt , ## arg)
                                                ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_print=
k'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                                                     ^~~
   drivers/media/i2c/adv7842.c:2708:36: note: '?' condition is false
           v4l2_info(sd, "Chip power: %s\n", no_power(sd) ? "off" : "on");
                                             ^
   drivers/media/i2c/adv7842.c:2710:4: note: Assuming field 'hdmi_port_a' i=
s false
                           state->hdmi_port_a ? "A" : "B");
                           ^
   include/media/v4l2-common.h:67:39: note: expanded from macro 'v4l2_info'
           v4l2_printk(KERN_INFO, dev, fmt , ## arg)
                                                ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_print=
k'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                                                     ^~~
   drivers/media/i2c/adv7842.c:2710:4: note: '?' condition is false
                           state->hdmi_port_a ? "A" : "B");
                           ^
   drivers/media/i2c/adv7842.c:2712:7: note: Assuming the condition is false
                     ((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)) ?
                       ^
   include/media/v4l2-common.h:67:39: note: expanded from macro 'v4l2_info'
           v4l2_printk(KERN_INFO, dev, fmt , ## arg)
                                                ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_print=
k'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                                                     ^~~
   drivers/media/i2c/adv7842.c:2712:28: note: Left side of '&&' is false
                     ((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)) ?
                                            ^
   drivers/media/i2c/adv7842.c:2714:7: note: Assuming the condition is false
                     ((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)) ?
                       ^
   include/media/v4l2-common.h:67:39: note: expanded from macro 'v4l2_info'
           v4l2_printk(KERN_INFO, dev, fmt , ## arg)
                                                ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_print=
k'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                                                     ^~~
   drivers/media/i2c/adv7842.c:2714:28: note: Left side of '&&' is false
                     ((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)) ?
                                            ^
   drivers/media/i2c/adv7842.c:2717:5: note: Assuming the condition is false
                     reg_io_0x21 & 0x02 ? "enabled" : "disabled",

vim +/err +83 drivers/scsi/ufs/ufshcd-pci.c

b2c57925df1ffc Adrian Hunter 2021-03-12  78  =

b2c57925df1ffc Adrian Hunter 2021-03-12  79  static void intel_dsm_init(str=
uct intel_host *intel_host, struct device *dev)
b2c57925df1ffc Adrian Hunter 2021-03-12  80  {
b2c57925df1ffc Adrian Hunter 2021-03-12  81  	int err;
b2c57925df1ffc Adrian Hunter 2021-03-12  82  =

b2c57925df1ffc Adrian Hunter 2021-03-12 @83  	err =3D __intel_dsm(intel_hos=
t, dev, INTEL_DSM_FNS, &intel_host->dsm_fns);
b2c57925df1ffc Adrian Hunter 2021-03-12  84  	dev_dbg(dev, "DSM fns %#x, er=
ror %d\n", intel_host->dsm_fns, err);
b2c57925df1ffc Adrian Hunter 2021-03-12  85  }
b2c57925df1ffc Adrian Hunter 2021-03-12  86  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7675204621969105078==--

