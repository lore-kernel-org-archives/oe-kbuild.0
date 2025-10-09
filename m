Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAD11A275
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 00:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759968468; cv=none; b=mW2XtVW+6u5oGRNlfWOvur9a4DNjm4oLjODiOqkbX7RH11kfOgN1WZMMcjBW2dy3juGYLOhwbs4Ngyw2xHLJT7riIH+AcFE76xcAztXXfTkoEojfxJASzVQO69w4eGlbax/mLOx8edsK0utkPW3XngUmNh6mwYxiMPuGtLv1wM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759968468; c=relaxed/simple;
	bh=0KO83wteDeyje5YBeTO4DJoMtJ61dF6pNbOf560Y+FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rOhIU9H61I5uJZnOb0s0AK7GmfMmcqFfZzmox81fpELwonavsnzdx+mdQUhei8WQHpGOyAb3nOyZKd5y33OGJzBFgPbOlJm5M9uSq+XucoLG0eA1Knr8md11cllg4KnYbkgl0AFRrV6uN465fLaqw2DVZRz8EkE+gNlo00p0rXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFCutjsP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFCutjsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759968467; x=1791504467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0KO83wteDeyje5YBeTO4DJoMtJ61dF6pNbOf560Y+FM=;
  b=WFCutjsPnqmPSf9u221KFUamp6BY6DcLrqSOFw7C00fUH9D0+ayZazRC
   PBWOiSMMLZO1Bxi5t3n5rzUhOHeFqFq5ZFzesPVwk/W0wuk8sXReqN/YN
   WZmqtYnzWg5mO3/F/AwK3b/HpaylgKjIAAi6vKfPoHpkT89Y1Ybewf3qW
   tzgwCJGslECjhA5HmjIPXFG/RWyD7sM3nbeIzc5/1Lo29bDrqWuhlUdcs
   W8zH06iptJ/AV/UlDU1GThjYgTsSAr/wSv09RSGol7NSkv0uqHI1oYUiu
   DwogFemAVM/RBjxkguQKAyNO8Yu4b3HYTKY9MB9hP6dKIL7Ox+VRYf15o
   w==;
X-CSE-ConnectionGUID: yBhTlmdKRzOwxkpoB/KJkg==
X-CSE-MsgGUID: wQ9rx8JeSimkBLT39T25Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62058245"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="62058245"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 17:07:46 -0700
X-CSE-ConnectionGUID: eM6QzxA2RYScN5kvi+wU0Q==
X-CSE-MsgGUID: 3m0FXCauQEyTpg3Ddvw14g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; 
   d="scan'208";a="180388627"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 08 Oct 2025 17:07:45 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6eC6-0000000086b-1HyD;
	Thu, 09 Oct 2025 00:07:42 +0000
Date: Thu, 9 Oct 2025 02:06:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-testing 21/23]
 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb:
 usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202510090234.j9Xz0E6h-lkp@intel.com>
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
config: arm64-randconfig-2051-20251008 (https://download.01.org/0day-ci/archive/20251009/202510090234.j9Xz0E6h-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project c410e88f0f8c0654d7744d6d029009f9cb736143)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510090234.j9Xz0E6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510090234.j9Xz0E6h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3100000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3100000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3110000 (fsl,ls1028a-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1028a-dwc3', 'snps,dwc3'] is too long
   	'fsl,ls1028a-dwc3' is not one of ['fsl,ls1012a-dwc3', 'fsl,ls1043a-dwc3', 'fsl,ls1046a-dwc3', 'fsl,ls1088a-dwc3', 'fsl,ls208xa-dwc3', 'fsl,lx2160a-dwc3']
   	'fsl,ls1028a-dwc3' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: usb@3110000 (fsl,ls1028a-dwc3): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,ls1028a.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
