Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE318FDBA
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jan 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736609790; cv=none; b=pR9rrsXUxCWqUEYVSazLKOY/Tyj2Ki3vU6/lUkjwAvRQRji4JyqHdEGagjAT4MEvqokmZxDx632ZogRZGgZq6J8eZG+iG756ush7ItAie6gganigpO2YqrUX7Habvy8S3QVHW4YeoXnSUZAxA58UNpaEZ7Dw+jF8+J/m8Hgx6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736609790; c=relaxed/simple;
	bh=ORmpkvhLlHdU7DV3XzPlqDP+Khm3GOuNTJ1H/n16nfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eMN5Z6bR/qhhop60Gx7mzaeAt2DnB3xJQzh5NzQS3sOfdZ0+mFLD30ySeBpdSguVQQsEeT7EPGHYDxO3/7p1pZHZv/CLB+oF02keSwiHAFlpLmt4urJejtZbTNRD/ow7sUb8R7uTn15iKxm6qO7r/2PzJ+elLDAkEoxsBOSSiQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CO6hIeR+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CO6hIeR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736609787; x=1768145787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORmpkvhLlHdU7DV3XzPlqDP+Khm3GOuNTJ1H/n16nfU=;
  b=CO6hIeR+cosyJgR5EsxQlHxB+4eV5Las8e0VZZYg7z9or06tq4pQi71p
   nV+SdLy9U8PTBt+4N1WeenTdsGbN618WMjf+OJ1z3pkOunJVC2UAkaHzS
   dZA9x7Aw5g7FrwNa730NCEBkQwjxgGElDmc6DHk9XH/ZLp6UVBVAKvPKq
   JQGolHn/oLynpPbrrWLriror6gFmKKaIiGkrOcH7+e16ApAC9+WcZNF2s
   90fCt6/5Zmp7jykhX5naiNmK4p75xQZJFZcaA3oSSCB1cI1qNNc/kjMbt
   ouGRjpcisgRjOODlMKqRSOlpHlIUoiLlQ3u1brwxFUb6AWX+eD9eUGgTQ
   g==;
X-CSE-ConnectionGUID: 5GlzOG3sSxyWxa4m4JOKWw==
X-CSE-MsgGUID: hFs7vThwRzeGQF/0Fe63mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36995803"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36995803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 07:36:27 -0800
X-CSE-ConnectionGUID: oSR9jD89SBO17oveUmvNxw==
X-CSE-MsgGUID: SEoOa/6eRUufQGuStMsvDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108062610"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jan 2025 07:36:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWdXD-000Kq3-2Y;
	Sat, 11 Jan 2025 15:36:23 +0000
Date: Sat, 11 Jan 2025 23:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xilinx-xlnx:lkp_test 419/504] drivers/mtd/spi-nor/core.c:3434
 spi_nor_quad_enable() error: uninitialized symbol 'err'.
Message-ID: <202501112307.AqokvCX3-lkp@intel.com>
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
CC: git@amd.com
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 4797f25bec4d739b8b2153c950be2a9831c1d54a [419/504] spi: spi-zynqmp-gqspi: Increase timeout interval during data transfer
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112307.AqokvCX3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501112307.AqokvCX3-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/core.c:3434 spi_nor_quad_enable() error: uninitialized symbol 'err'.

vim +/err +3434 drivers/mtd/spi-nor/core.c

a33c89db4c3ba8 drivers/mtd/spi-nor/core.c    Pratyush Yadav       2020-10-05  3386  
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3387  /**
1afc0c89f6a155 drivers/mtd/spi-nor/core.c    Yicong Yang          2020-09-04  3388   * spi_nor_quad_enable() - enable Quad I/O if needed.
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3389   * @nor:                pointer to a 'struct spi_nor'
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3390   *
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3391   * Return: 0 on success, -errno otherwise.
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3392   */
1afc0c89f6a155 drivers/mtd/spi-nor/core.c    Yicong Yang          2020-09-04  3393  static int spi_nor_quad_enable(struct spi_nor *nor)
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3394  {
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3395  	struct spi_nor_flash_parameter *params;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3396  	int err, idx;
e0a3141aff2ef7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3397  
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3398  	if (nor->flags & SNOR_F_HAS_PARALLEL) {
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3399  		params = spi_nor_get_params(nor, 0);
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3400  		if (!params->quad_enable)
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3401  			return 0;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3402  
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3403  		if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3404  		      spi_nor_get_protocol_width(nor->write_proto) == 4))
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3405  			return 0;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3406  		/*
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3407  		 * In parallel mode both chip selects i.e., CS0 &
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3408  		 * CS1 need to be asserted simulatneously.
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3409  		 */
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3410  		nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3411  		err = params->quad_enable(nor);
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3412  		if (err)
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3413  			return err;
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3414  	} else {
4797f25bec4d73 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3415  		for (idx = 0; idx < nor->num_flash; idx++) {
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3416  			params = spi_nor_get_params(nor, idx);
e0a3141aff2ef7 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3417  			if (!params->quad_enable)
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3418  				return 0;
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3419  
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3420  			if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3421  			      spi_nor_get_protocol_width(nor->write_proto) == 4))
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-22  3422  				return 0;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3423  			/*
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3424  			 * Set the appropriate CS index before
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3425  			 * issuing the command.
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3426  			 */
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3427  			nor->spimem->spi->cs_index_mask = 1 << idx;
42f5994724bcbc drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-23  3428  
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3429  			err = params->quad_enable(nor);
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3430  			if (err)
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3431  				return err;
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3432  		}
4d7a2752a7f124 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05  3433  	}
1c9ab5adf5dea9 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2024-12-05 @3434  	return err;
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-22  3435  }
46dde01f6bab35 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu           2017-08-22  3436  

:::::: The code at line 3434 was first introduced by commit
:::::: 1c9ab5adf5dea9cd33d87918b9ed44df1657a31e mtd: spi-nor: Add stacked memories support in spi-nor

:::::: TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
