Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85BD515
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 04:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731818636; cv=none; b=bbmGJ7llkXaAEx2AIDh9KAoviRlA9CQMG3iCk44DpG898Wjibuhd3C0gwHxAwIhyYA2JxTPtRYNxD1TX1dYmvQGeuw7vDZb5eWY4QJ7pBO94wwu8IOWB1fERCNVE5GDzyhrLUcZnq/rBbk00gnARdfCcyCX9oIzUDGQnDOwbSAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731818636; c=relaxed/simple;
	bh=6xerNpGvj8m73dJNmqvC6Gt2N3s1rMoGEeeYhl0wVMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qvacdqwiuv2Oq2yhZ8o2GHs0+82uifylVvCCwYDSTQsVT+LnY3oyu2OaJx7t4S9ki+sETQ7t7Ixx5Im60E/E1D1gbGwJhkC1TY9xIDv+xWDdBd1bbLmws9bhB5/pyKhiOP8YmfOms/r5lX65YCNuIbgGuQ+nKyJloVifZQS8QI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jASWR+/3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jASWR+/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731818634; x=1763354634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6xerNpGvj8m73dJNmqvC6Gt2N3s1rMoGEeeYhl0wVMs=;
  b=jASWR+/3kDrf1n4RgdglMdHhoNFLSORQ2V9QM30XA8uQvdNZ7MCT7hBY
   DuBPTVfVYQapuwZj0qdCnQDh45tfML3/OX0qdDK9W38VU+B2mIUkeNqt0
   KFkoG+6SP8aIGhm+Mw9xRhNfInCHI/0saRjfZfCF5OSTZ64qmML+kOt2I
   EkUsAH2yUZYVkZScS9d2fgEElIbinbFcHkxbESo/qRrqBrVQvUTLmF0RB
   WwmQAoaY9jB1v4oSrnX58xnwYm9lS1tsdV8iDF2FNbOf0mBByCbHcgjpx
   RiEeC3sVFzEPcql1hJYW4oUstnYM10GT9VEkiF5shyniQ5ITUGhnPcpMe
   A==;
X-CSE-ConnectionGUID: pa2Ok9beQ6CPNm2jdaNdig==
X-CSE-MsgGUID: pP1w/cg5TXO0Xvl4EcMVEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54292192"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="54292192"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 20:43:53 -0800
X-CSE-ConnectionGUID: kkQX7SmHRYiobmlWfJH+5w==
X-CSE-MsgGUID: Ak75iWDFQnWgcAvX8BX3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="119851130"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Nov 2024 20:43:52 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCX8Y-0001UT-0O;
	Sun, 17 Nov 2024 04:43:50 +0000
Date: Sun, 17 Nov 2024 12:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: broadcom: Remove unused and undocumented
 properties
Message-ID: <202411171222.NZSELzIy-lkp@intel.com>
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
In-Reply-To: <20241115193854.3624123-1-robh@kernel.org>
References: <20241115193854.3624123-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Ray Jui <rjui@broadcom.com>
TO: Scott Branden <sbranden@broadcom.com>
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm64-dts-broadcom-Remove-unused-and-undocumented-properties/20241116-230054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241115193854.3624123-1-robh%40kernel.org
patch subject: [PATCH] arm64: dts: broadcom: Remove unused and undocumented properties
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-052-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171222.NZSELzIy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171222.NZSELzIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411171222.NZSELzIy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi:80.27-84.5: Warning (unit_address_vs_reg): /cpus/l2-cache@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi:194.11-763.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi:35.18-39.4: Warning (simple_bus_reg): /soc/oscillator: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi:80.21-86.4: Warning (simple_bus_reg): /soc/iprocmed: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi:88.23-94.4: Warning (simple_bus_reg): /soc/iprocslow: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi:48.16-54.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@0: duplicate unit-address (also used in node /cpus/l2-cache@0)
>> arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: pcie@20020000: Unevaluated properties are not allowed ('brcm,pcie-ob-oarr-size' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/brcm,iproc-pcie.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: pcie@50020000: Unevaluated properties are not allowed ('brcm,pcie-ob-oarr-size' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/brcm,iproc-pcie.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: soc: iprocmed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: soc: oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: soc: iprocslow: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: ethernet@61000000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
--
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: at25@0: $nodename: 'anyOf' conditional failed, one must be fixed:
   	'at25@0' does not match '^eeprom@[0-9a-f]{1,2}$'
   	'at25@0' does not match '^fram@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: at25@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: at25@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: at25@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
>> arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: at25@0: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: sdhci@66420000: $nodename:0: 'sdhci@66420000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: sdhci@66420000: Unevaluated properties are not allowed ('bus-width', 'dma-coherent' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: sdhci@66430000: $nodename:0: 'sdhci@66430000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: sdhci@66430000: Unevaluated properties are not allowed ('bus-width', 'dma-coherent' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: nand@66460000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnand-v7.1']
   	'brcm,nand-bcm6368' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: nand@66460000: $nodename:0: 'nand@66460000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: nand@66460000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nandcs@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
>> arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dtb: spi@66470200: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
--
   arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi:80.27-84.5: Warning (unit_address_vs_reg): /cpus/l2-cache@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi:194.11-763.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi:35.18-39.4: Warning (simple_bus_reg): /soc/oscillator: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi:80.21-86.4: Warning (simple_bus_reg): /soc/iprocmed: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/northstar2/ns2-clock.dtsi:88.23-94.4: Warning (simple_bus_reg): /soc/iprocslow: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi:48.16-54.5: Warning (unique_unit_address_if_enabled): /cpus/cpu@0: duplicate unit-address (also used in node /cpus/l2-cache@0)
>> arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: pcie@20020000: Unevaluated properties are not allowed ('brcm,pcie-ob-oarr-size' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/brcm,iproc-pcie.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: soc: oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: soc: iprocslow: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: soc: iprocmed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: ethernet@61000000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/brcm,amac.yaml#
   arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dtb: /soc/iproc-pdc0@612c0000: failed to match any schema with compatible: ['brcm,iproc-pdc-mbox']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
