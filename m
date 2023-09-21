Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D768622
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Sep 2023 01:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695259789; x=1726795789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=plaKmqs0AxMPd395IWAaUl/Zzq1bF19PUH0aYtJUg0o=;
  b=XuLzNWLNkImdxWeCfUnljc4KOv+2RagprjS38h/rkcNFmfx50n6rzl0P
   g1cW3IcTwtE/c+do9xLGwAcFddyoDz6pddcaZnTa/6L8PcptorQtRwZ3O
   iL0Pqs521oSUNsxfCwxAjVCOHxE4SpyOIXNNu0RguXKZgVKh01A6RMQJs
   JjnRqGuETrIorw66cHhPJgqvwD0AQ66OIBtWMJst1hhrtRjJUkaUHX1Fe
   qlIL0m8Ci7WRQAmYllr62xeAgM0ilCMRxH54U5wowQFQZnq5WH8CrASxQ
   HsCQ5iaqiBFs1z+/ckoBeeK2s/jeK5W1bE14/GHsoDP4cV94zn44zGRHX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383132119"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="383132119"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 18:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750174735"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="750174735"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2023 18:29:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj8Vl-0009NG-1c;
	Thu, 21 Sep 2023 01:29:45 +0000
Date: Thu, 21 Sep 2023 09:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-ls2x.c:153 ls2x_i2c_send_byte() error:
 uninitialized symbol 'rxdata'.
Message-ID: <202309210923.vkijhueJ-lkp@intel.com>
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
head:   42dc814987c1feb6410904e58cfd4c36c4146150
commit: 015e61f0bffd46600496e50d3b2298f51f6b11a8 i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230921/202309210923.vkijhueJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230921/202309210923.vkijhueJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309210923.vkijhueJ-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-ls2x.c:153 ls2x_i2c_send_byte() error: uninitialized symbol 'rxdata'.

vim +/rxdata +153 drivers/i2c/busses/i2c-ls2x.c

015e61f0bffd466 Binbin Zhou 2023-01-31  143  
015e61f0bffd466 Binbin Zhou 2023-01-31  144  static int ls2x_i2c_send_byte(struct ls2x_i2c_priv *priv, u8 txdata)
015e61f0bffd466 Binbin Zhou 2023-01-31  145  {
015e61f0bffd466 Binbin Zhou 2023-01-31  146  	int ret;
015e61f0bffd466 Binbin Zhou 2023-01-31  147  	u8 rxdata;
015e61f0bffd466 Binbin Zhou 2023-01-31  148  
015e61f0bffd466 Binbin Zhou 2023-01-31  149  	ret = ls2x_i2c_xfer_byte(priv, txdata, &rxdata);
015e61f0bffd466 Binbin Zhou 2023-01-31  150  	if (ret)
015e61f0bffd466 Binbin Zhou 2023-01-31  151  		return ret;
015e61f0bffd466 Binbin Zhou 2023-01-31  152  
015e61f0bffd466 Binbin Zhou 2023-01-31 @153  	if (rxdata & LS2X_SR_AL)
015e61f0bffd466 Binbin Zhou 2023-01-31  154  		return -EAGAIN;
015e61f0bffd466 Binbin Zhou 2023-01-31  155  
015e61f0bffd466 Binbin Zhou 2023-01-31  156  	if (rxdata & LS2X_SR_NOACK)
015e61f0bffd466 Binbin Zhou 2023-01-31  157  		return -ENXIO;
015e61f0bffd466 Binbin Zhou 2023-01-31  158  
015e61f0bffd466 Binbin Zhou 2023-01-31  159  	return 0;
015e61f0bffd466 Binbin Zhou 2023-01-31  160  }
015e61f0bffd466 Binbin Zhou 2023-01-31  161  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
