Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019C91DA60F
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756023843; cv=none; b=AMt7nFlbU+VYsyAyok6MYHy+HLmKrC+F8ojRK7SQ/D91cmjgw/l7q8ilL/nH9CLLcwNSQ16/xXNelyYaLOHtPYM8vOSftvUFTxR2Nph1rj11wWpK39B7hyZjbpVKBiRC5MfYPr25JgA92bnQdA398wZrqPDTnhKEeJDtMm+mw6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756023843; c=relaxed/simple;
	bh=sdabR0vqTrH4rmy8eW3vsTeW1z4pfgaYJ2RFHw3Vblk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dkxQO7SgxTuoBDNyx0UYbqawIPqBdKjj/ei1zk0b7jq/yg8K64ZgDjYvV37tYoOe6PclBnthvJkTvVitCPEYHmqAo+uHLVGyCIjL6ATnhiL93yI69AkEn74HRVpAxg+2Tt5neveuwjvJJjjHZa94G4OTAZSG7qqSPRQzbNj3nq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdIEjKVS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdIEjKVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756023841; x=1787559841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sdabR0vqTrH4rmy8eW3vsTeW1z4pfgaYJ2RFHw3Vblk=;
  b=cdIEjKVSCnQOCzPfTS2pXkvMgYf+zZBFni4GPKYI58XSh7WkSsDixPEn
   kkz2suUSwTLy/IMy9d/j9od+U7WfnC+6yDypier0f10J4gYo15AAjxA30
   emTrqanMN+eq5DATJkVv6mjmSj2Spe8yGcOH+Qr0hd5ZR6bi4CvNadHEJ
   BoyNeOGY+n7y/MYsdQ93ElnshMtAvF6u6XzS2MbsIAD931at0LqXtn6bi
   u2BOzCkrjMHhwteKO48Lv7qN9geoJePQ5iNSh9q0gh21TojV2JyG3/qFG
   Y+41KiabrysWJttvJdB2yiGUQcLrIBbiUS2FiGRpOSzkF3cQdHbB+1rDe
   A==;
X-CSE-ConnectionGUID: ZsZEKwF/RAKZeusyIViu0w==
X-CSE-MsgGUID: IVFMlywCSQyA0BlVjoP8ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58193239"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58193239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 01:24:00 -0700
X-CSE-ConnectionGUID: sUubxZx/QUuGx6u3D6ArGQ==
X-CSE-MsgGUID: H/KHQUvURmGGwU64YaKUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173241227"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Aug 2025 01:23:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq616-000MtD-1b;
	Sun, 24 Aug 2025 08:23:56 +0000
Date: Sun, 24 Aug 2025 16:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sven:wip/atcphy 21/21] arch/arm64/boot/dts/apple/t8103-j274.dtb:
 usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not
 contain items matching the given schema
Message-ID: <202508241642.1G7Gmg64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sven Peter <sven@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git wip/atcphy
head:   775cf79ad68f8662890ae7f18b28e8c97bf11e74
commit: 775cf79ad68f8662890ae7f18b28e8c97bf11e74 [21/21] arm64: dts: apple: t8103: Add Apple Type-C PHY and dwc3 nodes
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-052-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241642.1G7Gmg64-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241642.1G7Gmg64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508241642.1G7Gmg64-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:488.26-492.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[106, 0], [107, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[114, 0], [115, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@502280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long
--
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): iommus: [[104, 0], [105, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8103-dwc3'] is too short
   	'apple,t8103-dwc3' is not one of ['apple,t6000-dwc3', 'apple,t6020-dwc3', 'apple,t8112-dwc3']
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000 (apple,t8103-dwc3): Unevaluated properties are not allowed ('compatible', 'dr_mode', 'phy-names', 'phys', 'ports', 'role-switch-default-mode', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): compatible: ['apple,t8103-dwc3'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/apple,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@502280000 (apple,t8103-dwc3): iommus: [[112, 0], [113, 1]] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
