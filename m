Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0EDB657
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Jun 2024 02:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718071436; cv=none; b=Dgz0YmAivsMCK/HdewYaUIqJ+jr+EV+H9JnalhehwpbTzYZnEvHc6jaPYOjTgpgIJXn01yu3SGrvnFd5a6SRHnO6viOtOsEgHqva33EOpb8G7AMpTu6plQ5gnXoWtpKFqoKd4BOdqgBQ2B6jnYHg5+N1MrCaWeZjanYyUiIu9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718071436; c=relaxed/simple;
	bh=eqFEuFABHnFJv5+e4FUGuGtbgE0wCRdUjBhQpZBpKRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fv0dKkZaHwkK6fbtFWbXt4rwAW5+Svd9g/cOlMAfrIn/DMR+CcIxt1CxTVLkmUf13TdZH1xv9RPKI9xyZTzLOtVZaStQnYrqeh4mYAxeHYI8lldwpPUyDaphT+RK6Rtoz+oJcfDl9lWy3ZkSfQlcG1Zee/u55LpLNPkboXhcWJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBXxUyxY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBXxUyxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718071434; x=1749607434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eqFEuFABHnFJv5+e4FUGuGtbgE0wCRdUjBhQpZBpKRc=;
  b=bBXxUyxYzbuwBp6/JW3COhK81O7mrPFUaYxaPSZAKBKhY0lqRAu925UD
   0lQo9q3KFUApjWCXdqTM6qklUBs7WioQrc212rUeUOJp1PZZlAFLHgVq9
   Qfeq8UjxN6WwQ6dpZHhQj74UoFp8vUNNNiIfv/p8EvKT73/898RW02wRL
   SYAc+QSbV7ePNP0w6xeMZhGZlutWvk3U8TmCoVVc0vur86M3lldaUwZV4
   xZtnxgOk7ZTX5c/yvRsYUd5S13RpiwSd6jM4Of3Z6irZEKHnCJp3dMVej
   vW7UdO6bUTpF7Z/neJAEkvkRolKRVTvD1Z/6mO03QomTVf2o2/Iv4ich5
   w==;
X-CSE-ConnectionGUID: nU0iNB9MRmqCt+Z6FvaQ1g==
X-CSE-MsgGUID: 7nDnyr7TSBGEj3iFBv9GMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25335684"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="25335684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 19:03:53 -0700
X-CSE-ConnectionGUID: 6bCd9t6IQoSgToCnKZ+fLQ==
X-CSE-MsgGUID: gprH33TQRAerAVZgyWHXrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="44205260"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2024 19:03:52 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGqrV-0002ft-1f;
	Tue, 11 Jun 2024 02:03:49 +0000
Date: Tue, 11 Jun 2024 10:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/imx-sdma.c:257:5-11: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202406110913.oC5MalD2-lkp@intel.com>
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
head:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
commit: 1cb49f389d5985bd9ad6ef37f856f368c3120f77 dmaengine: imx-sdma: utilize compiler to calculate ADDRS_ARRAY_SIZE_V<n>
date:   7 weeks ago
:::::: branch date: 29 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-r062-20240610 (https://download.01.org/0day-ci/archive/20240611/202406110913.oC5MalD2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406110913.oC5MalD2-lkp@intel.com/

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
