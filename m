Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056BB1E0B9C
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 04:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761696; cv=none; b=j/rjpoC+Ag9q0HSlp3MViICE5rdl9RXX8aahg8pCAMAwECShvyFW/d3f6C2i1XneH/L6g2jMSprrl01c4VwPe34kFL63leSFiilEdFGqm/wJqby1RC2aQiyKxXLnl5xZYsbAfer6e1fKyGYTxoHC+yK6CiYElyJo9/KHwss7GAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761696; c=relaxed/simple;
	bh=sFXhQW5lOpistURfLfFuYJnfcgCMbFu2PPCDdSJsdIM=;
	h=Date:From:To:Subject:Message-ID; b=VlL7CPCvqObvWP9kqXIeap54TL8Glhk9xxegSowqVr1HusGHN+4BT2AucsdVL75teYYr99otX5bQ8h+zPi1Jj8Qg6UUbzAbPWWGxRkE4Atv/o3miScyzR3mQfR0OamTbVvwZPPpO4Y9V4MulfQkfBDslCYKqX/xPO9/+6CjG2PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEK94Jvs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEK94Jvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767761694; x=1799297694;
  h=date:from:to:subject:message-id;
  bh=sFXhQW5lOpistURfLfFuYJnfcgCMbFu2PPCDdSJsdIM=;
  b=FEK94Jvs9BVcDrRXXjL2EeBy0cBUV0ASA6focJ55JXDAOEjOoYRuvKwr
   vYpYA0ew+7XM7FOhxiO89xtWidtAShJstU5EB5ek1ZwuoXjFxl9Q2hvuP
   ftdOktPzLbRYeWi5gMG/0gcUZhyiy3zCw6+ZXqIGxr32xJGxz2Xr/AxB7
   wPQVHzUiLTXdt5d2volVH2rh0JhwOcxr0jVP+Ebmmd2CYBT5cH6aPHOzr
   aJlEXdUJKqPTzpyGANsKeVuTkx+OIUPZX/9Q7wJ4ghh5VI0DsVh2RA2s2
   RTmKYVfGoS8a81ZpEDJWoSJV6d95OpbT4VKbU1dIUQ7NJtbOWe+hI5ECb
   Q==;
X-CSE-ConnectionGUID: qCr6yi7mSL6+XkTJaBlUkg==
X-CSE-MsgGUID: m8aiPQtGT2atP6V+25ySVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="71703092"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="71703092"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 20:54:53 -0800
X-CSE-ConnectionGUID: /sCurWmmRrKOVIAOqH9f4A==
X-CSE-MsgGUID: bBT2aBBIRkSTsAsOdVel0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="207885286"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Jan 2026 20:54:53 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdLZK-000000001Sm-2U5A
	for oe-kbuild@lists.linux.dev;
	Wed, 07 Jan 2026 04:54:50 +0000
Date: Wed, 07 Jan 2026 05:54:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v3 1/7] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'only'
Message-ID: <202601070519.A0KnBG4U-lkp@intel.com>
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
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v3
head:   08fc6d27dbbe761f6f71df7fd4c9cf5a14d8f338
commit: 734994c02fc4b9e7416f4ca6bdb4dc68a2fdf097 [1/7] numa,memory_hotplug: create N_PRIVATE_MEMORY (Private Memory Nodes)
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260107/202601070519.A0KnBG4U-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'only'
#353: FILE: mm/numa_memblks.c:462:
+	/* Mark nodes with SP/Reserved only only as private */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
