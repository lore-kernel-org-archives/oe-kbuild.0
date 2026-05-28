Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE63636C588
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 22:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007771; cv=none; b=Q2ANqQxmgY7m1yg58pmzKhpZV1oZRfuOhoeJ3KssWn8IbUX17bJLwwIf/WF9dhEXV5McxzVzZrm2ie10rwTsm93aqsSFLKcEXGt06NE5eHWlSOiOLLj8W8aa+YqhpPVCFn8RsQmDxXIY21tnLtsETOfvF/aXVw3Ox7oN9ORRABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007771; c=relaxed/simple;
	bh=YG6jqYLy1vWid1SUOuOSg7f+KaOHHmCFwlHT1Db7VNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iEHxAXt9SI2De+4iDrHsG2muQljEPX4AdZT2oo7wTyLinC5ZgF4bAByxb5+rSDF19DYtutMevr53qjhV8GINaMBq9MDQVkDaAlgY+Nzw5Dne/rFbOAmpmcUZZg7A35E8GoikOCxBWkdXJHMhg4nUpq/mYGwcc4ej2N/lQD0bYKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGpyFVLU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGpyFVLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780007770; x=1811543770;
  h=date:from:to:cc:subject:message-id;
  bh=YG6jqYLy1vWid1SUOuOSg7f+KaOHHmCFwlHT1Db7VNM=;
  b=CGpyFVLUs8YNBiow2uct9uwTUYxhgJmSbQ/yDT/OPXX9QtgOOo4CgeBf
   l3yvOv+TsBZLE88395cHbqVNTGV93xeufHLTbgaqSDJOiL/OpQTVwwuQA
   HexY3olDYERyv0s1NrdUjEmfU9dZCxWe0PDmTTMtIHgNpz+RtbdoPrM17
   nL7LWcg8ljpjOhkbv+unlWPnKFYn348rltwZP40JjC6y3L3OhCw4qwrw2
   V13SD67aIoGCxgO3mH6SfNFXnNn6yNMz2eHZAM236ZnrYYjqPoYE1E3N0
   qYvIyC5s5zFZ2o53z9yW1Y+R2rhkBowjMk2EN27+yAqNlWqrs1Zyf6oID
   w==;
X-CSE-ConnectionGUID: Vkdt1VlxSQuUl9MB3N0K2Q==
X-CSE-MsgGUID: yEuPu+WeQwWyMBa0SAF7bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80759356"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80759356"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 15:36:10 -0700
X-CSE-ConnectionGUID: 3R/znga6ROKN7SqKe4z86w==
X-CSE-MsgGUID: JG21eSXHR/OaDaU19EA5kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="238276910"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2026 15:36:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSjKf-000000006VC-3u4g;
	Thu, 28 May 2026 22:36:05 +0000
Date: Fri, 29 May 2026 06:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8726/9137] ERROR: modpost:
 __ex_table+0x1cb0 references non-executable section '__tracepoints_strings'
Message-ID: <202605290658.I04YgenU-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "JP Kobryn (Meta)" <jp.kobryn@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
commit: 10a4bb5fadac4de8d750e73ff1d3ac024af8987e [8726/9137] mm/compaction: cap compact_gap() at COMPACT_CLUSTER_MAX
:::::: branch date: 5 hours ago
:::::: commit date: 18 hours ago
config: riscv-randconfig-001-20260528 (https://download.01.org/0day-ci/archive/20260529/202605290658.I04YgenU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290658.I04YgenU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605290658.I04YgenU-lkp@intel.com/

Note: the linux-next/master HEAD f7af91adc230aa99e23330ecf85bc9badd9780ad builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: samsung_i2s_driver+0x64 (section: .data) -> 0x3c228 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: samsung_i2s_driver+0x70 (section: .data) -> 0x3c2bc (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: samsung_i2s_driver+0x7c (section: .data) -> 0x3c2c4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: samsung_i2s_driver+0x80 (section: .data) -> 0x3c2c4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: samsung_i2s_driver+0x90 (section: .data) -> 0x3c2bc (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: samsung_i2s_driver+0x9c (section: .data) -> 0x3c2c4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: samsung_i2s_driver+0xa0 (section: .data) -> 0x3c2c4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_driver+0x14 (section: .data) -> .LBB117_12 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill+0x0 (section: .data) -> 0x3c6a4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill+0x170 (section: .data) -> .Lpcrel_hi705 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill+0x19c (section: .data) -> 0x3c6b0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill+0x1a4 (section: .data) -> .Lpcrel_hi706 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_headset_pins+0x8 (section: .data) -> .Lpcrel_hi707 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_headset_pins+0x1c (section: .data) -> 0x3c6c0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_cpus+0x8 (section: .data) -> 0x3c728 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_codecs+0x8 (section: .data) -> 0x3c730 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_platforms+0x0 (section: .data) -> 0x3c728 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: baseband_cpus+0x8 (section: .data) -> 0x3c750 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: baseband_codecs+0x0 (section: .data) -> 0x3c758 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: baseband_codecs+0x8 (section: .data) -> 0x3c75c (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x0 (section: .data) -> 0x3c724 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x4 (section: .data) -> 0x3c724 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x8 (section: .data) -> 0x3c724 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x10 (section: .data) -> .Lpcrel_hi712 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x1c (section: .data) -> .Lpcrel_hi713 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x5c (section: .data) -> 0x3c738 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x60 (section: .data) -> 0x3c738 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x64 (section: .data) -> 0x3c750 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x6c (section: .data) -> 0x3c754 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x78 (section: .data) -> .Lpcrel_hi714 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: littlemill_dai+0x84 (section: .data) -> 0x3c75c (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sun4i_spdif_driver+0x0 (section: .data) -> .LBB0_9 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra30_ahub_driver+0x2c (section: .data) -> __TRACE_SYSTEM_COMPACT_SKIPPED (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: tegra30_ahub_driver+0x80 (section: .data) -> __TRACE_SYSTEM_ZONE_MOVABLE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: tegra30_ahub_driver+0xa0 (section: .data) -> __TRACE_SYSTEM_ZONE_MOVABLE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b54 (section: __ex_table) -> 0x6a67 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b58 (section: __ex_table) -> 0x46be29 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b60 (section: __ex_table) -> 0xa89e6 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b64 (section: __ex_table) -> 0x54b34 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b84 (section: __ex_table) -> 0x6aab1f (section: .debug_str)
ERROR: modpost: __ex_table+0x1b84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> 0x6fc61a (section: .debug_str)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b90 (section: __ex_table) -> 0x74b29c (section: .debug_str)
ERROR: modpost: __ex_table+0x1b90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b94 (section: __ex_table) -> 0x6fc61a (section: .debug_str)
ERROR: modpost: __ex_table+0x1b94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b9c (section: __ex_table) -> 0x327a0f (section: .debug_str)
ERROR: modpost: __ex_table+0x1b9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba0 (section: __ex_table) -> 0x46b51d (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba8 (section: __ex_table) -> 0x6a38d0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bac (section: __ex_table) -> 0x46b51d (section: .debug_str)
ERROR: modpost: __ex_table+0x1bac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb4 (section: __ex_table) -> 0x834d57 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb8 (section: __ex_table) -> 0x379270 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc0 (section: __ex_table) -> 0x379206 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc4 (section: __ex_table) -> 0x379270 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> 0x6f5c4b (section: .debug_str)
ERROR: modpost: __ex_table+0x1bcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd0 (section: __ex_table) -> 0x835466 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf0 (section: __ex_table) -> 0x521870 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1bf0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf4 (section: __ex_table) -> 0x521928 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1bf4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bfc (section: __ex_table) -> 0x5252b5 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1bfc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c00 (section: __ex_table) -> 0x525348 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1c00 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c44 (section: __ex_table) -> 0x885799 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c48 (section: __ex_table) -> 0x8d72cb (section: .debug_str)
ERROR: modpost: __ex_table+0x1c48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c50 (section: __ex_table) -> 0x7941d0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c54 (section: __ex_table) -> 0x3caa80 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c5c (section: __ex_table) -> 0x6f55a7 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c60 (section: __ex_table) -> 0x3caa80 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c68 (section: __ex_table) -> 0x65230c (section: .debug_str)
ERROR: modpost: __ex_table+0x1c68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c6c (section: __ex_table) -> 0x97b4bf (section: .debug_str)
ERROR: modpost: __ex_table+0x1c6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c8c (section: __ex_table) -> trace_raw_output_btrfs_qgroup_meta_convert.symbols.423 (section: .rodata)
ERROR: modpost: __ex_table+0x1c8c references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c90 (section: __ex_table) -> .L.str.421 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1c90 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cb0 (section: __ex_table) -> __tpstrtab_extent_writepage (section: __tracepoints_strings)
>> ERROR: modpost: __ex_table+0x1cb0 references non-executable section '__tracepoints_strings'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cb4 (section: __ex_table) -> __tracepoint_ptr_btrfs_sync_file (section: __tracepoints_ptrs)
>> ERROR: modpost: __ex_table+0x1cb4 references non-executable section '__tracepoints_ptrs'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cbc (section: __ex_table) -> __tpstrtab_btrfs_skip_unused_block_group (section: __tracepoints_strings)
ERROR: modpost: __ex_table+0x1cbc references non-executable section '__tracepoints_strings'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cc0 (section: __ex_table) -> __tracepoint_ptr_btrfs_clear_extent_bit (section: __tracepoints_ptrs)
ERROR: modpost: __ex_table+0x1cc0 references non-executable section '__tracepoints_ptrs'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cc8 (section: __ex_table) -> TRACE_SYSTEM_BTRFS_QGROUP_RSV_DATA (section: _ftrace_eval_map)
>> ERROR: modpost: __ex_table+0x1cc8 references non-executable section '_ftrace_eval_map'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ccc (section: __ex_table) -> __TRACE_SYSTEM_BTRFS_QGROUP_RSV_META_PREALLOC (section: .init.data)
ERROR: modpost: __ex_table+0x1ccc references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cd4 (section: __ex_table) -> __TRACE_SYSTEM_FLUSH_DELAYED_REFS_NR (section: .init.data)
ERROR: modpost: __ex_table+0x1cd4 references non-executable section '.init.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1cd8 (section: __ex_table) -> .L.str.73 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1cd8 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ce0 (section: __ex_table) -> .L.str.172 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1ce0 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ce4 (section: __ex_table) -> trace_event_type_funcs_btrfs__ordered_extent (section: .data)
ERROR: modpost: __ex_table+0x1ce4 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d40 (section: __ex_table) -> 0xb9a57e (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d40 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d44 (section: __ex_table) -> 0xb9a604 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d44 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d4c (section: __ex_table) -> 0xb9acb7 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d4c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d50 (section: __ex_table) -> 0xb9ad28 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d50 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d58 (section: __ex_table) -> 0xb9b19d (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d58 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d5c (section: __ex_table) -> 0xb9b25b (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d5c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d64 (section: __ex_table) -> 0x835194 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d68 (section: __ex_table) -> 0xa0c44 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d70 (section: __ex_table) -> 0x41ac5d (section: .debug_str)
ERROR: modpost: __ex_table+0x1d70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d74 (section: __ex_table) -> 0x7e3f51 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d7c (section: __ex_table) -> 0xb9d38a (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d7c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d80 (section: __ex_table) -> 0xb9d41c (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d80 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d88 (section: __ex_table) -> 0xa0fba (section: .debug_str)
ERROR: modpost: __ex_table+0x1d88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d8c (section: __ex_table) -> 0xf2ce0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d94 (section: __ex_table) -> 0x1e4fdc (section: .debug_str)
ERROR: modpost: __ex_table+0x1d94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d98 (section: __ex_table) -> 0x142c7c (section: .debug_str)
ERROR: modpost: __ex_table+0x1d98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da0 (section: __ex_table) -> nist_p192_g_y (section: .data)
ERROR: modpost: __ex_table+0x1da0 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da4 (section: __ex_table) -> nist_p256 (section: .data)
ERROR: modpost: __ex_table+0x1da4 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dac (section: __ex_table) -> 0xd2076f (section: .debug_loc)
ERROR: modpost: __ex_table+0x1dac references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db0 (section: __ex_table) -> 0xd208cf (section: .debug_loc)
ERROR: modpost: __ex_table+0x1db0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db8 (section: __ex_table) -> 0xd207f4 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1db8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dbc (section: __ex_table) -> 0xd208cf (section: .debug_loc)
ERROR: modpost: __ex_table+0x1dbc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc4 (section: __ex_table) -> 0x2d7d6c (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc8 (section: __ex_table) -> 0x1e537d (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e84 (section: __ex_table) -> 0x3caf2f (section: .debug_str)
ERROR: modpost: __ex_table+0x1e84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e88 (section: __ex_table) -> 0x327f10 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e90 (section: __ex_table) -> 0x1e52be (section: .debug_str)
ERROR: modpost: __ex_table+0x1e90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e94 (section: __ex_table) -> 0x2872c0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec0 (section: __ex_table) -> 0x7f0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec4 (section: __ex_table) -> 0x83547f (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ecc (section: __ex_table) -> 0x600b7a (section: .debug_str)
ERROR: modpost: __ex_table+0x1ecc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed0 (section: __ex_table) -> 0x75acd7 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ed0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed8 (section: __ex_table) -> 0x1736b0 (section: .debug_ranges)
ERROR: modpost: __ex_table+0x1ed8 references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1edc (section: __ex_table) -> 0x8ef08f (section: .debug_str)
ERROR: modpost: __ex_table+0x1edc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f5c (section: __ex_table) -> 0x103c566 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f5c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f60 (section: __ex_table) -> 0x103c643 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f60 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f68 (section: __ex_table) -> 0x103cc70 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f68 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f6c (section: __ex_table) -> .Lline_table_start0 (section: .debug_line)
ERROR: modpost: __ex_table+0x1f6c references non-executable section '.debug_line'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f74 (section: __ex_table) -> 0x46b6a1 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f78 (section: __ex_table) -> 0x6f5dc0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f8c (section: __ex_table) -> 0x4f1 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f90 (section: __ex_table) -> 0x794552 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f98 (section: __ex_table) -> 0x4fef0 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f9c (section: __ex_table) -> 0x7e3eb2 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa4 (section: __ex_table) -> 0x2d7b1f (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa4 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
