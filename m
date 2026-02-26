Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C744D02C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 19:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772133381; cv=none; b=Si7pzlQwIEKhnkkbWRwleNYz+R6gMzvGTW80PrhL/VQ6vlrHeAnrRMTfQODskODo3KPAf9pdfJ+Vgmoa/ll6y6HlZmagi9TSYHCp6DAkXjtFBwy5+2jcMcnEFaqf79xKvQ+iP+D+5SVjNgge8K3rDd0TI5uWkq5LFOfzxIzpFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772133381; c=relaxed/simple;
	bh=cm630kn4SFWw+nV16oW1r8UkocE4GTMzMvO1bBPca10=;
	h=Date:From:To:Subject:Message-ID; b=c5qKG1NI6gcNcN0OW0tyVYV9jPtXOSy77s8prTz+iJ3/ozlFAtM3cHUoWS55Rm/INTOnqYXoSiAIaUYGyCclEGdk6nc2W5dEbzuUbsM+M7jRLr3odOS0jhXkaXYlP/gCZ6CezgYnEmEfwB+Jp+iq3Wc2boP0jJH+6CLae7Pm21M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgTgb0jK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgTgb0jK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772133379; x=1803669379;
  h=date:from:to:subject:message-id;
  bh=cm630kn4SFWw+nV16oW1r8UkocE4GTMzMvO1bBPca10=;
  b=jgTgb0jKg02a+IHUCvsoYgYonXckf902A4S+EQsqIk82YWQ/bNa9oky1
   +SoRWSGoZCcSMOJmc19zoQlYZi8gFLJa+4dJZAwIQ+VyDm6I0JOQblSSK
   UfSvCcjgYJ8dvYULOF5QpsfiPz6G3cZdv+yy8m+YSwU1GXUv59gdeqtUY
   S4cUvtxZ+NP5l2IRuvBVelL3J5oJPftz4jAF7FVJinyucc+9wNiQ6V8tq
   6zt+VVTK/7PtcBSS1MJn6/r71xZOR0OAbto+J1/AyZNID5CzkVcRWerE2
   rA02uWJUkG+lCpei7uwKmub9WP1BZ9M+0jArL5LVx0Jj6EKdZZWuIwAo0
   A==;
X-CSE-ConnectionGUID: 24MS0/uxRLmm6qfrDQFd0w==
X-CSE-MsgGUID: VOVjNX5hQTCeNcEbX1QQWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73078475"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73078475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:16:17 -0800
X-CSE-ConnectionGUID: Cy7OoaeJS0qaOZCyE1piZg==
X-CSE-MsgGUID: 2AGEU4XDS1ensQsbKiXz2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="221280651"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Feb 2026 11:16:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvgqM-000000000HS-089O
	for oe-kbuild@lists.linux.dev;
	Thu, 26 Feb 2026 19:16:14 +0000
Date: Thu, 26 Feb 2026 20:16:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 1/2] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'feedc0de'
Message-ID: <202602261912.rCWxNico-lkp@intel.com>
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
TO: ProofOfConcept <poc@bcachefs.org>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   890aec6dc1fe5551e337a2f19affcdf07578254d
commit: f1d2f59d9e0b58c5f5c88cc7a997ce239eb45154 [1/2] bcachefs: ec: handle stale stripe pointers gracefully
:::::: branch date: 38 minutes ago
:::::: commit date: 83 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260226/202602261912.rCWxNico-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'feedc0de'
#26: 
Reported-by: feedc0de

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
