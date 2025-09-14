Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585E11D432D
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Sep 2025 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850607; cv=none; b=fkobaCjdEOkmQNcv+m59vxHMC80WBgtDDWsHdkcmzGQDCrhNj9jVLbOwU6xEGbv42GpBAzx7Ze4dOwxYcnPSRw8Ha+hurHMCC2nGRfSt/GNnNYssspYW7NzlDofKWKVt0IJAEmYjEGI8z/TkVyqk57VfWSf7g/mqYTR4cRv2c+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850607; c=relaxed/simple;
	bh=EZCdj/yZ75w++29z17Wd633+S9oTvonHhEs8SqbYLos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awEe2U6q04rqAfpcIXOPZeY4SMaQF53gHO7BXBJAJsf+h5pES0A7MfUdW2Wj7mp40A1sfuPSSCcqkyScbw2YLK5J4phdsg6UD+OZ6/Fu0Ykj/OVNhiSQ73p7kMwD9OhRufwbHrBxAlJ5bpmRWpZe2RgossEkmuFE4RrXwxYcEMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrVJUfXh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrVJUfXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757850605; x=1789386605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZCdj/yZ75w++29z17Wd633+S9oTvonHhEs8SqbYLos=;
  b=CrVJUfXhHs+oOB4A4/8hnVG8S20R5L8mMbpqMIAK6xHzrXpV9bosBjkF
   UWOY4dwfTAqbKqvlFK6GEHyvI8DdhZStIBP3Mnb7+wGYzWtozlLmqJn1D
   x6GWlATh4di8yeWbSjMfeG2R9hcr7SDTuY5v2Nm9scYAd3ALWEP4YTR9v
   ILIqu59rfstHippnjn5NVU/hSdaJX4WvGt/XBVhUTX9G7WTvbuwpPjTUg
   10djOKxGBGIBuzyN8VlfomNCjTVnXi0cDfhMazfYV6tBjOgIYjXCUBnaq
   vgu45c9ZdeWvOsGAGXQDSTxHa04SeofxMk6qm3JyKmZUE/dant5ofNriy
   g==;
X-CSE-ConnectionGUID: 7v3G3zNSS66IKp11q5r/LQ==
X-CSE-MsgGUID: Qh0NWMNcS5qHcqs6vqSfgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="60271864"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="60271864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 04:50:04 -0700
X-CSE-ConnectionGUID: kg6UbIIhRR23+vyxQW26gw==
X-CSE-MsgGUID: nIZWKbkJSXmJecW/TD12IA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2025 04:50:03 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxlEz-0002Mw-2K;
	Sun, 14 Sep 2025 11:49:58 +0000
Date: Sun, 14 Sep 2025 19:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [norov:find_first_size 35/38] drivers/perf/cxl_pmu.c:551
 cxl_pmu_get_event_idx() error: uninitialized symbol 'i'.
Message-ID: <202509141930.zFYyNJ8i-lkp@intel.com>
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
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux find_first_size
head:   19fff28fbf729956258aeb0cd260f8dc1186952f
commit: 6fb390cff19244a617ca75c1f3bedfa2a3116268 [35/38] PCI: dwc: simplify cxl_pmu_get_event_idx()
:::::: branch date: 16 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20250914 (https://download.01.org/0day-ci/archive/20250914/202509141930.zFYyNJ8i-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509141930.zFYyNJ8i-lkp@intel.com/

smatch warnings:
drivers/perf/cxl_pmu.c:551 cxl_pmu_get_event_idx() error: uninitialized symbol 'i'.

vim +/i +551 drivers/perf/cxl_pmu.c

5d7107c72796df3 Jonathan Cameron    2023-05-26  515  
5d7107c72796df3 Jonathan Cameron    2023-05-26  516  /* If counter_idx == NULL, don't try to allocate a counter. */
5d7107c72796df3 Jonathan Cameron    2023-05-26  517  static int cxl_pmu_get_event_idx(struct perf_event *event, int *counter_idx,
5d7107c72796df3 Jonathan Cameron    2023-05-26  518  				 int *event_idx)
5d7107c72796df3 Jonathan Cameron    2023-05-26  519  {
5d7107c72796df3 Jonathan Cameron    2023-05-26  520  	struct cxl_pmu_info *info = pmu_to_cxl_pmu_info(event->pmu);
5d7107c72796df3 Jonathan Cameron    2023-05-26  521  	DECLARE_BITMAP(configurable_and_free, CXL_PMU_MAX_COUNTERS);
5d7107c72796df3 Jonathan Cameron    2023-05-26  522  	struct cxl_pmu_ev_cap *pmu_ev;
5d7107c72796df3 Jonathan Cameron    2023-05-26  523  	u32 mask;
5d7107c72796df3 Jonathan Cameron    2023-05-26  524  	u16 gid, vid;
5d7107c72796df3 Jonathan Cameron    2023-05-26  525  	int i;
5d7107c72796df3 Jonathan Cameron    2023-05-26  526  
5d7107c72796df3 Jonathan Cameron    2023-05-26  527  	vid = cxl_pmu_config_get_vid(event);
5d7107c72796df3 Jonathan Cameron    2023-05-26  528  	gid = cxl_pmu_config_get_gid(event);
5d7107c72796df3 Jonathan Cameron    2023-05-26  529  	mask = cxl_pmu_config_get_mask(event);
5d7107c72796df3 Jonathan Cameron    2023-05-26  530  
5d7107c72796df3 Jonathan Cameron    2023-05-26  531  	pmu_ev = cxl_pmu_find_fixed_counter_ev_cap(info, vid, gid, mask);
5d7107c72796df3 Jonathan Cameron    2023-05-26  532  	if (!IS_ERR(pmu_ev)) {
5d7107c72796df3 Jonathan Cameron    2023-05-26  533  		if (!counter_idx)
5d7107c72796df3 Jonathan Cameron    2023-05-26  534  			return 0;
5d7107c72796df3 Jonathan Cameron    2023-05-26  535  		if (!test_bit(pmu_ev->counter_idx, info->used_counter_bm)) {
5d7107c72796df3 Jonathan Cameron    2023-05-26  536  			*counter_idx = pmu_ev->counter_idx;
5d7107c72796df3 Jonathan Cameron    2023-05-26  537  			return 0;
5d7107c72796df3 Jonathan Cameron    2023-05-26  538  		}
5d7107c72796df3 Jonathan Cameron    2023-05-26  539  		/* Fixed counter is in use, but maybe a configurable one? */
5d7107c72796df3 Jonathan Cameron    2023-05-26  540  	}
5d7107c72796df3 Jonathan Cameron    2023-05-26  541  
5d7107c72796df3 Jonathan Cameron    2023-05-26  542  	pmu_ev = cxl_pmu_find_config_counter_ev_cap(info, vid, gid, mask);
5d7107c72796df3 Jonathan Cameron    2023-05-26  543  	if (!IS_ERR(pmu_ev)) {
5d7107c72796df3 Jonathan Cameron    2023-05-26  544  		if (!counter_idx)
5d7107c72796df3 Jonathan Cameron    2023-05-26  545  			return 0;
5d7107c72796df3 Jonathan Cameron    2023-05-26  546  
6fb390cff19244a Yury Norov (NVIDIA  2025-09-13  547) 		if (bitmap_empty_andnot(info->conf_counter_bm,
6fb390cff19244a Yury Norov (NVIDIA  2025-09-13  548) 					info->used_counter_bm, CXL_PMU_MAX_COUNTERS))
5d7107c72796df3 Jonathan Cameron    2023-05-26  549  			return -EINVAL;
5d7107c72796df3 Jonathan Cameron    2023-05-26  550  
5d7107c72796df3 Jonathan Cameron    2023-05-26 @551  		*counter_idx = i;
5d7107c72796df3 Jonathan Cameron    2023-05-26  552  		return 0;
5d7107c72796df3 Jonathan Cameron    2023-05-26  553  	}
5d7107c72796df3 Jonathan Cameron    2023-05-26  554  
5d7107c72796df3 Jonathan Cameron    2023-05-26  555  	return -EINVAL;
5d7107c72796df3 Jonathan Cameron    2023-05-26  556  }
5d7107c72796df3 Jonathan Cameron    2023-05-26  557  

:::::: The code at line 551 was first introduced by commit
:::::: 5d7107c72796df3be2ba574f1cf6eca75c60d5ef perf: CXL Performance Monitoring Unit driver

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
