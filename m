Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CD81487EA
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jul 2024 21:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719954915; cv=none; b=jwbXB6kwgS3RCfcw+Nf2Em5NwDG7g2O4WQmV4QmjSKvFxHzHiSdKZqnjUzj5YcikhElng1tNcQikyODPj4q3WnAKQTy45exNWSOv6PQuVVfOFvF3FE6A3oMU1r2lGDQ+LWLF/b6GwLa4X8VmbVsR+yz3MePjJYgmnRwy9QvbWTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719954915; c=relaxed/simple;
	bh=u3xykxCtRPkWIImy2y2y+ezrneUSKmiWSTqmJmRfRPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGB8BXVcnOjJLVM1EuET1zxzbwWP5wLiXeh3EXobblKWA2d1ewUCjXqmwaRxPmxsq87ZehcY8UHjYJTG/aOOxkaStT5EW8lD0mU1k6NtJDcrsX+mKYC0IUD78XCARRCSSTOOpQlUeNHtxAooKHV7JQYLsTGp3ppNNdIRuy9mq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNO2yxSB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNO2yxSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719954914; x=1751490914;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u3xykxCtRPkWIImy2y2y+ezrneUSKmiWSTqmJmRfRPA=;
  b=RNO2yxSBTQLRUYPKBlMt2PGl/A46DWTgZVvyF77g2HCPjr1A1oo/HEsW
   h8TsnycZvvmCpOU9hfU90KtVzNjhQLiOghcH4hVOBvWupDefrmLoHTQEH
   X2jLXUVzPRzQ665eZPuk8K9fst3nhfjI0L9O62UP2elZtSOSFFFw1NjCK
   QDinpMs352/E1aM7+tzB/X62dBGGRRX/OTRYEEPt1179zCl18OdtyHoDC
   p85iu+Or8hPz9Fvj0Wik5Iapv4qaENY/M4oxRXGsf9Gyz742wydZco5nA
   l3hpiJhq/bU21FfLkJbmDOq+VWLyBWOn2CGCIDfEoTclhfP+4+9aadcB0
   w==;
X-CSE-ConnectionGUID: oCqlCzFXQeeGQE+JOl4ZfA==
X-CSE-MsgGUID: Nk5vIX27QWyO0ivWIbpkwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17031671"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17031671"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 14:15:12 -0700
X-CSE-ConnectionGUID: 92EogMz+QbmEwTQDSLxLUQ==
X-CSE-MsgGUID: FHVqi+OSR567nEvyljSq5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="45945450"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2024 14:15:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOkqD-000Ogs-0g;
	Tue, 02 Jul 2024 21:15:09 +0000
Date: Wed, 3 Jul 2024 05:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/3] fpga: Add Efinix Trion & Titanium serial SPI
 programming driver
Message-ID: <202407030525.VHF3He6K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240628152348.61133-2-iansdannapel@gmail.com>
References: <20240628152348.61133-2-iansdannapel@gmail.com>
TO: iansdannapel@gmail.com
TO: Moritz Fischer <mdf@kernel.org>
TO: Wu Hao <hao.wu@intel.com>
TO: Xu Yilun <yilun.xu@intel.com>
TO: Tom Rix <trix@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko.stuebner@cherry.de>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Sebastian Reichel <sre@kernel.org>
TO: Chris Morgan <macromorgan@hotmail.com>
TO: Michael Riesch <michael.riesch@wolfvision.net>
TO: "Rafał Miłecki" <rafal@milecki.pl>
TO: Andre Przywara <andre.przywara@arm.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: linux-fpga@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Ian Dannapel <iansdannapel@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.10-rc6 next-20240702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/iansdannapel-gmail-com/fpga-Add-Efinix-Trion-Titanium-serial-SPI-programming-driver/20240630-044745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240628152348.61133-2-iansdannapel%40gmail.com
patch subject: [PATCH v2 1/3] fpga: Add Efinix Trion & Titanium serial SPI programming driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r081-20240701 (https://download.01.org/0day-ci/archive/20240703/202407030525.VHF3He6K-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407030525.VHF3He6K-lkp@intel.com/

smatch warnings:
drivers/fpga/efinix-trion-spi-passive.c:174 efinix_spi_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +174 drivers/fpga/efinix-trion-spi-passive.c

4c272ecc14b70f Ian Dannapel 2024-06-28  151  
4c272ecc14b70f Ian Dannapel 2024-06-28  152  static int efinix_spi_probe(struct spi_device *spi)
4c272ecc14b70f Ian Dannapel 2024-06-28  153  {
4c272ecc14b70f Ian Dannapel 2024-06-28  154  	struct efinix_spi_conf *conf;
4c272ecc14b70f Ian Dannapel 2024-06-28  155  	struct fpga_manager *mgr;
4c272ecc14b70f Ian Dannapel 2024-06-28  156  
4c272ecc14b70f Ian Dannapel 2024-06-28  157  	conf = devm_kzalloc(&spi->dev, sizeof(*conf), GFP_KERNEL);
4c272ecc14b70f Ian Dannapel 2024-06-28  158  	if (!conf)
4c272ecc14b70f Ian Dannapel 2024-06-28  159  		return -ENOMEM;
4c272ecc14b70f Ian Dannapel 2024-06-28  160  
4c272ecc14b70f Ian Dannapel 2024-06-28  161  	conf->spi = spi;
4c272ecc14b70f Ian Dannapel 2024-06-28  162  
4c272ecc14b70f Ian Dannapel 2024-06-28  163  	conf->creset = devm_gpiod_get(&spi->dev, "creset", GPIOD_OUT_HIGH);
4c272ecc14b70f Ian Dannapel 2024-06-28  164  	if (IS_ERR(conf->creset))
4c272ecc14b70f Ian Dannapel 2024-06-28  165  		return dev_err_probe(&spi->dev, PTR_ERR(conf->creset),
4c272ecc14b70f Ian Dannapel 2024-06-28  166  				"Failed to get RESET gpio\n");
4c272ecc14b70f Ian Dannapel 2024-06-28  167  
4c272ecc14b70f Ian Dannapel 2024-06-28  168  	conf->cs = devm_gpiod_get(&spi->dev, "cs", GPIOD_OUT_HIGH);
4c272ecc14b70f Ian Dannapel 2024-06-28  169  	if (IS_ERR(conf->cs))
4c272ecc14b70f Ian Dannapel 2024-06-28  170  		return dev_err_probe(&spi->dev, PTR_ERR(conf->cs),
4c272ecc14b70f Ian Dannapel 2024-06-28  171  				"Failed to get CHIP_SELECT gpio\n");
4c272ecc14b70f Ian Dannapel 2024-06-28  172  
4c272ecc14b70f Ian Dannapel 2024-06-28  173  	if (!(spi->mode & SPI_CPHA) || !(spi->mode & SPI_CPOL))
4c272ecc14b70f Ian Dannapel 2024-06-28 @174  		return dev_err_probe(&spi->dev, PTR_ERR(conf->cs),
4c272ecc14b70f Ian Dannapel 2024-06-28  175  				"Unsupported SPI mode, set CPHA and CPOL\n");
4c272ecc14b70f Ian Dannapel 2024-06-28  176  
4c272ecc14b70f Ian Dannapel 2024-06-28  177  	conf->cdone = devm_gpiod_get_optional(&spi->dev, "cdone", GPIOD_IN);
4c272ecc14b70f Ian Dannapel 2024-06-28  178  	if (IS_ERR(conf->cdone))
4c272ecc14b70f Ian Dannapel 2024-06-28  179  		return dev_err_probe(&spi->dev, PTR_ERR(conf->cdone),
4c272ecc14b70f Ian Dannapel 2024-06-28  180  				"Failed to get CDONE gpio\n");
4c272ecc14b70f Ian Dannapel 2024-06-28  181  
4c272ecc14b70f Ian Dannapel 2024-06-28  182  	mgr = devm_fpga_mgr_register(&spi->dev,
4c272ecc14b70f Ian Dannapel 2024-06-28  183  				"Efinix SPI Passive Programming FPGA Manager",
4c272ecc14b70f Ian Dannapel 2024-06-28  184  					&efinix_spi_ops, conf);
4c272ecc14b70f Ian Dannapel 2024-06-28  185  
4c272ecc14b70f Ian Dannapel 2024-06-28  186  	return PTR_ERR_OR_ZERO(mgr);
4c272ecc14b70f Ian Dannapel 2024-06-28  187  }
4c272ecc14b70f Ian Dannapel 2024-06-28  188  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
