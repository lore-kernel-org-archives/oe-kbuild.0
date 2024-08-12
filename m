Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C321876
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 02:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723429623; cv=none; b=ghS8n/i+oa33EtC/a7HZDYzor87xDbnuMExc5Cd1i8vtzU0dSGgMCg5Rn01e1mOEIVLiJXx0EDS8l/bZ5cYB2bulVfxh1tNNeK7vR4M4ME+9MZdn5D3Is7adGfuwyrnflv3Sh/MZYMK/Hgz6TcSPPYNCAepJzlAZhRziivgPaLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723429623; c=relaxed/simple;
	bh=sXAhYy2I7XsUtRIwIXLZt+uIZ/O0/UmmrQRfZfyibwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F2uph4qVnGwP5CNdNXZT5BsYoI/LbhBXs6f6iCnBd3BEur1XE45ojNx0BK0FfFvJpnDIC75JXTujRZW5NbxW6xQgno8B/Y22qsBvhe4g31BDvNz9aHgVLBAHH3n4Mtj1R6BeoPu/GOef34RuUrSCM6uLR/bN7pJ1wD54hJLnLTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnTsvh9B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnTsvh9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723429622; x=1754965622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXAhYy2I7XsUtRIwIXLZt+uIZ/O0/UmmrQRfZfyibwE=;
  b=EnTsvh9BgwfkfeL3elFhxkx6/AIlwHHZokjEXELf4JAE31dSktperfxn
   7uCZ0MJujbZcpX4MtRKqz4YAsxCAO6K0qLbZHBRRP54tx6IjS2ZrQDdCZ
   11JsCsfgsSHdoUk4xPN1sdwtnKp5j9in+6WaEPceEjam5SU74FxMEpPer
   W5naVDHX+5KdgDLt52jJ0dnLvt44+aRXc/1CuQgyvNxFXkW0lcvkOkGAW
   yd/P0nniPRAhQhia8gbapZgVF4p+mChKBIW8uGpBch/Ljz3Saee/x6zPw
   CTK31YoIqrGYWbfSnF7RtSkTfRczXKH3FoAtn7yadAWaHB8U5vFd2rLOX
   w==;
X-CSE-ConnectionGUID: oxiEfnIvReaMvAebwzs6sg==
X-CSE-MsgGUID: pkeAIheTTLKLGQ6qJ1v52w==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21333801"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21333801"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 19:27:01 -0700
X-CSE-ConnectionGUID: gTeJzHOgQyamf23cfEi/Wg==
X-CSE-MsgGUID: 6HQNshISQcGUdr14MGxB1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="57777270"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Aug 2024 19:27:00 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdKlr-000BKM-28;
	Mon, 12 Aug 2024 02:26:56 +0000
Date: Mon, 12 Aug 2024 10:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/debug_vm_pgtable.o: warning: objtool:
 lruvec_stat_sub_folio.constprop.0+0x84: unreachable instruction
Message-ID: <202408121058.PE8idezA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

Hi Huacai,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c626ce4bae1ac14f60076d00eafe71af30450ba
commit: 614d7e99752e02ff6f6d447a83d2929b9649b6cb LoongArch: Add ARCH_HAS_DEBUG_VM_PGTABLE support
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240812/202408121058.PE8idezA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408121058.PE8idezA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408121058.PE8idezA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/debug_vm_pgtable.o: warning: objtool: lruvec_stat_sub_folio.constprop.0+0x84: unreachable instruction
>> mm/debug_vm_pgtable.o: warning: objtool: swap_migration_tests.isra.0+0x8c: unreachable instruction
   mm/debug_vm_pgtable.o: warning: objtool: destroy_args+0xdc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
