Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D781A9B24
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 23:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787526408; cv=none; b=c0iE3rtPzju5CECUN1zi2Ecy6Ae3lw7TxwCgCIhJALm8MlI7wt1RNeXmkTy77BAI2KYLfEmq+g18oxS1n6bumsUneyiLmNvZkCENJFX8hI+sx8joAClMwYZuGhYcvGQF2mXmAZEBNiLorstL1vjHxj2YX8uifwy2/nY8xOfflOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787526408; c=relaxed/simple;
	bh=9OTZfPhJNAjtD6F6r+zpbFJXBhZ5q5b1bIhIHEsbct0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TYLpSdWZIMwCAWCcuTDJxxM5l1EmpYbQd0/xf9LImWHfhOYnRC+OYVuUEPb38YmuQ1N70+/obdgsqM8UZucjNt5f9vQhN1Fbr3x0pJFLfaUlTd8dzde4CCBOfbIRgXR6YzjDrGla6yDUVjIPspgZ9sj2/WRlTEMmUZH6tO+cohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNej9g+g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNej9g+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787526406; x=1819062406;
  h=date:from:to:cc:subject:message-id;
  bh=9OTZfPhJNAjtD6F6r+zpbFJXBhZ5q5b1bIhIHEsbct0=;
  b=RNej9g+guXmOKbNpn9HgxvD3HArwZQ695x3HTPEjB5XUGVB8gnw2ubgH
   u6s6+RBpEkQevnkPhqROuY5LxRAUXm/WGof6s4Txx36FlgJ2F5la+u2wt
   c+2AArJvH7h7zVyKK88BUkYsx1MOgjYoqdIxhbLTN984MNqeGqTIeg34N
   FQogTVmnHEVm4STcSXgMaK5ExQMp7bMsSZFq8J8JOmIKtSz9aselqQUIH
   1PWv7+sdGCQlJp4hf6lcZtIXeEI/s5k16saw4wA3CE6LH+EyjIbgYms01
   o/+cfW34dAuFctILjWYHdYgNjK1JPzQ3J14N8O5/ApOou6ZMIZeTF15aX
   Q==;
X-CSE-ConnectionGUID: V46ZeYRsTTusUGxSrmvQ9g==
X-CSE-MsgGUID: /SCH6ChgRxSO7KsNw1HV7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87990848"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="87990848"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 16:06:46 -0700
X-CSE-ConnectionGUID: i4sik/xrR7CwrOusd75Xdw==
X-CSE-MsgGUID: Fryoidc6Tb+GFwfX1fUnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="265068897"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Aug 2026 16:06:43 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyHGt-000000001Rf-084x;
	Sun, 23 Aug 2026 23:06:37 +0000
Date: Mon, 24 Aug 2026 07:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko:
 section mismatch in reference: qede_forced_speed_maps+0x14 (section: .data)
 -> qede_forced_speed_100000 (section: .init.rodata)
Message-ID: <202608240729.SLeMcZCr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Jani,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2709dd5ae32f0828f386327c76bba9f39f63a1c6
commit: d900723d78adec229996aefbab0dcaa66a177b77 modpost: use mod_warn() and mod_error(), clean up logging
date:   8 days ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 days ago
config: xtensa-randconfig-r051-20260823 (https://download.01.org/0day-ci/archive/20260824/202608240729.SLeMcZCr-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240729.SLeMcZCr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d900723d78ad ("modpost: use mod_warn() and mod_error(), clean up logging")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608240729.SLeMcZCr-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0xa8 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x14 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x30 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x4c (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x68 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0x84 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0xa0 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_legacy_maps+0xbc (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x14 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x30 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x4c (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x68 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0x84 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0xa0 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0xbc (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qed_mfw_ext_maps+0xd8 (section: .data) -> __setup_str_initcall_blacklist (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x14 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x30 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x4c (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x68 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x84 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0xa0 (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0xbc (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
ERROR: modpost: drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
