Content-Type: multipart/mixed; boundary="===============6328185074549779606=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/mgmt_config.c:24:19: warning: Local variable entry shadows outer variable
Date: Thu, 17 Sep 2020 22:54:12 +0800
Message-ID: <202009172210.AegTotKG%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6328185074549779606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alain Michaud <alainm@chromium.org>
CC: Marcel Holtmann <marcel@holtmann.org>
CC: "Abhishek Pandit-Subedi" <abhishekpandit@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5925fa68fe8244651b3f78a88c4af99190a88f0d
commit: 17896406ff3592d47b476ddd29276bf9cf8a26dd Bluetooth: implement read/=
set default system parameters mgmt
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> net/bluetooth/mgmt_config.c:24:19: warning: Local variable entry shadows=
 outer variable [shadowVar]
     struct mgmt_tlv entry;
                     ^
   net/bluetooth/mgmt_config.c:24:19: note: Shadowed declaration
     struct mgmt_tlv entry;
                     ^
   net/bluetooth/mgmt_config.c:24:19: note: Shadow variable
     struct mgmt_tlv entry;
                     ^
>> net/bluetooth/mgmt_config.c:31:11: warning: Local variable value shadows=
 outer variable [shadowVar]
      __le16 value;
             ^
   net/bluetooth/mgmt_config.c:31:11: note: Shadowed declaration
      __le16 value;
             ^
   net/bluetooth/mgmt_config.c:31:11: note: Shadow variable
      __le16 value;
             ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D17896406ff3592d47b476ddd29276bf9cf8a26dd
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 17896406ff3592d47b476ddd29276bf9cf8a26dd
vim +24 net/bluetooth/mgmt_config.c

17896406ff3592d Alain Michaud 2020-06-11  19  =

17896406ff3592d Alain Michaud 2020-06-11  20  int read_def_system_config(st=
ruct sock *sk, struct hci_dev *hdev, void *data,
17896406ff3592d Alain Michaud 2020-06-11  21  			   u16 data_len)
17896406ff3592d Alain Michaud 2020-06-11  22  {
17896406ff3592d Alain Michaud 2020-06-11  23  	struct {
17896406ff3592d Alain Michaud 2020-06-11 @24  		struct mgmt_tlv entry;
17896406ff3592d Alain Michaud 2020-06-11  25  		union {
17896406ff3592d Alain Michaud 2020-06-11  26  			/* This is a simplificatio=
n for now since all values
17896406ff3592d Alain Michaud 2020-06-11  27  			 * are 16 bits.  In the fu=
ture, this code may need
17896406ff3592d Alain Michaud 2020-06-11  28  			 * refactoring to account =
for variable length values
17896406ff3592d Alain Michaud 2020-06-11  29  			 * and properly calculate =
the required buffer size.
17896406ff3592d Alain Michaud 2020-06-11  30  			 */
17896406ff3592d Alain Michaud 2020-06-11 @31  			__le16 value;
17896406ff3592d Alain Michaud 2020-06-11  32  		};
17896406ff3592d Alain Michaud 2020-06-11  33  	} __packed params[] =3D {
17896406ff3592d Alain Michaud 2020-06-11  34  		/* Please see mgmt-api.txt =
for documentation of these values */
17896406ff3592d Alain Michaud 2020-06-11  35  		HDEV_PARAM_U16(0x0000, def_=
page_scan_type),
17896406ff3592d Alain Michaud 2020-06-11  36  		HDEV_PARAM_U16(0x0001, def_=
page_scan_int),
17896406ff3592d Alain Michaud 2020-06-11  37  		HDEV_PARAM_U16(0x0002, def_=
page_scan_window),
17896406ff3592d Alain Michaud 2020-06-11  38  		HDEV_PARAM_U16(0x0003, def_=
inq_scan_type),
17896406ff3592d Alain Michaud 2020-06-11  39  		HDEV_PARAM_U16(0x0004, def_=
inq_scan_int),
17896406ff3592d Alain Michaud 2020-06-11  40  		HDEV_PARAM_U16(0x0005, def_=
inq_scan_window),
17896406ff3592d Alain Michaud 2020-06-11  41  		HDEV_PARAM_U16(0x0006, def_=
br_lsto),
17896406ff3592d Alain Michaud 2020-06-11  42  		HDEV_PARAM_U16(0x0007, def_=
page_timeout),
17896406ff3592d Alain Michaud 2020-06-11  43  		HDEV_PARAM_U16(0x0008, snif=
f_min_interval),
17896406ff3592d Alain Michaud 2020-06-11  44  		HDEV_PARAM_U16(0x0009, snif=
f_max_interval),
17896406ff3592d Alain Michaud 2020-06-11  45  		HDEV_PARAM_U16(0x000a, le_a=
dv_min_interval),
17896406ff3592d Alain Michaud 2020-06-11  46  		HDEV_PARAM_U16(0x000b, le_a=
dv_max_interval),
17896406ff3592d Alain Michaud 2020-06-11  47  		HDEV_PARAM_U16(0x000c, def_=
multi_adv_rotation_duration),
17896406ff3592d Alain Michaud 2020-06-11  48  		HDEV_PARAM_U16(0x000d, le_s=
can_interval),
17896406ff3592d Alain Michaud 2020-06-11  49  		HDEV_PARAM_U16(0x000e, le_s=
can_window),
17896406ff3592d Alain Michaud 2020-06-11  50  		HDEV_PARAM_U16(0x000f, le_s=
can_int_suspend),
17896406ff3592d Alain Michaud 2020-06-11  51  		HDEV_PARAM_U16(0x0010, le_s=
can_window_suspend),
17896406ff3592d Alain Michaud 2020-06-11  52  		HDEV_PARAM_U16(0x0011, le_s=
can_int_discovery),
17896406ff3592d Alain Michaud 2020-06-11  53  		HDEV_PARAM_U16(0x0012, le_s=
can_window_discovery),
17896406ff3592d Alain Michaud 2020-06-11  54  		HDEV_PARAM_U16(0x0013, le_s=
can_int_adv_monitor),
17896406ff3592d Alain Michaud 2020-06-11  55  		HDEV_PARAM_U16(0x0014, le_s=
can_window_adv_monitor),
17896406ff3592d Alain Michaud 2020-06-11  56  		HDEV_PARAM_U16(0x0015, le_s=
can_int_connect),
17896406ff3592d Alain Michaud 2020-06-11  57  		HDEV_PARAM_U16(0x0016, le_s=
can_window_connect),
17896406ff3592d Alain Michaud 2020-06-11  58  		HDEV_PARAM_U16(0x0017, le_c=
onn_min_interval),
17896406ff3592d Alain Michaud 2020-06-11  59  		HDEV_PARAM_U16(0x0018, le_c=
onn_max_interval),
17896406ff3592d Alain Michaud 2020-06-11  60  		HDEV_PARAM_U16(0x0019, le_c=
onn_latency),
17896406ff3592d Alain Michaud 2020-06-11  61  		HDEV_PARAM_U16(0x001a, le_s=
upv_timeout),
17896406ff3592d Alain Michaud 2020-06-11  62  	};
17896406ff3592d Alain Michaud 2020-06-11  63  	struct mgmt_rp_read_def_syst=
em_config *rp =3D (void *)params;
17896406ff3592d Alain Michaud 2020-06-11  64  =

17896406ff3592d Alain Michaud 2020-06-11  65  	bt_dev_dbg(hdev, "sock %p", =
sk);
17896406ff3592d Alain Michaud 2020-06-11  66  =

17896406ff3592d Alain Michaud 2020-06-11  67  	return mgmt_cmd_complete(sk,=
 hdev->id,
17896406ff3592d Alain Michaud 2020-06-11  68  				 MGMT_OP_READ_DEF_SYSTEM_=
CONFIG,
17896406ff3592d Alain Michaud 2020-06-11  69  				 0, rp, sizeof(params));
17896406ff3592d Alain Michaud 2020-06-11  70  }
17896406ff3592d Alain Michaud 2020-06-11  71  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6328185074549779606==--

