Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DDD23CEF8
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752599184; cv=none; b=rDlAWfitD1DIu4FXfek4ssT2xjXDBG2NwLSJiLg9l6+ICPWHMsxHE+t2lzZWoA9S+8A+o2AAHFaR1VpES/Ss8B1+SKq3nBg5mX4L0kHHEVWbjvGRyqeVCyPf0vHp56sULw33rF1VbjvZ+4jJ2FCqrINTmxnP4u6MwL/oDn21kqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752599184; c=relaxed/simple;
	bh=dmprwvIrwMR10YyeeVF8jY4ZjJwz0RO3H2+OVCbLtMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUZk2F4nmigP/yGL6gMGOSne7x3QGzyAnkF6pnjK7eZi6+LGoazlMiJqilfDle63yxYoT0ataEIzOoQu7vfmfC1zzHXZPha3hYtDpuX3CPWR43udI7KMs9Z6jDNuora2Ns8T5+fkNyKMM52Ruldj+7DzUU5GWj1sxOhQF71e32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/6SYyrt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/6SYyrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752599182; x=1784135182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmprwvIrwMR10YyeeVF8jY4ZjJwz0RO3H2+OVCbLtMU=;
  b=m/6SYyrtQwd6TpP2yycP2Eskq/Y6e0m3vf5k5H/sKDMdn9r3X+tFKbpn
   WqY2O+cAOnCbDVw0k/bB13Y+3641xus06zUbQMOCSaS1TrtPxXV1+8cs+
   J/pyRpN4kryFwqY8smDBDPBhPlUIwsIRzANX56XyqXgyhkjq5AfOUyVZh
   MXiOIJuPWLKDKzp+Jle+TN4qOppoG1VUUe58l87hqrOpW/PVabECXN0wT
   js23r+Fy4bfV8Cx8jo5xQvImpZj1JkNMAsvFYurbFvmQP359E8qW1FiSn
   +1No2C3Z48LhFkVHo8STiLAYIpke6GWgax8kjrk1K/Tka2aRFY4SuiTjh
   A==;
X-CSE-ConnectionGUID: FhbXyOjpShaARdbiv11Wbw==
X-CSE-MsgGUID: cWaY2kuLSx62zsalXrGrzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54919233"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54919233"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 10:06:20 -0700
X-CSE-ConnectionGUID: nQtRQdyeTh+khW7ZqD4bMg==
X-CSE-MsgGUID: NEWsI6h/RQWwtYrJKuSXUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157368473"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jul 2025 10:06:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubj6f-000BN1-14;
	Tue, 15 Jul 2025 17:06:17 +0000
Date: Wed, 16 Jul 2025 01:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
Message-ID: <202507160058.Kvt70tJp-lkp@intel.com>
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
In-Reply-To: <d2bba90684f50a66b81ce4d7da3d405783209f95.1752539969.git.khairul.anuar.romli@altera.com>
References: <d2bba90684f50a66b81ce4d7da3d405783209f95.1752539969.git.khairul.anuar.romli@altera.com>
TO: khairul.anuar.romli@altera.com
TO: Tudor Ambarus <tudor.ambarus@linaro.org>
TO: Pratyush Yadav <pratyush@kernel.org>
TO: Michael Walle <mwalle@kernel.org>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>
TO: open list <linux-kernel@vger.kernel.org>
TO: Matthew Gerlach <matthew.gerlach@altera.com>
TO: Khairul Anuar Romli <khairul.anuar.romli@altera.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/spi-nor/next]
[also build test WARNING on linus/master v6.16-rc6 next-20250715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/khairul-anuar-romli-altera-com/mtd-spi-nor-core-Prevent-oops-during-driver-removal-with-active-read-or-write-operations/20250715-094504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/d2bba90684f50a66b81ce4d7da3d405783209f95.1752539969.git.khairul.anuar.romli%40altera.com
patch subject: [PATCH v2 1/1] mtd: spi-nor: core: Prevent oops during driver removal with active read or write operations
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: openrisc-randconfig-r071-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160058.Kvt70tJp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507160058.Kvt70tJp-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/core.c:3213 spi_nor_get_device() error: we previously assumed 'dev' could be null (see line 3213)
drivers/mtd/spi-nor/core.c:3213 spi_nor_get_device() error: we previously assumed 'dev->driver' could be null (see line 3213)

vim +/dev +3213 drivers/mtd/spi-nor/core.c

d6084fc83c8249 drivers/mtd/spi-nor/spi-nor.c Kamal Dasu 2017-08-22  3201  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3202  static int spi_nor_get_device(struct mtd_info *mtd)
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3203  {
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3204  	struct mtd_info *master = mtd_get_master(mtd);
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3205  	struct spi_nor *nor = mtd_to_spi_nor(master);
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3206  	struct device *dev;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3207  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3208  	if (nor->spimem)
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3209  		dev = nor->spimem->spi->controller->dev.parent;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3210  	else
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3211  		dev = nor->dev;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3212  
d51eaff2c57a38 drivers/mtd/spi-nor/core.c    kromli     2025-07-15 @3213  	if (!dev && !dev->driver && !dev->driver->owner)
d51eaff2c57a38 drivers/mtd/spi-nor/core.c    kromli     2025-07-15  3214  		return -EINVAL;
d51eaff2c57a38 drivers/mtd/spi-nor/core.c    kromli     2025-07-15  3215  	
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3216  	if (!try_module_get(dev->driver->owner))
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3217  		return -ENODEV;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3218  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3219  	return 0;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3220  }
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
