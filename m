Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06B322DD1
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069242; cv=none; b=gQXaIY0Fp8a0hL+lSm17R0vzcTsogU47PmEOwCRcYOtf8EjOV4i9C8p+X6eZvSw6az/WgfR6f2qABWEKjEJXpOrOLoX8QL14cYXzFEZHe+v9VKHUNQ91fGpbVVnc8XibdxJglG/BtZl/a6sWgWkjK/fNeUnEaDcaGKPIl+fY5KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069242; c=relaxed/simple;
	bh=FVtEq2RaZFMijlHRH50Ehpw1HSOi1iPZs7C3/3B0Mjs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tQJXzsDHJhptJfJqwIucyiIx0oXJjPkYls59fA6eMCbua9Gp0zutPXqMgikY9HwDCbg6C3rjB3VVrN85oV9bKxGomeIB6lo+RV3oe3OLGvbhVZA3ussD7Az1enPoafdt4C9UuHqJplDVCpzDi6nFbds/bCh8AEYGMp3YaqKPnCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pd5P7f7h; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pd5P7f7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069241; x=1794605241;
  h=date:from:to:subject:message-id:mime-version;
  bh=FVtEq2RaZFMijlHRH50Ehpw1HSOi1iPZs7C3/3B0Mjs=;
  b=Pd5P7f7h1px9GsExZoLefJq10tw9ttrIYOUIFtzvGmhG6ecw1euesCCs
   PhVMcueE64eDEeSbYUTeEE2MiRoXuYbmiY3JxqOgM+T7WZUJZod7oCZua
   YWQduB50VxU8A7/2GyrsN0Ogu4H0gmUx3sU4N50Bftu1OYJU4NSq0mXhE
   Nt2NhBk/3TXj5d8pSBI9reO+/tvWEXKFjtDG1b6AqeKwnnbObbjBlY1Dy
   lZXKBh0wIWngNoeKY4SLWGkTQNDKEU+tEuz05lvVmK6Abgtbek2PBBIME
   rvAv+2Gz79LifmgbpB85PdLS5ZJNPP2NP9Dpb0DFrObLhlC3O+MAehRko
   Q==;
X-CSE-ConnectionGUID: 38Bil8eFSFKte+FM2UCuTA==
X-CSE-MsgGUID: 4Tw2j9gbRN+GBtcmD6OS2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64871231"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64871231"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:27:17 -0800
X-CSE-ConnectionGUID: GkDfb0EqTaykkzhWGPxOpg==
X-CSE-MsgGUID: nHHTBP+EQHy7oxbbXi7HSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189450241"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 13:27:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeqX-00000000195-3oyp
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:27:13 +0000
Date: Thu, 13 Nov 2025 22:26:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 249/867] checkpatch:
 WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or
 return
Message-ID: <202511131813.9rcxyQEX-lkp@intel.com>
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
commit: ad0bfef2a65b12f4eeceaa32ff035aedc71b4ee9 [249/867] bcachefs: Update bch2_extent_trim_atomic() for KEY_TYPE_extent_whiteout
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131813.9rcxyQEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131813.9rcxyQEX-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#150: FILE: fs/bcachefs/extent_update.c:136:
+					break;
+				else

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
