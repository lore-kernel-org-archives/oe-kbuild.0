Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC23332918
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862612; cv=none; b=qDgBijOQFbdXQQCAp3UrjTgNIMOEV+l+6iRZ96BHcSeihsj+Vo6+i+lZWsoMcWELmDtKdd3I3kz5cgLH+PdB/C446v0r/oGX5lw0FGPVDch1Agn7z6sfnoDAxKJXo8QnXPaqw/N092MkYX0vypc+KtlZVnWEVP6w63ujROyAqA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862612; c=relaxed/simple;
	bh=22uXBdYdMhiNKKymBUqMZBh5fNaPZkjOLYETytpILWM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n+qsAGNbJTaazcHCptxn13TQE8BhDdGzsNxFb1xc/ZWrwAxJGgqu1PsTi9Xd2v9+u+w4waHGtaESIlLdOjHPY/RpqYPOG+lvEaGCYcB5Snl1d4yz0gZE8649vLdoFfpcQ2hOKxMtP0r5+UMehtIPVZ2h5HxFUT/4KEL2sAEMySE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdiCqDwT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdiCqDwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767862609; x=1799398609;
  h=date:from:to:cc:subject:message-id;
  bh=22uXBdYdMhiNKKymBUqMZBh5fNaPZkjOLYETytpILWM=;
  b=HdiCqDwTp85Jz6YFv5/H3ZX5JJsUu6E53KqcNoMnvsGmUmcnc9w0EOw3
   2v9EJ4kVNPOncDKJaIXJ7E6KRtase2HWx4psxMr4I0UBf89kj49nNbHnV
   yo8KkGz6Tce1zv3p5C2CTTV/jrwmnsNUDrnOSNXR5GkH3hoVE6qtgTrdu
   6h9vZ6dlhY8D1fC/4t7oRduWWerX7smyO96h7ia9qvqNyzdpyx1ewKjrz
   sgHW5HEeNCEKRg/tX7Vfx3Zq0XtP4rsG2696P02li7LPtcyo3ZfLyef3j
   sY2sYCGZwjn09XCZTaAFaUQOZdqWggIXI7yJ1D06EH4aqtcZcGAv7s5Fu
   A==;
X-CSE-ConnectionGUID: ho64EMR3TKCdEtvEwa0DNw==
X-CSE-MsgGUID: 9XKSuBcKTLCIFLsmrCz3QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72872545"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72872545"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:56:46 -0800
X-CSE-ConnectionGUID: JsYatzjhTB+QZ1KFOfbL2Q==
X-CSE-MsgGUID: RgiGAmj6Rwe3Z9+4iMeRXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203169365"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 00:56:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdlov-000000004Wm-2iFl;
	Thu, 08 Jan 2026 08:56:41 +0000
Date: Thu, 08 Jan 2026 16:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4199/4438] lib/glob_kunit.c:121:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202601081618.K3ZwHYzK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/glob_kunit.c:121:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kir Chou <note351@hotmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
commit: 059a59a1e768361da2ce4a4f1e40cc6eb80644e8 [4199/4438] lib/glob: convert selftest to KUnit
:::::: branch date: 6 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-r113-20260108 (https://download.01.org/0day-ci/archive/20260108/202601081618.K3ZwHYzK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601081618.K3ZwHYzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601081618.K3ZwHYzK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/glob_kunit.c:121:1: sparse: sparse: bad integer constant expression
   lib/glob_kunit.c:121:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/glob_kunit.c:122:1: sparse: sparse: bad integer constant expression
   lib/glob_kunit.c:122:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/glob_kunit.c:122:1: sparse: sparse: bad integer constant expression
   lib/glob_kunit.c:122:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +121 lib/glob_kunit.c

059a59a1e76836 Kir Chou 2026-01-06  119  
059a59a1e76836 Kir Chou 2026-01-06  120  kunit_test_suite(glob_test_suite);
059a59a1e76836 Kir Chou 2026-01-06 @121  MODULE_DESCRIPTION("Test cases for glob functions");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
