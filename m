Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B696398FAF
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 22:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764802598; cv=none; b=ZWPMJF/mTKxEkcCGNjWFhIzQi79h1ZA++DR1XjmnjG9WTp1M8MSN70/cVeyGsDSZFiGUgMBsiDJqzThdIFYmKA2fhA7F7rRDo8vVOmSdQVZI4MKnup6LW7VGnRXW2qfO43Uqb5XVw0PgR5KhMKIMvQFr/Ttph0ls9vz3V/tFJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764802598; c=relaxed/simple;
	bh=G01s15DS+2ksa+/C8A7RHk/fG2cuUgQ58EuRiYzgubg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SKCGcDHYyu2/J8if4GeOWTuW0FmtIOsS0QTrDIpJRgKc1dlG4x+b9GE4fCIFtJSaZuDhvMSAiakPRRIW3ST5WAaPGRfUlChjE0/HYmBWa76UU7gVXA76TVRQc2ctVAEUZYzTIQ3rwEFTO7lyE3CG2Vm1fTkbj/Q8hTcLePDcpC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MT4NOLrs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MT4NOLrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764802597; x=1796338597;
  h=date:from:to:subject:message-id:mime-version;
  bh=G01s15DS+2ksa+/C8A7RHk/fG2cuUgQ58EuRiYzgubg=;
  b=MT4NOLrsN3yIXZvgQNOII4HKOSezFqVQZ78CfhSQnxKlKqfc/ZmDv0DL
   UWUl/JQYZzvPoE9NlF9j+cgY+gKkGAxQwE5wQdv8mziv+JeK1i8FaEV5X
   YFh53V0NpVSPDxoQ8cWqwbBJU3WDCdA3Qljf9Haq76pVRKokh5xUMO3F8
   Djb7GWWivPi9alAYyt5h0NhdZaYrlWO9F1YzfYDEECTiJBVbkBuWp2Z3w
   wQEZkEwAF8GGoGzFKIjFTPhQEKlt7ZV5FykI+aQKRw2cVbQY3TO1wEmYQ
   QiyiRc1zmWEULmakVjS3qe+QKDu/0KbOr7SjFghLT/EJrTn/Q2PZUqJ35
   A==;
X-CSE-ConnectionGUID: vLN2tqcuQIGRQnu+gPeuTg==
X-CSE-MsgGUID: EXaXNZdMRgKw9Qx4Y9MNog==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66003491"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="66003491"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:56:36 -0800
X-CSE-ConnectionGUID: uAla8gKGR7aRTJt3V27tbg==
X-CSE-MsgGUID: Ge5+8o3qQq6ceflNbaqTKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="195056233"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2025 14:56:36 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQvly-000000000Zl-10h6
	for oe-kbuild@lists.linux.dev;
	Wed, 03 Dec 2025 22:56:34 +0000
Date: Wed, 3 Dec 2025 23:56:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mingo-tip:WIP.sched/misc 18/19] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'use'
Message-ID: <202512032335.cPdVYpdx-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/misc
head:   395fc683e48f6fe5f36082691681d0d64d1a48ff
commit: 8738daaee2084502b2129a322301ed947862a20c [18/19] sched/fair: Introduce and use the vruntime_cmp() and vruntime_op() wrappers for wrapped-signed aritmetics
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251203/202512032335.cPdVYpdx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'use'
#30: 
In the vruntime_cmp() and vruntime_op() macros use Use __builtin_strcmp(),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
