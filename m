Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E78333CEB5
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765869617; cv=none; b=bd3iMq7hz4gOrNtHwvtLHtcrnyZA2U/x0+rPTVV1AfttVmyz2YD0KK527mQk0IgXPCnNwBdr/rbpNk8xKVmte4YzAYf0Ddf7yhCwJUph1mVezi19oOUCfkdTcrC2qETn4oWV0s+MpbHd/QHwyTiBs703Dh+sVK+vGQCW/ZP9O6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765869617; c=relaxed/simple;
	bh=4D+ZtE3Wq6P6RE55+iB/iyHAx1HZFx6NWUiHwHu8sSU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftGmJ24/f6SA6kE64jSM6n7h/uzoHy3zInNZ92yTA1tUU6gg18fbP60ZT2AYbNHL9NFT0UgFGieXCKBDCw5WEpJ+4WTSUfb9jsTKEhYPK6jiIc23+Vfa9ZkAyyzGOFuRaJrvCNkTj4bXGStJL2vGMdrxNPeZgVgCcC/YCD5FBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+yzzrHU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+yzzrHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765869616; x=1797405616;
  h=date:from:to:subject:message-id:mime-version;
  bh=4D+ZtE3Wq6P6RE55+iB/iyHAx1HZFx6NWUiHwHu8sSU=;
  b=P+yzzrHUQebtbDFjPbsAcwXw8hynljItuuUFxjDM8vShifM3q4zSlpOB
   +pt/tYfXL1flBlJEBPJ2HcHvlgRc0ebLvZ9xsgKFLUqwo+95wzaCZWJxn
   qevhPEyY+kuFwfH3Ff4EsyDH1POksw6daxI2UrmzTP5+NxfjbSdeWSGk/
   vhxVfm34NX05Z75rkW/CWABVOpEpDq09ei6tnil3gLY2Ie9e+VlLMyp/E
   VxbPsoJZChhW8phaSUiYWoAEKPbeVcD5TSml4M0U1vQojGWBB3Y9Db+ZL
   TpEkw8yiAiSRHSximnpmxv4iNiING3b8gWYHSYiRieXRtjsh9hQ7WDJlv
   w==;
X-CSE-ConnectionGUID: HNtsWe+PRHSpZd5pIq9/0A==
X-CSE-MsgGUID: 7tEfm9LfSOOfVjQ9fYucWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85372948"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="85372948"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 23:20:14 -0800
X-CSE-ConnectionGUID: osWzBNvqSqOydlPa1iIVDw==
X-CSE-MsgGUID: e78AAk3TQLGJbtA5x8MB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197933002"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2025 23:20:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVPLv-0000000032e-24vv
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 07:20:11 +0000
Date: Tue, 16 Dec 2025 08:19:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v4 03/28] drm/sched: Add some scheduling quality unit
 tests
Message-ID: <202512160833.20PNzZui-lkp@intel.com>
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
In-Reply-To: <20251215150807.58819-4-tvrtko.ursulin@igalia.com>
References: <20251215150807.58819-4-tvrtko.ursulin@igalia.com>
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
TO: dri-devel@lists.freedesktop.org

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Consolidate-entity-run-queue-management/20251216-012213
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251215150807.58819-4-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v4 03/28] drm/sched: Add some scheduling quality unit tests
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512160833.20PNzZui-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'scheduler'
#145: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:12:
+ * DRM scheduler scheduler tests exercise load balancing decisions ie. entity

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
