Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3302261594
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 19:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739300462; cv=none; b=V+zSZlfvS5mlQaKaM1k6aD4elEhcccmH1s3S3R5C/LdILagEvykxmJ8QnXnVc3poW2z6F8qnXKSu4MUcuoPD/Y/nOO5jN60abrN0mb/cUuE7ZME90iN9/TgmXPRVZM1na/Zn4gJQ7y1xt+bLzgWnufXZK2NfAkL9nVEouRUtYcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739300462; c=relaxed/simple;
	bh=2ZPFL2wIlFImBmk99Dt3fwWSOzKWA+4mghz6kQIrp3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WS40KK9sp4xou7fd+uATRJU6ElRJy5rRqS9bsM62h3t6muybkGyObnmjdvDx1g28hqnhvIW9mC3LhLJLoA2Dpt7H5yN0TzyywF9IZo7GgPhAkh8wTi5z9Yv4MF4R1+vhHIKQTb+/63jq5eG1yVbpL4+kGLMhHSuDThFIHnT3HSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHmMaMe7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHmMaMe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739300461; x=1770836461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZPFL2wIlFImBmk99Dt3fwWSOzKWA+4mghz6kQIrp3k=;
  b=dHmMaMe7uwWl3Vd9DYI4GaRMmH9IhK5mvx6gAzSAUBfTshyWJbSlojaP
   xPyl7XPOgEDoRd4wCu9fks0kqTlfnUwbXiRulgYuBvioIjRAul+Caud64
   iNAdyJUQf8iG+VkDlk+8Xh+vg2+yBmoPmiUGh2hUSbKZYKWuXH5S8MBEN
   Au/x4FduGs1YdbcKLJ8lICjxblQoCI5jSz7Mg4xxr0t48FfYb1hWqbc9A
   ssHGmZwB/BIvsg7fO+gmR/tuJCS1+1BLfXeUdcJ3GVLa2hVcbK1dqy0r4
   aYRtOR3BO+zAgaglncWW4nLzH8VXHbfZC2QgyRefiIrHDnqGdeBPf5nsz
   w==;
X-CSE-ConnectionGUID: eMdqr1PYSNiCZGjeqb/CHw==
X-CSE-MsgGUID: GLedPHS6SnWYHmm+O/jF2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27538009"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="27538009"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:00:51 -0800
X-CSE-ConnectionGUID: V8YEDZfhSVWq4pCzXWd9UA==
X-CSE-MsgGUID: Sa5EwR30TY6T3DIoN9ZlyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135856346"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2025 11:00:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thvV1-0014ag-2J;
	Tue, 11 Feb 2025 19:00:47 +0000
Date: Wed, 12 Feb 2025 03:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/imx-sdma.c:257:5-11: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202502120240.yKTiN4Lm-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   febbc555cf0fff895546ddb8ba2c9a523692fb55
commit: 1cb49f389d5985bd9ad6ef37f856f368c3120f77 dmaengine: imx-sdma: utilize compiler to calculate ADDRS_ARRAY_SIZE_V<n>
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r063-20250211 (https://download.01.org/0day-ci/archive/20250212/202502120240.yKTiN4Lm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502120240.yKTiN4Lm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/imx-sdma.c:257:5-11: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +257 drivers/dma/imx-sdma.c

824a0a02cd7477 Sascha Hauer       2022-04-14  199  
01eafd4b238058 Shengjiu Wang      2022-07-06  200  /*
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  201   * struct sdma_script_start_addrs - SDMA script start pointers
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  202   *
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  203   * start addresses of the different functions in the physical
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  204   * address space of the SDMA engine.
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  205   */
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  206  struct sdma_script_start_addrs {
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  207  	s32 ap_2_ap_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  208  	s32 ap_2_bp_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  209  	s32 ap_2_ap_fixed_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  210  	s32 bp_2_ap_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  211  	s32 loopback_on_dsp_side_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  212  	s32 mcu_interrupt_only_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  213  	s32 firi_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  214  	s32 firi_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  215  	s32 per_2_firi_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  216  	s32 mcu_2_firi_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  217  	s32 uart_2_per_addr;
a3ae97f4c87d95 Kevin Groeneveld   2022-04-10  218  	s32 uart_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  219  	s32 per_2_app_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  220  	s32 mcu_2_app_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  221  	s32 per_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  222  	s32 uartsh_2_per_addr;
a3ae97f4c87d95 Kevin Groeneveld   2022-04-10  223  	s32 uartsh_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  224  	s32 per_2_shp_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  225  	s32 mcu_2_shp_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  226  	s32 ata_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  227  	s32 mcu_2_ata_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  228  	s32 app_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  229  	s32 app_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  230  	s32 shp_2_per_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  231  	s32 shp_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  232  	s32 mshc_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  233  	s32 mcu_2_mshc_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  234  	s32 spdif_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  235  	s32 mcu_2_spdif_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  236  	s32 asrc_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  237  	s32 ext_mem_2_ipu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  238  	s32 descrambler_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  239  	s32 dptc_dvfs_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  240  	s32 utra_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  241  	s32 ram_code_start_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  242  	/* End of v1 array */
1cb49f389d5985 Frank Li           2024-04-19  243  	union {	s32 v1_end; s32 mcu_2_ssish_addr; };
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  244  	s32 ssish_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  245  	s32 hdmi_dma_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  246  	/* End of v2 array */
1cb49f389d5985 Frank Li           2024-04-19  247  	union { s32 v2_end; s32 zcanfd_2_mcu_addr; };
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  248  	s32 zqspi_2_mcu_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  249  	s32 mcu_2_ecspi_addr;
b98ce2f4e32bef Robin Gong         2021-07-14  250  	s32 mcu_2_sai_addr;
b98ce2f4e32bef Robin Gong         2021-07-14  251  	s32 sai_2_mcu_addr;
a3ae97f4c87d95 Kevin Groeneveld   2022-04-10  252  	s32 uart_2_mcu_rom_addr;
a3ae97f4c87d95 Kevin Groeneveld   2022-04-10  253  	s32 uartsh_2_mcu_rom_addr;
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  254  	/* End of v3 array */
1cb49f389d5985 Frank Li           2024-04-19  255  	union { s32 v3_end; s32 mcu_2_zqspi_addr; };
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  256  	/* End of v4 array */
1cb49f389d5985 Frank Li           2024-04-19 @257  	s32 v4_end[0];
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  258  };
8d11cfb0c37547 Vladimir Zapolskiy 2021-06-20  259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
