Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E9E204C35
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736459369; cv=none; b=Ju7y2XKbvmMVm+8C9qpZLjTeaHYpjU4IhrSwvLS8s02UGnq8jAFdKAoUaIXkjheq8+82kgnwNXp7PNTh+P9th2QnuebGlWWIHc4Xl06aTQUIKIzj65yBp0jkzF76osXC2WVKw5NM28EZfKwRNgzvQH1b+d61E7AvjR12ELdr5/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736459369; c=relaxed/simple;
	bh=quphlllwMktUzspSHEJD29P14Rv1xhIHAAsqoOcD9NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GsGnVy4X/nOF//4EuXSzRlVDU4LKADqE3AeZEiyLrI20FXOZJsoFxjhZSfewfs6ipyBBi4Qxgd/FNV7d3geLRhA9JInfq7vUbbOYwml61rUfeMfGGqMa+W9ecHKKApd5uPEmdY1WJ9tMVE6Oc20RcxzW3qwomhKuL70CATG18Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvlU4cO7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvlU4cO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736459368; x=1767995368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=quphlllwMktUzspSHEJD29P14Rv1xhIHAAsqoOcD9NQ=;
  b=UvlU4cO7rBzHkQLt0XSBumYaRLqOp1yGJJlR3DlpgkhMvcsMgDsNx4yN
   lJ9z0xcc4UFyZHxtrqOBHDNwDY6KQEsAd0Gro/E4clTiBSDP4KWL5VBVe
   XAwHELNhL80iQ0enKIG2RIjwh8VhwU8udKvpJlZNJY4RhMOmmaDAVSfz4
   UtG6jlqOEyVIkM0v5IWpjqPfXL11ZJuso8oTIbGNaWJWRwNQFcaL8IHCy
   nijELX1WC6qjhdkmQonFhX4UTtpqCFBQIQjKBR6rpRJ7swGzzGbsWFyff
   tZgNhwrRKr944wqDlIjYfYfTq5OK7LeqIB/HQFUQ7bssMBYERNGloGFvm
   w==;
X-CSE-ConnectionGUID: ah0/ErQaSuS0D69hzEnqIA==
X-CSE-MsgGUID: OliAoZouSQqWD//TyCUoNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40423009"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="40423009"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 13:49:28 -0800
X-CSE-ConnectionGUID: uvktilpAS8a+Ud8MepJrxw==
X-CSE-MsgGUID: zVdVZdyOSXmjcKg+oi5U3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="103338831"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2025 13:49:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW0P5-000IAx-2o;
	Thu, 09 Jan 2025 21:49:23 +0000
Date: Fri, 10 Jan 2025 05:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [gourryinverse:gourry_pagecache 6/6] mm/memory-tiers.c:966:5-37:
 opportunity for str_true_false(numa_pagecache_promotion_enabled)
Message-ID: <202501100504.6KEAUDM0-lkp@intel.com>
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
CC: Gregory Price <gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   0dbf11611a077d53392bef0f60d29bcf49d562b0
commit: 0dbf11611a077d53392bef0f60d29bcf49d562b0 [6/6] migrate,sysfs: add pagecache promotion
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: powerpc64-randconfig-r062-20250110 (https://download.01.org/0day-ci/archive/20250110/202501100504.6KEAUDM0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501100504.6KEAUDM0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/memory-tiers.c:966:5-37: opportunity for str_true_false(numa_pagecache_promotion_enabled)

vim +966 mm/memory-tiers.c

91952440227889 Aneesh Kumar K.V 2022-08-18  960  
0dbf11611a077d Gregory Price    2024-08-05  961  static ssize_t pagecache_promotion_enabled_show(struct kobject *kobj,
0dbf11611a077d Gregory Price    2024-08-05  962  						struct kobj_attribute *attr,
0dbf11611a077d Gregory Price    2024-08-05  963  						char *buf)
0dbf11611a077d Gregory Price    2024-08-05  964  {
0dbf11611a077d Gregory Price    2024-08-05  965  	return sysfs_emit(buf, "%s\n",
0dbf11611a077d Gregory Price    2024-08-05 @966  			  numa_pagecache_promotion_enabled ? "true" : "false");
0dbf11611a077d Gregory Price    2024-08-05  967  }
0dbf11611a077d Gregory Price    2024-08-05  968  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
