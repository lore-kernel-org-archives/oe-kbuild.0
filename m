Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF5441A81
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720101979; cv=none; b=HzA1Yit5yBWMHzBeuGZTneT+hNA16Sop01EVrpHd10yJAoMe4wOXiAzwJW4DpcL0rol0G7TlhR6hAWuRwFrgCvQIK1rzuMOpwko305bhWyaj5wydlfGkzh0bI59RkpgPrwtCHBC5/wL+kdlaIHtpeTso5qPz8b/Qg6E5DkmgmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720101979; c=relaxed/simple;
	bh=vkjrA6Lv2boj5WbRicmwVKYXpES23S+7VFxJCv/tZnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYxOA46OWYXPj59c+QK0chYBdJG30YMnv365vsoPu3PL3rQOeK5gZnCR+3M43RAjdeKeqXLlCSR6th9dLbFiZGnbWb0Okr/Ld9VtVAUo8XnolgjrCKNLp2gRMO19ZCDREWx3tua8OlvUqHz8eZKK50kLIYkMWKoUtLGp9bZ/SmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoNw0VfX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoNw0VfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720101977; x=1751637977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkjrA6Lv2boj5WbRicmwVKYXpES23S+7VFxJCv/tZnY=;
  b=JoNw0VfXCnqt77YRdJ5WretLmHvdNR26y7+aysOW6QtAfgNEIlbivBbn
   C/w9u0BwOJFz8KhSMva7JtNVpuUtjQvFLVdVNUF9uht5vZipc/DIQz/Rs
   n+L6vAPNlbS0GMO3H6KwjWF8nq6EE6SD7IdH0/KLqWvtUnviCFeKymK1S
   fvInD3y1yubThAwNUOvNm2hvHYrNO/rxYfJoSYjn1NILmNXt5Llkw3Gyb
   UiInFBv1ZQteCZn+9oaHg+xWMmSJb9kLzYwxqh/Kpa23I3jMm5Gskz96b
   gESzli8Zkf8AW0PTv2HOh7mlKbhr5iLrfXGaGsp1bi6UtSDtK2yO4qndp
   Q==;
X-CSE-ConnectionGUID: Z7cGK6/XTdSY2csoQp6Crw==
X-CSE-MsgGUID: AXjNja5/REaxVsQ466/IPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="27999723"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="27999723"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 07:06:17 -0700
X-CSE-ConnectionGUID: yIK8+FLJTNO41amOXkbrmg==
X-CSE-MsgGUID: K7koY8DWTpG7lxP4PHftKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51470864"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jul 2024 07:06:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPN6D-000R4I-14;
	Thu, 04 Jul 2024 14:06:13 +0000
Date: Thu, 4 Jul 2024 22:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 2/8] arm64: dts: imx8qm: add lvds subsystem
Message-ID: <202407042157.njTc6T21-lkp@intel.com>
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
In-Reply-To: <20240701-imx8qm-dts-usb-v4-2-03cdbc8c44b6@nxp.com>
References: <20240701-imx8qm-dts-usb-v4-2-03cdbc8c44b6@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-imx8-add-basic-lvds0-and-lvds1-subsystem/20240702-000741
base:   9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd
patch link:    https://lore.kernel.org/r/20240701-imx8qm-dts-usb-v4-2-03cdbc8c44b6%40nxp.com
patch subject: [PATCH v4 2/8] arm64: dts: imx8qm: add lvds subsystem
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240704/202407042157.njTc6T21-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407042157.njTc6T21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407042157.njTc6T21-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: interrupt-controller@57240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: interrupt-controller@57240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@57240000/interrupt-controller@57240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: interrupt-controller@57240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: interrupt-controller@57240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@57240000/interrupt-controller@57240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: interrupt-controller@57240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: interrupt-controller@57240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@57240000/interrupt-controller@57240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: interrupt-controller@57240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: interrupt-controller@57240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@57240000/interrupt-controller@57240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: interrupt-controller@57240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: interrupt-controller@57240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@57240000/interrupt-controller@57240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: interrupt-controller@57240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: interrupt-controller@57240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@57240000/interrupt-controller@57240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@57240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@57240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@57240000/interrupt-controller@57240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
