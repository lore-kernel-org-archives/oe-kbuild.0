Content-Type: multipart/mixed; boundary="===============3820128017897015891=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/3] Bluetooth: mgmt: add set_quality_report for MGMT_OP_SET_QUALITY_REPORT
Date: Wed, 16 Feb 2022 09:47:45 +0800
Message-ID: <202202160942.cEiT1MKh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3820128017897015891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220215133546.2826837-1-josephsih@chromium.org>
References: <20220215133546.2826837-1-josephsih@chromium.org>
TO: Joseph Hwang <josephsih@chromium.org>
TO: linux-bluetooth(a)vger.kernel.org
TO: marcel(a)holtmann.org
TO: luiz.dentz(a)gmail.com
TO: pali(a)kernel.org
CC: chromeos-bluetooth-upstreaming(a)chromium.org
CC: josephsih(a)google.com
CC: Joseph Hwang <josephsih@chromium.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Johan Hedberg <johan.hedberg@gmail.com>
CC: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org

Hi Joseph,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on net-next/master next-20220215]
[cannot apply to net/master bluetooth/master v5.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Joseph-Hwang/Bluetooth-aos=
p-surface-AOSP-quality-report-through-mgmt/20220215-213800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021-20220214 (https://download.01.org/0day-ci/arch=
ive/20220216/202202160942.cEiT1MKh-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/bluetooth/mgmt.c:860 get_supported_settings() warn: variable dereferenc=
ed before check 'hdev' (see line 826)

Old smatch warnings:
net/bluetooth/mgmt.c:4898 read_local_oob_data_complete() error: 'skb' deref=
erencing possible ERR_PTR()
net/bluetooth/mgmt.c:4912 read_local_oob_data_complete() error: 'skb' deref=
erencing possible ERR_PTR()
net/bluetooth/mgmt.c:7437 read_local_oob_ext_data_complete() error: 'skb' d=
ereferencing possible ERR_PTR()
net/bluetooth/mgmt.c:7453 read_local_oob_ext_data_complete() error: 'skb' d=
ereferencing possible ERR_PTR()
net/bluetooth/mgmt.c:8155 add_ext_adv_params_complete() warn: variable dere=
ferenced before check 'cmd' (see line 8114)

vim +/hdev +860 net/bluetooth/mgmt.c

6244691fec4dd0 Jaganath Kanakkassery  2018-07-19  815  =

69ab39ea5da03e Johan Hedberg          2011-12-15  816  static u32 get_suppo=
rted_settings(struct hci_dev *hdev)
69ab39ea5da03e Johan Hedberg          2011-12-15  817  {
69ab39ea5da03e Johan Hedberg          2011-12-15  818  	u32 settings =3D 0;
69ab39ea5da03e Johan Hedberg          2011-12-15  819  =

69ab39ea5da03e Johan Hedberg          2011-12-15  820  	settings |=3D MGMT_=
SETTING_POWERED;
b2939475eb6a35 Johan Hedberg          2014-07-30  821  	settings |=3D MGMT_=
SETTING_BONDABLE;
b1de97d8c06d9d Marcel Holtmann        2014-01-31  822  	settings |=3D MGMT_=
SETTING_DEBUG_KEYS;
3742abfc4e853f Johan Hedberg          2014-07-08  823  	settings |=3D MGMT_=
SETTING_CONNECTABLE;
3742abfc4e853f Johan Hedberg          2014-07-08  824  	settings |=3D MGMT_=
SETTING_DISCOVERABLE;
69ab39ea5da03e Johan Hedberg          2011-12-15  825  =

ed3fa31f35896b Andre Guedes           2012-07-24 @826  	if (lmp_bredr_capab=
le(hdev)) {
1a47aee85f8a08 Johan Hedberg          2013-03-15  827  		if (hdev->hci_ver =
>=3D BLUETOOTH_VER_1_2)
33c525c0a37abd Johan Hedberg          2012-10-24  828  			settings |=3D MGM=
T_SETTING_FAST_CONNECTABLE;
69ab39ea5da03e Johan Hedberg          2011-12-15  829  		settings |=3D MGMT=
_SETTING_BREDR;
69ab39ea5da03e Johan Hedberg          2011-12-15  830  		settings |=3D MGMT=
_SETTING_LINK_SECURITY;
a82974c9f4ed07 Marcel Holtmann        2013-10-11  831  =

a82974c9f4ed07 Marcel Holtmann        2013-10-11  832  		if (lmp_ssp_capabl=
e(hdev)) {
a82974c9f4ed07 Marcel Holtmann        2013-10-11  833  			settings |=3D MGM=
T_SETTING_SSP;
b560a208cda029 Luiz Augusto von Dentz 2020-08-06  834  			if (IS_ENABLED(CO=
NFIG_BT_HS))
d7b7e79688c07b Marcel Holtmann        2012-02-20  835  				settings |=3D MG=
MT_SETTING_HS;
848566b381e72b Marcel Holtmann        2013-10-01  836  		}
e98d2ce293a941 Marcel Holtmann        2014-01-10  837  =

05b3c3e7905d00 Marcel Holtmann        2014-12-31  838  		if (lmp_sc_capable=
(hdev))
e98d2ce293a941 Marcel Holtmann        2014-01-10  839  			settings |=3D MGM=
T_SETTING_SECURE_CONN;
4b127bd5f2cc1b Alain Michaud          2020-02-27  840  =

00bce3fb0642b3 Alain Michaud          2020-03-05  841  		if (test_bit(HCI_Q=
UIRK_WIDEBAND_SPEECH_SUPPORTED,
4b127bd5f2cc1b Alain Michaud          2020-02-27  842  			     &hdev->quirk=
s))
00bce3fb0642b3 Alain Michaud          2020-03-05  843  			settings |=3D MGM=
T_SETTING_WIDEBAND_SPEECH;
a82974c9f4ed07 Marcel Holtmann        2013-10-11  844  	}
d7b7e79688c07b Marcel Holtmann        2012-02-20  845  =

eeca6f891305a8 Johan Hedberg          2013-09-25  846  	if (lmp_le_capable(=
hdev)) {
69ab39ea5da03e Johan Hedberg          2011-12-15  847  		settings |=3D MGMT=
_SETTING_LE;
a3209694f82a22 Johan Hedberg          2014-05-26  848  		settings |=3D MGMT=
_SETTING_SECURE_CONN;
0f4bd942f13dd1 Johan Hedberg          2014-02-22  849  		settings |=3D MGMT=
_SETTING_PRIVACY;
93690c227acf08 Marcel Holtmann        2015-03-06  850  		settings |=3D MGMT=
_SETTING_STATIC_ADDRESS;
cbbdfa6f331980 Sathish Narasimman     2020-07-23  851  		settings |=3D MGMT=
_SETTING_ADVERTISING;
eeca6f891305a8 Johan Hedberg          2013-09-25  852  	}
69ab39ea5da03e Johan Hedberg          2011-12-15  853  =

eb1904f49d3e11 Marcel Holtmann        2014-07-04  854  	if (test_bit(HCI_QU=
IRK_EXTERNAL_CONFIG, &hdev->quirks) ||
eb1904f49d3e11 Marcel Holtmann        2014-07-04  855  	    hdev->set_bdadd=
r)
9fc3bfb681bdf5 Marcel Holtmann        2014-07-04  856  		settings |=3D MGMT=
_SETTING_CONFIGURATION;
9fc3bfb681bdf5 Marcel Holtmann        2014-07-04  857  =

6244691fec4dd0 Jaganath Kanakkassery  2018-07-19  858  	settings |=3D MGMT_=
SETTING_PHY_CONFIGURATION;
6244691fec4dd0 Jaganath Kanakkassery  2018-07-19  859  =

edbb68b1006482 Joseph Hwang           2022-02-15 @860  	if (hdev && (aosp_h=
as_quality_report(hdev) ||
edbb68b1006482 Joseph Hwang           2022-02-15  861  		     hdev->set_qua=
lity_report))
edbb68b1006482 Joseph Hwang           2022-02-15  862  		settings |=3D MGMT=
_SETTING_QUALITY_REPORT;
edbb68b1006482 Joseph Hwang           2022-02-15  863  =

69ab39ea5da03e Johan Hedberg          2011-12-15  864  	return settings;
69ab39ea5da03e Johan Hedberg          2011-12-15  865  }
69ab39ea5da03e Johan Hedberg          2011-12-15  866  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3820128017897015891==--

