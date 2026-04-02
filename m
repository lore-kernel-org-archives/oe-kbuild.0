Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF138318146
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 15:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143884; cv=none; b=N5Qf/oANFdLxlNr6az/J/z/GVT14DeJTAltPC/+TVdisb//tWClgvjD1fB+m+ObjAcDPlcSr8fFZXbWYoL8uohSBwK9PYO6vE58uoKI7GD1xyHDq90uSXKjxJq2YIOY3s2daqJ0g6EC80gxdcXqd8kgYa5LwHebsY3KO8Qkw2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143884; c=relaxed/simple;
	bh=hEInRX1oCFlN6SldDnf68WD188j8JuK/gBuQ0EYOpdg=;
	h=Date:From:To:Subject:Message-ID; b=Hl3RMfAINwtp64Jpq9BtbWkJWwiSG04u8QNe+z5byQHoY2Xo0+S13xrv4iJFy+7TmLwI7jxOXCogIc13wSHEoBWWtNg98yOY7KL57mjc1yFG+spvOjkPwogqPVMa7YcptJHDesgdhWMCrHBM53TQ5lxX2uiW0wd67V8PHuYbIn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1bZArB6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1bZArB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775143883; x=1806679883;
  h=date:from:to:subject:message-id;
  bh=hEInRX1oCFlN6SldDnf68WD188j8JuK/gBuQ0EYOpdg=;
  b=O1bZArB6XLJ0WPkTtvSp8cumVMRVEqiTapPuyftF493JJe/hy4dzfmh0
   b+o3eCetceZ5Zo13MkQphphTpNJZ+3BtJigzraZcVW8diE//WP7dgRWsf
   7AZsDyYUZhAk38xoNzTql2upleFUQtSK7n5h1Zwv4katVGL8iDM4+6PEe
   CqeCDekyevZpA6bGjVXCBw+SgCJfh983xJA9586abTNCawT8Pp0xlAae1
   5HPXBDicerueStVyYXwWBKF8Chj0eCL8Au1pbbfTF749rJZ5hmy/uuKLV
   csPbcBjOGMpb3rlMsiBy1DFRUxxQ9BUwXvUz6Mpz30r/zw+s4WjiY75qe
   Q==;
X-CSE-ConnectionGUID: +8c6SSK6T56hi8EWcWooew==
X-CSE-MsgGUID: rwK500XbR2qPyBIXqNfHfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87600049"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="87600049"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 08:31:22 -0700
X-CSE-ConnectionGUID: +ZZGztRXSNa+D+FcoV/pKg==
X-CSE-MsgGUID: pz8QEkgmTuK8jriKImcAOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="231816250"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 02 Apr 2026 08:31:21 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8K0t-0000000094s-2Y3w
	for oe-kbuild@lists.linux.dev;
	Thu, 02 Apr 2026 15:31:19 +0000
Date: Thu, 02 Apr 2026 17:31:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:locking/futex 8/14] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'both'
Message-ID: <202604021712.gjj3pEJe-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   37219fe611b1df3a9c49cec33c3f4f4c4ed489ec
commit: 468798584f95ab6c8bbf72de59635b7f3000ed74 [8/14] futex: Add support for unlocking robust futexes
:::::: branch date: 17 minutes ago
:::::: commit date: 17 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260402/202604021712.gjj3pEJe-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'both'
#75: 
    2) The gaming emulators use both both 64-bit and compat 32-bit robust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
