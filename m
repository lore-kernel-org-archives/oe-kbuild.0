Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9B1F0E2B
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262659; cv=none; b=dppOXb5US2HicXQwDxdtsRQelyQTQgxLppR0n6Ks2U62mbwHtvganNnQpMJ2d4LLkWzGgNEizUiRE0Hex70Wc98nScXrDL/FLQfJSM5+fty8ti/8qeaK6eW4K/r1u4SRoqumkqVRi+GfKjDp6kDqL6jLzDqmc4QReE4li7itmH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262659; c=relaxed/simple;
	bh=B7c9Ay7U6i+WMnSwJUVaySSla3lR4RSyHDRxAluw8rk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/YmR059uf2VEAZ/qIXXrAaUwDsHF5/reHu5fjJP/qo+YwMmTwUcmIWACjHm3bC1Pf51a84VMTSSzNw9MM9bXNvATLgjjlm6uxMSKYueWTh01P4pAp48k9mk7nGFD1oVbRyYHM5pRKzwPzEB+TXNiJu8lLw54XVoBihzxRFg0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUivcDwl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUivcDwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736262655; x=1767798655;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=B7c9Ay7U6i+WMnSwJUVaySSla3lR4RSyHDRxAluw8rk=;
  b=QUivcDwlmom0od839aSHqCJX5Gtfz9tcKJP04xd7u+WeWo6EQE2/FYTs
   YNVrzcDstMdPXrpaaOzQMSAQ0NGSNhNAhw+gF+Hfa+0r2PZVvlljMqIJs
   fRoEggVvOBDBxS4hxTtstzqPZg9yqPviPFakq8EoVr2O9OmuInpsP9UQa
   Fm4a05Kjxu/gwLEciWSX5ZSe09ms95g+/R3Hi6pjW+MhrPr5AeEuPCUwp
   aFG9rF3DZ9iqpTJTeYtspTJgswK8i0eqmbAjzZknZWfEL+g8hnxcUkZGu
   matu9c9WtFkVdX8MVKt90iPYcY2ygpJiMYz6gQV4/qU/EAWU/LD8DKeMS
   Q==;
X-CSE-ConnectionGUID: PFtelOuIQViVL4ibc2gf2A==
X-CSE-MsgGUID: dDzxwjN6SjGX8U5xTvALrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47867615"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="47867615"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 07:10:52 -0800
X-CSE-ConnectionGUID: vfcw4a/FQvqSvWOggtfGrg==
X-CSE-MsgGUID: 1ueFfpQQS5Gq95/2bIKpPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103644294"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 07:10:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVBEH-000Es7-0V;
	Tue, 07 Jan 2025 15:10:49 +0000
Date: Tue, 7 Jan 2025 23:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 28/191]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b048000/codec@4b:
 failed to match any schema with compatible: ['cirrus,cs42l84']
Message-ID: <202501072355.4b1K5hB2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   3579121c157a4c56e00b67dbb6eb45d963046590
commit: 1dd6eacb938db7f46e9c03ab89282456bd4a40a4 [28/191] arm64: dts: apple: t600x-jxxx: Put in audio nodes
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250107/202501072355.4b1K5hB2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501072355.4b1K5hB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501072355.4b1K5hB2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b044000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/i2c@39b04c000/codec@3d: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
--
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: network@0,1: $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000: iommus: [[147, 0], [148, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
--
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/i2c@39b044000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/i2c@39b048000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: network@0,1: $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000: iommus: [[166, 0], [167, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
