Content-Type: multipart/mixed; boundary="===============1730290685225440435=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 5/8] Bluetooth: Add initial implementation of BIS connections
Date: Thu, 12 May 2022 15:38:53 +0800
Message-ID: <202205121532.jtQf7nFA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1730290685225440435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220506215743.3870212-5-luiz.dentz@gmail.com>
References: <20220506215743.3870212-5-luiz.dentz@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: linux-bluetooth(a)vger.kernel.org

Hi Luiz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master v5.18-rc6 next-20220511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Den=
tz/Bluetooth-eir-Add-helpers-for-managing-service-data/20220507-060014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: csky-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220512/202205121532.jtQf7nFA-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/bluetooth/hci_sync.c:1110 hci_start_per_adv_sync() warn: passing zero t=
o 'PTR_ERR'

Old smatch warnings:
net/bluetooth/hci_sync.c:195 __hci_cmd_sync_sk() error: (-2147483647) too l=
ow for ERR_PTR
net/bluetooth/hci_sync.c:2027 hci_resume_advertising_sync() error: uninitia=
lized symbol 'err'.

vim +/PTR_ERR +1110 net/bluetooth/hci_sync.c

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1090  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1091  int hci_start_per_a=
dv_sync(struct hci_dev *hdev, u8 instance, u8 data_len,
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1092  			   u8 *data, u32=
 flags, u16 min_interval,
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1093  			   u16 max_inter=
val, u16 sync_interval)
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1094  {
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1095  	struct adv_info *a=
dv =3D NULL;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1096  	int err;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1097  	bool added =3D fal=
se;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1098  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1099  	hci_disable_per_ad=
vertising_sync(hdev, instance);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1100  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1101  	if (instance) {
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1102  		adv =3D hci_find_=
adv_instance(hdev, instance);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1103  		/* Create an inst=
ance if that could not be found */
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1104  		if (!adv) {
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1105  			adv =3D hci_add_=
per_instance(hdev, instance, flags,
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1106  						   data_len, =
data,
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1107  						   sync_inter=
val,
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1108  						   sync_inter=
val);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1109  			if (IS_ERR_OR_NU=
LL(adv))
2f80269de71810 Luiz Augusto von Dentz 2022-05-06 @1110  				return PTR_ERR(=
adv);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1111  			added =3D true;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1112  		}
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1113  	}
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1114  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1115  	/* Only start adve=
rtising if instance 0 or if a dedicated instance has
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1116  	 * been added.
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1117  	 */
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1118  	if (!adv || added)=
 {
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1119  		err =3D hci_start=
_ext_adv_sync(hdev, instance);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1120  		if (err < 0)
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1121  			goto fail;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1122  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1123  		err =3D hci_adv_b=
cast_annoucement(hdev, adv);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1124  		if (err < 0)
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1125  			goto fail;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1126  	}
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1127  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1128  	err =3D hci_set_pe=
r_adv_params_sync(hdev, instance, min_interval,
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1129  					  max_interval=
);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1130  	if (err < 0)
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1131  		goto fail;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1132  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1133  	err =3D hci_set_pe=
r_adv_data_sync(hdev, instance);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1134  	if (err < 0)
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1135  		goto fail;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1136  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1137  	err =3D hci_enable=
_per_advertising_sync(hdev, instance);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1138  	if (err < 0)
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1139  		goto fail;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1140  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1141  	return 0;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1142  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1143  fail:
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1144  	if (added)
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1145  		hci_remove_adv_in=
stance(hdev, instance);
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1146  =

2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1147  	return err;
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1148  }
2f80269de71810 Luiz Augusto von Dentz 2022-05-06  1149  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1730290685225440435==--

