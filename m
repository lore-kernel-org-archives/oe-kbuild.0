Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E063923ABB0
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769363954; cv=none; b=ZDjDguu44aCZ6XOGiNgDPkukG9UXTgbppE4+mz2JvyZ41hVl/yXLmizz94yxAP4PllSGi0as8QonX8x/44BmY+7acE3ah365wE8hQbEGV4+wMvVrTnnCmeYSzXz5YllmhUJufDy6TL/oT33nfVWw8Jq1va5euoxrkG6lFNdkEaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769363954; c=relaxed/simple;
	bh=mWImUHjW+nDjG10+psLL/bntDh4UOAbzTbbVDnPqGLA=;
	h=Date:From:To:Subject:Message-ID; b=urKycgtNigjriz+3Pst1B09smlGuyvzPw2/scUHoH84K3f4CiQ6/EhNJmeqiEw+afnO4vrtViCAduZ9Y0CGzW0Md5SdGvPRivZlt2eThNMLSLAePdoH+sI8+B4qjfH662XfIWYv+ae/o332cRrGlWdMIn/61Io9W+WP+MPO7lFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAUjXvVv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAUjXvVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769363953; x=1800899953;
  h=date:from:to:subject:message-id;
  bh=mWImUHjW+nDjG10+psLL/bntDh4UOAbzTbbVDnPqGLA=;
  b=DAUjXvVvWrtQxjcwGk6NriJ2VANiYbNzop5R0DZKGGIa+iN+Dc4WbJB9
   PXsbrkEmN2O81xMBXYPgSSzDf3wKCmnyTaKdwg2SEdYRe7hT/zdfVpJrQ
   OZgo07+19CGIrPBpBbizpRhpXAfbhTsegtnfmpwxeJDn89oEbVhLWE643
   tk4zyza0xcI/ZFuNfXSjQuC2dqXFGRCGtaz2tRnu2/Qg05ki/c8hBH36w
   6kt8TivL6xqlL0CU2EPQr/pXjL6vWXXrNSI9Gq34cJZgdVaM8CKW1pNdm
   niSju6fLTFb1cBYxKCOo2XKbT/fSJz1zUWfJ/VSNU6KepgiSkTwPht0MY
   g==;
X-CSE-ConnectionGUID: NHu/sMMOSqCCsNxa6YbJrw==
X-CSE-MsgGUID: HPc+OXTIS12zwrkmRt5umA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="69748482"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="69748482"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:59:12 -0800
X-CSE-ConnectionGUID: HGOAVU9bTsOkDEnKpEJLBg==
X-CSE-MsgGUID: wtRXYbVnSoaUTts+Lsf0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="211959197"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jan 2026 09:59:11 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk4OD-000000001KV-3aUy
	for oe-kbuild@lists.linux.dev;
	Sun, 25 Jan 2026 17:59:09 +0000
Date: Sun, 25 Jan 2026 18:58:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/pan-opticon 3/24] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601251854.0TnPyiMa-lkp@intel.com>
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
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pan-opticon
head:   d6fa4af5ed47e33eb5030914574ed208088883da
commit: a035001dea37b885efb934e25057430ae1193d0a [3/24] arm64: Convert VTCR_EL2 to sysreg infratructure
:::::: branch date: 6 hours ago
:::::: commit date: 10 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260125/202601251854.0TnPyiMa-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#11: 
Replace the ad-hoc definitions with the the generated version.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
