Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F445296BCC
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758016428; cv=none; b=A/ChPJPYLllkehKE7ZumVke85H46E5LhgpuQBLTdKmcY8ykOmwmxfOm1tIzDkd2Qs/USINBuR0MvlZXbGatxNzxudNEEQIxwbD6Gni9ZkU9tZ2hooI9uCOTF9K11GrYusqjHR/80ok8cIKckQ4jcWRcxS5Vbxf7fHC401Kd6Onw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758016428; c=relaxed/simple;
	bh=KfZtWy5u9Fw3AhSbXrSufbA4SFred49F+IxyH4dEA2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUk3YkujLwgIIJfTBz+Ey7pdtgHVvEZn7DN3jUmV6y0MYWvjJ2fzpSk6M1OMe6yjvcEB8byuIB+rqoEq1PGDyDpPbWuQWlMhYGoWp0+bF+An/4vwp4EDt9c4gZkWCAu8liGtX85EV+91Rr9l54gUn1dRfUagdv0oHfLEbLKXML8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2vZF02K; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2vZF02K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758016426; x=1789552426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KfZtWy5u9Fw3AhSbXrSufbA4SFred49F+IxyH4dEA2A=;
  b=O2vZF02K6FdF0bj1KT0YdZOXSEFz+wldnYom/TrpfZ+Wo1HNiakE2MkR
   hEMemSfX2yzK5H5ZyxqRM7V1oOcCTeokNXiKeQR14YV0aKiCucvwgrLrl
   kHKRZrvCOP/jBAt0n4JbZ1+7fkFdu/pBLs0PZ2MvlG64BJyCLUUoP3bZF
   fF3i4UkmM8ktEt6TasRfBJSJa72yUcIAFAFzakeoE2duz6aw7eBNKFGz3
   46QTcCTSILaa+n/O8RhtLej2mnx4L/xq5QVUiChhQFlQZzHrH1pWJjXv1
   HA07ojy/5WcIgLotyjKkZxuKn8i8wzvM4H4cjWCF8PcV8cQxRYxA1ZqNk
   A==;
X-CSE-ConnectionGUID: RpnP18FTRIOq7eckz/Q9cw==
X-CSE-MsgGUID: 8S7zbV2NRvuPO1HrCGJQZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60400763"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="60400763"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 02:53:45 -0700
X-CSE-ConnectionGUID: 4yVY1rS/SNmx2sxuzkL7lA==
X-CSE-MsgGUID: QD8LroHFRJyDpZZzbXOOZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="179180933"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Sep 2025 02:53:44 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uySNZ-0000AV-1n;
	Tue, 16 Sep 2025 09:53:41 +0000
Date: Tue, 16 Sep 2025 17:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-desktop 8/8] mm/huge_memory.c:870
 setup_thp_anon() error: strcpy() 'str' too large for 'str_dup' (1010102 vs
 4096)
Message-ID: <202509161704.FwWsVZwj-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   115327fa8ff8da03a62a832e07275a41948e9615
commit: dd4d30d1cdbe826e6569b44453c2d9bb9424d234 [8/8] mm: override mTHP "enabled" defaults at kernel cmdline
:::::: branch date: 16 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161704.FwWsVZwj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509161704.FwWsVZwj-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:870 setup_thp_anon() error: strcpy() 'str' too large for 'str_dup' (1010102 vs 4096)

vim +870 mm/huge_memory.c

dd4d30d1cdbe82 Ryan Roberts 2024-08-14  858  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  859  static char str_dup[PAGE_SIZE] __initdata;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  860  static int __init setup_thp_anon(char *str)
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  861  {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  862  	char *token, *range, *policy, *subtoken;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  863  	unsigned long always, inherit, madvise;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  864  	char *start_size, *end_size;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  865  	int start, end, nr;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  866  	char *p;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  867  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  868  	if (!str || strlen(str) + 1 > PAGE_SIZE)
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  869  		goto err;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14 @870  	strcpy(str_dup, str);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  871  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  872  	always = huge_anon_orders_always;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  873  	madvise = huge_anon_orders_madvise;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  874  	inherit = huge_anon_orders_inherit;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  875  	p = str_dup;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  876  	while ((token = strsep(&p, ";")) != NULL) {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  877  		range = strsep(&token, ":");
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  878  		policy = token;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  879  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  880  		if (!policy)
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  881  			goto err;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  882  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  883  		while ((subtoken = strsep(&range, ",")) != NULL) {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  884  			if (strchr(subtoken, '-')) {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  885  				start_size = strsep(&subtoken, "-");
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  886  				end_size = subtoken;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  887  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  888  				start = get_order_from_str(start_size);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  889  				end = get_order_from_str(end_size);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  890  			} else {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  891  				start = end = get_order_from_str(subtoken);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  892  			}
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  893  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  894  			if (start < 0 || end < 0 || start > end)
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  895  				goto err;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  896  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  897  			nr = end - start + 1;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  898  			if (!strcmp(policy, "always")) {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  899  				bitmap_set(&always, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  900  				bitmap_clear(&inherit, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  901  				bitmap_clear(&madvise, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  902  			} else if (!strcmp(policy, "madvise")) {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  903  				bitmap_set(&madvise, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  904  				bitmap_clear(&inherit, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  905  				bitmap_clear(&always, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  906  			} else if (!strcmp(policy, "inherit")) {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  907  				bitmap_set(&inherit, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  908  				bitmap_clear(&madvise, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  909  				bitmap_clear(&always, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  910  			} else if (!strcmp(policy, "never")) {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  911  				bitmap_clear(&inherit, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  912  				bitmap_clear(&madvise, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  913  				bitmap_clear(&always, start, nr);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  914  			} else {
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  915  				pr_err("invalid policy %s in thp_anon boot parameter\n", policy);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  916  				goto err;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  917  			}
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  918  		}
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  919  	}
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  920  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  921  	huge_anon_orders_always = always;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  922  	huge_anon_orders_madvise = madvise;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  923  	huge_anon_orders_inherit = inherit;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  924  	anon_orders_configured = true;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  925  	return 1;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  926  
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  927  err:
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  928  	pr_warn("thp_anon=%s: error parsing string, ignoring setting\n", str);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  929  	return 0;
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  930  }
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  931  __setup("thp_anon=", setup_thp_anon);
dd4d30d1cdbe82 Ryan Roberts 2024-08-14  932  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
