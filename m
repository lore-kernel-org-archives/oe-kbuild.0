Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C418836
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Sep 2023 19:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695151943; x=1726687943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=duQupVXGeVldlbJHus8Tuyu/L5vKP+tHe4uRS7Lk4bo=;
  b=bSzJ9Z1dSznxxDdAFzUTbfIp0dAgFCIy3pmQnTs9QYiiWlZ16sYpMGEH
   pqu0/eAbp82ZCHTbiZImvmSmCbkK3dbQKb9d534w4OgW3W1rdxOgBbgOm
   CyrG6bV7wZIJbT+5js0vSy4g5UBQlKnF+GuLc4DA3Svtzd+JSqNktDdmd
   rfPAIa9YbGdQcUYKYADRi9Mn+/lG+ipNNR6qfRewOGIrENokgrTCmsVXJ
   vX1Cw5tbNuVISfD3jAuxo/KQ8HoR3Mu7Pr/PI/DYqo+En0w0qG91OgLBb
   0cpT1rHLX7lozx3WRU/ZdCUcmQGmY0t+5A4xVgcFob3uE7DKkl08ATNT3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378925756"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="378925756"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 12:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="811841874"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="811841874"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Sep 2023 12:32:06 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qigS4-0007qG-1A;
	Tue, 19 Sep 2023 19:32:04 +0000
Date: Wed, 20 Sep 2023 03:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-ls2x.c:153 ls2x_i2c_send_byte() error:
 uninitialized symbol 'rxdata'.
Message-ID: <202309200302.60zPVh9O-lkp@intel.com>
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
TO: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Andy Shevchenko <andy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf0f715623872823a72e451243bbf555d10d032
commit: 015e61f0bffd46600496e50d3b2298f51f6b11a8 i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
date:   8 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 8 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230920/202309200302.60zPVh9O-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309200302.60zPVh9O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309200302.60zPVh9O-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-ls2x.c:153 ls2x_i2c_send_byte() error: uninitialized symbol 'rxdata'.

vim +/rxdata +153 drivers/i2c/busses/i2c-ls2x.c

015e61f0bffd46 Binbin Zhou 2023-01-31  143  
015e61f0bffd46 Binbin Zhou 2023-01-31  144  static int ls2x_i2c_send_byte(struct ls2x_i2c_priv *priv, u8 txdata)
015e61f0bffd46 Binbin Zhou 2023-01-31  145  {
015e61f0bffd46 Binbin Zhou 2023-01-31  146  	int ret;
015e61f0bffd46 Binbin Zhou 2023-01-31  147  	u8 rxdata;
015e61f0bffd46 Binbin Zhou 2023-01-31  148  
015e61f0bffd46 Binbin Zhou 2023-01-31  149  	ret = ls2x_i2c_xfer_byte(priv, txdata, &rxdata);
015e61f0bffd46 Binbin Zhou 2023-01-31  150  	if (ret)
015e61f0bffd46 Binbin Zhou 2023-01-31  151  		return ret;
015e61f0bffd46 Binbin Zhou 2023-01-31  152  
015e61f0bffd46 Binbin Zhou 2023-01-31 @153  	if (rxdata & LS2X_SR_AL)
015e61f0bffd46 Binbin Zhou 2023-01-31  154  		return -EAGAIN;
015e61f0bffd46 Binbin Zhou 2023-01-31  155  
015e61f0bffd46 Binbin Zhou 2023-01-31  156  	if (rxdata & LS2X_SR_NOACK)
015e61f0bffd46 Binbin Zhou 2023-01-31  157  		return -ENXIO;
015e61f0bffd46 Binbin Zhou 2023-01-31  158  
015e61f0bffd46 Binbin Zhou 2023-01-31  159  	return 0;
015e61f0bffd46 Binbin Zhou 2023-01-31  160  }
015e61f0bffd46 Binbin Zhou 2023-01-31  161  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
