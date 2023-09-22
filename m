Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273BE41742
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695401397; x=1726937397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r4zNcFhRVXTsh2KBxI9QMycj1vN85crxa6VCKNimJsA=;
  b=R/5x+16TApS6nrQ+uqm5v6cRvXXuH8v6bHsP2baFR6MQScqPYsVGJRWR
   fqDVE5wRt91qCopvhu9cPvztqmYFFN2BdMvEz3XF1uYYtLXkF4YAvERR6
   h4ni1E6+6jrkZfvwqJ3KPV2bsqeSmpiOZIQdrq0O+6g8PzyUx1rqVIUvt
   Z61TbkRGi5w2Q4SIWIYpRGpYklK08Anc2Py/CiYBqaw6V/8kHcniQ3VXP
   gwieTljPee1XqwMUNtaQI9Dy1xporqyxBt1Y9eyrmptAw6O/QShfV4+J4
   65f8h44le+NhPVMyyfHgquuQQpn1/B5EDVGzACCtKxEjF2KW+s4SevFLF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="380783565"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="380783565"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 09:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="890879817"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="890879817"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2023 09:49:00 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjjLk-000111-2v;
	Fri, 22 Sep 2023 16:49:52 +0000
Date: Sat, 23 Sep 2023 00:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-ls2x.c:153 ls2x_i2c_send_byte() error:
 uninitialized symbol 'rxdata'.
Message-ID: <202309230055.ivzJEU8b-lkp@intel.com>
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
head:   27bbf45eae9ca98877a2d52a92a188147cd61b07
commit: 015e61f0bffd46600496e50d3b2298f51f6b11a8 i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
date:   8 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 months ago
config: csky-randconfig-r071-20230917 (https://download.01.org/0day-ci/archive/20230923/202309230055.ivzJEU8b-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230055.ivzJEU8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309230055.ivzJEU8b-lkp@intel.com/

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
