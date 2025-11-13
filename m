Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576B33246E6
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069303; cv=none; b=oEJZi/K2PsqNmS0NWZTDwmd9FwosSmSW2MCdvVOp6ffvcGTzs2f9yBRD6MG4+pcChthyc/C2QcOlJs1NdzvLVXfCjK4C8cBGe29k4UuPFPArhsKJy7Yy8ltX6h/2fErp3noMrfdgglpzFH79E5Cgc/aZoEIzqmpKnP2LflCGFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069303; c=relaxed/simple;
	bh=rGNWH+eSQ2pcBZ8J9G0eS0pLO4FMUpU6pZ0wh3HXzsk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zxw3brKRKDedw/oM+QuUg0tHEdDBnGuV7XoSlGpWv/AW7B05n7oU53Xcop8k8Y9rEeIJvxzCvhqSnCkIcPq5yxRDHYzm79tHMlGPQ61DwejI/wIakdeKrpuUwslXd89GnyE4IX3+ziMfvvgkjrCQ6FkFE8Xj3j3Cl3+xzK1WqIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPZBFl4z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPZBFl4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069302; x=1794605302;
  h=date:from:to:subject:message-id:mime-version;
  bh=rGNWH+eSQ2pcBZ8J9G0eS0pLO4FMUpU6pZ0wh3HXzsk=;
  b=UPZBFl4z39xL3ZckAyOfYJvNoaHZOHaFO0Cmufhfah8B4Ncd0q9HK6Gy
   oLoYNSOxULsxrx4bpfeiHr4XPAtmEA872bAmSDFdlkBhMo5RGgKe49iPQ
   4rzadQ4wdrIVc0th3e6VLfWw603ZAr8IA1PZPwydDfQ0K9A+qEeh4HBlM
   t4WyRCRUfjpT6sl6pO6uumLWwHWzCN0X6HhgJMa9pfzwAFsEb+l2wGMau
   h1bQuHpDKPfq5ElDRZGx89V1+DCibbs5lr8ktCxyxwKf/nrGQ8FrfxV4M
   13iwxQo4gQUmcyBjgLZvEm113E8qrOoUUtQJWXz18IFZpabr5c0JxxZ37
   A==;
X-CSE-ConnectionGUID: PFQBIEfnR62lb1UKVAPAZw==
X-CSE-MsgGUID: M/cmfQXXSDSRVggDLCjBgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637519"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637519"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:28:17 -0800
X-CSE-ConnectionGUID: e1bjWLhoQvyNdkfUt41RSA==
X-CSE-MsgGUID: eJlx3nOXRuWyjh9oJJpUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190035932"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 13:28:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJerW-0000000019r-1Vfl
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:28:14 +0000
Date: Thu, 13 Nov 2025 22:27:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 555/867] checkpatch:
 WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements
 (16, 16)
Message-ID: <202511131908.m7Z0wmuC-lkp@intel.com>
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
commit: d24b1f48e42decb8cea185d394431da85bae7693 [555/867] bcachefs: bch2_bkey_get_io_opts() responsible for indirect extent opts
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131908.m7Z0wmuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131908.m7Z0wmuC-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 16)
#118: FILE: fs/bcachefs/data/rebalance.c:370:
+		if (old) {
[...]
+		BCH_REBALANCE_OPTS()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
