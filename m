Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6331990A7
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 20:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767385092; cv=none; b=WKkz8nfJ7KvS6mJOEsFRbxt9BDX0OTwOGOqUotdJCiIRFhBeylTOR9vkn+YbZ/ICkDE16EdwZwEX+XOe4uJWTBscCRDpirAleh980+3imWeqBB/aUpdHHAB7YUbrO1aLos7kJKQUrVQNhiriwgL4JpQarpZ+iRlysvpG+mxvPRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767385092; c=relaxed/simple;
	bh=rHs4splB/BEtMkw7V8OvGL/Xs28fuPFh/sIMDcyeZ64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fFh7YinP/2sIBDRvnLtiA2asCHiXdFhl9bLpQJbWjAsCRxdQ4Lp0FQM0Ke04HRc7R/eLQ6Z6Aabvs8CnS6tQKWkBrk+OOeXT4NDHtHbu41bimlcUrE/pEL9kspu2KEIkURGu5uUB4kis0l45jPYBg5B7wYpwwb8en9rD7SlGLNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfSvjPEp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfSvjPEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767385090; x=1798921090;
  h=date:from:to:cc:subject:message-id;
  bh=rHs4splB/BEtMkw7V8OvGL/Xs28fuPFh/sIMDcyeZ64=;
  b=lfSvjPEphfLtgfO7FLn7zsKmvWYpQ8Yya7JMYFw+ewbIoEHaWMKJnFwt
   Ji5xeQGVjzR3+vlxaSqmyr2LK9JNMerNC+aDfDXjntI/WCNuJCVYfw32d
   uDrO9GvyfZvTEhuztEnA/Cm8oiQsbfUa0JDa0uwftE8VtbdmjTm2o0v1V
   3e+b1OuhuypDvjQ6IaWe/6qebrTOEax7GjFteGTIsrTtJ0PrDc4CFRbHv
   wr8qOo2psH1K4Ni0Fi7gTf+Yt1/wgQjr+CQJuCnJOiJ8KHQmLCX0kY+/7
   YTS9Q7hZOmch+D8E3rq0VNHuMQjoVpmsH4LjQBFT1tXOXMbG+sFhNQlwA
   w==;
X-CSE-ConnectionGUID: iliGVEYKT/yiOy8HapSkiQ==
X-CSE-MsgGUID: stKbSFYzRl+oOl/+AFO7aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="86293480"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="86293480"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 12:18:09 -0800
X-CSE-ConnectionGUID: s8BTG+iUQgKkXQ4QQBbztQ==
X-CSE-MsgGUID: /A9Lr1L5TeSaeFlh1rZUbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="225380523"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jan 2026 12:18:08 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vblb4-000000000Sv-0Hc6;
	Fri, 02 Jan 2026 20:18:06 +0000
Date: Fri, 02 Jan 2026 21:17:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 36/128]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@231304000 (apple,t8112-dart):
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202601022155.VYc9MIGF-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: aecca51e5b37fe67d20bb043615e8b17a74197d1 [36/128] arm64: dts: apple: t8112: Add dcp/disp0 nodes
:::::: branch date: 11 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20260102/202601022155.VYc9MIGF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601022155.VYc9MIGF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601022155.VYc9MIGF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:500.25-509.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j413.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@231304000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@23130c000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: mbox@231c08000 (apple,t8112-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j413', 'apple,panel']
--
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:500.25-509.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j415.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@231304000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@23130c000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: mbox@231c08000 (apple,t8112-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j415', 'apple,panel']
--
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any schema with compatible: ['apple,j415-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any schema with compatible: ['apple,j415-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8112.dtsi:500.25-509.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j473.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@231304000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@23130c000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: mbox@231c08000 (apple,t8112-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:500.25-509.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:511.26-515.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j493.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: soc (simple-bus): display-subsystem: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@231304000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@231304000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@23130c000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@23130c000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: mbox@231c08000 (apple,t8112-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8112-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j493', 'apple,panel']
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pcie@690000000 (apple,t8112-pcie): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
