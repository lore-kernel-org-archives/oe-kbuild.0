Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B43264C1
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776440883; cv=none; b=jpXvWE9OR2VKtAzY0MFpyR6X4QnQXmD1GSQou40CqUxP7EklZmfDtUj4LfMgFPi1aRwsxIdUFBY8XiP7/b9mXu/4NZR5svthnHn7223rj+AZqLVE9M9yV7OxnpN8grVaEpqTk/4eEoF5YbjfJTZZ+oBhdlIBEJCOEx4YJfvG27s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776440883; c=relaxed/simple;
	bh=HXdF4saU7p0wY75AkCim/gwFSzBZdefenIpSBqqSYHw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rhtDa1erxf2gqC3M2RyCwascmTJvqjHvGpDHX+An/MixG8Ad/qs4IeKpj+Fx/5HWZUuQZubbu1x3gflQIBjDXoawNslzmTD1IhWVKPOnUNbw25RqjT83BS8p2RdvP/CaSynPQk79kcx1Hu6OiQhtjvmLY8x1ZeiO/D8ko5QiM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+S/tjIL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+S/tjIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776440881; x=1807976881;
  h=date:from:to:cc:subject:message-id;
  bh=HXdF4saU7p0wY75AkCim/gwFSzBZdefenIpSBqqSYHw=;
  b=O+S/tjILRY5Byg1RY58TNg+KJhPeN6JSk5ZXKOGao3ixe1M5V5K2qG9Z
   N1JcuRv0g9qfWXF6jC1XLPMrwfsZvXmeWloZTHDjtaB842sZwHq2HL2z2
   V05z4abH5BxZXV41d4wTMFiyUFS4HjrRtJZqgDt0Co7rP7PJDIJF+ZmkF
   m//aQfRJbAKLovTy/15Ju3B7TkCLFEtlHLhc5Qe8vLxPFuscMG2/iZSr+
   Wn1oL951Xks66qfTQ6n+ZwYj+0Ji+rK8XgX7YU3eE3OUpn8tOMZPxzRVZ
   jOtzrRTNRee6Mx/3I8UquItjh1exj53fVXeB/c6QvMwv37ecr9TOL2Lzm
   A==;
X-CSE-ConnectionGUID: NFmmuRVjRYyv6begt5kW5g==
X-CSE-MsgGUID: 4z5PogrrSl+CKx286/hwdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="80044663"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="80044663"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 08:48:00 -0700
X-CSE-ConnectionGUID: o93ZwE7MRd20Cc5QT5KGKA==
X-CSE-MsgGUID: gg66Yw2hQ4CaV2sxOGPZCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230062612"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2026 08:47:59 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDlQC-000000000Uy-2Qh7;
	Fri, 17 Apr 2026 15:47:56 +0000
Date: Fri, 17 Apr 2026 23:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 12/12] mm/huge_memory.c:870
 setup_thp_anon() error: strcpy() 'str' too large for 'str_dup' (1010102 vs
 4096)
Message-ID: <202604172301.BjklOrxy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   a0dc3e7a8eb4134e53b2dddfd9a916398a3f88ef
commit: dd4d30d1cdbe826e6569b44453c2d9bb9424d234 [12/12] mm: override mTHP "enabled" defaults at kernel cmdline
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 7 months ago
config: x86_64-randconfig-161-20260416 (https://download.01.org/0day-ci/archive/20260417/202604172301.BjklOrxy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dd4d30d1cdbe ("mm: override mTHP "enabled" defaults at kernel cmdline")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604172301.BjklOrxy-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:870 setup_thp_anon() error: strcpy() 'str' too large for 'str_dup' (1010102 vs 4096)

vim +870 mm/huge_memory.c

dd4d30d1cdbe826 Ryan Roberts 2024-08-14  858  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  859  static char str_dup[PAGE_SIZE] __initdata;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  860  static int __init setup_thp_anon(char *str)
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  861  {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  862  	char *token, *range, *policy, *subtoken;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  863  	unsigned long always, inherit, madvise;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  864  	char *start_size, *end_size;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  865  	int start, end, nr;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  866  	char *p;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  867  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  868  	if (!str || strlen(str) + 1 > PAGE_SIZE)
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  869  		goto err;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14 @870  	strcpy(str_dup, str);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  871  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  872  	always = huge_anon_orders_always;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  873  	madvise = huge_anon_orders_madvise;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  874  	inherit = huge_anon_orders_inherit;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  875  	p = str_dup;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  876  	while ((token = strsep(&p, ";")) != NULL) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  877  		range = strsep(&token, ":");
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  878  		policy = token;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  879  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  880  		if (!policy)
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  881  			goto err;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  882  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  883  		while ((subtoken = strsep(&range, ",")) != NULL) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  884  			if (strchr(subtoken, '-')) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  885  				start_size = strsep(&subtoken, "-");
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  886  				end_size = subtoken;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  887  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  888  				start = get_order_from_str(start_size);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  889  				end = get_order_from_str(end_size);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  890  			} else {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  891  				start = end = get_order_from_str(subtoken);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  892  			}
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  893  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  894  			if (start < 0 || end < 0 || start > end)
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  895  				goto err;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  896  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  897  			nr = end - start + 1;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  898  			if (!strcmp(policy, "always")) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  899  				bitmap_set(&always, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  900  				bitmap_clear(&inherit, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  901  				bitmap_clear(&madvise, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  902  			} else if (!strcmp(policy, "madvise")) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  903  				bitmap_set(&madvise, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  904  				bitmap_clear(&inherit, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  905  				bitmap_clear(&always, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  906  			} else if (!strcmp(policy, "inherit")) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  907  				bitmap_set(&inherit, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  908  				bitmap_clear(&madvise, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  909  				bitmap_clear(&always, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  910  			} else if (!strcmp(policy, "never")) {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  911  				bitmap_clear(&inherit, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  912  				bitmap_clear(&madvise, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  913  				bitmap_clear(&always, start, nr);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  914  			} else {
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  915  				pr_err("invalid policy %s in thp_anon boot parameter\n", policy);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  916  				goto err;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  917  			}
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  918  		}
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  919  	}
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  920  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  921  	huge_anon_orders_always = always;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  922  	huge_anon_orders_madvise = madvise;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  923  	huge_anon_orders_inherit = inherit;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  924  	anon_orders_configured = true;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  925  	return 1;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  926  
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  927  err:
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  928  	pr_warn("thp_anon=%s: error parsing string, ignoring setting\n", str);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  929  	return 0;
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  930  }
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  931  __setup("thp_anon=", setup_thp_anon);
dd4d30d1cdbe826 Ryan Roberts 2024-08-14  932  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
