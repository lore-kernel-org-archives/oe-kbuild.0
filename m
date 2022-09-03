Content-Type: multipart/mixed; boundary="===============0750509630829313285=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/eir.c:212:2: warning: Value stored to 'ptr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 03 Sep 2022 17:06:41 +0800
Message-ID: <202209031604.MOfwAiBu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0750509630829313285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/bluet=
ooth/eir.c:212:2: warning: Value stored to 'ptr' is never read [clang-analy=
zer-deadcode.DeadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d895ec7938c431fe61a731939da76a6461bc6133
commit: 01ce70b0a274bd76a5a311fb90d4d446d9bdfea1 Bluetooth: eir: Move EIR/A=
dv Data functions to its own file
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220901 (https://download.01.org/0day-ci/archi=
ve/20220903/202209031604.MOfwAiBu-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D01ce70b0a274bd76a5a311fb90d4d446d9bdfea1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 01ce70b0a274bd76a5a311fb90d4d446d9bdfea1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:52:2: note: Taking false branch
           if (gpios =3D=3D NULL)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:55:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < UART_GPIO_MAX; i++)
           ^
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Assuming the conditio=
n is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                       ^~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:7: note: Left side of '&&' is =
true
   drivers/tty/serial/serial_mctrl_gpio.c:56:25: note: Assuming the conditi=
on is true
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_mctrl_gpio.c:56:3: note: Taking true branch
                   if (gpios->gpio[i] && mctrl_gpio_flags_is_dir_out(i)) {
                   ^
   drivers/tty/serial/serial_mctrl_gpio.c:58:4: note: Calling '__assign_bit'
                           __assign_bit(count, values,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:251:6: note: Assuming 'value' is false
           if (value)
               ^~~~~
   include/linux/bitops.h:251:2: note: Taking false branch
           if (value)
           ^
   include/linux/bitops.h:254:3: note: Calling '__clear_bit'
                   __clear_bit(nr, addr);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:29:5: note: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage
           *p &=3D ~mask;
           ~~ ^
   6 warnings generated.
   fs/ext4/fast_commit.c:800:2: warning: Value stored to 'dst' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           dst +=3D dlen;
           ^      ~~~~
   fs/ext4/fast_commit.c:800:2: note: Value stored to 'dst' is never read
           dst +=3D dlen;
           ^      ~~~~
   fs/ext4/fast_commit.c:1666:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D ext4_fc_record_modified_inode(sb, inode->i_ino);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/fast_commit.c:1666:2: note: Value stored to 'ret' is never read
           ret =3D ext4_fc_record_modified_inode(sb, inode->i_ino);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/fast_commit.c:1791:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D ext4_fc_record_modified_inode(sb, inode->i_ino);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/fast_commit.c:1791:2: note: Value stored to 'ret' is never read
           ret =3D ext4_fc_record_modified_inode(sb, inode->i_ino);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> net/bluetooth/eir.c:212:2: warning: Value stored to 'ptr' is never read =
[clang-analyzer-deadcode.DeadStores]
           ptr =3D create_uuid128_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr=
 - data));
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/bluetooth/eir.c:212:2: note: Value stored to 'ptr' is never read
           ptr =3D create_uuid128_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr=
 - data));
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/bluetooth/eir.c:295:4: warning: Value stored to 'ptr' is never read =
[clang-analyzer-deadcode.DeadStores]
                           ptr +=3D 3;
                           ^      ~
   net/bluetooth/eir.c:295:4: note: Value stored to 'ptr' is never read
                           ptr +=3D 3;
                           ^      ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/ubifs/commit.c:113:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   fs/ubifs/commit.c:113:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
   fs/ubifs/commit.c:668:19: warning: Use of memory after it is freed [clan=
g-analyzer-unix.Malloc]
                                   if (iip + 1 < le16_to_cpu(idx->child_cnt=
)) {
                                                 ^
   include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16=
_to_cpu'
   #define le16_to_cpu __le16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:36:50: note: expanded from =
macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                    ^
   fs/ubifs/commit.c:404:6: note: Assuming field 'cmt_state' is not equal t=
o COMMIT_BROKEN
           if (c->cmt_state =3D=3D COMMIT_BROKEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/commit.c:404:2: note: Taking false branch
           if (c->cmt_state =3D=3D COMMIT_BROKEN) {
           ^
   fs/ubifs/commit.c:409:6: note: Assuming field 'cmt_state' is not equal t=
o COMMIT_RUNNING_BACKGROUND
           if (c->cmt_state =3D=3D COMMIT_RUNNING_BACKGROUND)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/commit.c:409:2: note: Taking false branch
           if (c->cmt_state =3D=3D COMMIT_RUNNING_BACKGROUND)
           ^
   fs/ubifs/commit.c:416:6: note: Assuming field 'cmt_state' is not equal t=
o COMMIT_RUNNING_REQUIRED
           if (c->cmt_state =3D=3D COMMIT_RUNNING_REQUIRED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/commit.c:416:2: note: Taking false branch
           if (c->cmt_state =3D=3D COMMIT_RUNNING_REQUIRED) {
           ^
   fs/ubifs/commit.c:430:6: note: Assuming field 'cmt_state' is not equal t=
o COMMIT_BROKEN
           if (c->cmt_state =3D=3D COMMIT_BROKEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/commit.c:430:2: note: Taking false branch
           if (c->cmt_state =3D=3D COMMIT_BROKEN) {
           ^
   fs/ubifs/commit.c:435:6: note: Assuming field 'cmt_state' is not equal t=
o COMMIT_RUNNING_BACKGROUND
           if (c->cmt_state =3D=3D COMMIT_RUNNING_BACKGROUND)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/commit.c:435:2: note: Taking false branch
           if (c->cmt_state =3D=3D COMMIT_RUNNING_BACKGROUND)
           ^
   fs/ubifs/commit.c:438:6: note: Assuming field 'cmt_state' is not equal t=
o COMMIT_RUNNING_REQUIRED
           if (c->cmt_state =3D=3D COMMIT_RUNNING_REQUIRED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/commit.c:438:2: note: Taking false branch
           if (c->cmt_state =3D=3D COMMIT_RUNNING_REQUIRED) {
           ^
   fs/ubifs/commit.c:446:8: note: Calling 'do_commit'
           err =3D do_commit(c);
                 ^~~~~~~~~~~~
   fs/ubifs/commit.c:103:2: note: Taking false branch
           dbg_cmt("start");
           ^
   fs/ubifs/debug.h:190:29: note: expanded from macro 'dbg_cmt'
   #define dbg_cmt(fmt, ...)   ubifs_dbg_msg("cmt", fmt, ##__VA_ARGS__)
                               ^
   fs/ubifs/debug.h:158:2: note: expanded from macro 'ubifs_dbg_msg'
           pr_debug("UBIFS DBG " type " (pid %d): " fmt "\n", current->pid,=
       \
           ^
   include/linux/printk.h:471:2: note: expanded from macro 'pr_debug'
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
   fs/ubifs/commit.c:103:2: note: Loop condition is false.  Exiting loop
           dbg_cmt("start");

vim +/ptr +212 net/bluetooth/eir.c

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  165  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  166  void eir_create(stru=
ct hci_dev *hdev, u8 *data)
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  167  {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  168  	u8 *ptr =3D data;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  169  	size_t name_len;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  170  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  171  	name_len =3D strlen=
(hdev->dev_name);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  172  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  173  	if (name_len > 0) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  174  		/* EIR Data type */
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  175  		if (name_len > 48)=
 {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  176  			name_len =3D 48;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  177  			ptr[1] =3D EIR_NA=
ME_SHORT;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  178  		} else {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  179  			ptr[1] =3D EIR_NA=
ME_COMPLETE;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  180  		}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  181  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  182  		/* EIR Data length=
 */
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  183  		ptr[0] =3D name_le=
n + 1;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  184  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  185  		memcpy(ptr + 2, hd=
ev->dev_name, name_len);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  186  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  187  		ptr +=3D (name_len=
 + 2);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  188  	}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  189  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  190  	if (hdev->inq_tx_po=
wer !=3D HCI_TX_POWER_INVALID) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  191  		ptr[0] =3D 2;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  192  		ptr[1] =3D EIR_TX_=
POWER;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  193  		ptr[2] =3D (u8)hde=
v->inq_tx_power;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  194  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  195  		ptr +=3D 3;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  196  	}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  197  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  198  	if (hdev->devid_sou=
rce > 0) {
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  199  		ptr[0] =3D 9;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  200  		ptr[1] =3D EIR_DEV=
ICE_ID;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  201  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  202  		put_unaligned_le16=
(hdev->devid_source, ptr + 2);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  203  		put_unaligned_le16=
(hdev->devid_vendor, ptr + 4);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  204  		put_unaligned_le16=
(hdev->devid_product, ptr + 6);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  205  		put_unaligned_le16=
(hdev->devid_version, ptr + 8);
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  206  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  207  		ptr +=3D 10;
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  208  	}
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  209  =

01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  210  	ptr =3D create_uuid=
16_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr - data));
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  211  	ptr =3D create_uuid=
32_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr - data));
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20 @212  	ptr =3D create_uuid=
128_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr - data));
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  213  }
01ce70b0a274bd Luiz Augusto von Dentz 2021-09-20  214  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0750509630829313285==--

