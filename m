Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9BC323416
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069243; cv=none; b=L+r2osNYFsHMilOtJolzD/aT86ddeUNNz/yH8D9Z90+Z/HhJLdt4Bpw4srReSoWvCw3KlFkBjHwM4I5qpom5YYJ2Ji4QnMa7DibDIXhCCqC9gp/I9sc3L6PCbflMHFzOJVXYLdOuo3BAAHZ7VxEX9AJn/kho5hJYhQyVBpMFD+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069243; c=relaxed/simple;
	bh=QArGe9gCoXkVki7L1hR88QOTHIRx27F2ye9bCMHAnhY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvjV5MJG9dQGC6tv00M9pBxBHSpPiDIXXjmDcBPfKWaA+TOxB+YpxOYJME0rLIi6B365UFnD5rIEEuJInsMMEBFakM4b9NmaFDt+QS+Q6SakCqPZSqdDq2rTxX979TKDMfEUcOehIH2tK6VYeO35ee4bNbaS4mnAfnEM+4deldI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWipV7GS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWipV7GS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069242; x=1794605242;
  h=date:from:to:subject:message-id:mime-version;
  bh=QArGe9gCoXkVki7L1hR88QOTHIRx27F2ye9bCMHAnhY=;
  b=jWipV7GS0kBsRaCCLR/p/YTmgmgxrHE336MbsNs6151oOwrqhCxp0fN9
   YAga/Hny14qRFdkPvzf8qVvLVZva+I37tZrGkCWnrJ3nplvSSiyuaYZ5B
   8KBLQiSmPc6OlcpV5KLx0WlcqvcHwLeVHe63WlhJyipyteqaziamzeXec
   2PZvr720G2oPQ0pDGLiupmv1kB7R/krG5Zk5vQVtXV1y5if8XMeug5OcI
   XSzkd5rft1e3XhPstPU6eKiLoqR55QR3OiURMd7KZI/pkpUqBvkBPfmi5
   38eHNCW0KFLYeAWOpl66BVB9Jp5ooCBSLrZr8JSBGoulUNdj/EctB98PD
   A==;
X-CSE-ConnectionGUID: I7PrtrQsSyqPyhpE9hDHXQ==
X-CSE-MsgGUID: CEwlB/FtR/ypMIpR1r9cFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64871232"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64871232"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:27:17 -0800
X-CSE-ConnectionGUID: zov+LwPLRTmPSPoEKror4g==
X-CSE-MsgGUID: amlvP8VMRdSGqg3wsv5TUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189450242"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 13:27:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeqY-0000000019D-0G5x
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:27:14 +0000
Date: Thu, 13 Nov 2025 22:26:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 441/867] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'unneeded'
Message-ID: <202511131927.NdjQ9KXR-lkp@intel.com>
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
commit: 5197303439287339e711264ff77b45d125f60da2 [441/867] bcachefs: Add a comment to bch2_accounting_read()
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131927.NdjQ9KXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131927.NdjQ9KXR-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'unneeded'
#31: FILE: fs/bcachefs/disk_accounting.c:952:
+	 * We want to drop unneeded unneeded accounting deltas early - deltas

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
