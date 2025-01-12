Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0721C36
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jan 2025 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736641275; cv=none; b=cTzuxS/o32y6MExyBaCNGGGVCXxmKPEmzWTfPsulofezQCoU/UTAiAE2j81iF9GFw7O3m7LuyHZLr0MwJd9wNeKo/H+bO1jlOG31rriwzc98yMpxuUjErvQVImU/PkCU1/Ei9dYvxiA/GiIdXl4u/HLsh2iR7FEVBe5/Dk+K0bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736641275; c=relaxed/simple;
	bh=0YQRmosjOp6x9fJfEv0NhnAym6FbaqRWzvj/y1aToGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLPbZ5RPgNrUhhxZmXim3C7kFXWLtf5CCSg4dS83wHmDH6fp2kMPiOPqBTlI0bh5X4AAxOhYZ2ybc48Z4iOr+BGMnlssXdAfeR6ZRm1TRqJ4UwWb0m/mqZXwKfglS7S6byFOLG/rtcnqCt2Xmh7bp1mhlFPsXDpCgAcqB5/UAFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYxkqck5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYxkqck5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736641272; x=1768177272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0YQRmosjOp6x9fJfEv0NhnAym6FbaqRWzvj/y1aToGo=;
  b=ZYxkqck5OGPeWKHaGsNH0u/p1HJS3xPD5cfdt8sjd9BlLGbyqwzXaOtG
   3NB/sdaOg3P16BAHdM/qN5OXm0Idt+pnMFabFERHDsE347GQMAQ+kvb8K
   o7ovz0bYcxaYu90Zupw86ElqqaMuAg8rGtkpDSzI2V5hlly8S1N5U25Cj
   gDGssklmUmj7SjVq1BT/AnaW1O/BjSd2LisZsKNJ7FEYSRVsy1CuosQMR
   aZyvSGzsIZPf/+FobnHT8lll6yiZwAAm5UI3ziQCQ2sE4BR/LzuP8YvpW
   mepyYZmdkeMxl1roPw/Jvmx/iibZj+GkoxKYUuOz8zq3QO1lBJsTSykX/
   Q==;
X-CSE-ConnectionGUID: A6jrzmrcSDaajpyuGXK+yA==
X-CSE-MsgGUID: Zp7A9sh0Sjm0i66kN0dbwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="40671966"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="40671966"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 16:21:12 -0800
X-CSE-ConnectionGUID: yK5w1kBkSSuBKVbDh8uE0Q==
X-CSE-MsgGUID: 9R56H1wSQEOe3fPpaEHNaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104588160"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 16:21:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWlj1-000LLl-1y;
	Sun, 12 Jan 2025 00:21:07 +0000
Date: Sun, 12 Jan 2025 08:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [xilinx-xlnx:lkp_test 433/504]
 drivers/mtd/spi-nor/micron-st.c:390:11-24: duplicated argument to & or |
Message-ID: <202501120824.dHDgLDUV-lkp@intel.com>
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
commit: 813cccfd34b37a250ae9b3857b11c77a2a0de203 [433/504] mtd: spi-nor: Avoid locking/unlocking unrequested memory blocks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r062-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120824.dHDgLDUV-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501120824.dHDgLDUV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/micron-st.c:390:11-24: duplicated argument to & or |

vim +390 drivers/mtd/spi-nor/micron-st.c

6823a838342026 Mamta Shukla         2023-10-17  196  
c9d5cdf4bf9cd4 Michael Walle        2022-02-23  197  static const struct flash_info st_nor_parts[] = {
8eb4eb838f9fd1 Michael Walle        2023-09-08  198  	{
9df3c9ac6ea635 Michael Walle        2023-09-08  199  		.name = "m25p05-nonjedec",
9df3c9ac6ea635 Michael Walle        2023-09-08  200  		.sector_size = SZ_32K,
9df3c9ac6ea635 Michael Walle        2023-09-08  201  		.size = SZ_64K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  202  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  203  		.name = "m25p10-nonjedec",
9df3c9ac6ea635 Michael Walle        2023-09-08  204  		.sector_size = SZ_32K,
9df3c9ac6ea635 Michael Walle        2023-09-08  205  		.size = SZ_128K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  206  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  207  		.name = "m25p20-nonjedec",
9df3c9ac6ea635 Michael Walle        2023-09-08  208  		.size = SZ_256K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  209  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  210  		.name = "m25p40-nonjedec",
9df3c9ac6ea635 Michael Walle        2023-09-08  211  		.size = SZ_512K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  212  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  213  		.name = "m25p80-nonjedec",
9df3c9ac6ea635 Michael Walle        2023-09-08  214  		.size = SZ_1M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  215  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  216  		.name = "m25p16-nonjedec",
9df3c9ac6ea635 Michael Walle        2023-09-08  217  		.size = SZ_2M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  218  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  219  		.name = "m25p32-nonjedec",
9df3c9ac6ea635 Michael Walle        2023-09-08  220  		.size = SZ_4M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  221  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  222  		.name = "m25p64-nonjedec",
9df3c9ac6ea635 Michael Walle        2023-09-08  223  		.size = SZ_8M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  224  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  225  		.name = "m25p128-nonjedec",
9df3c9ac6ea635 Michael Walle        2023-09-08  226  		.sector_size = SZ_256K,
9df3c9ac6ea635 Michael Walle        2023-09-08  227  		.size = SZ_16M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  228  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  229  		.id = SNOR_ID(0x20, 0x20, 0x10),
8eb4eb838f9fd1 Michael Walle        2023-09-08  230  		.name = "m25p05",
8eb4eb838f9fd1 Michael Walle        2023-09-08  231  		.sector_size = SZ_32K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  232  		.size = SZ_64K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  233  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  234  		.id = SNOR_ID(0x20, 0x20, 0x11),
8eb4eb838f9fd1 Michael Walle        2023-09-08  235  		.name = "m25p10",
8eb4eb838f9fd1 Michael Walle        2023-09-08  236  		.sector_size = SZ_32K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  237  		.size = SZ_128K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  238  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  239  		.id = SNOR_ID(0x20, 0x20, 0x12),
8eb4eb838f9fd1 Michael Walle        2023-09-08  240  		.name = "m25p20",
8eb4eb838f9fd1 Michael Walle        2023-09-08  241  		.size = SZ_256K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  242  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  243  		.id = SNOR_ID(0x20, 0x20, 0x13),
8eb4eb838f9fd1 Michael Walle        2023-09-08  244  		.name = "m25p40",
8eb4eb838f9fd1 Michael Walle        2023-09-08  245  		.size = SZ_512K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  246  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  247  		.id = SNOR_ID(0x20, 0x20, 0x14),
8eb4eb838f9fd1 Michael Walle        2023-09-08  248  		.name = "m25p80",
8eb4eb838f9fd1 Michael Walle        2023-09-08  249  		.size = SZ_1M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  250  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  251  		.id = SNOR_ID(0x20, 0x20, 0x15),
8eb4eb838f9fd1 Michael Walle        2023-09-08  252  		.name = "m25p16",
8eb4eb838f9fd1 Michael Walle        2023-09-08  253  		.size = SZ_2M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  254  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  255  		.id = SNOR_ID(0x20, 0x20, 0x16),
8eb4eb838f9fd1 Michael Walle        2023-09-08  256  		.name = "m25p32",
8eb4eb838f9fd1 Michael Walle        2023-09-08  257  		.size = SZ_4M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  258  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  259  		.id = SNOR_ID(0x20, 0x20, 0x17),
8eb4eb838f9fd1 Michael Walle        2023-09-08  260  		.name = "m25p64",
8eb4eb838f9fd1 Michael Walle        2023-09-08  261  		.size = SZ_8M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  262  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  263  		.id = SNOR_ID(0x20, 0x20, 0x18),
8eb4eb838f9fd1 Michael Walle        2023-09-08  264  		.name = "m25p128",
8eb4eb838f9fd1 Michael Walle        2023-09-08  265  		.sector_size = SZ_256K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  266  		.size = SZ_16M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  267  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  268  		.id = SNOR_ID(0x20, 0x40, 0x11),
8eb4eb838f9fd1 Michael Walle        2023-09-08  269  		.name = "m45pe10",
8eb4eb838f9fd1 Michael Walle        2023-09-08  270  		.size = SZ_128K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  271  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  272  		.id = SNOR_ID(0x20, 0x40, 0x14),
8eb4eb838f9fd1 Michael Walle        2023-09-08  273  		.name = "m45pe80",
8eb4eb838f9fd1 Michael Walle        2023-09-08  274  		.size = SZ_1M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  275  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  276  		.id = SNOR_ID(0x20, 0x40, 0x15),
8eb4eb838f9fd1 Michael Walle        2023-09-08  277  		.name = "m45pe16",
8eb4eb838f9fd1 Michael Walle        2023-09-08  278  		.size = SZ_2M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  279  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  280  		.id = SNOR_ID(0x20, 0x63, 0x16),
9df3c9ac6ea635 Michael Walle        2023-09-08  281  		.name = "m25px32-s1",
9df3c9ac6ea635 Michael Walle        2023-09-08  282  		.size = SZ_4M,
9df3c9ac6ea635 Michael Walle        2023-09-08  283  		.no_sfdp_flags = SECT_4K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  284  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  285  		.id = SNOR_ID(0x20, 0x71, 0x14),
9df3c9ac6ea635 Michael Walle        2023-09-08  286  		.name = "m25px80",
8eb4eb838f9fd1 Michael Walle        2023-09-08  287  		.size = SZ_1M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  288  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  289  		.id = SNOR_ID(0x20, 0x71, 0x15),
8eb4eb838f9fd1 Michael Walle        2023-09-08  290  		.name = "m25px16",
8eb4eb838f9fd1 Michael Walle        2023-09-08  291  		.size = SZ_2M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  292  		.no_sfdp_flags = SECT_4K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  293  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  294  		.id = SNOR_ID(0x20, 0x71, 0x16),
8eb4eb838f9fd1 Michael Walle        2023-09-08  295  		.name = "m25px32",
8eb4eb838f9fd1 Michael Walle        2023-09-08  296  		.size = SZ_4M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  297  		.no_sfdp_flags = SECT_4K,
9df3c9ac6ea635 Michael Walle        2023-09-08  298  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  299  		.id = SNOR_ID(0x20, 0x71, 0x17),
9df3c9ac6ea635 Michael Walle        2023-09-08  300  		.name = "m25px64",
9df3c9ac6ea635 Michael Walle        2023-09-08  301  		.size = SZ_8M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  302  	}, {
8eb4eb838f9fd1 Michael Walle        2023-09-08  303  		.id = SNOR_ID(0x20, 0x73, 0x16),
8eb4eb838f9fd1 Michael Walle        2023-09-08  304  		.name = "m25px32-s0",
8eb4eb838f9fd1 Michael Walle        2023-09-08  305  		.size = SZ_4M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  306  		.no_sfdp_flags = SECT_4K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  307  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  308  		.id = SNOR_ID(0x20, 0x80, 0x12),
9df3c9ac6ea635 Michael Walle        2023-09-08  309  		.name = "m25pe20",
9df3c9ac6ea635 Michael Walle        2023-09-08  310  		.size = SZ_256K,
9df3c9ac6ea635 Michael Walle        2023-09-08  311  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  312  		.id = SNOR_ID(0x20, 0x80, 0x14),
9df3c9ac6ea635 Michael Walle        2023-09-08  313  		.name = "m25pe80",
9df3c9ac6ea635 Michael Walle        2023-09-08  314  		.size = SZ_1M,
9df3c9ac6ea635 Michael Walle        2023-09-08  315  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  316  		.id = SNOR_ID(0x20, 0x80, 0x15),
9df3c9ac6ea635 Michael Walle        2023-09-08  317  		.name = "m25pe16",
9df3c9ac6ea635 Michael Walle        2023-09-08  318  		.size = SZ_2M,
8eb4eb838f9fd1 Michael Walle        2023-09-08  319  		.no_sfdp_flags = SECT_4K,
8eb4eb838f9fd1 Michael Walle        2023-09-08  320  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  321  		.id = SNOR_ID(0x20, 0xba, 0x16),
9df3c9ac6ea635 Michael Walle        2023-09-08  322  		.name = "n25q032",
9df3c9ac6ea635 Michael Walle        2023-09-08  323  		.size = SZ_4M,
9df3c9ac6ea635 Michael Walle        2023-09-08  324  		.no_sfdp_flags = SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  325  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  326  		.id = SNOR_ID(0x20, 0xba, 0x17),
9df3c9ac6ea635 Michael Walle        2023-09-08  327  		.name = "n25q064",
8eb4eb838f9fd1 Michael Walle        2023-09-08  328  		.size = SZ_8M,
9df3c9ac6ea635 Michael Walle        2023-09-08  329  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
8eb4eb838f9fd1 Michael Walle        2023-09-08  330  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  331  		.id = SNOR_ID(0x20, 0xba, 0x18),
9df3c9ac6ea635 Michael Walle        2023-09-08  332  		.name = "n25q128a13",
9df3c9ac6ea635 Michael Walle        2023-09-08  333  		.size = SZ_16M,
9df3c9ac6ea635 Michael Walle        2023-09-08  334  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  335  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  336  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  337  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  338  		.fixups = &mt25qu512a_fixups,
9df3c9ac6ea635 Michael Walle        2023-09-08  339  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  340  		.id = SNOR_ID(0x20, 0xba, 0x19, 0x10, 0x44, 0x00),
9df3c9ac6ea635 Michael Walle        2023-09-08  341  		.name = "mt25ql256a",
9df3c9ac6ea635 Michael Walle        2023-09-08  342  		.size = SZ_32M,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  343  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  344  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  345  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  346  		.fixup_flags = SPI_NOR_4B_OPCODES,
9df3c9ac6ea635 Michael Walle        2023-09-08  347  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  348  		.fixups = &mt25qu512a_fixups,
9df3c9ac6ea635 Michael Walle        2023-09-08  349  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  350  		.id = SNOR_ID(0x20, 0xba, 0x19),
9df3c9ac6ea635 Michael Walle        2023-09-08  351  		.name = "n25q256a",
9df3c9ac6ea635 Michael Walle        2023-09-08  352  		.size = SZ_32M,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  353  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  354  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  355  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  356  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  357  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  358  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  359  		.id = SNOR_ID(0x20, 0xba, 0x20, 0x10, 0x44, 0x00),
9df3c9ac6ea635 Michael Walle        2023-09-08  360  		.name = "mt25ql512a",
9df3c9ac6ea635 Michael Walle        2023-09-08  361  		.size = SZ_64M,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  362  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  363  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  364  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  365  		.fixup_flags = SPI_NOR_4B_OPCODES,
9df3c9ac6ea635 Michael Walle        2023-09-08  366  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  367  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  368  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  369  		.id = SNOR_ID(0x20, 0xba, 0x20),
9df3c9ac6ea635 Michael Walle        2023-09-08  370  		.name = "n25q512ax3",
9df3c9ac6ea635 Michael Walle        2023-09-08  371  		.size = SZ_64M,
9df3c9ac6ea635 Michael Walle        2023-09-08  372  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  373  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  374  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  375  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  376  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  377  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  378  		.id = SNOR_ID(0x20, 0xba, 0x21),
9df3c9ac6ea635 Michael Walle        2023-09-08  379  		.name = "n25q00",
9df3c9ac6ea635 Michael Walle        2023-09-08  380  		.size = SZ_128M,
9df3c9ac6ea635 Michael Walle        2023-09-08  381  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  382  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  383  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  384  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  385  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  386  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  387  		.id = SNOR_ID(0x20, 0xba, 0x22),
9df3c9ac6ea635 Michael Walle        2023-09-08  388  		.name = "mt25ql02g",
9df3c9ac6ea635 Michael Walle        2023-09-08  389  		.size = SZ_256M,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05 @390  		.flags = NO_CHIP_ERASE | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  391  		      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  392  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  393  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  394  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  395  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  396  		.id = SNOR_ID(0x20, 0xbb, 0x15),
9df3c9ac6ea635 Michael Walle        2023-09-08  397  		.name = "n25q016a",
9df3c9ac6ea635 Michael Walle        2023-09-08  398  		.size = SZ_2M,
9df3c9ac6ea635 Michael Walle        2023-09-08  399  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  400  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  401  		.id = SNOR_ID(0x20, 0xbb, 0x16),
9df3c9ac6ea635 Michael Walle        2023-09-08  402  		.name = "n25q032a",
9df3c9ac6ea635 Michael Walle        2023-09-08  403  		.size = SZ_4M,
9df3c9ac6ea635 Michael Walle        2023-09-08  404  		.no_sfdp_flags = SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  405  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  406  		.id = SNOR_ID(0x20, 0xbb, 0x17),
9df3c9ac6ea635 Michael Walle        2023-09-08  407  		.name = "n25q064a",
9df3c9ac6ea635 Michael Walle        2023-09-08  408  		.size = SZ_8M,
86fd0e6410b453 Brian Norris         2024-07-26  409  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  410  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  411  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  412  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  413  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  414  		.id = SNOR_ID(0x20, 0xbb, 0x18),
9df3c9ac6ea635 Michael Walle        2023-09-08  415  		.name = "n25q128a11",
9df3c9ac6ea635 Michael Walle        2023-09-08  416  		.size = SZ_16M,
9df3c9ac6ea635 Michael Walle        2023-09-08  417  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  418  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  419  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  420  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  421  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  422  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  423  		.id = SNOR_ID(0x20, 0xbb, 0x19, 0x10, 0x44, 0x00),
9df3c9ac6ea635 Michael Walle        2023-09-08  424  		.name = "mt25qu256a",
9df3c9ac6ea635 Michael Walle        2023-09-08  425  		.size = SZ_32M,
9df3c9ac6ea635 Michael Walle        2023-09-08  426  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  427  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  428  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  429  		.fixup_flags = SPI_NOR_4B_OPCODES,
9df3c9ac6ea635 Michael Walle        2023-09-08  430  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  431  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  432  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  433  		.id = SNOR_ID(0x20, 0xbb, 0x19),
9df3c9ac6ea635 Michael Walle        2023-09-08  434  		.name = "n25q256ax1",
9df3c9ac6ea635 Michael Walle        2023-09-08  435  		.size = SZ_32M,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  436  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  437  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  438  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  439  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  440  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  441  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  442  		.id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
9df3c9ac6ea635 Michael Walle        2023-09-08  443  		.name = "mt25qu512a",
a2a3e5430e7bea Mamta Shukla         2023-10-17  444  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  445  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  446  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  447  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  448  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  449  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  450  		.id = SNOR_ID(0x20, 0xbb, 0x20),
9df3c9ac6ea635 Michael Walle        2023-09-08  451  		.name = "n25q512a",
9df3c9ac6ea635 Michael Walle        2023-09-08  452  		.size = SZ_64M,
9df3c9ac6ea635 Michael Walle        2023-09-08  453  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  454  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  455  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  456  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  457  		.fixups = &mt25qu512a_fixups
c692ba6de1c5b4 Fabio Estevam        2023-11-25  458  	}, {
c692ba6de1c5b4 Fabio Estevam        2023-11-25  459  		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
c692ba6de1c5b4 Fabio Estevam        2023-11-25  460  		.name = "mt25qu01g",
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  461  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  462  			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  463  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
c692ba6de1c5b4 Fabio Estevam        2023-11-25  464  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  465  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  466  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  467  		.id = SNOR_ID(0x20, 0xbb, 0x21),
9df3c9ac6ea635 Michael Walle        2023-09-08  468  		.name = "n25q00a",
9df3c9ac6ea635 Michael Walle        2023-09-08  469  		.size = SZ_128M,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  470  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  471  		      SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  472  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  473  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  474  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  475  	}, {
9df3c9ac6ea635 Michael Walle        2023-09-08  476  		.id = SNOR_ID(0x20, 0xbb, 0x22),
9df3c9ac6ea635 Michael Walle        2023-09-08  477  		.name = "mt25qu02g",
9df3c9ac6ea635 Michael Walle        2023-09-08  478  		.size = SZ_256M,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  479  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  480  		      SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
9df3c9ac6ea635 Michael Walle        2023-09-08  481  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
9df3c9ac6ea635 Michael Walle        2023-09-08  482  		.mfr_flags = USE_FSR,
813cccfd34b37a Amit Kumar Mahapatra 2024-12-05  483  		.fixups = &mt25qu512a_fixups
9df3c9ac6ea635 Michael Walle        2023-09-08  484  	}
15f5c7e54e658a Boris Brezillon      2020-03-13  485  };
15f5c7e54e658a Boris Brezillon      2020-03-13  486  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
