Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5E319864
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407381; cv=none; b=GBwTPjQxE9LVDVjaGfiG8ZZLpJB6JVaixYluJ9a54Yp58hgpJqsH1Za3hR3A5c/lFEmz/oM/eBggpUDDrexKt1pPqlqsZxpFDziI5PxF87LMBigoyxie0nWeFRkSbuKWKCjzX625xE6y8LuEz0bUWymWOqW5bjpHHq7aF48P0WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407381; c=relaxed/simple;
	bh=aZdrsLjX4tGlbCpurdMj/q/5zPx5jnApZ0hKc1vdExQ=;
	h=Date:From:To:Subject:Message-ID; b=RMWUs1qPhDcy3Unsc6lOfknOTbYPq+WVJ7WNXpi1XHQtKJ21iy7aprgVF62pIggRvP3HnvKpTg+9CtkFapx87iULi7/w3RktY9EwPkwd5E1xKVeh2V2U1eCRIbuBzv1NbBtKQjbk3Ubmh9sXByfJ1MngOZT4Elt0VY47xp1Thh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqOGF16/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqOGF16/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771407379; x=1802943379;
  h=date:from:to:subject:message-id;
  bh=aZdrsLjX4tGlbCpurdMj/q/5zPx5jnApZ0hKc1vdExQ=;
  b=TqOGF16/Zt10qgcrOqxnx7EY41fRXE5a3gWXTkyJjyiRrMSvxcB1dwzG
   3DK0LG9JkKREDzbonWKCx872jyDtqUqHnrJ8j6FwexExfQGPAAz9HyTh1
   MYNZncE1LJhICa0dEEfJIwEWChAHAs0XIcPGqzFONC2Xgn8Md9EqbKf97
   +TV27t3WtuKQaFkTdOTgXwYxLJNoOZdyMb82/UYe8g8ewvDzCM/rMZuLw
   HwiTgakyrBjKrGHDVhItW8InlinKalQP7MShsgOV7MR1+CTTeh/hMwzWM
   E9NLHN7Y93IdgGXHWLlpBUvOIOdDed1oerd/euPziUllTcnzmcjyMZfno
   w==;
X-CSE-ConnectionGUID: G2aqxZRlS7+bOYeVx9nCzA==
X-CSE-MsgGUID: viDG3X6bSveUv8iq1AZWCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71679895"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="71679895"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 01:36:18 -0800
X-CSE-ConnectionGUID: pwmtit2qRBmU255VDWOi0g==
X-CSE-MsgGUID: 14VKqO3ZRtSIncjvHaX1Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218283031"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 18 Feb 2026 01:36:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsdyh-000000003Y1-3FpD
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 09:36:15 +0000
Date: Wed, 18 Feb 2026 10:35:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlelli:upstream/deadline-demotion 2/4] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude Code:Sonnet 4.5'
Message-ID: <202602181055.azYHY7rR-lkp@intel.com>
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
TO: Juri Lelli <juri.lelli@redhat.com>

tree:   https://github.com/jlelli/linux.git upstream/deadline-demotion
head:   351ce1967ed402e8ced9800621dbea4045c708dc
commit: 678583b4708691de0b6c164d051bb0a50caea123 [2/4] sched/doc: Document SCHED_DEADLINE demotion feature
:::::: branch date: 7 minutes ago
:::::: commit date: 7 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602181055.azYHY7rR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude Code:Sonnet 4.5'
#19: 
Assisted-by: Claude Code:Sonnet 4.5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
