Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D2C2F4B
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 13:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676898146; x=1708434146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PBiuBgnXw3jxn0AFmfJ5Kt8EfcQs75DgitWzJcjpniI=;
  b=IqqbWr9Czn5JdLVL7hwGLgOdPgSpYZHhIOh7bTuDDZ0cOUaBWNaO/NbP
   LMKwrqhQ8k3CfaO3QCnRzCoS8FdH1GBEiRDwOofZi8v5HT50pt7mIwJTl
   ymwrbv/IlQuVDhQAUOdwxxQ7cv4WdUBeADpgrr3guAsGnSh+H5od+BU+L
   gmctL+KWUcpCr71iPI96jk8pyY1hD3MQ69gV0+OHv1jpsyt6vib6/ICjD
   rqUWn4f+CcBYCjfcjoprg8W00xBQLQK4AXXOtopgIDmnTsJHUcxVIfNGK
   +No9zyWFl3uCp86WPJsXm58PaAEcAxZKiWoual/htPPQuKi4MuwaT2B9G
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="333756186"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="333756186"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 05:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="795170110"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="795170110"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Feb 2023 05:02:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU5o8-000DvZ-1F;
	Mon, 20 Feb 2023 13:02:16 +0000
Date: Mon, 20 Feb 2023 21:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 681/13681]
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8188e.c:1678
 rtl8188e_handle_ra_tx_report2() warn: ignoring unreachable code.
Message-ID: <202302202035.jgGt65Cj-lkp@intel.com>
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
head:   d2af0fa4bfa4ec29d03b449ccd43fee39501112d
commit: 8b9754b28f0f231736667e1751f1fc6f18c80ad4 [681/13681] wifi: rtl8xxxu: Add rate control code for RTL8188EU
:::::: branch date: 7 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230220/202302202035.jgGt65Cj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302202035.jgGt65Cj-lkp@intel.com/

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
