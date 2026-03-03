Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C9234C9A3
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772541741; cv=none; b=qskG+GLWU0nfhM2yW5ctiACc58kWvcA7UE8Ad7/jKeCYQikMTPwwfq5/ROMcd3QDUJHwTjE2lxdLdiAB1cAMCgr9OhDO8hGZy/L8yntEXVzF4DA3XrhyBJdXEQmpwlSJMLVNX+fy9S9uC7ox6yq4fpuV7GOOmEZGZMZuzYU377M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772541741; c=relaxed/simple;
	bh=c1+NE73e0kiVmNRhsAY2ayhFYW/xICoYzjuxWUntVmk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u493qKad2Mlj1KSxrouIrNKb9muE9HsMbNfLN1rBZOHNcZV316ZmP8359FVHh18Hdm2QC7lGxhnmA3LX+vN/k7HXSUvosgqFUGX4BcnPfQCUJhiDJuMhabwAR0WFBv1uQcF3u4C5AMAl337eE9Nd5vp59MSqpD7la0iAGFe8lP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFEoumN3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFEoumN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772541739; x=1804077739;
  h=date:from:to:cc:subject:message-id;
  bh=c1+NE73e0kiVmNRhsAY2ayhFYW/xICoYzjuxWUntVmk=;
  b=fFEoumN3nfJiuHO+j7+Gb/I2HYpzFHbMo4OoxINoJ5uJxgUkCprcTNX9
   rdkhptcOSIpuxhY8mHSIYpeuFsxoIwXy2/GeQK5Deh+dcOS42eTQdocBc
   cBh/Tfv/pbh0W/5iwPTIc4/FZv/hszRI1mCPXVKGbk5lLz8cqkKdIblfW
   zZbA5Bll0lqUO4D6cNSuew9fzq+IvCmzfxfyLUKFz0p5KUt6dSUu+670I
   TrW+BvJp62mVP2IOXpv/x7vD+eJcWstar66IAX9eFmsBbaqEWYhMJZIZs
   te6pu9Zehqe/oBfQWP6qgEkwhyVsHLGhTBOxsUlDuUvX0slExcjc+JSIr
   g==;
X-CSE-ConnectionGUID: zhZgfHLtROSDgtLdRqhsCw==
X-CSE-MsgGUID: 56dyoqxIT5eKPkbKShfRGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="96187732"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="96187732"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 04:42:19 -0800
X-CSE-ConnectionGUID: QJeESpjnQMSqcZATin9O2w==
X-CSE-MsgGUID: SO9XEh0iRNOfCc0CmsAjSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="218100217"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2026 04:42:18 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxP4o-000000001SL-3sZ8;
	Tue, 03 Mar 2026 12:42:14 +0000
Date: Tue, 03 Mar 2026 13:41:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build-arm64 8/12] error: objtool: At least one
 action required
Message-ID: <202603031302.RpCcXAWX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   3380d4a54f28033bfd7d98119ced8d69c46418af
commit: f362ea9d6ef61174da74d84983aa124e0cc8980c [8/12] kbuild: Only run objtool if there is at least one command
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260303/202603031302.RpCcXAWX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031302.RpCcXAWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603031302.RpCcXAWX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: objtool: At least one action required

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
