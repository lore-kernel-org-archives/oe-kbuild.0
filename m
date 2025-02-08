Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037341F17F7
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 16:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032711; cv=none; b=aAXCd3jKl37QsLUfF4DFirXZ9FOVMGwYUqOG7FcX8N63k3N50Xowx32lZoM+6r1VNJDm+vwkOVKA/aFQvbLvM5Ky59aN0DBKGbgKIZke+NZefu7Civ1iR6nzOeQUVYJeIqVEIGu6XjKJR6+fqI+0hDrcjME6G3XWMY5MsEic/g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032711; c=relaxed/simple;
	bh=g/DqCMxFf5QVccLH9umFB59UPNRueCERKX9Gfgwv8MY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nwkLaI+6V+qQKxziWu1ORwPn8Avm9bto5tpAMe/RLYg2MADPr44FekWuYG0YRu1cfUTCylEhl9j08u5oHFgJPu/j/mUkaVy96Zqg27tmyoGsa6Nxl59LCgIv5msMFnqwKBgSHu+G8v9fmtbt8gUuUNOhr+hIYknYktIKcEASyMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f36p482X; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f36p482X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739032709; x=1770568709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/DqCMxFf5QVccLH9umFB59UPNRueCERKX9Gfgwv8MY=;
  b=f36p482XQSx6fruy1hzsoMvZZbUcBHd1mDuxXAVW5YXoLKNtve+g57Wx
   YQr2I9OdYBXJCu6Dj9GD41c59roYXt5L9HIsM9TZG3KDluUxoABze4FZn
   6WvG2avAyyAe+KUmkRV9HC5XgpGPwCNGeBri5pLW/Tt85bsTM/dBvQG3d
   9Y4lkRbPEV715ib6EaCpX9jWZENdHwIfSoOnHtBnZZYS4muHilgPfMfaq
   wUQAWb3qkjmJM1u07PTUkeiDBiRWGsfdqbo/eN6TUEgpiwe05HMG8kwWM
   chpRZHueuobt37OzhoOwyPslzJYYkGeOgu8qXBlMxD0hO39Ep2i4NRBq1
   Q==;
X-CSE-ConnectionGUID: ZiFDBcW6QCqpOIfBre0oSA==
X-CSE-MsgGUID: iZC1fZFSTAiPXMrWKGs6Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27266901"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="27266901"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:38:28 -0800
X-CSE-ConnectionGUID: OskHwWNHTde0rtZBzgJZFg==
X-CSE-MsgGUID: Os3YOL/5QzGmWPXPUslfrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115874767"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Feb 2025 08:38:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgnqa-0010MD-3C;
	Sat, 08 Feb 2025 16:38:24 +0000
Date: Sun, 9 Feb 2025 00:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 1/1] mm/huge_memory.c:870
 setup_thp_anon() error: strcpy() 'str' too large for 'str_dup' (1010102 vs
 4096)
Message-ID: <202502090027.nXiHkDqA-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   c1466c466b6a9bc50df35be1667b892c12a18700
commit: dd4d30d1cdbe826e6569b44453c2d9bb9424d234 [1/1] mm: override mTHP "enabled" defaults at kernel cmdline
:::::: branch date: 25 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090027.nXiHkDqA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502090027.nXiHkDqA-lkp@intel.com/

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
