Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF22D63EB
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751488754; cv=none; b=a8D7eLBPuSrfjr5DTMEzDxkeYNS5nG38FWEKom3WG3BvtIeH3zgRYBkqH7wcJXnZFeLZTXJgTG3Cwod+aR7QTXFajFjH9v9FCrcrB1zr1Zxt6tcBCb2H/jN2FH0M9y+Vd9y1sJXDoTbpsjKKGhGuL4BLcAc3LFqBbVg0J/dyqjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751488754; c=relaxed/simple;
	bh=/oc/p81P5wa2yvAQfZN8snLvxBoc+8kxt1ZXwtC/WAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZK9FqkSoKfKXwuKjX4WbxpU/Whg2IPiMrpHe45kHkmIIGmYF5tIc/mWGmEr0LYZr0vHlb57oa9KKtp251hsRzxOgmev3dsfKbzz/WlQtGWd6NDWrEqY+Mp/xfwNstgBBgT/epqYIaJYpr4w0M1ePOPacoMnHSGr8MwYvZpB6R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVXjolCr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVXjolCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751488750; x=1783024750;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/oc/p81P5wa2yvAQfZN8snLvxBoc+8kxt1ZXwtC/WAc=;
  b=lVXjolCrruGBEvou/O4WAvp3C/ZuDUTt3pQmj8iOQFo/gO9W1YWnHYeV
   9s9mRFFiVDhhd1LODllYA1dklc52Uh0Rtk8fCIFjESoZrNSkBtpsu25r2
   IadXF8wcX6t1Qwhdn+NHBcgJ5ySYv6CwMKKkAHWkPBU2SpTU27MpW+B0Z
   JhwyxpR/8gpEFhGA0S3IFP1VqiETmeyk5aqhr4MGdNcHwKKT1Xa83iCP6
   XR7CL9wdymmjGR1hX0f0FbTmY6w+rdth8F52/uZUH02z8Ys9UmFDBZdZP
   Co+Q+SG2W6Cu0NHRo4T4hwUdXQgJON4/FJGxmCOzz2sqPcT2IXwG/qFTD
   A==;
X-CSE-ConnectionGUID: yUKaFDGfS5m17fNaVZA4wg==
X-CSE-MsgGUID: FitnpxZdTqGfYC4Xs76tZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41429138"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="41429138"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 13:39:09 -0700
X-CSE-ConnectionGUID: YhTfj9ewSvOu47iiNaubog==
X-CSE-MsgGUID: zOv7dwTqR02atVkl/pQaMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="153627384"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jul 2025 13:39:09 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX4ET-00013r-37;
	Wed, 02 Jul 2025 20:39:05 +0000
Date: Thu, 3 Jul 2025 04:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
Message-ID: <202507030303.nJNF4yHZ-lkp@intel.com>
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
In-Reply-To: <20250701225355.2977294-1-robh@kernel.org>
References: <20250701225355.2977294-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Marek Behún" <kabel@kernel.org>
TO: Keguang Zhang <keguang.zhang@gmail.com>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mips@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.16-rc4 next-20250702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-gpio-Create-a-trivial-GPIO-schema/20250702-065536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250701225355.2977294-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20250702 (https://download.01.org/0day-ci/archive/20250703/202507030303.nJNF4yHZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f1a4bb62452d88a0edd9340b3ca7c9b11ad9193f)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030303.nJNF4yHZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507030303.nJNF4yHZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
--
   	'nvidia,p3701-0008' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /: failed to match any schema with compatible: ['nvidia,p3450-0000', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
--
   	'google,nyan-big-rev8' was expected
   	'google,nyan-big-rev5' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /pcie@10003000: failed to match any schema with compatible: ['nvidia,tegra186-pcie']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,gp10b']
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /pcie@10003000: failed to match any schema with compatible: ['nvidia,tegra186-pcie']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,gp10b']
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: ethernet@ff550000 (rockchip,rk3328-gmac): Unevaluated properties are not allowed ('assigned-clock-rate' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 69} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: ethernet@ff550000 (rockchip,rk3328-gmac): Unevaluated properties are not allowed ('assigned-clock-rate' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c-plus.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c-plus.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 69} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 101} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3328.dtsi:733.17-741.5: Warning (graph_child_address): /vop@ff370000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: {'compatible': ['rockchip,rk3328-grf-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 70} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: syscon@ff100000 (rockchip,rk3328-grf): gpio: Unevaluated properties are not allowed ('#gpio-cells', 'compatible', 'gpio-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
