Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A6A932
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 18:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771611330; cv=none; b=X+usKaguJPfyxKfPD+fZMnpFOxZCYOSSuRRjTD/iqrbyAOxPlg7E9cYs/Myql6AUVm7Mbrv5COrd/CnwUwqpPAlHeOY/huzywf8RXo9Jy1bCsOgcDD1js7uYfzMukbiNwpmTAVB7G3M5ZbG/MLGCNfnT2P9q264/HgP2c5X6+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771611330; c=relaxed/simple;
	bh=8DijvXpzqokAAQmUilWQBscSwfGm84TDzFAwdfImYRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GtVn0P2AhegR4yyclFCI8FQbd+O3vSXJU7xdRGQ6K++tvxGbZQMlshCRwZTYto0r16a9ErrB2DWWcuuOBJnAm2nuc9fWPGcMf8mW+ut2QdCXvQCVv8hqPCb9HlUlf/qbx15QROACKyaF9Lusj8psy319Me//m2ULXi4vvIg1hdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bje3A8Ud; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bje3A8Ud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771611329; x=1803147329;
  h=date:from:to:cc:subject:message-id;
  bh=8DijvXpzqokAAQmUilWQBscSwfGm84TDzFAwdfImYRU=;
  b=Bje3A8UdHOJDO3THSwnrHavs+m92nZc+HEunGnH4fvvXmzoFwuabF7p4
   NARm2An8kSxM6j712Q5C21ZcY79+9sSF1QaX0ZlAx9M1FKt1lF0AjRWTR
   c928y1q74QSosziLiJq4KZGAOLNmkk3tdzYw/Wkj2+ffrbKS2uIWqlSIs
   KTznRMV4e5U5yCmw7gc/bsDXlkALDQZNiEDoyaM51BEQ5rslzYRsEajwR
   LBXeJe64i6G1KdcZgIwk4UEhxlkpDzruSMkaRMKaAzR4PhcDMzBNTvlhE
   V6ZlU6kZEFzzbru3WbCJhMSjmAqWQTKB82KcdmvKMIxfkBfexdtsT1zdl
   A==;
X-CSE-ConnectionGUID: ZYeBgW1FRMmdxt9d0tyN9g==
X-CSE-MsgGUID: ofNPkKplSb6AZwLqh60fJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76541853"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="76541853"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 10:15:25 -0800
X-CSE-ConnectionGUID: UM9t1miaTlelLKUdIsV5Ww==
X-CSE-MsgGUID: SmeZNMXNQN6iWqrTKC2o0Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Feb 2026 10:15:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtV2A-000000014NA-209X;
	Fri, 20 Feb 2026 18:15:22 +0000
Date: Sat, 21 Feb 2026 02:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool:
 _samsung_clk_register_pll+0x11c: unreachable instruction
Message-ID: <202602210213.hQtsLV6W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>
CC: WANG Rui <wangrui@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bf22c33e7a172fbc72464f4cc484d23a6b412ba
commit: 5dfea6644d201bfeffaa7e0d79d62309856613b7 LoongArch: Pass annotate-tablejump option if LTO is enabled
date:   6 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r072-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210213.hQtsLV6W-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210213.hQtsLV6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602210213.hQtsLV6W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kernel_entry+0x0: unreachable instruction
   vmlinux.o: warning: objtool: smpboot_entry+0x0: unreachable instruction
>> vmlinux.o: warning: objtool: _samsung_clk_register_pll+0x11c: unreachable instruction
>> vmlinux.o: warning: objtool: gdb_serial_stub+0x7e0: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
