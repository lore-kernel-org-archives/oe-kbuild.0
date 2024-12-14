Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8DE26AFF
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734195076; cv=none; b=Wmjrt+2PBWBT6segpWkmpdj/ixBflgsDz/JHmayObdxspx7Y4g9r6h32zrwClhauYdkefyCykXrfm7VuLhAFyjhJEwNDQFu/dFdNg+ISbpSNh4VKIrod621W1PIGiF3SRy5DJfjmNNVl7zS2T69Zh2yA4L91Vw86245bm57zavI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734195076; c=relaxed/simple;
	bh=SPdj5WzWxFoQqxED9/dmi6yY09ty4UpY6pgTtYJC2Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CMV9MWcM68ijBEFpTTLw71uLda+zeS3MwsLIFNGPD+rGfYW5ufOtbys+LvfoXbzv4L8rU4vplkHACrdi9VFFoEs2TrJWH8WTl6CFyjkmjKV6jajM1rSC3yyCuaCv9Qe457B7qaZUwDIEDdzfvqT+TN4OyApN2OANO67CGeaPF9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ufu0Xjbu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ufu0Xjbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734195074; x=1765731074;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SPdj5WzWxFoQqxED9/dmi6yY09ty4UpY6pgTtYJC2Z8=;
  b=Ufu0XjbuNtcORtytiK3F1sFmoW05eFdEydBu38ogI/Rl2+SAGzFy6gdI
   kezBJVtli7XHGhI0iP8oLOrEYTmv+60FZATErTMP+LKtLtCTUw4aQgwDv
   NYaO1clq4jjeh/qxPwDe0k2fQy6W8aaGWCUFCQ0VnrdgZnQadxhW8EwYg
   Z70bSGQeYzNJkOYoOE2H4waUxwqgCzmRS7GKC0RAAZXz5Gfk6u15J4zRP
   MWq04DHKOzlh+Al316ygWg2oxDZsjigyq0zMWnPWlLmtiL5ZhgtvQkHTZ
   dQ5ZD1SojqWIsxx+0LE01OrzI0KnHEGbp0ATUPr7wLnYsUjlC48xKsFun
   w==;
X-CSE-ConnectionGUID: 1juOOTSNScmaWTyWr3ajzg==
X-CSE-MsgGUID: tuiJL42ETp+j09w3T+ap+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34780696"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34780696"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 08:51:13 -0800
X-CSE-ConnectionGUID: khJaw3kiRYGO2mPnYyOgdA==
X-CSE-MsgGUID: z+b5wyi8SfGsLNy1jTZaCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="127632886"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2024 08:51:13 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMVMD-000D57-36;
	Sat, 14 Dec 2024 16:51:09 +0000
Date: Sun, 15 Dec 2024 00:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/via/via-velocity.c:3615 velocity_get_strings()
 error: __builtin_memcpy() '*velocity_gstrings' too small (32 vs 1024)
Message-ID: <202412150045.roY0gOfb-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Andrey Konovalov <andreyknvl@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a446e965a188ee8f745859e63ce046fe98577d45
commit: 2e577732e8d28b9183df701fb90cb7943aa4ed16 kasan, fortify: properly rename memintrinsics
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20241212 (https://download.01.org/0day-ci/archive/20241215/202412150045.roY0gOfb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150045.roY0gOfb-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/via/via-velocity.c:3615 velocity_get_strings() error: __builtin_memcpy() '*velocity_gstrings' too small (32 vs 1024)

vim +3615 drivers/net/ethernet/via/via-velocity.c

ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3610  
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3611  static void velocity_get_strings(struct net_device *dev, u32 sset, u8 *data)
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3612  {
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3613  	switch (sset) {
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3614  	case ETH_SS_STATS:
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04 @3615  		memcpy(data, *velocity_gstrings, sizeof(velocity_gstrings));
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3616  		break;
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3617  	}
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3618  }
ad66fa7a704f179 drivers/net/via-velocity.c françois romieu 2011-08-04  3619  

:::::: The code at line 3615 was first introduced by commit
:::::: ad66fa7a704f179fd3f88dece544e2d18078860f via-velocity : ethtool statistics support.

:::::: TO: françois romieu <romieu@fr.zoreil.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
