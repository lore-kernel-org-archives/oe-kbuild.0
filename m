Content-Type: multipart/mixed; boundary="===============3817474246227759631=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-4.14 3/3] net/bluetooth/mgmt_config.c:24:19: warning: Local variable entry shadows outer variable
Date: Sat, 13 Jun 2020 20:56:11 +0800
Message-ID: <202006132007.cBtR5QiT%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3817474246227759631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-4.14
head:   47bc09c538b8de10851fc2d65f6cc9f1e83917e9
commit: 47bc09c538b8de10851fc2d65f6cc9f1e83917e9 [3/3] BACKPORT:FROMGITBlue=
tooth: implement read/set default system parameters mgmt
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

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

git remote add chrome-os https://chromium.googlesource.com/chromiumos/third=
_party/kernel
git remote update chrome-os
git checkout 47bc09c538b8de10851fc2d65f6cc9f1e83917e9
vim +24 net/bluetooth/mgmt_config.c

47bc09c538b8de Alain Michaud 2020-06-11  19  =

47bc09c538b8de Alain Michaud 2020-06-11  20  int read_def_system_config(str=
uct sock *sk, struct hci_dev *hdev, void *data,
47bc09c538b8de Alain Michaud 2020-06-11  21  			   u16 data_len)
47bc09c538b8de Alain Michaud 2020-06-11  22  {
47bc09c538b8de Alain Michaud 2020-06-11  23  	struct {
47bc09c538b8de Alain Michaud 2020-06-11 @24  		struct mgmt_tlv entry;
47bc09c538b8de Alain Michaud 2020-06-11  25  		union {
47bc09c538b8de Alain Michaud 2020-06-11  26  			/* This is a simplification=
 for now since all values
47bc09c538b8de Alain Michaud 2020-06-11  27  			 * are 16 bits.  In the fut=
ure, this code may need
47bc09c538b8de Alain Michaud 2020-06-11  28  			 * refactoring to account f=
or variable length values
47bc09c538b8de Alain Michaud 2020-06-11  29  			 * and properly calculate t=
he required buffer size.
47bc09c538b8de Alain Michaud 2020-06-11  30  			 */
47bc09c538b8de Alain Michaud 2020-06-11 @31  			__le16 value;
47bc09c538b8de Alain Michaud 2020-06-11  32  		};
47bc09c538b8de Alain Michaud 2020-06-11  33  	} __packed params[] =3D {
47bc09c538b8de Alain Michaud 2020-06-11  34  		/* Please see mgmt-api.txt f=
or documentation of these values */
47bc09c538b8de Alain Michaud 2020-06-11  35  		HDEV_PARAM_U16(0x0000, def_p=
age_scan_type),
47bc09c538b8de Alain Michaud 2020-06-11  36  		HDEV_PARAM_U16(0x0001, def_p=
age_scan_int),
47bc09c538b8de Alain Michaud 2020-06-11  37  		HDEV_PARAM_U16(0x0002, def_p=
age_scan_window),
47bc09c538b8de Alain Michaud 2020-06-11  38  		HDEV_PARAM_U16(0x0003, def_i=
nq_scan_type),
47bc09c538b8de Alain Michaud 2020-06-11  39  		HDEV_PARAM_U16(0x0004, def_i=
nq_scan_int),
47bc09c538b8de Alain Michaud 2020-06-11  40  		HDEV_PARAM_U16(0x0005, def_i=
nq_scan_window),
47bc09c538b8de Alain Michaud 2020-06-11  41  		HDEV_PARAM_U16(0x0006, def_b=
r_lsto),
47bc09c538b8de Alain Michaud 2020-06-11  42  		HDEV_PARAM_U16(0x0007, def_p=
age_timeout),
47bc09c538b8de Alain Michaud 2020-06-11  43  		HDEV_PARAM_U16(0x0008, sniff=
_min_interval),
47bc09c538b8de Alain Michaud 2020-06-11  44  		HDEV_PARAM_U16(0x0009, sniff=
_max_interval),
47bc09c538b8de Alain Michaud 2020-06-11  45  		HDEV_PARAM_U16(0x000a, le_ad=
v_min_interval),
47bc09c538b8de Alain Michaud 2020-06-11  46  		HDEV_PARAM_U16(0x000b, le_ad=
v_max_interval),
47bc09c538b8de Alain Michaud 2020-06-11  47  		HDEV_PARAM_U16(0x000c, def_m=
ulti_adv_rotation_duration),
47bc09c538b8de Alain Michaud 2020-06-11  48  		HDEV_PARAM_U16(0x000d, le_sc=
an_interval),
47bc09c538b8de Alain Michaud 2020-06-11  49  		HDEV_PARAM_U16(0x000e, le_sc=
an_window),
47bc09c538b8de Alain Michaud 2020-06-11  50  		HDEV_PARAM_U16(0x000f, le_sc=
an_int_suspend),
47bc09c538b8de Alain Michaud 2020-06-11  51  		HDEV_PARAM_U16(0x0010, le_sc=
an_window_suspend),
47bc09c538b8de Alain Michaud 2020-06-11  52  		HDEV_PARAM_U16(0x0011, le_sc=
an_int_discovery),
47bc09c538b8de Alain Michaud 2020-06-11  53  		HDEV_PARAM_U16(0x0012, le_sc=
an_window_discovery),
47bc09c538b8de Alain Michaud 2020-06-11  54  		HDEV_PARAM_U16(0x0013, le_sc=
an_int_adv_monitor),
47bc09c538b8de Alain Michaud 2020-06-11  55  		HDEV_PARAM_U16(0x0014, le_sc=
an_window_adv_monitor),
47bc09c538b8de Alain Michaud 2020-06-11  56  		HDEV_PARAM_U16(0x0015, le_sc=
an_int_connect),
47bc09c538b8de Alain Michaud 2020-06-11  57  		HDEV_PARAM_U16(0x0016, le_sc=
an_window_connect),
47bc09c538b8de Alain Michaud 2020-06-11  58  		HDEV_PARAM_U16(0x0017, le_co=
nn_min_interval),
47bc09c538b8de Alain Michaud 2020-06-11  59  		HDEV_PARAM_U16(0x0018, le_co=
nn_max_interval),
47bc09c538b8de Alain Michaud 2020-06-11  60  		HDEV_PARAM_U16(0x0019, le_co=
nn_latency),
47bc09c538b8de Alain Michaud 2020-06-11  61  		HDEV_PARAM_U16(0x001a, le_su=
pv_timeout),
47bc09c538b8de Alain Michaud 2020-06-11  62  	};
47bc09c538b8de Alain Michaud 2020-06-11  63  	struct mgmt_rp_read_def_syste=
m_config *rp =3D (void *)params;
47bc09c538b8de Alain Michaud 2020-06-11  64  =

47bc09c538b8de Alain Michaud 2020-06-11  65  	bt_dev_dbg(hdev, "sock %p", s=
k);
47bc09c538b8de Alain Michaud 2020-06-11  66  =

47bc09c538b8de Alain Michaud 2020-06-11  67  	return mgmt_cmd_complete(sk, =
hdev->id,
47bc09c538b8de Alain Michaud 2020-06-11  68  				 MGMT_OP_READ_DEF_SYSTEM_C=
ONFIG,
47bc09c538b8de Alain Michaud 2020-06-11  69  				 0, rp, sizeof(params));
47bc09c538b8de Alain Michaud 2020-06-11  70  }
47bc09c538b8de Alain Michaud 2020-06-11  71  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3817474246227759631==--

