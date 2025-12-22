Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61A17BB21
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392819; cv=none; b=hMMdF5DSe1OSirj/Dc8WlWCraI31fnxu8dLTrr8Rh6pJZtI5Je3rgmNHtp/3szrhwOCxhbO63vqzAYF7M8qC7O4ulh5p+e3+dVJFL9HmpnWpe0DrDeCyHeEeWNZyvQxKCMGzKz1QLUxkn17lpXyt5NG/RCwpCx7BdlxVQMKH31E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392819; c=relaxed/simple;
	bh=CeHebcaxzu9NO022EYtwCHUAZpUmVrU9oTFg1Pl2tOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WZtbWHwJs69mIdjGSRqgbHqCipa+vVnrnRBxGrkEGVryTB1dTOrPZYXqua+wDYz0B8WgJeH1fFnYsIjNdb44Vmacum0suW4YtzoMSar17bsYXB2n16oIg6cKbj326DNbWzedZCcx4RFpDdYr2CYcrJw+ctPuRZq4oZ7WbIksvJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yw9SHErt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yw9SHErt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766392817; x=1797928817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CeHebcaxzu9NO022EYtwCHUAZpUmVrU9oTFg1Pl2tOw=;
  b=Yw9SHErtc39jx9DkeOHeGH1ygQE+rNKC2Z5Tx5F4JM0NasSDALrKJOzP
   ramJ53Q73AFnSZm/Ncwm/4Vr634+ypmFfuNvdSHV3Aw4Newb83pcRkWDW
   rGE5rHXIqZBFBk7cGARF5xKThEGbXUmTnxsj8m37tybdiyypIncESRhEe
   2uFwuSQ+bT9fX8i5jEV6Fiv+H/nIxJB3whMTUoAZz2ijaVFY7UmOA8Aow
   VWVty3kEQzGvZDnyrA0slBiixxdVJtxFkA2zaJvpIALgTG66I+zIJDa4y
   4Hla5bi4eX/7W/V9Ay2n6gSa6f4uMMhk8FIy6t6Pr1Ws0jd73iS6qpaJS
   Q==;
X-CSE-ConnectionGUID: yHR567P4RO6ccIDkVyx43w==
X-CSE-MsgGUID: u4RWSWcVReypK1ni2O8qnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72106239"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72106239"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:40:17 -0800
X-CSE-ConnectionGUID: 0T+EyZXsRLmp37J0DeoZCQ==
X-CSE-MsgGUID: tETT9UKRTBGWTWgKhNwXZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="200362973"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Dec 2025 00:40:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXbSf-000000005PY-3MpU;
	Mon, 22 Dec 2025 08:40:13 +0000
Date: Mon, 22 Dec 2025 09:39:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: Allow "dma-coherent"
 and "iommus" properties
Message-ID: <202512220920.eVprMmkM-lkp@intel.com>
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
In-Reply-To: <20251215212736.3321550-1-robh@kernel.org>
References: <20251215212736.3321550-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next linus/master v6.19-rc2]
[cannot apply to next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-mmc-brcm-iproc-sdhci-Allow-dma-coherent-and-iommus-properties/20251216-053208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251215212736.3321550-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: Allow "dma-coherent" and "iommus" properties
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20251216 (https://download.01.org/0day-ci/archive/20251222/202512220920.eVprMmkM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220920.eVprMmkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512220920.eVprMmkM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: at25@0 (atmel,at25): 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: at25@0 (atmel,at25): 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
   	'at25@0' does not match '^eeprom@[0-9a-f]{1,2}$'
   	'at25@0' does not match '^fram@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: sdhci@66420000 (brcm,sdhci-iproc-cygnus): $nodename:0: 'sdhci@66420000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
>> arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: sdhci@66420000 (brcm,sdhci-iproc-cygnus): Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: sdhci@66430000 (brcm,sdhci-iproc-cygnus): $nodename:0: 'sdhci@66430000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: sdhci@66430000 (brcm,sdhci-iproc-cygnus): Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: nand@66460000 (brcm,nand-iproc): $nodename:0: 'nand@66460000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: nand@66460000 (brcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
--
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: nand@360000 (brcm,nand-iproc): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nandcs@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: sdhci@3f1000 (brcm,sdhci-iproc): $nodename:0: 'sdhci@3f1000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
>> arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: sdhci@3f1000 (brcm,sdhci-iproc): Unevaluated properties are not allowed ('bus-width', 'full-pwr-cycle', 'mmc-ddr-1_8v', 'non-removable', 'vqmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: sdhci@3f2000 (brcm,sdhci-iproc): $nodename:0: 'sdhci@3f2000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
>> arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: sdhci@3f2000 (brcm,sdhci-iproc): Unevaluated properties are not allowed ('bus-width', 'full-pwr-cycle', 'vqmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: tmons (simple-bus): $nodename:0: 'tmons' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: nic-hsls (simple-bus): $nodename:0: 'nic-hsls' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dtb: i2c@60826100 (brcm,iproc-nic-i2c): reg: [[1619157248, 256], [1625293832, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
--
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: nand@360000 (brcm,nand-iproc): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nandcs@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: sdhci@3f1000 (brcm,sdhci-iproc): $nodename:0: 'sdhci@3f1000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
>> arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: sdhci@3f1000 (brcm,sdhci-iproc): Unevaluated properties are not allowed ('bus-width', 'full-pwr-cycle', 'mmc-ddr-1_8v', 'non-removable', 'vqmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: sdhci@3f2000 (brcm,sdhci-iproc): $nodename:0: 'sdhci@3f2000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
>> arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: sdhci@3f2000 (brcm,sdhci-iproc): Unevaluated properties are not allowed ('bus-width', 'full-pwr-cycle', 'vqmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: tmons (simple-bus): $nodename:0: 'tmons' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: nic-hsls (simple-bus): $nodename:0: 'nic-hsls' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958742t.dtb: i2c@60826100 (brcm,iproc-nic-i2c): reg: [[1619157248, 256], [1625293832, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
--
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'brcm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: sdhci@3f1000 (brcm,sdhci-iproc): $nodename:0: 'sdhci@3f1000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
>> arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: sdhci@3f1000 (brcm,sdhci-iproc): Unevaluated properties are not allowed ('bus-width', 'full-pwr-cycle', 'no-1-8-v', 'non-removable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: sdhci@3f2000 (brcm,sdhci-iproc): $nodename:0: 'sdhci@3f2000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: tmons (simple-bus): $nodename:0: 'tmons' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: nic-hsls (simple-bus): $nodename:0: 'nic-hsls' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: i2c@60826100 (brcm,iproc-nic-i2c): reg: [[1619157248, 256], [1625293832, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
