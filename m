Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934387D098
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 05:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764136792; cv=none; b=bQ7VrKf1pftzIPHaMDur9LMfS/QoLi0Rr357RFAVasc6CPXtSv6ECh/ghpU3+XtiFP/ifst4R6dKefMIpVYUzVZEsz0nkTVNtlg9UHN1iPiUZzvgRyo80+ZV446LFfWhTHPY2ifCIXlOrKur0dol8KH1uogrc2IjSyz9+Z8xMcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764136792; c=relaxed/simple;
	bh=MeUK2foKU/U0J8/UP07E4CNaegWEovBVknilrXaqVIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/J02VcSroqlmNp+59BdpxbPwnjq+DoD1Y04bJ/hG6jfzkPmYPRnwBqfSJxEwioVcYk9pTvSMHgk6pVyPlLrz3F4FdeJn0g5M3YozlJkJENOqKJCvd772pELgaWODDn9oHu4GD4Gu8twYpGNIHdSxH3JUbL+CRZ8QlxEtsDOi+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLHsUyNK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLHsUyNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764136791; x=1795672791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MeUK2foKU/U0J8/UP07E4CNaegWEovBVknilrXaqVIw=;
  b=BLHsUyNKbgVsif+1HIwyQwDX9g0rt3zt8v8qM0/Hd6PnG42PVlEAHS4o
   UmkCgQu8wFOeX/uUc4d0hC30i3BxCVoTLXno1E7CWa2DfucT1keBkp8yG
   U2CTAjJFQBZrPWolkjadYQnRbO53WGITua/aSyfzi36Ffp7bkPOrH4Vx5
   FWYNg6CncRmhlhjoKO0OQWSa4CARTCAfOF1NnRlGckOmIrwxDuFd3D+7k
   0TgbIcrQppPxEAnL6pPZTuZE1Ir8gux5dUBlw5fsTW3lxdpKR6dHUiPIR
   obxpFbjsNgmPwaKQuSSj4vLVnP6WMgcLeMv5+8GOOpQ8iEzFh3yBgNJbB
   w==;
X-CSE-ConnectionGUID: WZOgq6AxSKCF3wLmKrRzzA==
X-CSE-MsgGUID: 9mr2U2WcQMCpyUtoq5fc+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65168314"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="65168314"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 21:59:50 -0800
X-CSE-ConnectionGUID: pmqq5+IDR9a24ZdmbbE1vw==
X-CSE-MsgGUID: Ngx3MKGMTAqnvMC0tV9U4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="193280349"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2025 21:59:49 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO8Z9-000000000eX-0qOM;
	Wed, 26 Nov 2025 05:59:47 +0000
Date: Wed, 26 Nov 2025 06:59:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5] aperf.c:58:9: warning: 'ftime' is
 deprecated: Use gettimeofday or clock_gettime instead
Message-ID: <202511260656.Q9gzUBBW-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: 281b93e42e402a1c8368057b84861e1310e64fa3 [5/5] selftests/intel_pstate: fix build for ARCH=x86_64
:::::: branch date: 2 days ago
:::::: commit date: 3 years ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251126/202511260656.Q9gzUBBW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260656.Q9gzUBBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511260656.Q9gzUBBW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   aperf.c: In function 'main':
>> aperf.c:58:9: warning: 'ftime' is deprecated: Use gettimeofday or clock_gettime instead [-Wdeprecated-declarations]
      58 |         ftime(&before);
         |         ^~~~~
   In file included from aperf.c:9:
   /usr/include/x86_64-linux-gnu/sys/timeb.h:29:12: note: declared here
      29 | extern int ftime (struct timeb *__timebuf)
         |            ^~~~~
   aperf.c:67:9: warning: 'ftime' is deprecated: Use gettimeofday or clock_gettime instead [-Wdeprecated-declarations]
      67 |         ftime(&after);
         |         ^~~~~
   /usr/include/x86_64-linux-gnu/sys/timeb.h:29:12: note: declared here
      29 | extern int ftime (struct timeb *__timebuf)
         |            ^~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
