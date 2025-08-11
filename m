Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9204A482FF
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 17:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754932442; cv=none; b=Mv3KnAvuYI2bXE8TzgiUWwKwvgcPYacgEfkpne7++j1BnOHU2TKE9VbYcweFeRvHRBf74YWe188G/ThHoav74pqnxZ3xCVaFPMTaCst5t/0JHfPDCUwl2K089ekaFA93q+DNicVL378wD5nkgTe+xMAaY5tJ7hyvqjSruvWo1Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754932442; c=relaxed/simple;
	bh=RIvPYfi4alhpBg2gzoDmqPceSApBZyzjP96mrGCwYMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X6sh00JNEiRgHb3redRQMQgXtkx2omYpjgeTm+LMg4wanI/P6FEkdV/ncD0Wa3AaTPdZtsLquahLK8LGovPoLN5wyH51BNp3i+2Ea9JnLinOIR9Wlq/V25lbOQinx6GiZ+nlpULk1Lv8I1r9LkYpSwNO9orscfqz0t/eKhKIAC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCgLb56O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCgLb56O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754932430; x=1786468430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RIvPYfi4alhpBg2gzoDmqPceSApBZyzjP96mrGCwYMU=;
  b=XCgLb56OEoPlYFmy0gBbGC6N1EOvuP97wzrhlrB3iKJB8lbUi1WZzii7
   pxgJlF1fvEQV++EPkNXHcam6hKGeW2/ZXF9XmaCVHqaxLeVaEzqMJqiA8
   b4Bze+F2v2pK+80e6bF7DwtVnVKe8SQPOcckVa5h2hIqonWG149kfn7gr
   2WTFzY5bNiievKH1oQLMxClInvk6iCIA1KQe33EampCzebSY8YzZ50Vb7
   Ws3KRetEE2cxcMxpFHZ6LAELuPg2VW9+vbSGLOZAWdi/UvFT+/1bGVgS9
   r2fXTKJCAwGvEeS0IkwEhiNcJhmEkGQj+cDmVK8TES0/NOoAaGmYnpJ/F
   w==;
X-CSE-ConnectionGUID: 4XUlNjAbQYuFwzdSdEC4hQ==
X-CSE-MsgGUID: YrBIVgF3SreuzRM33E+WMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67462280"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67462280"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 10:13:50 -0700
X-CSE-ConnectionGUID: OFRNQqVGRmWM7uZTauFV1w==
X-CSE-MsgGUID: n7buROsTT2mlKjksz4enLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="170104386"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Aug 2025 10:13:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulW5Y-000652-15;
	Mon, 11 Aug 2025 17:13:37 +0000
Date: Tue, 12 Aug 2025 01:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/9]
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1112.7-1119.4: Warning
 (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or
 "ranges" property
Message-ID: <202508120138.COtLK4B8-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   5b96f254ba5976dd8e092ac2e176f95c23323896
commit: 2a52e4d89847745f8ab76265199a371ef5e7f93f [2/9] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 4 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-003-20250811 (https://download.01.org/0day-ci/archive/20250812/202508120138.COtLK4B8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120138.COtLK4B8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508120138.COtLK4B8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1112.7-1119.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1127.7-1134.4: Warning (avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1112.7-1119.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1127.7-1134.4: Warning (graph_child_address): /usb@fc400000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2184.4-2187.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2184.4-2187.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2184.4-2187.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2184.4-2187.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:71.3-74.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:71.3-74.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:71.3-74.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:71.3-74.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:45.3-48.27: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:45.3-48.27: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:45.3-48.27: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:45.3-48.27: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2184.4-2187.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2184.4-2187.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2184.4-2187.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mp.dtsi:2184.4-2187.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts:309.14-416.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1126.11-1136.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:842.4-845.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:842.4-845.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:842.4-845.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:842.4-845.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:881.4-884.32: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:881.4-884.32: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:881.4-884.32: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:881.4-884.32: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:920.4-923.32: Warning (interrupt_map): /soc/pcie@3600000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:920.4-923.32: Warning (interrupt_map): /soc/pcie@3600000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:920.4-923.32: Warning (interrupt_map): /soc/pcie@3600000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi:920.4-923.32: Warning (interrupt_map): /soc/pcie@3600000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi:548.4-551.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi:548.4-551.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi:548.4-551.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi:548.4-551.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:921.4-924.34: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:921.4-924.34: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:921.4-924.34: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:921.4-924.34: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:948.4-951.34: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:948.4-951.34: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:948.4-951.34: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:948.4-951.34: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:975.4-978.34: Warning (interrupt_map): /soc/pcie@3600000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:975.4-978.34: Warning (interrupt_map): /soc/pcie@3600000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:975.4-978.34: Warning (interrupt_map): /soc/pcie@3600000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
   arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi:975.4-978.34: Warning (interrupt_map): /soc/pcie@3600000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts:311.14-418.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts:48.9-58.5: Warning (graph_child_address): /connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:83.3-86.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi:33.3-36.27: Warning (interrupt_map): /bus@5f000000/pcie@5f000000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi:41.18-55.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1703.34-1775.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts:277.14-364.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/imx8mn.dtsi:790.26-802.7: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/spba-bus@30800000/spi@30820000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1126.11-1136.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1746.4-1749.43: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mq.dtsi:1824.4-1827.28: Warning (interrupt_map): /soc@0/pcie@33c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1280.13-1288.8: Warning (graph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts:330.14-411.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
--
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts:309.19-358.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts:360.16-400.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts:361.14-467.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
>> arch/arm64/boot/dts/freescale/imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback
--
>> arch/arm64/boot/dts/mediatek/mt8183.dtsi:1826.22-1843.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195.dtsi:3360.22-3372.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
--
>> arch/arm64/boot/dts/amazon/alpine-v2.dtsi:138.4-139.33: Warning (interrupt_map): /soc/pci@fbc00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0200000, using 0 as fallback
>> arch/arm64/boot/dts/amazon/alpine-v2.dtsi:138.4-139.33: Warning (interrupt_map): /soc/pci@fbc00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0200000, using 0 as fallback
--
>> arch/arm64/boot/dts/amazon/alpine-v3.dtsi:342.4-349.33: Warning (interrupt_map): /soc/pcie@fbd00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0800000, using 0 as fallback
>> arch/arm64/boot/dts/amazon/alpine-v3.dtsi:342.4-349.33: Warning (interrupt_map): /soc/pcie@fbd00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0800000, using 0 as fallback
>> arch/arm64/boot/dts/amazon/alpine-v3.dtsi:342.4-349.33: Warning (interrupt_map): /soc/pcie@fbd00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0800000, using 0 as fallback
>> arch/arm64/boot/dts/amazon/alpine-v3.dtsi:342.4-349.33: Warning (interrupt_map): /soc/pcie@fbd00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0800000, using 0 as fallback
>> arch/arm64/boot/dts/amazon/alpine-v3.dtsi:342.4-349.33: Warning (interrupt_map): /soc/pcie@fbd00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0800000, using 0 as fallback
>> arch/arm64/boot/dts/amazon/alpine-v3.dtsi:342.4-349.33: Warning (interrupt_map): /soc/pcie@fbd00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0800000, using 0 as fallback
>> arch/arm64/boot/dts/amazon/alpine-v3.dtsi:342.4-349.33: Warning (interrupt_map): /soc/pcie@fbd00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0800000, using 0 as fallback
>> arch/arm64/boot/dts/amazon/alpine-v3.dtsi:342.4-349.33: Warning (interrupt_map): /soc/pcie@fbd00000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@f0800000, using 0 as fallback

vim +1112 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts

d1b8b36a2cc5f4 Heiko Stuebner 2023-12-01  1106  
c55c9e91d16434 Heiko Stuebner 2025-02-28  1107  /* host0 on P11 USB-C */
c55c9e91d16434 Heiko Stuebner 2025-02-28  1108  &usb_host0_xhci {
c55c9e91d16434 Heiko Stuebner 2025-02-28  1109  	usb-role-switch;
c55c9e91d16434 Heiko Stuebner 2025-02-28  1110  	status = "okay";
c55c9e91d16434 Heiko Stuebner 2025-02-28  1111  
c55c9e91d16434 Heiko Stuebner 2025-02-28 @1112  	port {
c55c9e91d16434 Heiko Stuebner 2025-02-28  1113  		#address-cells = <1>;
c55c9e91d16434 Heiko Stuebner 2025-02-28  1114  		#size-cells = <0>;
c55c9e91d16434 Heiko Stuebner 2025-02-28  1115  
c55c9e91d16434 Heiko Stuebner 2025-02-28  1116  		usb_host0_xhci_drd_sw: endpoint {
c55c9e91d16434 Heiko Stuebner 2025-02-28  1117  			remote-endpoint = <&usbc0_hs>;
c55c9e91d16434 Heiko Stuebner 2025-02-28  1118  		};
c55c9e91d16434 Heiko Stuebner 2025-02-28  1119  	};
c55c9e91d16434 Heiko Stuebner 2025-02-28  1120  };
c55c9e91d16434 Heiko Stuebner 2025-02-28  1121  
c55c9e91d16434 Heiko Stuebner 2025-02-28  1122  /* host1 on P12 USB-C */
c55c9e91d16434 Heiko Stuebner 2025-02-28  1123  &usb_host1_xhci {
c55c9e91d16434 Heiko Stuebner 2025-02-28  1124  	usb-role-switch;
c55c9e91d16434 Heiko Stuebner 2025-02-28  1125  	status = "okay";
c55c9e91d16434 Heiko Stuebner 2025-02-28  1126  
c55c9e91d16434 Heiko Stuebner 2025-02-28 @1127  	port {
c55c9e91d16434 Heiko Stuebner 2025-02-28  1128  		#address-cells = <1>;
c55c9e91d16434 Heiko Stuebner 2025-02-28  1129  		#size-cells = <0>;
c55c9e91d16434 Heiko Stuebner 2025-02-28  1130  
c55c9e91d16434 Heiko Stuebner 2025-02-28  1131  		usb_host1_xhci_drd_sw: endpoint {
c55c9e91d16434 Heiko Stuebner 2025-02-28  1132  			remote-endpoint = <&usbc1_hs>;
c55c9e91d16434 Heiko Stuebner 2025-02-28  1133  		};
c55c9e91d16434 Heiko Stuebner 2025-02-28  1134  	};
c55c9e91d16434 Heiko Stuebner 2025-02-28  1135  };
c55c9e91d16434 Heiko Stuebner 2025-02-28  1136  

:::::: The code at line 1112 was first introduced by commit
:::::: c55c9e91d1643493d0434f246917aea7a2653e0f arm64: dts: rockchip: add usb typec host support to rk3588-jaguar

:::::: TO: Heiko Stuebner <heiko.stuebner@cherry.de>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
