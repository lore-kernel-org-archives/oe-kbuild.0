Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539971C4A0A
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Sep 2025 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759051148; cv=none; b=SqVl5eivflpCBGe9bBThrpFVxj8vWtroRte64utz02QJ0ZMIf3UvXD8E7iYoY1Ee4TUvTJJ1r7yXLNf0GmLrK+kwVtZxNwN4k10zjAo5vcdou8DH+IH0dR8NLd6GoLzGW6LnHVZ7kdBWNPFng5p1F1LFU47kRLOgV4RUcizcBss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759051148; c=relaxed/simple;
	bh=TlFLm5uZR02376xIhujnIKwMU0D2hUk4YRefNMJHU6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ln/YtiDZCXklLkPBU38HSIxs8uueMj8tvgFF+S4OtQ/JBQQR0xu7Ls23ekZ/4gQgqWldFXHbijFjcHr1LKP1zmPc0EOQ2yuW0LoiGup7f/tRt6V7dbKy2cOyWaocL4bgaUNnheCgrqhy8o/j8rZeG2KiwNH7Tuu3GVkop2EKCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITb+HJPh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITb+HJPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759051146; x=1790587146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TlFLm5uZR02376xIhujnIKwMU0D2hUk4YRefNMJHU6k=;
  b=ITb+HJPhzVfBtAjgo9fk9yKdM4SyqMtHeKj7p3x2iwUG3bBCqjoHrBLj
   jdfFd9kLY3t/ju8/oWvWRxRG7W5C+bihKP0bZ/bzzpSfkKySMRjkOQ5yc
   D8qoG+md6HdlEGiiHGQRb2FwkNR9eqGNx+4xV+uTLK+IVAj7lPBVBI5H3
   47+KjTLqPVYFzMcm4xUuqOA9BhBD+Audn8gnx5t8l90sBgwvKiD9s6To9
   wxWz5fWrrav6LkzPH2togkFTy51DsUhSFkd7D0wPyuqlcq6+kSWW5P/zp
   ue2dXmRy1wSYGzJqmgG/bIxGHxWA8PaV0zrH7EArMkKTBYRV64pbes00J
   g==;
X-CSE-ConnectionGUID: qf82bRgRRxGSspQhgHTUXA==
X-CSE-MsgGUID: 3k92mtsVQ6+rSIGJtgda/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="72756233"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="72756233"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 02:19:05 -0700
X-CSE-ConnectionGUID: 436UftLKTXi9kPOrp59XPw==
X-CSE-MsgGUID: os55Ow0iR/KRvQlDl1ixeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="183155835"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 28 Sep 2025 02:19:03 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2nYb-000000005dF-1rCM;
	Sun, 28 Sep 2025 09:19:01 +0000
Date: Sun, 28 Sep 2025 11:18:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 38/140]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb:
 /soc/spi@39b10c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202509281110.m6ANuJDs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 878e0f5afc82e68693df9f28e0d1783083a4bde0 [38/140] arm64: dts: apple: j31[46]: Add keyboard nodes
:::::: branch date: 7 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250928/202509281110.m6ANuJDs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509281110.m6ANuJDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509281110.m6ANuJDs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[142, 0], [143, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
