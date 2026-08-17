Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C7372EED
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786947163; cv=none; b=Xum5d13PMrn9Y5fzSGwRGgbR8pIbvwujvjysB2PLqdR9k6/ioKB4to+0YS0bNxBvwt/Y+Uwt28msnEdHIP9uh/nNR1a4ar24FeD/Ho966dk0xz/ddC9WyqgcyALiSi4JKiU+Qh3I9CmrHvKh7CKSQ6cXUmoN0ckGs0QiIKxM4w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786947163; c=relaxed/simple;
	bh=8DUxdWgfVfR3LJEcI2zHux5tqPs+uL0uRDRed3FDuTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sahJtzdl9U32Tzt5QdeClXzXVfwih7hXdpmrzRgZE0kEFjin8Eb//0ORvfjVxNgvk89NcHwy5Mw6jQsJirSJDyPpeepOSXI/8TGTa/diyEt1m9+Ua1/E7c7yT/wSOffUmwh0CiCigplnX6NZRebskedlz9B7YH4aTZ60fF7miVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rpx83hO2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rpx83hO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786947160; x=1818483160;
  h=date:from:to:cc:subject:message-id;
  bh=8DUxdWgfVfR3LJEcI2zHux5tqPs+uL0uRDRed3FDuTY=;
  b=Rpx83hO2f8HTWX9eYYwPqc8PzNSGWlXE6kCNf6fkcVlZ3+4234zyAKlB
   7+YZQ8BJou0Rvky+QyUrRUUAua5ow3NGL9UtrKz89hljl7diIsqFG/OUq
   jgeGYpgue9STG9yy/wv6ar0buqICHqLLNoz8dmFal4chZhkp3meuyh90W
   79btQbxoSqga0EvA0YNLq9rv5OboI6z5xuVkTA2CBQBXKMFdUkUmDLvQ0
   vwIAkdL6nZAto+22tONk+h8VyP3Lx4Ei+XlO13Bqke51cnHYb/4+JtwdL
   DwnWA6jSOjLxucZuyOH8z4kUTLm8Rp+iUWrB0pcDUKiBkb1HU/Mqs926n
   g==;
X-CSE-ConnectionGUID: 7VdVFDJKQNuZYIj8GYT/DA==
X-CSE-MsgGUID: ArWWR8S4RDy9JjXXtlfk9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98076854"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98076854"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 23:12:29 -0700
X-CSE-ConnectionGUID: wmJeuDpET+eF+vhPnawqUA==
X-CSE-MsgGUID: Bwsr1iABTROd3zNbJTJ7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="261540577"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 Aug 2026 23:12:29 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvqaB-000000006lB-0rW5;
	Mon, 17 Aug 2026 06:12:27 +0000
Date: Mon, 17 Aug 2026 08:11:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb:
 npu@27700000 (rockchip,rk3576-rknn-core): power-domains: [[37, 2], [37, 3]]
 is too long
Message-ID: <202608170856.sKcvqzFQ-lkp@intel.com>
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
commit: e797a31cdb63351cd5fb5676c99571d8c9579027 arm64: dts: rockchip: rk3576-rock-4d: enable NPU
date:   8 days ago
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2054-20260816 (https://download.01.org/0day-ci/archive/20260817/202608170856.sKcvqzFQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170856.sKcvqzFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170856.sKcvqzFQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@2: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: power-controller (rockchip,rk3576-power-controller): power-domain@0:power-domain@1:power-domain@3: Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/edp@27dc0000: failed to match any schema with compatible: ['rockchip,rk3576-edp']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clock-names: ['aclk', 'hclk', 'npu', 'pclk', 'aclk_cbuf', 'hclk_cbuf'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): clocks: [[21, 229], [21, 231], [21, 232], [21, 233], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): power-domains: [[37, 2], [37, 3]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg: [[0, 661651456, 0, 4096], [0, 661655552, 0, 4096], [0, 661663744, 0, 4096], [0, 661667840, 0, 4096], [0, 661671936, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27700000 (rockchip,rk3576-rknn-core): resets: [[21, 204]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: iommu@27702000 (rockchip,rk3576-iommu): clocks: [[21, 229], [21, 231], [21, 232], [21, 240], [21, 244]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: iommu@27702000 (rockchip,rk3576-iommu): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg: [[0, 661716992, 0, 4096], [0, 661721088, 0, 4096], [0, 661729280, 0, 4096], [0, 661733376, 0, 4096], [0, 661737472, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reg-names: ['pc', 'cna', 'core', 'dpu', 'dpu_rdma'] is too long
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27710000 (rockchip,rk3576-rknn-core): reset-names: ['srst_a'] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: npu@27710000 (rockchip,rk3576-rknn-core): resets: [[21, 207]] is too short
   	from schema $id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: iommu@2770a000 (rockchip,rk3576-iommu): clocks: [[21, 230], [21, 231], [21, 232], [21, 240], [21, 244]] is too long

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
