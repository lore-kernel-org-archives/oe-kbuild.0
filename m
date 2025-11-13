Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3156C322DD1
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069238; cv=none; b=Yu+3rsTuAv4pfjZ+kdwMUlBvd5l6ZAtoV1dzGiGit/veCcuMtGhAit3SkrOrEiEOOpRvs20Nb5VwBOvETmMzSWGHPDNvxOp76qkJK971Vd6Bse9xNHNoT0voqex0Vfp6ma/8NhFY2e2UnLTtBvXJz7XupDc3WkfWXZ56Zyv+HZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069238; c=relaxed/simple;
	bh=eaFnk9ce8xZ/9K7QADrGCUNCkRf+5SuIF01+YJYpk7M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tyksoL3KCEA5wUKc/194P3S4DjVgBBq61HkV9BjCGr4UlZ1c6k8nz4GrYkeYsHGgNOrOoOQk+4DIE1wXFJuX4BF1gNjcVjgVwYAf+2FQM63q5hMsh+8lcO34rDxMmLyHc1qJTGxMPKh5BpYzX8UruF1KJ0bJOhQzEXP3u8NJxAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9Qlcbn7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9Qlcbn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069237; x=1794605237;
  h=date:from:to:subject:message-id:mime-version;
  bh=eaFnk9ce8xZ/9K7QADrGCUNCkRf+5SuIF01+YJYpk7M=;
  b=N9Qlcbn7OhKvLK46SXvSf+THqgse/xpfM+oCRHRMQJeC7lEgJFiwf7n2
   S+fcxZPGk2LXfv71nQ8naVX0JFGzsZQJRKTRqbep037Ugxaj8o0btd6Dy
   PBtkG5qtP76KQyscH1gISj86NsHvkcDoaN7cBIBSS4qOzBT3pDvzjwDP4
   bu0BgWnXwfLyEHzMxz3d2iDWnoaUbQTpFtkhMLEU2VjkqJ1NxFoMdSq21
   m10JIpAiz4R2f4r+GLAkf3xpsZWdcXcacv2quNrni67WE/uwfmkEpQ4gK
   ZsYxQ4wV8R5h7jqScATZ9U+QAylxdZh1vpO/4OpkzNPzcnePSECUMlFud
   A==;
X-CSE-ConnectionGUID: JO9wcCKQQU6YT4PPdX9F2A==
X-CSE-MsgGUID: CCUhc/OKSKyAGHPw2mQuGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64871227"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64871227"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:27:16 -0800
X-CSE-ConnectionGUID: 9w1+WFjeQDirYxlORo8JyQ==
X-CSE-MsgGUID: DiZKpFflQk+c9vtwN0EbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189450237"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 13:27:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeqX-00000000199-48zU
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:27:13 +0000
Date: Thu, 13 Nov 2025 22:26:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 319/867] checkpatch: ERROR:SPACING:
 spaces required around that '=' (ctx:VxW)
Message-ID: <202511131803.9UsAMKdy-lkp@intel.com>
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
commit: 920761dfc1565779fe8102ce7c2a85b37ea5f8f1 [319/867] bcachefs: Defer deleting interior snapshot nodes until remount
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131803.9UsAMKdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131803.9UsAMKdy-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: spaces required around that '=' (ctx:VxW)
#170: FILE: fs/bcachefs/snapshot.c:1964:
+	struct bkey_s_c_snapshot s= bkey_s_c_to_snapshot(k);
 	                          ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
