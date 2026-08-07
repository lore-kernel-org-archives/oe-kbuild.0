Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FD372EE2
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114470; cv=none; b=Lx6xRhF/yYkxhVN25XbRFf5cMJvERSlHQNj7tijqJawGEl8OtczENNkzJndqAAKqEpS0xXJ1IL7FoH0ib1esyFKIbkTe/Dn9ZSE0wYqN2eJKIsDSLIkOy7Zxt2WVz/gPbBXb7FkGHSxpo4/n9WjRdU6KDLwPr42krrBLxaCZKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114470; c=relaxed/simple;
	bh=Nrh/MnwjM7OuM1UeWKdjJykLxyEJGrFK35IpBUA53wU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AlRCbK0urDpXeLs1Crcom9AZw9nT6Hg/YuDBukEeGe8YNnO4Xoca8Vb21n2U05FdDid66iKdwQ2VTuoNEz7pRruQkt4GhAjH99Q33S0+YVOHsAEHH62O9PFS2x1xF16qcnUmIGVCStyjyUMSQB3Y0fXO4ZDPRsdiKdYcaEr+XMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GN2VzkcO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GN2VzkcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114466; x=1817650466;
  h=date:from:to:cc:subject:message-id;
  bh=Nrh/MnwjM7OuM1UeWKdjJykLxyEJGrFK35IpBUA53wU=;
  b=GN2VzkcOOOu3NDWgjGCwI3wtsPLDSNVSxz1RI4C401lJY0KAz301dA7h
   le+Xk+TEa1d3ouxVEXcMW9MxQdZpgHflbcmcptTAmGq7uvOLDWBxz9a6Z
   uHth1jKUGuwgYwFzTnj96Yximw/McvQ/80OgcybZGqFffukJN8r7EB/SQ
   bmnWmq5ZAD8SXkDyvxzuaOW1ar77HWwvDfhgxQadsuuEH+Cx4Ysf1XG29
   5TTDh6a58QcJt9I2rWMTXg8dIq6iHvIlf6xL1Hwjfy2SJbCjtKsec2WIt
   vqDC9cTOwRl5HuEFsGvRwAy9R2cvs9ZpiWCS5XFOv5IbI7Jhx9ApreEFi
   A==;
X-CSE-ConnectionGUID: L1Js7vlpQnmhQRummnltCQ==
X-CSE-MsgGUID: VfZTW54dRZ20A3fGgkRp5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86597794"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86597794"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:54:24 -0700
X-CSE-ConnectionGUID: iUFz26EoR+m9LOOOsfCrmw==
X-CSE-MsgGUID: zbEBi9mSTt+Wj/nkxp3q/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="262462328"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2026 07:54:24 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsLxl-000000004qE-3AtJ;
	Fri, 07 Aug 2026 14:54:21 +0000
Date: Fri, 07 Aug 2026 16:53:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202608071602.oVpMy3z3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jacky Huang <jackyhuang@nvidia.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jacky-Huang/ARM-dts-aspeed-Add-NVIDIA-VR-NVL-BMC/20260804-163812
head:   bb0a4d9e19f0473a718373fb12ce887c27e81629
commit: bb0a4d9e19f0473a718373fb12ce887c27e81629 ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2051-20260806 (https://download.01.org/0day-ci/archive/20260807/202608071602.oVpMy3z3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071602.oVpMy3z3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608071602.oVpMy3z3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:640.36-644.7: Warning (unique_unit_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicate unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dtb: /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3c-global', 'syscon']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
