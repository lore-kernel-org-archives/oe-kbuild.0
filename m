Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF99F3446C5
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488548; cv=none; b=dMuv8QrIEoEpRGLOCdjJ5wLF/ayxOCKx2lI42BXydyypUsfLFBWkIq2/mWi2PR9KN2AfUbsLLGxPJQIWaxHnmCTxFKpqdSobMQ///Tzq8haB/TW/iimUDHz/eEdMTWm7HI2wvQHya7IlICussfkyFp28ISxn0RfwoXP2Whgs9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488548; c=relaxed/simple;
	bh=Lij3ukiz3hcwU5MREaUmjKQj6lbVShhygzFSsldY+0U=;
	h=Date:From:To:Subject:Message-ID; b=rlnVOXPedCekVNsGijgMuc8PoZk1A7SDAbB1v3fV92Nqj2Fb4Im+r/sYS6rYLnu6RdAiQrOx6DjQd3veWx1rEPnFFbL44XBkAcBZn90An57Ftmz6FYlc4ed4DAxG4/A5Rh5paSAwNmyRt2rwURvnSEM70kfQ0aT4OOi+gv+zopc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZUachR2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZUachR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768488547; x=1800024547;
  h=date:from:to:subject:message-id;
  bh=Lij3ukiz3hcwU5MREaUmjKQj6lbVShhygzFSsldY+0U=;
  b=UZUachR2CQa0jqjwxtejLBUvafc6jT8pt0/KlPTwy8+1KoCumUHOgYpo
   kdLrpZpy0J30QTxpIxWmYfvckMUzRodxUeMmaL8gc/jlEU2vfRCAtxmGX
   ojDBghAJd5/74DRwABY2dxl9cdqs8IKoJW83hJGjFU1673Jh4ZnZFfguG
   BEF/+7TZRePl4IBHb0f1pdmr1NSoFX8OYXTuYG8pd6QZTBtgt2l5BF/KM
   1RiUCsXLIDZ7LmjIuuqFHefAXMrHhnt4mLN9ApK8RWqck7oidS7iOAFqk
   LMiQaQt3Bk+oYmaRu3sCwcR0qsMHRFmwiFDVug0IHmOadisH9XRG4YzXb
   w==;
X-CSE-ConnectionGUID: rKNhBK1HTw21Oin70orEfw==
X-CSE-MsgGUID: E3DqJCjZTPaw+MXYsonKeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69693002"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69693002"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:49:06 -0800
X-CSE-ConnectionGUID: 2tctABsORSuShi2OVvFVfw==
X-CSE-MsgGUID: QZGf7G85T2aHjT9d/SaZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205385023"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jan 2026 06:49:05 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgOel-000000001ah-2q13
	for oe-kbuild@lists.linux.dev;
	Thu, 15 Jan 2026 14:49:03 +0000
Date: Thu, 15 Jan 2026 15:48:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlayton:kdevops 1/30] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'that'
Message-ID: <202601151508.FxZjWNvt-lkp@intel.com>
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
TO: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   fb901466431f1e69919cf7963f2b061d1fbf0772
commit: 35379d9deeeed0c5b141e65dea59a639572ba95b [1/30] fs: require filesystems to explicitly opt-in to nfsd export support
:::::: branch date: 2 hours ago
:::::: commit date: 19 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260115/202601151508.FxZjWNvt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#15: 
check in nfsd to ensure that that flag is set for any filesystem to

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
