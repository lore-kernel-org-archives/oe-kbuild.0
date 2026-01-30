Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C24A36654E
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jan 2026 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769816113; cv=none; b=cerCJgLLZOW4FzvOhC51K4XnbJXV7sIXgv9z6HwZrIinyUo1gqsacjL6iZuF89BevLWQwys/91lFHPfEjY5tytYXwzD0VFgIO/CmTEUkXsEF5jvbY1uv9l4mML0jRQguSF3nU+JgyGHdzGOwbOH/HZUnCwfskNuH+EcIsTRqJec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769816113; c=relaxed/simple;
	bh=xFlHdePOt94sTc9YEHjhlhMmVvtquSVIeRuFDMY7g80=;
	h=Date:From:To:Subject:Message-ID; b=msT63la3BP1uHKTP42JxB6eMQ9E3JxipNE2xIOzk3+O4zwBRBJCgk72YYlNYH3QwOEXQ5j5lPHQF8y3Q9QsJ4Jkct6oxco3pY9JGOd2719nI4Cxkm5DDjaL0D/z8SBkDFo7vwuUbeaUcqDOVWVeJX5zWnq4KzxEZo8abF9fUqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ce7P9mE4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ce7P9mE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769816112; x=1801352112;
  h=date:from:to:subject:message-id;
  bh=xFlHdePOt94sTc9YEHjhlhMmVvtquSVIeRuFDMY7g80=;
  b=Ce7P9mE4KcgGauCERLp9vYrtoggBp2e1KaqndE99gQn1SEsE4mRfMZQs
   VRmsE+XYYfiXkqOmmOTCAmW2E9swewCv7kALWDoQQOwDpUs60aX8MaR8a
   o+zD8Gv1r99FhEy4z2MuDl5pszh2TL8p46GGxkbMZ2B8SeOYFKskXF0tD
   b8SBX+n5Ty9/tgAj0aBCggb+uLxjKeJWqZCG3EtTvbt6/fCjuE4xb19/2
   3+sIURcSlbrJR8jBQvh0ZT9Z8bKIcn/2dA3ae7RA993FwIICLs/C0UGpQ
   jPVtZJ5XUt172jq5UP5oM+zuIYW/c1PQhwvO2p9CiSgyM2GKCWP7Ycf4e
   A==;
X-CSE-ConnectionGUID: /tuPwKOyT5iFHH8iYuVUDg==
X-CSE-MsgGUID: G3V2nBM0SayqcpuFE/Fglw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73672031"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="73672031"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 15:35:11 -0800
X-CSE-ConnectionGUID: T/8tw7eORKCP5H6eI+ZY7A==
X-CSE-MsgGUID: ZLlS+6YTS/CGYpBirIqLaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="246593102"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2026 15:35:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vly15-000000002ZZ-2i5J
	for oe-kbuild@lists.linux.dev;
	Fri, 30 Jan 2026 23:35:07 +0000
Date: Sat, 31 Jan 2026 00:34:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tip:sched/urgent 1/1] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Andrea Righi arighi@nvidia.com'
Message-ID: <202601310031.VkEDwQ3K-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
head:   115135422562e2f791e98a6f55ec57b2da3b3a95
commit: 115135422562e2f791e98a6f55ec57b2da3b3a95 [1/1] sched/deadline: Fix 'stuck' dl_server
:::::: branch date: 89 minutes ago
:::::: commit date: 89 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601310031.VkEDwQ3K-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Andrea Righi arighi@nvidia.com'
#20: 
Reported-by: Andrea Righi arighi@nvidia.com

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Andrea Righi arighi@nvidia.com'
#23: 
Tested-by: Andrea Righi arighi@nvidia.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
