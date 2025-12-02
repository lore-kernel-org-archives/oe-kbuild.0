Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE0630596A
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664877; cv=none; b=IRYrVe4zciJNKPbFkcOLyXoA/5j0pyj/2wYiWbF4HIXm3pYNCqixLUHH9mjsk0SrFQ/bN0UQmy/Cm7xksvvrLCVw0y6Cjf0N47Uz41KZJS+4Yxbn1wk3BvSTFd08lPaSLNTWOyc3G7g9bOACEmNJn9EblNion963uO+8aotCTDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664877; c=relaxed/simple;
	bh=rvwKRB0lcrsNljotBi5vgzgEUEjQz4QZlShcvpGuFUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mSUrv4pj48XJ3nSgcralDTlvJUEkpGumsIkHyWGExnFKJs5VPdP2lXAJlRMi4GyyYCWbQVBuoO18Uvrms03zA2wWQqiALk1UPcdlIlBXTEgHNStt4UidR3Lq6PUR01ZbZLmghYy4G8Rz7thjEbwR1AuLVPnZCEuGU+eEiy0WA6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV1ph1Ut; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV1ph1Ut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764664876; x=1796200876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rvwKRB0lcrsNljotBi5vgzgEUEjQz4QZlShcvpGuFUs=;
  b=lV1ph1UtynV6O6XYFWsYYpRGi6Q5S9mtLxHWgo5gPrqyzY2hYkLJJ/1a
   6oWjWDMAvmoZ6DVNuLrw8anu3eSOS5tKuVY8BDgpwuz/z4lPmJZ7YjEcN
   E6vdB4uwQ/PoKOfDRhVTfpLeED8Hcun/wXdqjzT5p8JFMJwM5AGXNNC6I
   EGJuT3GR9s9nYwNNDKZAIHQDLjVYHdQCvKI2hEFZe6GoH2edO481XlkdI
   HpGCMgB/e/2eTQw0LjBcHQ7l1cq1+mlsi1dSK45TubtfHeI3xMN3NMynH
   N5628Z5Nii5PE29+9voLGJjRZ7qSm7D4gn2y4yJTC+aJgsmxgUH/jM2yB
   g==;
X-CSE-ConnectionGUID: Z2CTy1z3SQabfvoNZD+N9A==
X-CSE-MsgGUID: 1Rp6fsfgQjKcwLFF486vbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66661816"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66661816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 00:41:11 -0800
X-CSE-ConnectionGUID: +NpeKO+8Qc6ATD2vvFhy1Q==
X-CSE-MsgGUID: aX2wUIytS3qCe6Nd3QmAQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="198782183"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Dec 2025 00:41:10 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQLwa-000000009bA-02zS;
	Tue, 02 Dec 2025 08:41:08 +0000
Date: Tue, 2 Dec 2025 16:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3326/13055] sound/soc/sdca/sdca_functions.c:2083
 find_sdca_filesets() warn: potentially one past the end of array
 'fileset_entries[j]'
Message-ID: <202512021614.38Nek8Pk-lkp@intel.com>
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
TO: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: c4d096c3ca425562192a3626c30e82651d0f2c1c [3326/13055] ASoC: SDCA: Add SDCA FDL data parsing
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-141-20251202 (https://download.01.org/0day-ci/archive/20251202/202512021614.38Nek8Pk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512021614.38Nek8Pk-lkp@intel.com/

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
