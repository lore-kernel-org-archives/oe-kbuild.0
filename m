Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8488257301
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jan 2024 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9CAcLFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705053424; x=1736589424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=noiyob4qy45EfF2qhcLMWngc18JYkaVDOroUGI4DctA=;
  b=D9CAcLFsplvKj7l3DQd0N0pV0FlXs45gkc2kfa5VF1Fokm+R2brF3X0K
   pn2TV2RCfxw9QnEnYx1LbRPOlP6r3sCOX2wBs05Q0Kt4or5Rh/bRpIw06
   KVAfkm7TU5RitU7pL8WlWAkD0m4Z+seybNQr23R2Ejs4iVnaaolHZoYv+
   0gUyXsUSLMUDr2K2PCLvTp/o+f1QWWp3/Ia/WI377NM9L0GV0hpuZDvMr
   TT3uBNBB+k+/8pksa+h4aPkmC2XrJHW3GwX4AT32m+ZNcB9W5jnRPAuB6
   akMqVJ33EzW7+VPTgJ2s6zH5hoPhx4IH3EQh0xZ8fgvqO3VE/z/Hh8o/z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="485308003"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="485308003"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 01:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="775960283"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="775960283"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Jan 2024 01:56:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOEHW-0009Jc-2T;
	Fri, 12 Jan 2024 09:56:54 +0000
Date: Fri, 12 Jan 2024 17:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [plbossart-sound:sdw/start-BRA-support 18/24]
 drivers/soundwire/cadence_master.c:2491 sdw_cdns_prepare_write_dma_buffer()
 warn: replace divide condition 'data_size / data_per_frame' with 'data_size
 >= data_per_frame'
Message-ID: <202401121708.r7RedJy5-lkp@intel.com>
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
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   50aee9a5ec1045ec898ccd6d62210aafda658368
commit: 295c9047b649086d38dd4582c9c0f3e1e331ac72 [18/24] soundwire: cadence: add BTP/BRA helpers to format data
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240112 (https://download.01.org/0day-ci/archive/20240112/202401121708.r7RedJy5-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401121708.r7RedJy5-lkp@intel.com/

smatch warnings:
drivers/soundwire/cadence_master.c:2491 sdw_cdns_prepare_write_dma_buffer() warn: replace divide condition 'data_size / data_per_frame' with 'data_size >= data_per_frame'
drivers/soundwire/cadence_master.c:2491 sdw_cdns_prepare_write_dma_buffer() warn: replace divide condition 'data_size / data_per_frame' with 'data_size >= data_per_frame'
drivers/soundwire/cadence_master.c:2566 sdw_cdns_prepare_read_dma_buffer() warn: replace divide condition 'data_size / data_per_frame' with 'data_size >= data_per_frame'
drivers/soundwire/cadence_master.c:2566 sdw_cdns_prepare_read_dma_buffer() warn: replace divide condition 'data_size / data_per_frame' with 'data_size >= data_per_frame'

vim +2491 drivers/soundwire/cadence_master.c

295c9047b64908 Pierre-Louis Bossart 2023-11-07  2465  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2466  int sdw_cdns_prepare_write_dma_buffer(u8 dev_num, u32 start_register,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2467  				      u8 *data, int data_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2468  				      int data_per_frame,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2469  				      u8 *dma_buffer, int dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2470  				      int *dma_buffer_total_bytes)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2471  {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2472  	u8 header[SDW_CDNS_BRA_HDR];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2473  	u8 *p_dma_buffer;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2474  	u8 *p_data;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2475  	int dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2476  	int total_dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2477  	u8 counter;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2478  	int remainder;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2479  	int ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2480  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2481  	counter = CDNS_BTP_ROLLING_COUNTER_START;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2482  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2483  	header[0] = BIT(1);		/* write command: BIT(1) set */
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2484  	header[0] |= GENMASK(7, 6);	/* header is active */
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2485  	header[0] |= (dev_num << 2);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2486  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2487  	p_data = &data[0];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2488  	p_dma_buffer = &dma_buffer[0];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2489  	total_dma_data_written = 0;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2490  
295c9047b64908 Pierre-Louis Bossart 2023-11-07 @2491  	while (data_size / data_per_frame) {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2492  		header[1] = data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2493  		header[2] = start_register >> 24 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2494  		header[3] = start_register >> 16 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2495  		header[4] = start_register >> 8 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2496  		header[5] = start_register >> 0 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2497  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2498  		ret = sdw_cdns_prepare_write_pd0_buffer(header, SDW_CDNS_BRA_HDR,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2499  							p_data, data_per_frame,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2500  							p_dma_buffer, dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2501  							&dma_data_written,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2502  							counter);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2503  		if (ret < 0)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2504  			return ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2505  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2506  		counter++;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2507  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2508  		p_data += data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2509  		data_size -= data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2510  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2511  		p_dma_buffer += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2512  		dma_buffer_size -= dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2513  		total_dma_data_written += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2514  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2515  		start_register += data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2516  	}
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2517  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2518  	remainder = data_size % data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2519  	if (remainder) {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2520  		header[1] = remainder;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2521  		header[2] = start_register >> 24 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2522  		header[3] = start_register >> 16 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2523  		header[4] = start_register >> 8 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2524  		header[5] = start_register >> 0 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2525  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2526  		ret = sdw_cdns_prepare_write_pd0_buffer(header, SDW_CDNS_BRA_HDR,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2527  							p_data, remainder,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2528  							p_dma_buffer, dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2529  							&dma_data_written,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2530  							counter);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2531  		if (ret < 0)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2532  			return ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2533  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2534  		total_dma_data_written += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2535  	}
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2536  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2537  	*dma_buffer_total_bytes = total_dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2538  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2539  	return 0;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2540  }
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2541  EXPORT_SYMBOL(sdw_cdns_prepare_write_dma_buffer);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2542  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2543  int sdw_cdns_prepare_read_dma_buffer(u8 dev_num, u32 start_register,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2544  				     int data_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2545  				     int data_per_frame,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2546  				     u8 *dma_buffer, int dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2547  				     int *dma_buffer_total_bytes)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2548  {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2549  	u8 header[SDW_CDNS_BRA_HDR];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2550  	u8 *p_dma_buffer;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2551  	int dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2552  	int total_dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2553  	u8 counter;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2554  	int remainder;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2555  	int ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2556  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2557  	counter = CDNS_BTP_ROLLING_COUNTER_START;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2558  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2559  	header[0] = 0;			/* read command: BIT(1) cleared */
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2560  	header[0] |= GENMASK(7, 6);	/* header is active */
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2561  	header[0] |= (dev_num << 2);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2562  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2563  	p_dma_buffer = &dma_buffer[0];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2564  	total_dma_data_written = 0;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2565  
295c9047b64908 Pierre-Louis Bossart 2023-11-07 @2566  	while (data_size / data_per_frame) {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2567  		header[1] = data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2568  		header[2] = start_register >> 24 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2569  		header[3] = start_register >> 16 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2570  		header[4] = start_register >> 8 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2571  		header[5] = start_register >> 0 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2572  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2573  		ret = sdw_cdns_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2574  						       p_dma_buffer, dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2575  						       &dma_data_written,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2576  						       counter);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2577  		if (ret < 0)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2578  			return ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2579  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2580  		counter++;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2581  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2582  		data_size -= data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2583  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2584  		p_dma_buffer += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2585  		dma_buffer_size -= dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2586  		total_dma_data_written += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2587  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2588  		start_register += data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2589  	}
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2590  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2591  	remainder = data_size % data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2592  	if (remainder) {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2593  		header[1] = remainder;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2594  		header[2] = start_register >> 24 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2595  		header[3] = start_register >> 16 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2596  		header[4] = start_register >> 8 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2597  		header[5] = start_register >> 0 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2598  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2599  		ret = sdw_cdns_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2600  						       p_dma_buffer, dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2601  						       &dma_data_written,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2602  						       counter);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2603  		if (ret < 0)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2604  			return ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2605  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2606  		total_dma_data_written += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2607  	}
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2608  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2609  	*dma_buffer_total_bytes = total_dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2610  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2611  	return 0;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2612  }
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2613  EXPORT_SYMBOL(sdw_cdns_prepare_read_dma_buffer);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2614  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
