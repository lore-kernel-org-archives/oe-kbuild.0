Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505B354654
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 00:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764377224; cv=none; b=iFCBsW0hD7RvIOEaZ1BfOJG2gx+wp2K6h9tREdLnj09tzXWZBukTRJuKy/n02pSh83OgrwuU7P8bIp+7fIU+svZDXfJmA5QCM8JzhL3MJeKi3LJ/MP4d4mFsFQOjpztn00wmQGD/uCeF5Kv5URRi+jmj8XO8JjJuYTQu/RCssPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764377224; c=relaxed/simple;
	bh=PDHiJH995v8MkJMwYQl1UuqL9xfIpBOvbUtDqhQ69QA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dcaU4cr0Skex1hATI+A9kYI+Pj082t9/HjnydfxXoJOKqUhiVMNg7KayVR5pAJjwh3/a5aJM+rfXC1l6BcKqCKeVThKpAtEd5co8a1Odu4DG312zozAYX6/xcoEhzwGrdphoWXbo1TsxMZNcYcY/aHQazpL9UzrJmfw+8v0ll4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMTbJAYI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMTbJAYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764377223; x=1795913223;
  h=date:from:to:subject:message-id:mime-version;
  bh=PDHiJH995v8MkJMwYQl1UuqL9xfIpBOvbUtDqhQ69QA=;
  b=WMTbJAYIVow7SbpvcCySAQisc3ppTRmIVAG6pnnij+DfHIu7wSWP6LKr
   RfnezD9ZLv/THLKIU4qe3lCiKcyETGbRD48dz6Y133eaS2/zw4gDMzlyK
   /3cfUKGxYHEeXmvwA9w13YeUD7jKy8SFQTtoU67f3xd2d9CpUM0GgTTC4
   rBJf3r68kA840cY4vjfsWcjbtR9i6qO/LuoUEBYL55hoXGXbTPDHrxFc4
   Fsf81BDRQFzoJGgG4nD3T0eW5PYdn5XJQ6t3BlHdEFDYVRitvrNSfjs7+
   Hnbudlrfw7K2336Xi/iiX/NHTFQ7Aif7Kf7H4/gNxptos0n/UIyh0iupb
   Q==;
X-CSE-ConnectionGUID: Il7FFAH3RwmUe5Ck10NHyg==
X-CSE-MsgGUID: mDwD0MIPRgepX6BNjg7DXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="76723861"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="76723861"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 16:47:02 -0800
X-CSE-ConnectionGUID: FesLlKJwTXarxxkRaIfILA==
X-CSE-MsgGUID: d6CJ1jx0RYGAw3PnBoQlvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="193569724"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2025 16:47:01 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP975-000000002Ar-1Fbe
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 00:46:59 +0000
Date: Sat, 29 Nov 2025 01:46:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [peterz-queue:sched/flat 22/22] checkpatch: WARNING:PRINTF_L: %Ld is
 non-standard C, use %lld
Message-ID: <202511290119.6TIksm8o-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   589908814e69e3b1a5f3c00003d3746b1865cc30
commit: 589908814e69e3b1a5f3c00003d3746b1865cc30 [22/22] sched/eevdf: Move to a single runqueue
:::::: branch date: 63 minutes ago
:::::: commit date: 63 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290119.6TIksm8o-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PRINTF_L: %Ld is non-standard C, use %lld
#90: FILE: kernel/sched/debug.c:734:
+	SEQ_printf(m, " %15s %5d %10ld %9Ld.%06ld   %c   %9Ld.%06ld %c %9Ld.%06ld %9Ld.%06ld %9Ld   %5d ",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
