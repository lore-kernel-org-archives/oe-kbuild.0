Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B8519CCF5
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 05:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934294; cv=none; b=TkXFGtm5Rx+HRtj5NQ3CtW1Y/oE+s14Fvn/B0sprTNG3qyWtozIi2PtjmMNrbDaOtKoh/63+sWZWQeYAAjDHz+OoM//+Ybr0m7GHcsjzh+bDWsmlHihpO6IXOC/hGnaLT6n+lgaG0gyrekkpBMrTMLpFm3dd7NKbP5NZt5TU3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934294; c=relaxed/simple;
	bh=9JHHxO3SDKmFC10KDn3vpl+VsDrNJplj8/4Iv7Nkvdk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cU5tGpC191JVmOjKtcCmwaxUlTjDdou0v3RDjCpma13R6IZlMlQJAwSgG+JHy59Q5QH1hh58h73OU68yTixQzQ4mEsP7FKeAjycwrh9LsMnajafT/od1HciQs3Vkeq6NBixm6+uz2h4Uclw7BkQMU1sGy8st7Wax7HrSBs+cRt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QW0yBk2G; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QW0yBk2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774934292; x=1806470292;
  h=date:from:to:cc:subject:message-id;
  bh=9JHHxO3SDKmFC10KDn3vpl+VsDrNJplj8/4Iv7Nkvdk=;
  b=QW0yBk2G+xc41X9AbgolRkbYpuCJ+kituoOsUyCfTud0lirkLscVmGUY
   Oeczg1HbnEPtcmqovWEzRtFKz+1UQFzYk5cMZsysAzdiMwq0eEdcwf0K5
   7idqT7ozWta6nVLXdaTmO9VPCehsGQq29f4+nJ/bQZa+dfj//4zB02kWC
   VyJYxCfQYiED90iR47JedQkKcrYkUNAKRAzJ7fpSUmqE5CSQCMkmnWmsI
   6mXpssfFhsRByK6+cDdlnjyKKJ6XpXaWIoZC2eTxa/t5VTEZqHnSW9Mac
   p4ZNh//OxC9xjCaOUn4d5tIFijOyA8ZpKhqJs7KV6aKpC+4ZSR7+GV6kW
   Q==;
X-CSE-ConnectionGUID: g/ACvMERQ2K1O0oZEIgebw==
X-CSE-MsgGUID: 9F9WqiR2SKGCOIUkd/KCbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86553389"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86553389"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 22:18:12 -0700
X-CSE-ConnectionGUID: +k/TuZ6oQKONaS6O1lqkHg==
X-CSE-MsgGUID: ODPmuh5RSp6zyduUR0t34w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="223373638"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Mar 2026 22:18:11 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7RUP-000000002Gb-0ke0;
	Tue, 31 Mar 2026 05:18:09 +0000
Date: Tue, 31 Mar 2026 13:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 1/1] lib/math/div64.c:219:25:
 sparse: sparse: division by zero
Message-ID: <202603311319.fcJIVYvA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/math/div64.c:219:25: sparse: sparse: division by zero"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c9dd6d939a0d4c818436b4f27e08d48e330fc6c4
commit: 1635e62e75a7bbb1c6274f6b43911cedfe0da60a [1/1] mul_u64_u64_div_u64: basic sanity test
:::::: branch date: 10 hours ago
:::::: commit date: 1 year, 7 months ago
config: i386-randconfig-r112-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311319.fcJIVYvA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311319.fcJIVYvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603311319.fcJIVYvA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/math/div64.c:219:25: sparse: sparse: division by zero

vim +219 lib/math/div64.c

b29a62d87cc0af Nicolas Pitre 2024-07-07  214  
1635e62e75a7bb Nicolas Pitre 2024-07-07  215  	/* make sure c is not zero, trigger exception otherwise */
1635e62e75a7bb Nicolas Pitre 2024-07-07  216  #pragma GCC diagnostic push
1635e62e75a7bb Nicolas Pitre 2024-07-07  217  #pragma GCC diagnostic ignored "-Wdiv-by-zero"
1635e62e75a7bb Nicolas Pitre 2024-07-07  218  	if (unlikely(c == 0))
1635e62e75a7bb Nicolas Pitre 2024-07-07 @219  		return 1/0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
