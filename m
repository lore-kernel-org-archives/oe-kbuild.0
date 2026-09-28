Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6613148B4
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 02:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790561135; cv=none; b=Y+2IVhwAujnXNyLZ73r8Hokz8pOse1oU2dQvhv55+nSGNSrspzLzcVcQ4kktTN034MhraniingB9KfZ5a/PpKlX6bHhAKNe3ztTFDuAtJYDr+ml/dhcRIupY1ylfolTgrui1Fmrrt44sdFkiVU2EHdqastAhuKToE8JqMfPVdpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790561135; c=relaxed/simple;
	bh=wNAqmrwk40ozzHZCxuajUVuNYf4F9KysxIkICu1qK5o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZeGaKn5bEWeXngdySDb1EDVQvRROWouP+TRinSiFpeaQlRePVwfNEBK5g1kKxRXA+8amFYZI5xcDz4xnOxpvFlzosMefUtDgREceEUM/hTwnpSW1e7LMSJBEw0q1ypgVFoR3VmgV7TRQjjmjUicoHPQ+UOBZBOX3yaD+tuE6jwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxCbIFuj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxCbIFuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790561131; x=1822097131;
  h=date:from:to:cc:subject:message-id;
  bh=wNAqmrwk40ozzHZCxuajUVuNYf4F9KysxIkICu1qK5o=;
  b=gxCbIFujT+nUrGpigphDZwC8K/KkzoNyzSxptpkAxkl3F41BiuBAGDlk
   ODZ2VMgv/IRzMsg70ugB6DyMUToBp9+g3p/DlA4QywEa7Pz6Q1OxJZQSM
   4yipjkitX0VTb2y9cuTD+5MFmGJG16HRXOWtmdBtXYtDyY2esOhrBbuRO
   Y3v4oERlfNy7wCECjMKUDPvfpGTPeS7DHyHqrrJnRwMmpgMHPcBpQMbjX
   6w4nG9fkii3w/u21v1fEX5OGFUuWS7VOZWwPPL5dU1L4FD2Ha8DU8xIJR
   x5fKUiGpFMvEOrTs9N/R5v2LkNepgK+sadAvhWcWZpvsSxoxyX0O8YPEY
   Q==;
X-CSE-ConnectionGUID: y6FHaTfjQSOooQ9LtZgQ6g==
X-CSE-MsgGUID: DXkQYp3QTBGvECElVHdFrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90378416"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="90378416"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 19:05:31 -0700
X-CSE-ConnectionGUID: efD2G1TySLyWhQSS4QKP0Q==
X-CSE-MsgGUID: 8X5aov9rTT69cnpTCPxzHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="274436355"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2026 19:05:30 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB0kB-000000000pb-0can;
	Mon, 28 Sep 2026 02:05:27 +0000
Date: Mon, 28 Sep 2026 04:04:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [net-next:main 1/49] ERROR: modpost: __ex_table+0x2230
 references non-executable section '.rodata.cst4'
Message-ID: <202609280323.eqy026pk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: netdev@vger.kernel.org
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   014d795c73837ea2339a4ea8e8f82c6e959b845d
commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9 [1/49] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r2200-20260927 (https://download.01.org/0day-ci/archive/20260928/202609280323.eqy026pk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280323.eqy026pk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609280323.eqy026pk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x20b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20b8 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20ec (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2100 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2100 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2104 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2104 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x210c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x210c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2110 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2110 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2118 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2118 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x211c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x211c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2124 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2124 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2128 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2128 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2130 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2130 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2134 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2134 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x213c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x213c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2140 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2140 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2148 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2148 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x214c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x214c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2154 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2154 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2158 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2158 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2160 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2160 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2164 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2164 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x216c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x216c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2170 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2170 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x217c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x217c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2184 (section: __ex_table) -> $d (section: .rodata.__llvm_fs_discriminator__)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.rodata.__llvm_fs_discriminator__'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2190 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2190 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2194 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2194 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x219c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x219c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x21c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2200 (section: __ex_table) -> $d (section: __patchable_function_entries)
ERROR: modpost: __ex_table+0x2200 references non-executable section '__patchable_function_entries'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2220 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2220 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2224 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2224 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x222c (section: __ex_table) -> .L.str.60 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x222c references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2230 (section: __ex_table) -> TMP51X_TEMP_CRIT_ALARM (section: .rodata.cst4)
>> ERROR: modpost: __ex_table+0x2230 references non-executable section '.rodata.cst4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2238 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2238 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x223c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x223c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2244 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2244 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2248 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2248 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2250 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2250 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2254 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2254 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x225c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x225c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2260 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2260 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2268 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2268 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x226c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x226c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2274 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2274 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2278 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2278 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2280 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2280 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2284 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2284 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x228c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x228c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2290 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2290 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2298 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2298 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x229c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x229c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22a4 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x22fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2304 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2304 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2308 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2308 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2310 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2310 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2314 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2314 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x231c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x231c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2320 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2320 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2328 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2328 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x232c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x232c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2334 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2334 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2338 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2338 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2340 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2340 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2344 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2344 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x234c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x234c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2350 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2350 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2358 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2358 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x235c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x235c references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
