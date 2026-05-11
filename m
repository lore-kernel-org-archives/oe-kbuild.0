Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C18929CE1
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 02:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778466356; cv=none; b=Ej4rmS4KhTcUx3N05iRRRaK2FEXqkMfYG5jR2LgIh8FP07c7hMitNTVFRECMkZu3guF2nKK0DSBfAqxLaFs29xg7DDjDGqvjjWG3wSucZb2dYC6I0q02L5xgnR8Q4Srnf4chitiVCSI2rH2ytYgImnK6Z3/8VlKO38qgfcajsXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778466356; c=relaxed/simple;
	bh=aUbIm+FWb0gvfsNz+04veEx/n8LtpU5P6YoJI2EormQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E3m+yFE5/LMT9P6J6TRb6IXthaeF089qY9Aa+fmSVlcTSOp7xmwT3BjSZl14YdR/e9D/VYu7nJXesoXbH5dvZ5+UjdP/D8Y1AfvbTWAEW6cSbsT/z5T8R5TIIRjpyVcbInVkiBLfiWOXnD4nrVuSdP/sWzsqlqUrzDuezbAgd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLwwpd6W; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLwwpd6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778466354; x=1810002354;
  h=date:from:to:cc:subject:message-id;
  bh=aUbIm+FWb0gvfsNz+04veEx/n8LtpU5P6YoJI2EormQ=;
  b=gLwwpd6WNYna/gAstYcEp9JToujy4lGiqt782eKhatV4Vrut9WOrfwwF
   nVW4oajc8AUT2Y3nYUHIh1FCE5ZeZBV6L04I7Wl0Jg1d2/rM1gNDnSQY6
   v0aiYiOzYLeIq7qQ3UrsD5MzW9j7Q3wXhRfQhmsgcdyYxZIK+RRjlRbPt
   PvAHIVjT0vEOoHM3Lj+WIx3Tz2wWfuFQWPGL7FBBFCzVJwn4D2ZHDix92
   wYii3/ZE9UjF3CwPVcdiHGT5o4wM/LWSAXXFO0O9RAxfmz9yvb40eAz/y
   DQNhY5YYSPJSREfjTLmGIehhbhJrmlWSv5ya9/G9gAgYvdobSpZiA7M58
   w==;
X-CSE-ConnectionGUID: obd/8yhkSW6HL8I2TfP1uQ==
X-CSE-MsgGUID: 7vJp5JQmSySjSixI7+6wUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79450345"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79450345"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 19:25:54 -0700
X-CSE-ConnectionGUID: 9AoU7ta2SUmeOKDTb23mYw==
X-CSE-MsgGUID: gWOn+rCHTFSDnsX02upwfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="267687783"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 May 2026 19:25:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMGL8-000000007rl-2kGZ;
	Mon, 11 May 2026 02:25:50 +0000
Date: Mon, 11 May 2026 04:24:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb:
 pinctrl@802c0000 (renesas,r9a09g077-pinctrl):
 xspi0-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500,
 5000, 9000, 11800]
Message-ID: <202605110457.UQqbe1kz-lkp@intel.com>
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
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-r9a09g077-Add-xSPI-nodes/20260510-012430
head:   671bd851db7bcd62669c0da58386b0478b4243ea
commit: 671bd851db7bcd62669c0da58386b0478b4243ea arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
date:   33 hours ago
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-2055-20260510 (https://download.01.org/0day-ci/archive/20260511/202605110457.UQqbe1kz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110457.UQqbe1kz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605110457.UQqbe1kz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g077-xspi', 'renesas,r9a09g047-xspi'] is too long
   	'renesas,r9a09g047-xspi' was expected
   	'renesas,r9a09g077-xspi' is not one of ['renesas,r9a09g056-xspi', 'renesas,r9a09g057-xspi']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): reset-names: ['hresetn'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: spi@801c1000 (renesas,r9a09g077-xspi): resets: [[3, 5]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): xspi0-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): xspi0-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): xspi0-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): xspi1-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): xspi1-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
--
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g087-xspi', 'renesas,r9a09g047-xspi'] is too long
   	'renesas,r9a09g047-xspi' was expected
   	'renesas,r9a09g087-xspi' is not one of ['renesas,r9a09g056-xspi', 'renesas,r9a09g057-xspi']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): reset-names: ['hresetn'] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: spi@801c1000 (renesas,r9a09g087-xspi): resets: [[3, 5]] is too short
   	from schema $id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): xspi0-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): xspi0-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): xspi0-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): xspi1-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): xspi1-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
