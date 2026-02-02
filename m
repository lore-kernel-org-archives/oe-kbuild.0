Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0046238735F
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770052638; cv=none; b=AjCPueVg9T0RJ4+XGhR+pwEWEQnPtwS3YaFIMZsMmY8X9zHNLjK4DGtq6PWksRcAs+SKedQWAcsjB+QvAgeIOBeZ4tUSUs4cQLtkQWa5hDiDMMgb453Rau9KV0iGB9MDYzl+n0s1wRLOVJtIoI8kgSc5zYr5+UBjcjMuBQWqTNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770052638; c=relaxed/simple;
	bh=pZC89EmTwTi7pXtoyaQ2clT767SQmAIe0vcVDLuVgr0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r805niTiPGoysOLfADpIeUmdkwLPGD5tUdzv0+ETotv5MytkBzofUfNl9U27SYkhKrH1FoObSLt+wCkictbs50lNWdEpzwmeaPZhvP8BLPcEySXIZAoIo5g+7QGRzAhexBEeCPRUut51jTZF+DiNOQMSUzyH97GUk55GTtoay8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7EPwX0H; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7EPwX0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770052637; x=1801588637;
  h=date:from:to:cc:subject:message-id;
  bh=pZC89EmTwTi7pXtoyaQ2clT767SQmAIe0vcVDLuVgr0=;
  b=a7EPwX0HtWax79GmmSo2tqCF0g3NY9L30BifYbsJp5n+55fcMboV3V5P
   kGDSqTOOGhHgIidN6l9UAGy4r52CFjl1nZbwn6dYGEHUvDw5O6mPbLYLC
   P+Zx8YFiGUExNd5Ov7wtW3sLzHuxsxWPHTmCg4tQKZ8/LlMquHO2CnN/v
   fle6thgvlT36bvfu6WC0UNbTU33GpQuoJlmz8+s9IK3ZACn5HqyADHo89
   GtfaICYJRX+z1anE3dENqvqWs7xpBsmPjX9kJN9t0Ott1jbYW28WVt9H5
   m0l6j2dpGfpVEzMYkwTv+t+f02Dfj8+b3J4FXYWGCXrEO3SuhM9T6BNhC
   w==;
X-CSE-ConnectionGUID: GESt5hD/Q6SfYYwtr/Af2A==
X-CSE-MsgGUID: i9ZH8komRgq8BpWxnAxT7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="96669354"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="96669354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 09:17:13 -0800
X-CSE-ConnectionGUID: J4r57S6WTNiKaDzKLhhJaA==
X-CSE-MsgGUID: Nl4JanJSS12qy+FB9eys1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209389435"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Feb 2026 09:17:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmxXy-00000000fnc-0Wg2;
	Mon, 02 Feb 2026 17:17:10 +0000
Date: Tue, 03 Feb 2026 01:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/mtd/spi-nor/core.c:137:14: sparse: sparse: unsigned value that used
 to be signed checked against zero?
Message-ID: <202602030118.D5M5qsfX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/mtd/spi-nor/core.c:137:14: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ido Schimmel <idosch@nvidia.com>
CC: Petr Machata <petrm@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   495b51e8206a71e8493d1493110959a6c67042eb
commit: 495b51e8206a71e8493d1493110959a6c67042eb [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: m68k-randconfig-r132-20260202 (https://download.01.org/0day-ci/archive/20260203/202602030118.D5M5qsfX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030118.D5M5qsfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602030118.D5M5qsfX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/core.c:137:14: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/mtd/spi-nor/core.c:137:14: sparse: signed value source

vim +137 drivers/mtd/spi-nor/core.c

0e30f47232ab57 drivers/mtd/spi-nor/core.c    Pratyush Yadav  2020-10-05  122  
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  123  /**
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  124   * spi_nor_spimem_bounce() - check if a bounce buffer is needed for the data
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  125   *                           transfer
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  126   * @nor:        pointer to 'struct spi_nor'
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  127   * @op:         pointer to 'struct spi_mem_op' template for transfer
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  128   *
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  129   * If we have to use the bounce buffer, the data field in @op will be updated.
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  130   *
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  131   * Return: true if the bounce buffer is needed, false if not
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  132   */
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  133  static bool spi_nor_spimem_bounce(struct spi_nor *nor, struct spi_mem_op *op)
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  134  {
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  135  	/* op->data.buf.in occupies the same memory as op->data.buf.out */
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  136  	if (object_is_on_stack(op->data.buf.in) ||
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19 @137  	    !virt_addr_valid(op->data.buf.in)) {
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  138  		if (op->data.nbytes > nor->bouncebuf_size)
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  139  			op->data.nbytes = nor->bouncebuf_size;
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  140  		op->data.buf.in = nor->bouncebuf;
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  141  		return true;
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  142  	}
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  143  
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  144  	return false;
b7ad6be2ee67b1 drivers/mtd/spi-nor/spi-nor.c Sergei Shtylyov 2020-02-19  145  }
b35b9a10362d20 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2019-08-06  146  

:::::: The code at line 137 was first introduced by commit
:::::: b7ad6be2ee67b12cba31d30deb34beab19acac57 mtd: spi-nor: split spi_nor_spimem_xfer_data()

:::::: TO: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
:::::: CC: Tudor Ambarus <tudor.ambarus@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
