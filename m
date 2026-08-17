Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2954518C02E
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 03:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786938573; cv=none; b=UIp+RFseskBX96rvRhSpHXVmF0NyX64IPsVJ5c9lNiydnuhT5ygvd8uVZn2TMDWVU0UbWcy/YEmSDYQCrQnKxVQtX3sYmTFovUMe115IwQ5sveRgYlkRlT6QmAoR+gu7HaHBoizn7i8NQDl3DYITyIbCbHW+QBv0sTn5GERJF6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786938573; c=relaxed/simple;
	bh=I2i4Nv/yGTHlx9W3+KnanKCDa3RLfsCUhu3iDM8cdxI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eO56vXGu5Qq3+wmGU86ADGKsdAfRU8ltJHiBv1EdptUtkXo0DHg25TKd/CiNXBUu8RnhwSqiOCclhO9kS9KDw9B1ZsSRtmeDOycGq36gnS6IqxUI79cKWmcXmQDeDDL3ZTkFFC7oHl24QN0NKm74gyt+Vcul/n2R16eyhREJig4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3xDlsc7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3xDlsc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786938570; x=1818474570;
  h=date:from:to:cc:subject:message-id;
  bh=I2i4Nv/yGTHlx9W3+KnanKCDa3RLfsCUhu3iDM8cdxI=;
  b=M3xDlsc7qkHshx0tymdzdYugO73MsxlLzTs5Oo0kPEvgffmQd2e1GPTp
   TesENRGMhLAakMNSyDWk78i5Zvdm0bFwuuKUbQpgig0BU6UeJnxsDdWfl
   ipKSSqaa1FGfR3WF9srZhLbUskdqJLbePLhpu1ktWifObcBfvqTB+8+3R
   px9g2D67wyR1bf3aJ4Yj1giWDL7d7TXD/v2LiQOQnfaFsoBM0jWxOTpP1
   dc52RRX1k90+panrwbIUKOYGMgwi5uG/rqKb6RvAzcPy7nZa3zJD517Vm
   1VjYbOe3b/W19RBSQhZgyzOsQBMPoycumPD+8CeQiaGyWRGwU/ZZnQWoO
   Q==;
X-CSE-ConnectionGUID: ZAeSKEK6RCikAfUTzHpE2Q==
X-CSE-MsgGUID: UJBf/He7SGubC7hc7JCGnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87534548"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87534548"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 20:49:29 -0700
X-CSE-ConnectionGUID: z6tMoZ5SQSaqID8vN4s6fw==
X-CSE-MsgGUID: CMatOjwaS1GX5x9IOaZORA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 16 Aug 2026 20:49:28 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvoLm-000000006kL-0cXS;
	Mon, 17 Aug 2026 03:49:26 +0000
Date: Mon, 17 Aug 2026 05:48:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb:
 power-controller (rockchip,rk3576-power-controller):
 power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not
 allowed ('resets' was unexpected)
Message-ID: <202608170534.VMEJFKoR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiaxing Hu <gahing@gahingwoo.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jiaxing-Hu/dt-bindings-npu-rockchip-add-rockchip-rk3576-rknn-core/20260809-234501
head:   e797a31cdb63351cd5fb5676c99571d8c9579027
commit: aa6c5b9a0986782b0c60b0569d5b3034d8ae99b9 arm64: dts: rockchip: rk3576: add NPU (RKNN) nodes
date:   8 days ago
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2054-20260816 (https://download.01.org/0day-ci/archive/20260817/202608170534.VMEJFKoR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170534.VMEJFKoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170534.VMEJFKoR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/dsi@27d80000/panel@0: failed to match any schema with compatible: ['anbernic,panel-vita-pro', 'anbernic,td4310']
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/dsi@27d80000/panel@0: failed to match any schema with compatible: ['anbernic,panel-vita-pro', 'anbernic,td4310']
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dtb: /soc/i2c@2ac90000/charger@3b: failed to match any schema with compatible: ['sgmicro,sgm41542']
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
