Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50E22EC080
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769201991; cv=none; b=T+wkNGtpeLGV2evxQJ1bjs3UrYhKyIajU3QROjP5KsTbcezdv8pc48NXtlvpEJY8D1+fs5WRzfob7mG5BLZJaehhT0e3a3qj0lJElj2h1/MyUvBtAOO0a+32RQhSY2bDeHCAGAJRD0agmXexr22ykq8+8N3pHMPwtmni8c5Y8/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769201991; c=relaxed/simple;
	bh=4r2j15GJzqfbvrPVBZ6QG5xoV3Lmh3wpIkcLJHQGknA=;
	h=Date:From:To:Subject:Message-ID; b=SH+hfr6zubNnhog89YJbYdh/bScN4/9QFj9Xvaa94jPVCnJa55uPzzZUI/imAPD9P65ab7KuyC7JWi5DWRvtoO3BvmRgOHE9kuijEHsLxwMjF4R9+A6Ql1EixE5cTuQ2HiSHZj7UCBZtKoiZbWXekuXPnhVFKFduonf5ZlKEtJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgqoblPr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgqoblPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769201990; x=1800737990;
  h=date:from:to:subject:message-id;
  bh=4r2j15GJzqfbvrPVBZ6QG5xoV3Lmh3wpIkcLJHQGknA=;
  b=IgqoblPri7UIWFZMwYb8dh4U2FIl5+IOP5V3EEOI40ybzfUI2ONN+IaX
   xViLbN45uw74m+2OAhIExCOdv3g/JmxnUvtE+bLCFJ9P3XbwQWsBXJoZ8
   sxet+zPdvHD/iA++MehFuUHJjHA9vamxNEaHkNAshw5+m3FiYNyamlap6
   9PN8qg3waC1SsfHtH2kD36KQBar6CYTbYaOYTbmZn3Q5o6+OCeJynB9PK
   G/Nv3iUZ4m/Vi/HmihWL3NIW+mUc/Qqz9QU9OR7RtWpX0B4ETiX+udKoD
   xEalrk+aZkRAvxrOGRHl4YlZLWz1vLbrTgNiza7Mm+Y/lBiafEcZaNoom
   w==;
X-CSE-ConnectionGUID: VKpvDx7pT62Or/GrWBWVPA==
X-CSE-MsgGUID: 2sNl16gaRfmOJwoefPt5Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81900149"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81900149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 12:59:50 -0800
X-CSE-ConnectionGUID: HWGXb3P+Q4ieJPJEMp7KXg==
X-CSE-MsgGUID: JVeFCF7rSUOtsnIBRQqVXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="230073638"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2026 12:59:48 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjOFu-000000000ov-26aP
	for oe-kbuild@lists.linux.dev;
	Fri, 23 Jan 2026 20:59:46 +0000
Date: Fri, 23 Jan 2026 21:59:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:scrub-syzbot-fixes-7.0 11/44] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'yeah'
Message-ID: <202601232108.a79v6Gh4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git scrub-syzbot-fixes-7.0
head:   2d76e519f5fa0d3323cdd2ce3404fc19e6c23f3d
commit: c45a0220071a896d5492a1b839c518327df54f9f [11/44] fs: turn on more warnings for the filesystem code we modify most
:::::: branch date: 4 hours ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260123/202601232108.a79v6Gh4-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'yeah'
#481: FILE: fs/xfs/Makefile:73:
+ccflags-y += $(call cc-option, -Wno-error=unused-function) # yeah yeah

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
