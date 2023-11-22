Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9721121369
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 23:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKy8yiwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700695961; x=1732231961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hxSkCSfxTjDsRrkxWQOEkEGasTySeoe3X0/KFgOhxmU=;
  b=lKy8yiwmsSoE1Y4Rr+iLalFTVwzKrAJbFC8T5BrTduofBgQ0UlqtSohj
   Y2Roor/hlMwsTNTayZ2X91t/js5GMRuVA1RxPx84Lrr4J3bT/En4VmyWQ
   XhQgSu3lqbypzfk8hbtij54JFFMKfvB9LYZWTUlMLGGXLcbQ+3AK8QW3U
   k2Ca5a6IseAX+1WTt0BkgYHq+2wrDzJjemJRBpU0C6SndaJm62G/FHH6j
   CVSYqYNfnMBIN6UpHRkIChCbuaI591WnVVhzBW+eLd1jn2Er9yVOBdokW
   EA630ovYVSpATXB8QBAGlLEcZOGu+5tCFGfBdKUK8ctBfgi+kGyWzS/WE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391936058"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="391936058"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="760510894"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="760510894"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Nov 2023 15:32:34 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5whs-0000zK-1V;
	Wed, 22 Nov 2023 23:32:32 +0000
Date: Thu, 23 Nov 2023 07:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-ls2x.c:153 ls2x_i2c_send_byte() error:
 uninitialized symbol 'rxdata'.
Message-ID: <202311230313.M96ntLQY-lkp@intel.com>
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
head:   c2d5304e6c648ebcf653bace7e51e0e6742e46c8
commit: 015e61f0bffd46600496e50d3b2298f51f6b11a8 i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
date:   10 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 10 months ago
config: mips-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231123/202311230313.M96ntLQY-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230313.M96ntLQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311230313.M96ntLQY-lkp@intel.com/

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
