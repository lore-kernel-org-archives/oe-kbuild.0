Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9673C1DF967
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Feb 2025 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739117655; cv=none; b=W4NJhb16v8sid0kCjK0oHcFiae6a269LKZ3m1TJmGhQ1GL9NUbdYGHkaWuDoCFvcroOzp/aPtUdFkBN5KISKkYqvFj7pJ3dX4yoVYfzZrbvn35ApcoN9H/jfLofvw3lrNu93ajBYykpGEi1BSZ9JiciKdRhdeIU3OLLcob7eRgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739117655; c=relaxed/simple;
	bh=hzGpKsMEuXLwxPHlP81FX3+peSgfKpPP62GlYU7BZ04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YfJnDuGEoU+x0bwxz1k8zTvIZJK1xOHfT9dhCX5jOj80aSNx2eOm9LHYc2CrSE4wZ/1pYkPBSTZfz4G5am8t1vWCRT0zUGBF9RxeHkeaR/5SSZcuHT02m5tF8foQoQnyrwLJWeNKS1TUDaf12aDbBHJJqwck+PyWS4gTZWXErA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7ciUsOU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7ciUsOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739117651; x=1770653651;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hzGpKsMEuXLwxPHlP81FX3+peSgfKpPP62GlYU7BZ04=;
  b=e7ciUsOUgQEBm14+zJdrT95oYX5VbrUEniqq8sG1r14RLNDHHMt4L29M
   sYS49xm2PtV9N+GKtv3iEx40O0PpSEAhq0Tc4jvd9T+MC4NoiJodNx6WV
   jvw9J7+UB3PI2QLdhA0/Bt6XosW8h89Om6WnPR8UTDUFbul/rALHD/bcD
   RnGcavfhOG1ril0PpMXAesIhnKaTTVbuUrCY/p/CrdYzQaqyjjwe4t/LH
   yGrRef3xVEcrd7kRKeHpXd3cWs6jwRaz8qGaZ2gli/T8KiFlisGCmz/ky
   ellTH9Lgh4LlTNPVsHdcQCiu91SltejK7+SITaOtXzANot6cXDBQNCI1S
   Q==;
X-CSE-ConnectionGUID: sIG2skUlQYGo6bkhirfnpA==
X-CSE-MsgGUID: kQov1EfzQx6ncWmdnhzLgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57235995"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="57235995"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 08:14:09 -0800
X-CSE-ConnectionGUID: glxr4gx9TFWS5pQDbPvXnA==
X-CSE-MsgGUID: f5FKgPSMTYWGOyvBTfbzcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="112482644"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2025 08:14:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th9wb-0011fL-0t;
	Sun, 09 Feb 2025 16:14:05 +0000
Date: Mon, 10 Feb 2025 00:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 02/12] dt-bindings: ata: Convert fsl,pq-sata to YAML
Message-ID: <202502092306.QXTtqDgE-lkp@intel.com>
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
In-Reply-To: <20250207-ppcyaml-v2-2-8137b0c42526@posteo.net>
References: <20250207-ppcyaml-v2-2-8137b0c42526@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: devicetree@vger.kernel.org
TO: linuxppc-dev@lists.ozlabs.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: imx@lists.linux.dev
CC: Scott Wood <oss@buserror.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Naveen N Rao <naveen@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: Niklas Cassel <cassel@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Lee Jones <lee@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: "Krzysztof Wilczyński" <kw@linux.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: "J. Neuschäfer" <j.neuschaefer@gmx.net>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Mark Brown <broonie@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: linux-kernel@vger.kernel.org
CC: linux-ide@vger.kernel.org

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/dt-bindings-powerpc-Add-Freescale-NXP-MPC83xx-SoCs/20250208-053519
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250207-ppcyaml-v2-2-8137b0c42526%40posteo.net
patch subject: [PATCH v2 02/12] dt-bindings: ata: Convert fsl,pq-sata to YAML
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-051-20250208 (https://download.01.org/0day-ci/archive/20250209/202502092306.QXTtqDgE-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502092306.QXTtqDgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502092306.QXTtqDgE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/mpc8377_rdb.dtb: sata@18000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/mpc8377_rdb.dtb: sata@18000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: sata@19000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: sata@19000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8377-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8377-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8349-pci']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8377-pcie', 'fsl,mpc8314-pcie']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: sata@18000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: sata@18000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: sata@19000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: sata@19000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8377-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8377-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8349-pci']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8377-pcie', 'fsl,mpc8314-pcie']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: serial@4600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@18000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@18000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@19000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@19000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@1a000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@1a000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@1b000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: sata@1b000: 'sleep' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8379-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8379-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8349-pci']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: leds: 'hdd', 'pwr' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: crypto@300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.2', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.2', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v4.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
--
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000: ethernet@e0000: Unevaluated properties are not allowed ('fixed-link', 'phy-mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: fman@400000: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
--
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: crypto@300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.2', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.2', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v4.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: crypto@300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.2', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.2', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v4.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: crypto@300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.2', 'fsl,sec-v4.0'] is too short
   	['fsl,sec-v4.2', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v4.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: crypto@300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v5.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: crypto@300000: rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: crypto@300000: rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic-memory', 'fsl,sec-v4.0-rtic-memory'] is too short
--
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl,sec-v4.0-mon' was expected
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v5.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: sec_mon@314000: interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/l2-cache-controller@c20000: failed to match any schema with compatible: ['fsl,t2080-l2-cache-controller']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe240000: pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pcie@ffe240000: pcie@0:interrupts:0: [20, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
--
   	'fsl,sec-v4.0-mon' was expected
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v5.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: sec_mon@314000: interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/l2-cache-controller@c20000: failed to match any schema with compatible: ['fsl,t2080-l2-cache-controller']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: sata@220000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: sata@221000: 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe240000: pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pcie@ffe240000: pcie@0:interrupts:0: [20, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /pcie@ffe240000: failed to match any schema with compatible: ['fsl,t2080-pcie', 'fsl,qoriq-pcie-v3.0', 'fsl,qoriq-pcie']
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
--
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: sata@220000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: sata@221000: 'cell-index' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/fsl,pq-sata.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
