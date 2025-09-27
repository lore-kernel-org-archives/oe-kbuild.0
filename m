Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D44C9F
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 05:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758949765; cv=none; b=ovLnWDQgpOGvqIiTebb3oTawU3XgfP6nsae8zAthL1DNEgLKZ0I+Xc9mwx8Nuy8I4VOzrl3s18P0QNXtEyJ5ab1tMDRLOFV9qy3mZ8un5y9a3VRESG37YMuZQKZzFV03C/Pb6UdAEE76IMJvFmId28MHUeHH+UZIC4wFBLhZLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758949765; c=relaxed/simple;
	bh=TacLAR/uhfjPb7Pj4nWHvDfVP9zfqwhnX9dPfKAMU3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXlqYAvsY0+jOTd8uglN2Tdz+xIpUsVtjkL544gDRNMD8z20YiKvhUhTODyeJBmEuGfX31qfDv4f8m/IXh/hM09F5hofi258JsLdOGXk1DGsZHxu+WlpKdo8+OTquJYrsGbpibEMG8vJzcMsOdDNpBFxjFuW81oYUqcDjue4q4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvugGfuS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvugGfuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758949762; x=1790485762;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TacLAR/uhfjPb7Pj4nWHvDfVP9zfqwhnX9dPfKAMU3A=;
  b=JvugGfuSlMy7mf0M5Gz3cPs5D0Y6lWfLHLFDkELAAF9CTSOL82zlWANc
   bH3KZkZIDbduENFbXkjpbhTHF9bCy/uqlnmcRxwbf2jxFfN6Jnd7PiWGq
   A15xp6p2aRqeJoiLJHq5qrhccd4r/Y58fh/6FSwyXYRZC5EFTD+nlLFBe
   4sxXS2CidpAYIve/XQDSt4feau5y7Ds9nhogEPh/iPBR+YZGtuCtxrVng
   HF1285VRbt/qxagAWpy0l+WMW2nsHvfse56U1oX/4vQGyXtLKfMlshLQ2
   Ek060uKwsiIppYOao4VDX8Ij8JIrLbbPEUXSayM7AHFPfru9Z/F4sGEaj
   g==;
X-CSE-ConnectionGUID: alEZpE/zRamuasRyZWQUPw==
X-CSE-MsgGUID: d8xtPehOTQShgc/1s1Duxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72373585"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="72373585"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 22:09:22 -0700
X-CSE-ConnectionGUID: p3H/cHS9Q2qAyxlMA8Ew7w==
X-CSE-MsgGUID: BTj/vyIDQGShZ2SZM8hfwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="177336369"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2025 22:09:21 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2NBN-0006o7-2Y;
	Sat, 27 Sep 2025 05:09:17 +0000
Date: Sat, 27 Sep 2025 13:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/5] dt-bindings: PCI: Convert the existing
 nvidia,tegra-pcie.txt bindings documentation into a YAML schema
Message-ID: <202509271243.bqpwdre9-lkp@intel.com>
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
In-Reply-To: <20250926072905.126737-2-linux.amoon@gmail.com>
References: <20250926072905.126737-2-linux.amoon@gmail.com>
TO: Anand Moon <linux.amoon@gmail.com>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: linux-pci@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-tegra@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Anand Moon <linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/dt-bindings-PCI-Convert-the-existing-nvidia-tegra-pcie-txt-bindings-documentation-into-a-YAML-schema/20250926-153302
base:   4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
patch link:    https://lore.kernel.org/r/20250926072905.126737-2-linux.amoon%40gmail.com
patch subject: [PATCH v1 1/5] dt-bindings: PCI: Convert the existing nvidia,tegra-pcie.txt bindings documentation into a YAML schema
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm-randconfig-051-20250927 (https://download.01.org/0day-ci/archive/20250927/202509271243.bqpwdre9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271243.bqpwdre9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509271243.bqpwdre9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pll-erefe-supply', 'avddio-pex-supply', 'dvddio-pex-supply', 'hvdd-pex-pll-e-supply', 'hvdd-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra124-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra124-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: pcie@1003000 (nvidia,tegra124-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pll-erefe-supply', 'avddio-pex-supply', 'dvddio-pex-supply', 'hvdd-pex-pll-e-supply', 'hvdd-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra124-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra124-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' were unexpected)
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: pcie@1003000 (nvidia,tegra124-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: pcie@1003000 (nvidia,tegra124-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: pcie@1003000 (nvidia,tegra124-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: pcie@1003000 (nvidia,tegra124-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pll-erefe-supply', 'avddio-pex-supply', 'dvddio-pex-supply', 'hvdd-pex-pll-e-supply', 'hvdd-pex-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gk20a']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra124-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra124-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: audio-codec@1c (realtek,rt5639): Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
--
   arch/arm/boot/dts/nvidia/tegra20.dtsi:847.15-860.4: Warning (unique_unit_address_if_enabled): /usb@c5000000: duplicate unit-address (also used in node /usb-phy@c5000000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:889.15-901.4: Warning (unique_unit_address_if_enabled): /usb@c5004000: duplicate unit-address (also used in node /usb-phy@c5004000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:919.15-931.4: Warning (unique_unit_address_if_enabled): /usb@c5008000: duplicate unit-address (also used in node /usb-phy@c5008000)
   arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: /nand-controller@70008000: failed to match any schema with compatible: ['nvidia,tegra20-nand']
   arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra20-gmi']
   arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: /i2c@7000d000/tps6586x@34: failed to match any schema with compatible: ['ti,tps6586x']
   arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: pcie@80003000 (nvidia,tegra20-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: pcie@80003000 (nvidia,tegra20-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: pcie@80003000 (nvidia,tegra20-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra20-harmony.dtb: pcie@80003000 (nvidia,tegra20-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pex-supply', 'avdd-plle-supply', 'operating-points-v2', 'vdd-pex-supply', 'vddio-pex-clk-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
--
   arch/arm/boot/dts/nvidia/tegra20.dtsi:919.15-931.4: Warning (unique_unit_address_if_enabled): /usb@c5008000: duplicate unit-address (also used in node /usb-phy@c5008000)
   arch/arm/boot/dts/nvidia/tegra20-tec.dtb: /nand-controller@70008000: failed to match any schema with compatible: ['nvidia,tegra20-nand']
   arch/arm/boot/dts/nvidia/tegra20-tec.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra20-gmi']
   arch/arm/boot/dts/nvidia/tegra20-tec.dtb: /i2c@7000d000/tps6586x@34: failed to match any schema with compatible: ['ti,tps6586x']
   arch/arm/boot/dts/nvidia/tegra20-tec.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra20-tec.dtb: pcie@80003000 (nvidia,tegra20-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra20-tec.dtb: pcie@80003000 (nvidia,tegra20-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra20-tec.dtb: pcie@80003000 (nvidia,tegra20-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra20-tec.dtb: pcie@80003000 (nvidia,tegra20-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pex-supply', 'avdd-plle-supply', 'operating-points-v2', 'vdd-pex-supply', 'vddio-pex-clk-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
--
   arch/arm/boot/dts/nvidia/tegra20.dtsi:847.15-860.4: Warning (unique_unit_address_if_enabled): /usb@c5000000: duplicate unit-address (also used in node /usb-phy@c5000000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:889.15-901.4: Warning (unique_unit_address_if_enabled): /usb@c5004000: duplicate unit-address (also used in node /usb-phy@c5004000)
   arch/arm/boot/dts/nvidia/tegra20.dtsi:919.15-931.4: Warning (unique_unit_address_if_enabled): /usb@c5008000: duplicate unit-address (also used in node /usb-phy@c5008000)
   arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: /nand-controller@70008000: failed to match any schema with compatible: ['nvidia,tegra20-nand']
   arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra20-gmi']
   arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: /i2c@7000c500/codec@1a: failed to match any schema with compatible: ['ti,tlv320aic23']
   arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: pcie@80003000 (nvidia,tegra20-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: pcie@80003000 (nvidia,tegra20-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: pcie@80003000 (nvidia,tegra20-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra20-trimslice.dtb: pcie@80003000 (nvidia,tegra20-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pex-supply', 'avdd-plle-supply', 'operating-points-v2', 'vdd-pex-supply', 'vddio-pex-clk-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1154.15-1166.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: pcie@3000 (nvidia,tegra30-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: pcie@3000 (nvidia,tegra30-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: pcie@3000 (nvidia,tegra30-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: pcie@3000 (nvidia,tegra30-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pexa-supply', 'avdd-pexb-supply', 'avdd-plle-supply', 'hvdd-pex-supply', 'operating-points-v2', 'vdd-pexa-supply', 'vdd-pexb-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: pmic@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
   arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: touchscreen@41 (st,stmpe811): 'blocks', 'id', 'irq-gpio', 'irq-trigger', 'stmpe_adc', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dtb: touchscreen@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1154.15-1166.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: pcie@3000 (nvidia,tegra30-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: pcie@3000 (nvidia,tegra30-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: pcie@3000 (nvidia,tegra30-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: pcie@3000 (nvidia,tegra30-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pexa-supply', 'avdd-pexb-supply', 'avdd-plle-supply', 'hvdd-pex-supply', 'operating-points-v2', 'vdd-pexa-supply', 'vdd-pexb-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: touchscreen@41 (st,stmpe811): 'blocks', 'id', 'irq-gpio', 'irq-trigger', 'stmpe_adc', 'stmpe_touchscreen' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: touchscreen@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1154.15-1166.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: pcie@3000 (nvidia,tegra30-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: pcie@3000 (nvidia,tegra30-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: pcie@3000 (nvidia,tegra30-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: pcie@3000 (nvidia,tegra30-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pexa-supply', 'avdd-pexb-supply', 'avdd-plle-supply', 'hvdd-pex-supply', 'operating-points-v2', 'vdd-pexa-supply', 'vdd-pexb-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: rt5640@1c (realtek,rt5640): Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps65911@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps65911@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
   arch/arm/boot/dts/nvidia/tegra30-beaver.dtb: tps62361@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: pcie@3000 (nvidia,tegra30-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: pcie@3000 (nvidia,tegra30-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: pcie@3000 (nvidia,tegra30-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: pcie@3000 (nvidia,tegra30-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pexb-supply', 'avdd-plle-supply', 'hvdd-pex-supply', 'operating-points-v2', 'vdd-pexb-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: tps65911@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: tps65911@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: tps62361@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
--
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: pcie@3000 (nvidia,tegra30-pcie): 'interconnects' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: pcie@3000 (nvidia,tegra30-pcie): 'pinctrl-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: pcie@3000 (nvidia,tegra30-pcie): 'nvidia,num-lanes' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: pcie@3000 (nvidia,tegra30-pcie): Unevaluated properties are not allowed ('avdd-pex-pll-supply', 'avdd-pexb-supply', 'avdd-plle-supply', 'hvdd-pex-supply', 'operating-points-v2', 'vdd-pexb-supply', 'vddio-pex-ctl-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: tps65911@2d (ti,tps65911): 'wakeup-source' does not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: tps65911@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: tps62361@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
