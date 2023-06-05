Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B4F1F93A
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jun 2023 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685979553; x=1717515553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGdQBgulJSkhOPjXzSLVFPkXqGNoqHVTViVcuXLD4MM=;
  b=M8VinKau4l7HlehE18xEM44/hsNVGHI0GnWsZgSkY5pdBr/qVHH8sE5b
   37b0Zvyv+7iCBzYaKRCEdVsQCPO6MVj7N80zITykPmQbVBAchMCj9Ywdv
   AwH3Lc0jc7CZ6HD0qvPDjU2VrkcZv+Lgf486nceVI44yj5Tdaucits7ta
   H/ssLyu/+7m6OJfAsXirqH3po7j6dUY7KDPlzH+qh8CjjPU81U7LRxnDH
   bc/zETz4HAQAvoU0YtfBu7SuQp6ERbkBSPZRAUp31zdTRsj692ITF9mqU
   VBrke3sjsBJSHRlDFZudNeQEq2MTFHKGFYbnBt4lvy1EoREwLm1uo12/k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341038565"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="341038565"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 08:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="1038804196"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="1038804196"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Jun 2023 08:39:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6CIX-0004Fe-1u;
	Mon, 05 Jun 2023 15:39:09 +0000
Date: Mon, 5 Jun 2023 23:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/realtek/rtw88/mac.c:748
 __rtw_download_firmware() warn: missing unwind goto?
Message-ID: <202306052310.OVhcUjZ3-lkp@intel.com>
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
TO: Sascha Hauer <s.hauer@pengutronix.de>
CC: Kalle Valo <kvalo@kernel.org>

Hi Sascha,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9561de3a55bed6bdd44a12820ba81ec416e705a7
commit: 45794099f5e1d7abc5eb07e6eec7e1e5c6cb540d wifi: rtw88: Add rtw8822bu chipset support
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-m031-20230605 (https://download.01.org/0day-ci/archive/20230605/202306052310.OVhcUjZ3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306052310.OVhcUjZ3-lkp@intel.com/

smatch warnings:
drivers/net/wireless/realtek/rtw88/mac.c:748 __rtw_download_firmware() warn: missing unwind goto?
drivers/net/wireless/realtek/rtw88/debug.c:677 rtw_debugfs_get_tx_pwr_tbl() warn: argument 4 to %02x specifier has type 'schar'

vim +748 drivers/net/wireless/realtek/rtw88/mac.c

e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  716  
3d8bf50860c7de Yan-Hsuan Chuang 2020-04-24  717  static int __rtw_download_firmware(struct rtw_dev *rtwdev,
3d8bf50860c7de Yan-Hsuan Chuang 2020-04-24  718  				   struct rtw_fw_state *fw)
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  719  {
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  720  	struct rtw_backup_info bckp[DLFW_RESTORE_REG_NUM];
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  721  	const u8 *data = fw->firmware->data;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  722  	u32 size = fw->firmware->size;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  723  	u32 ltecoex_bckp;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  724  	int ret;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  725  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  726  	if (!check_firmware_size(data, size))
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  727  		return -EINVAL;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  728  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  729  	if (!ltecoex_read_reg(rtwdev, 0x38, &ltecoex_bckp))
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  730  		return -EBUSY;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  731  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  732  	wlan_cpu_enable(rtwdev, false);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  733  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  734  	download_firmware_reg_backup(rtwdev, bckp);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  735  	download_firmware_reset_platform(rtwdev);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  736  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  737  	ret = start_download_firmware(rtwdev, data, size);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  738  	if (ret)
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  739  		goto dlfw_fail;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  740  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  741  	download_firmware_reg_restore(rtwdev, bckp, DLFW_RESTORE_REG_NUM);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  742  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  743  	download_firmware_end_flow(rtwdev);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  744  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  745  	wlan_cpu_enable(rtwdev, true);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  746  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  747  	if (!ltecoex_reg_write(rtwdev, 0x38, ltecoex_bckp))
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 @748  		return -EBUSY;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  749  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  750  	ret = download_firmware_validate(rtwdev);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  751  	if (ret)
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  752  		goto dlfw_fail;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  753  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  754  	/* reset desc and index */
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  755  	rtw_hci_setup(rtwdev);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  756  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  757  	rtwdev->h2c.last_box_num = 0;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  758  	rtwdev->h2c.seq = 0;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  759  
3c519605850890 Yan-Hsuan Chuang 2019-10-02  760  	set_bit(RTW_FLAG_FW_RUNNING, rtwdev->flags);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  761  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  762  	return 0;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  763  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  764  dlfw_fail:
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  765  	/* Disable FWDL_EN */
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  766  	rtw_write8_clr(rtwdev, REG_MCUFW_CTRL, BIT_MCUFWDL_EN);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  767  	rtw_write8_set(rtwdev, REG_SYS_FUNC_EN + 1, BIT_FEN_CPUEN);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  768  
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  769  	return ret;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  770  }
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  771  

:::::: The code at line 748 was first introduced by commit
:::::: e3037485c68ec1a299ff41160d8fedbd4abc29b9 rtw88: new Realtek 802.11ac driver

:::::: TO: Yan-Hsuan Chuang <yhchuang@realtek.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
