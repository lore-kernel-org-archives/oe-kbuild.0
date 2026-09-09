Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E3492E33
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 00:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788912896; cv=none; b=i1XXG+pMIferhG/7TlsExYpbW7nJ7zQOT0R8l+1G/gZ/3VSsRhGoHR4wXij6Pp8tvpN8TmP+wWaKx9gNtMibPkKsAY0Q1QuiMJJCEDvugwYr00wCnROSdYm0edE4JGf3oyfGExDMPcPpXt+u3wZltLKNAuH3OJLU7YnH2nUiVHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788912896; c=relaxed/simple;
	bh=VZVFU4l6Vc3Ke+NTUukNUZd72DnOe6y2Q6f9yDKnW6Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oS2nHrqxoWtlPUK8PTZ6NpYKekd0lC8NKLel2+0Z88QucsOnlpVsfjtMu1+SObtr+S/tCALqHKVyZQOLCf85tMq+hqN4dbAa1EZmVJo1B73fp+1uuymfR2ay+EbUEBF5u+SQzd8pmzb4l3YbyAbN3/Ija+xU90ZFwPM/jWZ9MhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cp5IPI2U; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cp5IPI2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788912895; x=1820448895;
  h=date:from:to:cc:subject:message-id;
  bh=VZVFU4l6Vc3Ke+NTUukNUZd72DnOe6y2Q6f9yDKnW6Y=;
  b=Cp5IPI2UcGI+3frp9BeudWeW58OaSyKdbvFTU/cOyqY9NdVMK5TYAKLC
   aXO7Km+IPWMgVXZ2flYvAJ2LH0fvDAga5J1rtR8+n7VYCnKk8PC8fMcx+
   LIWD6M0DchzqvxZMSPwchHLeoSW9O8F15hAq7fEj/VQXOpfrc4XApH2Ey
   KogBgQX4vcNntAfOIE0FlAje/r+0Of9je7BTBB9P+XpVW0/Hsv/sNfsZW
   TpTU/P9dTMTHFYQmKoapYgaNAmBnm5qXWNivlBdj33rXXBSaQq9A9bIL3
   NgzkGqEYmzEDij9UtRoxPKK279u6cwF0LmfBPL6xFkCEheGOJHsrC188l
   g==;
X-CSE-ConnectionGUID: ECp57OG7SouaeNn8oF/X7g==
X-CSE-MsgGUID: kqDaqf22QKaDVeIYGzD8XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93193641"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="93193641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 17:14:54 -0700
X-CSE-ConnectionGUID: 0+n7JJ6oTjWhpxRjLxrtEA==
X-CSE-MsgGUID: yCx5mlDyQbifBlGbJn7L2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="274930425"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2026 17:14:53 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x45xi-000000000wu-38Px;
	Wed, 09 Sep 2026 00:14:50 +0000
Date: Wed, 09 Sep 2026 02:13:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb:
 hvs@107c580000 (brcm,bcm2712-hvs): 'iommus' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202609090242.PYPHzKnq-lkp@intel.com>
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
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Drake/iommu_pt-Fix-test_pgsize_boundary-failure-on-narrow-OA-formats/20260902-185703
head:   45cd04671aa7aba4cd7e95c956b876baac0028fe
commit: 45cd04671aa7aba4cd7e95c956b876baac0028fe arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2053-20260908 (https://download.01.org/0day-ci/archive/20260909/202609090242.PYPHzKnq-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609090242.PYPHzKnq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609090242.PYPHzKnq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:495.11-679.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: gpu (brcm,bcm2712-vc6): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-vc4.yaml
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:495.11-679.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: gpu (brcm,bcm2712-vc6): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-vc4.yaml
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000 (brcm,bcm2712-hvs): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
