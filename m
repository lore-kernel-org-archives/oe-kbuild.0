Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA4F195;
	Wed, 15 Feb 2023 00:52:13 +0000 (UTC)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 31F0pf403028812, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (mapi.realtek.com[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 31F0pf403028812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 15 Feb 2023 08:51:41 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 15 Feb 2023 08:51:43 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Feb 2023 08:51:42 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Wed, 15 Feb 2023 08:51:42 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Dan Carpenter <error27@gmail.com>,
        "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>,
        Bitterblue Smith <rtl8821cerfe2@gmail.com>
CC: "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>,
        Kalle Valo <kvalo@kernel.org>
Subject: RE: [linux-next:master 681/12724] drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678 rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
Thread-Topic: [linux-next:master 681/12724]
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678
 rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
Thread-Index: AQHZQHe56iywkgwqnEueEeUQCVOmWa7PK+Iw
Date: Wed, 15 Feb 2023 00:51:42 +0000
Message-ID: <89d92b2ebc784c71a26810abb42a2dc7@realtek.com>
References: <202302142135.LCqUTVGY-lkp@intel.com>
In-Reply-To: <202302142135.LCqUTVGY-lkp@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
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
> From: Dan Carpenter <error27@gmail.com>
> Sent: Tuesday, February 14, 2023 9:25 PM
> To: oe-kbuild@lists.linux.dev; Bitterblue Smith <rtl8821cerfe2@gmail.com>
> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Kalle Valo <kvalo@kerne=
l.org>; Ping-Ke Shih
> <pkshih@realtek.com>
> Subject: [linux-next:master 681/12724] drivers/net/wireless/realtek/rtl8x=
xxu/rtl8xxxu_8188e.c:1678
> rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
> commit: 8b9754b28f0f231736667e1751f1fc6f18c80ad4 [681/12724] wifi: rtl8xx=
xu: Add rate control code for
> RTL8188EU
> config: x86_64-randconfig-m001-20230213
> (https://download.01.org/0day-ci/archive/20230214/202302142135.LCqUTVGY-l=
kp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202302142135.LCqUTVGY-lkp@intel.com/
>=20
> smatch warnings:
> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678 rtl8188e_hand=
le_ra_tx_report2() warn:
> ignoring unreachable code.
>=20
> vim +1678 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c
>=20
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1662  void rtl8188e_handle_ra=
_tx_report2(struct
> rtl8xxxu_priv *priv, struct sk_buff *skb)
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1663  {
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1664        u32 *_rx_desc =3D=
 (u32 *)(skb->data - sizeof(struct
> rtl8xxxu_rxdesc16));
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1665        struct rtl8xxxu_r=
xdesc16 *rx_desc =3D (struct
> rtl8xxxu_rxdesc16 *)_rx_desc;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1666        struct device *de=
v =3D &priv->udev->dev;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1667        struct rtl8xxxu_r=
a_info *ra =3D &priv->ra_info;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1668        u32 tx_rpt_len =
=3D rx_desc->pktlen & 0x3ff;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1669        u32 items =3D tx_=
rpt_len / TX_RPT2_ITEM_SIZE;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1670        u64 macid_valid =
=3D ((u64)_rx_desc[5] << 32) |
> _rx_desc[4];
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1671        u32 macid;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1672        u8 *rpt =3D skb->=
data;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1673        bool valid;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1674        u16 min_rpt_time =
=3D 0x927c;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1675
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1676        dev_dbg(dev, "%s:=
 len: %d items: %d\n", __func__,
> tx_rpt_len, items);

I think an alternative way is to add a statement to replace the comment of
the end of loop. Like

if (!priv->vif ||
    priv->vif->type =3D=3D NL80211_IFTYPE_STATION)
	items =3D 1;

or

if (priv->vif &&
    priv->vif->type =3D=3D NL80211_IFTYPE_STATION)
	items =3D 1;

Then, we can remove 'break;' of LN1725.
When this driver is going to support AP mode, this logic is still expected.

How about you, Bitterblue?

Ping-Ke

> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1677
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17 @1678        for (macid =3D 0;=
 macid < items; macid++) {
>                                                              ^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^
> This loop doesn't loop.  I see the comment at the end which explains
> why we have the dead code.  I only review these checker warnings two
> times and this is my second review so, personally, I don't care if you
> leave it or not.  But probably other people will review this static
> checker warning as well so you might want to just delete the loop.
>=20
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1679                valid =3D=
 false;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1680
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1681                if (macid=
 < 64)
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1682                        v=
alid =3D macid_valid & BIT(macid);
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1683
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1684                if (valid=
) {
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1685                        r=
a->retry[0] =3D
> le16_to_cpu(*(__le16 *)rpt);
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1686                        r=
a->retry[1] =3D rpt[2];
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1687                        r=
a->retry[2] =3D rpt[3];
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1688                        r=
a->retry[3] =3D rpt[4];
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1689                        r=
a->retry[4] =3D rpt[5];
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1690                        r=
a->drop =3D rpt[6];
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1691                        r=
a->total =3D ra->retry[0] +
> ra->retry[1] + ra->retry[2] +
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1692                         =
           ra->retry[3] +
> ra->retry[4] + ra->drop;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1693
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1694                        i=
f (ra->total > 0) {
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1695                         =
       if (ra->ra_stage < 5)
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1696
> rtl8188e_rate_decision(ra);
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1697                         =
       else if (ra->ra_stage =3D=3D
> 5)
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1698
> rtl8188e_power_training_try_state(ra);
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1699                         =
       else /* ra->ra_stage =3D=3D
> 6 */
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1700
> rtl8188e_power_training_decision(ra);
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1701
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1702                         =
       if (ra->ra_stage <=3D 5)
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1703                         =
               ra->ra_stage++;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1704                         =
       else
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1705                         =
               ra->ra_stage =3D
> 0;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1706                        }
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1707                } else if=
 (macid =3D=3D 0) {
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1708                        d=
ev_warn(dev, "%s: TX report item
> 0 not valid\n", __func__);
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1709                }
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1710
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1711                dev_dbg(d=
ev, "%s:  valid: %d retry: %d %d
> %d %d %d drop: %d\n",
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1712                        _=
_func__, valid,
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1713                        r=
a->retry[0], ra->retry[1],
> ra->retry[2],
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1714                        r=
a->retry[3], ra->retry[4],
> ra->drop);
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1715
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1716                if (min_r=
pt_time > ra->rpt_time)
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1717                        m=
in_rpt_time =3D ra->rpt_time;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1718
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1719                rpt +=3D =
TX_RPT2_ITEM_SIZE;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1720
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1721                /*
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1722                 * We onl=
y use macid 0, so only the first
> item is relevant.
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1723                 * AP mod=
e will use more of them if it's
> ever implemented.
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1724                 */
>=20
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1725                break;
>                                                                 ^^^^^
>=20
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1726        }
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1727
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1728        if (min_rpt_time =
!=3D ra->pre_min_rpt_time) {
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1729                rtl8xxxu_=
write16(priv,
> REG_TX_REPORT_TIME, min_rpt_time);
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1730                ra->pre_m=
in_rpt_time =3D min_rpt_time;
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1731        }
> 8b9754b28f0f23 Bitterblue Smith 2022-12-17  1732  }
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>=20
>=20
> ------Please consider the environment before printing this e-mail.
