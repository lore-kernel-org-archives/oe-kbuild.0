Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5348520468E
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 06:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767766017; cv=none; b=aWjruo7vOG9xoiwVlyVS6LsiKGDuh7/h+rkaoLFoiVwrkzErzREQp6y1v/FaZbZDQtpG06vT9PXhE1NxTSNpqkwyAIxVgXSqVPrCa1/q39JDHnZ2gcIUwYcfalBlTMboBRGYUtJ65fGXo1E+YrL7Re6lsefEanlEPfJbZ7zem4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767766017; c=relaxed/simple;
	bh=0CgVjNi5StSoUF48gC5REorOXmr1/tAWYM9y0Ifns34=;
	h=Date:From:To:Subject:Message-ID; b=Ki9OyA5G5+rdT/VwNpi90jD+eRZs85MmXz2Jl5WKCN7q6cGYYys2xQ8tDZD6V14+twzzQF+Vua8DV/tJmpSJ9ip42p+jbRCwqOnB3wso+lkB8s9PeX2lAnNHlNRABfmLR9Nm6OzSyQrMb3BDKGgguACuZCXwA5B6dqS+S97O0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHBfOvhG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHBfOvhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767766016; x=1799302016;
  h=date:from:to:subject:message-id;
  bh=0CgVjNi5StSoUF48gC5REorOXmr1/tAWYM9y0Ifns34=;
  b=cHBfOvhGLz8VU5vln1WAYM/PoO9LGzJHanqc9wgW39kFeiEX5f4gj3DR
   NIyQqgpG8hU+aH4UcBPpv+r9uCIo6boiRmR9x2ZsUX6Llzj1ml7xqgifK
   vmQ++ve2T0IVkcoW+UCPGER2iRJ0bebl+EXc2keZrHpwW7yE7E/yhA8B1
   W9bEch4W5nfYyiDBXVfhu4H93PXwODDuwLNCvYu7l8IoBFXAKiDpM8Fjg
   5Rw6dUb6FdWUQDxPrE69suniusTOkYG6+pgwrH2rq7pE8ClgxE4ubD+nr
   4kPg3nRfWN2HuLoyF9DjkuPbotlux7oxCUYtyFldXlGM3VefgHb0wcVJe
   w==;
X-CSE-ConnectionGUID: nOUT+v8vS0mByXHTqE13Vg==
X-CSE-MsgGUID: ZEpA7RRyRuGs/+du1y6zHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69180384"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="69180384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 22:06:55 -0800
X-CSE-ConnectionGUID: Kc09eQVuTny2tWDdhXB07g==
X-CSE-MsgGUID: jQwA4AnjToyLyRDuPTroIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="202057427"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2026 22:06:54 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdMh1-000000001Tw-2wkr
	for oe-kbuild@lists.linux.dev;
	Wed, 07 Jan 2026 06:06:51 +0000
Date: Wed, 07 Jan 2026 07:06:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v3 1/9] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'only'
Message-ID: <202601070711.ukqd4XRS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v3
head:   8a4f71e8f0a8aef992da7df176a352073872a47c
commit: c96cbb611777a60e4328fc821843d1bc092dcca1 [1/9] numa,memory_hotplug: create N_PRIVATE (Private Nodes)
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260107/202601070711.ukqd4XRS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'only'
#335: FILE: mm/numa_memblks.c:462:
+	/* Mark nodes with SP/Reserved only only as private */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
