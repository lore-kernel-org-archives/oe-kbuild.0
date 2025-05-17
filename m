Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A9FC0A
	for <oe-kbuild@lists.linux.dev>; Sat, 17 May 2025 01:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447074; cv=none; b=XmLwoiCuhl+MpWa4m431fDY/yIjd4RkMGbVfQiO8ouA+PqcXWfJZIHiQwNTY/0dtlhm3nAmMFAyzIJGO2nc7Z33Y556gspzB5TsEnUjvAV7IsFJqbsQ4WCC6NYiJo92vU7Y/3HnqeXPovsVK6Gh10vBTxzRYzkpyw2blST7yrEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447074; c=relaxed/simple;
	bh=81RltoX1Ty+gEXNCRXyCUJSvM4cGfN9Idif1JhQtSYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZCKreQ8wr8Ta8S/3/rLowCCeKNDGa4NN6k67btQtM2WAL6stqC4hIlvQhV2inT1Rw3nkQooVTQOSl0Co7yjYOTEYVAEE/XpFI3yTE2UIjAyBAF+7TKJRlaN0Z38Q8ar17eDaU7NjFTD+EAReiiE/oNpgXl7f5jxBKqfWY4d1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJ4514pR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJ4514pR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747447072; x=1778983072;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=81RltoX1Ty+gEXNCRXyCUJSvM4cGfN9Idif1JhQtSYk=;
  b=LJ4514pRDhwdLWz5HVfW4VcGY/9dcpM6mD8Gmi1QZkWOQv8AXBavV6Xy
   t9JUAEWd5ERwus/uYxcsuRvlyNkxoqqXgACUbpebze5xBNYaslS+igo2x
   VZgMf3ggU1ahrffCwo2cbkKpUup+Oh+kmQrq1Ox3jBkGKfk4KR9cuPw4x
   7sK7G8f5fpsYWW+FM89IkzUAZiaAhM1bVusOXkTMQMH19TxGWuPeG12yA
   OxbtVm7/J7y7Omyhnm2JHLyGMxU7qOlELzzYSraSQMfdVe0aVhbmpok4J
   orLMA3oM9hgU86mFnMNd1zGijpGb4xMOWvL8wuUyIsyyJDl5JZLfV8bLH
   w==;
X-CSE-ConnectionGUID: AumVM+tbRTyYTE1is0dSvw==
X-CSE-MsgGUID: ePqUZPvrREeUc6T6JOYZCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66837674"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="66837674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 18:57:51 -0700
X-CSE-ConnectionGUID: NkkjRVYkQie/lPfpo9TL6g==
X-CSE-MsgGUID: xHUdvk6HSlet68emgsPrEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="138771769"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2025 18:57:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG6o8-000Jrp-0b;
	Sat, 17 May 2025 01:57:48 +0000
Date: Sat, 17 May 2025 09:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8449/11779]
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1210
 isst_if_get_perf_level_fabric_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202505170904.uImoWLJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: d6644d737bec473a38dbd44a71553cacd636a920 [8449/11779] platform/x86: ISST: Support SST-PP revision 2
:::::: branch date: 15 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-r072-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170904.uImoWLJu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505170904.uImoWLJu-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1210 isst_if_get_perf_level_fabric_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)

Old smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:747 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info[part]' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1100 isst_if_get_perf_level_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1255 isst_if_get_perf_level_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1300 isst_if_get_base_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1336 isst_if_get_base_freq_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1435 isst_if_get_turbo_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)

vim +1210 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1179  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1180  static int isst_if_get_perf_level_fabric_info(void __user *argp)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1181  {
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1182  	struct isst_perf_level_fabric_info perf_level_fabric;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1183  	struct tpmi_per_power_domain_info *power_domain_info;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1184  	int start = SST_PP_CORE_RATIO_P0_FABRIC_START;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1185  	int width = SST_PP_CORE_RATIO_P0_FABRIC_WIDTH;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1186  	int offset = SST_PP_INFO_11_OFFSET;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1187  	int i;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1188  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1189  	if (copy_from_user(&perf_level_fabric, argp, sizeof(perf_level_fabric)))
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1190  		return -EFAULT;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1191  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1192  	power_domain_info = get_instance(perf_level_fabric.socket_id,
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1193  					 perf_level_fabric.power_domain_id);
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1194  	if (!power_domain_info)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1195  		return -EINVAL;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1196  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1197  	if (perf_level_fabric.level > power_domain_info->max_level)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1198  		return -EINVAL;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1199  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1200  	if (power_domain_info->pp_header.feature_rev < 2)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1201  		return -EINVAL;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1202  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1203  	if (!(power_domain_info->pp_header.level_en_mask & BIT(perf_level_fabric.level)))
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1204  		return -EINVAL;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1205  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1206  	/* For revision 2, maximum number of fabrics is 2 */
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1207  	perf_level_fabric.max_fabrics = 2;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1208  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1209  	for (i = 0; i < perf_level_fabric.max_fabrics; i++) {
d6644d737bec47 Srinivas Pandruvada 2025-05-06 @1210  		_read_pp_level_info("p0_fabric_freq_mhz", perf_level_fabric.p0_fabric_freq_mhz[i],
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1211  				    perf_level_fabric.level, offset, start, width,
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1212  				    SST_MUL_FACTOR_FREQ)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1213  		start += width;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1214  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1215  		_read_pp_level_info("p1_fabric_freq_mhz", perf_level_fabric.p1_fabric_freq_mhz[i],
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1216  				    perf_level_fabric.level, offset, start, width,
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1217  				    SST_MUL_FACTOR_FREQ)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1218  		start += width;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1219  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1220  		_read_pp_level_info("pm_fabric_freq_mhz", perf_level_fabric.pm_fabric_freq_mhz[i],
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1221  				    perf_level_fabric.level, offset, start, width,
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1222  				    SST_MUL_FACTOR_FREQ)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1223  		offset = SST_PP_INFO_12_OFFSET;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1224  		start = SST_PP_CORE_RATIO_P0_FABRIC_1_START;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1225  	}
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1226  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1227  	if (copy_to_user(argp, &perf_level_fabric, sizeof(perf_level_fabric)))
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1228  		return -EFAULT;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1229  
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1230  	return 0;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1231  }
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
