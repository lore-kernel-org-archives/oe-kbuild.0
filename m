Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD43C256D
	for <oe-kbuild@lists.linux.dev>; Sat, 17 May 2025 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747444799; cv=none; b=kkb7/j3CnpZnMUv4tEKQ8mQaBcAEVSnD/BcUb2C2J+fWeSZnWYJd/BaJuTX+74f6aDShXFXrPm5eXFSRC/hAkp9D3HGHhxG7YRe+S7ptFDpsU+WslJ4XP9jVVrr/hUozVisanuphVfU5WJPER+ycELkhGj6VhyC/54zl0zOPXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747444799; c=relaxed/simple;
	bh=86/E5M4tm+wMmyq+YA6AzqXNhl3UBza7QiQtjYOIIJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rk1AozNJfWB0i5gHrxa7dr52bAUtGiGWfFGhKn18b0B0ZSgHcPUiebIIHoMqn0oVzcWYjlHAQbCJyNAVjukCZbBuQdfmf15ZnaurPGWrbqCsoepra0vfbcP2pymqV/drGivXE5IMYx8+PwSi7QVkzLbNWD+wJQ3UaCHBMsvRU7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5U9VV0W; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5U9VV0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747444797; x=1778980797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=86/E5M4tm+wMmyq+YA6AzqXNhl3UBza7QiQtjYOIIJM=;
  b=I5U9VV0WsLS9qOz3+CC58xsZOg9ewDjTpHDVk0QA+MBM0bhFHt/bfvkC
   SWbuQLIG4hb0/JcE6yR08K/6GRNZlAArgKe1X5+ixn5p3bvu22o0GLWj1
   AxrRjkMahou0bTx6MqwKjBQp+YFfV88PlKCmnyLfO4ncO6Dp0D83+8SoL
   kNutVocIvou8ywhxVZggCcMbBH/AMcBL+N1IvdD9nFpbRFYxkDld5R6Cz
   7+UWh+cJ7GIqr7PS5ng4MPz9RYFDoHhiCKvYgv+z7wbxEqY9NNJHE1NLP
   3O4RdD4a12PSTq59ckBANrAMOB+ay14zzN5NMBzm1ERYDGCbJnsDzs+pD
   Q==;
X-CSE-ConnectionGUID: mo33OeqETJSruqpZ7v1yPA==
X-CSE-MsgGUID: 4yzKp1+BSPed9mnqayzbow==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49495374"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49495374"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 18:19:57 -0700
X-CSE-ConnectionGUID: 8ndkf8CBQl+ug/5nhyNpMg==
X-CSE-MsgGUID: VXy2vZxhSPmf7xJcQEt7SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="144092877"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 May 2025 18:19:56 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG6DR-0000Tn-2D;
	Sat, 17 May 2025 01:19:53 +0000
Date: Sat, 17 May 2025 09:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:i2c/boardinfo_of_node 2/5]
 arch/arm/boot/dts/microchip/at91sam9g20ek.dtb: /i2c-gpio0/wm8731@1b: failed
 to match any schema with compatible: ['wm8731']
Message-ID: <202505170934.O2AbWdKL-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

Hi Wolfram,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/boardinfo_of_node
head:   f93e1bf4b83cdd19f5db0c551bd4fd10ba8d97d5
commit: e4c7c9d8c53bdfe98bf5c243bd0bf7f2f435ded4 [2/5] WIP2
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-2051-20250516 (https://download.01.org/0day-ci/archive/20250517/202505170934.O2AbWdKL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170934.O2AbWdKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505170934.O2AbWdKL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91sam9g20ek.dtb: usb@500000 (atmel,at91rm9200-ohci): Unevaluated properties are not allowed ('clock-names', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91sam9g20ek.dtb: /ahb/usb@500000: failed to match any schema with compatible: ['atmel,at91rm9200-ohci', 'usb-ohci']
   arch/arm/boot/dts/microchip/at91sam9g20ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,at91sam9260-ebi']
   arch/arm/boot/dts/microchip/at91sam9g20ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,at91sam9260-nand-controller']
   arch/arm/boot/dts/microchip/at91sam9g20ek.dtb: nand-controller (atmel,at91sam9260-nand-controller): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91sam9g20ek.dtb: nand-controller (atmel,at91sam9260-nand-controller): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/microchip/at91sam9g20ek.dtb: /i2c-gpio0/wm8731@1b: failed to match any schema with compatible: ['wm8731']
--
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dtb: usb@500000 (atmel,at91rm9200-ohci): Unevaluated properties are not allowed ('clock-names', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dtb: /ahb/usb@500000: failed to match any schema with compatible: ['atmel,at91rm9200-ohci', 'usb-ohci']
   arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,at91sam9260-ebi']
   arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,at91sam9260-nand-controller']
   arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dtb: nand-controller (atmel,at91sam9260-nand-controller): #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dtb: nand-controller (atmel,at91sam9260-nand-controller): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dtb: /i2c-gpio0/wm8731@1b: failed to match any schema with compatible: ['wm8731']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
