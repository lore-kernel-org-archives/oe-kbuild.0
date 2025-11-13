Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D4314A6A
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069118; cv=none; b=ITOEAABhnzgAztQt7+DwTt/PeRjJgeeTtCqzb2gc6mKqnAlNnRFv4lv0460klZMJXxhu7ncEljFj1p6DJZNknPrhoYwJAF8Fd5i8THboAnVW+Ur25dbCGwwI2rGe6WHnKKqjCe1PZyyV7dS0Cg059UQAd6dZLygVjvLgPQWY2uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069118; c=relaxed/simple;
	bh=+L57G+4nr0kDWijreV6JJxa1Swre/NgNARvEiVJG9bI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwKc7lpxOqFy5p+ER9GX6uMuCaf/HKlkKCibGTxjD4u7UG+o+FK1ojit/fX17MolAfuF/RIUpa7kt60k5qyvLxWTS3k8L0W8lOsZqicLsI1dvQ6vVnlB8JSfJvI6RkAX9XLINehulpu9ETjMtbOqxxtg8obOFVWuEE4b0h6FoWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6PlKrkQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6PlKrkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069117; x=1794605117;
  h=date:from:to:subject:message-id:mime-version;
  bh=+L57G+4nr0kDWijreV6JJxa1Swre/NgNARvEiVJG9bI=;
  b=G6PlKrkQTUWzl62aJlmD0En6IcqVb5AcmmDAYOEb3bRdoNyf54mYcE/C
   hRNAc2QtxMmYjUig30cMFtcFH6HlgaxJ9tJ4JwGXTF7Su7L4Ly0Difk75
   ndYxjC0HI8UQedzOfhp9O9hqVTRyFNJiwLVFir0aOH/QHM2Dl6OITqHAM
   4KUmhS/H595cL7Pa9ZKPMdniY55JezgXMscKoJxVQb7Zqve/sAxKqry1Y
   Zy/gqXvvLgsPE5eWeVTACJXQsEoyJgNxjOtCxMHXjyn/se+llb+aChjKV
   DAyu39th8Cd1Y6gcdntJ/Slzsb1Ak+/HZ1vZYdZ6i78+OmpEy0Zi+1rFX
   Q==;
X-CSE-ConnectionGUID: jwIfr3HUT/igos7haoDDJg==
X-CSE-MsgGUID: HAvfvL6ZRDOy57+xW+Hslg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69013576"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="69013576"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:25:16 -0800
X-CSE-ConnectionGUID: OjIRzah3TN2nBSt43FvvHQ==
X-CSE-MsgGUID: V+vMvA1aReKLe8QjesZeUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189613457"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2025 13:25:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeob-0000000018D-1cIk
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:25:13 +0000
Date: Thu, 13 Nov 2025 22:25:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-6.19/block 19/64] checkpatch: WARNING:RETURN_VOID: void
 function return statements are not generally useful
Message-ID: <202511131811.EcMA2b1B-lkp@intel.com>
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
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-6.19/block
head:   c3f42a6de708db6891879547b29cd0d84ad83c92
commit: 3f6722816a73e2017599d965683dbe71833afd7a [19/64] blktrace: trace zone write plugging operations
:::::: branch date: 54 minutes ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131811.EcMA2b1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131811.EcMA2b1B-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:RETURN_VOID: void function return statements are not generally useful
#67: FILE: kernel/trace/blktrace.c:1101:
+	return;
+}

WARNING:RETURN_VOID: void function return statements are not generally useful
#82: FILE: kernel/trace/blktrace.c:1116:
+	return;
+}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
