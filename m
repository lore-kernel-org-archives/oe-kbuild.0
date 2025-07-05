Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7B64315C
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Jul 2025 22:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751753023; cv=none; b=JYyF8MV1pYcQQDIzFD9Vey+RWW+qAERB4zopg6S8wD+l8dKOVTRCzXqGdU/8Fi9YrKCd3B0WGrTIqS6XfNKMu/tNaE2tkFVROjvC0RJ/z3IIUuI/mWw6qe8Xv6iABI9azMWwjVGgclva8U0LEZigiuKYYrCbiSF9s/4X0rAe0Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751753023; c=relaxed/simple;
	bh=/dJKPIHTSbu0rdRdnS81DRWBU9PqRm+ZRG7I6Jk61Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hu7ipIHw36H/YkNZn+lI6/zEE0GA18TOQUyitH/SyvZbXs1lv8kirGq+gmKzUqwKp0ffxC7qdX1Pcjeh4u7Kp8toZz4l38WUY3LCw3mOCwdmQ+FhuNhngji28JSHZ4GfpX0Z243djWjegrHcF6gWaBzRKR58qU+KqxjkdEdEhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBzqmhtB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBzqmhtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751753022; x=1783289022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/dJKPIHTSbu0rdRdnS81DRWBU9PqRm+ZRG7I6Jk61Ms=;
  b=cBzqmhtBhWtkhtjDBq6KiqXlr2D7hPklN8VgWLea7c/p5PEhRMCt92vm
   crM+AeyzL2RJrgdrIvTWr7t2fVh9dnCuEUZ8kuT2pKsK5cIqf6BGNowFS
   XYzX5ouPy+my186obvUxxy33k2l/G2sRUvODB2bkPzUx3f+stdVvUx8sW
   GVwgzM3eSwxyVv/q+preNCWGgLpzw73gh38cH97QruWqzJLqYnC+cRMp7
   lY7IjH8REnOtJfaHftZrDfrGOhj4fwmL1ha+vCC4nq+fEW+VtjBp0R+Zn
   VwLHu1WGxkTAlJjI919gBIWwFQ0ZOEvTkiKNN5geYFw5562tPekrkLMLP
   g==;
X-CSE-ConnectionGUID: UmJBmrQRTuGUgh1QxFs/8w==
X-CSE-MsgGUID: LgxY76M5QwixWi9erFuQ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="65083388"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="65083388"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 15:03:41 -0700
X-CSE-ConnectionGUID: rbzc/yIwTNabEdwG7bkTwA==
X-CSE-MsgGUID: RuTktHusQ56GxEd9BJ1lvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="155458106"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2025 15:03:41 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYAyw-0004jv-0J;
	Sat, 05 Jul 2025 22:03:38 +0000
Date: Sun, 6 Jul 2025 06:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: kernel_entry+0x0: unreachable
 instruction
Message-ID: <202507060502.lsreDiNA-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yuli Wang <wangyuli@uniontech.com>
CC: Huacai Chen <chenhuacai@kernel.org>
CC: Winston Wen <wentao@uniontech.com>
CC: Wentao Guan <guanwentao@uniontech.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a79a588fc1761dc12a3064fc2f648ae66cea3c5a
commit: 29c92a41c6d2879c1f62220fe4758dce191bb38f LoongArch: Rework the arch_kgdb_breakpoint() implementation
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-002-20250706 (https://download.01.org/0day-ci/archive/20250706/202507060502.lsreDiNA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060502.lsreDiNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507060502.lsreDiNA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: kernel_entry+0x0: unreachable instruction
   vmlinux.o: warning: objtool: kernel_entry+0x4: unreachable instruction
   vmlinux.o: warning: objtool: kernel_entry+0x8: skipping duplicate warning(s)
>> vmlinux.o: warning: objtool: smpboot_entry+0x0: unreachable instruction
   vmlinux.o: warning: objtool: smpboot_entry+0x4: unreachable instruction
   vmlinux.o: warning: objtool: smpboot_entry+0x8: skipping duplicate warning(s)
>> vmlinux.o: warning: objtool: kernel_kexec+0xc8: machine_kexec() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: kernel_kexec+0xcc: unreachable instruction
>> vmlinux.o: warning: objtool: gdb_serial_stub+0x5d4: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: kdb_reboot+0x2c: machine_restart() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: kdb_reboot+0x30: unreachable instruction
   vmlinux.o: warning: objtool: kdb_reboot+0x34: skipping duplicate warning(s)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
