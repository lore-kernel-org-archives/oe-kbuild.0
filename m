Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AFA2714D
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690481621; x=1722017621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XAufQTbnfUkKhoL8u5UONnVpabhTBxxh3Rxsc0oP6YM=;
  b=PmjI3RW11y0GOR4I/nKBY62qaQ0Xwd46UlI+ThIEsV/ZipqQ5RFI4Mnn
   dpo+rfSdMn5cbHeFqyKZ4s8csfXy1natVHCEI4KM4SzW6Kwyx2tYIO4RX
   j6wC6NDruy/18WIkvwS25BPZb2spBj8sesZCwFfDc6aXFcFBWwOKX6SCf
   lUQP83fp4NRbcfXbWNcAwollTkYLHkomgIIIQHuSlkTYjP75JhKBn0gcs
   KJKDPxl1Vk+DffVWLjtXtzKRAVPCLHXXY0ye+0h7pywxoIocDu14nLyuU
   oHORIW0xSSAWjY33WaqC5w7AMgb6Utw50f3oFjV9Oryz/lB1IqvLC/0Cq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="367270157"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="367270157"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 11:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870525080"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2023 11:13:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP5U3-0002Uv-0N;
	Thu, 27 Jul 2023 18:13:15 +0000
Date: Fri, 28 Jul 2023 02:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-ls2x.c:153 ls2x_i2c_send_byte() error:
 uninitialized symbol 'rxdata'.
Message-ID: <202307280125.paGJHKnS-lkp@intel.com>
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
head:   0a8db05b571ad5b8d5c8774a004c0424260a90bd
commit: 015e61f0bffd46600496e50d3b2298f51f6b11a8 i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
date:   6 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-m041-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280125.paGJHKnS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280125.paGJHKnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307280125.paGJHKnS-lkp@intel.com/

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
