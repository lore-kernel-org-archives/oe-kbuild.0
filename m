Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C951D61A4
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Mar 2025 21:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742334249; cv=none; b=YVF3D6oCh7Qj0O98+hfEXBZuoAYN33rMf1v2udZzY7DUKOaT1pcusssNYCamRNkajA3u2V6ERo10lJxOm7hgtJIwbTdxwHXdeUbI9uwzjMJHeR/1rTSqJOWfw7qCzvEsq2PdZKyl9u4OkBmHqr4cDLgOchFMIgIRI3IDtsjQIRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742334249; c=relaxed/simple;
	bh=GOjd7ER1PCy0xI8W+5M+yF0H+GyTNEtj8/U9vEV9QHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iP5K6qyzhYCyQYZGF7hNz8sTrCQqs80O6P7Ah9udkg+u+y3CtUnEYgPXqrgeDSBr1zE0BZNl2R9jSsneFbb+8hG1EjmrpMh1MK4FmwLcs9xNbE6FeckLGaixnGjgEvAiZavMaZvLmrMgojvYebq+ZVzW/isiMJQ9v0mDzzwplW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmmQfhbo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmmQfhbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742334248; x=1773870248;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GOjd7ER1PCy0xI8W+5M+yF0H+GyTNEtj8/U9vEV9QHs=;
  b=jmmQfhboNYYhgcFVS8ShzDSJD5APZQ3CEF7eCDZMw5HuhPIrXycCi2cF
   uxH8w37BcQsd2e++zK6ZQEk7f2Tllc9gAMAqSee+VSdTChL8sO9HnoXWB
   KeuMdNw41bQ5Z2jYbfRuvmFA+1/RYfjMy17KcfsfHRsfiXgjokWKToEGC
   E/+vZsY+2Z6wsVBUqC+I0s0oMo0BcBr0U+t/g77pJOBAHTK8efewouOg1
   HRnSt+TJFcwZLvUv55M5lDWndPPvU7O1wcjUetn5m3cpavvcMHTDy5g1O
   GFipX/b7PxYMtxFFLFRYVsaM5GGZzM0z8OZlpH1bhr6f9YJosOYNp3JLH
   Q==;
X-CSE-ConnectionGUID: KnG10TgnQXmCL77e47pxVQ==
X-CSE-MsgGUID: GJXoo6R7T4urW4L5W1sPlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54883481"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="54883481"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 14:44:07 -0700
X-CSE-ConnectionGUID: XKpBjh5jTGmwUuYwLbSlUg==
X-CSE-MsgGUID: fCkqP5LWTDS/BZymyXwx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122561245"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Mar 2025 14:44:06 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuej7-000EBu-27;
	Tue, 18 Mar 2025 21:44:00 +0000
Date: Wed, 19 Mar 2025 05:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
Message-ID: <202503190436.Zp8vFLPt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
References: <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Crystal Wood <oss@buserror.net>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Naveen N Rao <naveen@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-mtd@lists.infradead.org
CC: linuxppc-dev@lists.ozlabs.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/dt-bindings-mtd-raw-nand-chip-Relax-node-name-pattern/20250314-053651
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250313-ppcyaml-elbc-v4-1-55903722d9ea%40posteo.net
patch subject: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name pattern
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20250315 (https://download.01.org/0day-ci/archive/20250319/202503190436.Zp8vFLPt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190436.Zp8vFLPt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503190436.Zp8vFLPt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: ohci@500000: Unevaluated properties are not allowed ('clock-names', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: /ahb/ohci@500000: failed to match any schema with compatible: ['atmel,at91rm9200-ohci', 'usb-ohci']
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,at91sam9260-ebi']
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,at91sam9260-nand-controller']
>> arch/arm/boot/dts/microchip/at91sam9260ek.dtb: nand@40000000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
>> arch/arm/boot/dts/microchip/at91sam9260ek.dtb: nand@40000000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: i2c-gpio-0: 'sda-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: i2c-gpio-0: 'scl-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: ohci@500000: Unevaluated properties are not allowed ('clock-names', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: /ahb/ohci@500000: failed to match any schema with compatible: ['atmel,at91rm9200-ohci', 'usb-ohci']
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,at91sam9260-ebi']
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,at91sam9260-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: nand@40000000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: nand@40000000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: i2c-gpio-0: 'sda-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: i2c-gpio-0: 'scl-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
