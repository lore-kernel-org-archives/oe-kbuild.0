Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A32E3365
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 02:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742782773; cv=none; b=ovIyIKBZaCPVZdJFhVr9Enw+CtTJwVNldO/5mdgmYeTCa461coEzGZDZRpGaxpoUX1r4w/ccwgDVh04cTH+KI25qNaR2FIZahpuSdD5DF7hb5vNspyQP1SoLb2mT/4vjkPbkIdKTzSaGrNJ7HZEsr4anR9g4NB6BBzWVTuAgWgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742782773; c=relaxed/simple;
	bh=HD/8QjtdvnH88qcs1jEsgNTANxNKB3b2dLpe4YcuL0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQNYhSU35yn9KrQLPzJnGfrSAvwgwlWrPlz//AenmzQg44wLmGU9lfzZ3QST+jS5h3Njc6tsN35r6xG8mFuRwdZBeIYa1SDL92tUHJ/aq180zvCGaHa1K0djUg9YXJ147hK4wLQH7GgU/+JFXBizTweVqYofpI+Cl0mhnEH/y8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHYEDF7F; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHYEDF7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742782772; x=1774318772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HD/8QjtdvnH88qcs1jEsgNTANxNKB3b2dLpe4YcuL0E=;
  b=NHYEDF7FVJFfzOT1JU5Y5qv1TPDVgo3WgLB6o0EqBeTHuv44KYHs9UU3
   HfmRQpqrCMwGAjshQQLepvrgmpZ3rAFCuVMzk9eM8HextYJTTQWp06DdN
   29pcuBLut4eHG+InhvA70cvl+CGkBgkI3o2LAbIoZwvb5Of9fc2iYwC6h
   XqdhJ20tSd6cOFXUHu09egzd4cj5ebS+lhOj84/IywGmGeNt6/feTHgU8
   UuEbz83MYTb4d9TpBBqdrbpIMmPPWOVGJTrT7i9RnyCh81K9rXNl2TDXI
   sc01kN4S6bzKpxlyirLtyEJCkMyvbwHPqWxIRt0CZZBkgSmZRvluWuE/s
   w==;
X-CSE-ConnectionGUID: r/ICBQW+Tv+Io8MK+9mxvQ==
X-CSE-MsgGUID: hsY1CxvORmCfH72p4vlOGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="61490207"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="61490207"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 19:19:31 -0700
X-CSE-ConnectionGUID: y06iNIXKSEez8nqkErRo4Q==
X-CSE-MsgGUID: zcNuWG0XReqGmOuKJvjVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="128058884"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Mar 2025 19:19:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twXPU-000370-05;
	Mon, 24 Mar 2025 02:19:28 +0000
Date: Mon, 24 Mar 2025 10:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: clang: error: linker command failed with exit code 1 (use -v to see
 invocation)
Message-ID: <202503241057.EfMvLuvE-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   586de92313fcab8ed84ac5f78f4d2aae2db92c59
commit: 89350defd1f0eb5a58a7e1155d9e322080f0bf15 um: Fix passing '-n' to linker for stub_exe
date:   5 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 5 months ago
config: um-randconfig-002-20250324 (https://download.01.org/0day-ci/archive/20250324/202503241057.EfMvLuvE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503241057.EfMvLuvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503241057.EfMvLuvE-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: argument unused during compilation: '-mno-3dnow' [-Wunused-command-line-argument]
   /usr/bin/ld: ../lib/LLVMgold.so: cannot open shared object file: No such file or directory
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
