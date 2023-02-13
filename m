Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A905A7E;
	Mon, 13 Feb 2023 00:57:21 +0000 (UTC)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 31D0v8cP5003820, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 31D0v8cP5003820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 13 Feb 2023 08:57:08 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Mon, 13 Feb 2023 08:57:09 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 13 Feb 2023 08:57:09 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Mon, 13 Feb 2023 08:57:08 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Dan Carpenter <error27@gmail.com>,
        "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Kalle Valo <kvalo@kernel.org>
Subject: RE: drivers/net/wireless/realtek/rtw89/mac.c:3829 rtw89_mac_cfg_ppdu_status() warn: missing error code? 'ret'
Thread-Topic: drivers/net/wireless/realtek/rtw89/mac.c:3829
 rtw89_mac_cfg_ppdu_status() warn: missing error code? 'ret'
Thread-Index: AQHZPXeahvA2gD/Wl06jmE9Ze/ex9K7MEMyA
Date: Mon, 13 Feb 2023 00:57:08 +0000
Message-ID: <5884ba04b5364eab9c875139fa1f408b@realtek.com>
References: <202302101023.ctlih5q0-lkp@intel.com>
In-Reply-To: <202302101023.ctlih5q0-lkp@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2023/2/12_=3F=3F_10:00:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

> -----Original Message-----
> From: Dan Carpenter <error27@gmail.com>
> Sent: Saturday, February 11, 2023 12:11 AM
> To: oe-kbuild@lists.linux.dev; Ping-Ke Shih <pkshih@realtek.com>
> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; linux-kernel@vger.kerne=
l.org; Kalle Valo
> <kvalo@kernel.org>
> Subject: drivers/net/wireless/realtek/rtw89/mac.c:3829 rtw89_mac_cfg_ppdu=
_status() warn: missing error
> code? 'ret'
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   e544a07438522ab3688416e6e2e34bf0ee6d8755
> commit: 7ba49f4c6896d83b3841c0b046a0a7b1e97cc0dd rtw89: 8852c: add 8852ce=
 to Makefile and Kconfig
> config: parisc-randconfig-m031-20230209
> (https://download.01.org/0day-ci/archive/20230210/202302101023.ctlih5q0-l=
kp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 12.1.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202302101023.ctlih5q0-lkp@intel.com/
>=20
> smatch warnings:
> drivers/net/wireless/realtek/rtw89/mac.c:3829 rtw89_mac_cfg_ppdu_status()=
 warn: missing error code? 'ret'
>=20
> vim +/ret +3829 drivers/net/wireless/realtek/rtw89/mac.c
>=20
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3818  int rtw89_mac_cfg_ppdu_sta=
tus(struct rtw89_dev *rtwdev, u8
> mac_idx, bool enable)
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3819  {
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3820  	u32 reg =3D rtw89_mac_reg=
_by_idx(R_AX_PPDU_STAT, mac_idx);
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3821  	int ret =3D 0;
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3822
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3823  	ret =3D rtw89_mac_check_m=
ac_en(rtwdev, mac_idx,
> RTW89_CMAC_SEL);
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3824  	if (ret)
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3825  		return ret;
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3826
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3827  	if (!enable) {
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3828  		rtw89_write32_clr(rtwdev=
, reg,
> B_AX_PPDU_STAT_RPT_EN);
> e3ec7017f6a20d Ping-Ke Shih  2021-10-11 @3829  		return ret;
>=20
> The code is correct, but it would be more readable to return 0;

Yes, it will be more readable. I will send a patch to change them soon.
Thanks for pointing out this.

Ping-Ke


