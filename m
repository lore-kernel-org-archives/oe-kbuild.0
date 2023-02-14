Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE9227721
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Feb 2023 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676380092; x=1707916092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xGB2YRibt4zTg5JNtgbUu9sZEvyRUEKDP9cdpYrf+sY=;
  b=lUKXYE+g71nbfYl0x3lgo1R5gImlS1mGzfza3+N8wWCecwBTXMMkfnye
   Gjy8bWyfJflm44XVHoDDrazldJqLVPSY7J0cSPe0DJ0uY0q+kEvlJcL4s
   rHpU9tv0LloIWKjEK7Zbt+Eaqi9K6X4lu5R0H1onISirdI00ylg913JZE
   e8We+tuB+9qu2UbvATpPrplBy2mX2dXkvanftC1OS3ZiDUHwiJjAx798x
   hj2gHP2XaXmAfeq7XIjS1Np+kGMyQxAqi0vpwgx9VUhqz1yzQOGFD4qYD
   76V3swEFjdSdV8nzWw0pG3PNa/hbDh1/dIQW3yUs/+Vgd9gDTnxBT2UH6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358568937"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="358568937"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 05:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="619053173"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="619053173"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Feb 2023 05:08:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRv2X-0008Wn-2Z;
	Tue, 14 Feb 2023 13:08:09 +0000
Date: Tue, 14 Feb 2023 21:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Bitterblue Smith <rtl8821cerfe2@gmail.com>
CC: Kalle Valo <kvalo@kernel.org>
CC: "Ping-Ke Shih" <pkshih@realtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
commit: 8b9754b28f0f231736667e1751f1fc6f18c80ad4 [681/12724] wifi: rtl8xxxu: Add rate control code for RTL8188EU
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230214/202302142135.LCqUTVGY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302142135.LCqUTVGY-lkp@intel.com/

smatch warnings:
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678 rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.

vim +1678 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c

8b9754b28f0f23 Bitterblue Smith 2022-12-17  1661  
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
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1725  		break;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1726  	}
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1727  
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1728  	if (min_rpt_time != ra->pre_min_rpt_time) {
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1729  		rtl8xxxu_write16(priv, REG_TX_REPORT_TIME, min_rpt_time);
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1730  		ra->pre_min_rpt_time = min_rpt_time;
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1731  	}
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1732  }
8b9754b28f0f23 Bitterblue Smith 2022-12-17  1733  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
