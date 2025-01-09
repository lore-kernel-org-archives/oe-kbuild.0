Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22D92F2D
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736402934; cv=none; b=WX9idNnWePIY2k7dSg1r2Y80y7v1c45uZ0u7xvhAmGj1vD/1YC5MKxIs1y4Y8YaVkKlm4jvBwKdHHlzW+PsTinwQYo6nnw70svkfggq1geSlg0MnduCGslW8hJYF7B4PxIBckF1Adsa/eHS6/s0g5sa5QggbkVib2ee5pyUu0Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736402934; c=relaxed/simple;
	bh=1d8c5cA5tKx4Ss+DSQXBj43X9myTp7ULY0HaklWxm3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XeWsDJ84kHZ6pDL1g17+vadg9OKmDd5NoUYmyQnbwqip6ABp5r7IIVcf7HQLUGDCQ7DsTjPHSj7MQuto+YY1yUFHEfX+u7Dnf/zmehYjoill05fjXE5GHy+s0y+uChdDCUQsW/793ATo9O61XcAq/cBvd5n+oL+Cwcv2zoYEk6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCAHHyQm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCAHHyQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736402931; x=1767938931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1d8c5cA5tKx4Ss+DSQXBj43X9myTp7ULY0HaklWxm3w=;
  b=dCAHHyQmUHK32v8PiN2Z7GriLi5gU4YSO3uni3MRSYoDnmhif4ePsMdD
   IfFzOaXDSp5aXpjhXIpnfS8PEiIkCZJVgKh9BzmLVOfxIaqCszKDzqUru
   1U2M+bpvfZJhTj2geDYiolyax3vNzF3KrqOGcoTmXj0FPfpQlpwSae8Ky
   qpVKJMWh8cdgZmXtgc6EvxR9tE0hra7IRAgsr3FRPnQ53JmdKlH9uqZux
   3GwOoezWOgnPshtJcjwtv07kQrfT0dli2Bg3KIZl7FcU81fgZrKiX+f4P
   upUblMhFhoG36Ox9xGMQgsrf3NYFTDhuXfcrMU+ndnlIwSgvhhErDjsss
   w==;
X-CSE-ConnectionGUID: xdr2MI6CTf+JsECE1La6CA==
X-CSE-MsgGUID: RvRmAagZRiCH5upZGW2jBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40328907"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="40328907"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 22:08:50 -0800
X-CSE-ConnectionGUID: 6eCfKlTJSKO+8PXnt7mhLA==
X-CSE-MsgGUID: og/nAAtEQbedlm+9ZeZucA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="108295504"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jan 2025 22:08:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVlio-000H9P-1c;
	Thu, 09 Jan 2025 06:08:46 +0000
Date: Thu, 9 Jan 2025 14:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/5] arm64: dts: mba8xx: Add PCIe support
Message-ID: <202501091337.hHhh9Q6p-lkp@intel.com>
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
In-Reply-To: <20250107140110.982215-6-alexander.stein@ew.tq-group.com>
References: <20250107140110.982215-6-alexander.stein@ew.tq-group.com>
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
patch link:    https://lore.kernel.org/r/20250107140110.982215-6-alexander.stein%40ew.tq-group.com
patch subject: [PATCH 5/5] arm64: dts: mba8xx: Add PCIe support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250108 (https://download.01.org/0day-ci/archive/20250109/202501091337.hHhh9Q6p-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091337.hHhh9Q6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501091337.hHhh9Q6p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: flash@0: Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: pcie@5f010000: Unevaluated properties are not allowed ('disable-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: flash@0: Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: pcie@5f010000: Unevaluated properties are not allowed ('disable-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
