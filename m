Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9783A43DEDE
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 06:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751535; cv=none; b=sHQqV9RcuuGcx1rRP/JcaKuujOYTEU30g6P8DvNjukcMoJxlIWEpIiHsMWzVZG4QfxArVdIL4JgCAniA/jMjFGEXBcso9nDopJ4TTtv4dLc71aNVcyY0u9JINELbumNJkMCtdUYqZeuiLhbHEhBjz7vuM9i6Jw+LkHVd5hCM3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751535; c=relaxed/simple;
	bh=fSvHUtETgeeklIvYWueWQU2HDGCBklfyUvTGcUh9WS0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GIUDalK/rG2O3P6OemwpmpNLigiBiBTRQgNEkLHbgtXvRlyFzurm/AWR9Pusy4R4VL4MiTi3OqN8LolQXMz4TLJpFV73AdTy2QZMgt+RsEB71USjfk6P7oxWKT8TQ2s8fnbNri6vRbqmR0j3bfeclXRt6iVD8NK+0V7MMPYDHXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WabDhpj9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WabDhpj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790751526; x=1822287526;
  h=date:from:to:cc:subject:message-id;
  bh=fSvHUtETgeeklIvYWueWQU2HDGCBklfyUvTGcUh9WS0=;
  b=WabDhpj9hp8FmJmoA1iGTikyBddOoC3Yw6O42zpHp/rgx6jnOu9ZmVrU
   UGJMDhEIepxwfLtiZJptCe2HytC4B3ualc/FIDE6Wy2Hs2+cZydkG8ZD9
   yhXjCrOR9KAdofZ/O7QUzNA97mqp9NnD6OhqwyxuJV0+VwHeSlolVwaIv
   3qjryv+SwoflP1Ewn++fIOzA4V2xn/vBDFXLKp7SvT06tFQ7XTM52aYc2
   NTYwQ8O0uASPjB6aGDTAMFcOQFAWoCJsQwDJLoBwSlwOM3qG+r9cso4HY
   F3+gaGD9VOnvzB05MyNeIWNvs0xT2HGHT/7Qq64w2tyqNBYVyaOv0dgHM
   Q==;
X-CSE-ConnectionGUID: BZsN0vY0RDqXmLI8o+huJA==
X-CSE-MsgGUID: WGfOEN3nRmOUemiloVdw+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102853330"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102853330"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 23:58:40 -0700
X-CSE-ConnectionGUID: td97oNRST6e++jYcEw4Gxw==
X-CSE-MsgGUID: AGF+uPlgTymqjhax8kjUNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="278810546"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2026 23:58:39 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBoGz-000000001lh-10c2;
	Wed, 30 Sep 2026 06:58:37 +0000
Date: Wed, 30 Sep 2026 08:57:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broadcom-stblinux:devicetree-arm64/next 10/10]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/iommu@1000005200:
 failed to match any schema with compatible: ['brcm,bcm2712-iommu']
Message-ID: <202609300839.rhdwKK4V-lkp@intel.com>
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
TO: Daniel Drake <dan@reactivated.net>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://github.com/Broadcom/stblinux devicetree-arm64/next
head:   4db272ba40c09eafda1ec0a4d59c0423561c8f7a
commit: 4db272ba40c09eafda1ec0a4d59c0423561c8f7a [10/10] arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20260930/202609300839.rhdwKK4V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300839.rhdwKK4V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609300839.rhdwKK4V-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:532.11-729.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/pwm@4009c000: failed to match any schema with compatible: ['raspberrypi,rp1-pwm']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/iommu@1000005200: failed to match any schema with compatible: ['brcm,bcm2712-iommu']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: iommu@1000005200 (brcm,bcm2712-iommu): brcm,iommu-cache: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /axi/iommuc@1000005b00: failed to match any schema with compatible: ['brcm,bcm2712-iommuc']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:532.11-729.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/pwm@4009c000: failed to match any schema with compatible: ['raspberrypi,rp1-pwm']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/iommu@1000005200: failed to match any schema with compatible: ['brcm,bcm2712-iommu']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: iommu@1000005200 (brcm,bcm2712-iommu): brcm,iommu-cache: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /axi/iommuc@1000005b00: failed to match any schema with compatible: ['brcm,bcm2712-iommuc']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
