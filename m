Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239061BC41
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747879; cv=none; b=CFRs7+JrYR0tYyMXGKM04OY9jlDirq7MwatIAu1gfC44BXRVW994+MPtJcBnZEgf6idS99mr+9+VDgBXjFutBlIaKrjoTCbHDfDwKZi2GzCivs0h8mg0UcW3LAGivkPepOBYmnxqFhzT8XcPOXGwCGdEp2TJ+jJXmB9PAFnlgc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747879; c=relaxed/simple;
	bh=NSvONUgs53gtaVAlNrCbUzor5iDkfke1EUY7ET3nHtA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqLcoHZOb9SxSzOF/RoLTI4utrCpjwcpyLLsF4u5WSZZdP+X32NUXqJpBBNUN1w1q5YDDaf++FAg6jSdcbbYOp6ljCdyN0uRaip4rLtMnLaAJ4XZ4K16twPfXdluRLnHdiTzqyJz1gp1PAd2WL2q0CV2yxLo3X9NKBYku+PAt80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJp31VVl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJp31VVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761747878; x=1793283878;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NSvONUgs53gtaVAlNrCbUzor5iDkfke1EUY7ET3nHtA=;
  b=jJp31VVl6yAlPEJ7Kwi1H0YTeRTDLSj4ETI1BJKskY6wHpSjK+64iLBO
   IQyuBmt+ZR2AVaHAseILDxkWM/nwby8W/xZmq33Z3oFC5KyhO16nE8Qqw
   zQFYVolSavnLOFa8K/DfWDeoccPeGusCoVaiYClMn4p6GCJ/+tnAW9xsw
   NzScz5S39YpdVL2YFtIwz3H0l6zoR6ZK4DsJkNGE9i9ET+H1qpD2ovWfW
   bgAFpGckoL4Jcnwe73v3QzPlLtpLYnjcUW0XVVboZZbB7A9kn+Y8IQaRE
   S3A1xOZIwA0hWtMIGdqDmWvJBnhaTED2znJdYEjvir89kZRR/PEohnmCh
   A==;
X-CSE-ConnectionGUID: RjIuQ67WRq2th99Sff9ahA==
X-CSE-MsgGUID: BxV9O7ivQ5KgosRbfRPhHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63571585"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63571585"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 07:24:38 -0700
X-CSE-ConnectionGUID: LInHh0YfRkKKhZV/T3p6Tw==
X-CSE-MsgGUID: WaWXbxVdQja7OFnoWCCr5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="190853853"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2025 07:24:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE75g-000KgL-0c;
	Wed, 29 Oct 2025 14:24:00 +0000
Date: Wed, 29 Oct 2025 22:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 887/4731] drivers/spi/spi-aspeed-smc.c:980:2-7:
 opportunity for str_yes_no(found)
Message-ID: <202510292251.VyXccjIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 31dcc7e1f8a9377d8fd9f967f84c121c5ba8f89c [887/4731] spi: aspeed: Update clock selection strategy
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: sparc64-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292251.VyXccjIA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510292251.VyXccjIA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/spi/spi-aspeed-smc.c:560:12-43: opportunity for str_read_write(op -> data . dir == SPI_MEM_DATA_IN)
>> drivers/spi/spi-aspeed-smc.c:980:2-7: opportunity for str_yes_no(found)
   drivers/spi/spi-aspeed-smc.c:1026:2-7: opportunity for str_yes_no(found)
   drivers/spi/spi-aspeed-smc.c:1066:2-7: opportunity for str_yes_no(found)

vim +980 drivers/spi/spi-aspeed-smc.c

eeaec1ea05c0e0 Cédric Le Goater 2022-05-09  952  
eeaec1ea05c0e0 Cédric Le Goater 2022-05-09  953  #define ASPEED_SPI_HCLK_DIV(i) \
eeaec1ea05c0e0 Cédric Le Goater 2022-05-09  954  	(aspeed_spi_hclk_divs[(i) - 1] << CTRL_FREQ_SEL_SHIFT)
eeaec1ea05c0e0 Cédric Le Goater 2022-05-09  955  
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  956  /* Transfer maximum clock frequency to register setting */
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  957  static u32 aspeed_get_clk_div_ast2400(struct aspeed_spi_chip *chip,
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  958  				      u32 max_hz)
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  959  {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  960  	struct device *dev = chip->aspi->dev;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  961  	u32 hclk_clk = chip->aspi->clk_freq;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  962  	u32 div_ctl = 0;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  963  	u32 i;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  964  	bool found = false;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  965  
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  966  	/* FMC/SPIR10[11:8] */
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  967  	for (i = 1; i <= ARRAY_SIZE(aspeed_spi_hclk_divs); i++) {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  968  		if (hclk_clk / i <= max_hz) {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  969  			found = true;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  970  			break;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  971  		}
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  972  	}
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  973  
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  974  	if (found) {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  975  		div_ctl = ASPEED_SPI_HCLK_DIV(i);
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  976  		chip->clk_freq = hclk_clk / i;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  977  	}
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  978  
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  979  	dev_dbg(dev, "found: %s, hclk: %d, max_clk: %d\n",
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01 @980  		found ? "yes" : "no", hclk_clk, max_hz);
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  981  
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  982  	if (found) {
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  983  		dev_dbg(dev, "h_div: 0x%08x, speed: %d\n",
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  984  			div_ctl, chip->clk_freq);
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  985  	}
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  986  
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  987  	return div_ctl;
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  988  }
31dcc7e1f8a937 Chin-Ting Kuo    2025-10-01  989  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
