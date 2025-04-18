Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE84A01
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Apr 2025 00:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744934791; cv=none; b=pmbDDNNEfroUzHLCYEhLSgGXGKML6hZ76C1Z9xQwehCFqcid4RJxA3O5Du3SI2mWuItRvuy/2f5wYH2sBQAwHYZi9WCs7Yfssn7MsHHcoycknI987+kZILqNjVY0BrV5Am2hvI3TQsInK6DNYVhtn5WHScTuLJuzCrrk+weNaF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744934791; c=relaxed/simple;
	bh=5dwVDoq+p9Y38qpT7w0YJqR1Q0KeqzwCwcOHKkt0a9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D5DJujX7H4c15//0sv+0cfdrEETKx8p04UnJQfnLirtTe1fXytSNx/ISeWNn+J+YMOZY3NWQIHshE6i0YYEWFIthJYvav0hB+eu71DZ/cwd9xT5SvMROYoorc45oqoCeHZWc5hFerFpRFwZDRbTNkvQ5iXhRckv2ivmnR0Le4L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7oKoSJ1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7oKoSJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744934789; x=1776470789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dwVDoq+p9Y38qpT7w0YJqR1Q0KeqzwCwcOHKkt0a9U=;
  b=P7oKoSJ1qjC/SC9/Xm3DmMisIQH5ptXYGnM25Pb3LIAl9susCImfdRc0
   AGUglQ86V0c1XHaYoGU+VKQS230jvr9Tm0lxSa/NLbDzV6lcAsoOeRRVs
   ZkIBS5y5tC28hjZ1ihrwlbHfvBPAUXsq7GQCBZXqjWL2CQ8wD/tcdrYzI
   d6fY5asoCN+RfMJ3xAFrGO7itlUnH4dAujRRXN3e4k2R4GiMHHBIRwtdr
   Db4fSVWPagAUStQUPBLGvkmhKLMf2eYv4GR4X/QlKg0z4GW0CZg2OrB0k
   SVBOjtO6B6lizlhNKv0I79Y9lYA+LppxWCN5fm5XpXCZR6xS9CEyJ4yhk
   w==;
X-CSE-ConnectionGUID: tEW4qgnxRsiYfMP8TKYtsw==
X-CSE-MsgGUID: 3eJe87/bQhu73dD28qihPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="34177888"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="34177888"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 17:06:29 -0700
X-CSE-ConnectionGUID: Xv/2JPZBRVO2iNAfV9moTw==
X-CSE-MsgGUID: BSGAGJbURYq6izfrljbiMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="154154032"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Apr 2025 17:06:27 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5ZFR-0002BX-1u;
	Fri, 18 Apr 2025 00:06:25 +0000
Date: Fri, 18 Apr 2025 08:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 1357022), and 'i32 1' from vmlinux.a(kvm_main.o at 1357862)
Message-ID: <202504180836.INfpZp3e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5c6891b2c5b54bf58069966296917da46cda6f2
commit: 695ed93bb30e03e9f826ee70abdd83f970741a37 kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-001-20250418 (https://download.01.org/0day-ci/archive/20250418/202504180836.INfpZp3e-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180836.INfpZp3e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504180836.INfpZp3e-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(net-traces.o at 1602242)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(trace.o at 1369442)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(kvm_main.o at 1357862)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(slub.o at 1377962)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(super.o at 1410062)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(skbuff.o at 1600082)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(core.o at 1514102)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(syscall.o at 1371362)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(tcp.o at 1605962)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(mballoc.o at 1390442)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(e1000_main.o at 1516142)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(volumes.o at 1411202)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(huge_memory.o at 1378862)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(memory.o at 1376702)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(inode.o at 1410662)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(vmscan.o at 1375562)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(journal.o at 1392842)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(core.o at 1374182)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(vmalloc.o at 1377422)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1357022), and 'i32 1' from vmlinux.a(af_packet.o at 1611422)
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
