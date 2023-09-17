Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E13636
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 06:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694933181; x=1726469181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/EH5osnW4/DGs5nlug5fOyECsH+KRJotcDTcciiCNw=;
  b=iXHlagjLTYItzU5n/1VKlIU1q/Dk60oiRv+fLZxGAchpWMGKYLx9Wjm2
   G+N7fgAz50NEA9TK9HlxOkc8rrf7FsFXMPJlhRcbHXlTfhq52H7yV0osG
   yp9DgrcPl4yU9645MZ0HDJQr83k3UGOE5l4XWdZG111jnhKHh8jdS2GU3
   LAI4yYqI5nW380FIpbEIiGTF++0EIeKMOU+/ep0yXyuDZk0PwDZtxLUGV
   lssS4V+JHWSuSKRPmxKzF6MNpWHSgzvCVXMgfywejdFwByTiqLsJ3A3CZ
   FAO/AS9saSqnKiSBQQ9S7dgvmdlv0XYGCRHSiY5n+XtoNtI9v8J7la/IC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="359725095"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="359725095"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 23:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="815655838"
X-IronPort-AV: E=Sophos;i="6.02,153,1688454000"; 
   d="scan'208";a="815655838"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2023 23:46:19 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhlXt-000524-2U;
	Sun, 17 Sep 2023 06:46:17 +0000
Date: Sun, 17 Sep 2023 14:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-ls2x.c:153 ls2x_i2c_send_byte() error:
 uninitialized symbol 'rxdata'.
Message-ID: <202309171426.6XFHCjac-lkp@intel.com>
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
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: 015e61f0bffd46600496e50d3b2298f51f6b11a8 i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230917/202309171426.6XFHCjac-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309171426.6XFHCjac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309171426.6XFHCjac-lkp@intel.com/

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
