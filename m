Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC4730649
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 22:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g34VbuDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699397149; x=1730933149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HLn+ppGKhJv2mx4XBzIqmnXBZ5qcVc5eCrzaLS+FXe4=;
  b=g34VbuDnbMGkan5EImgkhy2koA50bDGEN7mtsvgb6iTzvT6kO6dXSgkg
   PfmOhYWvBEJxCI1X3Q4vDhbZhJRt7nk7+Cx14AIKEquy1q5aq7E64L6H+
   Qa/t6mwu8PGLNuMA0JM3hI5H2JNPAIYquLwWUTeEkzW+ZTUj+aYI90c5M
   x6MDnfUQCHtKIzk+3KKpIHqL2oVNO91z+0vCFqxJ1RlNSYYcTAYOl+0/X
   tvtDgKuLWJNfArGymL1Qt9EJj/QTjtHFZA90/J5boNj0omMS4RQwJ6eFM
   MDbwph+Hhs5AWweyOqNt5yQG/zuYQw8oNFj3rKEg/hBzEReoutmjywiES
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="453944522"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="453944522"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 14:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="936311744"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="936311744"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Nov 2023 14:45:44 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0UpK-0007Rr-2C;
	Tue, 07 Nov 2023 22:45:42 +0000
Date: Wed, 8 Nov 2023 06:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/spi/spi-loongson-core.c:46:15: sparse: sparse: too long
 token expansion
Message-ID: <202311080515.AMpF3Xli-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/spi/spi-loongson-core.c:46:15: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13d88ac54ddd1011b6e94443958e798aa06eb835
commit: d03eba99f5bf7cbc6e2fdde3b6fa36954ad58e09 minmax: allow min()/max()/clamp() if the arguments have the same signedness.
date:   3 weeks ago
:::::: branch date: 66 minutes ago
:::::: commit date: 3 weeks ago
config: mips-randconfig-r131-20231107 (https://download.01.org/0day-ci/archive/20231108/202311080515.AMpF3Xli-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080515.AMpF3Xli-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311080515.AMpF3Xli-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-loongson-core.c:46:15: sparse: sparse: too long token expansion
>> drivers/spi/spi-loongson-core.c:46:15: sparse: sparse: too long token expansion
>> drivers/spi/spi-loongson-core.c:46:15: sparse: sparse: too long token expansion

vim +46 drivers/spi/spi-loongson-core.c

6c7a864007b66e Yinbo Zhu 2023-06-13  39  
6c7a864007b66e Yinbo Zhu 2023-06-13  40  static void loongson_spi_set_clk(struct loongson_spi *loongson_spi, unsigned int hz)
6c7a864007b66e Yinbo Zhu 2023-06-13  41  {
6c7a864007b66e Yinbo Zhu 2023-06-13  42  	unsigned char val;
6c7a864007b66e Yinbo Zhu 2023-06-13  43  	unsigned int div, div_tmp;
6c7a864007b66e Yinbo Zhu 2023-06-13  44  	static const char rdiv[12] = {0, 1, 4, 2, 3, 5, 6, 7, 8, 9, 10, 11};
6c7a864007b66e Yinbo Zhu 2023-06-13  45  
6c7a864007b66e Yinbo Zhu 2023-06-13 @46  	div = clamp_val(DIV_ROUND_UP_ULL(loongson_spi->clk_rate, hz), 2, 4096);
6c7a864007b66e Yinbo Zhu 2023-06-13  47  	div_tmp = rdiv[fls(div - 1)];
6c7a864007b66e Yinbo Zhu 2023-06-13  48  	loongson_spi->spcr = (div_tmp & GENMASK(1, 0)) >> 0;
6c7a864007b66e Yinbo Zhu 2023-06-13  49  	loongson_spi->sper = (div_tmp & GENMASK(3, 2)) >> 2;
6c7a864007b66e Yinbo Zhu 2023-06-13  50  	val = loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPCR_REG);
6c7a864007b66e Yinbo Zhu 2023-06-13  51  	val &= ~GENMASK(1, 0);
6c7a864007b66e Yinbo Zhu 2023-06-13  52  	loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPCR_REG, val |
6c7a864007b66e Yinbo Zhu 2023-06-13  53  			       loongson_spi->spcr);
6c7a864007b66e Yinbo Zhu 2023-06-13  54  	val = loongson_spi_read_reg(loongson_spi, LOONGSON_SPI_SPER_REG);
6c7a864007b66e Yinbo Zhu 2023-06-13  55  	val &= ~GENMASK(1, 0);
6c7a864007b66e Yinbo Zhu 2023-06-13  56  	loongson_spi_write_reg(loongson_spi, LOONGSON_SPI_SPER_REG, val |
6c7a864007b66e Yinbo Zhu 2023-06-13  57  			       loongson_spi->sper);
6c7a864007b66e Yinbo Zhu 2023-06-13  58  	loongson_spi->hz = hz;
6c7a864007b66e Yinbo Zhu 2023-06-13  59  }
6c7a864007b66e Yinbo Zhu 2023-06-13  60  

:::::: The code at line 46 was first introduced by commit
:::::: 6c7a864007b66e60a3f64858a9555efed408b048 spi: loongson: add bus driver for the loongson spi controller

:::::: TO: Yinbo Zhu <zhuyinbo@loongson.cn>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
