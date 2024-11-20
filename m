Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFB9848C
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732066355; cv=none; b=nU1S/6usWBYNnlj5IylwShLsWUwuOtYuDVxwgYf6t91MCtWfe+ysKGPiw7kNi4ElLx8+Rfp8mg77VwvZYC2gH7JUBdCL/sBRJqikHJd+5WagAucU+GfzJEqBnEXZE0VBW9LXp6XzB/0iHpASzsw6udvc/i2Ime1KJe76ujipsdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732066355; c=relaxed/simple;
	bh=5XcFrOcX6WQyY0yprQFDgvdMnDXuBiCK9Gffc+4lcW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3OGJ4eg0cLg2XhI/H0iLrtCRULJZq9KRiBJ3EQWPfGKJ/lTNEkpYB2JP2Eo84wa58xa725dFh0ybZHdW7JwP7fum1lCTDzUBP+6rSTYktaYiDujPIe6aFezgzgcKz7E5kgeDKXmVZvKHN781m4c6z/QpvdWy4bwaPC9yxZHBrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SadOwO8Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SadOwO8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732066353; x=1763602353;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5XcFrOcX6WQyY0yprQFDgvdMnDXuBiCK9Gffc+4lcW0=;
  b=SadOwO8ZRyBSgrimXv98D/yELlnRtYniKSYOVjIlhMeu93Z837VYypJx
   1a+AkUxTDjtgqNqTVxCtJKhQN1AJ7y3gkZgxVD52eEU0oCAq+Pk3JIDfe
   eG8txFTUQeMYa0XQuqOTiP4IGnLH6F8FVB4YAhPlM1shHUTvRmJO+xIo4
   YpUyB202cdsNYbCwXGIm906R1LcUtFqiojnTqTMyHRD+J0aGbzTvlcDO2
   cz+fZg+N/gLxfHOLvmIf+YAFqY61/jAfW9fMX5K4X3cCLTyPbb9n8qE84
   4HY5lTKduWIgNOBE7iSewBlQEJEtEtOb/wj/JeKg31ytFZOHdYswwlxz4
   g==;
X-CSE-ConnectionGUID: i3AVLwqxSCGvJiJTcd2etg==
X-CSE-MsgGUID: OiJpxALKT2KHw6RswjN7Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42615180"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="42615180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:32:32 -0800
X-CSE-ConnectionGUID: SvO+Gv1vTNi5IWKZy0TVqQ==
X-CSE-MsgGUID: loJ6OFg+TRSUil2ejI3xYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="93818557"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Nov 2024 17:32:30 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZa0-0000Qf-1g;
	Wed, 20 Nov 2024 01:32:28 +0000
Date: Wed, 20 Nov 2024 09:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm: dts: broadcom: Remove unused and undocumented
 properties
Message-ID: <202411192230.Zw6nyyzO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241115193904.3624350-1-robh@kernel.org>
References: <20241115193904.3624350-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: Hauke Mehrtens <hauke@hauke-m.de>
TO: "Rafał Miłecki" <zajec5@gmail.com>
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
TO: Ray Jui <rjui@broadcom.com>
TO: Scott Branden <sbranden@broadcom.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-mem-ctrl/for-next linus/master v6.12 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm-dts-broadcom-Remove-unused-and-undocumented-properties/20241116-234241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241115193904.3624350-1-robh%40kernel.org
patch subject: [PATCH] arm: dts: broadcom: Remove unused and undocumented properties
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20241117 (https://download.01.org/0day-ci/archive/20241119/202411192230.Zw6nyyzO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411192230.Zw6nyyzO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411192230.Zw6nyyzO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['spi_lr_fullness_reached', 'spi_lr_session_aborted', 'spi_lr_impatient', 'spi_lr_session_done', 'spi_lr_overhead', 'mspi_done', 'mspi_halted'] is too long
   	'mspi_done' was expected
   	'spi_l1_intr' was expected
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
>> arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dtb: spi@27200: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
   arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dtb: timer@34000: compatible: ['arm,sp804'] is too short
   	from schema $id: http://devicetree.org/schemas/timer/arm,sp804.yaml#
   arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dtb: timer@34000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/timer/arm,sp804.yaml#
   arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dtb: timer@35000: compatible: ['arm,sp804'] is too short
   	from schema $id: http://devicetree.org/schemas/timer/arm,sp804.yaml#
   arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dtb: timer@35000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/timer/arm,sp804.yaml#
   arch/arm/boot/dts/broadcom/bcm53340-ubnt-unifi-switch8.dtb: watchdog@39000: 'clocks' is a required property
--
   	['spi_lr_fullness_reached', 'spi_lr_session_aborted', 'spi_lr_impatient', 'spi_lr_session_done', 'spi_lr_overhead', 'mspi_done', 'mspi_halted'] is too long
   	'mspi_done' was expected
   	'spi_l1_intr' was expected
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
>> arch/arm/boot/dts/broadcom/bcm958522er.dtb: spi@27200: Unevaluated properties are not allowed ('clock-names', 'interrupt-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
   arch/arm/boot/dts/broadcom/bcm958522er.dtb: usb@29000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/broadcom/bcm958522er.dtb: usb@2a000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/broadcom/bcm958522er.dtb: usb@2b000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/broadcom/bcm958522er.dtb: /axi@18000000/crypto@2f000: failed to match any schema with compatible: ['brcm,spum-nsp-crypto']
   arch/arm/boot/dts/broadcom/bcm958522er.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
   arch/arm/boot/dts/broadcom/bcm958522er.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
--
   	['spi_lr_fullness_reached', 'spi_lr_session_aborted', 'spi_lr_impatient', 'spi_lr_session_done', 'spi_lr_overhead', 'mspi_done', 'mspi_halted'] is too long
   	'mspi_done' was expected
   	'spi_l1_intr' was expected
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
>> arch/arm/boot/dts/broadcom/bcm958525er.dtb: spi@27200: Unevaluated properties are not allowed ('clock-names', 'interrupt-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
   arch/arm/boot/dts/broadcom/bcm958525er.dtb: usb@29000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/broadcom/bcm958525er.dtb: usb@2a000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/broadcom/bcm958525er.dtb: usb@2b000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/broadcom/bcm958525er.dtb: /axi@18000000/crypto@2f000: failed to match any schema with compatible: ['brcm,spum-nsp-crypto']
   arch/arm/boot/dts/broadcom/bcm958525er.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
   arch/arm/boot/dts/broadcom/bcm958525er.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
--
   	['spi_lr_fullness_reached', 'spi_lr_session_aborted', 'spi_lr_impatient', 'spi_lr_session_done', 'spi_lr_overhead', 'mspi_done', 'mspi_halted'] is too long
   	'mspi_done' was expected
   	'spi_l1_intr' was expected
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
>> arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: spi@27200: Unevaluated properties are not allowed ('clock-names', 'interrupt-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
   arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: usb@29000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: usb@2a000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: usb@2b000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: /axi@18000000/crypto@2f000: failed to match any schema with compatible: ['brcm,spum-nsp-crypto']
   arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
   arch/arm/boot/dts/broadcom/bcm958525xmc.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
--
   	['spi_lr_fullness_reached', 'spi_lr_session_aborted', 'spi_lr_impatient', 'spi_lr_session_done', 'spi_lr_overhead', 'mspi_done', 'mspi_halted'] is too long
   	'mspi_done' was expected
   	'spi_l1_intr' was expected
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
>> arch/arm/boot/dts/broadcom/bcm958622hr.dtb: spi@27200: Unevaluated properties are not allowed ('clock-names', 'interrupt-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: usb@29000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: usb@2a000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: usb@2b000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: /axi@18000000/crypto@2f000: failed to match any schema with compatible: ['brcm,spum-nsp-crypto']
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
   arch/arm/boot/dts/broadcom/bcm958622hr.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
--
   	['spi_lr_fullness_reached', 'spi_lr_session_aborted', 'spi_lr_impatient', 'spi_lr_session_done', 'spi_lr_overhead', 'mspi_done', 'mspi_halted'] is too long
   	'mspi_done' was expected
   	'spi_l1_intr' was expected
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
>> arch/arm/boot/dts/broadcom/bcm958623hr.dtb: spi@27200: Unevaluated properties are not allowed ('clock-names', 'interrupt-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: usb@29000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: usb@2a000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: usb@2b000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: /axi@18000000/crypto@2f000: failed to match any schema with compatible: ['brcm,spum-nsp-crypto']
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
   arch/arm/boot/dts/broadcom/bcm958623hr.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
--
   	['spi_lr_fullness_reached', 'spi_lr_session_aborted', 'spi_lr_impatient', 'spi_lr_session_done', 'spi_lr_overhead', 'mspi_done', 'mspi_halted'] is too long
   	'mspi_done' was expected
   	'spi_l1_intr' was expected
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
>> arch/arm/boot/dts/broadcom/bcm958625hr.dtb: spi@27200: Unevaluated properties are not allowed ('clock-names', 'interrupt-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: usb@29000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: usb@2a000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: usb@2b000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: /axi@18000000/crypto@2f000: failed to match any schema with compatible: ['brcm,spum-nsp-crypto']
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
   arch/arm/boot/dts/broadcom/bcm958625hr.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
--
   	['spi_lr_fullness_reached', 'spi_lr_session_aborted', 'spi_lr_impatient', 'spi_lr_session_done', 'spi_lr_overhead', 'mspi_done', 'mspi_halted'] is too long
   	'mspi_done' was expected
   	'spi_l1_intr' was expected
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
>> arch/arm/boot/dts/broadcom/bcm988312hr.dtb: spi@27200: Unevaluated properties are not allowed ('clock-names', 'interrupt-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: usb@2a000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: usb@2b000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: /axi@18000000/crypto@2f000: failed to match any schema with compatible: ['brcm,spum-nsp-crypto']
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
   arch/arm/boot/dts/broadcom/bcm988312hr.dtb: ethernet-switch@36000: ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml#
--
   	['spi_lr_fullness_reached', 'spi_lr_session_aborted', 'spi_lr_impatient', 'spi_lr_session_done', 'spi_lr_overhead', 'mspi_done', 'mspi_halted'] is too long
   	'mspi_done' was expected
   	'spi_l1_intr' was expected
   	'mspi_halted' was expected
   	'spi_lr_fullness_reached' was expected
   	'spi_lr_session_aborted' was expected
   	'spi_lr_impatient' was expected
   	'spi_lr_session_done' was expected
   	'spi_lr_overread' was expected
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
>> arch/arm/boot/dts/broadcom/bcm958625k.dtb: spi@27200: Unevaluated properties are not allowed ('clock-names', 'interrupt-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/brcm,spi-bcm-qspi.yaml#
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: usb@29000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: usb@2a000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: usb@2b000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: /axi@18000000/crypto@2f000: failed to match any schema with compatible: ['brcm,spum-nsp-crypto']
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']
   arch/arm/boot/dts/broadcom/bcm958625k.dtb: /axi@18000000/gpio@30000: failed to match any schema with compatible: ['brcm,iproc-nsp-gpio', 'brcm,iproc-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
