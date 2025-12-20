Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEE217C77
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 05:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766210317; cv=none; b=gQqXCsKKlQXUFIPaT37j5BHGQGR8kUWWX6Qo1BZo7bvK//t06el5gkyrQ+k2g0n80/RS9WkZfCYCA19AFgvggOJ5VuxzOAVZqQXl4BDjIBWUCZNkbFUbW4Ux/qoFc4Qdh06+fGpt+AA3f/zmbUk1Cd2lpLAk9Tgsp7mim9ptJGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766210317; c=relaxed/simple;
	bh=bdoH+yJyX5cVQI41iiGB5bY4DPXwmhxS3g5U7htgscw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sGwI2GxQFV9wlVpXWVqwcqBcs5VrOYpX4SOf/c6YVK9vJFurUCkw/r05mXUK8B07KGOJ81kDIRhI+zaSwtaEbKM3Cu1kvTgBLInJzJxRtYzGYb+Wo4sxcUb3zzQBYXnkjkZiVpV+FdSiIQmIO0OwVe1HnGqY30Uly+nZsRS6Waw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKOmOAyM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKOmOAyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766210316; x=1797746316;
  h=date:from:to:subject:message-id:mime-version;
  bh=bdoH+yJyX5cVQI41iiGB5bY4DPXwmhxS3g5U7htgscw=;
  b=RKOmOAyMKy5iLBQQH4kK1bDo4HafhurJxa0sKS4zpewcIdUYHuAno3wz
   ZQCJpfF2kQq94tZ3lm2nLrB24D7wpNkiYrGxI3Mpla9s5Z7LOgm3Pfmgt
   UqoLyh66XmTBTGj9G75U3tcAuEkus8IMXNxA0oNYJk9vpKcnwdFjJG2GH
   LHoM1SmU1N0ICke+N9C/yrI0YKiXSvi0fZcC7WlgkeJEmZNQJfl+zBkXS
   Y6DUjp2pOdcKoIwa2HzzI6vPdAfwZVXs/iv3a28JKV5I3sGWOaVmv8hnE
   MnL8RyUkSMJugsIDYV52mMFnaiq2Tin+nanCrvOVFoA1Tu7EK4SRGCh/+
   Q==;
X-CSE-ConnectionGUID: mvADoIuIT/u/wwcm3dJUsg==
X-CSE-MsgGUID: sSkcGlclQfSeIH14FbgS3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68240964"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="68240964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 21:58:35 -0800
X-CSE-ConnectionGUID: HKAwIqzZRSidaY7pUBZFvA==
X-CSE-MsgGUID: 9DPDuHT/QhymmdSy9iG/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198628057"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 19 Dec 2025 21:58:34 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWpz6-000000004Va-0Qao
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 05:58:32 +0000
Date: Sat, 20 Dec 2025 06:58:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 24/31] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'in'
Message-ID: <202512200658.H4bdCEM5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   5f2f7b8f588a77c9a1a0d5cbe842ec3b4f7ca52d
commit: a1fe10b6ba805c73fd9a693a45787cee534ad064 [24/31] KVM: arm64: Context switch SME state for guests
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200658.H4bdCEM5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'in'
#26: 
guest operations that are invalid in in streaming mode will generate SME

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
