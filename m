Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52457603F
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 02:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732243175; cv=none; b=PAVVwsbZyrHEkb/mxszHOREQYzJasiL1KEaS8FhjV5UdHYO6zZf7CMuwY76gHLlzP8UALPVWq7wU9XMntEre2o3U+TG8FUca/0yryCroJ6Pl+mtMCmERzQUJ0NmlJHiyaGZr3eiiQ8n8k9aXAfNBSNCEnEs+oZtyJIf3wAv2TP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732243175; c=relaxed/simple;
	bh=jhdxHjXfaRJZHQVtt7tUzC2JXGZIS2jslbtZJsp9Xn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXi0FpVgbsROXlYemSQhMisBWhHbObc8wRVn+Bu4p3BVobg3UPOD9bCxhaQ8SeZTteTXgIQwCSnAMoV71r2ixZ/8WFRtlewNnMce7G1r5kkUniKknWuyJ2RwCEhek8yR1NZE7pgUNy9ZaittDsk9eTMma/OA61Z/JW14vIR9SuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5paheWO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5paheWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732243174; x=1763779174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jhdxHjXfaRJZHQVtt7tUzC2JXGZIS2jslbtZJsp9Xn4=;
  b=E5paheWOUS9oXYBAoUgccnS7TIHQvbOxHsAhpK2FVIv+3uoT+RuGHyZw
   BVZIfKBK3kmRWKMG9WWNAi8Pl55n1Vj/JLl3VuXVRzh5glpjtMVF4FIUC
   AzgTOy5AEorUBAkmnUoKjJ8NBbujaOJtxOYaK2JMGENHch1rANtmqS7Tj
   uyvlB843EDcOQwxJNY+ZU4gIJna61MCUVf+vcoawNhqzWjrkyJB/W/6Lc
   utFIrA/+gGUP5XtMkDtjRemiPNUqFOTAGOFXT1IpCthqjUL0ro6iUz/Hv
   yce4dOHq2qBMqD1xiGRSdrn4+mJIRm846ZGYYl0dkMFjtE7SMn/TO6JDL
   A==;
X-CSE-ConnectionGUID: Y6E7Wj1LS1W9gLj8HPeniQ==
X-CSE-MsgGUID: KJkqNwwwT5y2n0gHcNxQtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="19977263"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="19977263"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 18:39:33 -0800
X-CSE-ConnectionGUID: IAjVBqnBSsui8ACXE1JqNQ==
X-CSE-MsgGUID: TLv54YnxRuut221TV7RWGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="95242347"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2024 18:39:32 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEJZx-0003bP-2c;
	Fri, 22 Nov 2024 02:39:29 +0000
Date: Fri, 22 Nov 2024 10:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:chromeos-6.6-f9d942cf7d57 80/1491]
 drivers/thermal/mediatek/soc_temp_lvts_mt8192.c:1020:5-11: WARNING: Unsigned
 expression compared with zero: offset < 0
Message-ID: <202411221018.m2HghjsA-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 41b0c432199119cb8102650729dd777ce54816a6 [80/1491] CHROMIUM: mt8195: backport legacy SOC_LVTS_TEMP as the out-of-tree driver
:::::: branch date: 8 weeks ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-r061-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221018.m2HghjsA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411221018.m2HghjsA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/mediatek/soc_temp_lvts_mt8192.c:1020:5-11: WARNING: Unsigned expression compared with zero: offset < 0

vim +1020 drivers/thermal/mediatek/soc_temp_lvts_mt8192.c

41b0c432199119 Wojciech Macek 2024-05-13   969  
41b0c432199119 Wojciech Macek 2024-05-13   970  static int device_read_count_rc_n_v4(struct lvts_data *lvts_data)
41b0c432199119 Wojciech Macek 2024-05-13   971  {
41b0c432199119 Wojciech Macek 2024-05-13   972  	/* Resistor-Capacitor Calibration */
41b0c432199119 Wojciech Macek 2024-05-13   973  	/* count_RC_N: count RC now */
41b0c432199119 Wojciech Macek 2024-05-13   974  	struct device *dev = lvts_data->dev;
41b0c432199119 Wojciech Macek 2024-05-13   975  	struct tc_settings *tc = lvts_data->tc;
41b0c432199119 Wojciech Macek 2024-05-13   976  	struct sensor_cal_data *cal_data = &lvts_data->cal_data;
41b0c432199119 Wojciech Macek 2024-05-13   977  	unsigned int offset, size, s_index, data;
41b0c432199119 Wojciech Macek 2024-05-13   978  	void __iomem *base;
41b0c432199119 Wojciech Macek 2024-05-13   979  	int ret, i, j;
41b0c432199119 Wojciech Macek 2024-05-13   980  	char buffer[512];
41b0c432199119 Wojciech Macek 2024-05-13   981  
41b0c432199119 Wojciech Macek 2024-05-13   982  	cal_data->count_rc_now = devm_kcalloc(dev, lvts_data->num_sensor,
41b0c432199119 Wojciech Macek 2024-05-13   983  					      sizeof(*cal_data->count_rc_now), GFP_KERNEL);
41b0c432199119 Wojciech Macek 2024-05-13   984  	if (!cal_data->count_rc_now)
41b0c432199119 Wojciech Macek 2024-05-13   985  		return -ENOMEM;
41b0c432199119 Wojciech Macek 2024-05-13   986  
41b0c432199119 Wojciech Macek 2024-05-13   987  	for (i = 0; i < lvts_data->num_tc; i++) {
41b0c432199119 Wojciech Macek 2024-05-13   988  		base = GET_BASE_ADDR(i);
41b0c432199119 Wojciech Macek 2024-05-13   989  		for (j = 0; j < tc[i].num_sensor; j++) {
41b0c432199119 Wojciech Macek 2024-05-13   990  			s_index = tc[i].sensor_map[j];
41b0c432199119 Wojciech Macek 2024-05-13   991  
41b0c432199119 Wojciech Macek 2024-05-13   992  			lvts_write_device(lvts_data, SELECT_SENSOR_RCK_V4(j), i);
41b0c432199119 Wojciech Macek 2024-05-13   993  			lvts_write_device(lvts_data, SET_DEVICE_SINGLE_MODE_V4, i);
41b0c432199119 Wojciech Macek 2024-05-13   994  			usleep_range(10, 20);
41b0c432199119 Wojciech Macek 2024-05-13   995  
41b0c432199119 Wojciech Macek 2024-05-13   996  			lvts_write_device(lvts_data, KICK_OFF_RCK_COUNTING_V4, i);
41b0c432199119 Wojciech Macek 2024-05-13   997  			usleep_range(30, 40);
41b0c432199119 Wojciech Macek 2024-05-13   998  
41b0c432199119 Wojciech Macek 2024-05-13   999  			ret = readl_poll_timeout(LVTS_CONFIG_0 + base, data,
41b0c432199119 Wojciech Macek 2024-05-13  1000  						 !(data & DEVICE_SENSING_STATUS), 2, 200);
41b0c432199119 Wojciech Macek 2024-05-13  1001  			if (ret)
41b0c432199119 Wojciech Macek 2024-05-13  1002  				dev_err(dev,
41b0c432199119 Wojciech Macek 2024-05-13  1003  					"Error: LVTS %d DEVICE_SENSING_STATUS didn't ready\n", i);
41b0c432199119 Wojciech Macek 2024-05-13  1004  
41b0c432199119 Wojciech Macek 2024-05-13  1005  			data = lvts_read_device(lvts_data, 0x00, i);
41b0c432199119 Wojciech Macek 2024-05-13  1006  
41b0c432199119 Wojciech Macek 2024-05-13  1007  			cal_data->count_rc_now[s_index] = (data & GENMASK(23, 0));
41b0c432199119 Wojciech Macek 2024-05-13  1008  		}
41b0c432199119 Wojciech Macek 2024-05-13  1009  
41b0c432199119 Wojciech Macek 2024-05-13  1010  		/* Recover Setting for Normal Access on
41b0c432199119 Wojciech Macek 2024-05-13  1011  		 * temperature fetch
41b0c432199119 Wojciech Macek 2024-05-13  1012  		 */
41b0c432199119 Wojciech Macek 2024-05-13  1013  		lvts_write_device(lvts_data, SET_SENSOR_NO_RCK_V4, i);
41b0c432199119 Wojciech Macek 2024-05-13  1014  		lvts_write_device(lvts_data, SET_DEVICE_LOW_POWER_SINGLE_MODE_V4, i);
41b0c432199119 Wojciech Macek 2024-05-13  1015  	}
41b0c432199119 Wojciech Macek 2024-05-13  1016  
41b0c432199119 Wojciech Macek 2024-05-13  1017  	size = sizeof(buffer);
41b0c432199119 Wojciech Macek 2024-05-13  1018  	offset = snprintf(buffer, size, "[COUNT_RC_NOW] ");
41b0c432199119 Wojciech Macek 2024-05-13  1019  
41b0c432199119 Wojciech Macek 2024-05-13 @1020  	if (offset < 0)
41b0c432199119 Wojciech Macek 2024-05-13  1021  		return -EINVAL;
41b0c432199119 Wojciech Macek 2024-05-13  1022  
41b0c432199119 Wojciech Macek 2024-05-13  1023  	if (offset >= size)
41b0c432199119 Wojciech Macek 2024-05-13  1024  		return -ENOMEM;
41b0c432199119 Wojciech Macek 2024-05-13  1025  
41b0c432199119 Wojciech Macek 2024-05-13  1026  	for (i = 0; i < lvts_data->num_sensor; i++)
41b0c432199119 Wojciech Macek 2024-05-13  1027  		offset += snprintf(buffer + offset, size - offset, "%d:%d ",
41b0c432199119 Wojciech Macek 2024-05-13  1028  				   i, cal_data->count_rc_now[i]);
41b0c432199119 Wojciech Macek 2024-05-13  1029  
41b0c432199119 Wojciech Macek 2024-05-13  1030  	if (offset < 0)
41b0c432199119 Wojciech Macek 2024-05-13  1031  		return -EINVAL;
41b0c432199119 Wojciech Macek 2024-05-13  1032  
41b0c432199119 Wojciech Macek 2024-05-13  1033  	if (offset >= size)
41b0c432199119 Wojciech Macek 2024-05-13  1034  		return -ENOMEM;
41b0c432199119 Wojciech Macek 2024-05-13  1035  
41b0c432199119 Wojciech Macek 2024-05-13  1036  	buffer[offset] = '\0';
41b0c432199119 Wojciech Macek 2024-05-13  1037  	dev_info(dev, "%s\n", buffer);
41b0c432199119 Wojciech Macek 2024-05-13  1038  
41b0c432199119 Wojciech Macek 2024-05-13  1039  	return 0;
41b0c432199119 Wojciech Macek 2024-05-13  1040  }
41b0c432199119 Wojciech Macek 2024-05-13  1041  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
