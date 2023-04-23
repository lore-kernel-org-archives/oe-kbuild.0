Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86266815
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Apr 2023 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682241847; x=1713777847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W1WqbNlWlICxUJ6CQQVuFDOL/rVme+w9Bmk6TRjX0lE=;
  b=ZC7NTURxYmsn2eSxGaDM2c3CvZkBwfxAPbv5HHFiD5kZsaxLZDUwHIT2
   zdhJIMlD1Knoua2Ldp2plugOADV7vyBu/SW1PwJnyqhTQ8pIS1xiT9u/r
   Hp4+fAAmaPwzAAUxxIR2gAk6VZquxRk51abS3YoBeImU8sAui6cFETfO0
   cr3nY5sH1JPV4zXia3tMlgdral9k1c4AoFjGEWuU/jHWUt2vkFQ4ThXuY
   HVamu34+EBGOl4YC5XF8zkx7Tw1qg/JaWw8p5KZEjd0hUqXgtYS9XpTCC
   xrfhfm6G66buDy7JKcX0wy1L9fyZW+yWy6LDy13GFClNfbHicASu8RsBA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="326589644"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="326589644"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 02:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="695402798"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="695402798"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Apr 2023 02:24:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqVwy-000ho0-35;
	Sun, 23 Apr 2023 09:24:04 +0000
Date: Sun, 23 Apr 2023 17:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10457/13717]
 drivers/net/wireless/realtek/rtw88/debug.c:677 rtw_debugfs_get_tx_pwr_tbl()
 warn: argument 4 to %02x specifier has type 'schar'
Message-ID: <202304231701.06hT8NXV-lkp@intel.com>
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
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Kalle Valo <kvalo@kernel.org>
CC: "Ping-Ke Shih" <pkshih@realtek.com>

Hi Martin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
commit: 6fdacb78f7999f5c14d9dae10d47de50959297d9 [10457/13717] wifi: rtw88: Add support for the SDIO based RTL8822CS chipset
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
config: nios2-randconfig-m041-20230423 (https://download.01.org/0day-ci/archive/20230423/202304231701.06hT8NXV-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304231701.06hT8NXV-lkp@intel.com/

smatch warnings:
drivers/net/wireless/realtek/rtw88/debug.c:677 rtw_debugfs_get_tx_pwr_tbl() warn: argument 4 to %02x specifier has type 'schar'
drivers/net/wireless/realtek/rtw88/mac.c:798 __rtw_download_firmware() warn: missing unwind goto?

vim +/schar +677 drivers/net/wireless/realtek/rtw88/debug.c

fada09311d1740 Tzu-En Huang    2020-09-25  628  
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  629  static int rtw_debugfs_get_tx_pwr_tbl(struct seq_file *m, void *v)
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  630  {
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  631  	struct rtw_debugfs_priv *debugfs_priv = m->private;
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  632  	struct rtw_dev *rtwdev = debugfs_priv->rtwdev;
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  633  	struct rtw_hal *hal = &rtwdev->hal;
685b474b7d8aad Chih-Kang Chang 2022-08-09  634  	u8 path, rate, bw, ch, regd;
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  635  	struct rtw_power_params pwr_param = {0};
685b474b7d8aad Chih-Kang Chang 2022-08-09  636  
685b474b7d8aad Chih-Kang Chang 2022-08-09  637  	mutex_lock(&rtwdev->mutex);
685b474b7d8aad Chih-Kang Chang 2022-08-09  638  	bw = hal->current_band_width;
685b474b7d8aad Chih-Kang Chang 2022-08-09  639  	ch = hal->current_channel;
685b474b7d8aad Chih-Kang Chang 2022-08-09  640  	regd = rtw_regd_get(rtwdev);
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  641  
157289376e29fd Zong-Zhe Yang   2021-11-29  642  	seq_printf(m, "channel: %u\n", ch);
157289376e29fd Zong-Zhe Yang   2021-11-29  643  	seq_printf(m, "bandwidth: %u\n", bw);
fada09311d1740 Tzu-En Huang    2020-09-25  644  	seq_printf(m, "regulatory: %s\n", rtw_get_regd_string(regd));
8704d0befb5930 Zong-Zhe Yang   2021-12-20  645  	seq_printf(m, "%-4s %-10s %-9s %-9s (%-4s %-4s %-4s) %-4s\n",
8704d0befb5930 Zong-Zhe Yang   2021-12-20  646  		   "path", "rate", "pwr", "base", "byr", "lmt", "sar", "rem");
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  647  
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  648  	mutex_lock(&hal->tx_power_mutex);
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  649  	for (path = RF_PATH_A; path <= RF_PATH_B; path++) {
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  650  		/* there is no CCK rates used in 5G */
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  651  		if (hal->current_band_type == RTW_BAND_5G)
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  652  			rate = DESC_RATE6M;
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  653  		else
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  654  			rate = DESC_RATE1M;
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  655  
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  656  		/* now, not support vht 3ss and vht 4ss*/
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  657  		for (; rate <= DESC_RATEVHT2SS_MCS9; rate++) {
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  658  			/* now, not support ht 3ss and ht 4ss*/
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  659  			if (rate > DESC_RATEMCS15 &&
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  660  			    rate < DESC_RATEVHT1SS_MCS0)
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  661  				continue;
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  662  
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  663  			rtw_get_tx_power_params(rtwdev, path, rate, bw,
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  664  						ch, regd, &pwr_param);
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  665  
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  666  			seq_printf(m, "%4c ", path + 'A');
082a36dc9995d5 Tsang-Shian Lin 2019-10-22  667  			rtw_print_rate(m, rate);
8704d0befb5930 Zong-Zhe Yang   2021-12-20  668  			seq_printf(m, " %3u(0x%02x) %4u %4d (%4d %4d %4d) %4d\n",
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  669  				   hal->tx_pwr_tbl[path][rate],
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  670  				   hal->tx_pwr_tbl[path][rate],
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  671  				   pwr_param.pwr_base,
8704d0befb5930 Zong-Zhe Yang   2021-12-20  672  				   min3(pwr_param.pwr_offset,
8704d0befb5930 Zong-Zhe Yang   2021-12-20  673  					pwr_param.pwr_limit,
8704d0befb5930 Zong-Zhe Yang   2021-12-20  674  					pwr_param.pwr_sar),
608d2a08f842d8 Ping-Ke Shih    2020-05-12  675  				   pwr_param.pwr_offset, pwr_param.pwr_limit,
8704d0befb5930 Zong-Zhe Yang   2021-12-20  676  				   pwr_param.pwr_sar,
608d2a08f842d8 Ping-Ke Shih    2020-05-12 @677  				   pwr_param.pwr_remnant);
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  678  		}
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  679  	}
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  680  
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  681  	mutex_unlock(&hal->tx_power_mutex);
685b474b7d8aad Chih-Kang Chang 2022-08-09  682  	mutex_unlock(&rtwdev->mutex);
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  683  
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  684  	return 0;
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  685  }
8812022cb2fdaa Zong-Zhe Yang   2019-07-16  686  

:::::: The code at line 677 was first introduced by commit
:::::: 608d2a08f842d8f1ca877ced7bf092f084717553 rtw88: 8723d: Add power tracking

:::::: TO: Ping-Ke Shih <pkshih@realtek.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
