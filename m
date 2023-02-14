Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E388227721;
	Tue, 14 Feb 2023 13:24:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n33so4965108wms.0;
        Tue, 14 Feb 2023 05:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9RN+mg4kNcrM5qEGJpnwzf2Cf39MbkXJ0+S7zpdY80=;
        b=IW4slTnEMTtls7Fc9o3RWZeElhv0VMbbHj0HVLgz4ilT/JTwRHbVUAq7cGsgpe2CYs
         UywVIwH9OYYViiz53lMvUMarqcll7LgDWqfcoYjmp2adhc9y+EnzTg6ht5598vnt8LHJ
         tsMd4XpKQjaOR6KRinV7T3MMRPtwo7/LAL5+3hDNSf4foEjotG0ybMQ2EomDHkO7gaoO
         RXrUVInnGt+RrzVUIiWXYzFUs5euhPiHBbVB4veZIADn1nZqwYUdhIA1QHsYNc/gXnhg
         H8pS5Dv/avjUIN4f/1CIc7W+OV4Z4YOzVdN1MHRAhszlLB1741u52YO5fWSHzF7NQkgo
         4cTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9RN+mg4kNcrM5qEGJpnwzf2Cf39MbkXJ0+S7zpdY80=;
        b=y5WP1jtL1Sppv7adQjmBwnz4oqQbhIt4gUiOo1Fp5N+apzheTabFYbnVNjiiOUvlZX
         QPXovu45FAY6L0HrIRyjZZjZ1rYrqB2YHO7UUE/RdHPRbAzcbhPC26M6pVvqy4Kq8gW3
         xWMdJkhYoNGAkHVoKfxqmf141tw/Y7ojS1/vveGbLyUE1+LJN2EJWGRCXLhF+90sEhAX
         QdgmvJ7UW3mfPel583nFP15VYCvDjtWH0awvGC2gw9DHjWLldvTpnE2wpSJBYW5lfyj6
         nS/2+R+g+Bv0zzKfms//QunpkFqy1Qsk0kTA4/GViQDK7xMuOJxDEePOZZlM3iaRvkRE
         1DLw==
X-Gm-Message-State: AO0yUKW0DfnGreZDHQ4NNhXxNXwIgPbw0/w3p0P3WWznCPfVmZnu1ZZH
	6icPuwlzR5zAVxCWz6oODm4B7yYlBO2ODg==
X-Google-Smtp-Source: AK7set+uanKiaBrbmBnAjETJp7Y8YSpoU3xMktRTTTEO7ZKDOjjKT4Fi1hMiZcQIn3DK+8YFRUiLIQ==
X-Received: by 2002:a05:600c:4486:b0:3d3:49db:9b25 with SMTP id e6-20020a05600c448600b003d349db9b25mr1988510wmo.26.1676381086840;
        Tue, 14 Feb 2023 05:24:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id az10-20020a05600c600a00b003dc3f07c876sm20847195wmb.46.2023.02.14.05.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 05:24:46 -0800 (PST)
Date: Tue, 14 Feb 2023 16:24:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Kalle Valo <kvalo@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>
Subject: [linux-next:master 681/12724]
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678
 rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
Message-ID: <202302142135.LCqUTVGY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230214132435.t98KiMXro-h62DvLgbmWUFaKyTtvb9Wc5T2J7Fbp8sQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
commit: 8b9754b28f0f231736667e1751f1fc6f18c80ad4 [681/12724] wifi: rtl8xxxu: Add rate control code for RTL8188EU
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230214/202302142135.LCqUTVGY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302142135.LCqUTVGY-lkp@intel.com/

smatch warnings:
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678 rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.

vim +1678 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c

8b9754b28f0f23 Bitterblue Smith 2022-12-17  1662  void rtl8188e_handle_ra_tx_report2(struct rtl8xxxu_priv *priv, struct sk_buff *skb)
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1663  {
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1664  	u32 *_rx_desc = (u32 *)(skb->data - sizeof(struct rtl8xxxu_rxdesc16));
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1665  	struct rtl8xxxu_rxdesc16 *rx_desc = (struct rtl8xxxu_rxdesc16 *)_rx_desc;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1666  	struct device *dev = &priv->udev->dev;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1667  	struct rtl8xxxu_ra_info *ra = &priv->ra_info;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1668  	u32 tx_rpt_len = rx_desc->pktlen & 0x3ff;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1669  	u32 items = tx_rpt_len / TX_RPT2_ITEM_SIZE;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1670  	u64 macid_valid = ((u64)_rx_desc[5] << 32) | _rx_desc[4];
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1671  	u32 macid;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1672  	u8 *rpt = skb->data;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1673  	bool valid;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1674  	u16 min_rpt_time = 0x927c;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1675  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1676  	dev_dbg(dev, "%s: len: %d items: %d\n", __func__, tx_rpt_len, items);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1677  
8b9754b28f0f23 Bitterblue Smith 2022-12-17 @1678  	for (macid = 0; macid < items; macid++) {
                                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This loop doesn't loop.  I see the comment at the end which explains
why we have the dead code.  I only review these checker warnings two
times and this is my second review so, personally, I don't care if you
leave it or not.  But probably other people will review this static
checker warning as well so you might want to just delete the loop.

8b9754b28f0f23 Bitterblue Smith 2022-12-17  1679  		valid = false;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1680  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1681  		if (macid < 64)
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1682  			valid = macid_valid & BIT(macid);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1683  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1684  		if (valid) {
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1685  			ra->retry[0] = le16_to_cpu(*(__le16 *)rpt);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1686  			ra->retry[1] = rpt[2];
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1687  			ra->retry[2] = rpt[3];
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1688  			ra->retry[3] = rpt[4];
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1689  			ra->retry[4] = rpt[5];
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1690  			ra->drop = rpt[6];
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1691  			ra->total = ra->retry[0] + ra->retry[1] + ra->retry[2] +
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1692  				    ra->retry[3] + ra->retry[4] + ra->drop;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1693  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1694  			if (ra->total > 0) {
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1695  				if (ra->ra_stage < 5)
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1696  					rtl8188e_rate_decision(ra);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1697  				else if (ra->ra_stage == 5)
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1698  					rtl8188e_power_training_try_state(ra);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1699  				else /* ra->ra_stage == 6 */
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1700  					rtl8188e_power_training_decision(ra);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1701  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1702  				if (ra->ra_stage <= 5)
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1703  					ra->ra_stage++;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1704  				else
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1705  					ra->ra_stage = 0;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1706  			}
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1707  		} else if (macid == 0) {
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1708  			dev_warn(dev, "%s: TX report item 0 not valid\n", __func__);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1709  		}
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1710  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1711  		dev_dbg(dev, "%s:  valid: %d retry: %d %d %d %d %d drop: %d\n",
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1712  			__func__, valid,
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1713  			ra->retry[0], ra->retry[1], ra->retry[2],
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1714  			ra->retry[3], ra->retry[4], ra->drop);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1715  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1716  		if (min_rpt_time > ra->rpt_time)
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1717  			min_rpt_time = ra->rpt_time;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1718  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1719  		rpt += TX_RPT2_ITEM_SIZE;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1720  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1721  		/*
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1722  		 * We only use macid 0, so only the first item is relevant.
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1723  		 * AP mode will use more of them if it's ever implemented.
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1724  		 */
                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1725  		break;
                                                                ^^^^^

8b9754b28f0f23 Bitterblue Smith 2022-12-17  1726  	}
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1727  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1728  	if (min_rpt_time != ra->pre_min_rpt_time) {
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1729  		rtl8xxxu_write16(priv, REG_TX_REPORT_TIME, min_rpt_time);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1730  		ra->pre_min_rpt_time = min_rpt_time;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1731  	}
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1732  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

