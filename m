Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56367314D2B
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767171752; cv=none; b=mUikaItXbz/gndie6Ww8j+XYphaVhpg86lP0pQEAafrwxOJAfgGHh2gbOJ8L5qCIvPwBMgn2r11c0n8Kuu+4HO/haV/OJgT02TbcrobdjfzEfUYV2p97AwmPOD7prhUUrvqw8cbfQm/NeOBnoEXtMEHDvqAHXRXpqHTzo+RQICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767171752; c=relaxed/simple;
	bh=uLQP+HlW1JgiGSrHZbRdRZMzUho+YeANI6/VuX+N/sI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o1v9NA6p/VHnFi3zB84zf+odkvar7qUnO+CNyw18PJhvkoUeNTcp5dwkURJhAlkER+EML02IN1PDQaeu7x8ocX2wCX7gGd3/rTSROzAALl8tJhFyy1DRtOo0fQmG16/PzNVkf32MGrPmfQ05/mkZOGfUjVHYilTNwTc3+Try/XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9nAc4KH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9nAc4KH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767171751; x=1798707751;
  h=date:from:to:cc:subject:message-id;
  bh=uLQP+HlW1JgiGSrHZbRdRZMzUho+YeANI6/VuX+N/sI=;
  b=E9nAc4KHXLFuulDpjDGmWbqpH/cTL1V17M7K22gT2LySmTO09ZhAR/QT
   sg9eMfXVlIcmsQN74F8rX+biIy3og7Ffbddf1kE91GqHO/Jof6xQikDMF
   4OIKKV4KmX1RXBb3wD6MjepRduRINJL+gmuU1Ikx6s4H8oJAHZVwAIyQr
   KwpLoW1+9zrGQT4gHxp8Ud9wyCHj0gjcB5OCSVMFcuVQZf1Oks5ZHWKfj
   ec9B5ayXMUvRl008/kEtsD3gaUsWYOFVcFm28lZNR3hB8yHJ4BybiCep3
   Pnb6eNFCfaKABtRK8SV8TfyfkywJkXlNXE01SS9mVIouMo0xj54wQ8HVB
   Q==;
X-CSE-ConnectionGUID: 9uJkxKc6Q8mfJ6VcjpxlaQ==
X-CSE-MsgGUID: nWRwnVtLSlmVFOt3bIaq8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="67940473"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="67940473"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 01:02:30 -0800
X-CSE-ConnectionGUID: b82vyBUdSYCcyNklDYHmJQ==
X-CSE-MsgGUID: xT7nEM1UR3W7nvi+nr++Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="200608858"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Dec 2025 01:02:28 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vas65-0000000014D-3UHE;
	Wed, 31 Dec 2025 09:02:25 +0000
Date: Wed, 31 Dec 2025 17:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 2/2] mm/huge_memory.c:870
 setup_thp_anon() error: strcpy() 'str' too large for 'str_dup' (1010102 vs
 4096)
Message-ID: <202512311652.9mCXc1ig-lkp@intel.com>
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
head:   ecd8c13eebd9ac39eaa1b45d9fe23ff020c4e68c
commit: dd4d30d1cdbe826e6569b44453c2d9bb9424d234 [2/2] mm: override mTHP "enabled" defaults at kernel cmdline
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 4 months ago
config: i386-randconfig-141-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311652.9mCXc1ig-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512311652.9mCXc1ig-lkp@intel.com/

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
