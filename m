Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190143246F3
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069359; cv=none; b=kDuqSNHYJQqgzwN4eAbTCUxxOLOotlOCB25prS3Ae1IFB2dH2fmxNrbXwYTL2ufBJVg81n7DUVsDd4t4791ca5pbkWYQXeIUgwwG+oLvP0MTX7pQ2X1aw1FU3AfyNb6DbZ/m8qY8xyLfn/vBb4xjKHr8RkMNIQv6P4pko6sSq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069359; c=relaxed/simple;
	bh=HbDVaYfa8nJG/ZYBqJC/iNcEDtp790Jp6JTjBF1yauc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLsqYpla8Vn/2ehWEG45QNZCtyloztFGcsNyoSiXjLLZUDRck9Udazjl27rhlBEo7jBkffooBMpJjSA+Xcz+9qnY45vJzoKCCL8YxP36R7jfC51Dt410z/B+soRdsDfRjtgZ2wdgpLAkwJQxVVeMA+biAuGA4f3eEuSLJhgbjnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLxbElQo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLxbElQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069358; x=1794605358;
  h=date:from:to:subject:message-id:mime-version;
  bh=HbDVaYfa8nJG/ZYBqJC/iNcEDtp790Jp6JTjBF1yauc=;
  b=SLxbElQoFl/70CNSpF5B1k6udjEWgu5ty6sJksIq/+3Kymrj1rNE7jI4
   u1Iy/MQz8LFp6OkyrI3c3+4Q7tSPTNyb/vqe9s2Q8Mubq/wGUYD2YlmCg
   fz3WbaleDjSkWUPNsRvJNyC+ekouvb+lCwwPPO8lS9ray2WJQZt9txXRT
   gqNJ+tks1CfQoxaZWfeuV3ZUszAukF1sExFvVNcJthDgWnA9vOD1deQsw
   JWFiy5EnHLKL2xrZbMLaON1Hi8ZfVLTKoD+Hj40YgNfMPkwX2wVENwgIA
   Z1R0OjZr72yViei4SDHyVzcOmwuzpTe1MtgDF4F9pFgr+IW7fnPBYpfd1
   A==;
X-CSE-ConnectionGUID: H3kVqiY+TV+TZbDGePMDCQ==
X-CSE-MsgGUID: ZOKtu7ZbRsGTwSBjHbKaLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64167533"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64167533"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:29:17 -0800
X-CSE-ConnectionGUID: PDauE3rwRFKR9s5hU7eflw==
X-CSE-MsgGUID: hD0nwzfIRaqc3Dig/QQDcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="194744322"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 13:29:17 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJesU-000000001AT-2wYo
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:29:14 +0000
Date: Thu, 13 Nov 2025 22:28:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 672/867] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202511131954.Hy16oEgM-lkp@intel.com>
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
commit: b715146063133aefd7b8088356ab782584d83c55 [672/867] bcachefs: str_hash_dup_entries()
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131954.Hy16oEgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131954.Hy16oEgM-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#57: FILE: fs/bcachefs/fs/str_hash.c:245:
+	switch (ret) {
+		case 0:
[...]
+		case 1:
[...]
+		case 2:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
