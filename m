Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49257C;
	Wed,  7 Jun 2023 00:39:33 +0000 (UTC)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3570ctqE7023305, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3570ctqE7023305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 7 Jun 2023 08:38:56 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 7 Jun 2023 08:39:11 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 7 Jun 2023 08:39:11 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Wed, 7 Jun 2023 08:39:11 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Kalle Valo <kvalo@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
CC: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: drivers/net/wireless/realtek/rtw88/mac.c:748 __rtw_download_firmware() warn: missing unwind goto?
Thread-Topic: drivers/net/wireless/realtek/rtw88/mac.c:748
 __rtw_download_firmware() warn: missing unwind goto?
Thread-Index: AQHZmHuag55w+g5GcEOE/p9zkxvpX69+fBZQ
Date: Wed, 7 Jun 2023 00:39:11 +0000
Message-ID: <585222e490c34494b80474059207b788@realtek.com>
References: <291c3208-39c1-4eb5-bbca-b1331c346782@kadam.mountain>
 <87r0qoiuk1.fsf@kernel.org>
In-Reply-To: <87r0qoiuk1.fsf@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback



> -----Original Message-----
> From: Kalle Valo <kvalo@kernel.org>
> Sent: Tuesday, June 6, 2023 9:34 PM
> To: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: oe-kbuild@lists.linux.dev; Sascha Hauer <s.hauer@pengutronix.de>; lkp=
@intel.com;
> oe-kbuild-all@lists.linux.dev; linux-kernel@vger.kernel.org; linux-wirele=
ss@vger.kernel.org
> Subject: Re: drivers/net/wireless/realtek/rtw88/mac.c:748 __rtw_download_=
firmware() warn: missing unwind
> goto?
>=20
> Adding linux-wireless, top posting so that the whole report is included.
>=20
> Dan Carpenter <dan.carpenter@linaro.org> writes:
>=20
> > Hi Sascha,
> >
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   9561de3a55bed6bdd44a12820ba81ec416e705a7
> > commit: 45794099f5e1d7abc5eb07e6eec7e1e5c6cb540d wifi: rtw88: Add
> > rtw8822bu chipset support
> > config: riscv-randconfig-m031-20230605
> > (https://download.01.org/0day-ci/archive/20230605/202306052310.OVhcUjZ3=
-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 12.3.0
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202306052310.OVhcUjZ3-lkp@intel.com=
/
> >
> > smatch warnings:
> > drivers/net/wireless/realtek/rtw88/mac.c:748 __rtw_download_firmware()
> > warn: missing unwind goto?
> >
> > vim +748 drivers/net/wireless/realtek/rtw88/mac.c
> >
> > 3d8bf50860c7de Yan-Hsuan Chuang 2020-04-24 717 static int
> > __rtw_download_firmware(struct rtw_dev *rtwdev,
> > 3d8bf50860c7de Yan-Hsuan Chuang 2020-04-24 718 struct rtw_fw_state
> > *fw)
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  719  {
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 720 struct rtw_backup_info
> > bckp[DLFW_RESTORE_REG_NUM];
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 721 const u8 *data =3D
> > fw->firmware->data;
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  722       u32 size =3D fw->=
firmware->size;
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  723       u32 ltecoex_bckp;
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  724       int ret;
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  725
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 726 if
> > (!check_firmware_size(data, size))
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  727               return -E=
INVAL;
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  728
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 729 if
> > (!ltecoex_read_reg(rtwdev, 0x38, &ltecoex_bckp))
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  730               return -E=
BUSY;
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  731
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 732 wlan_cpu_enable(rtwdev,
> > false);
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  733
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 734
> > download_firmware_reg_backup(rtwdev, bckp);
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 735
> > download_firmware_reset_platform(rtwdev);
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  736
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 737 ret =3D
> > start_download_firmware(rtwdev, data, size);
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  738       if (ret)
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  739               goto dlfw=
_fail;
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  740
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 741
> > download_firmware_reg_restore(rtwdev, bckp, DLFW_RESTORE_REG_NUM);
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  742
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 743
> > download_firmware_end_flow(rtwdev);
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  744
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  745       wlan_cpu_enable(r=
twdev, true);
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  746
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 747 if
> > (!ltecoex_reg_write(rtwdev, 0x38, ltecoex_bckp))
> > e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 @748               return -E=
BUSY;
> >
> > All the other error paths goto dlfw_fail;

At this point, the things of 'dlfw_fail:' have been done by
download_firmware_end_flow() and wlan_cpu_enable() at L743 and L745 normall=
y.=20
An exception is download_firmware_end_flow() clear BIT_MCUFWDL_EN bit condi=
tionally,
so I think it would be better to goto dlfw_fail.=20

I can make a patch for this.

Ping-Ke

