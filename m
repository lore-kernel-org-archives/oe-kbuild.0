Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2E33033E7
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311937; cv=none; b=sHqnfzPl2ZSbgfzGSytgCKyakvBIETsdSlGnTzxyFfjUX4dDROudWx383q4DXwMeWtFHXE4APV4xn7skx9Cn9L3evfA3ntSSmhAP8a3TM4sOXCNcweipTJT+36SiOxFb2OmBdw63G9utmYlvf+t2ODIjYLQ2Y+CsXWrgbZT49G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311937; c=relaxed/simple;
	bh=rP6SyRLkxiAH3tqx3d4wXhkrPY1oQhbFCVHthpMxMes=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TcwJuzjeiFEUBb9BJ9AxDFDowesVZqtljDeldCWYefYBdhObmMiTpKbHGme+IcK1ItslREzhX7G8viUVwhLb5Ge3ijTx+XKbowvMhkd0RoUp29ZKM/TqSU0PYbOkjwzLH9+GaWEW15ikpOcML+cIml0oYRtLuZ3av/K6EUmorRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YF0VtR4a; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YF0VtR4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785311935; x=1816847935;
  h=date:from:to:cc:subject:message-id;
  bh=rP6SyRLkxiAH3tqx3d4wXhkrPY1oQhbFCVHthpMxMes=;
  b=YF0VtR4aHzgoyal+QlHzeGaOtXyX7+Jof3lGAoRrhhFwsQWxuADEh7VU
   SfbGKshUYfwBhAzx6e+32uh4MpMxr381ffEEzl5IXCCZ4/3eNOcDCHXJ/
   e//xzvdYOebNedGkhwCBQI+jtdFecACxwL8t4/MZDmG1o48LcCmxo/icA
   tnAAmn34QYkrxSJ/yraHVIo6hiap9TM5HBdmktdgXRQxpFvWPvRsBhdSg
   dToHj85p02CkrgQiKqk2oP5CyZi+UUTDNd/W5NrNpJJfyvSePSKf+UouP
   5yqs1qfcEDjyoW/Ul3thaS8AP/kR5iuhI8Z9b3raVIxc/oYG6RGQAQru1
   w==;
X-CSE-ConnectionGUID: xbG4FSTiQOu1lFOZp7TzZg==
X-CSE-MsgGUID: qo6RKn/ASpeotgnyETp/JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86101564"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="86101564"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 00:58:55 -0700
X-CSE-ConnectionGUID: LYbp80KoSf6W5in2b2QrXA==
X-CSE-MsgGUID: 7ruEPQokSyKWghtH8+AnFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="263434725"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Jul 2026 00:58:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wozBT-00000000fAN-26fx;
	Wed, 29 Jul 2026 07:58:38 +0000
Date: Wed, 29 Jul 2026 15:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/wireless/util.c:3087:6: warning: no previous prototype
 for function 'cfg80211_validate_ies'
Message-ID: <202607291550.vB2j4bbW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Deepanshu-Kartikey/wifi-cfg80211-add-cfg80211_validate_ies-helper-and-use-it/20260729-101807, commit: 9f00c96249f6b1cad035a9ece55d6a199cf08cbf"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Deepanshu Kartikey <kartikey406@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Deepanshu-Kartikey/wifi-cfg80211-add-cfg80211_validate_ies-helper-and-use-it/20260729-101807
head:   9f00c96249f6b1cad035a9ece55d6a199cf08cbf
commit: 9f00c96249f6b1cad035a9ece55d6a199cf08cbf wifi: cfg80211: add cfg80211_validate_ies() helper and use it
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20260729/202607291550.vB2j4bbW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291550.vB2j4bbW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607291550.vB2j4bbW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/wireless/util.c:3087:6: warning: no previous prototype for function 'cfg80211_validate_ies' [-Wmissing-prototypes]
    3087 | bool cfg80211_validate_ies(const u8 *data, int len)
         |      ^
   net/wireless/util.c:3087:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3087 | bool cfg80211_validate_ies(const u8 *data, int len)
         | ^
         | static 
   1 warning generated.


vim +/cfg80211_validate_ies +3087 net/wireless/util.c

9f00c96249f6b1 Deepanshu Kartikey 2026-07-29  3086  
9f00c96249f6b1 Deepanshu Kartikey 2026-07-29 @3087  bool cfg80211_validate_ies(const u8 *data, int len)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
