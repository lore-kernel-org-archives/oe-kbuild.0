Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B82318144
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766485964; cv=none; b=hNPh4FvJswpyG0XR+Eg3mnchaEyZkuMTgonWkjUBf0PURs9QGfVKsFU+bgUSXI0q/GyUE2NMtohPgpTmxOpjROyyK4Nr03rvq/6BeDRYgpZNnNPpQPBZu+5ZpyUqJqXdc0GQ8yco7i2Kym5Rq+Lbi/nIPeePHohtKmM8T+JLWnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766485964; c=relaxed/simple;
	bh=GDVP1g59bcgqeaWncV+hI4qc6JheY87cSWj2rhSXwSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJdLeX+wLuyjz8XSNXow/sI0F3LjzqKWy6B9s/tGlsJMCaw6xCy0qe6JOfo1WABZAP08PTWpacUDgJf6pMgz0avRqZjVVaF/0XiBzh0F3T6NDxaht+Hf29bXYDZw0LxhJOzASO8XeEnNO4hdzPLcCq3QkXh7Ti2wrwsxtqHB5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pf9nMwH9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pf9nMwH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766485960; x=1798021960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDVP1g59bcgqeaWncV+hI4qc6JheY87cSWj2rhSXwSQ=;
  b=Pf9nMwH9NajG98IE2nowedhpDqb8KJf9G5J8qhsGNC1TV5i0rwZHW5pl
   f6taibN6pFM2aGRPOW0ZqWL44CuBYTCGQsfh/4Ers6Voz1m2p/X/Ifj5M
   WnvWIPiwoVOp1gzLhO8X76oCo1sSNDkzIlrF7MKQFqurXBy1G7lw91LXZ
   s/Z9mRTz7agi9FAOfaYztkkPmRmOwdWayudi0/KhLzl3B8HEeHJEDQ5Iy
   smbHb00T6Dd4Yt42Y8FyQdTghhesJAqgsLg2k64JEi5iTm6hVh2T/aAvq
   940U8EZRL0F2X/Dfab6rgKqx8zgcaCOich4iCcin02xl2l8pINDfgyu8b
   w==;
X-CSE-ConnectionGUID: UOtubjqBRNittUyQc8VTpw==
X-CSE-MsgGUID: FNtdOhaORs65iqVBVLvVYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="70910419"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="70910419"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 02:32:40 -0800
X-CSE-ConnectionGUID: v9EnAxuTRFevAV1YCpLC3Q==
X-CSE-MsgGUID: TdmVmDZyQLezcmq4UJcB8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="200256170"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 Dec 2025 02:32:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXzgz-000000005uG-0W6U;
	Tue, 23 Dec 2025 10:32:37 +0000
Date: Tue, 23 Dec 2025 11:31:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 6/128]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f00000
 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202512231115.4B9rIhNb-lkp@intel.com>
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
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: 6516418fc19f297843304e4d1d10eebd9e92a41a [6/128] arm64: dts: apple: t8112: Add Apple Type-C PHY and dwc3
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251223/202512231115.4B9rIhNb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231115.4B9rIhNb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512231115.4B9rIhNb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j413.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@382f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j415.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@382f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j473.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@382f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
--
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:503.26-507.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j493.dtb: smc@23e400000 (apple,t8112-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@382f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@382f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@382f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8112-dwc3', 'apple,t8103-dwc3']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f00000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@502f00000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@502f80000 (apple,t8112-dart): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@502f80000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/phy@503000000: failed to match any schema with compatible: ['apple,t8112-atcphy', 'apple,t8103-atcphy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
