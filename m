Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42412269B1C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 06:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641915; cv=none; b=q7Rh78cPo06c+f1kyZlyF+lAHLfS1PNw7xgUEtb9ylHZAP+fbMcLeSsNCNRZHRSpsVSdIuEJIoD6tJ2Mi4WbKPop6mjI6G7FhbfvQADOkPYKlv0jJ8PG+qJZWGlUvhMuYoHRhTjbExwz88qHfCIEabSpalIFaIUmc5BWKihRvig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641915; c=relaxed/simple;
	bh=jMf6jbLKU8lxdxrZ20XBv8B/Gvbq5+qt/a58oeK0rKM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=goZezXobzgNRE46HpN8c83Bb9KAbX2ayTL8WzR8080ReWfWl1vzV8M+k49UWkaRWYPgCDY4/sbob9K0qvLX0Ufb9bboHZNREqRZLUU9L7dJYXSWMUaWim9kCpjacH+kKOkIqMAj7e+0HHoXOPZd7eERjP+ftrfoqvk/R0v9qz3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXZNop0J; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXZNop0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773641913; x=1805177913;
  h=date:from:to:cc:subject:message-id;
  bh=jMf6jbLKU8lxdxrZ20XBv8B/Gvbq5+qt/a58oeK0rKM=;
  b=fXZNop0J/2UC8qOEKD4gjg7M7z0/DcE7tVm2d3mI0JNE6uzbuYXuGTFf
   i45M5uIdMI5H84I8nZgyWCDlF47ZvFcp0sI2JkDP0UaViSuaQzKfCQM/t
   o9TKnS8bDWn2azv+B9FinC2NgpYHS20pr/MB7wzmUxXlgwidwhblXFQMz
   YkX0W9Ifb8LtwwhQygZONAFOcLNgLsutnbMO37MMf0FGpvOb2kcBYeWB2
   henjfGcpIUtNxFSy1oX3+aOcTOGqkIqQNyIz9ZYuKz7f8tMgGsjeU3W/u
   2ijTvKQChh5eXjlyGmksgDDAvADlAupqpcjykbU8ZKC2dySUIIaPlTIqn
   A==;
X-CSE-ConnectionGUID: E4B6DwoZTe25h5BkCtY5xg==
X-CSE-MsgGUID: 9NwYvFMGTaW1YEB5gyrnXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74568497"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="74568497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 23:18:33 -0700
X-CSE-ConnectionGUID: nAhDax0rSIuqEoRhY07ssg==
X-CSE-MsgGUID: cQ3eRTSRR36haoRYhSJdEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="226483501"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Mar 2026 23:18:31 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w21HZ-000000000BS-0M2J;
	Mon, 16 Mar 2026 06:18:29 +0000
Date: Mon, 16 Mar 2026 14:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/sdca/sdca_functions.c:2083 find_sdca_filesets()
 warn: potentially one past the end of array 'fileset_entries[j]'
Message-ID: <202603161443.vpLcJr2M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
commit: c4d096c3ca425562192a3626c30e82651d0f2c1c ASoC: SDCA: Add SDCA FDL data parsing
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161443.vpLcJr2M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603161443.vpLcJr2M-lkp@intel.com/

smatch warnings:
sound/soc/sdca/sdca_functions.c:2083 find_sdca_filesets() warn: potentially one past the end of array 'fileset_entries[j]'
sound/soc/sdca/sdca_functions.c:2083 find_sdca_filesets() warn: potentially one past the end of array 'fileset_entries[j]'

vim +2083 sound/soc/sdca/sdca_functions.c

f87c2a27503312 Charles Keepax 2025-02-05  2012  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2013  static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
c4d096c3ca4255 Maciej Strozek 2025-10-20  2014  			      struct fwnode_handle *function_node,
c4d096c3ca4255 Maciej Strozek 2025-10-20  2015  			      struct sdca_function_data *function)
c4d096c3ca4255 Maciej Strozek 2025-10-20  2016  {
c4d096c3ca4255 Maciej Strozek 2025-10-20  2017  	static const int mult_fileset = 3;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2018  	char fileset_name[SDCA_PROPERTY_LENGTH];
c4d096c3ca4255 Maciej Strozek 2025-10-20  2019  	u32 *filesets_list __free(kfree) = NULL;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2020  	struct sdca_fdl_set *sets;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2021  	int num_sets;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2022  	int i, j;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2023  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2024  	num_sets = fwnode_property_count_u32(function_node,
c4d096c3ca4255 Maciej Strozek 2025-10-20  2025  					     "mipi-sdca-file-set-id-list");
c4d096c3ca4255 Maciej Strozek 2025-10-20  2026  	if (num_sets == 0 || num_sets == -EINVAL) {
c4d096c3ca4255 Maciej Strozek 2025-10-20  2027  		return 0;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2028  	} else if (num_sets < 0) {
c4d096c3ca4255 Maciej Strozek 2025-10-20  2029  		dev_err(dev, "%pfwP: failed to read file set list: %d\n",
c4d096c3ca4255 Maciej Strozek 2025-10-20  2030  			function_node, num_sets);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2031  		return num_sets;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2032  	}
c4d096c3ca4255 Maciej Strozek 2025-10-20  2033  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2034  	filesets_list = kcalloc(num_sets, sizeof(u32), GFP_KERNEL);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2035  	if (!filesets_list)
c4d096c3ca4255 Maciej Strozek 2025-10-20  2036  		return -ENOMEM;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2037  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2038  	fwnode_property_read_u32_array(function_node, "mipi-sdca-file-set-id-list",
c4d096c3ca4255 Maciej Strozek 2025-10-20  2039  				       filesets_list, num_sets);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2040  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2041  	sets = devm_kcalloc(dev, num_sets, sizeof(struct sdca_fdl_set), GFP_KERNEL);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2042  	if (!sets)
c4d096c3ca4255 Maciej Strozek 2025-10-20  2043  		return -ENOMEM;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2044  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2045  	for (i = 0; i < num_sets; i++) {
c4d096c3ca4255 Maciej Strozek 2025-10-20  2046  		u32 *fileset_entries __free(kfree) = NULL;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2047  		struct sdca_fdl_set *set = &sets[i];
c4d096c3ca4255 Maciej Strozek 2025-10-20  2048  		struct sdca_fdl_file *files;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2049  		int num_files, num_entries;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2050  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2051  		snprintf(fileset_name, sizeof(fileset_name),
c4d096c3ca4255 Maciej Strozek 2025-10-20  2052  			 "mipi-sdca-file-set-id-0x%X", filesets_list[i]);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2053  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2054  		num_entries = fwnode_property_count_u32(function_node, fileset_name);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2055  		if (num_entries <= 0) {
c4d096c3ca4255 Maciej Strozek 2025-10-20  2056  			dev_err(dev, "%pfwP: file set %d missing entries: %d\n",
c4d096c3ca4255 Maciej Strozek 2025-10-20  2057  				function_node, filesets_list[i], num_entries);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2058  			return -EINVAL;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2059  		} else if (num_entries % mult_fileset != 0) {
c4d096c3ca4255 Maciej Strozek 2025-10-20  2060  			dev_err(dev, "%pfwP: file set %d files not multiple of %d\n",
c4d096c3ca4255 Maciej Strozek 2025-10-20  2061  				function_node, filesets_list[i], mult_fileset);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2062  			return -EINVAL;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2063  		}
c4d096c3ca4255 Maciej Strozek 2025-10-20  2064  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2065  		dev_info(dev, "fileset: %#x\n", filesets_list[i]);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2066  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2067  		files = devm_kcalloc(dev, num_entries / mult_fileset,
c4d096c3ca4255 Maciej Strozek 2025-10-20  2068  				     sizeof(struct sdca_fdl_file), GFP_KERNEL);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2069  		if (!files)
c4d096c3ca4255 Maciej Strozek 2025-10-20  2070  			return -ENOMEM;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2071  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2072  		fileset_entries = kcalloc(num_entries, sizeof(u32), GFP_KERNEL);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2073  		if (!fileset_entries)
c4d096c3ca4255 Maciej Strozek 2025-10-20  2074  			return -ENOMEM;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2075  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2076  		fwnode_property_read_u32_array(function_node, fileset_name,
c4d096c3ca4255 Maciej Strozek 2025-10-20  2077  					       fileset_entries, num_entries);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2078  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2079  		for (j = 0, num_files = 0; j < num_entries; num_files++) {
c4d096c3ca4255 Maciej Strozek 2025-10-20  2080  			struct sdca_fdl_file *file = &files[num_files];
c4d096c3ca4255 Maciej Strozek 2025-10-20  2081  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2082  			file->vendor_id = fileset_entries[j++];
c4d096c3ca4255 Maciej Strozek 2025-10-20 @2083  			file->file_id = fileset_entries[j++];
c4d096c3ca4255 Maciej Strozek 2025-10-20  2084  			file->fdl_offset = fileset_entries[j++];
c4d096c3ca4255 Maciej Strozek 2025-10-20  2085  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2086  			dev_info(dev, "file: %#x, vendor: %#x, offset: %#x\n",
c4d096c3ca4255 Maciej Strozek 2025-10-20  2087  				 file->file_id, file->vendor_id, file->fdl_offset);
c4d096c3ca4255 Maciej Strozek 2025-10-20  2088  		}
c4d096c3ca4255 Maciej Strozek 2025-10-20  2089  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2090  		set->id = filesets_list[i];
c4d096c3ca4255 Maciej Strozek 2025-10-20  2091  		set->num_files = num_files;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2092  		set->files = files;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2093  	}
c4d096c3ca4255 Maciej Strozek 2025-10-20  2094  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2095  	function->fdl_data.swft = sdw->sdca_data.swft;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2096  	function->fdl_data.num_sets = num_sets;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2097  	function->fdl_data.sets = sets;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2098  
c4d096c3ca4255 Maciej Strozek 2025-10-20  2099  	return 0;
c4d096c3ca4255 Maciej Strozek 2025-10-20  2100  }
c4d096c3ca4255 Maciej Strozek 2025-10-20  2101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
