Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102021A3160
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 21:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771104846; cv=none; b=fECyrqVK7xQ4S0LINfFtiGgrzOuuyjvHGv6VElwaRGSNHNmkPdrlkWWfb/WApegy00C642u9OlU829xTcBQFfH3Ax8SIZfOxh3n4uykLchJwX2OZb2WUZCc7aaTixxAMUYMccBiP+/F/o8xRiqXlBa/qG0p+HHDJBaYLOiwScrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771104846; c=relaxed/simple;
	bh=SjR2C16MiQHXWqj576yTZDUkMUdHbVGPKC4GpM4wvPk=;
	h=Date:From:To:Subject:Message-ID; b=adl3MXCERQE1lU1AjMXLvvsRo9AynF9R7fZt3oMSJwtrkPy66E4L2v6W/tHeW8yXjQtgle92swMWaP/JQGnFHwE16oIEpPS7qLA736S+tJNWLrqEODsHivhC/2UVV4vf+7cfXQJ/Fed9cMIKTR1edIsJCRCCBSPmOrcRgmFujsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9dv4n6l; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9dv4n6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771104844; x=1802640844;
  h=date:from:to:subject:message-id;
  bh=SjR2C16MiQHXWqj576yTZDUkMUdHbVGPKC4GpM4wvPk=;
  b=b9dv4n6lDjIJoLPLIv9R/DTY0WjZ/v6qc2t7pXWPLOh9/QbS/tCjKX/j
   Zxrod1w5VSTuqqvmwiu9zc7Vd3gl3MhVNi5CKwmcLj7S2JgCJaDwPsVdR
   VgSOUPQxAQOZderWQBLleEhc6hgQHndQkrOFDq3gw68asLCd0IHwbg0pm
   y6c+ZSzNEZB9bBvBJgyr6UwVbEyDEcXMDieAgsmLaLZwADB0DQgebUAhx
   3n2oClEZ72mkXvh0YF/C+3gWrLP/Y9eV/sqZTxivdrby03JX/O80spnOo
   m/qXYf8mrN2H/YZmIgzqcfxekoe7sV/aSTN832iFUFQD+uJyjfn9Rni/2
   w==;
X-CSE-ConnectionGUID: 9EzBbkY2So2wqnuiGY3dAw==
X-CSE-MsgGUID: UEoYVRzCR3+scfQnn6hmuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="89838880"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="89838880"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 13:34:03 -0800
X-CSE-ConnectionGUID: uWvbkliLRbm24UJIV/RjWA==
X-CSE-MsgGUID: FOtzC/XnS5OjozQ/JCsjUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="212604452"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2026 13:34:03 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrNH6-000000001xR-2xR7
	for oe-kbuild@lists.linux.dev;
	Sat, 14 Feb 2026 21:34:00 +0000
Date: Sat, 14 Feb 2026 22:33:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 37/39] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'devtmpfs'
Message-ID: <202602142210.HnOMakuj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Brian Cain <brian.cain@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   04e61eabbab151166a0cfc4bb76348b0fb7451ce
commit: dcc6aa0a4d20de7ed507ad8d9fddede18350205b [37/39] hexagon: add QEMU boot documentation
:::::: branch date: 13 minutes ago
:::::: commit date: 13 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260214/202602142210.HnOMakuj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'devtmpfs'
#133: FILE: Documentation/arch/hexagon/qemu-boot.rst:92:
+    mount -t devtmpfs devtmpfs /dev

WARNING:REPEATED_WORD: Possible repeated word: 'proc'
#134: FILE: Documentation/arch/hexagon/qemu-boot.rst:93:
+    mount -t proc proc /proc

WARNING:REPEATED_WORD: Possible repeated word: 'sysfs'
#135: FILE: Documentation/arch/hexagon/qemu-boot.rst:94:
+    mount -t sysfs sysfs /sys

WARNING:REPEATED_WORD: Possible repeated word: 'tmpfs'
#136: FILE: Documentation/arch/hexagon/qemu-boot.rst:95:
+    mount -t tmpfs tmpfs /tmp

WARNING:REPEATED_WORD: Possible repeated word: 'vmlinux'
#221: FILE: Documentation/arch/hexagon/qemu-boot.rst:180:
+    llvm-objcopy -O binary vmlinux vmlinux.bin

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
