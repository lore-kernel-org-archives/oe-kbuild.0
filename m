Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410028;
	b=y4SWWvAqv4+qI2PzPPy8jIp2CgosXOwr29AwFaNJ68nXCZjkVKqC9jpR4h6Irex+BK0u
	 r8cyNZi+10Sbu/dxIQo+JTk61d00o/iJQEGk07SB3XfwnVcuE0w82VaP/rxGT9JLp3eUS
	 PjrkhwcL/wCqrPhcp9Wiub6XV/wXX5CKjto4aVv+EP2zKYVZzo1a0GpFzhk0XpXBvp4gl
	 vvr9PdD6RMHgRHT2D2higkvbQRGhbXGzn/+YAlyD/Zd39H8NMmaiEnxjK9Ck0cmZgB0+t
	 HpwrUFzC94NImmnHK4gbE8huve6vshHf9BphawnF35ma1LIvX6rbtjyaz2c16UPMMJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410028;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kiKP2KCqaL7dcBVACRtsatv5o7BJBKf+DLyOrkbQt2A=;
	b=fibJLfjwHFY2c3tfsI1DAcloz2fIHYdNU3wcYUxibEHjZ0Eqx9mbWExM/En5RG99HqHg
	 xQq4M3kEhJQN+dO7BUDDv9bTJ8sqssl35AJ3F2/hmOBWzKH2/q0Ol2BML+H/0y33MzUzs
	 FHbO74hA1gzC/srZR2eIU0fDfNhqqyp2E5U53d6mYC0PpAnuYvsvm0YVr+DZckO+LIsu2
	 u8eAdYUYC+jdt3mggH64SkP3JR9jG7cpjh3KR0/FNuBPQbfjS2EpcMnMCZDbngHF8QEDq
	 DFL7Ht/VlMpaAC5GMUC0OA8mpMpMQQvNqPYy31EQOQIpI2W/yOSN3iOxJRNXT655QtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AAyw4QYb;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ABB606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 01:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4ABB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AAyw4QYb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793410027; x=1824946027;
  h=date:from:to:cc:subject:message-id;
  bh=thoVwdcrxhYP6nQABEGCoG76Fwz8zusTQh7CITpR7ZQ=;
  b=AAyw4QYbTXHNatc/bOCEfqNNj+nYNrr8MKCizuU3S+alJHdkmCeKd9Zo
   Wn6Z7HyPZf0VxOaYKZPcO+gYINokwppc/TlQG9iSge33o82Rr7nStkW6y
   w+Cy6iSR6Up1T7r5VuzI8z1Uy6TNmxb/VdHzaqk69s3KjkTxp5Zal+GP4
   A616MbNbpm4KJP/xAA7a62GOMFXPoObUmJcq1vcr9UhicwZAEaici/BIs
   ja86GxAN7EBJ99S7LE1NXin7kREuCULQGVmB1hYwZjt3jO7mCuILIF3ri
   ex7uDmOCz0e9hST/lErjHyEASRitmzFXOB3QnX1rAA6Y5XW+OAJPwpjIc
   g==;
X-CSE-ConnectionGUID: s4fxDfQiSWeMgE/BLW6NMQ==
X-CSE-MsgGUID: rDWH2Y7QRpKjHQP5k4hlHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2213225"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2213225"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:27:06 -0700
X-CSE-ConnectionGUID: JAvE63tdStmW+MTepipATQ==
X-CSE-MsgGUID: sLcOR+G8TJ66XH05ZvpUVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5468459"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Oct 2026 18:27:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMxs7-00000000cQb-0XUi;
	Sat, 31 Oct 2026 01:27:03 +0000
Date: Sat, 31 Oct 2026 09:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arc-linux-ld: error: attempting to link
 arch/arc/lib/libgcc.a(_udivsi3.o) with a binary vmlinux.o of different
 architecture
Message-ID: <202610310833.cYzE2xBn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sasha Levin <sashal@kernel.org>
CC: linux-snps-arc@lists.infradead.org
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e823910506ff3a34fb2966a9ecccc4019b2154dd
commit: ca201ad6e92a1924138e83ff966f7a091e3bbe6e ARC: Strip libgcc debug information when generating BTF
date:   2 weeks ago
:::::: branch date: 48 minutes ago
:::::: commit date: 2 weeks ago
config: arc-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310833.cYzE2xBn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310833.cYzE2xBn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ca201ad6e92a ("ARC: Strip libgcc debug information when generating BTF")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610310833.cYzE2xBn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_udivsi3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_udivsi3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_divsi3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_divsi3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_umodsi3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_umodsi3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_modsi3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_modsi3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_divmod_tools.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_divmod_tools.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_muldf3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_muldf3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_divsf3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_divsf3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_divdf3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_divdf3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_floatsisf.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_floatsisf.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_fixunsdfsi.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_fixunsdfsi.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_floatunsidf.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_floatunsidf.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_muldi3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_muldi3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_lshrdi3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_lshrdi3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_ashldi3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_ashldi3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_ashrdi3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_ashrdi3.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_cmpdi2.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_cmpdi2.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_ucmpdi2.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_ucmpdi2.o)
>> arc-linux-ld: error: attempting to link arch/arc/lib/libgcc.a(_udivdi3.o) with a binary vmlinux.o of different architecture
   arc-linux-ld: failed to merge target specific data of file arch/arc/lib/libgcc.a(_udivdi3.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
