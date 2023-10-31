Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E655DF65
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Oct 2023 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCy8dKS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698764369; x=1730300369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rOnDNOOqj40kdc3dzUx8ot9QvffLyjCsSLU0RNN3tIs=;
  b=OCy8dKS4qswP4OsggWfL1P2TP/tt4SF/tM7uSEKr0FuZQmZDHGhi/UZf
   8cTRF9SPVhleKr18lqq1YdEkMGuIMt0nPgjtGMk8RSlitXim2k0EuSaqi
   VX59bFWinyCop/JNHS/eVKkJwz05/Ta3zgjQhdd5HzyIhDfZj4QrgKrhL
   xucoIk09FDltsc8ms2FJIR8/7ELSJVjfAgD5Uc35INPimK1SLnUrLmXze
   CEijBnky5TMx55lrHwrQfc8ouPm8wIwToAMNA3LblmBXTo81EoTeFWw3U
   7PkVJorICAgMdjXhL8ovq7AJ5oDNvzpoCDbitcgLtST4NjAY1dtr6druH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="378693123"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="378693123"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 07:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="884231701"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="884231701"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Oct 2023 07:59:27 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxqDF-0000E4-0w;
	Tue, 31 Oct 2023 14:59:25 +0000
Date: Tue, 31 Oct 2023 22:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spi/spi-amd.c:253 amd_set_spi_freq() error: buffer overflow
 'amd_spi_freq' 9 <= 9 (assuming for loop doesn't break)
Message-ID: <202310312254.YBm6LJtN-lkp@intel.com>
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
TO: Lucas Tanure <tanureal@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Shreeya Patel <shreeya.patel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a6a09e97199d6600d31383055f9d43fbbcbe86f
commit: 3fe26121dc3a9bf64e18fe0075cd9a92c9cd1b1a spi: amd: Configure device speed
date:   1 year, 2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-r024-20230822 (https://download.01.org/0day-ci/archive/20231031/202310312254.YBm6LJtN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231031/202310312254.YBm6LJtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310312254.YBm6LJtN-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-amd.c:253 amd_set_spi_freq() error: buffer overflow 'amd_spi_freq' 9 <= 9 (assuming for loop doesn't break)

Old smatch warnings:
drivers/spi/spi-amd.c:256 amd_set_spi_freq() error: buffer overflow 'amd_spi_freq' 9 <= 9 (assuming for loop doesn't break)
drivers/spi/spi-amd.c:258 amd_set_spi_freq() error: buffer overflow 'amd_spi_freq' 9 <= 9 (assuming for loop doesn't break)
drivers/spi/spi-amd.c:267 amd_set_spi_freq() error: buffer overflow 'amd_spi_freq' 9 <= 9 (assuming for loop doesn't break)
drivers/spi/spi-amd.c:268 amd_set_spi_freq() error: buffer overflow 'amd_spi_freq' 9 <= 9 (assuming for loop doesn't break)

vim +253 drivers/spi/spi-amd.c

3fe26121dc3a9b Lucas Tanure 2022-08-25  238  
3fe26121dc3a9b Lucas Tanure 2022-08-25  239  static int amd_set_spi_freq(struct amd_spi *amd_spi, u32 speed_hz)
3fe26121dc3a9b Lucas Tanure 2022-08-25  240  {
3fe26121dc3a9b Lucas Tanure 2022-08-25  241  	unsigned int i, spd7_val, alt_spd;
3fe26121dc3a9b Lucas Tanure 2022-08-25  242  
3fe26121dc3a9b Lucas Tanure 2022-08-25  243  	if (speed_hz == amd_spi->speed_hz)
3fe26121dc3a9b Lucas Tanure 2022-08-25  244  		return 0;
3fe26121dc3a9b Lucas Tanure 2022-08-25  245  
3fe26121dc3a9b Lucas Tanure 2022-08-25  246  	if (speed_hz < AMD_SPI_MIN_HZ)
3fe26121dc3a9b Lucas Tanure 2022-08-25  247  		return -EINVAL;
3fe26121dc3a9b Lucas Tanure 2022-08-25  248  
3fe26121dc3a9b Lucas Tanure 2022-08-25  249  	for (i = 0; i < ARRAY_SIZE(amd_spi_freq); i++)
3fe26121dc3a9b Lucas Tanure 2022-08-25  250  		if (speed_hz >= amd_spi_freq[i].speed_hz)
3fe26121dc3a9b Lucas Tanure 2022-08-25  251  			break;
3fe26121dc3a9b Lucas Tanure 2022-08-25  252  
3fe26121dc3a9b Lucas Tanure 2022-08-25 @253  	if (speed_hz == amd_spi_freq[i].speed_hz)
3fe26121dc3a9b Lucas Tanure 2022-08-25  254  		return 0;
3fe26121dc3a9b Lucas Tanure 2022-08-25  255  
3fe26121dc3a9b Lucas Tanure 2022-08-25  256  	amd_spi->speed_hz = amd_spi_freq[i].speed_hz;
3fe26121dc3a9b Lucas Tanure 2022-08-25  257  
3fe26121dc3a9b Lucas Tanure 2022-08-25  258  	alt_spd = (amd_spi_freq[i].enable_val << AMD_SPI_ALT_SPD_SHIFT)
3fe26121dc3a9b Lucas Tanure 2022-08-25  259  		   & AMD_SPI_ALT_SPD_MASK;
3fe26121dc3a9b Lucas Tanure 2022-08-25  260  	amd_spi_setclear_reg32(amd_spi, AMD_SPI_ENA_REG, alt_spd,
3fe26121dc3a9b Lucas Tanure 2022-08-25  261  			       AMD_SPI_ALT_SPD_MASK);
3fe26121dc3a9b Lucas Tanure 2022-08-25  262  
3fe26121dc3a9b Lucas Tanure 2022-08-25  263  	if (amd_spi->speed_hz == AMD_SPI_MAX_HZ)
3fe26121dc3a9b Lucas Tanure 2022-08-25  264  		amd_spi_setclear_reg32(amd_spi, AMD_SPI_ENA_REG, 1,
3fe26121dc3a9b Lucas Tanure 2022-08-25  265  				       AMD_SPI_SPI100_MASK);
3fe26121dc3a9b Lucas Tanure 2022-08-25  266  
3fe26121dc3a9b Lucas Tanure 2022-08-25  267  	if (amd_spi_freq[i].spd7_val) {
3fe26121dc3a9b Lucas Tanure 2022-08-25  268  		spd7_val = (amd_spi_freq[i].spd7_val << AMD_SPI_SPD7_SHIFT)
3fe26121dc3a9b Lucas Tanure 2022-08-25  269  			    & AMD_SPI_SPD7_MASK;
3fe26121dc3a9b Lucas Tanure 2022-08-25  270  		amd_spi_setclear_reg32(amd_spi, AMD_SPI_SPEED_REG, spd7_val,
3fe26121dc3a9b Lucas Tanure 2022-08-25  271  				       AMD_SPI_SPD7_MASK);
3fe26121dc3a9b Lucas Tanure 2022-08-25  272  	}
3fe26121dc3a9b Lucas Tanure 2022-08-25  273  
3fe26121dc3a9b Lucas Tanure 2022-08-25  274  	return 0;
3fe26121dc3a9b Lucas Tanure 2022-08-25  275  }
3fe26121dc3a9b Lucas Tanure 2022-08-25  276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
