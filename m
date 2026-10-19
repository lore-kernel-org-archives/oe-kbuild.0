Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FDF3603D3
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406020; cv=none; b=DvZMuvXA2e7stCE3RNYsE1FTLqeoy259v/KLTEdYAINAA8wKfFW5dXNyPyuklHFOPd7LbmsPWX6kRmVhM2msSa5BFYL1EtQPLF3pHAyFhHEwvdy/+/u67n65NjzQD3FYv5pPWsfB3fc99ujbP/McFDHz4z9TGf5EhGf78E7rFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406020; c=relaxed/simple;
	bh=mf81BC5fAB+Rc/vG80qoX7VJPVJRpeh1bU9CfVZUNCw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o2OBZj+ibcqH0rIaPJJNSRzYKYtBNDzGWXxeEI6kaiBsbm7AQAK+ZMTEhVdx2aoU9SRQ0uQJpwADyozUmm42+wxi/DlWU6mCsFERV4utNyk5Gz7V3NCBAdEaWVRmgh2KVwitRe7zKhf9IJqrm5PYY2nPJci7voltJX03grIeMr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=diB2I/hV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diB2I/hV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792406019; x=1823942019;
  h=date:from:to:cc:subject:message-id;
  bh=mf81BC5fAB+Rc/vG80qoX7VJPVJRpeh1bU9CfVZUNCw=;
  b=diB2I/hVDxUYvQRiCD7qrM4dNBQ2FbAk4g5psGHlaictRxojhmLtrGXy
   R1QaSsh3vv4k7ybNi7BxspkNVFEoRW19P7fRQVhOeJm4ISBAeQioL34eT
   nyeXT50pC6t1ygG0tlsH+XzumoQnDt1m6nwNFA+wtpHMgOiwSoPLQpKNH
   JUhQH8pCiQnfUlZVoASRZoif+ZC6RMd3EAbzV7CN4tXMg4nSApu6zT+To
   /yvlkStlyDHujT/TXQGC2hXlrwX+uemnrcEVFIGMaWV5N5O/EMdMq9hPv
   tb1J871UwTIX2fgJ1mEZVi+6X6ReW0RIsuQkL+ykvYROtcaXCqo+xFzp/
   w==;
X-CSE-ConnectionGUID: EoX6lqtTRGKUUQc1S5sTGg==
X-CSE-MsgGUID: 3GtY+augRyKDOVq1NYl5Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1119040"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1119040"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 03:33:39 -0700
X-CSE-ConnectionGUID: eVMVoFniRqqIfhd4DTGRcQ==
X-CSE-MsgGUID: DZj+znIcTlOh9DUxYCjFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2501675"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2026 03:33:38 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIkgQ-000000005aN-3Lf2;
	Mon, 19 Oct 2026 10:33:34 +0000
Date: Mon, 19 Oct 2026 12:32:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:x86-pie-v4 20/22]
 arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer
Message-ID: <202610191245.ebJYQIql-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   1abf4915b934f55c588e220cfc73188a5d4f13a7
commit: 48f13a7ef6d8e474bf7430f21c055879a3fc4209 [20/22] x86/boot: Apply ELF PIE relocation fixups during startup
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-2300-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191245.ebJYQIql-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191245.ebJYQIql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610191245.ebJYQIql-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer
>> arch/x86/boot/startup/relocate.c:19:59: sparse: sparse: need scalar for ++/--
   arch/x86/boot/startup/relocate.c:24:26: sparse: sparse: invalid initializer
   arch/x86/boot/startup/relocate.c:24:59: sparse: sparse: need scalar for ++/--

vim +19 arch/x86/boot/startup/relocate.c

48f13a7ef6d8e4 Ard Biesheuvel 2026-01-31  11  
48f13a7ef6d8e4 Ard Biesheuvel 2026-01-31  12  void __init startup_relocate_kernel(void)
48f13a7ef6d8e4 Ard Biesheuvel 2026-01-31  13  {
48f13a7ef6d8e4 Ard Biesheuvel 2026-01-31  14  	u64 *place;
48f13a7ef6d8e4 Ard Biesheuvel 2026-01-31  15  
48f13a7ef6d8e4 Ard Biesheuvel 2026-01-31  16  	if (!va_shift)
48f13a7ef6d8e4 Ard Biesheuvel 2026-01-31  17  		return;
48f13a7ef6d8e4 Ard Biesheuvel 2026-01-31  18  
48f13a7ef6d8e4 Ard Biesheuvel 2026-01-31 @19  	for (auto rela = rela_start; rela < rela_end; rela++) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
