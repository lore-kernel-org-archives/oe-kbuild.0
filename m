Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302B2314A6A
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069120; cv=none; b=dy0IoGsSLRq+DgnW0OHy1lUDWUT/Cqa3bdIVrm5nkmSQuGJ+lZRyVrCC36U+Ihws3FLugYqEUpqopcDUOs0nFYDTnaYa/EaRMS/w9/w8Xpem1dazL3dnia4z7JLckaeigT1W7lWdRH9oABurZdvMCPmdXX76ftGnuOuQCbXqw6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069120; c=relaxed/simple;
	bh=kqw0XpZxDfZMyqevaciefrI3E3ObtA5EcwUUn/sbALs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PaMDyD1LZL4g9A3uMJEp9YUuLevkccsRJYsqkSVe6saK2SPP02w0wnWSjNLkS559hKRam4t+qg+QxgJAS6Zq7EZaZUH2zIO/OHnjNCE0YWfrcxXou34JrbQlybLdhzZCIs9O3Eon7nGTAm7HtNDGeEfB6t2+OQw/VKoNQ1sFFJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlmdlyLj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlmdlyLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069119; x=1794605119;
  h=date:from:to:subject:message-id:mime-version;
  bh=kqw0XpZxDfZMyqevaciefrI3E3ObtA5EcwUUn/sbALs=;
  b=FlmdlyLjY+R9jQ70y0PXX1VO05RGBLhk0pwWGQ9RaQ7j17v2vHkdI2TG
   jf6siwtYkxt72irsUJORvMkuQ+wb1FRsr0KE8QugXn0Fej5EPFuCi8U5X
   ZQ6C9RsSs0SnC2/a+tKE9Hpc5EPBBNFDDf7BLFMg6pqm+mHTPlADESqt1
   XKof5Fyz0P5SQcZiXRNlLFE9rCKa1nsWZXNpDTo0U8MjmYZ0NJHklTN8N
   Bfb281yHSp1NtjNTGFbhrhbRhwOLRai78DkDDWQ1jFjGstJrF3ePR1giN
   KYLmLE+KoZNs2nbzMGM8D4SmUnfFJppp2S8Nk1IK653yAXHcvF2HBPfuI
   g==;
X-CSE-ConnectionGUID: oGbHJmP0TSCKNWTzGeS83w==
X-CSE-MsgGUID: STUZoexhQZyt1wUEdy73hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69013578"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="69013578"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:25:17 -0800
X-CSE-ConnectionGUID: bG5R4xfdSLKzRQI6vetf5A==
X-CSE-MsgGUID: nDEQJvGjTJqMYsc2AY6QqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189613460"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2025 13:25:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeob-0000000018U-2ZCX
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:25:13 +0000
Date: Thu, 13 Nov 2025 22:25:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 61/867] checkpatch: ERROR:SPACING: spaces
 required around that ':' (ctx:VxW)
Message-ID: <202511131849.gUgYMP32-lkp@intel.com>
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
commit: fd005a371f1c1fae495136b222700f426439dc5d [61/867] bcachefs: c->loglevel
:::::: branch date: 79 minutes ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131849.gUgYMP32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131849.gUgYMP32-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: spaces required around that ':' (ctx:VxW)
#81: FILE: fs/bcachefs/super.c:108:
+	unsigned loglevel_opt = c->loglevel ?: c->opts.verbose ? 7: 6;
 	                                                          ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
