Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45BF3246F0
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069359; cv=none; b=fOoRDEIlWEgFjQuyRIiYURCxwIvmEx+Md/VHqCKhoqERNaFKxCFDkuz8v54R2qC97ZkGjdTN7h7g4+/SaY/w+X6iw0GuIGkzi3OP8tAW1/RWXa2qXLS1CvHeTuDHHY2fgBLuhSjfsvicjXOYG11c4/H78B4VBhbPWS/zKdMY5h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069359; c=relaxed/simple;
	bh=5HX28L3cFIx+jXG1b4kfsM0DLnGhSnmxEHVN/EIc4IM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JBRfmc6eVY/86zfTI4LHPNY9bcJvVN/J6J/57a8FHfm1mVzQ3cxu9URXl9Raa3ufrfP+JNVYFu3nDriXDmdhDRHEbufUKjy/s1uk2oIftOeYyH/9Xx6h1OoTArtAqvbLcTAaorQmqr1Dd6QjkWqzKUEqMPf/MLDy/5oE6JTaCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COPp2wK5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COPp2wK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069358; x=1794605358;
  h=date:from:to:subject:message-id:mime-version;
  bh=5HX28L3cFIx+jXG1b4kfsM0DLnGhSnmxEHVN/EIc4IM=;
  b=COPp2wK5u/IYcjZnr/sC3P8vyCWnQyVbx42KlmnDGoxwWTOtxRoPWqIJ
   s36hBqEdn+ptYzpasl1ojiAwc5yEmVfuCl42R1VQ1yNLcgEMQh33pLvLL
   kR2VSrz/4gChtd7wszs0PcpQy9DQu1Sel949DqPVtCHrpTzCThbsGCllz
   AHcT997XwhcoqYfCumUOlYKaqBHgvdCsC5LLa3SP0OBMFjc4oslRDZCCU
   lZWu7hrle16mELbutIUJ8OsAjRFd4x0TwbDdKut5EFSnYqLCYRxkwFYZR
   xD+tu3KUCwrUeYlBkR2JRHw2mBgsg1Tsc5xauwlE4C9hsTxPMCXa2nDfN
   A==;
X-CSE-ConnectionGUID: E0z/zpMpQWmtZPxh2TSCBg==
X-CSE-MsgGUID: ae1/O9MfT0y197IaiMkgIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637560"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637560"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:29:17 -0800
X-CSE-ConnectionGUID: HI0GGxuqR3Oyd68DWvQdRA==
X-CSE-MsgGUID: LBFW/9GKTSuqfboBO2tiTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189244554"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2025 13:29:17 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJesU-000000001AV-35Mi
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:29:14 +0000
Date: Thu, 13 Nov 2025 22:28:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 711/867] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate
 line
Message-ID: <202511131919.s5Htuiua-lkp@intel.com>
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
commit: cb31fddb5206d4c94a2daf70019cdd3eca350f35 [711/867] bcachefs: Decouple journal.pin fifo from last_seq
:::::: branch date: 3 hours ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131919.s5Htuiua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131919.s5Htuiua-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#301: FILE: fs/bcachefs/journal/write.c:263:
+				 * */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
