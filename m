Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E974756DD
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 23:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785282555; cv=none; b=IlmOuEGDkYCwgshpo9QwYnJlYhIkdHy6cZ3pgp20jHfe00N3LVMSocoPzUuVFsJngMgNarGeJZD5hxM+bGs2+KbGEmiPkyrjeAaWopppVOIedqQrLYfWiNsDggxPgAiZe360HabvRqdYsMjgPQ9JhPuJxL1WvePhJxOZPCQuzK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785282555; c=relaxed/simple;
	bh=7kVj6+9l37vienWBKsNRivO1VSAX1JZ9so6wY3q+tW0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sOY4LRbfiYyw/qn2RopynhHxg7HgELk+cBR8GxmxsHetjfAmBcv3b+DCZW6q1V3mR/2NkYtRvzJWfSFb2yPP84xzco5fdZB8xiRUzelCpRZrZOiR1TBQxtQEVLHc/Dv9mRdHeJYPNRNKI605q7q5PHVugeu3GkQLr7+sp8OXSHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=im8iES0A; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="im8iES0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785282554; x=1816818554;
  h=date:from:to:cc:subject:message-id;
  bh=7kVj6+9l37vienWBKsNRivO1VSAX1JZ9so6wY3q+tW0=;
  b=im8iES0AwBVCtkyYmSFFkMcZURZKoyoLVc+ZzUZr2YUjpV+x/IhnvYZ2
   k/6h76mSVu4a/2/C14c+i0ECPzv1ULtoegXEKQigPz6IqUuJb2kO78plz
   CPDyNREnRH2r4fbelABf+LDsiJtvhGt8Q6UzDN1idD9FUUcZWOwUkZbXa
   y4ozs+C12YHv7F8A3C3gKyvKsCmVgnPwDKFOAPi2Z+3vc/2aYzkbcLOJ9
   G0mTgrzX2+bu/JcoTZNaYv6PsziNXEvilwIjvTNcUGkp981vyBsBGzPZu
   qdy5bNWHC+TSRI0gAP/gByg2N/4j7/ZMV4AFuuelHitW2GmOxTBhhZkQn
   g==;
X-CSE-ConnectionGUID: T2XY7b2QTxqf4dAoHxMbyA==
X-CSE-MsgGUID: qjQ0HfpVQ8i47AV0/MpYsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97392807"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="97392807"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 16:49:13 -0700
X-CSE-ConnectionGUID: xewO/+RmSxuQuyf4fqpWXg==
X-CSE-MsgGUID: mAOrTL+jSB+WM21ZWxOxFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="260488338"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Jul 2026 16:49:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1worXp-0000000022c-2bgY;
	Tue, 28 Jul 2026 23:49:09 +0000
Date: Wed, 29 Jul 2026 01:48:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: gpu
 (brcm,bcm2712-vc6): 'iommus' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202607290105.0G6O5PWP-lkp@intel.com>
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

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Drake/generic_pt-allow-missing-sw-bit-in-DMA_INCOHERENT-case/20260728-104924
head:   dfd34af1fe7ce4108ac5744c4953720d46fad45e
commit: dfd34af1fe7ce4108ac5744c4953720d46fad45e arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes
date:   21 hours ago
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-2054-20260728 (https://download.01.org/0day-ci/archive/20260729/202607290105.0G6O5PWP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 9521d0c03324fb5950727522cdf71d94fd3f68b1)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290105.0G6O5PWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607290105.0G6O5PWP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:495.11-679.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: gpu (brcm,bcm2712-vc6): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-vc4.yaml
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:495.11-679.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: gpu (brcm,bcm2712-vc6): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-vc4.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
