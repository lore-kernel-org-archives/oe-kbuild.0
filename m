Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAB32522A1
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 01:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770687305; cv=none; b=XjmeZBG9ZKp03QzF7lOuCvbbeQi+FUHM/LwBuHcxa6znJjzH+hTXFo4rKePISxET45nJwjqpkKyEmby1PpMGOhGKBxTX6HCu3il/8fWFHJ3lGd+2pLUV2/wwY9x4E8Qu91+HUyG59YdlI60DG/KcXSqQnb3eXVYh0ABJT2tIwVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770687305; c=relaxed/simple;
	bh=jf6XUATc/rcQ85Xo1gAx9WpXkzPLkBVTyaDzQqbOapw=;
	h=Date:From:To:Subject:Message-ID; b=KuNsRV6+5fpveJQ+2icZLoqnXiSzvW+MHdbDmJ8rx8Gd69yGpGr89hVk2iaPCNZO7nsLrMnNbXPojO3nY2T4qTgKgE7LtIBhgOCYZsBjvsxiWPOUJNd+BUsD4YnECbQE693NkaiatmHa/zInE/5n+2svXXaJ/ZQSubhDs+CYE3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfj6RwMp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfj6RwMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770687305; x=1802223305;
  h=date:from:to:subject:message-id;
  bh=jf6XUATc/rcQ85Xo1gAx9WpXkzPLkBVTyaDzQqbOapw=;
  b=cfj6RwMpNW6ZFfPMoH5D9U8fZeI6nuGONWF/KJyVPLtUNyCbP8xlQKNH
   +lHCeKeDG2PIfTUo+KFaHF15Z9VtznGAyHkG1JQw679FzxCKWJvtYCTPj
   WZtstjgwj4i0lpuzntNjFVkM+fEpW6zEAYUrld/7TNUNtcZTtzfxtmcb8
   mDQWyO190HedL8nK5jnfmR7IS8um54aW2qZqFtO8xSHanFoYgV6FuymiW
   wYtyZozwQWrtRAj6I/tNon7yzL3XJohHmTlg1Cp2sKBxc+HgwHlQwCG6D
   fU8p5GsqrfcqdBFAvlMe0Df44W4fboM6ZAHyHDVZtTFNf6GToWUsnv/gh
   w==;
X-CSE-ConnectionGUID: ej3+OQ5aSh+kMogdnKiVkg==
X-CSE-MsgGUID: jOC1B984TIOFhbPWSDHDAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71910798"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71910798"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 17:35:04 -0800
X-CSE-ConnectionGUID: 7rwmhYgLTHG2wJko/9qm5w==
X-CSE-MsgGUID: VWwvsdwITSiMA7H/3QDYAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211069891"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 17:35:04 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpceb-000000000XX-19ul
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 01:35:01 +0000
Date: Tue, 10 Feb 2026 02:34:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:x86-slaunch 39/41] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202602100209.64i1P5kj-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: fb71d1822d7296128031b4cdbc35bd0268533c33 [39/41] x86/slaunch: Set a 4g alloc limit for boot_params, kernel and cmdline
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602100209.64i1P5kj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#104: FILE: drivers/firmware/efi/libstub/x86-stub.c:831:
 	switch (status) {
[...]
+		case EFI_NOT_FOUND:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
