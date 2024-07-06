Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF681367
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 19:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720293011; cv=none; b=nDzdUU9t4aYvMwGC3Xc2gSHWdWqLR82/CUkUpf1MY3B+ZQTd5Xa8S1iA+vOzirRBUPnaqKiyu/iYzyyjJF+W952//N0K991Byj5toBwHXLV35WCeksWmMkrbSPA3geXltd7QE79RL5E/HmrptP7ESrffnpWZwhhJwargFeUJOa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720293011; c=relaxed/simple;
	bh=GNvGxJeajiDXvATPubZi58UZczRW3qcpzOFn4UMDOxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JN3EhfQAcURpT4saJnGKG57nRiiRRq6dnN7oo+R91Nas8w7XGaYzsfAEEq/MAI4DnNQkhSoI1g2r75ZE0sUujZkPvECtIvJEIfvikJuzeQxBALv53FFYL7kfe2Yw9w1x989YbtKEIhFjw0OzZK6SdPaNucOokyVSs/uJ5RuZRhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUY1DqHM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUY1DqHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720293009; x=1751829009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GNvGxJeajiDXvATPubZi58UZczRW3qcpzOFn4UMDOxc=;
  b=NUY1DqHMOpl0U1I3s2r5GgHLDQ21swpGAPoEcQLsA3p6hKolL+EOhpxX
   DJ1gR5pUdJnloG9fgcBaHOa2wPvkU743yKRIJLej3nhaXKRVmta2bQQDo
   bAtCnfOMWE5M1dvu2VIFZWn0Wpe/Ds3Ox+HHh7b3tQs5rxIa85Bm1NVsL
   XOIeKCd7O6H1A4QSsWGjMT165SQ226rNod5DMGDKpZvHgjRJMXUkxytHo
   HXzPAoHsUWV9cJu52kccswo9j9WuX9aaRjtTQqs39HkujRCOTXLjBz2l9
   bRYibeF73b7SNDixQPNzdrCIFrCUzmYkubmDNshtOsZ3mMhmKV3ZjRRTw
   A==;
X-CSE-ConnectionGUID: g5qG3oo7TzqlI4rYWo3TGw==
X-CSE-MsgGUID: aIQMauiqQiq5f7SKK1vI/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28696724"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="28696724"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 12:10:08 -0700
X-CSE-ConnectionGUID: IqpHhy//R4K11kOOX+mPcw==
X-CSE-MsgGUID: JXujuUsFQUSaOPr5z1je4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="47784681"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jul 2024 12:10:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQAnN-000U9U-1J;
	Sat, 06 Jul 2024 19:10:05 +0000
Date: Sun, 7 Jul 2024 03:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 139/187]
 arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31: Unevaluated properties
 are not allowed ('SDZ-supply', 'compatible', 'ti,pdm-slot-no' were
 unexpected)
Message-ID: <202407070355.WfYd8OZ6-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: 93efee59313f37779f22067e6cfa7ad69170ee24 [139/187] arm64: dts: apple: j293: Model SDZ GPIO as a regulator
:::::: branch date: 3 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240707/202407070355.WfYd8OZ6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070355.WfYd8OZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407070355.WfYd8OZ6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j293', 'apple,panel']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j293', 'apple,panel']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8103-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8103-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31: compatible:0: 'ti,tas5770l' is not one of ['ti,tas2770']
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31: compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,pdm-slot-no' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/i2c@235014000/codec@31: failed to match any schema with compatible: ['ti,tas5770l', 'ti,tas2770']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32: compatible:0: 'ti,tas5770l' is not one of ['ti,tas2770']
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32: compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,pdm-slot-no', 'ti,sdout-pull-down' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/i2c@235014000/codec@32: failed to match any schema with compatible: ['ti,tas5770l', 'ti,tas2770']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48: 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48: 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48: 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48: 'VL-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
