Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2386BFCE
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Jul 2025 22:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752273929; cv=none; b=G/Qpr3+mu85rsTRqVxsLAsbDtmSUgH2tU1/2KD9JBAe1m79jChplELaGaq0dj5uWcUBhDpDTzgtDJxRvebX13DZKUGa2PJLT35uSXaeN6xQD9XJ1dPY7yhHSDFTn7a7ZewFaA5kXmvYAQVbds7OBoDHgElH5UIcmMIsNSHYLMZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752273929; c=relaxed/simple;
	bh=xto4VkAg6jyhQDEWIRf9Wpn7r391Utc6aLiRXpPJyC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AInkVkiZd1pkbtEJqqG7RMaJtY3Un5xVQN4TaTuKT+F9hVBWG7gbVj1yIJpnr5rph0XM/fnxPwNMVTqNxuGk4K6ixcQmcZcubnvp8J/oYWQwOEdynY4+PKMNrAezp6qdZE5GKKwOqAe1RF8RrSy4gHyE24+MSza6sLocPuoj9so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4OwnAo3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4OwnAo3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752273928; x=1783809928;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xto4VkAg6jyhQDEWIRf9Wpn7r391Utc6aLiRXpPJyC4=;
  b=K4OwnAo3gznq92djW7FCDlgNuCztFe+xbSxpvrXcYqaezvuPlxPZNALu
   3dNVAuzh7iGDodx80B/o/KxLoNO8SB/60IDIr1Xb5Is36BQHuMqjwdcfb
   B+kOO8TZ7iBGUwSVpJG8nNyGh0D0TK+ATrysaICWUVMF/dCFfbkdSuyqn
   kUVcoiX2vD9ogJo9FAfIUE0PVI/FvZC0Z1tnGYtIkPR/JJ0CKfZtfAKVU
   phTnCSgu4okz24shuFr2xoWMhLa1qlSkJglDrmaHqoDdfhcedlBPl6OFa
   5GwWiuXqB5I4+NrbMjmHDqOblSJj0T+b7PqoTM4Pxaxs3WB8wWQBo0tCQ
   g==;
X-CSE-ConnectionGUID: bMVOd20dTre9dRkLVFEnnA==
X-CSE-MsgGUID: EJNGCqQJTdexDzTtFZW1xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54445545"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="54445545"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 15:45:27 -0700
X-CSE-ConnectionGUID: gNA+xwYoQ5+bpZ9/78OI8g==
X-CSE-MsgGUID: rnpF2IXoQKyRwdr0c8bF/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="187463828"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jul 2025 15:45:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaMUd-0006rj-1b;
	Fri, 11 Jul 2025 22:45:23 +0000
Date: Sat, 12 Jul 2025 06:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: PCI: Convert apm,xgene-pcie to DT schema
Message-ID: <202507120648.NsLN9DvQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250710180749.2970379-1-robh@kernel.org>
References: <20250710180749.2970379-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Toan Le <toan@os.amperecomputing.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-pci@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-PCI-Convert-apm-xgene-pcie-to-DT-schema/20250711-021058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250710180749.2970379-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: PCI: Convert apm,xgene-pcie to DT schema
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20250711 (https://download.01.org/0day-ci/archive/20250712/202507120648.NsLN9DvQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120648.NsLN9DvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507120648.NsLN9DvQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmuiob@7e940000: failed to match any schema with compatible: ['apm,xgene-pmu-iob']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmcb@7e710000: failed to match any schema with compatible: ['apm,xgene-pmu-mcb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmcb@7e730000: failed to match any schema with compatible: ['apm,xgene-pmu-mcb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e810000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e850000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e890000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e8d0000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: pcie@1f2b0000 (apm,xgene-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apm,xgene-pcie', 'apm,xgene2-pcie'] is too long
   	'apm,xgene-storm-pcie' was expected
   	'apm,xgene-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/apm,xgene-pcie.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2b0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: pcie@1f2c0000 (apm,xgene-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apm,xgene-pcie', 'apm,xgene2-pcie'] is too long
   	'apm,xgene-storm-pcie' was expected
   	'apm,xgene-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/apm,xgene-pcie.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2c0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a000000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a200000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a400000: failed to match any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: mmc@1c000000 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
