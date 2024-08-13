Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC414C74
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Aug 2024 00:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723510789; cv=none; b=D8EZ+BblLl+ijmrx/UVCZZlK1d9Ag+wRBJZKhbOchrr4GNI/+8Svyh55GYMtYPQTcbzyTtf+g6yXtbhHbrdQdrEZDU4Hn0OJ+0XXXlNN10G2Eq5kaZlW/c2d01ceXccFgh4TQEZQPpd8MoUDXy8/T5NbSUSHxws6Kgq728Os0t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723510789; c=relaxed/simple;
	bh=MLXF+mezb1khJ1bfzn+o0+kkuNKGaoyM5p6BFaJK92Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEgFRhO9GALjEjZTIROyQT2P9guJvqN4+9Wvn+9UtGRzt4MYnsXcoFoEhdvkDRiR/z1VLhjM3OaPBZgjvBa+uJVOvHp03c5z3dudFsgYuv9cY8nLjoMozeDx7/q8RGOFWDTFtRUkIQrxli73xbQonHF8QgxZdjqExwmIyRa25qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gi9OC38o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gi9OC38o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723510786; x=1755046786;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MLXF+mezb1khJ1bfzn+o0+kkuNKGaoyM5p6BFaJK92Y=;
  b=Gi9OC38o1bp04X2xLmVVfO4InC7epHIB4nb0fZ1HXSaP+x0yP62FaiY2
   VZtNIWQiaEnSls1dKCw7VJjY3Fx227GHNi3ezS/XQqvfDZHyk96pgJSEm
   n5Qkn/Gvh92dWVzoeLyUMJ1rZtdggjBgoex8zchbHhuDF7Q4a9N0UgDRl
   e74xbzIuU6XlOyvHY97GbEMqLA5FHx9go3ZbS2ioQhAygXnHQ0nXrpUGi
   qLBH5mZEbx2kpq7wSMFCw56si4nr2ejuX5Wfo6smo9Q9vZmv11xSG8xI7
   khAz1DVCXcSKH38tKJBxEqXcTHZioIwx2zmAFs2O1kCgHB9c/AyFnWKIS
   g==;
X-CSE-ConnectionGUID: hVUlQMD5QtuphzlE7GtN/g==
X-CSE-MsgGUID: ZFn30NpSRuisA0PCC+qkCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="47055415"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="47055415"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 17:59:46 -0700
X-CSE-ConnectionGUID: QUOdVtbnSE+eC21Uy45KzA==
X-CSE-MsgGUID: Asis8+hLT7+v+dEDBJz4qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="81723455"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2024 17:59:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdft0-000CHb-2k;
	Tue, 13 Aug 2024 00:59:42 +0000
Date: Tue, 13 Aug 2024 08:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 5/7] drivers: i2c: use i2c frequency table
Message-ID: <202408130818.FgDP5uNm-lkp@intel.com>
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
In-Reply-To: <20240807100244.16872-6-kfting@nuvoton.com>
References: <20240807100244.16872-6-kfting@nuvoton.com>
TO: warp5tw@gmail.com
TO: tali.perry@nuvoton.com
TO: Avi.Fishman@nuvoton.com
TO: tomer.maimon@nuvoton.com
TO: avifishman70@gmail.com
TO: tmaimon77@gmail.com
TO: tali.perry1@gmail.com
TO: venture@google.com
TO: yuenn@google.com
TO: benjaminfair@google.com
TO: andi.shyti@kernel.org
TO: wsa+renesas@sang-engineering.com
TO: rand.sec96@gmail.com
TO: kwliu@nuvoton.com
TO: jjliu0@nuvoton.com
TO: kfting@nuvoton.com
TO: warp5tw@gmail.com
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11-rc3 next-20240812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/warp5tw-gmail-com/i2c-npcm-correct-the-read-write-operation-procedure/20240807-182210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240807100244.16872-6-kfting%40nuvoton.com
patch subject: [PATCH v1 5/7] drivers: i2c: use i2c frequency table
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-r073-20240812 (https://download.01.org/0day-ci/archive/20240813/202408130818.FgDP5uNm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/

New smatch warnings:
drivers/i2c/busses/i2c-npcm7xx.c:1956 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 21 <= 21 (assuming for loop doesn't break)
drivers/i2c/busses/i2c-npcm7xx.c:1973 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 17 <= 21

Old smatch warnings:
drivers/i2c/busses/i2c-npcm7xx.c:752 npcm_i2c_slave_enable() error: buffer overflow 'npcm_i2caddr' 2 <= 9
drivers/i2c/busses/i2c-npcm7xx.c:1960 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 21 <= 21 (assuming for loop doesn't break)
drivers/i2c/busses/i2c-npcm7xx.c:1974 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 17 <= 21
drivers/i2c/busses/i2c-npcm7xx.c:1976 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 17 <= 21
drivers/i2c/busses/i2c-npcm7xx.c:1979 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 21 <= 21 (assuming for loop doesn't break)

vim +1956 drivers/i2c/busses/i2c-npcm7xx.c

56a1485b102ed1 Tali Perry          2020-05-27  1909  
56a1485b102ed1 Tali Perry          2020-05-27  1910  /*
56a1485b102ed1 Tali Perry          2020-05-27  1911   * npcm_i2c_init_clk: init HW timing parameters.
0c47dd7d09bb5d Jonathan Neuschäfer 2022-01-29  1912   * NPCM7XX i2c module timing parameters are dependent on module core clk (APB)
56a1485b102ed1 Tali Perry          2020-05-27  1913   * and bus frequency.
0c47dd7d09bb5d Jonathan Neuschäfer 2022-01-29  1914   * 100kHz bus requires tSCL = 4 * SCLFRQ * tCLK. LT and HT are symmetric.
0c47dd7d09bb5d Jonathan Neuschäfer 2022-01-29  1915   * 400kHz bus requires asymmetric HT and LT. A different equation is recommended
56a1485b102ed1 Tali Perry          2020-05-27  1916   * by the HW designer, given core clock range (equations in comments below).
56a1485b102ed1 Tali Perry          2020-05-27  1917   *
56a1485b102ed1 Tali Perry          2020-05-27  1918   */
56a1485b102ed1 Tali Perry          2020-05-27  1919  static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
56a1485b102ed1 Tali Perry          2020-05-27  1920  {
a946fe9698f261 Tyrone Ting         2024-08-07  1921  	struct  SMB_TIMING_T *smb_timing;
a946fe9698f261 Tyrone Ting         2024-08-07  1922  	u8   scl_table_cnt = 0, table_size = 0;
a946fe9698f261 Tyrone Ting         2024-08-07  1923  
56a1485b102ed1 Tali Perry          2020-05-27  1924  	u8   fast_mode = 0;
56a1485b102ed1 Tali Perry          2020-05-27  1925  	u32  src_clk_khz;
56a1485b102ed1 Tali Perry          2020-05-27  1926  	u32  bus_freq_khz;
56a1485b102ed1 Tali Perry          2020-05-27  1927  
56a1485b102ed1 Tali Perry          2020-05-27  1928  	src_clk_khz = bus->apb_clk / 1000;
56a1485b102ed1 Tali Perry          2020-05-27  1929  	bus_freq_khz = bus_freq_hz / 1000;
56a1485b102ed1 Tali Perry          2020-05-27  1930  	bus->bus_freq = bus_freq_hz;
56a1485b102ed1 Tali Perry          2020-05-27  1931  
a946fe9698f261 Tyrone Ting         2024-08-07  1932  	switch (bus_freq_hz) {
a946fe9698f261 Tyrone Ting         2024-08-07  1933  	case I2C_MAX_STANDARD_MODE_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1934  		smb_timing = SMB_TIMING_100KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1935  		table_size = ARRAY_SIZE(SMB_TIMING_100KHZ);
a946fe9698f261 Tyrone Ting         2024-08-07  1936  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1937  	case I2C_MAX_FAST_MODE_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1938  		smb_timing = SMB_TIMING_400KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1939  		table_size = ARRAY_SIZE(SMB_TIMING_400KHZ);
56a1485b102ed1 Tali Perry          2020-05-27  1940  		fast_mode = I2CCTL3_400K_MODE;
a946fe9698f261 Tyrone Ting         2024-08-07  1941  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1942  	case I2C_MAX_FAST_MODE_PLUS_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1943  		smb_timing = SMB_TIMING_1000KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1944  		table_size = ARRAY_SIZE(SMB_TIMING_1000KHZ);
56a1485b102ed1 Tali Perry          2020-05-27  1945  		fast_mode = I2CCTL3_400K_MODE;
a946fe9698f261 Tyrone Ting         2024-08-07  1946  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1947  	default:
56a1485b102ed1 Tali Perry          2020-05-27  1948  		return -EINVAL;
56a1485b102ed1 Tali Perry          2020-05-27  1949  	}
56a1485b102ed1 Tali Perry          2020-05-27  1950  
a946fe9698f261 Tyrone Ting         2024-08-07  1951  	for (scl_table_cnt = 0 ; scl_table_cnt < table_size ; scl_table_cnt++)
a946fe9698f261 Tyrone Ting         2024-08-07  1952  		if (bus->apb_clk >= smb_timing[scl_table_cnt].core_clk)
a946fe9698f261 Tyrone Ting         2024-08-07  1953  			break;
a946fe9698f261 Tyrone Ting         2024-08-07  1954  
56a1485b102ed1 Tali Perry          2020-05-27  1955  	/* write sclfrq value. bits [6:0] are in I2CCTL2 reg */
a946fe9698f261 Tyrone Ting         2024-08-07 @1956  	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, smb_timing[scl_table_cnt].sclfrq & 0x7F),
56a1485b102ed1 Tali Perry          2020-05-27  1957  		 bus->reg + NPCM_I2CCTL2);
56a1485b102ed1 Tali Perry          2020-05-27  1958  
56a1485b102ed1 Tali Perry          2020-05-27  1959  	/* bits [8:7] are in I2CCTL3 reg */
a946fe9698f261 Tyrone Ting         2024-08-07  1960  	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7)
a946fe9698f261 Tyrone Ting         2024-08-07  1961  		 & 0x3),
56a1485b102ed1 Tali Perry          2020-05-27  1962  		 bus->reg + NPCM_I2CCTL3);
56a1485b102ed1 Tali Perry          2020-05-27  1963  
56a1485b102ed1 Tali Perry          2020-05-27  1964  	/* Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5 */
56a1485b102ed1 Tali Perry          2020-05-27  1965  	npcm_i2c_select_bank(bus, I2C_BANK_0);
56a1485b102ed1 Tali Perry          2020-05-27  1966  
56a1485b102ed1 Tali Perry          2020-05-27  1967  	if (bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ) {
56a1485b102ed1 Tali Perry          2020-05-27  1968  		/*
56a1485b102ed1 Tali Perry          2020-05-27  1969  		 * Set SCL Low/High Time:
56a1485b102ed1 Tali Perry          2020-05-27  1970  		 * k1 = 2 * SCLLT7-0 -> Low Time  = k1 / 2
56a1485b102ed1 Tali Perry          2020-05-27  1971  		 * k2 = 2 * SCLLT7-0 -> High Time = k2 / 2
56a1485b102ed1 Tali Perry          2020-05-27  1972  		 */
a946fe9698f261 Tyrone Ting         2024-08-07 @1973  		iowrite8(smb_timing[scl_table_cnt].scllt, bus->reg + NPCM_I2CSCLLT);
a946fe9698f261 Tyrone Ting         2024-08-07  1974  		iowrite8(smb_timing[scl_table_cnt].sclht, bus->reg + NPCM_I2CSCLHT);
56a1485b102ed1 Tali Perry          2020-05-27  1975  
a946fe9698f261 Tyrone Ting         2024-08-07  1976  		iowrite8(smb_timing[scl_table_cnt].dbcnt, bus->reg + NPCM_I2CCTL5);
56a1485b102ed1 Tali Perry          2020-05-27  1977  	}
56a1485b102ed1 Tali Perry          2020-05-27  1978  
a946fe9698f261 Tyrone Ting         2024-08-07  1979  	iowrite8(smb_timing[scl_table_cnt].hldt, bus->reg + NPCM_I2CCTL4);
56a1485b102ed1 Tali Perry          2020-05-27  1980  
56a1485b102ed1 Tali Perry          2020-05-27  1981  	/* Return to Bank 1, and stay there by default: */
56a1485b102ed1 Tali Perry          2020-05-27  1982  	npcm_i2c_select_bank(bus, I2C_BANK_1);
56a1485b102ed1 Tali Perry          2020-05-27  1983  
56a1485b102ed1 Tali Perry          2020-05-27  1984  	return 0;
56a1485b102ed1 Tali Perry          2020-05-27  1985  }
56a1485b102ed1 Tali Perry          2020-05-27  1986  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
