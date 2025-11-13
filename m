Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92106324719
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069242; cv=none; b=EFE+aJpDGjyFRW1Uu4ybyEGi3BKGG05LmbUPHIXo/MsfBq8/hTy9xj+6sPAeEL3ckIiuiINro0yoIPdMTK3GSvYtn70uvbUhY3ZToF+0RiBfe/I5y65rCu1VLT37hh/SGRwOL81ChcPfhDe/ST2CwY03Gu1OhPs1ERH23XoKMfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069242; c=relaxed/simple;
	bh=HTBV1IqD1Myhddnsav8azezXvJr9t+fjRYs91ThusXU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BcKVUXIiB1V3qepuRa7n7QsysYqcyUAUaHsNm/NiDeHCRjm0WGxkhxwYFldB4PzeFYiWkajWVfiGOo0iUrv989qIdyTV9FWgWOWB+ZUjvTzkt2ojGqVQ8HxzW4E1pDKYE13/ZTRANFcfA2ASQQNqktaAZnZ5W1KBSLVWVFResvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRiTe4c+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRiTe4c+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069240; x=1794605240;
  h=date:from:to:subject:message-id:mime-version;
  bh=HTBV1IqD1Myhddnsav8azezXvJr9t+fjRYs91ThusXU=;
  b=YRiTe4c+MBtFdkzJPRWe4jmWNXTHjvVBkcSfd/3akC4GBvmA/deGphMZ
   HkZw9vQAs1xdKLiXeB3WmtJFCIstTmewZG95BCqHsXeskypmjQQxtagyy
   8p/v6iVjBDTb+UWvZUe3RfSafN/OFZQ+5IRQu9kpXLhuLxT0KlrDoFznX
   B5VZFgXIbkXN+ewOdHJHNHVLfn0XMq/m4vizJB4KMB8wi/0LIKSEuxxsU
   vp6v7bufMAUanx8FLYnlOjvRKFy1Gy75G9Ks45k7qZCHBWLeOrSBfqy6F
   05aQ45Dw9KxHmtdHA6QL6oq2AKw8afvernF1N1DNWZJ0VFYpp2rXRoo18
   Q==;
X-CSE-ConnectionGUID: UypoAoXUTISlh3VYSTY7yA==
X-CSE-MsgGUID: baNmjaE4S5OzxViiMrNaeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64871230"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64871230"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:27:17 -0800
X-CSE-ConnectionGUID: oRKNG9ZcTFO2JmZd82sKHw==
X-CSE-MsgGUID: LuLZaMKoStKGcTIQtrf7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189450240"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 13:27:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeqX-00000000193-3eQU
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:27:13 +0000
Date: Thu, 13 Nov 2025 22:26:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 231/867] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate
 line
Message-ID: <202511131842.N2ytdqbl-lkp@intel.com>
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
commit: ab69169ea6ba228654bb70f562d0e290d4190776 [231/867] bcachefs: bch2_fs_opt_version_init()
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131842.N2ytdqbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131842.N2ytdqbl-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#469: FILE: fs/bcachefs/super.c:1056:
+	 * xfstests... */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
