Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133568494
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jan 2025 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737874916; cv=none; b=u6cBWtMasN7bdzm5h/JdZbCSmSmRhHhMN2JlA0QEUGIFAOuZ2KvdIN9PWJWGJ7d9WZFX/U86O8WDinDMu+7By/hLjiXWmbPLDrcI7PLwzSY5VHFRutRWOVynJZ9B2UrsNd4s41+WiRykVtJGO+mnaf+Eec16TpW5+l7orSxVQZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737874916; c=relaxed/simple;
	bh=ivGPptJyTucsX5HN60xlrB5JW8jhOni7t0U3i/px9VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N8L00cQBh5dYJxNRdWnVEfBxtlUJU12SqZq1mDC0TWzTiytkiMsFvb7uRK7MniGRFWCk1e0SDMKbrycD7Ah+3V9NykpvHJNgRicZ4BN6iT3q4JMfOH3Fwar8gw06bxeHu3ihXuUDQTPXTWM60ZRtiYlDwnYhUJ/cW07zBQKCduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nyn1ZjIS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nyn1ZjIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737874915; x=1769410915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ivGPptJyTucsX5HN60xlrB5JW8jhOni7t0U3i/px9VU=;
  b=Nyn1ZjISSON29AliftcYHeI6lTzVL6Ssy2NRU87YWEcUriy8jgBY0GjE
   SHCppCAKwfjeRgKedQfInayCltekM/xwFGw9UJ3WsPslbMhF0H8Rykmbm
   Tcn1wGF8o8orpjhUq/rZJOA6MXyjEW62dTpnmuBSzXhFcc2KYX1oKhoXF
   /j1Fu1vQ6/iGuXnye3NCYdY1EAIDfVqRgAl8Ul67FmEZoKJp6WNQO0vCW
   y45Nyj0vEIxOkULeBcC/xiwaGRQvHlgCrDuJ5vEgWjLilN7ElwYT2d3NR
   BzCIyv78hvXhtbUJLHWI07a6TelCho0uE0wyIyIGoWAekgfJQOK6RR2ro
   Q==;
X-CSE-ConnectionGUID: nGVW0dq7Rhm/2LjdbzgDFA==
X-CSE-MsgGUID: iJGA5bKBQs2FJPMCj+Zc/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="49754039"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="49754039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 23:01:54 -0800
X-CSE-ConnectionGUID: nO+EuoPDShGs5JL+Ea6ZdA==
X-CSE-MsgGUID: V/+DzxltSVyUV394499/1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="108671567"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jan 2025 23:01:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbweV-000f19-06;
	Sun, 26 Jan 2025 07:01:51 +0000
Date: Sun, 26 Jan 2025 15:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nathan:b4/llvm-trap-unreachable 2/2] fs/btrfs/btrfs.o: warning:
 objtool: __btrfs_panic+0x184: panic() is missing a __noreturn annotation
Message-ID: <202501261433.b9lsAmjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git b4/llvm-trap-unreachable
head:   5aa3e312a14a904fe3a91d3e0366007253c52de4
commit: 5aa3e312a14a904fe3a91d3e0366007253c52de4 [2/2] kbuild: Turn unreachable into a trap for LLVM
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-buildonly-randconfig-002-20250126 (https://download.01.org/0day-ci/archive/20250126/202501261433.b9lsAmjs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261433.b9lsAmjs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501261433.b9lsAmjs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/btrfs.o: warning: objtool: __btrfs_panic+0x184: panic() is missing a __noreturn annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
