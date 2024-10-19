Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E446450
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 01:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729300116; cv=none; b=ufLRopn7ROvCbpjyzU0IejbIFqMWqW62eRDrjtiFYvYHYxJYv+O/4/pp9W/QJuS1rN5HbQFatB8hvdQfCBXCnPNtF+t3nvCltW7CuiQzCEW6xm+Lt/ubEUVvPjdfBvW0wU3rbKStswNcO7qIyt4akwfe8hw1BqVPCfc/uwjHV2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729300116; c=relaxed/simple;
	bh=q1bi60KEudHGLP6ddKH16omPF8rA1CWTnhmYDLhLxtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kYiorlX4Q/ldrD/aQyHs50MloUNAs4D2oquATF8rBmHdG4OmusSPf2mshQMx96bHsH6j39UZUiO8zGOgmGt0XRDZS1Ge5cmi1BsDwx0k5JNMoY8+XmUHtgwce1PeecLoPOwRqlnVgp88RADvIOVKL+0ymNCg5URipyPt8kCLoBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlOnsx+p; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlOnsx+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729300114; x=1760836114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1bi60KEudHGLP6ddKH16omPF8rA1CWTnhmYDLhLxtM=;
  b=BlOnsx+pBNAZwQw6UqX2w10tVrEXgljHbO1kdCQlB6UImM2dc2udWgSo
   G1Xyppl5+WjvwLR5SaXIZEIMGwy5Yh9V2R8YI/u3Gh2weIeLscU6D5LzZ
   CuN+goc+arLJWqOAPpYsJLHf7T3hFbi0j5uNNC20fcJuN1NRKt1+ECyXo
   1y5q5BAUpe1O5Rv0olZGTt8ZgXH/JlFWHBfMzsZ3tgJ2C1OXiiYbNX9/P
   PTA6dM2Nvqqlj5CzK+2Gv0Di37wV5fYOIENbbCpXhHTwJcgkzbtOXew3n
   IosFUUVj2On/Sa628AZpJjPoE5GW7Fg4j3E4I6JxOQZHpnobVm8RAlGSL
   w==;
X-CSE-ConnectionGUID: fQIta+amR82Dm5r39cGouA==
X-CSE-MsgGUID: +4NJ8eSQTIi/eGMR+700Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="32645648"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="32645648"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 18:08:31 -0700
X-CSE-ConnectionGUID: vXd5CB6LT8S5Ep+YTDChqQ==
X-CSE-MsgGUID: JdVun/oXQG+uwISFvMfE1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="79077968"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Oct 2024 18:08:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1xwx-000OVT-38;
	Sat, 19 Oct 2024 01:08:11 +0000
Date: Sat, 19 Oct 2024 09:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/cu1830-neo.dtb: mac-phy-ctrl@e8:
 compatible: ['syscon'] is too short
Message-ID: <202410190801.QfICld6G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dbafeddb9524bd459592f92432b90dd7c0b79568
commit: f97b0435c8572b16305d68cfc14ddc901878a9e7 dt-bindings: mfd: syscon: Split and enforce documenting MFD children
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-052-20241019 (https://download.01.org/0day-ci/archive/20241019/202410190801.QfICld6G-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190801.QfICld6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410190801.QfICld6G-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000: mac-phy-ctrl@e8: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000: mac-phy-ctrl@e8: 'mode-reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000: mac-phy-ctrl@e8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: usb-phy@3c: 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/ingenic,phy-usb.yaml#
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: mac-phy-ctrl@e8: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@12000000: compatible:0: 'ingenic,x1830-ost' is not one of ['ingenic,x1000-ost', 'ingenic,x2000-ost']
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,sysost.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@12000000: compatible: ['ingenic,x1830-ost', 'ingenic,x1000-ost'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/ingenic,sysost.yaml#
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /timer@12000000: failed to match any schema with compatible: ['ingenic,x1830-ost', 'ingenic,x1000-ost']
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: timer@10002000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-tcu', 'ingenic,x1000-tcu', 'simple-mfd'] is too long
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4740-tcu', 'ingenic,jz4725b-tcu', 'ingenic,jz4760-tcu', 'ingenic,x1000-tcu']
   	'ingenic,x1830-tcu' is not one of ['ingenic,jz4780-tcu', 'ingenic,jz4770-tcu', 'ingenic,jz4760b-tcu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
