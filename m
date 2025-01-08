Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2326419EEBF
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 22:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376425; cv=none; b=glnomxB2nox7IjkFv40krwF50E8z/MmM7JTfx1uxG4t02oacANdtBxTM3YxheI5C5tvJxj+XcMBNj1IEp5Ztbqse5hGIyhv3KWVQb59xpZ8YMW+J339eaHX4uw/jXfY07oCx/8f9KIDyE+pyN5naJqlZpMgf7zVHLmLRwWCuLdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376425; c=relaxed/simple;
	bh=2iPJmQ3FJ2h6B/6t8X+cauqU9LAAYu6GJjDT1Lk9vXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gj4JYzpVnbE4qQYkKrs/EGt86PlGYNCJZQ7sDKESrIoMQfMejNmv3/4beipZ0WGTC7f4aUlHQtqZs+aGldmKcwQVrfNpZCAad+330qSNFj0D4oHQvS+M8zgH6HC+MPs1kA6CqSbmRBR8XytnYDQBqnQZZSCEe5IXEEyT9o0bo/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QClXiwm6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QClXiwm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736376424; x=1767912424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2iPJmQ3FJ2h6B/6t8X+cauqU9LAAYu6GJjDT1Lk9vXQ=;
  b=QClXiwm608zVlU8zIhkzueiH8NSPV8g2kQdU/RtkWFs3zN41k1ivKLtX
   7YwNzbifyoqIp4MbByADeocMtxQGFrx5aXXetnhJwF+G85pPt/MJpm01g
   v7CTuRXK4BLN02Cmyx65AF1s1SryTMDFIF4qYVnh11SuifJuolvWO0Q0E
   BaYLtOmkNcscaCsbBK9bHBPOFFfPG+eylmzFXSugwawtEZVMvm1vo026e
   K2isfQRP4wVsls7jPmp2uv695c2qZiNI9g3x6L3xfILjpZImsPLFITf3r
   R12CelN7TwzHCSDAP9Mt5hfKEhvX4sR6Ej8UKnKsVBRN7mHnEzLV1Gi0m
   w==;
X-CSE-ConnectionGUID: I+g0dQC5RT+Anof+mAlRhw==
X-CSE-MsgGUID: /Ras0mccRJuNujMgtkBlTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40302425"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="40302425"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 14:47:03 -0800
X-CSE-ConnectionGUID: JRf45a2pSo+GcqF7ElBxSQ==
X-CSE-MsgGUID: skVnvgWgQcq3zHZki0F7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126525137"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2025 14:47:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVepH-000GlL-1T;
	Wed, 08 Jan 2025 22:46:59 +0000
Date: Thu, 9 Jan 2025 06:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/5] arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
Message-ID: <202501090647.0piEIjH8-lkp@intel.com>
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
In-Reply-To: <20250107140110.982215-2-alexander.stein@ew.tq-group.com>
References: <20250107140110.982215-2-alexander.stein@ew.tq-group.com>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux@ew.tq-group.com

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.13-rc6 next-20250108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/arm64-dts-imx8-ss-hsio-Wire-up-DMA-IRQ-for-PCIe/20250107-220826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250107140110.982215-2-alexander.stein%40ew.tq-group.com
patch subject: [PATCH 1/5] arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-051-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090647.0piEIjH8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090647.0piEIjH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501090647.0piEIjH8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
