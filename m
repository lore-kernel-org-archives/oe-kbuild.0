Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4719A292
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jun 2024 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719508883; cv=none; b=PKLe+Cb+VQSAGkBLnZ5PUYmYPqkBsuCXS4jG2mQ8eYbE8qT2U4YtRSFlCBKY786bBRgnNPDGcSwgJkBjU1YKUN8pTzhmlnfTBwAcm9+UEFJI/cGq9xI/w4O/9FvDIlQsVQJrkh0pYXeLT02EF190UrrhbAozff4bcrktK8KySoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719508883; c=relaxed/simple;
	bh=R29UO79NGxBOIxuMRQqFfM0NX5BkgnKtSkZ2/qQpNno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uC6EusTs5xS1DtdGGUWQsnzlC4CXoQTCZ9UqXMMOftT7SJ4Z/Eov5Qx+JEsoDI+PllEj4RgBsAn5EWap7CKyZbFJ+ZXe8ygn4eTwTVuFop7+HGirE1nY75tvEgzKbT8B9A7Sm6YlkyOCnE3RWzLQI56D4RpVLUwZParpgkyIkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zwt11k9V; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zwt11k9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719508881; x=1751044881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R29UO79NGxBOIxuMRQqFfM0NX5BkgnKtSkZ2/qQpNno=;
  b=Zwt11k9VrnLuVlFjG3GQZJ0nOKvPtqYPeHv3W/3uaDf6qsIyqEAEDKGU
   tJmbnGSUXu9sRvoFw/snAwbYQngyvtRzCY2itUST5VLhgIwLFZ5rbJjIy
   gvPXX2C0HgEKq++zLJCZg4AVOgahjjxHdF+0Vv8GZZQKjDiYeC17vERqk
   c5BZJFOTRezkZutoFvyBrl2D401NgFJjAvQcoQh84YY09UX3St9qTQJ6v
   rD1FcOmi5YoTL5znG+RpoIv2PxeIHeblC0InWP95s/L1CHVgsbArYtscB
   bUjw/odOgiINseeom4EvWT0uTF3+3aR/33Z7WuYxjMVOoJLG1yB1Pt8dZ
   A==;
X-CSE-ConnectionGUID: DA8LhepSSMmONmr2x//ATA==
X-CSE-MsgGUID: HmHAY08eTpGVv/2KNYq7kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16784352"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="16784352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 10:21:21 -0700
X-CSE-ConnectionGUID: PgwGc+PLSAa5F3K52yuJmQ==
X-CSE-MsgGUID: 60/RK42eRGOosuIZWqsDHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="44575347"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jun 2024 10:21:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMsoA-000GNa-1D;
	Thu, 27 Jun 2024 17:21:18 +0000
Date: Fri, 28 Jun 2024 01:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: trng@760000:
 compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng',
 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
Message-ID: <202406280113.H5R4jgxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Elad Nachman <enachman@marvell.com>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   afcd48134c58d6af45fb3fdb648f1260b20f2326
commit: c11e7732a90c21155de8db40dbba84f043520821 arm64: dts: cn913x: add device trees for COM Express boards
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240628/202406280113.H5R4jgxV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev2+g3b69bad
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280113.H5R4jgxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406280113.H5R4jgxV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: pca953x@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: pca9555@21: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: trng@760000: compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: trng@760000: compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/config-space@f2000000/crypto@800000: failed to match any schema with compatible: ['inside-secure,safexcel-eip197b']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: ap0_sd_vccq@0: 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: cp0_usb3_phy@0: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
--
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: sata@540000: sata-port@0: 'anyOf' conditional failed, one must be fixed:
   	'phys' is a required property
   	'target-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/ata/ahci-platform.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/config-space@f4000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/config-space@f4000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/config-space@f4000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/config-space@f4000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: trng@760000: compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: trng@760000: compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/config-space@f4000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/config-space@f4000000/crypto@800000: failed to match any schema with compatible: ['inside-secure,safexcel-eip197b']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
