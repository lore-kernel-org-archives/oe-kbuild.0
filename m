Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CC030F546
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 21:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448550; cv=none; b=ACR8FMXUs7Cy6wUEDGi/9SwYwRRoYAQNLarFDoYMr/ULA0jM7Fs+wk/ynrJSPXskZlVvJFyPwN30skl2IM6ZDib0724chxkluZnyb1PHTn74HETgFslZhumio8ZXtpPiEnwxomR5fLFss/ZBQK2Y4D4XjvV+gM5T5dqGZfNHJf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448550; c=relaxed/simple;
	bh=lS5QCii6h9pn9eidYDQSwnJHO+VRJMZ7T6pNjZlFs0U=;
	h=Date:From:To:Subject:Message-ID; b=g/y0xKFMF4MeTxBrGpDAeXF48aGYXfV/yhuwY8IKAuE5/mDycrNmAwQSsAMLh2z5cDw3B742CXuEdf9ZjE4CdmrHqACYYIUDrDNNk4t4o3YFMLb+t1iGCeBaVaHjD7EO5tiM/nIRKexg416+3JLwO74M63wzNGBS5mCN5iBqBEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2O2ROuY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2O2ROuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771448548; x=1802984548;
  h=date:from:to:subject:message-id;
  bh=lS5QCii6h9pn9eidYDQSwnJHO+VRJMZ7T6pNjZlFs0U=;
  b=C2O2ROuYaBDV684YvPXEisbERCkwhBA7OccWqir5a7X3xhG6E2iQnWGF
   ehwA3W9q9Stp4gv9rtF//FoOfQQYp55hXR5OjX8RNmaPzyizoCcrFuzA/
   oVEoTNzCM2Dx/lYI6tkpRdSxQlaYPDbhMwkXI5Qf+8GFsprJ+buDqD+rE
   Mq3caN/Set0hZeiDMwAgTLJAJ0XuTEPyTA55xyOPl2YNc9JrLyS+WsgxH
   OD897b/ltP/L/bZR6r7YvS1lsHCLXMGaN93HyBXRE032lVlyh2Lj9gqc2
   6bWlpePaQhzaLx8xOGLcZvhfitzBDGSHzTxgnVDgBspxHd12at6uATmev
   g==;
X-CSE-ConnectionGUID: Ib4vR10eSNGapP/cDMIJFA==
X-CSE-MsgGUID: YF3a16yzRNKl79m7osZTuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72624743"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72624743"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 13:02:27 -0800
X-CSE-ConnectionGUID: 7N2FnKc+T0K+qvVqiVK+dQ==
X-CSE-MsgGUID: fclcc139TKGxeLB+u0fVFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="218130994"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 18 Feb 2026 13:02:26 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsogi-000000003k5-3KLz
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 21:02:24 +0000
Date: Wed, 18 Feb 2026 22:02:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 404/405] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'binary1248 (GitHub issue
 #1060)'
Message-ID: <202602182248.7wl6yylO-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   80bea3917167e5ee3eadc0cb195f58b06253a58a
commit: 85cde1245a273a5b44dbb108f98d51c77468d730 [404/405] bcachefs: alloc trigger: convert BUG_ON to fsck_err for bucket going empty while not open
:::::: branch date: 25 minutes ago
:::::: commit date: 30 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602182248.7wl6yylO-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'binary1248 (GitHub issue #1060)'
#31: 
Reported-by: binary1248 (GitHub issue #1060)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
