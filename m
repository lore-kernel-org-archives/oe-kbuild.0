Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1785A29BD83
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759142656; cv=none; b=MEw3BTyhbe7qLsQAFCqNfGhgf/Fo1dCx6jn/4e3UvLQIalsxexy20rIjTRz/XTqfinF3jcb0y9ZGk4EoU6o2Z7lP4ME3qMykOyhUdXWVZK1w3j6LWh5lw+21cHl7P4OhQYERTG3uMppC/1JScTxg1KsOyAfl9iHoJvzc0TbyFng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759142656; c=relaxed/simple;
	bh=XiaLMQaNbUrGy5Z2t9uxLhPNJvUpVShkxrj6LYodXnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T1Ktm3AzyhmiRhxPYV0NfF4SR/iJajdkLuBYBFsqtSS1wW/gcJj1Kh8uATorYKjRpB/0ULHMHrDfdY5PUnwfMFHYrAJ7oqXzquC/7iV4BG1gV1/F4HuO60dVxVWx9mL76oU62C6T44U0hM5WwoTsH1dpdDs4miR1xua97dCAWR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXmbD/59; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXmbD/59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759142654; x=1790678654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XiaLMQaNbUrGy5Z2t9uxLhPNJvUpVShkxrj6LYodXnQ=;
  b=HXmbD/59/UxJRoqtlD9LANZVxqRpBNN6f+Q40JMLjXhkuov/Kex/SJxh
   dHU8yjxAv8YeIr+6D9JPvJX//hxxKraVXwz6XQoYWr2mwQELHuSkgNG7Z
   iWyYgxe90r7HQjG2JT22T+q+8TIvNSnvGImavP+XmZSspOD3FLncW5q+V
   ekDosnoRgl05VB4wAiZaTh+JrwXnDT2cPV/SGRwoNAi1VhLvZu7r8IwUd
   HhGV32tczrDKqmb6NMeLKK5ygzOFP8detFZ1xaCa9X25p2uDBiaEZaGJ8
   GzmFgIuKi4VwU2XZplC3rxVLI88uVsgwU8Yz5xqxcXqd2PaPcXXDslrY0
   w==;
X-CSE-ConnectionGUID: 0EdifYrdSLWKRBF6atATvQ==
X-CSE-MsgGUID: xin6xIKKRWaKEjY7Z0Md+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="79027213"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="79027213"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 03:44:13 -0700
X-CSE-ConnectionGUID: zuTkf0kIQdS+Cat/2Lkybw==
X-CSE-MsgGUID: ITTbkCtzTwmsqTgT1KsfmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="201875689"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 29 Sep 2025 03:44:11 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3BMX-000000005pd-29Wm;
	Mon, 29 Sep 2025 10:44:09 +0000
Date: Mon, 29 Sep 2025 12:43:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 38/140]
 arch/arm64/boot/dts/apple/t6001-j314c.dtb:
 /soc/spi@39b10c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202509291211.wjbTW11q-lkp@intel.com>
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
:::::: branch date: 8 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250929/202509291211.wjbTW11q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291211.wjbTW11q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509291211.wjbTW11q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[156, 0], [157, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[142, 0], [143, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
--
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: pmic@f (apple,maverick-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: nvmem-layout (fixed-layout): 'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[156, 0], [157, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
