Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570F22D9EEA
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 05:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771047118; cv=none; b=S4vuEBGL0j7kYwTrjP2rh9I6I1sFDBJZS3iKMV9JYtPsSQjrjUYOsG4cIqChP73h5QK8kDrekqOpvyjIHs1BZhkkNyqzxNkenPAENDowtI5RtacBcKh0v4jPZTnuUa3+NcBQkkFVBCE+UTPgYG9opdpBNEIe9rQPVg3xT3wSjuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771047118; c=relaxed/simple;
	bh=tiLbB4dcANI3PeGXUSVE7M/wClEuUW2AX0G4OK7lHqY=;
	h=Date:From:To:Subject:Message-ID; b=Em6mbERHgQEgCh870kFBo53DMtgpNfMpKuhYfvS7GBCvXTc/SjPhMXBgd2VCao/AXRNGJxf/mn45M3z363wyagMiKdhe5WEJqs53AFcg2glnB7Bkv3hHq1nVgm9FIc38wX0u4FG8k7RAlWMys33xukGQkswGFdNf0711mXD2HY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZ85i9yG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZ85i9yG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771047116; x=1802583116;
  h=date:from:to:subject:message-id;
  bh=tiLbB4dcANI3PeGXUSVE7M/wClEuUW2AX0G4OK7lHqY=;
  b=nZ85i9yGseeZFjCuUo0X5reW0Tr+PuPfDB6kKMrs9G7R0wEQRrSEM0Yi
   llfZxSbhZXahj1ILqojqj2iojQ9MiKBsTQ32pp3IkQbYM9x7akNXuEyw/
   gQCCVXLSFt7Qt16pLsFQ8+74uVllSntjfPeZSB4Fj2JdCPpP/RA37isYX
   01uN16+h0de6/HBVJmqlTsmTYdUkKJ+/4wdcQzuA8k4ig/U0yMCfAj6e/
   IMrGE5fF5Ru3ERaNZnz8AibXTks+W0YIjrVNaEWh9etUd/TRrVx/44yCo
   M3kNN3usrf7rdYlhwsfU+YvGySfpz2dvPxGcP922RvF1lFk8WejXs3zIq
   g==;
X-CSE-ConnectionGUID: KKklW4rWQ920vR5cFE9lhw==
X-CSE-MsgGUID: CkTuomxhSROL+OeQgeuVew==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83329007"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="83329007"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 21:31:56 -0800
X-CSE-ConnectionGUID: m8nVKiqOT8GtZ3fbXdIGCg==
X-CSE-MsgGUID: uGy/iST0QXOtSG3uICJ2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="217253983"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 13 Feb 2026 21:31:56 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr8G1-000000001m9-0Bmn
	for oe-kbuild@lists.linux.dev;
	Sat, 14 Feb 2026 05:31:53 +0000
Date: Sat, 14 Feb 2026 06:31:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:x86-slaunch 38/44] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202602140625.g4YrAhoC-lkp@intel.com>
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
head:   a3d6f431161a83e75e3398f2390d714c3a4f7167
commit: e2b0d8f88191bf40e158c88e533b12bb54c366f6 [38/44] x86/efistub: EFI stub DRTM launch support for Secure Launch
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260214/202602140625.g4YrAhoC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#140: FILE: drivers/firmware/efi/libstub/x86-stub.c:833:
+	switch (status) {
+		case EFI_SUCCESS:
+		case EFI_UNSUPPORTED:
[...]
+		default:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
