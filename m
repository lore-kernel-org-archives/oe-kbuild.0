Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4595C624
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Feb 2023 02:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675994959; x=1707530959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9o2i00HJ/HX8k2wvZwz/B0n7F97oOZu/pldEXkBwgw=;
  b=jxAKlqq8GIfmaUwpKEFNjzbPra+XlHqbyRhK3npsBry7lh8LxHy/15eK
   1EMUVaYedG5DYLa5M8GIPa3KnnVepf5pLh98OS+GqlnkYYqwAfi0dIEd4
   1jB4/gXOdj4yza+oWenM4nlEu1pfdzAkenJMh9j2PHUTCLtPbu2jWz6aH
   9jQqJl1WSzzMfC49E4l+Mr7K1Dp/OC2tc352dUeAt+q7A2Z009UxoXLoD
   0LHO/02VEmCScgScQ0NzhwoyEHvesyxqAJW0Z4DqE/qciE/9e++g5MRsZ
   R/H/DI5Z5UY2BlytSl5/cTUb8pHi920U4hR6na8YyQcc1itEu1HWg9zp4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="416539777"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="416539777"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 18:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="700300625"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="700300625"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Feb 2023 18:09:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQIqg-0005SE-1H;
	Fri, 10 Feb 2023 02:09:14 +0000
Date: Fri, 10 Feb 2023 10:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/realtek/rtw89/mac.c:3829
 rtw89_mac_cfg_ppdu_status() warn: missing error code? 'ret'
Message-ID: <202302101023.ctlih5q0-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Ping-Ke Shih" <pkshih@realtek.com>
CC: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e544a07438522ab3688416e6e2e34bf0ee6d8755
commit: 7ba49f4c6896d83b3841c0b046a0a7b1e97cc0dd rtw89: 8852c: add 8852ce to Makefile and Kconfig
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: parisc-randconfig-m031-20230209 (https://download.01.org/0day-ci/archive/20230210/202302101023.ctlih5q0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302101023.ctlih5q0-lkp@intel.com/

smatch warnings:
drivers/net/wireless/realtek/rtw89/mac.c:3829 rtw89_mac_cfg_ppdu_status() warn: missing error code? 'ret'

vim +/ret +3829 drivers/net/wireless/realtek/rtw89/mac.c

e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3817  
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3818  int rtw89_mac_cfg_ppdu_status(struct rtw89_dev *rtwdev, u8 mac_idx, bool enable)
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3819  {
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3820  	u32 reg = rtw89_mac_reg_by_idx(R_AX_PPDU_STAT, mac_idx);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3821  	int ret = 0;
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3822  
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3823  	ret = rtw89_mac_check_mac_en(rtwdev, mac_idx, RTW89_CMAC_SEL);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3824  	if (ret)
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3825  		return ret;
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3826  
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3827  	if (!enable) {
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3828  		rtw89_write32_clr(rtwdev, reg, B_AX_PPDU_STAT_RPT_EN);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11 @3829  		return ret;
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3830  	}
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3831  
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3832  	rtw89_write32(rtwdev, reg, B_AX_PPDU_STAT_RPT_EN |
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3833  				   B_AX_APP_MAC_INFO_RPT |
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3834  				   B_AX_APP_RX_CNT_RPT | B_AX_APP_PLCP_HDR_RPT |
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3835  				   B_AX_PPDU_STAT_RPT_CRC32);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3836  	rtw89_write32_mask(rtwdev, R_AX_HW_RPT_FWD, B_AX_FWD_PPDU_STAT_MASK,
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3837  			   RTW89_PRPT_DEST_HOST);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3838  
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3839  	return ret;
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3840  }
861e58c8fc6be0 Zong-Zhe Yang 2021-12-21  3841  EXPORT_SYMBOL(rtw89_mac_cfg_ppdu_status);
e3ec7017f6a20d Ping-Ke Shih  2021-10-11  3842  

:::::: The code at line 3829 was first introduced by commit
:::::: e3ec7017f6a20d12ddd9fe23d345ebb7b8c104dd rtw89: add Realtek 802.11ax driver

:::::: TO: Ping-Ke Shih <pkshih@realtek.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
