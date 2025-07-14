Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4101E487
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 05:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752470232; cv=none; b=HWgMvr5D4etM1uZtXyW/vcW4sWuZAQzxnyxNBIPrSvKiLbcYE1cxrFYIy7j0dSxmkhmUSNhO0js7hkDfPoaISngQmQj4xk2zq7RBkviwmeSrZ/lP2kghaeQQwaU6UtQLeAiO/8KhLUWuO/HvhWEVisjqSh9QHXgQlT7jgL+9QCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752470232; c=relaxed/simple;
	bh=9K9USRMurtlinpUKejy4nfM3poxKvwxtaM58WaCFQk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aXYyJBfagh7op/jYEfN1TqelJZM/m0EXIawwGayz1C+6uPvgbT03I3MjUJ61MF5mLr959KNAxcxXAEqwcruUcaOQ/csB6bOC5uwzg7G98VYDqoascOI8lyfS/Q9RPokyXMabxzePnlKSRcvz/35Y46ehUQ4sJU/VezKR4ymiYZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAJ51znw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAJ51znw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752470230; x=1784006230;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9K9USRMurtlinpUKejy4nfM3poxKvwxtaM58WaCFQk8=;
  b=CAJ51znwy1zmqAVloRBZFHs1UKqMAkdqReVxH2FqUAOGwiuoNjHNy60r
   YD+J9GPpYblsY2CxYVUksqmxcaw8+kzL6n45LbIprr4yW+SqVJ2VFFhQE
   PyeBXvXR78KN9AnaZkqPZ5XDbre4+iSMztV6iQ/+cHcXRfhkzPulrcYkK
   aww8Ls4NHcDuVZCuItGniCtDdKNf2HEt9HCuUk0f31psTbnz87nmfW5kT
   OuJKMF3JZAP9w8hrVK8gVBV4vfWMYuC992b1T8ku06mTfipleaNhjp7eJ
   EdfoDO7OZl5aaDthRgrr+gYwmoe1AEQxV9SCq977cTIHNlA5qcgyYJ/t7
   g==;
X-CSE-ConnectionGUID: gx7F5P70TSSaO8Y7IDMuEw==
X-CSE-MsgGUID: EazXc0v1TY2ksOLgbHcZsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66100516"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="66100516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 22:17:09 -0700
X-CSE-ConnectionGUID: vvaxKHHITTy+MBQp6idqhg==
X-CSE-MsgGUID: 8ARUmnOtQt+R08qRgUsarQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="180525556"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2025 22:17:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubBYm-0008V1-0q;
	Mon, 14 Jul 2025 05:17:04 +0000
Date: Mon, 14 Jul 2025 13:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v16 1/5] dt-bindings: mmc: sdhci-pxa: restrict pinctrl to
 pxav1
Message-ID: <202507141143.vha0FsU1-lkp@intel.com>
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
In-Reply-To: <20250708-pxa1908-lkml-v16-1-b4392c484180@dujemihanovic.xyz>
References: <20250708-pxa1908-lkml-v16-1-b4392c484180@dujemihanovic.xyz>
TO: "Duje Mihanović" <duje@dujemihanovic.xyz>

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7b8f8e20813f0179d8ef519541a3527e7661d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi/dt-bindings-mmc-sdhci-pxa-restrict-pinctrl-to-pxav1/20250709-011510
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250708-pxa1908-lkml-v16-1-b4392c484180%40dujemihanovic.xyz
patch subject: [PATCH v16 1/5] dt-bindings: mmc: sdhci-pxa: restrict pinctrl to pxav1
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-053-20250709 (https://download.01.org/0day-ci/archive/20250714/202507141143.vha0FsU1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507141143.vha0FsU1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507141143.vha0FsU1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'no-1-8-v', 'non-removable', 'vmmc', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long
--
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'no-1-8-v', 'non-removable', 'vmmc', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long
--
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'no-1-8-v', 'non-removable', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long
--
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'no-1-8-v', 'non-removable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long
--
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'no-1-8-v', 'vmmc-supply', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long
--
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'no-1-8-v', 'vmmc-supply', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long
--
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'no-1-8-v', 'vmmc-supply', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long
--
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-388-gp.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'no-1-8-v', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long
--
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-388-helios4.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'no-1-8-v', 'vmmc', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long
--
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/xor@60900: failed to match any schema with compatible: ['marvell,armada-380-xor', 'marvell,orion-xor']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/sata@a8000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/bm@c8000: failed to match any schema with compatible: ['marvell,armada-380-neta-bm']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/sata@e0000: failed to match any schema with compatible: ['marvell,armada-380-ahci']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/clock@e4250: failed to match any schema with compatible: ['marvell,armada-380-corediv-clock']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/thermal@e8078: failed to match any schema with compatible: ['marvell,armada380-thermal']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: sdhci@d8000 (marvell,armada-380-sdhci): $nodename:0: 'sdhci@d8000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: sdhci@d8000 (marvell,armada-380-sdhci): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
>> arch/arm/boot/dts/marvell/armada-388-rd.dtb: sdhci@d8000 (marvell,armada-380-sdhci): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'no-1-8-v', 'wp-inverted' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/audio-controller@e8000: failed to match any schema with compatible: ['marvell,armada-380-audio']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: usb3@f0000 (marvell,armada-380-xhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-380-xhci'] is too short
   	'generic-xhci' was expected
   	'marvell,armada-380-xhci' is not one of ['brcm,bcm2711-xhci']
   	'marvell,armada-380-xhci' is not one of ['brcm,xhci-brcm-v2', 'brcm,bcm7445-xhci']
   	'xhci-platform' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: usb3@f0000 (marvell,armada-380-xhci): reg: [[983040, 16384], [999424, 16384]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
