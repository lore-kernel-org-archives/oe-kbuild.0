Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089783246F3
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069361; cv=none; b=Tk7nfGwlvLXR6y4bp5PVjVJrmwIAPm8RNQ4DrxFoSiECw1C6DP1NVWC2EdXpx5fDRueChS1winOjphyqUTzsI851yD3CoM5EH4M1yGaKmskg3v59loUz5ZLM1evML29vXvGRq2Lg33eZKiWIXSXPXc/DqUytcwGKnSI3gdeO+EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069361; c=relaxed/simple;
	bh=gT1ejGGA75u/1JhZ1fNAt1hwFfjg9G+2AyAIetyMUHg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnOONWNBvdwEUSgs1R5tKjH6MA7ZQw1WPMFYetDjAmAoxPrG6sXGDX8XIovU3rZ6bUMXRNI8jNAlZvr5aWHBPswPQs4d72zc7TpVomXlGBAmybUdfM5xIeogBd/TxbSsraMbh4FjYtAsJUOhdovEwKI2Bwxag5TSwFPRemsWBA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPlGKEDo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPlGKEDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069360; x=1794605360;
  h=date:from:to:subject:message-id:mime-version;
  bh=gT1ejGGA75u/1JhZ1fNAt1hwFfjg9G+2AyAIetyMUHg=;
  b=lPlGKEDoVcxiri8NMvSr9d4XIPX/oNuVwL6URrEVADVfzcjiFu8YGQex
   83spLmqCPGvtuqJeBNRZvhrtAMeoPAjb8atk/IX7RWfEPgEcuXNA+aUj7
   omEbj4rLcjt/XIQvLVIUCKEzhuT5uEgkzNYjmNIT4lKzg/qO+Pm5wx7uJ
   VJsrgMYoDssrUvXvmltpy3PQkTyg6bdByIQDivk/rQ1djuKshaOdtHD4c
   apfUDIOJQFrVinw0PUNIv/9yc7N5eLBVVvbGz5d+MhSDoZuoHZZqTs+5h
   VYp37lZKiVV+rIuMxDSpvwA/oSCNpzNBMzh3elgjP1KF2KOhYFqiYW/ZA
   w==;
X-CSE-ConnectionGUID: ZcP1tOwxT5eI25sADW/74w==
X-CSE-MsgGUID: MvJ075q+QeOrIo+lCqZxgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64167536"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64167536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:29:17 -0800
X-CSE-ConnectionGUID: +RBLGjZdQ0+kp8XsmShWTg==
X-CSE-MsgGUID: zclxyZ8RRPuxLiAs2g6owQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="194744325"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 13:29:17 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJesU-000000001Ab-3xO4
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:29:14 +0000
Date: Thu, 13 Nov 2025 22:28:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 836/867] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'an'
Message-ID: <202511132015.rnVn2F4y-lkp@intel.com>
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
commit: 76abd7ed021be25494b61aec4db5897d9c8cd286 [836/867] bcachefs: bcachefs_metadata_version_reconcile
:::::: branch date: 3 hours ago
:::::: commit date: 26 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511132015.rnVn2F4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511132015.rnVn2F4y-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'an'
#1090: FILE: fs/bcachefs/data/reconcile_format.h:36:
+ *    a set bit indicates that an an extent in BTREE_ID_extents or

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#1124: FILE: fs/bcachefs/data/reconcile_format.h:70:
+#elif defined (__BIG_ENDIAN_BITFIELD)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#1166: FILE: fs/bcachefs/data/reconcile_format.h:112:
+#elif defined (__BIG_ENDIAN_BITFIELD)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
