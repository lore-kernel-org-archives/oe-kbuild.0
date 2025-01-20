Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5365319259D
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361118; cv=none; b=FDqKSxNoBZ4c2jMmQ+fYgmfS1xwX+aZ6z39JPHIr3lWvhpRFirN91YnwfpcypOtQoF6Ipdq0zwhbbvkycyOIWn3boJzjF4XuF+EnY1MBH9xMWyukAJVDFSmKWyp6Z+oloH0VHWx4mEwI4OrVR8VmIuQiSMtG1v/qS3rh5KHlLHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361118; c=relaxed/simple;
	bh=oF5XXwzt5upiRG2eY24dRyW77ShCm8Tn43Xbz4Bs/Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AqN6hAe0ynACSvj08SCmNmUNqVCSP2DsVSbS1hdSRcFh5C+QjT6C1kjeqoFWRZqQ8PyMP9m+Y0SIb/8kl3KhR8GIDfqCyFalmytR/vM0O1dAoO/Rzy9TjwYVYFS24wgVL54kLOazhniU4rkghkg+E1W+9LeVETsWI3EQ318vQ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxTmy2ye; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxTmy2ye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737361116; x=1768897116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oF5XXwzt5upiRG2eY24dRyW77ShCm8Tn43Xbz4Bs/Xo=;
  b=LxTmy2yexrHjKBJ1K19bsKfGKsFFQxDuAvph6SQ+olGDp55fzXp2TmUz
   WdFTSJYVVMDkmdnVEsC+VVzo/wvTh0g/oF4t/x4kZMFwtcZRoj5ncrz+o
   dLnRHjLIPj1zGOu/SXyCR6NTwsUSuRebhI8WD6MesTwKI1kycadhUDYB6
   8SDBIeZC98Mp+zzx0N9l5ENDmZYAVkMXi8fmKf6tF0vnrRiyuFUx6Vslk
   5I7Sf3uFC0gm4qIi0T4Pd/OxdD3/D4yLmp+SYV4Fobba41UhiUm+iZ+ew
   /coxTm023r5w/HuVnJa6JEoAK1T9giwn7k3AYhK8AM+s83PEkikMAUylx
   Q==;
X-CSE-ConnectionGUID: ypOVFRWDTDKasavY0chiJA==
X-CSE-MsgGUID: 01FdPxu4QIy0jrmBGnkxuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48724086"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="48724086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 00:18:36 -0800
X-CSE-ConnectionGUID: HO1boht+RhmnQErHU4Q/sA==
X-CSE-MsgGUID: KXFGwEmpTZulTIHnq25O2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="137265999"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2025 00:18:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZmzQ-000WLf-26;
	Mon, 20 Jan 2025 08:18:32 +0000
Date: Mon, 20 Jan 2025 16:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: vmlinux.o:(function run_init_process:
 .text.unlikely.run_init_process+0x18): relocation R_RISCV_HI20 out of range:
 529072 is not in [-524288, 524287]; references '.L_MergedGlobals'
Message-ID: <202501201626.M3REz6Dq-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: bede169618c68379e1be7ace14e8ac85b964a9ec kbuild: enable objtool for *.mod.o and additional kernel objects
date:   8 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-002-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201626.M3REz6Dq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201626.M3REz6Dq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501201626.M3REz6Dq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(function run_init_process: .text.unlikely.run_init_process+0x18): relocation R_RISCV_HI20 out of range: 529072 is not in [-524288, 524287]; references '.L_MergedGlobals'
   >>> referenced by main.c:1379 (init/main.c:1379)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function trace_initcall_finish_cb: .text.unlikely.trace_initcall_finish_cb+0x36): relocation R_RISCV_HI20 out of range: 528353 is not in [-524288, 524287]; references '.L.str.144'
   >>> referenced by main.c:1224 (init/main.c:1224)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function run_init_process: .text.unlikely.run_init_process+0x24): relocation R_RISCV_HI20 out of range: 528353 is not in [-524288, 524287]; references '.L.str.121'
   >>> referenced by main.c:1379 (init/main.c:1379)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function try_to_run_init_process: .text.unlikely.try_to_run_init_process+0x32): relocation R_RISCV_HI20 out of range: 528353 is not in [-524288, 524287]; references '.L.str.134'
   >>> referenced by main.c:1397 (init/main.c:1397)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function trace_initcall_start_cb: .text.unlikely.trace_initcall_start_cb+0x1a): relocation R_RISCV_HI20 out of range: 528281 is not in [-524288, 524287]; references '.L.str.142'
   >>> referenced by main.c:1212 (init/main.c:1212)
   >>> defined in vmlinux.o
--
>> ld.lld: error: vmlinux.o:(function trace_initcall_finish_cb: .text.unlikely.trace_initcall_finish_cb+0x20): relocation R_RISCV_HI20 out of range: 528121 is not in [-524288, 524287]; references '.LCPI60_0'
   >>> referenced by main.c:1221 (init/main.c:1221)
   >>> defined in vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
