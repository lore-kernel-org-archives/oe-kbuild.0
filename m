Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743C24A0A
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Jul 2025 02:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752200249; cv=none; b=qPefOJgf0eDEUkS98DDwDYVNfikvVnLb/D+Q8sTwgGJbXKYg5PrgIDaT5b0ExzVlCbwQjNpjmmQ7wDBm3dM4lEe6lGTK4Q2a45czSf/hE6LvHiHmj/bQZdQY6IRp4QJGPWXxdZ+BnlAU3d+wLHhTdTN2yQ1FkCUa0m/iTqsfriU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752200249; c=relaxed/simple;
	bh=nBE10duLN9j4r3/Td2CpOh+scuPXsRQTbSIZuYi7i6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qBuAEtEcAe9s4xwCAFy2Q2EvHkHe5vemeHUZ31NFG5d/bH6miO0PxrD4Zgmw+BZHqHx8nDraI21E3gfCzIhlXhfbZaFic8TXpafqkKwUdGz8ueecXG161i0QNOmFuMypytgkj49DH88Bi81An617eSDVOG8aeQkfD5Q+Eh3wHcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrNbLGA+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrNbLGA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752200247; x=1783736247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nBE10duLN9j4r3/Td2CpOh+scuPXsRQTbSIZuYi7i6k=;
  b=nrNbLGA+NV5MX86SjeoE6evxLedzx1BMUTgKaVTTp+F1B5vzLwigmFmF
   yFntoa0ycFZUihsZY2/JOLLTWaIlAkH5tIYq7dwyu1jdqs7xy6rxucwyu
   szjXKEkrtHZzAyOikmQCqY4JcM/aZC69W9jiX/6RxXHMBsZQPJOM5G5ex
   64PzhBFN5HdMoJHywxwIL3xW/9Ho6dytEwUKlLADXdmeEoivXOXhAqkNg
   LjSU2+SSNZdlGaZvGVMomeq4FHEEbsLgl4OXdURDk+MH3rrfchwSclbVd
   PB3dctwQyz8V5X8edTHYt7SxphPNV/nZifmscK47aZi15OsN0dURgOz8z
   g==;
X-CSE-ConnectionGUID: uMna7xR3RiqRNs18+WpJVg==
X-CSE-MsgGUID: yoF16pkWTLCOUmWThdxcnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54369169"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="54369169"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 19:17:27 -0700
X-CSE-ConnectionGUID: wV8C2JWaT9Cwg/a1sttqZw==
X-CSE-MsgGUID: OEFztn0gQYyXCR9AUBrTOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="161814300"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jul 2025 19:17:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua3KF-0005k7-1G;
	Fri, 11 Jul 2025 02:17:23 +0000
Date: Fri, 11 Jul 2025 10:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
Message-ID: <202507110922.btkgvYrn-lkp@intel.com>
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
In-Reply-To: <e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli@altera.com>
References: <e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli@altera.com>
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
[also build test WARNING on linus/master v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/khairul-anuar-romli-altera-com/mtd-spi-nor-core-Prevent-oops-during-driver-removal-with-active-read-or-write-operations/20250709-103107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli%40altera.com
patch subject: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver removal with active read or write operations
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110922.btkgvYrn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507110922.btkgvYrn-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/core.c:3216 spi_nor_get_device() warn: variable dereferenced before check 'dev' (see line 3213)
drivers/mtd/spi-nor/core.c:3216 spi_nor_get_device() warn: variable dereferenced before check 'dev->driver' (see line 3213)

vim +/dev +3216 drivers/mtd/spi-nor/core.c

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
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01 @3213  	if (!try_module_get(dev->driver->owner))
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3214  		return -ENODEV;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3215  
240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09 @3216  	if (!dev && !dev->driver && !dev->driver->owner)
240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09  3217  		return -EINVAL;
240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09  3218  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3219  	return 0;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3220  }
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
