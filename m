Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F22367BF
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 15:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582393; cv=none; b=kOIm7Hfyle2Pwsgp7VJDkgkVIygSp5/le1Dp0s6YES68k+tkcJutIGo/wk6Oa+vmznp4JwNs7V8+Zm7FZXSYFumer3VkOhNfT9KjBs49BYrzbMa0bU34QPaswqLQJRA5Xv++dwhdFO24hmZfV1uIM/Sq6jLeHcadjV8Dq/BASyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582393; c=relaxed/simple;
	bh=LESaDDgwg6aLaBiU4GE8vrJUMllvw47/5b1lOEBlJyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YAveGzey54rtec8anfvlq2ZkIE1HMBRyx8eeGpPKQHk5EZ+ydJE9uB5NkMRroCGKUJ7bo5H0gRH1L3pC5SRDoYhsl3pqmSHYko1JE7PMQds6pOd5jnDAwcOS6E9RfX+9q1M2lE31TCzh4YFPH9SlPYnJJqaTQNSss4z9q9cuRGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iL46EWNK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iL46EWNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754582391; x=1786118391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LESaDDgwg6aLaBiU4GE8vrJUMllvw47/5b1lOEBlJyY=;
  b=iL46EWNKKfE2GoCcrr+6BQ6gW4aSkph6wZuHxzaRbu5SFy3TXZ4GdPlX
   P8Ke7Fj3F2qC/IndWrIZVItLYOT1NA139D/EeW2sAPqkVmaah/JZ234Bm
   TsTUjj4o9ZvhEYhkr/3uFunqH3BgmEsc6naay/ay13q9V6TscAAQmiaHV
   xh9/tnzCq/+Y6HH1Jfz5vSEYedBw49OEi1JfPxFEjXr93PDo35d7NzCh6
   kWi1wFxqAXc0y4qc0MBcOaXzO+eRliCuYDl+eOg94kBIRKyfrPPa4xOjD
   5jISVh+rjN44X0MsmVMiPHwsz82LTbolbKzYNIhNl7k9fYIs1A6ou+A5w
   A==;
X-CSE-ConnectionGUID: 4rysmV5WToWkyN1X6rdnjQ==
X-CSE-MsgGUID: 3I9agIDbQXqcBHDsQyhKGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56131763"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56131763"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 08:59:50 -0700
X-CSE-ConnectionGUID: Xl4i09lCQF6Gw1JQatTr9g==
X-CSE-MsgGUID: jF68RK7zQTG6OAMwJWrF2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169339666"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 08:59:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk31u-0002wU-1e;
	Thu, 07 Aug 2025 15:59:46 +0000
Date: Thu, 7 Aug 2025 23:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13557/13560] ERROR: modpost: __ex_table+0x14f4
 references non-executable section '.data.rel.local.f2fs_attr_readdir_ra'
Message-ID: <202508072327.FmSUD5jl-lkp@intel.com>
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
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   442d93313caebc8ccd6d53f4572c50732a95bc48
commit: 69850243a3389de3771ccb7ef37a4924fe0b58be [13557/13560] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git
:::::: branch date: 10 hours ago
:::::: commit date: 15 hours ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072327.FmSUD5jl-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072327.FmSUD5jl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072327.FmSUD5jl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: delete_node+0x13a (section: .text.delete_node) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_node+0x140 (section: .text.delete_node) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_node+0x156 (section: .text.delete_node) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_node+0x15c (section: .text.delete_node) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_node+0x166 (section: .text.delete_node) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_node+0x17a (section: .text.delete_node) -> pm800_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_node+0x1a4 (section: .text.delete_node) -> pm800_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_node+0x1a8 (section: .text.delete_node) -> pm805_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0xfe (section: .text.resource_string.isra.12) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x106 (section: .text.resource_string.isra.12) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x10e (section: .text.resource_string.isra.12) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x158 (section: .text.resource_string.isra.12) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x1ce (section: .text.resource_string.isra.12) -> cs42l43_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x252 (section: .text.resource_string.isra.12) -> cs42l43_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_string.isra.12+0x270 (section: .text.resource_string.isra.12) -> cs42l43_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x2c (section: .text.pointer) -> cs42l43_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x80 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x8a (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0xa0 (section: .text.pointer) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0xc6 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0xde (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0xf4 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x10e (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x112 (section: .text.pointer) -> cs42l43_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x152 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x16a (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x18c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x1a4 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x1ba (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x1d2 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x206 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x21c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x234 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x24c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x264 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x27c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x292 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x2aa (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x300 (section: .text.pointer) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x304 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x314 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x32c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x346 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x35e (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x376 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x38c (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x39e (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x3ce (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x3e4 (section: .text.pointer) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x3ec (section: .text.pointer) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pointer+0x3f8 (section: .text.pointer) -> bd9571mwv_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: va_format+0x28 (section: .text.va_format) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: va_format+0x34 (section: .text.va_format) -> bd9571mwv_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x2c (section: .text.xas_find_conflict) -> lp873x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x34 (section: .text.xas_find_conflict) -> lp87565_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x40 (section: .text.xas_find_conflict) -> lp873x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x66 (section: .text.xas_find_conflict) -> lp87565_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x86 (section: .text.xas_find_conflict) -> lp873x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x94 (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x98 (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x272 (section: .text.xas_find_conflict) -> lp873x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x27a (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x280 (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x2dc (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_find_conflict+0x2f0 (section: .text.xas_find_conflict) -> lp87565_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_get_mark+0x1fa (section: .text.xa_get_mark) -> lp873x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xa_get_mark+0x2c6 (section: .text.xa_get_mark) -> lp873x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1494 (section: __ex_table) -> f2fs_attr_max_discard_issue_time (section: .data.rel.local.f2fs_attr_max_discard_issue_time)
ERROR: modpost: __ex_table+0x1494 references non-executable section '.data.rel.local.f2fs_attr_max_discard_issue_time'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1498 (section: __ex_table) -> f2fs_attr_max_fragment_chunk (section: .data.rel.local.f2fs_attr_max_fragment_chunk)
ERROR: modpost: __ex_table+0x1498 references non-executable section '.data.rel.local.f2fs_attr_max_fragment_chunk'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a0 (section: __ex_table) -> f2fs_attr_max_io_bytes (section: .data.rel.local.f2fs_attr_max_io_bytes)
ERROR: modpost: __ex_table+0x14a0 references non-executable section '.data.rel.local.f2fs_attr_max_io_bytes'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a4 (section: __ex_table) -> f2fs_attr_max_read_extent_count (section: .data.rel.local.f2fs_attr_max_read_extent_count)
ERROR: modpost: __ex_table+0x14a4 references non-executable section '.data.rel.local.f2fs_attr_max_read_extent_count'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ac (section: __ex_table) -> f2fs_attr_max_small_discards (section: .data.rel.local.f2fs_attr_max_small_discards)
ERROR: modpost: __ex_table+0x14ac references non-executable section '.data.rel.local.f2fs_attr_max_small_discards'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b0 (section: __ex_table) -> f2fs_attr_mid_discard_issue_time (section: .data.rel.local.f2fs_attr_mid_discard_issue_time)
ERROR: modpost: __ex_table+0x14b0 references non-executable section '.data.rel.local.f2fs_attr_mid_discard_issue_time'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b8 (section: __ex_table) -> f2fs_attr_migration_window_granularity (section: .data.rel.local.f2fs_attr_migration_window_granularity)
ERROR: modpost: __ex_table+0x14b8 references non-executable section '.data.rel.local.f2fs_attr_migration_window_granularity'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14bc (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x14bc references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c4 (section: __ex_table) -> f2fs_attr_min_ipu_util (section: .data.rel.local.f2fs_attr_min_ipu_util)
ERROR: modpost: __ex_table+0x14c4 references non-executable section '.data.rel.local.f2fs_attr_min_ipu_util'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c8 (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x14c8 references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d0 (section: __ex_table) -> f2fs_attr_mounted_time_sec (section: .data.rel.local.f2fs_attr_mounted_time_sec)
ERROR: modpost: __ex_table+0x14d0 references non-executable section '.data.rel.local.f2fs_attr_mounted_time_sec'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d4 (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x14d4 references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14dc (section: __ex_table) -> f2fs_attr_node_io_flag (section: .data.rel.local.f2fs_attr_node_io_flag)
ERROR: modpost: __ex_table+0x14dc references non-executable section '.data.rel.local.f2fs_attr_node_io_flag'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e0 (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x14e0 references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e8 (section: __ex_table) -> f2fs_attr_pending_discard (section: .data.rel.local.f2fs_attr_pending_discard)
ERROR: modpost: __ex_table+0x14e8 references non-executable section '.data.rel.local.f2fs_attr_pending_discard'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ec (section: __ex_table) -> f2fs_attr_ra_nid_pages (section: .data.rel.local.f2fs_attr_ra_nid_pages)
ERROR: modpost: __ex_table+0x14ec references non-executable section '.data.rel.local.f2fs_attr_ra_nid_pages'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f4 (section: __ex_table) -> f2fs_attr_readdir_ra (section: .data.rel.local.f2fs_attr_readdir_ra)
>> ERROR: modpost: __ex_table+0x14f4 references non-executable section '.data.rel.local.f2fs_attr_readdir_ra'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f8 (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x14f8 references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1500 (section: __ex_table) -> f2fs_attr_reserved_pin_section (section: .data.rel.local.f2fs_attr_reserved_pin_section)
ERROR: modpost: __ex_table+0x1500 references non-executable section '.data.rel.local.f2fs_attr_reserved_pin_section'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1504 (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x1504 references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x150c (section: __ex_table) -> f2fs_attr_sb_block_zoned (section: .data.rel.local.f2fs_attr_sb_block_zoned)
>> ERROR: modpost: __ex_table+0x150c references non-executable section '.data.rel.local.f2fs_attr_sb_block_zoned'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1510 (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x1510 references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1518 (section: __ex_table) -> f2fs_attr_sb_device_alias (section: .data.rel.local.f2fs_attr_sb_device_alias)
ERROR: modpost: __ex_table+0x1518 references non-executable section '.data.rel.local.f2fs_attr_sb_device_alias'
WARNING: modpost: vmlinux: section mismatch in reference: 0x151c (section: __ex_table) -> f2fs_attr_sb_extra_attr (section: .data.rel.local.f2fs_attr_sb_extra_attr)
ERROR: modpost: __ex_table+0x151c references non-executable section '.data.rel.local.f2fs_attr_sb_extra_attr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1524 (section: __ex_table) -> f2fs_attr_sb_inode_checksum (section: .data.rel.local.f2fs_attr_sb_inode_checksum)
ERROR: modpost: __ex_table+0x1524 references non-executable section '.data.rel.local.f2fs_attr_sb_inode_checksum'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1528 (section: __ex_table) -> f2fs_attr_sb_lost_found (section: .data.rel.local.f2fs_attr_sb_lost_found)
ERROR: modpost: __ex_table+0x1528 references non-executable section '.data.rel.local.f2fs_attr_sb_lost_found'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1530 (section: __ex_table) -> f2fs_attr_sb_quota_ino (section: .data.rel.local.f2fs_attr_sb_quota_ino)
ERROR: modpost: __ex_table+0x1530 references non-executable section '.data.rel.local.f2fs_attr_sb_quota_ino'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1534 (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x1534 references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x153c (section: __ex_table) -> f2fs_attr_sb_status (section: .data.rel.local.f2fs_attr_sb_status)
ERROR: modpost: __ex_table+0x153c references non-executable section '.data.rel.local.f2fs_attr_sb_status'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1540 (section: __ex_table) -> f2fs_attr_seq_file_ra_mul (section: .data.rel.local.f2fs_attr_seq_file_ra_mul)
>> ERROR: modpost: __ex_table+0x1540 references non-executable section '.data.rel.local.f2fs_attr_seq_file_ra_mul'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> f2fs_attr_undiscard_blks (section: .data.rel.local.f2fs_attr_undiscard_blks)
ERROR: modpost: __ex_table+0x1548 references non-executable section '.data.rel.local.f2fs_attr_undiscard_blks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> f2fs_attr_warm_data_age_threshold (section: .data.rel.local.f2fs_attr_warm_data_age_threshold)
ERROR: modpost: __ex_table+0x154c references non-executable section '.data.rel.local.f2fs_attr_warm_data_age_threshold'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> f2fs_base_attr_atomic_write (section: .data.rel.local.f2fs_base_attr_atomic_write)
ERROR: modpost: __ex_table+0x1554 references non-executable section '.data.rel.local.f2fs_base_attr_atomic_write'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x1558 references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> f2fs_base_attr_encrypted_casefold (section: .data.rel.local.f2fs_base_attr_encrypted_casefold)
ERROR: modpost: __ex_table+0x1560 references non-executable section '.data.rel.local.f2fs_base_attr_encrypted_casefold'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> f2fs_base_attr_extra_attr (section: .data.rel.local.f2fs_base_attr_extra_attr)
ERROR: modpost: __ex_table+0x1564 references non-executable section '.data.rel.local.f2fs_base_attr_extra_attr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> f2fs_base_attr_inode_checksum (section: .data.rel.local.f2fs_base_attr_inode_checksum)
>> ERROR: modpost: __ex_table+0x156c references non-executable section '.data.rel.local.f2fs_base_attr_inode_checksum'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> f2fs_base_attr_linear_lookup (section: .data.rel.local.f2fs_base_attr_linear_lookup)
ERROR: modpost: __ex_table+0x1570 references non-executable section '.data.rel.local.f2fs_base_attr_linear_lookup'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1578 (section: __ex_table) -> f2fs_base_attr_pin_file (section: .data.rel.local.f2fs_base_attr_pin_file)
ERROR: modpost: __ex_table+0x1578 references non-executable section '.data.rel.local.f2fs_base_attr_pin_file'
WARNING: modpost: vmlinux: section mismatch in reference: 0x157c (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
ERROR: modpost: __ex_table+0x157c references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> f2fs_base_attr_readonly (section: .data.rel.local.f2fs_base_attr_readonly)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.data.rel.local.f2fs_base_attr_readonly'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> f2fs_base_attr_sb_checksum (section: .data.rel.local.f2fs_base_attr_sb_checksum)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.data.rel.local.f2fs_base_attr_sb_checksum'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> __text (section: .data.rel.ro.local.__text.41801)
ERROR: modpost: __ex_table+0x1590 references non-executable section '.data.rel.ro.local.__text.41801'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> __text (section: .data.rel.ro.local.__text.41825)
ERROR: modpost: __ex_table+0x1594 references non-executable section '.data.rel.ro.local.__text.41825'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15fc (section: __ex_table) -> .LASF980 (section: .debug_str)
ERROR: modpost: __ex_table+0x15fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1600 (section: __ex_table) -> .LASF982 (section: .debug_str)
ERROR: modpost: __ex_table+0x1600 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1608 (section: __ex_table) -> .LASF984 (section: .debug_str)
ERROR: modpost: __ex_table+0x1608 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x160c (section: __ex_table) -> .LASF986 (section: .debug_str)
ERROR: modpost: __ex_table+0x160c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1614 (section: __ex_table) -> .LASF988 (section: .debug_str)
ERROR: modpost: __ex_table+0x1614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1618 (section: __ex_table) -> .LASF990 (section: .debug_str)
ERROR: modpost: __ex_table+0x1618 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1620 (section: __ex_table) -> .LASF992 (section: .debug_str)
ERROR: modpost: __ex_table+0x1620 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1624 (section: __ex_table) -> .LASF994 (section: .debug_str)
ERROR: modpost: __ex_table+0x1624 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x162c (section: __ex_table) -> .LASF996 (section: .debug_str)
ERROR: modpost: __ex_table+0x162c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1630 (section: __ex_table) -> .LASF998 (section: .debug_str)
ERROR: modpost: __ex_table+0x1630 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .LASF1000 (section: .debug_str)
ERROR: modpost: __ex_table+0x1638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x163c (section: __ex_table) -> .LASF1002 (section: .debug_str)
ERROR: modpost: __ex_table+0x163c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1644 (section: __ex_table) -> .LASF1004 (section: .debug_str)
ERROR: modpost: __ex_table+0x1644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1648 (section: __ex_table) -> .LASF1006 (section: .debug_str)
ERROR: modpost: __ex_table+0x1648 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1650 (section: __ex_table) -> .LASF1008 (section: .debug_str)
ERROR: modpost: __ex_table+0x1650 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1654 (section: __ex_table) -> .LASF1006 (section: .debug_str)
ERROR: modpost: __ex_table+0x1654 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x165c (section: __ex_table) -> .LASF1011 (section: .debug_str)
ERROR: modpost: __ex_table+0x165c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1660 (section: __ex_table) -> .LASF1006 (section: .debug_str)
ERROR: modpost: __ex_table+0x1660 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF1014 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF1016 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF1018 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF1020 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16ec (section: __ex_table) -> .LASF1525 (section: .debug_str)
ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .LASF1527 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f8 (section: __ex_table) -> .LASF1529 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16fc (section: __ex_table) -> .LASF1527 (section: .debug_str)
ERROR: modpost: __ex_table+0x16fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1704 (section: __ex_table) -> .LASF1532 (section: .debug_str)
ERROR: modpost: __ex_table+0x1704 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .LASF1527 (section: .debug_str)
ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1710 (section: __ex_table) -> .LASF1535 (section: .debug_str)
ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1714 (section: __ex_table) -> .LASF1527 (section: .debug_str)
ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x171c (section: __ex_table) -> .LASF1538 (section: .debug_str)
ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .LASF1527 (section: .debug_str)
ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1728 (section: __ex_table) -> .LASF1541 (section: .debug_str)
ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x172c (section: __ex_table) -> .LASF1527 (section: .debug_str)
ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1734 (section: __ex_table) -> .LASF1543 (section: .debug_str)
ERROR: modpost: __ex_table+0x1734 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .LASF1545 (section: .debug_str)
ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1740 (section: __ex_table) -> .LASF1547 (section: .debug_str)
ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1744 (section: __ex_table) -> .LASF1549 (section: .debug_str)
ERROR: modpost: __ex_table+0x1744 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x174c (section: __ex_table) -> .LASF1551 (section: .debug_str)
ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .LASF1553 (section: .debug_str)
ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .LASF1555 (section: .debug_str)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .LASF1557 (section: .debug_str)
ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .LASF1559 (section: .debug_str)
ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .LASF1561 (section: .debug_str)
ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1770 (section: __ex_table) -> .LASF1563 (section: .debug_str)
ERROR: modpost: __ex_table+0x1770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1774 (section: __ex_table) -> .LASF1565 (section: .debug_str)
ERROR: modpost: __ex_table+0x1774 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x177c (section: __ex_table) -> .LASF1567 (section: .debug_str)
ERROR: modpost: __ex_table+0x177c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1780 (section: __ex_table) -> .LASF1569 (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
