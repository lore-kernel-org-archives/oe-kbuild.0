Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE0D1A23B9
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 21:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764107748; cv=none; b=lRDp76OBI2891yjDRBmiyTlUZTTrqRfGorAQzLL/TS2xMQEgcmABgpdujcN+WtL889Gmwf96GJFRq+JwG5wy9yNzsJcHNIJA+BcZRVjQGTHS+UHxo72FUDr8WZl7rAqBxeAfyzwttXIqLDfkybi3XeEzn16CSUN6ZhxTYCbesPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764107748; c=relaxed/simple;
	bh=29rj3EU74F+HOwC6vNX4kQ3vvbKx+R9BAS7Ryt1QiA8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ABbmTwc/VGmZtPLq0he50sqfDjx2X7yJSA0eFUu0YYEog29XeO0Bt2yu22tdPrHb3h4/xB0SeBhT7bPzSHNV1rTI/TWVIyVPtRdYVy20Oxrxwpe7ZuFJUK03k+hqSQo+qKWWWVcA4bCD4mYDyUeXKAMkVYB52hAsNfIpf0h4bjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDrQueE1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDrQueE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764107747; x=1795643747;
  h=date:from:to:subject:message-id:mime-version;
  bh=29rj3EU74F+HOwC6vNX4kQ3vvbKx+R9BAS7Ryt1QiA8=;
  b=eDrQueE1klsVSliIm5/RZgJELJQeFwPHsoPbueEcDuod/yOu06wjAPpp
   IoZZ7iD5eAPkVBvd9nXL9+AmYBJUShiutaNLi2nfhz9mE6jM6K+28L6az
   4xRgGymjL5XE5LnoWXjtTxNSGVshPL91Dj7Y7tLutKFaFssi3RimQSJ/m
   IGu8H0aV4XGcqYFJIMC4ISyoDxwpSXO0s3N7QtVqvYf8wdIE5VsnG9w83
   Lw0Kv6OPJOz0LTAqJeX8zRpt3hz/ClT7mhhoWJWdooQ8meqkxgmZsFi+0
   rDrc3SAHDpQ3o3qi2w04VhXzwEezCtrKwGsBTWvkm2GtZe7R5JbJW+2wF
   w==;
X-CSE-ConnectionGUID: tuR3Y9UjRpyqnnOw7mlAaQ==
X-CSE-MsgGUID: 9GrRoD5bT4aor/0cfCDVQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77613439"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="77613439"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 13:55:46 -0800
X-CSE-ConnectionGUID: 4BzE0K3DTEatPLD2+frOtg==
X-CSE-MsgGUID: ps0Obj6uQb6x6owlxR4/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="223737606"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2025 13:55:45 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO10h-000000000ZJ-0ceR
	for oe-kbuild@lists.linux.dev;
	Tue, 25 Nov 2025 21:55:43 +0000
Date: Tue, 25 Nov 2025 22:55:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 9/26] checkpatch: WARNING:SPACING: space
 prohibited between function name and open parenthesis '('
Message-ID: <202511252256.pa7ww8Kz-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   3f83b91c6f2ee77a9f0e471c30f0dd9b6e7f7a19
commit: 563fc5e10da881b8f21f52c0a6cd28153340c5e2 [9/26] xfs: start creating infrastructure for health monitoring
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511252256.pa7ww8Kz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#59: FILE: fs/xfs/libxfs/xfs_fs.h:1052:
+#define XFS_IOC_HEALTH_MONITOR	_IOW ('X', 68, struct xfs_health_monitor)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
