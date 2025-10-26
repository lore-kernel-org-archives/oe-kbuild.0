Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536412AD3D
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 02:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761445401; cv=none; b=VRYG9YNQOcZhxL5LVSb6q0Xc0AHWN80Uovm52ZuBPu/GJ5V9+YVwoH5nZPo7LOv4Zq2y3/A0v0vxxatZ1ddn/CEiIfMRg0cqew0JUmq7dsC7gMgClTQmpUbid0qb2PxAFUYq/BvbKG8xOZuqg8VHwUfIq4H551P06w++6HCgtLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761445401; c=relaxed/simple;
	bh=I+alMcN0FOHsWV0YmJKOAZGeOAx8bMU/rEd4fWWHP7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dhVkKPFjPg+i9Bx69pKxCyevHPi58mGzJvAgSK9U6lm3y/Pcl6FA6bCz/yGBq9YmSpiP8eBGm9oXoK2ZgRxUT+uNyala/U6QZW9li37bcL/lRQ+5gtIfjPSb9dD2+McJQe78c0I5Qhhv5c2LoyyimpdBE49GfclPLK099sKpH8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jx4lBoz7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jx4lBoz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761445400; x=1792981400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+alMcN0FOHsWV0YmJKOAZGeOAx8bMU/rEd4fWWHP7Y=;
  b=Jx4lBoz7/qeNrhmSKFpQIFtYO1L5R+FBY7+x646CO/QlM5RQNHIb4/9w
   YeXioUns3sOlGywfvYJKQmfI6hBDzJO9Pk9ZoCVwzM12WAArel1DpNrSL
   q0yehvIHMg2GSFy6QgEfz52Hreow23CchuK4dI/CzsjSi+uUxcPPXFJCy
   jDVlOUTv/q2kg+V34QAtw0bVsLeT6JWKisYbcBYCz4rVD5+KxwCP36zMB
   PiYWIz6KZ/xVbmhk6xoAQghSNsLLS3ehr56emSpwTw9XeJU7ERXxav/zV
   paqUKtjkFFwgN+CCQ81GymhhiTdSJbuaUoKXfAbBMBZ9doEO8pgUeFC+k
   w==;
X-CSE-ConnectionGUID: a41SP9bwT7m0zL9bDkI5JQ==
X-CSE-MsgGUID: ceeDZTAcSB+QQj/LbkOPUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63471534"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63471534"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 19:23:19 -0700
X-CSE-ConnectionGUID: EDgWSq9vTdCn7dlIXZKDLg==
X-CSE-MsgGUID: hS8lww5iSPimwvUhlpl+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="188791326"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2025 19:23:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCqPb-000Foj-1w;
	Sun, 26 Oct 2025 02:23:15 +0000
Date: Sun, 26 Oct 2025 10:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-kminext 1/1] posix_timers.c:257:13:
 warning: 'check_sig_ign' defined but not used
Message-ID: <202510261057.CubMnZ3S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8979fee435bfd762771c71f3cf99f6f279038337
commit: 32c1bffe815c9ed746ce7d84cae07da17db6bca4 [1/1] ANDROID: Compile kselftest_timers_posix_timers code
:::::: branch date: 2 days ago
:::::: commit date: 1 year ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510261057.CubMnZ3S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261057.CubMnZ3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261057.CubMnZ3S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   posix_timers.c:399:13: warning: 'check_delete' defined but not used [-Wunused-function]
     399 | static void check_delete(void)
         |             ^~~~~~~~~~~~
   posix_timers.c:343:13: warning: 'check_rearm' defined but not used [-Wunused-function]
     343 | static void check_rearm(void)
         |             ^~~~~~~~~~~
>> posix_timers.c:257:13: warning: 'check_sig_ign' defined but not used [-Wunused-function]
     257 | static void check_sig_ign(int thread)
         |             ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
