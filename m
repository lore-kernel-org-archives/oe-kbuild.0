Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D763370D54
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245319; cv=none; b=pqKB3T8bLi0nOedkcaLTFwt/d6eV/VlbnI8X4uHnsVQF37Sz7jkGFfMnVkwzE3Q73KzxUqJkJ+i4u0uZq5B9ajExy85toWZR9chqmS6h0LFgGM/zVxN7aG2TbL7Dl+6MO3lpdJuvDMIWS0z5YC7Cr4LJ+ef5H7vYYU0Ee3+My/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245319; c=relaxed/simple;
	bh=NrxvEzSjRszCKEoDQrTBRbGCC8d8uApiY8fabjA+zNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E9yZGke/06U9NCWODOYtYliFnPh/5UY0An5tcuvuNLBk+uZ4MY2s5MgZ7576gD3SKUgAmxZ+bpzMP8FxKYO240eK+Y9Dz3gHr6Pjir8r2B8VhC6CcTsvE2Hyo7EoDScNK6zqnFC4Ru0tEh5EdDyQx4r2SyOFbZ0Zl92LdSEC3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jo6NOq5+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jo6NOq5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778245319; x=1809781319;
  h=date:from:to:cc:subject:message-id;
  bh=NrxvEzSjRszCKEoDQrTBRbGCC8d8uApiY8fabjA+zNo=;
  b=Jo6NOq5+nlFETeodN10uC5W0qV9cUTqyICFwLTIr+hv9KcfXTA7pgSKd
   8LpXTPZI0ITTB8tPjIi3ePO3OQ81UWYkaDg1m7+fYgV5WqUXZI0aFQkkw
   ps+DCcvLXvFL4lfR9JFit05Z2Uqaz3XwKotAG7mO8n9UITklGlx71p5ff
   GRX1aghGgFwUk5S5444N0iFo03EhlZMHtAkxBx6K3633KqN/xkGkcAGvp
   a+qnHcMGIS8RJS/UNFVerm88t7GLHwP8EYiaojSfkWH01Ei/x5UxmF5Rs
   3XMiytQnZZeQec2XPvBx3I/viPpkQxfYzuvO0d3u+w/2aY814sKBVWAOp
   g==;
X-CSE-ConnectionGUID: 6Xu2P6C1SpO15lBIhp4FoQ==
X-CSE-MsgGUID: mLty6w2iQwCfvH5NtHrtiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="101884432"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="101884432"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 06:01:57 -0700
X-CSE-ConnectionGUID: UEorkleKTA2B3PCcTzYQTQ==
X-CSE-MsgGUID: xOVSeoX6S1W+B6Ax1ToG4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="237005083"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2026 06:01:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLKq1-000000007Ad-0IQ5;
	Fri, 08 May 2026 13:01:53 +0000
Date: Fri, 08 May 2026 15:01:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: serial@602b0000
 (arm,sbsa-uart): Unevaluated properties are not allowed ('reg-io-width' was
 unexpected)
Message-ID: <202605081453.KFG1fnIE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Thierry Reding <treding@nvidia.com>
CC: Andre Przywara <andre.przywara@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   917719c412c48687d4a176965d1fa35320ec457c
commit: 7282b8add2988b93f35a155d927d08e14558c7b8 dt-bindings: serial: Convert arm,sbsa-uart to DT schema
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260508/202605081453.KFG1fnIE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081453.KFG1fnIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7282b8add298 ("dt-bindings: serial: Convert arm,sbsa-uart to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605081453.KFG1fnIE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-1: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-2: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /ethernet-3: failed to match any schema with compatible: ['hisilicon,hns-nic-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@60080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@a0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@8,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@400,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@408,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@c0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: serial@602b0000 (arm,sbsa-uart): Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/arm,sbsa-uart.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7030000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7020000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa_cpld@78000010 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sds_ctrl@c2200000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/mdio@603c0000: failed to match any schema with compatible: ['hisilicon,hns-mdio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
