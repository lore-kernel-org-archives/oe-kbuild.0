Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DDD212552
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765916305; cv=none; b=mQNzn0a2sE7d+teAYGbt6luhK4FRPBAFni2XkJTRJ6UlQ5720p9+My2UWIuOom+yzoJbL/OXfHAu3McsEUl4nFi5twr/RnPgLb+Lo8DKay5XUDdI4FLdsoCJ2kN6ongw2z0d+r8WYBvdzLCfKTGJXEADDzktQn0p/UKEdAWjZNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765916305; c=relaxed/simple;
	bh=4GHZ28kfr4RC32f/PAGKhmVSVjMwKbvEy3GGaBGPsAo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhvoEbT+CRsYfbgw7UvQFyxln0flUzK1bZsrr3yrZKLHXPABG6YIqgV7itrokL+93/kaQLza4+yRTldUJ8TMwNI5dnwYGw7mbLlUwBTKdohTOPNCWlb8BGZK60Jn3yQ/yDv9TsyvHYxn0CI64P+1H/mAIZ87K3JXRTSoUzk1toc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkfNve50; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkfNve50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765916303; x=1797452303;
  h=date:from:to:subject:message-id:mime-version;
  bh=4GHZ28kfr4RC32f/PAGKhmVSVjMwKbvEy3GGaBGPsAo=;
  b=nkfNve50YQPQRzVhbGLZbGqGmj6DxzNQauejI5tcFQCQ/NHjyq+Oprgn
   PgYmClo49fCUkZi7AYsxEyUxtZZd0k8ZleTryjeWYecNDX3od9DoQobab
   6EiHyEyuFag37dyWKBlrg3L5HEf1mi1PRdg6Yhep2p/hEXm1qvL/Zv4Hr
   e40i0JdVx+BzqT1nxdJh7o2dHq4qVBLMI9MxaBryAoelKA9BvjaMIaOzo
   dPe+dPPVRo5Z/sH8bYf0TGZhqpqOpPLn06WI6X56GuV1SFabEWQYcZ7PW
   0hCeyCwrl4UxCKhylYGopV6EohalZuDemm9ZpBr0/Nd73KToiC7gB3fnW
   g==;
X-CSE-ConnectionGUID: QKJW5UN8QkiiKQVbcngJGw==
X-CSE-MsgGUID: k4Y8y8i9Q3KwfeivpDYwNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="66833082"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="66833082"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 12:18:23 -0800
X-CSE-ConnectionGUID: CcYuF5LzTCiyQkNjmMsy2A==
X-CSE-MsgGUID: DA9C42KvQE2PMgvRRCVctQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198907102"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2025 12:18:22 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVbUy-000000003FY-1xLE
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 20:18:20 +0000
Date: Tue, 16 Dec 2025 21:18:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-fixes 18/28] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202512162150.PaF2M0BT-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-fixes
head:   858646137d80fd2ac7423e36752a03a4c6b073c8
commit: 883721717e09b2bf247b689b21af5e3296f28b35 [18/28] xfs: convey metadata health events to the health monitor
:::::: branch date: 53 minutes ago
:::::: commit date: 53 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512162150.PaF2M0BT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#536: FILE: fs/xfs/xfs_healthmon.c:227:
+			if (existing->group == new->group){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
