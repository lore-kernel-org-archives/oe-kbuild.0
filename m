Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9AC1FE47B
	for <oe-kbuild@lists.linux.dev>; Sun, 31 May 2026 00:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780187117; cv=none; b=UNCqPomv5DAVR1iybMlAG9IS2yQ21Jm65RIYv5KDATIimOc6wW+RQokHvR4gIGfuuMK2Sd4CuVyNqKAfylvmLbLbeW8pXXbs1vFk5vHTe7n5xfgO6cuOC1Yp8s35nIvSCzceNbiwBH3++AuoJweCDPXBSCWu7p8SUUVavQa29LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780187117; c=relaxed/simple;
	bh=jaen8P9lJNDfs+pMWWY0T1iHxhJd6PX7gs3+mDqVfto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hK6SzBOhyi9QInvVqd5O/AWIvMcFja28CZJ48/XKs9H9QybNe2egGcbSkbOGqsjSD+hXCramWYCTvk+aDSMxfuuvTjwOfoE/yoeNHqXSJLfNMS2RBlcFKfVxZEKkExzTJIyhHYb2f4Fj3ZklAjTzYjOJW1cDms1RO2HoTwgEieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjxvTbV4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjxvTbV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780187114; x=1811723114;
  h=date:from:to:cc:subject:message-id;
  bh=jaen8P9lJNDfs+pMWWY0T1iHxhJd6PX7gs3+mDqVfto=;
  b=HjxvTbV4ladBETzgwuadkZoaeSfPAwbP/WLth/zsIUeAoqbWJCPWtVXQ
   rB89EoPQwSwatWTiUdZNUXJcALCudEs7AxX+lU1VOivNw2c12MmtGXcE7
   DdoKn8T52Csr/nlyaD126o1OiivemoPRQ3XsZcMrZ1vTBvUjjy46t3NCB
   GMVV7NmVbloaNg8OSVVtni6Qdb36RYtfAXv6PRkuQi7TzwqouJEhBTgL3
   2OTQFTpMdSzeJXVk9MxYsQx16Vg0rFarryLE56DIN6VCRugpsAOIQWysC
   20B5CHAuKVGRgkgU4PEIa5vqux3Whj8PxVvMNbaacYo8/yUwbh0GcqbUJ
   g==;
X-CSE-ConnectionGUID: dd6aDHc4Sm6X813H5wyGmg==
X-CSE-MsgGUID: zSO/J4vEQQeSJzJXAn1fzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="92107288"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="92107288"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 17:25:13 -0700
X-CSE-ConnectionGUID: VH8ja+g4TwK1FvDjoJLXJw==
X-CSE-MsgGUID: N2AdGWlISBOx32ovAo1+AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="243059179"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2026 17:25:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTTzK-0000000092c-0SEQ;
	Sun, 31 May 2026 00:25:10 +0000
Date: Sun, 31 May 2026 08:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: __ex_table+0x2250 references non-executable
 section '__bug_table'
Message-ID: <202605310801.z42V1Bum-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5e5d3509bffb95c6648eb9795f7f236852ae62d
commit: a97dc087da06b69ae976765d59810ca705e8dae1 simple_lookup(): just set DCACHE_DONTCACHE
date:   12 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-r122-20260529 (https://download.01.org/0day-ci/archive/20260531/202605310801.z42V1Bum-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310801.z42V1Bum-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a97dc087da06 ("simple_lookup(): just set DCACHE_DONTCACHE")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605310801.z42V1Bum-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: enter_s2idle_proper+0x26c (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x8c (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0xae (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0xc0 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0xe2 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x170 (section: .noinstr.text) -> .Lpcrel_hi226 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x1cc (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x1d4 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x1fa (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x20e (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x310 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x36e (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x3f0 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x3fc (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x40a (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x424 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x440 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x47c (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x4a2 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x4c0 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x4da (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x4ee (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x502 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x516 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x526 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x536 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpuidle_enter_state+0x594 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x2040 (section: __ex_table) -> .L.str.95 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x2040 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2044 (section: __ex_table) -> __initcall__kmod_initramfs__480_789_populate_rootfsrootfs (section: .initcallrootfs.init)
ERROR: modpost: __ex_table+0x2044 references non-executable section '.initcallrootfs.init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x204c (section: __ex_table) -> find_link.__if_trace.88.0 (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x204c references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2058 (section: __ex_table) -> mode (section: .init.data)
ERROR: modpost: __ex_table+0x2058 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x205c (section: __ex_table) -> do_populate_rootfs.__if_trace.129.1 (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x205c references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2064 (section: __ex_table) -> uid (section: .init.data)
ERROR: modpost: __ex_table+0x2064 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2070 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2070 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2074 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2074 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x207c (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x207c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2080 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2080 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2088 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2088 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x208c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x208c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2094 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2094 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2098 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2098 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20a0 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d0 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x20f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2100 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2100 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2104 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2104 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x217c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x217c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2184 (section: __ex_table) -> __efistub_.L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2188 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2188 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2250 (section: __ex_table) -> $d (section: __bug_table)
>> ERROR: modpost: __ex_table+0x2250 references non-executable section '__bug_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2280 (section: __ex_table) -> $d (section: __patchable_function_entries)
ERROR: modpost: __ex_table+0x2280 references non-executable section '__patchable_function_entries'
WARNING: modpost: vmlinux: section mismatch in reference: bpf_crypto_skcipher_exit+0x3a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_crypto_skcipher_exit+0x6e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cryptomgr_exit+0x36 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cryptomgr_exit+0x74 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: crypto_gcm_module_exit+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: algif_hash_exit+0x32 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: algif_hash_exit+0x72 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: algif_aead_exit+0x32 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: algif_aead_exit+0x72 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: primes_exit+0x2a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: primes_exit+0x3a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: primes_exit+0xa0 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: primes_exit+0xde (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_kmp+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_bm+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_fsm+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: weim_exit+0x1a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: phy_core_exit+0x26 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: leds_exit+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lcd_class_exit+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: backlight_class_exit+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi+0x5c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi+0x9e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi+0xbe (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi_ssif+0x58 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi_ssif+0xc8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi_ssif+0x100 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi_ssif+0x10a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wpcm450_soc_exit+0x38 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: qcom_rmtfs_mem_exit+0x3a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hwrng_modexit+0x4a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hwrng_modexit+0x66 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hwrng_modexit+0x72 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hwrng_modexit+0xba (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ppdev_cleanup+0x26 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpm_exit+0x26 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpm_exit+0x36 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devcoredump_exit+0x30 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: enclosure_exit+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uacce_exit+0x2c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfcsim_exit+0x46 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfcsim_exit+0x5c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_mtd+0x38 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_mtd+0x44 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_phram+0x46 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_phram+0x50 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0x60 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0x94 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0xaa (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0xde (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0x110 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0x138 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0x16a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0x192 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0x1c4 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ns_cleanup_module+0x1d4 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_exit+0xb8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_gluebi_exit+0x54 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_gluebi_exit+0x5e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: spidev_exit+0x2c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uio_exit+0x2a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_pcmcia_cs+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: input_exit+0x26 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: at91_rtc_remove+0x24 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: at91_rtc_remove+0x2e (section: .exit.text) -> .Lpcrel_hi17 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dryice_rtc_remove+0x3e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dryice_rtc_remove+0x6c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dryice_rtc_remove+0xa2 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dryice_rtc_remove+0xac (section: .exit.text) -> .Lpcrel_hi17 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dryice_rtc_remove+0xd4 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_exit+0x3c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_exit+0x70 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_dev_exit+0x40 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rc_core_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: odroid_go_ultra_poweroff_exit+0x20 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: watchdog_dev_exit+0x2e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wb_smsc_wdt_exit+0x50 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wb_smsc_wdt_exit+0x14a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scmi_bus_exit+0x26 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fwctl_exit+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rproc_exit_sysfs+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fpga_mgr_class_exit+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tee_exit+0x3a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mux_exit+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_soundcore+0x2e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mod_exit+0x52 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mod_exit+0x6c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snap_exit+0x74 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snap_exit+0x9a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: teql_exit+0x42 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_exit+0x44 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_exit+0x48 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: raw_module_exit+0xe (section: .exit.text) -> .Lpcrel_hi45 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: raw_module_exit+0x12 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: raw_module_exit+0x1e (section: .exit.text) -> .L0  (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
