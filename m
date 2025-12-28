Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5992DCC05
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766925837; cv=none; b=DSbiM8TuKJfJ+8IykugjdVHzw3oVjQrDStLxiVl/ap3JnKLSZqTyjmnshg+EBJ3qa/HR7SaChW2XcjMbbttnPEXA5Zbqldgm6r8tXr5kQNXORknhcn4cSL7vRYamS9SCOA3PBm94zyzNQLLMjpyXYKo3PFkjA5bSlU3lGIyA9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766925837; c=relaxed/simple;
	bh=Zv2L1JdiyO6YGtkXRIZ7mKilM749akqx83Il3IU8kMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ItWHWsmp5QPEav4pdEpuwsd9nx2O5wnMV5w7kxThe7tPErCy6Fuz2l2keznYBHqXcT0rFo8jxv9iaIm58a2Q1kfBPj/XGI6afkFv5j0mwoMNCv4OhRhjZE90LTFKxeztZ18ql8NdUO7qJcogg0loOSNhwpO9yaqZVd/Zl9mFfBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AR9U3UtP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AR9U3UtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766925835; x=1798461835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zv2L1JdiyO6YGtkXRIZ7mKilM749akqx83Il3IU8kMI=;
  b=AR9U3UtP1FCZxyZsF6dgGhaRQvtHlK5Y5U5skVNVKoneHpVEPhcDWseg
   mOs9vuFPrjxiUlcP4W5naPwyhgcteNHqXqRONEfdVvkzcxk4s3SDkicas
   x+3w8y4f8KxCg3amZDHCdn4Q/BtPsIEMh2JC5CG4W8Jih9uXlnUBn6wkr
   oQOYoM19sqcAqjSl4IgHNFUGB10LdQmBQrcQbeoQVPO6nuiOo0Wl+vc9W
   W8/fjkCi6/tV1qzRwbvtjBsWN3f2pdPyJNJKmfmZWCpciiw6JU+b8SJKK
   JMSpsXaJNDjLBthZ1n9bnewkao5lAoYFa8jR8te1xmwkE3cdbZqnCxEzR
   Q==;
X-CSE-ConnectionGUID: VBaIs7R+QkSSxkgwxiUkCQ==
X-CSE-MsgGUID: Fs1ODaArTBy1KB1Co43D2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="94042237"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="94042237"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 04:43:54 -0800
X-CSE-ConnectionGUID: V0Gh0fgyRf2yrwO99PbgqA==
X-CSE-MsgGUID: AFtTGBEVSIiWpC47yt75xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200680729"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 28 Dec 2025 04:43:52 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZq7i-000000007Ue-1nrz;
	Sun, 28 Dec 2025 12:43:50 +0000
Date: Sun, 28 Dec 2025 13:42:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 127/128]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mux@38304c000: failed to
 match any schema with compatible: ['apple,t8112-display-crossbar',
 'apple,t8103-display-crossbar']
Message-ID: <202512281332.CmEkJZFF-lkp@intel.com>
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
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: b7aa8b2bd8664c0ec0f4a8e4a2cfb928b51dc691 [127/128] rm64: dts: apple: t8112: Add ATC display crossbar devices
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251228/202512281332.CmEkJZFF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281332.CmEkJZFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512281332.CmEkJZFF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: mux@38304c000 (apple,t8112-display-crossbar): $nodename:0: 'mux@38304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: mux@50304c000 (apple,t8112-display-crossbar): $nodename:0: 'mux@50304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
--
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: mux@38304c000 (apple,t8112-display-crossbar): $nodename:0: 'mux@38304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: mux@50304c000 (apple,t8112-display-crossbar): $nodename:0: 'mux@50304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any schema with compatible: ['apple,j415-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any schema with compatible: ['apple,j415-macaudio', 'apple,macaudio']
--
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: mux@38304c000 (apple,t8112-display-crossbar): $nodename:0: 'mux@38304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: mux@50304c000 (apple,t8112-display-crossbar): $nodename:0: 'mux@50304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
--
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mux@38304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: mux@38304c000 (apple,t8112-display-crossbar): $nodename:0: 'mux@38304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mux@50304c000: failed to match any schema with compatible: ['apple,t8112-display-crossbar', 'apple,t8103-display-crossbar']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: mux@50304c000 (apple,t8112-display-crossbar): $nodename:0: 'mux@50304c000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
