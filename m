Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75372324715
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069240; cv=none; b=qqsiyZXIbhRibtDNcGM7Bg/TchaY/ieAUrQyyK3xPiGAs/Z+7WvtLlsNXD3I5BK/bbSMLGwITyqWvno8XoYIWb8XjSWQMAkfJNgxS8AnkPT4BKIMjOFO9l+QMRizjiiUQQ2gMhpq/R/VdMTHjKht5M8q0KsX6hi0XYv1MqgIIFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069240; c=relaxed/simple;
	bh=ok3xKTYmyebIzqLLLm9cGsrzu7hLZjLKQ00EBst8EWI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lYPs+BgqM8wdLYR1i5tDtgUBx+VBnPd5aVUgluu1gNSnb0GVAQe6yqOp8sFtie+8EuAIHe4GqsAx4hM5q/q5DAmJ2hXT2ZBAFxPYo+LXhEdcedySN0kcKKwQ/YSzhMoGg02ir4EkJq3qF02GqRCR2aQWdnA2QGNry4dpDf2F2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrGLapcs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrGLapcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069239; x=1794605239;
  h=date:from:to:subject:message-id:mime-version;
  bh=ok3xKTYmyebIzqLLLm9cGsrzu7hLZjLKQ00EBst8EWI=;
  b=IrGLapcs11ixSALkGBi+0tOdE8Y9L+0huwVfOkH5jfXRcgJ+O2K72oCS
   kdsCG3Cd3Y/bE/Hj7TpOjp+ELJz2/Kx8V5A6F7qW3wA+k/3RBS3tZpKJo
   jPfnIYFIPuFCK6MC3DMljz+BZ5cOGXDNq9eXEAdgAnXusZtui02IAl8J6
   XsYnSduKoCJbxzen4BUYb2YlPI5aYpuhD5BBNNrvmKJpreD0TX56Kl2U6
   +HCKM4RX1bktV29t2wtNeDhKrpeiIBUPqG8fv1b0t1S3E4K9l0aeXdi4j
   QRuUhKZ4qhG92dP+j31In0/PqDsg2DZfVFLaX7gJ32YEiIIyrGScweJDy
   A==;
X-CSE-ConnectionGUID: R6EYcm2rSySlhvgUiU0roQ==
X-CSE-MsgGUID: U5qS2dIVQo6mwH0qZdb4nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637455"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637455"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:27:17 -0800
X-CSE-ConnectionGUID: bjY3OeEtTFOQENeVkfX9sQ==
X-CSE-MsgGUID: yUmIUDjgTsanzxmJPB57Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189244188"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2025 13:27:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeqY-0000000019N-0Zwg
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:27:14 +0000
Date: Thu, 13 Nov 2025 22:26:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 467/867] checkpatch:
 ERROR:TRAILING_WHITESPACE: trailing whitespace
Message-ID: <202511131908.G84gARw4-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 221177ea260493d2314aa23273a9bc7fe93529c5 [467/867] bcachefs: move vfs-specific code to vfs/
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131908.G84gARw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131908.G84gARw4-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#71: FILE: fs/bcachefs/Makefile:110:
+^Ivfs/pagecache.o^I$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
