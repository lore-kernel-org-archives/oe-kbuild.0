Content-Type: multipart/mixed; boundary="===============5011095679643811080=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/hci_event.c:517:2: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Fri, 25 Mar 2022 10:56:59 +0800
Message-ID: <202203251037.UopvuTC3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5011095679643811080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52deda9551a01879b3562e7b41748e85c591f14c
commit: 9b392e0e0b6d026da5a62bb79a08f32e27af858e Bluetooth: Fix not checkin=
g for valid hdev on bt_dev_{info,warn,err,dbg}
date:   3 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220323 (https://download.01.org/0day-ci/archi=
ve/20220325/202203251037.UopvuTC3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9b392e0e0b6d026da5a62bb79a08f32e27af858e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9b392e0e0b6d026da5a62bb79a08f32e27af858e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/adc/max1241.c:22:8: note: Excessive padding in 'struct max12=
41' (54 padding bytes, where 22 is optimal). Optimal fields order: data, sp=
i, vdd, vref, shutdown, lock, consider reordering the fields or adding expl=
icit padding members
   struct max1241 {
   ~~~~~~~^~~~~~~~~
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
   1 warning generated.
   drivers/iio/adc/mt6360-adc.c:277:20: warning: Assigned value is garbage =
or undefined [clang-analyzer-core.uninitialized.Assign]
                   data.values[i++] =3D val;
                                    ^ ~~~
   drivers/iio/adc/mt6360-adc.c:267:18: note: 'val' declared without an ini=
tial value
           int i =3D 0, bit, val, ret;
                           ^~~
   drivers/iio/adc/mt6360-adc.c:270:2: note: Assuming 'bit' is < field 'mas=
klength'
           for_each_set_bit(bit, indio_dev->active_scan_mask, indio_dev->ma=
sklength) {
           ^
   include/linux/find.h:284:7: note: expanded from macro 'for_each_set_bit'
                (bit) < (size);                                    \
                ^~~~~~~~~~~~~~
   drivers/iio/adc/mt6360-adc.c:270:2: note: Loop condition is true.  Enter=
ing loop body
           for_each_set_bit(bit, indio_dev->active_scan_mask, indio_dev->ma=
sklength) {
           ^
   include/linux/find.h:283:2: note: expanded from macro 'for_each_set_bit'
           for ((bit) =3D find_next_bit((addr), (size), 0);          \
           ^
   drivers/iio/adc/mt6360-adc.c:271:9: note: Calling 'mt6360_adc_read_chann=
el'
                   ret =3D mt6360_adc_read_channel(mad, bit, &val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/mt6360-adc.c:78:6: note: Assuming 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/iio/adc/mt6360-adc.c:78:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/adc/mt6360-adc.c:79:3: note: Control jumps to line 138
                   goto out_adc_lock;
                   ^
   drivers/iio/adc/mt6360-adc.c:140:2: note: Returning without writing to '=
*val'
           return ret;
           ^
   drivers/iio/adc/mt6360-adc.c:271:9: note: Returning from 'mt6360_adc_rea=
d_channel'
                   ret =3D mt6360_adc_read_channel(mad, bit, &val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/mt6360-adc.c:272:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/iio/adc/mt6360-adc.c:272:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   drivers/iio/adc/mt6360-adc.c:277:20: note: Assigned value is garbage or =
undefined
                   data.values[i++] =3D val;
                                    ^ ~~~
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   include/asm-generic/bitops/non-atomic.h:118:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   net/bluetooth/hci_event.c:5274:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "");
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:45: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:207:28: note: expanded from macro 'bt_=
dev_name'
   #define bt_dev_name(hdev) ((hdev) ? (hdev)->name : "null")
                              ^~~~~~
   net/bluetooth/hci_event.c:5274:2: note: '?' condition is false
           bt_dev_dbg(hdev, "");
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
                              ^
   net/bluetooth/hci_event.c:5278:7: note: Passing null pointer value via 2=
nd parameter 'addr'
           if (!hci_dev_test_flag(hdev, HCI_MGMT))
                ^
   include/net/bluetooth/hci_core.h:787:63: note: expanded from macro 'hci_=
dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->de=
v_flags)
                                                                 ^~~~~~~~~~=
~~~~~~~
   net/bluetooth/hci_event.c:5278:7: note: Calling 'arch_test_bit'
           if (!hci_dev_test_flag(hdev, HCI_MGMT))
                ^
   include/net/bluetooth/hci_core.h:787:48: note: expanded from macro 'hci_=
dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->de=
v_flags)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:118:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
>> net/bluetooth/hci_event.c:517:2: warning: Null pointer passed as 1st arg=
ument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(hdev->dev_class, rp->dev_class, 3);
           ^      ~~~~~~~~~~~~~~~
   net/bluetooth/hci_event.c:512:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:45: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:207:28: note: expanded from macro 'bt_=
dev_name'
   #define bt_dev_name(hdev) ((hdev) ? (hdev)->name : "null")
                              ^~~~~~
   net/bluetooth/hci_event.c:512:2: note: '?' condition is false
           bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
                              ^
   net/bluetooth/hci_event.c:514:6: note: Assuming field 'status' is 0
           if (rp->status)
               ^~~~~~~~~~
   net/bluetooth/hci_event.c:514:2: note: Taking false branch
           if (rp->status)
           ^
   net/bluetooth/hci_event.c:517:2: note: Null pointer passed as 1st argume=
nt to memory copy function
           memcpy(hdev->dev_class, rp->dev_class, 3);
           ^      ~~~~~~~~~~~~~~~
   net/bluetooth/hci_event.c:540:3: warning: Null pointer passed as 1st arg=
ument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(hdev->dev_class, sent, 3);
                   ^      ~~~~~~~~~~~~~~~
   net/bluetooth/hci_event.c:531:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:45: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:207:28: note: expanded from macro 'bt_=
dev_name'
   #define bt_dev_name(hdev) ((hdev) ? (hdev)->name : "null")
                              ^~~~~~
   net/bluetooth/hci_event.c:531:2: note: '?' condition is false
           bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
                              ^
   net/bluetooth/hci_event.c:534:6: note: Assuming 'sent' is non-null
           if (!sent)
               ^~~~~
   net/bluetooth/hci_event.c:534:2: note: Taking false branch
           if (!sent)
           ^
   net/bluetooth/hci_event.c:539:6: note: Assuming field 'status' is 0
           if (!rp->status)
               ^~~~~~~~~~~
   net/bluetooth/hci_event.c:539:2: note: Taking true branch
           if (!rp->status)
           ^
   net/bluetooth/hci_event.c:540:3: note: Null pointer passed as 1st argume=
nt to memory copy function
                   memcpy(hdev->dev_class, sent, 3);
                   ^      ~~~~~~~~~~~~~~~
   net/bluetooth/hci_event.c:788:2: warning: Null pointer passed as 1st arg=
ument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(hdev->features, rp->features, 8);
           ^      ~~~~~~~~~~~~~~
   net/bluetooth/hci_event.c:783:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:45: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:207:28: note: expanded from macro 'bt_=
dev_name'
   #define bt_dev_name(hdev) ((hdev) ? (hdev)->name : "null")
                              ^~~~~~
   net/bluetooth/hci_event.c:783:2: note: '?' condition is false
           bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
                              ^
   net/bluetooth/hci_event.c:785:6: note: Assuming field 'status' is 0
           if (rp->status)
               ^~~~~~~~~~
   net/bluetooth/hci_event.c:785:2: note: Taking false branch
           if (rp->status)
           ^
   net/bluetooth/hci_event.c:788:2: note: Null pointer passed as 1st argume=
nt to memory copy function
           memcpy(hdev->features, rp->features, 8);
           ^      ~~~~~~~~~~~~~~
   net/bluetooth/hci_event.c:1895:2: warning: Null pointer passed as 1st ar=
gument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(hdev->le_states, rp->le_states, 8);
           ^      ~~~~~~~~~~~~~~~
   net/bluetooth/hci_event.c:1890:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
--
                   ^~~~~~~~~~~~~~~~~~~~
   net/can/j1939/main.c:291:8: note: Returning; memory was released via 1st=
 parameter
           ret =3D j1939_can_rx_register(priv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/main.c:292:6: note: 'ret' is < 0
           if (ret < 0)
               ^~~
   net/can/j1939/main.c:292:2: note: Taking true branch
           if (ret < 0)
           ^
   net/can/j1939/main.c:293:3: note: Control jumps to line 298
                   goto out_priv_put;
                   ^
   net/can/j1939/main.c:300:2: note: Attempt to free released memory
           kfree(priv);
           ^~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   include/asm-generic/bitops/non-atomic.h:118:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   net/bluetooth/mgmt.c:6049:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "sock %p", sk);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:45: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:207:28: note: expanded from macro 'bt_=
dev_name'
   #define bt_dev_name(hdev) ((hdev) ? (hdev)->name : "null")
                              ^~~~~~
   net/bluetooth/mgmt.c:6049:2: note: '?' condition is false
           bt_dev_dbg(hdev, "sock %p", sk);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
                              ^
   net/bluetooth/mgmt.c:6051:7: note: Passing null pointer value via 2nd pa=
rameter 'addr'
           if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED) ||
                ^
   include/net/bluetooth/hci_core.h:787:63: note: expanded from macro 'hci_=
dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->de=
v_flags)
                                                                 ^~~~~~~~~~=
~~~~~~~
   net/bluetooth/mgmt.c:6051:7: note: Calling 'arch_test_bit'
           if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED) ||
                ^
   include/net/bluetooth/hci_core.h:787:48: note: expanded from macro 'hci_=
dev_test_flag'
   #define hci_dev_test_flag(hdev, nr)            test_bit((nr), (hdev)->de=
v_flags)
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:118:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   include/linux/bitmap.h:252:2: warning: Null pointer passed as 2nd argume=
nt to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(dst, src, len);
           ^
   net/bluetooth/mgmt.c:4501:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "Set device flags %pMR (type 0x%x) =3D 0x%x",
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:45: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:207:28: note: expanded from macro 'bt_=
dev_name'
   #define bt_dev_name(hdev) ((hdev) ? (hdev)->name : "null")
                              ^~~~~~
   net/bluetooth/mgmt.c:4501:2: note: '?' condition is false
           bt_dev_dbg(hdev, "Set device flags %pMR (type 0x%x) =3D 0x%x",
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
                              ^
   net/bluetooth/mgmt.c:4505:2: note: Passing null pointer value via 2nd pa=
rameter 'src'
           bitmap_to_arr32(&supported_flags, hdev->conn_flags,
           ^
   include/linux/bitmap.h:281:4: note: expanded from macro 'bitmap_to_arr32'
                           (const unsigned long *) (bitmap), (nbits))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:4505:2: note: Calling 'bitmap_copy_clear_tail'
           bitmap_to_arr32(&supported_flags, hdev->conn_flags,
           ^
   include/linux/bitmap.h:280:2: note: expanded from macro 'bitmap_to_arr32'
           bitmap_copy_clear_tail((unsigned long *) (buf),         \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:261:19: note: Passing null pointer value via 2nd =
parameter 'src'
           bitmap_copy(dst, src, nbits);
                            ^~~
   include/linux/bitmap.h:261:2: note: Calling 'bitmap_copy'
           bitmap_copy(dst, src, nbits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:252:2: note: Null pointer passed as 2nd argument =
to memory copy function
           memcpy(dst, src, len);
           ^           ~~~
>> net/bluetooth/mgmt.c:3404:7: warning: Null pointer passed as 1st argumen=
t to memory comparison function [clang-analyzer-unix.cstring.NullArg]
           if (!memcmp(hdev->dev_name, cp->name, sizeof(hdev->dev_name)) &&
                ^      ~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:3397:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "sock %p", sk);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:45: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:207:28: note: expanded from macro 'bt_=
dev_name'
   #define bt_dev_name(hdev) ((hdev) ? (hdev)->name : "null")
                              ^~~~~~
   net/bluetooth/mgmt.c:3397:2: note: '?' condition is false
           bt_dev_dbg(hdev, "sock %p", sk);
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
                              ^
   net/bluetooth/mgmt.c:3404:7: note: Null pointer passed as 1st argument t=
o memory comparison function
           if (!memcmp(hdev->dev_name, cp->name, sizeof(hdev->dev_name)) &&
                ^      ~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:4671:2: warning: 3rd function call argument is an u=
ninitialized value [clang-analyzer-core.CallAndMessage]
           bt_dev_dbg(hdev, "add monitor %d complete, status %u",
           ^
   include/net/bluetooth/bluetooth.h:216:2: note: expanded from macro 'bt_d=
ev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ^                                       ~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                   ^                  ~~~~~~~~~~~
   net/bluetooth/mgmt.c:4648:6: note: Assuming 'cmd' is null
           if (!cmd) {
               ^~~~
   net/bluetooth/mgmt.c:4648:2: note: Taking true branch
           if (!cmd) {
           ^
   net/bluetooth/mgmt.c:4650:7: note: Assuming 'cmd' is null
                   if (!cmd)
                       ^~~~
   net/bluetooth/mgmt.c:4650:3: note: Taking true branch
                   if (!cmd)
                   ^
   net/bluetooth/mgmt.c:4651:4: note: Control jumps to line 4670
                           goto done;
                           ^
   net/bluetooth/mgmt.c:4671:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "add monitor %d complete, status %u",
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:45: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:207:28: note: expanded from macro 'bt_=
dev_name'
   #define bt_dev_name(hdev) ((hdev) ? (hdev)->name : "null")
                              ^~~~~~
   net/bluetooth/mgmt.c:4671:2: note: '?' condition is false
           bt_dev_dbg(hdev, "add monitor %d complete, status %u",
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
                              ^
   net/bluetooth/mgmt.c:4671:2: note: 3rd function call argument is an unin=
itialized value
           bt_dev_dbg(hdev, "add monitor %d complete, status %u",
           ^
   include/net/bluetooth/bluetooth.h:216:2: note: expanded from macro 'bt_d=
ev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ^                                       ~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                   ^                  ~~~~~~~~~~~
   net/bluetooth/mgmt.c:4896:2: warning: 3rd function call argument is an u=
ninitialized value [clang-analyzer-core.CallAndMessage]
           bt_dev_dbg(hdev, "remove monitor %d complete, status %u",
           ^
   include/net/bluetooth/bluetooth.h:216:2: note: expanded from macro 'bt_d=
ev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ^                                       ~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)
                                   ^                  ~~~~~~~~~~~
   net/bluetooth/mgmt.c:4881:6: note: Assuming 'cmd' is null
           if (!cmd)
               ^~~~
   net/bluetooth/mgmt.c:4881:2: note: Taking true branch
           if (!cmd)
           ^
   net/bluetooth/mgmt.c:4882:3: note: Control jumps to line 4895
                   goto done;
                   ^
   net/bluetooth/mgmt.c:4896:2: note: Assuming 'hdev' is null
           bt_dev_dbg(hdev, "remove monitor %d complete, status %u",
           ^
   include/net/bluetooth/bluetooth.h:216:21: note: expanded from macro 'bt_=
dev_dbg'
           BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/bluetooth/bluetooth.h:202:45: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        bt_dbg(fmt "\n", ##__VA_ARGS__)

vim +517 net/bluetooth/hci_event.c

e5b0ad69c97a04 Abhishek Pandit-Subedi 2021-03-03  506  =

c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  507  static u8 hci_cc_rea=
d_class_of_dev(struct hci_dev *hdev, void *data,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  508  				   struct sk_buf=
f *skb)
a9de9248064bfc Marcel Holtmann        2007-10-20  509  {
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  510  	struct hci_rp_read_=
class_of_dev *rp =3D data;
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  511  =

e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  512  	bt_dev_dbg(hdev, "s=
tatus 0x%2.2x", rp->status);
a9de9248064bfc Marcel Holtmann        2007-10-20  513  =

a9de9248064bfc Marcel Holtmann        2007-10-20  514  	if (rp->status)
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  515  		return rp->status;
a9de9248064bfc Marcel Holtmann        2007-10-20  516  =

a9de9248064bfc Marcel Holtmann        2007-10-20 @517  	memcpy(hdev->dev_cl=
ass, rp->dev_class, 3);
a9de9248064bfc Marcel Holtmann        2007-10-20  518  =

e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  519  	bt_dev_dbg(hdev, "c=
lass 0x%.2x%.2x%.2x", hdev->dev_class[2],
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  520  		   hdev->dev_class=
[1], hdev->dev_class[0]);
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  521  =

c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  522  	return rp->status;
a9de9248064bfc Marcel Holtmann        2007-10-20  523  }
a9de9248064bfc Marcel Holtmann        2007-10-20  524  =


:::::: The code at line 517 was first introduced by commit
:::::: a9de9248064bfc8eb0a183a6a951a4e7b5ca10a4 [Bluetooth] Switch from OGF=
+OCF to using only opcodes

:::::: TO: Marcel Holtmann <marcel@holtmann.org>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5011095679643811080==--

