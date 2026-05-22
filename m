Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C1D2405E1
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 00:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410958; cv=none; b=Q+1T+nieOlYyxpMYpJKwbYKeLlzIJhb84D/vdan2dfxAuXhq7X4h0SCeLG4lmq9c0/AHVzRnXFSVULoXgHn7l6gH6OrOf0vKr74Hz0L1j8PwYI5FBXx4jbge6Vz2u9c2hbcLNSfl48Nj9dFJgftFKqRcNILW6Xfj7uTJC9EqEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410958; c=relaxed/simple;
	bh=MTUg82z0pDxkLogp2YCWtspw37iZVZCUSBcTV8lCz0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M0uMmnmWOKeYFVRO1LU6YLEgGHoeVzsVfDEUr755SCjaB/Twgq9i5gQRmR5JqYKZQW2AjT/YL7N8D3B7jcz9gZ03rtEOxN1QQA4ySLETh8luQUvHL2WUNygxV76bcNn0qXQD3F8xWcXs9/WloFugXYUkzsD+W0CfOCUF9j8ltSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZotD623l; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZotD623l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779410956; x=1810946956;
  h=date:from:to:cc:subject:message-id;
  bh=MTUg82z0pDxkLogp2YCWtspw37iZVZCUSBcTV8lCz0o=;
  b=ZotD623l903Y52mHMEHDqlImgpgnWIQdKqvUdK2OU5J3XKgJmEcOSbMU
   nH7mMrBt3d2JTPWuJc121xzFJ1OAIdLBnDD05n8R94bjJaEmgUB/qtCtY
   O3VYnbppNbd/NQNFOCalTKDb/YlqoZzg5qIj6xTU3+lpMCVu0avMSemVo
   dcgAxiEC3RAvnqyWUa+mDeQbZzqYoF+aQfiWeNEULLacdU0i6TOmELv2G
   lHyH1/+IC5zsuAK35q95VirzO3vnZ0x6qCRupqaH+4UbznfOedPhoibKJ
   +Xnl2KaLWHnVuSz/6zXThWYAZhkx4aIyZzS1Mrsf1TSpZMDWmFiqzlGQw
   Q==;
X-CSE-ConnectionGUID: lUS6mF2bSJSqbKBBLRsSmg==
X-CSE-MsgGUID: /+mrTyHZT1y+4qQwc+gLPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79490399"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="79490399"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 17:49:16 -0700
X-CSE-ConnectionGUID: syUj7PMoQbuXOGNj7dFacw==
X-CSE-MsgGUID: qODJZC2RT1G3IiwB/PyMVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="264253226"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 May 2026 17:49:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQE4e-00000000B8z-3AgP;
	Fri, 22 May 2026 00:49:12 +0000
Date: Fri, 22 May 2026 02:48:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: make[4]: *** No rule to make target
 'tools/perf/trace/beauty/fsmount_attr.sh', needed by
 'trace/beauty/generated/fsmount_attr_arrays.c'.  Stop.
Message-ID: <202605220256.MfsH3bs7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ian Rogers <irogers@google.com>
CC: 0day robot <lkp@intel.com>

Hi Ian,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-build-Fix-fsmount-o-build/20260522-005452
head:   ff5fe38fe9e5f43ffaf79e7fb5ee913bf33f5fc4
commit: ff5fe38fe9e5f43ffaf79e7fb5ee913bf33f5fc4 perf build: Fix fsmount.o build
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260522/202605220256.MfsH3bs7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220256.MfsH3bs7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605220256.MfsH3bs7-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:565: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:1135: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc2.gff5fe38fe9e5
>> make[4]: *** No rule to make target 'tools/perf/trace/beauty/fsmount_attr.sh', needed by 'trace/beauty/generated/fsmount_attr_arrays.c'.  Stop.
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: trace/beauty] Error 2
   make[3]: *** Waiting for unfinished jobs....
   make[2]: *** [Makefile.perf:551: perf-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
