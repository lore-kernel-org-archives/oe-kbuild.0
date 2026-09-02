Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB8F481FC5
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Sep 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356331; cv=none; b=iya7VOorIoHHSBgPmFdRz7e42vBFQDQBI1nzqNX7Hr8nhU2LiCMgLuSShXjAryO3I0+D48Q58htweO9MKOt3yF4VN1kv9v4Gy1bciHJd7JKnmHFPnZc3NX064y43OkMG0iuPQDYrlb4aX8cGkawYy3ADEJDNx4HSfQts2GybQo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356331; c=relaxed/simple;
	bh=WmvOI4xOcXBhY60MLjTV1ymc/dHSZ4ljWuwiGqMxBkc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KY46TMtbEiPvKKoil5TNSImfnofq/+luAff0N+WCye5kFlAuAsLVk89vPCPS4YF9LP1QZF6DLlffEMPI7wsIp8h3zSXf8wFyGfJHaepwVwp/em9ATCggonVq5K6dplLB/GVNO0rbM5Yq1yE7sWD0DMH41DM02pGZSQuZ+bIWkNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X42GLDUR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X42GLDUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788356329; x=1819892329;
  h=date:from:to:cc:subject:message-id;
  bh=WmvOI4xOcXBhY60MLjTV1ymc/dHSZ4ljWuwiGqMxBkc=;
  b=X42GLDURD2yMUiRT9vKxGKNAM1d9yB7D9iNs+Jq7xxIum/qBpVf9cR9E
   nwFA+5c6B7KVXuE2X/xxKemmBlqcvALJx9AT3lvPFwEAPUI873ApvQzkn
   6CiF9UhVwrzHJEB+ynzxwbwpQtg1Js9GLSMfamB+nw8+aC98no0D4OSTY
   D0yjCWjzeMyYdlDVMWdBWcbPIpGVaxecx+l8M62v5BNU7sqRJUvpdsRqJ
   uuJG0deiAKa7Z4ImPj2m0ArgGAutLj0VPIEMtQGU9Sz0y8dVjNiFtk7rP
   Gk6B8EMKEwlQe+5O1B3+EOPAf9BWuvKRvev2KXwR3L2j9smvH0jIbf5Hk
   g==;
X-CSE-ConnectionGUID: SNjUrtbOTUWBXDdfzJbrDw==
X-CSE-MsgGUID: ald+XxhSS5W7vc1V6HeDGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100169914"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100169914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 06:38:48 -0700
X-CSE-ConnectionGUID: XeCz1ShdTj6xihOZg0cZqw==
X-CSE-MsgGUID: P/MltSinShW2s1xgJSB1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="307622374"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 Sep 2026 06:38:47 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1lAq-000000000C7-2Ext;
	Wed, 02 Sep 2026 13:38:44 +0000
Date: Wed, 02 Sep 2026 15:38:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/cu1000-neo.dtb:
 x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'anyOf' conditional
 failed, one must be fixed:
Message-ID: <202609021533.8R4NczHP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89a312991dc6e638a36adc43ccb91dbc25504c04
commit: 4f0b3cd7b664e662e9c4480e8d58574ece8aea57 MIPS: dts: Always descend vendor subdirectories
date:   9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-2051-20260902 (https://download.01.org/0day-ci/archive/20260902/202609021533.8R4NczHP-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021533.8R4NczHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4f0b3cd7b664 ("MIPS: dts: Always descend vendor subdirectories")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609021533.8R4NczHP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ingenic/cu1000-neo.dts:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: / (yna,cu1000-neo): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: cpu@0 (ingenic,xburst-fpu1.0-mxu1.1): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): 'rng@d8' does not match any of the regexes: '^mac-phy-ctrl@[a-f0-9]+$', '^pinctrl-[0-9]+$', '^usb-phy@[a-f0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'anyOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8:compatible:0: 'syscon' is not one of ['ingenic,jz4775-mac', 'ingenic,x1000-mac', 'ingenic,x1600-mac', 'ingenic,x1830-mac', 'ingenic,x2000-mac']
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: x1000-cgu@10000000 (ingenic,x1000-cgu): mac-phy-ctrl@e8: 'clock-names' is a required property
--
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: interrupt-controller@10001000 (ingenic,x1830-intc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ingenic,x1830-intc', 'ingenic,jz4780-intc'] is too long
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4740-intc', 'ingenic,jz4760-intc', 'ingenic,jz4780-intc']
   	'ingenic,x1830-intc' is not one of ['ingenic,jz4775-intc', 'ingenic,jz4770-intc', 'ingenic,jz4760b-intc']
   	'ingenic,x1000-intc' was expected
   	'ingenic,jz4725b-intc' was expected
   	'ingenic,jz4760-intc' was expected
   	'ingenic,jz4740-intc' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: /interrupt-controller@10001000: failed to match any schema with compatible: ['ingenic,x1830-intc', 'ingenic,jz4780-intc']
>> arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'anyOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8:compatible:0: 'syscon' is not one of ['ingenic,jz4775-mac', 'ingenic,x1000-mac', 'ingenic,x1600-mac', 'ingenic,x1830-mac', 'ingenic,x2000-mac']
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml
   arch/mips/boot/dts/ingenic/cu1830-neo.dtb: x1830-cgu@10000000 (ingenic,x1830-cgu): mac-phy-ctrl@e8: 'clock-names' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
