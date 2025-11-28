Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA67288C81
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 04:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764302754; cv=none; b=Hj+MC2zGBlhMkgp7C+XhS0ctKOmfxrcXUk7njuA+EmaWghmLzDaBOPE4WqkDsJUhqEdd3UokbaIPUjqMHU/044ruxT1gvdOAx7bSunEsZU+FmOSo86cyW+tMZrwPOxDCQ29L4nL2M9ampsqk0HcXwUKNQNrPBPg65PoQdqPiawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764302754; c=relaxed/simple;
	bh=/6dk4lQqxvd1UcdeGfR+kNUFC0+UJ3bGpYFXEqa9H8U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYJ0lugf1QQ26PL400IqbuQu6kQEn3JaaV9C0GEm5pg1xWBrbQ0CA7jQAyR0NflX995rxGUCA2WH/2moVJUKZtVVSaJDxTmdMA67aOll2e94+LkGSrXBSlLh9oZLNMl818eneCp4UXX1kvbfTKSwGrj6xFVOphULaJXOu6DCJmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJMyr0Lh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJMyr0Lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764302753; x=1795838753;
  h=date:from:to:subject:message-id:mime-version;
  bh=/6dk4lQqxvd1UcdeGfR+kNUFC0+UJ3bGpYFXEqa9H8U=;
  b=lJMyr0Lhw7YsWuivrhqTNwwMRjQ7y6dd7wxQodTf5Q0H8mmjbH7JXt9e
   xJ7J7rT5Zvx1uvYk65pVEkZt3Y+jfcuUbc2pLly7gsgy+n/a+uzn3HD+Q
   +T6vDMKhXszfx8Ujhq2r4VErYS0ZBxiKj3Jw6f1m68JiRxlBNw7XQLgWh
   Hjbln+abGNtQkvQTiWQG4YeQQhUfN7jahxgBWJmAm4mPRi/6lY5U43xqS
   ad9kN2TnKN17w9/lvnGt38qQ2TqDQDDj6jWrwu8oTGhzSNwqdgcKGBGo/
   OVx0Fj43brLObOre/doUKtIDA0WVY6D3fIVicUrE3iJawBtWhpiglkhlb
   Q==;
X-CSE-ConnectionGUID: qB3NIb0vQTmAlN9emLSt0A==
X-CSE-MsgGUID: UR8G+RguQimy1SDCilLsog==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66503180"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66503180"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 20:05:51 -0800
X-CSE-ConnectionGUID: 7ekdfOReSQGRyqHptUVtlQ==
X-CSE-MsgGUID: dEEay/5OQbmGhSONWO7bhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192496281"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Nov 2025 20:05:50 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOpjw-000000001wy-1rkr
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 04:05:48 +0000
Date: Fri, 28 Nov 2025 05:05:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [xfs-linux:xfs-6.19-merge 5/50] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'is'
Message-ID: <202511280550.Qq0VSUJm-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git xfs-6.19-merge
head:   69ceb8a2d6665625d816fcf8ccd01965cddb233e
commit: ca3d643a970139f5456f90dd555a0955752d70cb [5/50] xfs: cache open zone in inode->i_private
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511280550.Qq0VSUJm-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#161: FILE: fs/xfs/xfs_zone_alloc.c:794:
+ * Stash our zone in the inode so that is is reused for future allocations.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
