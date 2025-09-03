Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B22F1FD1
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Sep 2025 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896107; cv=none; b=ugs8wSWoOWo+WE7fqwYbBxFmlx/sJyEYEhtjTEtPvUOR5mdLu2SMl+OALIH9gb64Day7GmgsK3G4zKSXz8bZdXDCAG4kbqRz7cH3j3RACzN70woFYJfutvu+ALArDX7HYAciPDt+mv+mAysvcEhF2/0OFBr4ncHJJ+e5PC7HQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896107; c=relaxed/simple;
	bh=uujeWRJJLEpq6vLg3MYb0wRzboUEN6zeCrs30FoUgMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P149XKu9CrUqHxfdvw4U0U+U6xaExxBjUr9sOJEj5ClWl5Vl2zm1U0ZisGltdROm2xpKuI8Jx7YWlSG/wCz9C/2E10FNW/XtMJ2hp9NGbqwY73u7UVVF9ApYxVHtlMOFmSgsnV9uwJtTOayiFVDHpOW85vbaRuZfyT2+gQ8qWNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgz2glw+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgz2glw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756896105; x=1788432105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uujeWRJJLEpq6vLg3MYb0wRzboUEN6zeCrs30FoUgMQ=;
  b=lgz2glw+GSvQnVEHum5B2y4/TdfulaobOYdjqCM97uuGppEigDa9arUN
   WQuZNy/mhWWA2VtibNFGrQJq0QkSVmN7i/u0tXalzyo95Nai6R0RurBjo
   1VX+ky3kpwN7lcfC812JtTurG8E6ty4NclNpl6pbVef8O26lOXvEOph8X
   liD5VKrg32D5FKIp4tVl5oSjUpFeT2Lr8ZPapdaG6al1yrNDW68EVcZgU
   p/cOdDj6C/u044/T8gy/o3X3uC+6qOrc2sgkEP//2PZ1kA6MfBPWtsdmY
   BAf5BQAzznoV2MPtjm37qADkBD0rn/dHaK4UAqH/8NXwequ5KlTiSQPVh
   w==;
X-CSE-ConnectionGUID: E7EQZiHqRXGIUUBarH7fDg==
X-CSE-MsgGUID: UpwdC1rJRsGFzT9RY/lEXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70303706"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="70303706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:41:44 -0700
X-CSE-ConnectionGUID: hgpr7JYKQHGQ2nmLNLHnKQ==
X-CSE-MsgGUID: EMI+7TerSWWw7OpqauGTHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="195183177"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2025 03:41:43 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utkvW-0003kz-0c;
	Wed, 03 Sep 2025 10:41:26 +0000
Date: Wed, 3 Sep 2025 18:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:rseq/perf 45/47] ERROR: modpost: __ex_table+0x1e9c
 references non-executable section '.init.data'
Message-ID: <202509031838.XTog20Qh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@linutronix.de>
[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/2b/2b1609455d18fca0484f8829a8d48ef5cc08fbac-first_error_kconfig --flag create-dir

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   dcdbc80bf84fba7d19b555690131fb4493dbd8e7
commit: 2b1609455d18fca0484f8829a8d48ef5cc08fbac [45/47] riscv: Use generic TIF bits
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: riscv-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509031838.XTog20Qh-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509031838.XTog20Qh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509031838.XTog20Qh-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1b88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b9c (section: __ex_table) -> .LASF2697 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba0 (section: __ex_table) -> .LASF2699 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c90 (section: __ex_table) -> .LLST552 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1c90 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d4c (section: __ex_table) -> .LASF3632 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d50 (section: __ex_table) -> .LASF3634 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d58 (section: __ex_table) -> .LASF3636 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d5c (section: __ex_table) -> .LASF3638 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d64 (section: __ex_table) -> .LASF4534 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d68 (section: __ex_table) -> .LASF4536 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d70 (section: __ex_table) -> .LASF4538 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d74 (section: __ex_table) -> .LASF4540 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d7c (section: __ex_table) -> .LASF3459 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d80 (section: __ex_table) -> .LASF3461 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d88 (section: __ex_table) -> .LASF3062 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d8c (section: __ex_table) -> .LASF3064 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d94 (section: __ex_table) -> .LASF464 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d98 (section: __ex_table) -> .LASF466 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da0 (section: __ex_table) -> .LASF468 (section: .debug_str)
ERROR: modpost: __ex_table+0x1da0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da4 (section: __ex_table) -> .LASF466 (section: .debug_str)
ERROR: modpost: __ex_table+0x1da4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dac (section: __ex_table) -> .LASF471 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db0 (section: __ex_table) -> .LASF466 (section: .debug_str)
ERROR: modpost: __ex_table+0x1db0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db8 (section: __ex_table) -> .LASF474 (section: .debug_str)
ERROR: modpost: __ex_table+0x1db8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dbc (section: __ex_table) -> .LASF466 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc4 (section: __ex_table) -> .LASF477 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc8 (section: __ex_table) -> .LASF466 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd0 (section: __ex_table) -> .LASF481 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd4 (section: __ex_table) -> .LASF466 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ddc (section: __ex_table) -> .LASF484 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ddc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de0 (section: __ex_table) -> .LASF486 (section: .debug_str)
ERROR: modpost: __ex_table+0x1de0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de8 (section: __ex_table) -> .LASF488 (section: .debug_str)
ERROR: modpost: __ex_table+0x1de8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dec (section: __ex_table) -> .LASF490 (section: .debug_str)
ERROR: modpost: __ex_table+0x1dec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df4 (section: __ex_table) -> .LASF492 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df8 (section: __ex_table) -> .LASF494 (section: .debug_str)
ERROR: modpost: __ex_table+0x1df8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e00 (section: __ex_table) -> .LASF496 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e04 (section: __ex_table) -> .LASF498 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e0c (section: __ex_table) -> .LASF501 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> .LASF503 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> .LASF505 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> .LASF507 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> .LASF509 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> .LASF511 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e30 (section: __ex_table) -> .LASF513 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e34 (section: __ex_table) -> .LASF515 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e3c (section: __ex_table) -> .LASF517 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e40 (section: __ex_table) -> .LASF519 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e48 (section: __ex_table) -> .LASF521 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e4c (section: __ex_table) -> .LASF523 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e54 (section: __ex_table) -> .LASF525 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e58 (section: __ex_table) -> .LASF527 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e9c (section: __ex_table) -> __TRACE_SYSTEM_fscache_volume_free (section: .init.data)
>> ERROR: modpost: __ex_table+0x1e9c references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea0 (section: __ex_table) -> __TRACE_SYSTEM_fscache_volume_get_hash_collision (section: .init.data)
ERROR: modpost: __ex_table+0x1ea0 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea8 (section: __ex_table) -> __TRACE_SYSTEM_fscache_volume_get_cookie (section: .init.data)
ERROR: modpost: __ex_table+0x1ea8 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eac (section: __ex_table) -> __TRACE_SYSTEM_fscache_volume_get_hash_collision (section: .init.data)
ERROR: modpost: __ex_table+0x1eac references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb4 (section: __ex_table) -> __TRACE_SYSTEM_fscache_cache_put_relinquish (section: .init.data)
ERROR: modpost: __ex_table+0x1eb4 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb8 (section: __ex_table) -> __TRACE_SYSTEM_fscache_volume_get_hash_collision (section: .init.data)
ERROR: modpost: __ex_table+0x1eb8 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec0 (section: __ex_table) -> __TRACE_SYSTEM_fscache_cache_put_alloc_volume (section: .init.data)
ERROR: modpost: __ex_table+0x1ec0 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec4 (section: __ex_table) -> __TRACE_SYSTEM_fscache_cache_get_acquire (section: .init.data)
ERROR: modpost: __ex_table+0x1ec4 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ecc (section: __ex_table) -> _entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x1ecc references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed0 (section: __ex_table) -> _entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x1ed0 references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed8 (section: __ex_table) -> __bpf_trace_tp_map_fscache_resize (section: __bpf_raw_tp_map)
ERROR: modpost: __ex_table+0x1ed8 references non-executable section '__bpf_raw_tp_map'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1edc (section: __ex_table) -> _entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x1edc references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee4 (section: __ex_table) -> __bpf_trace_tp_map_fscache_acquire (section: __bpf_raw_tp_map)
ERROR: modpost: __ex_table+0x1ee4 references non-executable section '__bpf_raw_tp_map'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee8 (section: __ex_table) -> _entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x1ee8 references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef0 (section: __ex_table) -> __bpf_trace_tp_map_fscache_access_cache (section: __bpf_raw_tp_map)
ERROR: modpost: __ex_table+0x1ef0 references non-executable section '__bpf_raw_tp_map'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef4 (section: __ex_table) -> __TRACE_SYSTEM_fscache_volume_get_hash_collision (section: .init.data)
ERROR: modpost: __ex_table+0x1ef4 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1efc (section: __ex_table) -> __bpf_trace_tp_map_fscache_volume (section: __bpf_raw_tp_map)
ERROR: modpost: __ex_table+0x1efc references non-executable section '__bpf_raw_tp_map'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f00 (section: __ex_table) -> __tpstrtab_fscache_cache (section: __tracepoints_strings)
>> ERROR: modpost: __ex_table+0x1f00 references non-executable section '__tracepoints_strings'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f08 (section: __ex_table) -> __tpstrtab_fscache_cookie (section: __tracepoints_strings)
ERROR: modpost: __ex_table+0x1f08 references non-executable section '__tracepoints_strings'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f0c (section: __ex_table) -> __tpstrtab_fscache_access_cache (section: __tracepoints_strings)
ERROR: modpost: __ex_table+0x1f0c references non-executable section '__tracepoints_strings'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f14 (section: __ex_table) -> __tpstrtab_fscache_access (section: __tracepoints_strings)
ERROR: modpost: __ex_table+0x1f14 references non-executable section '__tracepoints_strings'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f18 (section: __ex_table) -> __TRACE_SYSTEM_fscache_volume_get_hash_collision (section: .init.data)
ERROR: modpost: __ex_table+0x1f18 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f20 (section: __ex_table) -> .LASF311 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f24 (section: __ex_table) -> .LASF314 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f38 (section: __ex_table) -> .LASF2302 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f3c (section: __ex_table) -> .LASF2304 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f44 (section: __ex_table) -> .LLST288 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f44 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f5c (section: __ex_table) -> .LASF602 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f60 (section: __ex_table) -> .LASF604 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f68 (section: __ex_table) -> .LASF606 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f6c (section: __ex_table) -> .LASF608 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f74 (section: __ex_table) -> .LASF984 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f78 (section: __ex_table) -> .LASF986 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa8 (section: __ex_table) -> page_uni2charset (section: .rodata)
ERROR: modpost: __ex_table+0x1fa8 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb0 (section: __ex_table) -> page01 (section: .rodata)
ERROR: modpost: __ex_table+0x1fb0 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb4 (section: __ex_table) -> page03 (section: .rodata)
ERROR: modpost: __ex_table+0x1fb4 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fbc (section: __ex_table) -> .LASF2058 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc0 (section: __ex_table) -> .LASF2060 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc8 (section: __ex_table) -> .LASF2062 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fcc (section: __ex_table) -> .LASF2064 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd4 (section: __ex_table) -> .LASF2066 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd8 (section: __ex_table) -> .LASF2064 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe0 (section: __ex_table) -> .LASF2069 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe4 (section: __ex_table) -> .LASF2071 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fec (section: __ex_table) -> .LASF2073 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff0 (section: __ex_table) -> .LASF2075 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff8 (section: __ex_table) -> .LASF2077 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ffc (section: __ex_table) -> .LASF2064 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ffc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2004 (section: __ex_table) -> .LASF2080 (section: .debug_str)
ERROR: modpost: __ex_table+0x2004 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2008 (section: __ex_table) -> .LASF2064 (section: .debug_str)
ERROR: modpost: __ex_table+0x2008 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2010 (section: __ex_table) -> .LASF2083 (section: .debug_str)
ERROR: modpost: __ex_table+0x2010 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2014 (section: __ex_table) -> .LASF2064 (section: .debug_str)
ERROR: modpost: __ex_table+0x2014 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x201c (section: __ex_table) -> .LASF2086 (section: .debug_str)
ERROR: modpost: __ex_table+0x201c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2020 (section: __ex_table) -> .LASF2088 (section: .debug_str)
ERROR: modpost: __ex_table+0x2020 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2028 (section: __ex_table) -> .LASF2090 (section: .debug_str)
ERROR: modpost: __ex_table+0x2028 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x202c (section: __ex_table) -> .LASF2092 (section: .debug_str)
ERROR: modpost: __ex_table+0x202c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2034 (section: __ex_table) -> .LASF2094 (section: .debug_str)
ERROR: modpost: __ex_table+0x2034 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2038 (section: __ex_table) -> .LASF2064 (section: .debug_str)
ERROR: modpost: __ex_table+0x2038 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2040 (section: __ex_table) -> .LASF2097 (section: .debug_str)
ERROR: modpost: __ex_table+0x2040 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2044 (section: __ex_table) -> .LASF2064 (section: .debug_str)
ERROR: modpost: __ex_table+0x2044 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2058 (section: __ex_table) -> .LASF352 (section: .debug_str)
ERROR: modpost: __ex_table+0x2058 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x205c (section: __ex_table) -> .LASF354 (section: .debug_str)
ERROR: modpost: __ex_table+0x205c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2064 (section: __ex_table) -> .LASF1206 (section: .debug_str)
ERROR: modpost: __ex_table+0x2064 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2068 (section: __ex_table) -> .LASF1208 (section: .debug_str)
ERROR: modpost: __ex_table+0x2068 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2070 (section: __ex_table) -> .LASF1210 (section: .debug_str)
ERROR: modpost: __ex_table+0x2070 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2074 (section: __ex_table) -> .LASF1212 (section: .debug_str)
ERROR: modpost: __ex_table+0x2074 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x207c (section: __ex_table) -> .LASF1214 (section: .debug_str)
ERROR: modpost: __ex_table+0x207c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2080 (section: __ex_table) -> .LASF1216 (section: .debug_str)
ERROR: modpost: __ex_table+0x2080 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
