Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113F4C81
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 00:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759968588; cv=none; b=OUwCT61sb7+uOaIJZo0U7+oNeYYDm1Up/dB5shkwCp7LLkwYsLPZK+p8RBGLhLgrNDtFeTh4J0fSUCgUNjvxc+ef2N9SjFM/2SPu2Pod52JN0AQ4nBMDIQcWWYvYYXIyV2cAWgTp4dhIll+aX0vPYjqeFKU1yYpz2A5zqlfP1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759968588; c=relaxed/simple;
	bh=4eMKzuY0dyqkHnKucmyW+uZbqmkEfamt0hKJQmsbhY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H8TMR9tywknJ9CrOAXDPRdNM5XKbwv6/rtdkY1KAv4QLk47LTD4AZJi/r/CXEDA8o7N3Ovvlmb3wugKsCWP9fdG4toVfRmv97ZOcxOs5ydU5ETn83+eqoZs1EtA4SCqEK24vYKWmcjWsCTYzgwC/y5rhCA4NrgRJeWeePwC3r2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1W3t41d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1W3t41d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759968586; x=1791504586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4eMKzuY0dyqkHnKucmyW+uZbqmkEfamt0hKJQmsbhY8=;
  b=k1W3t41dcoHON318lhA9f2ZsdrarjKbDLOI9A/esPj9XLiVmKwptpHFz
   Noy034kAwbc+FFzzX9NMxT1EcxN14QIBJw5FKlxecoZPll1d3ME+/z0M5
   NldQJM5WwiPNgHa+ir4r3RZUD8cqSEOde8vkVSQFz87aynMF4wolMJfr0
   Bu1SXocE1rhED7no8b2YCJy4xwsLCSNv8FaGc6klGFTdGzjgr2CtmHmfu
   602dDdxOSKO8+PsK6KnVpNPi8kb5+Jq9GE98IR7HgLD6LXkvmlz4NUulW
   2OnLujmKOjt4JYinDaS9FTYdnUnqkYzVo/sx3JKlEQnoo6vUihXw3B4cZ
   Q==;
X-CSE-ConnectionGUID: UyyIAjJgSGa1SqGahOl0Sg==
X-CSE-MsgGUID: UbzkLLQvQmuNKbgvq/+OkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72851230"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="72851230"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 17:09:45 -0700
X-CSE-ConnectionGUID: dkarqLbFRHGKwOVvwU1tWA==
X-CSE-MsgGUID: Ei4BntRQTZ+exi429PlPYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="180503994"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 08 Oct 2025 17:09:44 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6eE2-0000000086f-1QIl;
	Thu, 09 Oct 2025 00:09:42 +0000
Date: Thu, 9 Oct 2025 02:09:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-testing 21/23]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3100000
 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510090211.jduviqiw-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   a2f12b1cbec103a836e3ddfde57084661591e4f3
commit: 247b0d6f62ea306ba9f6f39055253fe3893be729 [21/23] dt-bindings: usb: add missed compatible string for arm64 layerscape
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-2052-20251008 (https://download.01.org/0day-ci/archive/20251009/202510090211.jduviqiw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project c410e88f0f8c0654d7744d6d029009f9cb736143)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510090211.jduviqiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510090211.jduviqiw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
