Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ABD248896
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764695680; cv=none; b=FnUJEh+u7Ri+2k4/cTfie7jWWjkFj6np9TsstMqnPdICDluC97UWe5DGgUzj3hcd8BvStLwSei0JAfw5zaGqQwIY6Zt1ZVSCzL05TLIchOAHkhWetrRPtk+TN8btjiB736gpUwhXQ/piGJTVw4xZ87wrZgQSe7S1Iu+cqN+3tyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764695680; c=relaxed/simple;
	bh=rUrAyA0MmYhXhL4vSbHyM2BFgSElZ5Gc+nAth/7NShM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evEM4edbvk1eUAax/cEtXJnYzBJqWd/Wshl29q3UHAo2sm0+co+VVIDX2ERAjc2szaD0pO0RYPZdX+eY6RaUOtBHhfn1HVKz05GUtN/kbZr++vvjWMQ3g9Vfc+RWwEKZdpugN6GbOIq8PQTUQsOYi9x7rdHdW+GbRHEMU8iEmms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XX9voRpy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XX9voRpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764695678; x=1796231678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rUrAyA0MmYhXhL4vSbHyM2BFgSElZ5Gc+nAth/7NShM=;
  b=XX9voRpyOtpiX+f+mvIvw2pUpZXEh6P2tXKWWUHIBX5ImFtMe8stAJqT
   j4cXlTq/PH8+M/Q11183aPJN2247QY5DX1sWRuhhCVx+TZm0WhSFH/+dJ
   cw405C88vhjbT+g9FvYK07ZQK0KHSJpxb+XZaWHpWaimFZ7hesp0BVnyi
   +atwZwBjEmBLg7OqTT/M5+nf+lQPuurELKbtG7umQRLmWFxB5yvORpmgI
   EuwKYRWLXYpfORC7ksYvxxckrpICl9nmB1iMLK0s9VVwS9DohFACssxxt
   no/F5sZdK/S6ard4TbXhwYjtWqn0CU/5jU4lojAkUYh4RveHgDuCxpXIP
   w==;
X-CSE-ConnectionGUID: e1EBui0dTImcJiFKBsMEww==
X-CSE-MsgGUID: qOfa9vz/QgeWCLm7pYPFfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70289879"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="70289879"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 09:14:38 -0800
X-CSE-ConnectionGUID: wN8uPeAZQa6/BkaZJbBKdg==
X-CSE-MsgGUID: 1jLeIBkAQVCqGPnN9IyL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194666854"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2025 09:14:37 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQTxT-000000002w1-11YH;
	Tue, 02 Dec 2025 17:14:35 +0000
Date: Tue, 2 Dec 2025 18:14:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 36/36] dirty_log_test.c:775:2:
 error: call to undeclared function 'TEST_ASSERT_EQ'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202512021805.bdikTYnK-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: e5ed6c9225378b7ab6b0e305dd84da7c87219a1b [36/36] KVM: selftests: Fix a semaphore imbalance in the dirty ring logging test
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 9 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021805.bdikTYnK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dd2b06d60d3eb9b07c7513358ad8b04386f79bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021805.bdikTYnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021805.bdikTYnK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> dirty_log_test.c:775:2: error: call to undeclared function 'TEST_ASSERT_EQ'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     775 |         TEST_ASSERT_EQ(sem_val, 0);
         |         ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
