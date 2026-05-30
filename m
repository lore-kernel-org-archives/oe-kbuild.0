Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5B29B799
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 18:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780164656; cv=none; b=HtIIEof5MfzwMBzfp78/+wefJLj5JlmqjwrJF/5CNC8OKU71I+L2X6bYDy2XghTB0iviNzaGwBY151DKFf6kSXZ1USzzo0BZyiBAewbQvjT0Xp6asqL1eg9dVqME7dlbbSBd/Io/pB7s+3CSMuGrnd0sdbE1elyxqiq8XLlJFrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780164656; c=relaxed/simple;
	bh=uJjOsPWdZ7lM/eJrmyQ3McJTb9rpBOpKApqK4iXS1JY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yds3XUgHSQpkNvrHbdcRI1JJvaMqUi4B7Pmmrh11UCyZUQzOxzGC6R81hM9U7M0o9CmsEcv0RetJ/FXgvwW5iuv/CfjKV6Z5vOuj8lhI4kZcL8Cb+6CrFSFDRPHRn/d6ZTnHk7SNmDjHh8ZBMtUtg10cEc6O2DVjnjcQGGAmclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEzf80oc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEzf80oc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780164654; x=1811700654;
  h=date:from:to:cc:subject:message-id;
  bh=uJjOsPWdZ7lM/eJrmyQ3McJTb9rpBOpKApqK4iXS1JY=;
  b=DEzf80ocF7OV6dYA1D+SWjCrHIsR/8l2p7u/qpuNWqnrV++NIUgsB3j/
   jigB63G/TypATlTZ9VHMQm/KR5BNSXkaWm0tV7UzxQ8Nu2lHu5ZBSO2KN
   KqkzJoP2iMNaJ3II/1h5fVy3LUyB+YBnfokgNjPnmYVLSc9KLdam1GPi6
   DRjQ+yr81swl2q+zbJuRXJmQbBbgKPzJ5ijtpzH4IXCqGVQhLEwa8cXBT
   LcZvULkxJmo2ofppZBYjO2tN349rHnqnxefysfCdKJ70h6ofCFrryaKAS
   ICGIBUDXze0C9iXEPSS0uaFHtd0kHpFs+72AWWPz41vEgBOWcQl2IfZ6v
   A==;
X-CSE-ConnectionGUID: xRhEc2WpS9CFGpbFwAJM7g==
X-CSE-MsgGUID: x8LiPwsbRZ2OaDmmmYMQvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="80125362"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="80125362"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 11:10:54 -0700
X-CSE-ConnectionGUID: NeROWfePQQSZIX+t6652dQ==
X-CSE-MsgGUID: s8WsF5h2TZGPT3LtOuDT/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="243007566"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2026 11:10:53 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTO94-000000001CL-0xAA;
	Sat, 30 May 2026 18:10:50 +0000
Date: Sat, 30 May 2026 20:10:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:dt-for-next 32/34]
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a000
 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605302009.WiEprWQn-lkp@intel.com>
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
CC: Yixun Lan <dlan@gentoo.org>
TO: Yixun Lan <dlan@kernel.org>

tree:   https://github.com/spacemit-com/linux dt-for-next
head:   3ea695eb111fc5a7ffddd21d5c3fee6d82560413
commit: cfe5c91cb73c87f9021e446ec9d323c483851c46 [32/34] riscv: dts: spacemit: k3: Initial support for CoM260-IFX board
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-2051-20260530 (https://download.01.org/0day-ci/archive/20260530/202605302009.WiEprWQn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605302009.WiEprWQn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605302009.WiEprWQn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/phy@c0a20000: failed to match any schema with compatible: ['spacemit,k3-usb2-phy']
   arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/dma-controller@d4000000: failed to match any schema with compatible: ['spacemit,k3-pdma']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a000 (spacemit,k3-pwm): clocks: [[21, 22], [21, 42]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d401a000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a400 (spacemit,k3-pwm): clocks: [[21, 23], [21, 43]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d401a400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a800 (spacemit,k3-pwm): clocks: [[21, 24], [21, 44]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401a800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d401a800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401ac00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401ac00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401ac00 (spacemit,k3-pwm): clocks: [[21, 25], [21, 45]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401ac00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d401ac00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b000 (spacemit,k3-pwm): clocks: [[21, 26], [21, 46]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d401b000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b400 (spacemit,k3-pwm): clocks: [[21, 27], [21, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d401b400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b800 (spacemit,k3-pwm): clocks: [[21, 28], [21, 48]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401b800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d401b800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401bc00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401bc00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401bc00 (spacemit,k3-pwm): clocks: [[21, 29], [21, 49]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d401bc00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d401bc00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020000 (spacemit,k3-pwm): clocks: [[21, 30], [21, 50]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4020000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020400 (spacemit,k3-pwm): clocks: [[21, 31], [21, 51]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4020400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020800 (spacemit,k3-pwm): clocks: [[21, 32], [21, 52]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4020800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020c00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020c00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020c00 (spacemit,k3-pwm): clocks: [[21, 33], [21, 53]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4020c00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4020c00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021000 (spacemit,k3-pwm): clocks: [[21, 34], [21, 54]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4021000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021400 (spacemit,k3-pwm): clocks: [[21, 35], [21, 55]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4021400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021800 (spacemit,k3-pwm): clocks: [[21, 36], [21, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4021800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021c00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021c00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021c00 (spacemit,k3-pwm): clocks: [[21, 37], [21, 57]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4021c00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4021c00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022000 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022000 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022000 (spacemit,k3-pwm): clocks: [[21, 38], [21, 58]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022000 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4022000: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022400 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022400 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022400 (spacemit,k3-pwm): clocks: [[21, 39], [21, 59]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022400 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4022400: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022800 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022800 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022800 (spacemit,k3-pwm): clocks: [[21, 40], [21, 60]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022800 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4022800: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022c00 (spacemit,k3-pwm): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022c00 (spacemit,k3-pwm): #pwm-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022c00 (spacemit,k3-pwm): clocks: [[21, 41], [21, 61]] is too long
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: pwm@d4022c00 (spacemit,k3-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spacemit,k3-pwm', 'marvell,pxa910-pwm'] is too long
   	'spacemit,k3-pwm' is not one of ['marvell,pxa250-pwm', 'marvell,pxa270-pwm', 'marvell,pxa168-pwm', 'marvell,pxa910-pwm']
   	'spacemit,k1-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/marvell,pxa-pwm.yaml
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/pwm@d4022c00: failed to match any schema with compatible: ['spacemit,k3-pwm', 'marvell,pxa910-pwm']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
