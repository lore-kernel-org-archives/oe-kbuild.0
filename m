Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF93AD507
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jul 2026 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354883; cv=none; b=s/WLJLtrMZ+arQXTsNBA8siV+rB9K+eP4f78BUA7XdTbgaZsEB7tVolVtTJ0pfA37TVSk9L41swvY3loF2BgYGDVCb7UYnK02u6uswehu1QNSEN/Epd+Nt/RTODewBW+FHNzVRIdvtOHdl8JI9ntpLsjh+9ZQrMwEr+loJIGuR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354883; c=relaxed/simple;
	bh=TV/Gcz7LfVFhXhhKLCHGsY2nO06b2pNFc2xbYoHtzgc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DMNE5CzaVMI9pOjgfj06s3nNFGjoVHhbAYDuZcn34i9mKn3luQF2FBr5V3EMggcwFueQR8g3AydZa0llgXs3debmYD5e7Tlxm0O08/BSZcuUzIFI8RQYugKpNkKv5dGXSUl2VPMomgVymB6vdmWNgGWjVbtwWnl6huXs7N20fKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Up7ZY7hq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Up7ZY7hq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783354880; x=1814890880;
  h=date:from:to:cc:subject:message-id;
  bh=TV/Gcz7LfVFhXhhKLCHGsY2nO06b2pNFc2xbYoHtzgc=;
  b=Up7ZY7hq2+ubRq5tIwCnlmGW2pw0ic3ATVJOAdkocw+FO19yxexFFcvu
   EEXCoyQw7L2puaqtCtudcbh7s2U1TnoLQzQSLjRyl0pmKJKm1NcX9IqXh
   JvfiC6s2WCgD7E7sCNsnqzrvGk12lenTO96GkpYua4WqQvP+yCyKYIcZk
   erDM8cdnLXQPqork9Kyov7vVKrMEU7/x+6ZryrtWQ8mHAcTvEbjcErWFp
   0ZHohzK2AFt9oZazbH6I9fDvbOW79SmJK+YMtIhm6dGkmvJWDTmzO0J3+
   cskdcuouSZXDu8rUgny1rO/eQ9k6Mf0FQLxZ9Qvs50Pv0eopPIMgbrxRo
   A==;
X-CSE-ConnectionGUID: 9sXRM/OXSHKzPLwLENDndA==
X-CSE-MsgGUID: GLJGJdmNRm2sBd1A7ReYVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="101538419"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="101538419"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 09:21:19 -0700
X-CSE-ConnectionGUID: Bgc1UA1VR4uJrG9VPMkLDA==
X-CSE-MsgGUID: D1ZoOXJMTACv6VcWTrvxew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="253851372"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Jul 2026 09:21:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgm4J-00000000EXr-3RCY;
	Mon, 06 Jul 2026 16:21:15 +0000
Date: Tue, 07 Jul 2026 00:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: __ex_table+0x1ecc references non-executable
 section '.data.rel.ro'
Message-ID: <202607070028.wuyC8mNW-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
commit: 0b5a58c078167f73d10711734cdc8ea592561ca9 lib/crc: crc32: Change crc32() from macro to inline function and remove cast
date:   1 year ago
:::::: branch date: 16 hours ago
:::::: commit date: 1 year ago
config: riscv-randconfig-002-20260706 (https://download.01.org/0day-ci/archive/20260707/202607070028.wuyC8mNW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607070028.wuyC8mNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b5a58c07816 ("lib/crc: crc32: Change crc32() from macro to inline function and remove cast")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607070028.wuyC8mNW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1d50 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d58 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d58 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d5c (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d5c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d64 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d64 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d68 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d68 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d70 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d70 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d74 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1d74 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d7c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d80 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d88 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d8c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d94 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d98 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1d98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1da0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1da4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1db0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1db8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1db8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dbc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dc8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dd4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ddc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ddc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1de0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1de8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1de8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1dec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1dec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1df4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1df8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1df8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e00 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e04 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e0c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e30 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e34 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e3c (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1e3c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e40 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1e40 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e78 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e7c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e84 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e88 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e90 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e94 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e9c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1e9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ea0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eac (section: __ex_table) -> .L.str.11 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1eac references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ecc (section: __ex_table) -> lpc18xx_usb_otg_phy_probe._entry (section: .data.rel.ro)
>> ERROR: modpost: __ex_table+0x1ecc references non-executable section '.data.rel.ro'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed0 (section: __ex_table) -> __UNIQUE_ID_description347 (section: .modinfo)
ERROR: modpost: __ex_table+0x1ed0 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ed8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1edc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1edc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee4 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ee4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee8 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ee8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef0 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ef0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef4 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1ef4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1efc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1efc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f00 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f08 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f0c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f14 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f14 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f18 (section: __ex_table) -> .L.str.4 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1f18 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f20 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f20 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f24 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x1f24 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f2c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f30 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f38 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f3c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f5c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f60 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f68 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f6c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f74 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f78 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f80 (section: __ex_table) -> mdp_vsync0_groups (section: .data.rel.ro)
ERROR: modpost: __ex_table+0x1f80 references non-executable section '.data.rel.ro'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f84 (section: __ex_table) -> i2s0_data1_groups (section: .data.rel.ro)
ERROR: modpost: __ex_table+0x1f84 references non-executable section '.data.rel.ro'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f8c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f90 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f98 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f9c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1f9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fb0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fbc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fcc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1fec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ffc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1ffc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2004 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2004 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2008 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2008 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2010 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2010 references non-executable section '.debug_str'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
