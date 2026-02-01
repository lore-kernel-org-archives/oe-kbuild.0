Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D73613D539
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769911947; cv=none; b=MbpGVaEA2dhn+FmIdP1u/YwopKOb+B1YbZDK7BWYMGrleWLolX/oUQyXdOjXaNzj6JjwSdlkczLuAj9O7vBc161kIJmjdze+7YJ2CkPZqiPM5wN3S9J4FPvG1bc3V+3U6t0Ntat7iXHzJAsS9tlnzcTMH2d7OIvMImEvKWYeSy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769911947; c=relaxed/simple;
	bh=makiK3ZsXYhaXeH3ZyD1EaipTDU1ircv5scPlV6P9LQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iw56dt2PO8GXcETJATQsQWt77SB29weoW162kOQIhX159NIIKFyvvbMAPFwxnJBfZdZHMTdojaHme08C8AVUOWodDjdRnnlCwoSbNda1Am5NN3otUbKora5lnqCPrAxR5rnjQmv+UGmlW1nnk9UVe04yCvHdD1wSZmVRKcUDag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KE5QCOG/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KE5QCOG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769911945; x=1801447945;
  h=date:from:to:subject:message-id:mime-version;
  bh=makiK3ZsXYhaXeH3ZyD1EaipTDU1ircv5scPlV6P9LQ=;
  b=KE5QCOG/honr+2z0pOLkbYIg/OevX7jXRuGKR3LL5HUsZH5tKoDG1041
   QW585PldYQbqohofjfAg+MFW520pBC1aKk9hipyIr953KakTBxjWCqDSO
   NG5FcL15pPvjRS4HSF08fwaJgE1OraGyxtiVcgr/LaUH40Ad4a1k5b81F
   IGZLz5kgZTRivPqPjDtwPpu2LtxSQMg1MHjMlXYDW91WYQxBwQE8Qea0U
   ELBbEF3CJqFTTDG0wRCCAChrGjJK7pCZGxWh/o9hupi21P0yBl+fN166C
   C1RSn52oUz3reWJwn78PNureqwQRdl0FmVO4RSln8ad/an14bSWXewcRT
   w==;
X-CSE-ConnectionGUID: Gki4L+RzTS2CnkbBq7BiGQ==
X-CSE-MsgGUID: Gv+paV8JRQK7GU8BnDU3bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="74968109"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="74968109"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 18:12:25 -0800
X-CSE-ConnectionGUID: 45qLxQIjSCKSKu3nXA4YZg==
X-CSE-MsgGUID: avTUj4H1QvuutYifFB7uwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="213707144"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 31 Jan 2026 18:12:25 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmMwo-000000002tX-0cM7
	for oe-kbuild@lists.linux.dev;
	Sun, 01 Feb 2026 02:12:22 +0000
Date: Sun, 1 Feb 2026 03:11:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/5] mm: swap: introduce swap tier infrastructure
Message-ID: <202602010336.5r8sUYFH-lkp@intel.com>
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
In-Reply-To: <20260131125454.3187546-2-youngjun.park@lge.com>
References: <20260131125454.3187546-2-youngjun.park@lge.com>
TO: Youngjun Park <youngjun.park@lge.com>

Hi Youngjun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5a3704ed2dce0b54a7f038b765bb752b87ee8cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Youngjun-Park/mm-swap-introduce-swap-tier-infrastructure/20260201-005914
base:   5a3704ed2dce0b54a7f038b765bb752b87ee8cc2
patch link:    https://lore.kernel.org/r/20260131125454.3187546-2-youngjun.park%40lge.com
patch subject: [RFC PATCH v3 1/5] mm: swap: introduce swap tier infrastructure
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260201/202602010336.5r8sUYFH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#192: FILE: mm/swap_tier.c:17:
+ * @list: linked list of tiers.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
