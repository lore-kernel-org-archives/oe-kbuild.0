Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3017BA0
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112328; cv=none; b=CbARPkLcHh6ooAKYLHmb0ITgvTHYupkwyVM2Tk6X+3r8ydhtFidrmWbBRVA/+lOupgxodEn4nXRmB6gcsXrnDM+txfuwEmvsAYgsNbqoovYltOObbUJ12uZw8R013BvQ8PChGcFWNzBHLW5z10aZyF+wiDzlldyRt8DuQhghr8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112328; c=relaxed/simple;
	bh=DAHFstY6qBjuE5c9Nyo60flMi9eIMFi0dFKTr112sRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NEL5tcfVmy8leBBKoEqsqyZBIT47uNQV+pehueqjREjgt+UdVkIvvVUT8lHlX4AIEjIVyzq4VirZeCOIBwIP3I4OwV5FsArER1Z97hwHzRVl8lKHu+1jdj+8Ll/SaroTghAq34HVDxxzD4bVDCLAcFRyuBSm05bvitIAav45Pzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkHswwgf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkHswwgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720112326; x=1751648326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DAHFstY6qBjuE5c9Nyo60flMi9eIMFi0dFKTr112sRI=;
  b=UkHswwgfQygKnjRjujvb+sGL2RLw52b/hbbJTmb77rFiprcKToNKefbH
   HjMCj8tDtD85eHERHC3Uno6qXd9w7F59wBvPwyohfIXE2Etdt3HoWlii5
   0mKeLyzifuyDKfkcNBGNllyuu/aXsX/8lHZfpEX09nWIqhoDC4sCnMApd
   By7IFgfq8b7LC1KTXgCVZqFFUExhaHjp28vNlRSBt9QuyponpgAubFfss
   R34U5RwgsnSlgoBxAdUyQ4FIu244JRGNomb25FRv5mNjvHVMZGVmmYOdX
   rMS5sIm2Qisce5pV27qmxJrZupZrTlIp1UoL90GbG8jgcV7htJ5FtVcPt
   w==;
X-CSE-ConnectionGUID: M8xjWbX5SgWgA2ipS3ujjA==
X-CSE-MsgGUID: UmoC4HWoSTu2AVKBc3OALQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17222621"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17222621"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 09:58:46 -0700
X-CSE-ConnectionGUID: qr0Cj1etQwiAgnGF/uJS/g==
X-CSE-MsgGUID: pZ6OVlVzQgeJp63uQ2EApA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51247627"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jul 2024 09:58:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPPn7-000RE0-2R;
	Thu, 04 Jul 2024 16:58:41 +0000
Date: Fri, 5 Jul 2024 00:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 4/8] arm64: dts: imx8qm: add mipi subsystem
Message-ID: <202407050013.5NdEpQed-lkp@intel.com>
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
In-Reply-To: <20240701-imx8qm-dts-usb-v4-4-03cdbc8c44b6@nxp.com>
References: <20240701-imx8qm-dts-usb-v4-4-03cdbc8c44b6@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-imx8-add-basic-lvds0-and-lvds1-subsystem/20240702-000741
base:   9db27bc55bd8363570c5a259ff4dc77bd6a0b2cd
patch link:    https://lore.kernel.org/r/20240701-imx8qm-dts-usb-v4-4-03cdbc8c44b6%40nxp.com
patch subject: [PATCH v4 4/8] arm64: dts: imx8qm: add mipi subsystem
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240705/202407050013.5NdEpQed-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050013.5NdEpQed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407050013.5NdEpQed-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: interrupt-controller@56220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: interrupt-controller@56220000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@56220000/interrupt-controller@56220000: failed to match any schema with compatible: ['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: interrupt-controller@57220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: interrupt-controller@56220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: interrupt-controller@56220000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@56220000/interrupt-controller@56220000: failed to match any schema with compatible: ['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: interrupt-controller@57220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: interrupt-controller@56220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: interrupt-controller@56220000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@56220000/interrupt-controller@56220000: failed to match any schema with compatible: ['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: interrupt-controller@57220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: interrupt-controller@56220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: interrupt-controller@56220000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@56220000/interrupt-controller@56220000: failed to match any schema with compatible: ['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: interrupt-controller@57220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: interrupt-controller@56220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: interrupt-controller@56220000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@56220000/interrupt-controller@56220000: failed to match any schema with compatible: ['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: interrupt-controller@57220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: interrupt-controller@56220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: interrupt-controller@56220000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@56220000/interrupt-controller@56220000: failed to match any schema with compatible: ['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: interrupt-controller@57220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
--
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56220000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@56220000/interrupt-controller@56220000: failed to match any schema with compatible: ['fsl,imx8qxp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56240000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long
   	'fsl,imx-irqsteer' was expected
   	'fsl,imx8m-irqsteer' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@56240000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: /bus@56240000/interrupt-controller@56240000: failed to match any schema with compatible: ['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: interrupt-controller@57220000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-irqsteer', 'fsl,imx-irqsteer'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
