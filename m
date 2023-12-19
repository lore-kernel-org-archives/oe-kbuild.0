Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622E01CAAC
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0pzEeQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702996148; x=1734532148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=No5Uur9bjG2ksbNh0nkhl5nCVxGhWnqyxQQ+QsIQVNE=;
  b=N0pzEeQ9RpaiY/SzOWBVrgy/zitzNtjYxTlhKwck4CvlKtJJGqpokhBi
   3/8lmHod4/K4ULO2MX3ipsa6bmhBVFwmcmsen4flvwoa8ZlwgSx8Uj478
   30CMPZ+iFGYt9zvUj2KVFrszjG/R1b3NZTbWcBU2kKT4apjEFrngRQTr6
   BBFYRMhHSTdfRYQ54t2kuV5rrR7vlaY30MIzMuxn/+rQtmIcIiQQyXYMN
   VYtD2rXPvq8VQNzM3pr7hly/qK66b6w+WKYx/rpy1ZAKFERUvaywaBEYg
   1/MQoy7VXVeQzZXv4fTBlo1hoOr1GDQ72c86XCloY5QDI62mEzDeZfS6W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="394542614"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="394542614"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="775994321"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="775994321"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Dec 2023 06:28:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFb5R-0005SL-12;
	Tue, 19 Dec 2023 14:28:47 +0000
Date: Tue, 19 Dec 2023 22:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7668/9096]
 drivers/net/wireless/marvell/mwifiex/sdio.c:799 mwifiex_check_fw_status()
 error: uninitialized symbol 'firmware_stat'.
Message-ID: <202312192236.ZflaWYCw-lkp@intel.com>
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
TO: David Lin <yu-hao.lin@nxp.com>
CC: Kalle Valo <kvalo@kernel.org>
CC: Francesco Dolcini <francesco.dolcini@toradex.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa4db8324c4d0e67aa4670356df4e9fae14b4d37
commit: 1c5d463c0770c6fa2037511a24fb17966fd07d97 [7668/9096] wifi: mwifiex: add extra delay for firmware ready
:::::: branch date: 10 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231219 (https://download.01.org/0day-ci/archive/20231219/202312192236.ZflaWYCw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312192236.ZflaWYCw-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/marvell/mwifiex/sdio.c:799 mwifiex_check_fw_status() error: uninitialized symbol 'firmware_stat'.

Old smatch warnings:
drivers/net/wireless/marvell/mwifiex/sdio.c:2112 mwifiex_process_int_status() warn: missing unwind goto?

vim +/firmware_stat +799 drivers/net/wireless/marvell/mwifiex/sdio.c

90ff71f9557591 Xinming Hu 2016-11-30  774  
90ff71f9557591 Xinming Hu 2016-11-30  775  /* This function checks the firmware status in card.
90ff71f9557591 Xinming Hu 2016-11-30  776   */
90ff71f9557591 Xinming Hu 2016-11-30  777  static int mwifiex_check_fw_status(struct mwifiex_adapter *adapter,
90ff71f9557591 Xinming Hu 2016-11-30  778  				   u32 poll_num)
90ff71f9557591 Xinming Hu 2016-11-30  779  {
1c5d463c0770c6 David Lin  2023-12-09  780  	struct sdio_mmc_card *card = adapter->card;
90ff71f9557591 Xinming Hu 2016-11-30  781  	int ret = 0;
90ff71f9557591 Xinming Hu 2016-11-30  782  	u16 firmware_stat;
90ff71f9557591 Xinming Hu 2016-11-30  783  	u32 tries;
90ff71f9557591 Xinming Hu 2016-11-30  784  
90ff71f9557591 Xinming Hu 2016-11-30  785  	for (tries = 0; tries < poll_num; tries++) {
90ff71f9557591 Xinming Hu 2016-11-30  786  		ret = mwifiex_sdio_read_fw_status(adapter, &firmware_stat);
90ff71f9557591 Xinming Hu 2016-11-30  787  		if (ret)
90ff71f9557591 Xinming Hu 2016-11-30  788  			continue;
90ff71f9557591 Xinming Hu 2016-11-30  789  		if (firmware_stat == FIRMWARE_READY_SDIO) {
90ff71f9557591 Xinming Hu 2016-11-30  790  			ret = 0;
90ff71f9557591 Xinming Hu 2016-11-30  791  			break;
90ff71f9557591 Xinming Hu 2016-11-30  792  		}
90ff71f9557591 Xinming Hu 2016-11-30  793  
90ff71f9557591 Xinming Hu 2016-11-30  794  		msleep(100);
90ff71f9557591 Xinming Hu 2016-11-30  795  		ret = -1;
90ff71f9557591 Xinming Hu 2016-11-30  796  	}
90ff71f9557591 Xinming Hu 2016-11-30  797  
1c5d463c0770c6 David Lin  2023-12-09  798  	if (card->fw_ready_extra_delay &&
1c5d463c0770c6 David Lin  2023-12-09 @799  	    firmware_stat == FIRMWARE_READY_SDIO)
1c5d463c0770c6 David Lin  2023-12-09  800  		/* firmware might pretend to be ready, when it's not.
1c5d463c0770c6 David Lin  2023-12-09  801  		 * Wait a little bit more as a workaround.
1c5d463c0770c6 David Lin  2023-12-09  802  		 */
1c5d463c0770c6 David Lin  2023-12-09  803  		msleep(100);
1c5d463c0770c6 David Lin  2023-12-09  804  
90ff71f9557591 Xinming Hu 2016-11-30  805  	return ret;
90ff71f9557591 Xinming Hu 2016-11-30  806  }
90ff71f9557591 Xinming Hu 2016-11-30  807  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
