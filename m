Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781A437A823
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 21:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783893532; cv=none; b=T27AlvPfN/+UdHjCBLXq8HG9kVwrk1hxAcbynDxnKlzBPrJzl2DYajozGJo7Eeo7F5kiXU0bBqjQ13cyZwc7TlNxhKAFhkwUw3UWjRM0yvuW+MVTRM887FJ4Sa5COvZUcDyY6z94Ma2PHVAIqw/ZnhQuIq0Wl2qjg7qY3JEiS30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783893532; c=relaxed/simple;
	bh=nO5g9NIcptt7nPGpmNcnkPAPy4cvoa8ysJ3D2T4qDGs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qTV/pAI6r4mFG7aBjD0akYchJ/8svtt6QcXdp/N5UIZuIa53Nf4xc7RjypdnOgJrY3IudYrr2MWZChD6WbazJbUVbzWyJEded7K/YsSHX9BBkW7jM5Qul4vLZKsCqRnm4RAfuGDDD0/rXpMFPCuszhGSHyGsZYyKj8B6SH8vw6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpZ+p7ib; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpZ+p7ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783893530; x=1815429530;
  h=date:from:to:cc:subject:message-id;
  bh=nO5g9NIcptt7nPGpmNcnkPAPy4cvoa8ysJ3D2T4qDGs=;
  b=OpZ+p7ibChBaGXdSafkh6st+Y5LdpErwdPMKq4XpivV+cTIsmyBN7DQA
   0mYIsRNOrFPuQMFiztztVP7s6qbrNz30/RepoGK0B9NJh40yxcOx5kPvs
   jCjxQE0a2y02+cQd8SNggPtcquE8X3YdvyT/a7Zr10Yl06aAwOrILylzi
   IeowP9pevyNOscCzpXMZd0Dy4RA8R0X+IrGKxuIiNMkbD0yDHaMParLop
   TFQ/7tnPyRMBOxGnMk9ywdEgLnPvs+Anemi+yIhjveG4JMZvDl+SxmTD0
   ueEVL1AfepOAT3ERc98o65gl484cFmrktgyaFAxirN8ogj1E5VpmB3fjK
   g==;
X-CSE-ConnectionGUID: BcdbA5yFSk29Fxum7cuw4Q==
X-CSE-MsgGUID: HTPzv3dJSteh+kj4RJRtTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84286705"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84286705"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 14:58:50 -0700
X-CSE-ConnectionGUID: iPRr2BZvQIWPE3Ng7f0GQw==
X-CSE-MsgGUID: 6ykFhw/ZS7+Q5uMZym4N8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258959872"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2026 14:58:48 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj2CD-000000003Zp-23DE;
	Sun, 12 Jul 2026 21:58:45 +0000
Date: Sun, 12 Jul 2026 23:58:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-next 45/66]
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: usb@9880000
 (generic-ohci): False schema does not allow ['bus', 'clk12', 'clk48']
Message-ID: <202607122330.PnVTv7Cw-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   1db5c6b0b9834aee2f14e39764becfcc29d09ccf
commit: 713de18af511d5befff5f5b56f66c9882a3aecca [45/66] dt-bindings: usb: generic-ohci: Document clock-names in top-level
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260712 (https://download.01.org/0day-ci/archive/20260712/202607122330.PnVTv7Cw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607122330.PnVTv7Cw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607122330.PnVTv7Cw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: spi@8b1a000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: gpio@8b29000 (arm,pl061): gpio-ranges:1: [11, 71, 1] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9840000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ethernet@9841000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-gmac', 'hisilicon,hisi-gmac-v2']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/ir@8001000: failed to match any schema with compatible: ['hisilicon,hix5hd2-ir']
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: /soc@f0000000/pcie@9860000: failed to match any schema with compatible: ['hisilicon,hi3798cv200-pcie']
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): False schema does not allow ['bus', 'clk12', 'clk48']
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
>> arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: usb@9890000 (generic-ehci): False schema does not allow ['bus', 'phy', 'utmi']
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
   arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dtb: usb@9890000 (generic-ehci): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
