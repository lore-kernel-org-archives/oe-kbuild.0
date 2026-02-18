Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5794633CE9D
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407382; cv=none; b=IU3NOk9NMk895c+3J+3bkJtVcZoVztViI7e9sv/vtKOCXroKULr0/m+4/gjTaWBIVqlcqTCqyVk43TVtK+TJraZNmO97ChyPz4LjR4FNG5fe6uIAt0n84O3NElqnAv/ax3Ky9E+d/N6hC6TjUF+ZJ/dAJq5//CTknqwNZyLBSo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407382; c=relaxed/simple;
	bh=QmQ+conJESllDdFrlKNHdsOc4ktawtbP4uePngGEMb0=;
	h=Date:From:To:Subject:Message-ID; b=RDRnqQ2FV/1WP6QedlYsyiPr4He0Va+36MJ7MBbRp56hq+HJYnsWae7M+dnwGSskG02lymu8xyANrwdKf5i/QyKa3radzxyPzo8e1rLqTgAtzy8QM1rSWv3iATSFeV829WjwMcucQFhpdYtFrB1Uk8C8RhAPhmnZhSMcACKrlo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXmDyRjC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXmDyRjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771407381; x=1802943381;
  h=date:from:to:subject:message-id;
  bh=QmQ+conJESllDdFrlKNHdsOc4ktawtbP4uePngGEMb0=;
  b=IXmDyRjCGAfBgLms3PmmT2VeWTFBN+pXRhefeI1Zr37JWuCL8NGt1Uo5
   a5eyLLd1HMizMXCwDz56ibPIoWx7FdAd3Har+oUhxWbzmiuCtPw9fEz92
   2UJVNqQPaDE7WX0uWSvrMjM8vlVidL0lyyFNJJ/ALkdiisYWbFsCW6IYP
   VhPRq1t9eRa4924m4JLNlRMrjmyMFeUYArS9+CR25P0yPn028tYbi5HtS
   X6rXgoHstKKbk+abSsFyCndUlBD9V9g57M/zv/daDT2WKKjENgD34gEGB
   QVEQpUOpCUB683pk5yBL/q+53kk9Qh3M+bC5Tu9EnklqFq0/Id9ARfhYS
   Q==;
X-CSE-ConnectionGUID: fIJlduUyQQaWbn9N1VeGUg==
X-CSE-MsgGUID: eobeXUEDSXW97ijn0GqQcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71679896"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="71679896"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 01:36:18 -0800
X-CSE-ConnectionGUID: ISNo1O6zTYaoovgEFFdWtg==
X-CSE-MsgGUID: RgaI9TmNQi+80uU6o0PdGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218283032"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 18 Feb 2026 01:36:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsdyh-000000003Y6-3YvN
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 09:36:15 +0000
Date: Wed, 18 Feb 2026 10:35:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlelli:upstream/deadline-demotion 3/4] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude Code:Sonnet 4.5'
Message-ID: <202602181016.KKzOOcnh-lkp@intel.com>
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
commit: 25a8165d2ddca300c48dd6a47af56892877280b3 [3/4] DEBUG selftests/sched: Add tests for SCHED_DEADLINE demotion feature
:::::: branch date: 7 minutes ago
:::::: commit date: 7 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602181016.KKzOOcnh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude Code:Sonnet 4.5'
#22: 
Assisted-by: Claude Code:Sonnet 4.5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
