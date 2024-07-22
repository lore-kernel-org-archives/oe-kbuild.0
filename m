Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14D016DC32
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660881; cv=none; b=cMNpLh8WRZ5lqDhqzkFwkvgxyHVfreeUotLO97yoO4c/19EpEs/wYIZRDbQ6FIHfynRv2Dz5HE6QbBDEm0Q7OrZrwp3Zymmd77uBwUBH9ci9ULd5o8J6f4wI9ALnDfKUST6W6CGkGJvk5FhQ7pevUzCYVZ/P3x6Guf3MklTRToU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660881; c=relaxed/simple;
	bh=ZkLWSi/t733OmLjWio/X6IDJpDDz/EfUbciM23EbNeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KZl7C7rxnLPb99H3ZNup5/AqY3AfUiLxeXPSrtPEZ6QbDkKN+8tNEWWSbGKXKC0m45t0vQ/C2Ac/HMOEVR5fEsj7EK+blnsIoOwxrLsg/7gQCxNnlwAMWI+Gh/ipNrkMs5Sp01pSIIi9aBEexaKWqq2WRhAsWJjXO7h26xl9SYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkM4ZCAN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkM4ZCAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721660870; x=1753196870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZkLWSi/t733OmLjWio/X6IDJpDDz/EfUbciM23EbNeo=;
  b=JkM4ZCANAujfCSEb8XQbj98pZhkgCMooKC4S06e+V3B/E6uVFQjvsN8n
   m44C4dUzivrjz7r8X7M+CHBDgK4sklm93pl1F5BZQRLSQy8YIjj9PUmmn
   jyAmZvUvqdI1h3QzVxYFydL3XescIxC5g5YQDgV9sDe84SpSHCk1suufQ
   PxGcsAgMRy/owwJTVwgn1ioQcoh0EJjZyOnWdiuiAEHDjCq31uffe67iC
   +QGkGBszP7Mfsbz1xe81T/O44VLy6TawwOxQ2f9IBHhQ5iLqENdnpaUXR
   Yv9+e7FENQBUvtoCBQWgrI7GI+LvLpXejiZh3upJuRbNb42I8Dhyv6J8q
   w==;
X-CSE-ConnectionGUID: gccJanDWSYqvCqU2R3xoUA==
X-CSE-MsgGUID: 4Ai29LWbSdGk7fhcv4K0/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="22997019"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="22997019"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 08:07:49 -0700
X-CSE-ConnectionGUID: mJS6fjlZSvWNAFDAzVX3Bg==
X-CSE-MsgGUID: qJMwhNY4SJOIQ1sO2ob3Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="89362267"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Jul 2024 08:07:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVudb-000lCm-1v;
	Mon, 22 Jul 2024 15:07:43 +0000
Date: Mon, 22 Jul 2024 23:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 10/11]
 arch/arm64/boot/dts/mediatek/mt8188.dtsi:749.34-753.7: Warning
 (unit_address_vs_reg): /thermal-zones/soc_max/trips/soc-max-crit@0: node has
 a unit name, but no reg or ranges property
Message-ID: <202407222321.V2gFpiG7-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

Hi Fei,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   15f5ac81d614a78d9d297026b1a308e032999ce8
commit: cbb0f8b948cfdab5fb6eb6212268092f381ae967 [10/11] CHROMIUM: arm64: dts: mt8188: Use dash in node names (generic)
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arm64-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240722/202407222321.V2gFpiG7-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407222321.V2gFpiG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407222321.V2gFpiG7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:737.29-741.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:743.22-747.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:749.34-753.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/soc-max-crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:54.53-59.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/camera-main-sensor-pins@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:61.51-66.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/camera-sub-sensor-pins@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1902.26-1916.5: Warning (unit_address_vs_reg): /soc/t-phy@11e30000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1918.26-1941.5: Warning (unit_address_vs_reg): /soc/t-phy@11e40000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1943.26-1957.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2000.28-2002.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/dp-data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2008.24-2010.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/data2: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2012.24-2014.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/data3: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2020.26-2022.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data0: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2024.26-2026.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data1: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2032.35-2034.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse0: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2036.35-2038.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse1: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2040.35-2042.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse2: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2044.27-2047.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/volt-bin: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:402.16-408.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:410.16-413.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2333.14-2369.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi_receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi_receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi_receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi_receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:111.9-114.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:178.36-182.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:184.42-187.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:189.38-193.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:195.44-199.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:201.46-205.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:207.46-211.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:213.44-217.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:219.42-223.5: Warning (unit_address_vs_reg): /reserved-memory/secure-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1334.29-1358.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1440.35-1445.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1447.35-1452.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1902.26-1916.5: Warning (simple_bus_reg): /soc/t-phy@11e30000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1918.26-1941.5: Warning (simple_bus_reg): /soc/t-phy@11e40000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1943.26-1957.5: Warning (simple_bus_reg): /soc/t-phy@11e80000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2287.30-2291.5: Warning (simple_bus_reg): /soc/vmm-proxy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2293.32-2311.5: Warning (simple_bus_reg): /soc/opp-table-img: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2313.32-2331.5: Warning (simple_bus_reg): /soc/opp-table-ipe: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2333.14-2369.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2371.11-2395.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:3308.14-3333.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:3335.15-3370.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:3372.15-3407.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4058.49-4065.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4364.38-4370.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4372.38-4378.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4731.12-4734.5: Warning (simple_bus_reg): /soc/bring-up: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:817.37-838.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1524.21-1536.5: Warning (unique_unit_address): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/lvts@1100b000)
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2184.37-2188.5: Warning (unique_unit_address): /soc/clock-controller@15000000: duplicate unit-address (also used in node /soc/imgsys-fw@15000000)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3529.37-3533.5: Warning (unique_unit_address): /soc/clock-controller@16000000: duplicate unit-address (also used in node /soc/camisp@16000000)
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:737.29-741.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:743.22-747.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:749.34-753.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/soc-max-crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1902.26-1916.5: Warning (unit_address_vs_reg): /soc/t-phy@11e30000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1918.26-1941.5: Warning (unit_address_vs_reg): /soc/t-phy@11e40000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1943.26-1957.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2000.28-2002.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/dp-data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2008.24-2010.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/data2: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2012.24-2014.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/data3: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2020.26-2022.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data0: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2024.26-2026.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data1: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2032.35-2034.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse0: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2036.35-2038.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse1: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2040.35-2042.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse2: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2044.27-2047.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/volt-bin: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2333.14-2369.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-evb.dts:47.42-49.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-evb.dts:51.46-55.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1334.29-1358.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1440.35-1445.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1447.35-1452.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1902.26-1916.5: Warning (simple_bus_reg): /soc/t-phy@11e30000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1918.26-1941.5: Warning (simple_bus_reg): /soc/t-phy@11e40000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1943.26-1957.5: Warning (simple_bus_reg): /soc/t-phy@11e80000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2287.30-2291.5: Warning (simple_bus_reg): /soc/vmm-proxy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2293.32-2311.5: Warning (simple_bus_reg): /soc/opp-table-img: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2313.32-2331.5: Warning (simple_bus_reg): /soc/opp-table-ipe: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2333.14-2369.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2371.11-2395.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:3308.14-3333.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:3335.15-3370.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:3372.15-3407.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4058.49-4065.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4364.38-4370.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4372.38-4378.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4731.12-4734.5: Warning (simple_bus_reg): /soc/bring-up: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:817.37-838.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1524.21-1536.5: Warning (unique_unit_address): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/lvts@1100b000)
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2184.37-2188.5: Warning (unique_unit_address): /soc/clock-controller@15000000: duplicate unit-address (also used in node /soc/imgsys-fw@15000000)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3529.37-3533.5: Warning (unique_unit_address): /soc/clock-controller@16000000: duplicate unit-address (also used in node /soc/camisp@16000000)
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:737.29-741.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:743.22-747.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:749.34-753.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/soc-max-crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:46.27-55.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam1@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:57.27-66.4: Warning (unit_address_vs_reg): /soc/pinctrl@10005000/cam0@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1902.26-1916.5: Warning (unit_address_vs_reg): /soc/t-phy@11e30000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1918.26-1941.5: Warning (unit_address_vs_reg): /soc/t-phy@11e40000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1943.26-1957.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2000.28-2002.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/dp-data: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2008.24-2010.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/data2: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2012.24-2014.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/data3: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2020.26-2022.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data0: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2024.26-2026.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data1: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2032.35-2034.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse0: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2036.35-2038.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse1: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2040.35-2042.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse2: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2044.27-2047.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/volt-bin: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:402.16-408.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:410.16-413.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2333.14-2369.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:14.37-28.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi_receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:23.40-26.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi_receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:29.37-42.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi_receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:37.40-40.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi_receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:111.9-114.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:178.36-182.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:184.42-187.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:189.38-193.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:195.44-199.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:201.46-205.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:207.46-211.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:213.44-217.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:219.42-223.5: Warning (unit_address_vs_reg): /reserved-memory/secure-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:80.27-86.4: Warning (unit_address_format): /soc/i2c@11ec1000/vcm@0c: unit name should not have leading 0s
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1334.29-1358.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1440.35-1445.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1447.35-1452.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1902.26-1916.5: Warning (simple_bus_reg): /soc/t-phy@11e30000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1918.26-1941.5: Warning (simple_bus_reg): /soc/t-phy@11e40000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1943.26-1957.5: Warning (simple_bus_reg): /soc/t-phy@11e80000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2287.30-2291.5: Warning (simple_bus_reg): /soc/vmm-proxy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2293.32-2311.5: Warning (simple_bus_reg): /soc/opp-table-img: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2313.32-2331.5: Warning (simple_bus_reg): /soc/opp-table-ipe: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2333.14-2369.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2371.11-2395.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:3308.14-3333.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:3335.15-3370.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:3372.15-3407.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4058.49-4065.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4364.38-4370.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4372.38-4378.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4731.12-4734.5: Warning (simple_bus_reg): /soc/bring-up: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:80.27-86.4: Warning (i2c_bus_reg): /soc/i2c@11ec1000/vcm@0c: I2C bus unit address format error, expected "c"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:817.37-838.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1524.21-1536.5: Warning (unique_unit_address): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/lvts@1100b000)
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2184.37-2188.5: Warning (unique_unit_address): /soc/clock-controller@15000000: duplicate unit-address (also used in node /soc/imgsys-fw@15000000)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3529.37-3533.5: Warning (unique_unit_address): /soc/clock-controller@16000000: duplicate unit-address (also used in node /soc/camisp@16000000)

vim +749 arch/arm64/boot/dts/mediatek/mt8188.dtsi

800ef7029f37c5 jason-ch chen    2023-10-23    18  
800ef7029f37c5 jason-ch chen    2023-10-23    19  / {
800ef7029f37c5 jason-ch chen    2023-10-23    20  	compatible = "mediatek,mt8188";
800ef7029f37c5 jason-ch chen    2023-10-23    21  	interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23    22  	#address-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23    23  	#size-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23    24  
9de20b7422ddeb Johnson Wang     2023-01-10    25  	aliases {
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    26  		dp-intf1 = &dp_intf1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    27  		ethdr0 = &ethdr0;
9de20b7422ddeb Johnson Wang     2023-01-10    28  		gce0 = &gce0;
9de20b7422ddeb Johnson Wang     2023-01-10    29  		gce1 = &gce1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    30  		merge1 = &merge1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    31  		merge2 = &merge2;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    32  		merge3 = &merge3;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    33  		merge4 = &merge4;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    34  		merge5 = &merge5;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    35  		mutex0 = &mutex;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    36  		mutex1 = &mutex1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    37  		padding0 = &padding0;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    38  		padding1 = &padding1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    39  		padding2 = &padding2;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    40  		padding3 = &padding3;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    41  		padding4 = &padding4;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    42  		padding5 = &padding5;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    43  		padding6 = &padding6;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    44  		padding7 = &padding7;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    45  		vdo1-rdma0 = &vdo1_rdma0;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    46  		vdo1-rdma1 = &vdo1_rdma1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    47  		vdo1-rdma2 = &vdo1_rdma2;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    48  		vdo1-rdma3 = &vdo1_rdma3;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    49  		vdo1-rdma4 = &vdo1_rdma4;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    50  		vdo1-rdma5 = &vdo1_rdma5;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    51  		vdo1-rdma6 = &vdo1_rdma6;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    52  		vdo1-rdma7 = &vdo1_rdma7;
9de20b7422ddeb Johnson Wang     2023-01-10    53  	};
9de20b7422ddeb Johnson Wang     2023-01-10    54  
800ef7029f37c5 jason-ch chen    2023-10-23    55  	cpus {
800ef7029f37c5 jason-ch chen    2023-10-23    56  		#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23    57  		#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23    58  
800ef7029f37c5 jason-ch chen    2023-10-23    59  		cpu0: cpu@0 {
800ef7029f37c5 jason-ch chen    2023-10-23    60  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23    61  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23    62  			reg = <0x000>;
800ef7029f37c5 jason-ch chen    2023-10-23    63  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10    64  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23    65  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23    66  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23    67  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23    68  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23    69  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23    70  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23    71  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23    72  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23    73  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23    74  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23    75  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23    76  		};
800ef7029f37c5 jason-ch chen    2023-10-23    77  
800ef7029f37c5 jason-ch chen    2023-10-23    78  		cpu1: cpu@100 {
800ef7029f37c5 jason-ch chen    2023-10-23    79  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23    80  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23    81  			reg = <0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23    82  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10    83  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23    84  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23    85  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23    86  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23    87  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23    88  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23    89  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23    90  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23    91  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23    92  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23    93  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23    94  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23    95  		};
800ef7029f37c5 jason-ch chen    2023-10-23    96  
800ef7029f37c5 jason-ch chen    2023-10-23    97  		cpu2: cpu@200 {
800ef7029f37c5 jason-ch chen    2023-10-23    98  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23    99  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23   100  			reg = <0x200>;
800ef7029f37c5 jason-ch chen    2023-10-23   101  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   102  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   103  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   104  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23   105  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23   106  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   107  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   108  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   109  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   110  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   111  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   112  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   113  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   114  		};
800ef7029f37c5 jason-ch chen    2023-10-23   115  
800ef7029f37c5 jason-ch chen    2023-10-23   116  		cpu3: cpu@300 {
800ef7029f37c5 jason-ch chen    2023-10-23   117  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   118  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23   119  			reg = <0x300>;
800ef7029f37c5 jason-ch chen    2023-10-23   120  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   121  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   122  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   123  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23   124  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23   125  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   126  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   127  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   128  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   129  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   130  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   131  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   132  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   133  		};
800ef7029f37c5 jason-ch chen    2023-10-23   134  
800ef7029f37c5 jason-ch chen    2023-10-23   135  		cpu4: cpu@400 {
800ef7029f37c5 jason-ch chen    2023-10-23   136  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   137  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23   138  			reg = <0x400>;
800ef7029f37c5 jason-ch chen    2023-10-23   139  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   140  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   141  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   142  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23   143  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23   144  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   145  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   146  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   147  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   148  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   149  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   150  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   151  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   152  		};
800ef7029f37c5 jason-ch chen    2023-10-23   153  
800ef7029f37c5 jason-ch chen    2023-10-23   154  		cpu5: cpu@500 {
800ef7029f37c5 jason-ch chen    2023-10-23   155  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   156  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23   157  			reg = <0x500>;
800ef7029f37c5 jason-ch chen    2023-10-23   158  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   159  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   160  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   161  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23   162  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23   163  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   164  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   165  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   166  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   167  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   168  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   169  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   170  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   171  		};
800ef7029f37c5 jason-ch chen    2023-10-23   172  
800ef7029f37c5 jason-ch chen    2023-10-23   173  		cpu6: cpu@600 {
800ef7029f37c5 jason-ch chen    2023-10-23   174  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   175  			compatible = "arm,cortex-a78";
800ef7029f37c5 jason-ch chen    2023-10-23   176  			reg = <0x600>;
800ef7029f37c5 jason-ch chen    2023-10-23   177  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   178  			performance-domains = <&performance 1>;
800ef7029f37c5 jason-ch chen    2023-10-23   179  			clock-frequency = <2600000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   180  			capacity-dmips-mhz = <1024>;
800ef7029f37c5 jason-ch chen    2023-10-23   181  			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
800ef7029f37c5 jason-ch chen    2023-10-23   182  			i-cache-size = <65536>;
800ef7029f37c5 jason-ch chen    2023-10-23   183  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   184  			i-cache-sets = <256>;
800ef7029f37c5 jason-ch chen    2023-10-23   185  			d-cache-size = <65536>;
800ef7029f37c5 jason-ch chen    2023-10-23   186  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   187  			d-cache-sets = <256>;
800ef7029f37c5 jason-ch chen    2023-10-23   188  			next-level-cache = <&l2_1>;
800ef7029f37c5 jason-ch chen    2023-10-23   189  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   190  		};
800ef7029f37c5 jason-ch chen    2023-10-23   191  
800ef7029f37c5 jason-ch chen    2023-10-23   192  		cpu7: cpu@700 {
800ef7029f37c5 jason-ch chen    2023-10-23   193  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   194  			compatible = "arm,cortex-a78";
800ef7029f37c5 jason-ch chen    2023-10-23   195  			reg = <0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23   196  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   197  			performance-domains = <&performance 1>;
800ef7029f37c5 jason-ch chen    2023-10-23   198  			clock-frequency = <2600000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   199  			capacity-dmips-mhz = <1024>;
800ef7029f37c5 jason-ch chen    2023-10-23   200  			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
800ef7029f37c5 jason-ch chen    2023-10-23   201  			i-cache-size = <65536>;
800ef7029f37c5 jason-ch chen    2023-10-23   202  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   203  			i-cache-sets = <256>;
800ef7029f37c5 jason-ch chen    2023-10-23   204  			d-cache-size = <65536>;
800ef7029f37c5 jason-ch chen    2023-10-23   205  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   206  			d-cache-sets = <256>;
800ef7029f37c5 jason-ch chen    2023-10-23   207  			next-level-cache = <&l2_1>;
800ef7029f37c5 jason-ch chen    2023-10-23   208  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   209  		};
800ef7029f37c5 jason-ch chen    2023-10-23   210  
800ef7029f37c5 jason-ch chen    2023-10-23   211  		cpu-map {
800ef7029f37c5 jason-ch chen    2023-10-23   212  			cluster0 {
800ef7029f37c5 jason-ch chen    2023-10-23   213  				core0 {
800ef7029f37c5 jason-ch chen    2023-10-23   214  					cpu = <&cpu0>;
800ef7029f37c5 jason-ch chen    2023-10-23   215  				};
800ef7029f37c5 jason-ch chen    2023-10-23   216  
800ef7029f37c5 jason-ch chen    2023-10-23   217  				core1 {
800ef7029f37c5 jason-ch chen    2023-10-23   218  					cpu = <&cpu1>;
800ef7029f37c5 jason-ch chen    2023-10-23   219  				};
800ef7029f37c5 jason-ch chen    2023-10-23   220  
800ef7029f37c5 jason-ch chen    2023-10-23   221  				core2 {
800ef7029f37c5 jason-ch chen    2023-10-23   222  					cpu = <&cpu2>;
800ef7029f37c5 jason-ch chen    2023-10-23   223  				};
800ef7029f37c5 jason-ch chen    2023-10-23   224  
800ef7029f37c5 jason-ch chen    2023-10-23   225  				core3 {
800ef7029f37c5 jason-ch chen    2023-10-23   226  					cpu = <&cpu3>;
800ef7029f37c5 jason-ch chen    2023-10-23   227  				};
800ef7029f37c5 jason-ch chen    2023-10-23   228  
800ef7029f37c5 jason-ch chen    2023-10-23   229  				core4 {
800ef7029f37c5 jason-ch chen    2023-10-23   230  					cpu = <&cpu4>;
800ef7029f37c5 jason-ch chen    2023-10-23   231  				};
800ef7029f37c5 jason-ch chen    2023-10-23   232  
800ef7029f37c5 jason-ch chen    2023-10-23   233  				core5 {
800ef7029f37c5 jason-ch chen    2023-10-23   234  					cpu = <&cpu5>;
800ef7029f37c5 jason-ch chen    2023-10-23   235  				};
6af14ba53ac522 Johnson Wang     2022-07-25   236  			};
800ef7029f37c5 jason-ch chen    2023-10-23   237  
6af14ba53ac522 Johnson Wang     2022-07-25   238  			cluster1 {
6af14ba53ac522 Johnson Wang     2022-07-25   239  				core0 {
800ef7029f37c5 jason-ch chen    2023-10-23   240  					cpu = <&cpu6>;
800ef7029f37c5 jason-ch chen    2023-10-23   241  				};
800ef7029f37c5 jason-ch chen    2023-10-23   242  
6af14ba53ac522 Johnson Wang     2022-07-25   243  				core1 {
800ef7029f37c5 jason-ch chen    2023-10-23   244  					cpu = <&cpu7>;
800ef7029f37c5 jason-ch chen    2023-10-23   245  				};
800ef7029f37c5 jason-ch chen    2023-10-23   246  			};
800ef7029f37c5 jason-ch chen    2023-10-23   247  		};
800ef7029f37c5 jason-ch chen    2023-10-23   248  
800ef7029f37c5 jason-ch chen    2023-10-23   249  		idle-states {
800ef7029f37c5 jason-ch chen    2023-10-23   250  			entry-method = "psci";
800ef7029f37c5 jason-ch chen    2023-10-23   251  
800ef7029f37c5 jason-ch chen    2023-10-23   252  			cpu_off_l: cpu-off-l {
800ef7029f37c5 jason-ch chen    2023-10-23   253  				compatible = "arm,idle-state";
800ef7029f37c5 jason-ch chen    2023-10-23   254  				arm,psci-suspend-param = <0x00010000>;
800ef7029f37c5 jason-ch chen    2023-10-23   255  				local-timer-stop;
800ef7029f37c5 jason-ch chen    2023-10-23   256  				entry-latency-us = <50>;
800ef7029f37c5 jason-ch chen    2023-10-23   257  				exit-latency-us = <95>;
800ef7029f37c5 jason-ch chen    2023-10-23   258  				min-residency-us = <580>;
800ef7029f37c5 jason-ch chen    2023-10-23   259  			};
800ef7029f37c5 jason-ch chen    2023-10-23   260  
800ef7029f37c5 jason-ch chen    2023-10-23   261  			cpu_off_b: cpu-off-b {
800ef7029f37c5 jason-ch chen    2023-10-23   262  				compatible = "arm,idle-state";
800ef7029f37c5 jason-ch chen    2023-10-23   263  				arm,psci-suspend-param = <0x00010000>;
800ef7029f37c5 jason-ch chen    2023-10-23   264  				local-timer-stop;
800ef7029f37c5 jason-ch chen    2023-10-23   265  				entry-latency-us = <45>;
800ef7029f37c5 jason-ch chen    2023-10-23   266  				exit-latency-us = <140>;
800ef7029f37c5 jason-ch chen    2023-10-23   267  				min-residency-us = <740>;
800ef7029f37c5 jason-ch chen    2023-10-23   268  			};
800ef7029f37c5 jason-ch chen    2023-10-23   269  
800ef7029f37c5 jason-ch chen    2023-10-23   270  			cluster_off_l: cluster-off-l {
800ef7029f37c5 jason-ch chen    2023-10-23   271  				compatible = "arm,idle-state";
800ef7029f37c5 jason-ch chen    2023-10-23   272  				arm,psci-suspend-param = <0x01010010>;
800ef7029f37c5 jason-ch chen    2023-10-23   273  				local-timer-stop;
800ef7029f37c5 jason-ch chen    2023-10-23   274  				entry-latency-us = <55>;
800ef7029f37c5 jason-ch chen    2023-10-23   275  				exit-latency-us = <155>;
800ef7029f37c5 jason-ch chen    2023-10-23   276  				min-residency-us = <840>;
800ef7029f37c5 jason-ch chen    2023-10-23   277  			};
800ef7029f37c5 jason-ch chen    2023-10-23   278  
800ef7029f37c5 jason-ch chen    2023-10-23   279  			cluster_off_b: cluster-off-b {
800ef7029f37c5 jason-ch chen    2023-10-23   280  				compatible = "arm,idle-state";
800ef7029f37c5 jason-ch chen    2023-10-23   281  				arm,psci-suspend-param = <0x01010010>;
800ef7029f37c5 jason-ch chen    2023-10-23   282  				local-timer-stop;
800ef7029f37c5 jason-ch chen    2023-10-23   283  				entry-latency-us = <50>;
800ef7029f37c5 jason-ch chen    2023-10-23   284  				exit-latency-us = <200>;
800ef7029f37c5 jason-ch chen    2023-10-23   285  				min-residency-us = <1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   286  			};
6af14ba53ac522 Johnson Wang     2022-07-25   287  
cbb0f8b948cfda Fei Shao         2024-06-14   288  			mcusys_off: mcusys-off {
6af14ba53ac522 Johnson Wang     2022-07-25   289  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   290  				arm,psci-suspend-param = <0x01010024>;
6af14ba53ac522 Johnson Wang     2022-07-25   291  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   292  				entry-latency-us = <640>;
6af14ba53ac522 Johnson Wang     2022-07-25   293  				exit-latency-us = <1400>;
6af14ba53ac522 Johnson Wang     2022-07-25   294  				min-residency-us = <13200>;
6af14ba53ac522 Johnson Wang     2022-07-25   295  			};
6af14ba53ac522 Johnson Wang     2022-07-25   296  
cbb0f8b948cfda Fei Shao         2024-06-14   297  			system_mem: system-mem {
6af14ba53ac522 Johnson Wang     2022-07-25   298  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   299  				arm,psci-suspend-param = <0x01010030>;
6af14ba53ac522 Johnson Wang     2022-07-25   300  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   301  				entry-latency-us = <640>;
6af14ba53ac522 Johnson Wang     2022-07-25   302  				exit-latency-us = <1800>;
6af14ba53ac522 Johnson Wang     2022-07-25   303  				min-residency-us = <13200>;
6af14ba53ac522 Johnson Wang     2022-07-25   304  			};
6af14ba53ac522 Johnson Wang     2022-07-25   305  
cbb0f8b948cfda Fei Shao         2024-06-14   306  			system_pll: system-pll {
6af14ba53ac522 Johnson Wang     2022-07-25   307  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   308  				arm,psci-suspend-param = <0x01010040>;
6af14ba53ac522 Johnson Wang     2022-07-25   309  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   310  				entry-latency-us = <640>;
6af14ba53ac522 Johnson Wang     2022-07-25   311  				exit-latency-us = <1850>;
6af14ba53ac522 Johnson Wang     2022-07-25   312  				min-residency-us = <13200>;
6af14ba53ac522 Johnson Wang     2022-07-25   313  			};
6af14ba53ac522 Johnson Wang     2022-07-25   314  
cbb0f8b948cfda Fei Shao         2024-06-14   315  			system_bus: system-bus {
6af14ba53ac522 Johnson Wang     2022-07-25   316  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   317  				arm,psci-suspend-param = <0x01010050>;
6af14ba53ac522 Johnson Wang     2022-07-25   318  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   319  				entry-latency-us = <640>;
6af14ba53ac522 Johnson Wang     2022-07-25   320  				exit-latency-us = <2800>;
6af14ba53ac522 Johnson Wang     2022-07-25   321  				min-residency-us = <13200>;
6af14ba53ac522 Johnson Wang     2022-07-25   322  			};
6af14ba53ac522 Johnson Wang     2022-07-25   323  
6af14ba53ac522 Johnson Wang     2022-07-25   324  			s2idle: s2idle {
6af14ba53ac522 Johnson Wang     2022-07-25   325  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   326  				arm,psci-suspend-param = <0x01011f01>;
6af14ba53ac522 Johnson Wang     2022-07-25   327  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   328  				entry-latency-us = <10000>;
6af14ba53ac522 Johnson Wang     2022-07-25   329  				exit-latency-us = <10000>;
6af14ba53ac522 Johnson Wang     2022-07-25   330  				min-residency-us = <4294967295>;
6af14ba53ac522 Johnson Wang     2022-07-25   331  			};
800ef7029f37c5 jason-ch chen    2023-10-23   332  		};
800ef7029f37c5 jason-ch chen    2023-10-23   333  
800ef7029f37c5 jason-ch chen    2023-10-23   334  		l2_0: l2-cache0 {
800ef7029f37c5 jason-ch chen    2023-10-23   335  			compatible = "cache";
800ef7029f37c5 jason-ch chen    2023-10-23   336  			cache-level = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   337  			cache-size = <131072>;
800ef7029f37c5 jason-ch chen    2023-10-23   338  			cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   339  			cache-sets = <512>;
800ef7029f37c5 jason-ch chen    2023-10-23   340  			next-level-cache = <&l3_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   341  			cache-unified;
800ef7029f37c5 jason-ch chen    2023-10-23   342  		};
800ef7029f37c5 jason-ch chen    2023-10-23   343  
800ef7029f37c5 jason-ch chen    2023-10-23   344  		l2_1: l2-cache1 {
800ef7029f37c5 jason-ch chen    2023-10-23   345  			compatible = "cache";
800ef7029f37c5 jason-ch chen    2023-10-23   346  			cache-level = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   347  			cache-size = <262144>;
800ef7029f37c5 jason-ch chen    2023-10-23   348  			cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   349  			cache-sets = <512>;
800ef7029f37c5 jason-ch chen    2023-10-23   350  			next-level-cache = <&l3_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   351  			cache-unified;
800ef7029f37c5 jason-ch chen    2023-10-23   352  		};
800ef7029f37c5 jason-ch chen    2023-10-23   353  
800ef7029f37c5 jason-ch chen    2023-10-23   354  		l3_0: l3-cache {
800ef7029f37c5 jason-ch chen    2023-10-23   355  			compatible = "cache";
800ef7029f37c5 jason-ch chen    2023-10-23   356  			cache-level = <3>;
800ef7029f37c5 jason-ch chen    2023-10-23   357  			cache-size = <2097152>;
800ef7029f37c5 jason-ch chen    2023-10-23   358  			cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   359  			cache-sets = <2048>;
800ef7029f37c5 jason-ch chen    2023-10-23   360  			cache-unified;
800ef7029f37c5 jason-ch chen    2023-10-23   361  		};
800ef7029f37c5 jason-ch chen    2023-10-23   362  	};
800ef7029f37c5 jason-ch chen    2023-10-23   363  
800ef7029f37c5 jason-ch chen    2023-10-23   364  	clk13m: oscillator-13m {
800ef7029f37c5 jason-ch chen    2023-10-23   365  		compatible = "fixed-clock";
800ef7029f37c5 jason-ch chen    2023-10-23   366  		#clock-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23   367  		clock-frequency = <13000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   368  		clock-output-names = "clk13m";
800ef7029f37c5 jason-ch chen    2023-10-23   369  	};
800ef7029f37c5 jason-ch chen    2023-10-23   370  
800ef7029f37c5 jason-ch chen    2023-10-23   371  	clk26m: oscillator-26m {
800ef7029f37c5 jason-ch chen    2023-10-23   372  		compatible = "fixed-clock";
800ef7029f37c5 jason-ch chen    2023-10-23   373  		#clock-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23   374  		clock-frequency = <26000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   375  		clock-output-names = "clk26m";
800ef7029f37c5 jason-ch chen    2023-10-23   376  	};
800ef7029f37c5 jason-ch chen    2023-10-23   377  
800ef7029f37c5 jason-ch chen    2023-10-23   378  	clk32k: oscillator-32k {
800ef7029f37c5 jason-ch chen    2023-10-23   379  		compatible = "fixed-clock";
800ef7029f37c5 jason-ch chen    2023-10-23   380  		#clock-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23   381  		clock-frequency = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   382  		clock-output-names = "clk32k";
800ef7029f37c5 jason-ch chen    2023-10-23   383  	};
800ef7029f37c5 jason-ch chen    2023-10-23   384  
cbb0f8b948cfda Fei Shao         2024-06-14   385  	gpu_opp_table: opp-table0 {
fc3eef90bc9933 Johnson Wang     2023-02-14   386  		compatible = "operating-points-v2", "operating-points-v2-mali";
fc3eef90bc9933 Johnson Wang     2023-02-14   387  		opp-shared;
fc3eef90bc9933 Johnson Wang     2023-02-14   388  
fc3eef90bc9933 Johnson Wang     2023-02-14   389  		opp-390000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   390  			opp-hz = /bits/ 64 <390000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   391  			opp-hz-real = /bits/ 64 <390000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   392  				      /bits/ 64 <390000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   393  			opp-microvolt = <575000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   394  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   395  
fc3eef90bc9933 Johnson Wang     2023-02-14   396  		opp-431000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   397  			opp-hz = /bits/ 64 <431000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   398  			opp-hz-real = /bits/ 64 <431000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   399  				      /bits/ 64 <531000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   400  			opp-microvolt = <587500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   401  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   402  
fc3eef90bc9933 Johnson Wang     2023-02-14   403  		opp-473000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   404  			opp-hz = /bits/ 64 <473000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   405  			opp-hz-real = /bits/ 64 <473000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   406  				      /bits/ 64 <473000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   407  			opp-microvolt = <600000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   408  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   409  
fc3eef90bc9933 Johnson Wang     2023-02-14   410  		opp-515000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   411  			opp-hz = /bits/ 64 <515000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   412  			opp-hz-real = /bits/ 64 <515000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   413  				      /bits/ 64 <515000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   414  			opp-microvolt = <612500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   415  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   416  
fc3eef90bc9933 Johnson Wang     2023-02-14   417  		opp-556000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   418  			opp-hz = /bits/ 64 <556000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   419  			opp-hz-real = /bits/ 64 <556000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   420  				      /bits/ 64 <556000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   421  			opp-microvolt = <625000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   422  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   423  
fc3eef90bc9933 Johnson Wang     2023-02-14   424  		opp-598000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   425  			opp-hz = /bits/ 64 <598000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   426  			opp-hz-real = /bits/ 64 <598000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   427  				      /bits/ 64 <598000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   428  			opp-microvolt = <637500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   429  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   430  
fc3eef90bc9933 Johnson Wang     2023-02-14   431  		opp-640000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   432  			opp-hz = /bits/ 64 <640000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   433  			opp-hz-real = /bits/ 64 <640000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   434  				      /bits/ 64 <640000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   435  			opp-microvolt = <650000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   436  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   437  
fc3eef90bc9933 Johnson Wang     2023-02-14   438  		opp-670000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   439  			opp-hz = /bits/ 64 <670000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   440  			opp-hz-real = /bits/ 64 <670000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   441  				      /bits/ 64 <670000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   442  			opp-microvolt = <662500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   443  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   444  
fc3eef90bc9933 Johnson Wang     2023-02-14   445  		opp-700000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   446  			opp-hz = /bits/ 64 <700000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   447  			opp-hz-real = /bits/ 64 <700000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   448  				      /bits/ 64 <700000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   449  			opp-microvolt = <675000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   450  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   451  
fc3eef90bc9933 Johnson Wang     2023-02-14   452  		opp-730000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   453  			opp-hz = /bits/ 64 <730000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   454  			opp-hz-real = /bits/ 64 <730000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   455  				      /bits/ 64 <730000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   456  			opp-microvolt = <687500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   457  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   458  
fc3eef90bc9933 Johnson Wang     2023-02-14   459  		opp-760000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   460  			opp-hz = /bits/ 64 <760000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   461  			opp-hz-real = /bits/ 64 <760000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   462  				      /bits/ 64 <760000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   463  			opp-microvolt = <700000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   464  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   465  
fc3eef90bc9933 Johnson Wang     2023-02-14   466  		opp-790000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   467  			opp-hz = /bits/ 64 <790000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   468  			opp-hz-real = /bits/ 64 <790000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   469  				      /bits/ 64 <790000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   470  			opp-microvolt = <712500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   471  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   472  
fc3eef90bc9933 Johnson Wang     2023-02-14   473  		opp-835000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   474  			opp-hz = /bits/ 64 <835000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   475  			opp-hz-real = /bits/ 64 <835000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   476  				      /bits/ 64 <835000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   477  			opp-microvolt = <731250>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   478  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   479  
fc3eef90bc9933 Johnson Wang     2023-02-14   480  		opp-880000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   481  			opp-hz = /bits/ 64 <880000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   482  			opp-hz-real = /bits/ 64 <880000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   483  				      /bits/ 64 <880000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   484  			opp-microvolt = <750000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   485  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   486  
fc3eef90bc9933 Johnson Wang     2023-02-14   487  		opp-915000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   488  			opp-hz = /bits/ 64 <915000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   489  			opp-hz-real = /bits/ 64 <915000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   490  				      /bits/ 64 <915000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   491  			opp-microvolt = <775000>, <775000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   492  			opp-microvolt-bin5 = <762500>, <762500>;
fc3eef90bc9933 Johnson Wang     2023-02-14   493  			opp-microvolt-bin6 = <750000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   494  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   495  
fc3eef90bc9933 Johnson Wang     2023-02-14   496  		opp-950000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   497  			opp-hz = /bits/ 64 <950000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   498  			opp-hz-real = /bits/ 64 <950000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   499  				      /bits/ 64 <950000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   500  			opp-microvolt = <800000>, <800000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   501  			opp-microvolt-bin5 = <775000>, <775000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   502  			opp-microvolt-bin6 = <750000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   503  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   504  	};
fc3eef90bc9933 Johnson Wang     2023-02-14   505  
800ef7029f37c5 jason-ch chen    2023-10-23   506  	pmu-a55 {
800ef7029f37c5 jason-ch chen    2023-10-23   507  		compatible = "arm,cortex-a55-pmu";
800ef7029f37c5 jason-ch chen    2023-10-23   508  		interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23   509  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
800ef7029f37c5 jason-ch chen    2023-10-23   510  	};
800ef7029f37c5 jason-ch chen    2023-10-23   511  
800ef7029f37c5 jason-ch chen    2023-10-23   512  	pmu-a78 {
800ef7029f37c5 jason-ch chen    2023-10-23   513  		compatible = "arm,cortex-a78-pmu";
800ef7029f37c5 jason-ch chen    2023-10-23   514  		interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23   515  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
800ef7029f37c5 jason-ch chen    2023-10-23   516  	};
800ef7029f37c5 jason-ch chen    2023-10-23   517  
800ef7029f37c5 jason-ch chen    2023-10-23   518  	psci {
800ef7029f37c5 jason-ch chen    2023-10-23   519  		compatible = "arm,psci-1.0";
800ef7029f37c5 jason-ch chen    2023-10-23   520  		method = "smc";
800ef7029f37c5 jason-ch chen    2023-10-23   521  	};
800ef7029f37c5 jason-ch chen    2023-10-23   522  
1420601ea128b8 Trevor Wu        2023-03-20   523  	sound: sound {
1420601ea128b8 Trevor Wu        2023-03-20   524  		mediatek,platform = <&afe>;
1420601ea128b8 Trevor Wu        2023-03-20   525  		status = "disabled";
1420601ea128b8 Trevor Wu        2023-03-20   526  	};
1420601ea128b8 Trevor Wu        2023-03-20   527  
028639398cd6a9 Johnson Wang     2023-03-16   528  	vtemp: vtemp {
028639398cd6a9 Johnson Wang     2023-03-16   529  		compatible = "mediatek,virtual-temp";
028639398cd6a9 Johnson Wang     2023-03-16   530  		#thermal-sensor-cells = <1>;
028639398cd6a9 Johnson Wang     2023-03-16   531  	};
028639398cd6a9 Johnson Wang     2023-03-16   532  
cf583e82282568 Johnson Wang     2023-03-15   533  	thermal_zones: thermal-zones {
cf583e82282568 Johnson Wang     2023-03-15   534  		cpu_little1 {
cf583e82282568 Johnson Wang     2023-03-15   535  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   536  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   537  			thermal-sensors = <&lvtsmcu 0>;
cf583e82282568 Johnson Wang     2023-03-15   538  
cf583e82282568 Johnson Wang     2023-03-15   539  			trips {
cf583e82282568 Johnson Wang     2023-03-15   540  				cpu_little1_crit: cpu-little1-crit {
cf583e82282568 Johnson Wang     2023-03-15   541  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   542  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   543  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   544  				};
cf583e82282568 Johnson Wang     2023-03-15   545  			};
cf583e82282568 Johnson Wang     2023-03-15   546  		};
cf583e82282568 Johnson Wang     2023-03-15   547  
cf583e82282568 Johnson Wang     2023-03-15   548  		cpu_little2 {
cf583e82282568 Johnson Wang     2023-03-15   549  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   550  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   551  			thermal-sensors = <&lvtsmcu 1>;
cf583e82282568 Johnson Wang     2023-03-15   552  
cf583e82282568 Johnson Wang     2023-03-15   553  			trips {
cf583e82282568 Johnson Wang     2023-03-15   554  				cpu_little2_crit: cpu-little2-crit {
cf583e82282568 Johnson Wang     2023-03-15   555  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   556  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   557  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   558  				};
cf583e82282568 Johnson Wang     2023-03-15   559  			};
cf583e82282568 Johnson Wang     2023-03-15   560  		};
cf583e82282568 Johnson Wang     2023-03-15   561  
cf583e82282568 Johnson Wang     2023-03-15   562  		cpu_little3 {
cf583e82282568 Johnson Wang     2023-03-15   563  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   564  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   565  			thermal-sensors = <&lvtsmcu 2>;
cf583e82282568 Johnson Wang     2023-03-15   566  
cf583e82282568 Johnson Wang     2023-03-15   567  			trips {
cf583e82282568 Johnson Wang     2023-03-15   568  				cpu_little3_crit: cpu-little3-crit {
cf583e82282568 Johnson Wang     2023-03-15   569  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   570  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   571  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   572  				};
cf583e82282568 Johnson Wang     2023-03-15   573  			};
cf583e82282568 Johnson Wang     2023-03-15   574  		};
cf583e82282568 Johnson Wang     2023-03-15   575  
cf583e82282568 Johnson Wang     2023-03-15   576  		cpu_little4 {
cf583e82282568 Johnson Wang     2023-03-15   577  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   578  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   579  			thermal-sensors = <&lvtsmcu 3>;
cf583e82282568 Johnson Wang     2023-03-15   580  
cf583e82282568 Johnson Wang     2023-03-15   581  			trips {
cf583e82282568 Johnson Wang     2023-03-15   582  				cpu_little4_crit: cpu-little4-crit {
cf583e82282568 Johnson Wang     2023-03-15   583  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   584  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   585  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   586  				};
cf583e82282568 Johnson Wang     2023-03-15   587  			};
cf583e82282568 Johnson Wang     2023-03-15   588  		};
cf583e82282568 Johnson Wang     2023-03-15   589  
cf583e82282568 Johnson Wang     2023-03-15   590  		cpu_big0 {
cf583e82282568 Johnson Wang     2023-03-15   591  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   592  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   593  			thermal-sensors = <&lvtsmcu 4>;
cf583e82282568 Johnson Wang     2023-03-15   594  
cf583e82282568 Johnson Wang     2023-03-15   595  			trips {
cf583e82282568 Johnson Wang     2023-03-15   596  				cpu_big0_crit: cpu-big0-crit {
cf583e82282568 Johnson Wang     2023-03-15   597  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   598  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   599  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   600  				};
cf583e82282568 Johnson Wang     2023-03-15   601  			};
cf583e82282568 Johnson Wang     2023-03-15   602  		};
cf583e82282568 Johnson Wang     2023-03-15   603  
cf583e82282568 Johnson Wang     2023-03-15   604  		cpu_big1 {
cf583e82282568 Johnson Wang     2023-03-15   605  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   606  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   607  			thermal-sensors = <&lvtsmcu 5>;
cf583e82282568 Johnson Wang     2023-03-15   608  
cf583e82282568 Johnson Wang     2023-03-15   609  			trips {
cf583e82282568 Johnson Wang     2023-03-15   610  				cpu_big1_crit: cpu-big1-crit {
cf583e82282568 Johnson Wang     2023-03-15   611  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   612  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   613  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   614  				};
cf583e82282568 Johnson Wang     2023-03-15   615  			};
cf583e82282568 Johnson Wang     2023-03-15   616  		};
cf583e82282568 Johnson Wang     2023-03-15   617  
cf583e82282568 Johnson Wang     2023-03-15   618  		apu {
cf583e82282568 Johnson Wang     2023-03-15   619  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   620  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   621  			thermal-sensors = <&lvtsap 0>;
cf583e82282568 Johnson Wang     2023-03-15   622  
cf583e82282568 Johnson Wang     2023-03-15   623  			trips {
cf583e82282568 Johnson Wang     2023-03-15   624  				apu_crit: apu-crit {
cf583e82282568 Johnson Wang     2023-03-15   625  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   626  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   627  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   628  				};
cf583e82282568 Johnson Wang     2023-03-15   629  			};
cf583e82282568 Johnson Wang     2023-03-15   630  		};
cf583e82282568 Johnson Wang     2023-03-15   631  
cf583e82282568 Johnson Wang     2023-03-15   632  		gpu1 {
cf583e82282568 Johnson Wang     2023-03-15   633  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   634  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   635  			thermal-sensors = <&lvtsap 1>;
cf583e82282568 Johnson Wang     2023-03-15   636  
cf583e82282568 Johnson Wang     2023-03-15   637  			trips {
cf583e82282568 Johnson Wang     2023-03-15   638  				gpu1_crit: gpu1-crit {
cf583e82282568 Johnson Wang     2023-03-15   639  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   640  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   641  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   642  				};
cf583e82282568 Johnson Wang     2023-03-15   643  			};
cf583e82282568 Johnson Wang     2023-03-15   644  		};
cf583e82282568 Johnson Wang     2023-03-15   645  
cf583e82282568 Johnson Wang     2023-03-15   646  		gpu2 {
cf583e82282568 Johnson Wang     2023-03-15   647  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   648  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   649  			thermal-sensors = <&lvtsap 2>;
cf583e82282568 Johnson Wang     2023-03-15   650  
cf583e82282568 Johnson Wang     2023-03-15   651  			trips {
cf583e82282568 Johnson Wang     2023-03-15   652  				gpu2_crit: gpu2-crit {
cf583e82282568 Johnson Wang     2023-03-15   653  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   654  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   655  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   656  				};
cf583e82282568 Johnson Wang     2023-03-15   657  			};
cf583e82282568 Johnson Wang     2023-03-15   658  		};
cf583e82282568 Johnson Wang     2023-03-15   659  
cf583e82282568 Johnson Wang     2023-03-15   660  		soc1 {
cf583e82282568 Johnson Wang     2023-03-15   661  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   662  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   663  			thermal-sensors = <&lvtsap 3>;
cf583e82282568 Johnson Wang     2023-03-15   664  
cf583e82282568 Johnson Wang     2023-03-15   665  			trips {
cf583e82282568 Johnson Wang     2023-03-15   666  				soc1_crit: soc1-crit {
cf583e82282568 Johnson Wang     2023-03-15   667  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   668  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   669  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   670  				};
cf583e82282568 Johnson Wang     2023-03-15   671  			};
cf583e82282568 Johnson Wang     2023-03-15   672  		};
cf583e82282568 Johnson Wang     2023-03-15   673  
cf583e82282568 Johnson Wang     2023-03-15   674  		soc2 {
cf583e82282568 Johnson Wang     2023-03-15   675  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   676  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   677  			thermal-sensors = <&lvtsap 4>;
cf583e82282568 Johnson Wang     2023-03-15   678  
cf583e82282568 Johnson Wang     2023-03-15   679  			trips {
cf583e82282568 Johnson Wang     2023-03-15   680  				soc2_crit: soc2-crit {
cf583e82282568 Johnson Wang     2023-03-15   681  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   682  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   683  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   684  				};
cf583e82282568 Johnson Wang     2023-03-15   685  			};
cf583e82282568 Johnson Wang     2023-03-15   686  		};
cf583e82282568 Johnson Wang     2023-03-15   687  
cf583e82282568 Johnson Wang     2023-03-15   688  		soc3 {
cf583e82282568 Johnson Wang     2023-03-15   689  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   690  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   691  			thermal-sensors = <&lvtsap 5>;
cf583e82282568 Johnson Wang     2023-03-15   692  
cf583e82282568 Johnson Wang     2023-03-15   693  			trips {
cf583e82282568 Johnson Wang     2023-03-15   694  				soc3_crit: soc3-crit {
cf583e82282568 Johnson Wang     2023-03-15   695  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   696  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   697  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   698  				};
cf583e82282568 Johnson Wang     2023-03-15   699  			};
cf583e82282568 Johnson Wang     2023-03-15   700  		};
cf583e82282568 Johnson Wang     2023-03-15   701  
cf583e82282568 Johnson Wang     2023-03-15   702  		cam1 {
cf583e82282568 Johnson Wang     2023-03-15   703  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   704  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   705  			thermal-sensors = <&lvtsap 6>;
cf583e82282568 Johnson Wang     2023-03-15   706  
cf583e82282568 Johnson Wang     2023-03-15   707  			trips {
cf583e82282568 Johnson Wang     2023-03-15   708  				cam1_crit: cam1-crit {
cf583e82282568 Johnson Wang     2023-03-15   709  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   710  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   711  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   712  				};
cf583e82282568 Johnson Wang     2023-03-15   713  			};
cf583e82282568 Johnson Wang     2023-03-15   714  		};
cf583e82282568 Johnson Wang     2023-03-15   715  
cf583e82282568 Johnson Wang     2023-03-15   716  		cam2 {
cf583e82282568 Johnson Wang     2023-03-15   717  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   718  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   719  			thermal-sensors = <&lvtsap 7>;
cf583e82282568 Johnson Wang     2023-03-15   720  
cf583e82282568 Johnson Wang     2023-03-15   721  			trips {
cf583e82282568 Johnson Wang     2023-03-15   722  				cam2_crit: cam2-crit {
cf583e82282568 Johnson Wang     2023-03-15   723  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   724  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   725  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   726  				};
cf583e82282568 Johnson Wang     2023-03-15   727  			};
cf583e82282568 Johnson Wang     2023-03-15   728  		};
028639398cd6a9 Johnson Wang     2023-03-16   729  
028639398cd6a9 Johnson Wang     2023-03-16   730  		soc_max {
028639398cd6a9 Johnson Wang     2023-03-16   731  			polling-delay = <1000>; /* milliseconds */
028639398cd6a9 Johnson Wang     2023-03-16   732  			polling-delay-passive = <100>; /* milliseconds */
028639398cd6a9 Johnson Wang     2023-03-16   733  			thermal-sensors = <&vtemp 0>;
028639398cd6a9 Johnson Wang     2023-03-16   734  			sustainable-power = <1500>;
028639398cd6a9 Johnson Wang     2023-03-16   735  
028639398cd6a9 Johnson Wang     2023-03-16   736  			trips {
028639398cd6a9 Johnson Wang     2023-03-16  @737  				threshold: trip-point@0 {
028639398cd6a9 Johnson Wang     2023-03-16   738  					temperature = <68000>;
028639398cd6a9 Johnson Wang     2023-03-16   739  					hysteresis = <2000>;
028639398cd6a9 Johnson Wang     2023-03-16   740  					type = "passive";
028639398cd6a9 Johnson Wang     2023-03-16   741  				};
028639398cd6a9 Johnson Wang     2023-03-16   742  
028639398cd6a9 Johnson Wang     2023-03-16   743  				target: target@1 {
028639398cd6a9 Johnson Wang     2023-03-16   744  					temperature = <85000>;
028639398cd6a9 Johnson Wang     2023-03-16   745  					hysteresis = <2000>;
028639398cd6a9 Johnson Wang     2023-03-16   746  					type = "passive";
028639398cd6a9 Johnson Wang     2023-03-16   747  				};
028639398cd6a9 Johnson Wang     2023-03-16   748  
cbb0f8b948cfda Fei Shao         2024-06-14  @749  				soc_max_crit: soc-max-crit@0 {
028639398cd6a9 Johnson Wang     2023-03-16   750  					temperature = <115000>;
028639398cd6a9 Johnson Wang     2023-03-16   751  					hysteresis = <2000>;
028639398cd6a9 Johnson Wang     2023-03-16   752  					type = "critical";
028639398cd6a9 Johnson Wang     2023-03-16   753  				};
028639398cd6a9 Johnson Wang     2023-03-16   754  			};
028639398cd6a9 Johnson Wang     2023-03-16   755  
028639398cd6a9 Johnson Wang     2023-03-16   756  			cooling_map: cooling-maps {
028639398cd6a9 Johnson Wang     2023-03-16   757  				map0 {
028639398cd6a9 Johnson Wang     2023-03-16   758  					trip = <&target>;
028639398cd6a9 Johnson Wang     2023-03-16   759  					cooling-device = <&cpu0
028639398cd6a9 Johnson Wang     2023-03-16   760  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   761  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   762  							<&cpu1
028639398cd6a9 Johnson Wang     2023-03-16   763  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   764  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   765  							<&cpu2
028639398cd6a9 Johnson Wang     2023-03-16   766  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   767  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   768  							<&cpu3
028639398cd6a9 Johnson Wang     2023-03-16   769  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   770  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   771  							<&cpu4
028639398cd6a9 Johnson Wang     2023-03-16   772  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   773  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   774  							<&cpu5
028639398cd6a9 Johnson Wang     2023-03-16   775  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   776  						THERMAL_NO_LIMIT>;
028639398cd6a9 Johnson Wang     2023-03-16   777  					contribution = <2345>;
028639398cd6a9 Johnson Wang     2023-03-16   778  				};
028639398cd6a9 Johnson Wang     2023-03-16   779  
028639398cd6a9 Johnson Wang     2023-03-16   780  				map1 {
028639398cd6a9 Johnson Wang     2023-03-16   781  					trip = <&target>;
028639398cd6a9 Johnson Wang     2023-03-16   782  					cooling-device = <&cpu6
028639398cd6a9 Johnson Wang     2023-03-16   783  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   784  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   785  							<&cpu7
028639398cd6a9 Johnson Wang     2023-03-16   786  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   787  						THERMAL_NO_LIMIT>;
028639398cd6a9 Johnson Wang     2023-03-16   788  					contribution = <1024>;
028639398cd6a9 Johnson Wang     2023-03-16   789  				};
028639398cd6a9 Johnson Wang     2023-03-16   790  			};
028639398cd6a9 Johnson Wang     2023-03-16   791  		};
cf583e82282568 Johnson Wang     2023-03-15   792  	};
cf583e82282568 Johnson Wang     2023-03-15   793  
800ef7029f37c5 jason-ch chen    2023-10-23   794  	timer: timer {
800ef7029f37c5 jason-ch chen    2023-10-23   795  		compatible = "arm,armv8-timer";
800ef7029f37c5 jason-ch chen    2023-10-23   796  		interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23   797  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
800ef7029f37c5 jason-ch chen    2023-10-23   798  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
800ef7029f37c5 jason-ch chen    2023-10-23   799  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
800ef7029f37c5 jason-ch chen    2023-10-23   800  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   801  		clock-frequency = <13000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   802  	};
800ef7029f37c5 jason-ch chen    2023-10-23   803  
800ef7029f37c5 jason-ch chen    2023-10-23   804  	soc {
800ef7029f37c5 jason-ch chen    2023-10-23   805  		#address-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   806  		#size-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   807  		compatible = "simple-bus";
62f31509bdccce Chengci Xu       2023-05-19   808  		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
800ef7029f37c5 jason-ch chen    2023-10-23   809  		ranges;
800ef7029f37c5 jason-ch chen    2023-10-23   810  
277f9534dc71a9 Johnson Wang     2023-03-10   811  		performance: performance-controller@11bc10 {
277f9534dc71a9 Johnson Wang     2023-03-10   812  			compatible = "mediatek,cpufreq-hw";
277f9534dc71a9 Johnson Wang     2023-03-10   813  			reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
277f9534dc71a9 Johnson Wang     2023-03-10   814  			#performance-domain-cells = <1>;
277f9534dc71a9 Johnson Wang     2023-03-10   815  		};
277f9534dc71a9 Johnson Wang     2023-03-10   816  
800ef7029f37c5 jason-ch chen    2023-10-23   817  		gic: interrupt-controller@c000000 {
800ef7029f37c5 jason-ch chen    2023-10-23   818  			compatible = "arm,gic-v3";
800ef7029f37c5 jason-ch chen    2023-10-23   819  			#interrupt-cells = <4>;
6af14ba53ac522 Johnson Wang     2022-07-25   820  			#address-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25   821  			#size-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   822  			#redistributor-regions = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23   823  			interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23   824  			interrupt-controller;
800ef7029f37c5 jason-ch chen    2023-10-23   825  			reg = <0 0x0c000000 0 0x40000>,
800ef7029f37c5 jason-ch chen    2023-10-23   826  			      <0 0x0c040000 0 0x200000>;
800ef7029f37c5 jason-ch chen    2023-10-23   827  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   828  
800ef7029f37c5 jason-ch chen    2023-10-23   829  			ppi-partitions {
800ef7029f37c5 jason-ch chen    2023-10-23   830  				ppi_cluster0: interrupt-partition-0 {
800ef7029f37c5 jason-ch chen    2023-10-23   831  					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
800ef7029f37c5 jason-ch chen    2023-10-23   832  				};
800ef7029f37c5 jason-ch chen    2023-10-23   833  
800ef7029f37c5 jason-ch chen    2023-10-23   834  				ppi_cluster1: interrupt-partition-1 {
800ef7029f37c5 jason-ch chen    2023-10-23   835  					affinity = <&cpu6 &cpu7>;
800ef7029f37c5 jason-ch chen    2023-10-23   836  				};
800ef7029f37c5 jason-ch chen    2023-10-23   837  			};
800ef7029f37c5 jason-ch chen    2023-10-23   838  		};
800ef7029f37c5 jason-ch chen    2023-10-23   839  
800ef7029f37c5 jason-ch chen    2023-10-23   840  		topckgen: syscon@10000000 {
800ef7029f37c5 jason-ch chen    2023-10-23   841  			compatible = "mediatek,mt8188-topckgen", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23   842  			reg = <0 0x10000000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   843  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23   844  		};
800ef7029f37c5 jason-ch chen    2023-10-23   845  
800ef7029f37c5 jason-ch chen    2023-10-23   846  		infracfg_ao: syscon@10001000 {
800ef7029f37c5 jason-ch chen    2023-10-23   847  			compatible = "mediatek,mt8188-infracfg-ao", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23   848  			reg = <0 0x10001000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   849  			#clock-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   850  			#reset-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23   851  		};
800ef7029f37c5 jason-ch chen    2023-10-23   852  
800ef7029f37c5 jason-ch chen    2023-10-23   853  		pericfg: syscon@10003000 {
800ef7029f37c5 jason-ch chen    2023-10-23   854  			compatible = "mediatek,mt8188-pericfg", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23   855  			reg = <0 0x10003000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   856  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23   857  		};
800ef7029f37c5 jason-ch chen    2023-10-23   858  
800ef7029f37c5 jason-ch chen    2023-10-23   859  		pio: pinctrl@10005000 {
800ef7029f37c5 jason-ch chen    2023-10-23   860  			compatible = "mediatek,mt8188-pinctrl";
800ef7029f37c5 jason-ch chen    2023-10-23   861  			reg = <0 0x10005000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   862  			      <0 0x11c00000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   863  			      <0 0x11e10000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   864  			      <0 0x11e20000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   865  			      <0 0x11ea0000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   866  			      <0 0x1000b000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   867  			reg-names = "iocfg0", "iocfg_rm", "iocfg_lt",
800ef7029f37c5 jason-ch chen    2023-10-23   868  				    "iocfg_lm", "iocfg_rt", "eint";
800ef7029f37c5 jason-ch chen    2023-10-23   869  			gpio-controller;
800ef7029f37c5 jason-ch chen    2023-10-23   870  			#gpio-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   871  			gpio-ranges = <&pio 0 0 176>;
800ef7029f37c5 jason-ch chen    2023-10-23   872  			interrupt-controller;
800ef7029f37c5 jason-ch chen    2023-10-23   873  			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   874  			#interrupt-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   875  		};
800ef7029f37c5 jason-ch chen    2023-10-23   876  
6af14ba53ac522 Johnson Wang     2022-07-25   877  		scpsys: syscon@10006000 {
6af14ba53ac522 Johnson Wang     2022-07-25   878  			compatible = "syscon", "simple-mfd";
6af14ba53ac522 Johnson Wang     2022-07-25   879  			reg = <0 0x10006000 0 0x1000>;
6af14ba53ac522 Johnson Wang     2022-07-25   880  			#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   881  
6af14ba53ac522 Johnson Wang     2022-07-25   882  			/* System Power Manager */
6af14ba53ac522 Johnson Wang     2022-07-25   883  			spm: power-controller {
6af14ba53ac522 Johnson Wang     2022-07-25   884  				compatible = "mediatek,mt8188-power-controller";
6af14ba53ac522 Johnson Wang     2022-07-25   885  				#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   886  				#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   887  				#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   888  
6af14ba53ac522 Johnson Wang     2022-07-25   889  				/* power domain of the SoC */
6af14ba53ac522 Johnson Wang     2022-07-25   890  				mfg0: mfg0@MT8188_POWER_DOMAIN_MFG0 {
6af14ba53ac522 Johnson Wang     2022-07-25   891  					reg = <MT8188_POWER_DOMAIN_MFG0>;
6af14ba53ac522 Johnson Wang     2022-07-25   892  					#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   893  					#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   894  					#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   895  
6af14ba53ac522 Johnson Wang     2022-07-25   896  					mfg1@MT8188_POWER_DOMAIN_MFG1 {
6af14ba53ac522 Johnson Wang     2022-07-25   897  						reg = <MT8188_POWER_DOMAIN_MFG1>;
6af14ba53ac522 Johnson Wang     2022-07-25   898  						clocks = <&topckgen CLK_TOP_MFG_CK_FAST_REF>,
6af14ba53ac522 Johnson Wang     2022-07-25   899  							 <&topckgen CLK_TOP_MFG_CORE_TMP>;
6af14ba53ac522 Johnson Wang     2022-07-25   900  						clock-names= "mfg10", "mfg11";
6af14ba53ac522 Johnson Wang     2022-07-25   901  						mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25   902  						#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   903  						#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   904  						#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   905  
6af14ba53ac522 Johnson Wang     2022-07-25   906  						mfg2@MT8188_POWER_DOMAIN_MFG2 {
6af14ba53ac522 Johnson Wang     2022-07-25   907  							reg = <MT8188_POWER_DOMAIN_MFG2>;
6af14ba53ac522 Johnson Wang     2022-07-25   908  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   909  						};
6af14ba53ac522 Johnson Wang     2022-07-25   910  
6af14ba53ac522 Johnson Wang     2022-07-25   911  						mfg3@MT8188_POWER_DOMAIN_MFG3 {
6af14ba53ac522 Johnson Wang     2022-07-25   912  							reg = <MT8188_POWER_DOMAIN_MFG3>;
6af14ba53ac522 Johnson Wang     2022-07-25   913  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   914  						};
6af14ba53ac522 Johnson Wang     2022-07-25   915  
6af14ba53ac522 Johnson Wang     2022-07-25   916  						mfg4@MT8188_POWER_DOMAIN_MFG4 {
6af14ba53ac522 Johnson Wang     2022-07-25   917  							reg = <MT8188_POWER_DOMAIN_MFG4>;
6af14ba53ac522 Johnson Wang     2022-07-25   918  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   919  						};
6af14ba53ac522 Johnson Wang     2022-07-25   920  					};
6af14ba53ac522 Johnson Wang     2022-07-25   921  				};
6af14ba53ac522 Johnson Wang     2022-07-25   922  
6af14ba53ac522 Johnson Wang     2022-07-25   923  				vppsys0@MT8188_POWER_DOMAIN_VPPSYS0 {
6af14ba53ac522 Johnson Wang     2022-07-25   924  					reg = <MT8188_POWER_DOMAIN_VPPSYS0>;
6af14ba53ac522 Johnson Wang     2022-07-25   925  					clocks = <&topckgen CLK_TOP_VPP>,
6af14ba53ac522 Johnson Wang     2022-07-25   926  						 <&topckgen CLK_TOP_CAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   927  						 <&topckgen CLK_TOP_CCU>,
6af14ba53ac522 Johnson Wang     2022-07-25   928  						 <&topckgen CLK_TOP_IMG>,
6af14ba53ac522 Johnson Wang     2022-07-25   929  						 <&topckgen CLK_TOP_VENC>,
6af14ba53ac522 Johnson Wang     2022-07-25   930  						 <&topckgen CLK_TOP_VDEC>,
6af14ba53ac522 Johnson Wang     2022-07-25   931  						 <&topckgen CLK_TOP_WPE_VPP>,
6af14ba53ac522 Johnson Wang     2022-07-25   932  						 <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP0>,
6af14ba53ac522 Johnson Wang     2022-07-25   933  						 <&topckgen CLK_TOP_CFGREG_F26M_VPP0>,
6af14ba53ac522 Johnson Wang     2022-07-25   934  						 <&vppsys0 CLK_VPP0_SMI_COMMON_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   935  						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB0_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   936  						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB1_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   937  						 <&vppsys0 CLK_VPP0_GALS_VENCSYS_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   938  						 <&vppsys0 CLK_VPP0_GALS_VENCSYS_CORE1_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   939  						 <&vppsys0 CLK_VPP0_GALS_INFRA_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   940  						 <&vppsys0 CLK_VPP0_GALS_CAMSYS_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   941  						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB5_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   942  						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB6_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   943  						 <&vppsys0 CLK_VPP0_SMI_REORDER_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   944  						 <&vppsys0 CLK_VPP0_SMI_IOMMU>,
6af14ba53ac522 Johnson Wang     2022-07-25   945  						 <&vppsys0 CLK_VPP0_GALS_IMGSYS_CAMSYS>,
6af14ba53ac522 Johnson Wang     2022-07-25   946  						 <&vppsys0 CLK_VPP0_GALS_EMI0_EMI1>,
6af14ba53ac522 Johnson Wang     2022-07-25   947  						 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>,
6af14ba53ac522 Johnson Wang     2022-07-25   948  						 <&vppsys0 CLK_VPP0_SMI_RSI>,
6af14ba53ac522 Johnson Wang     2022-07-25   949  						 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
6af14ba53ac522 Johnson Wang     2022-07-25   950  						 <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
6af14ba53ac522 Johnson Wang     2022-07-25   951  						 <&vppsys0 CLK_VPP0_GALS_VPP1_WPESYS>,
6af14ba53ac522 Johnson Wang     2022-07-25   952  						 <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1>;
6af14ba53ac522 Johnson Wang     2022-07-25   953  					clock-names = "vppsys00", "vppsys01", "vppsys02", "vppsys03",
6af14ba53ac522 Johnson Wang     2022-07-25   954  						      "vppsys04", "vppsys05", "vppsys06", "vppsys07",
6af14ba53ac522 Johnson Wang     2022-07-25   955  						      "vppsys08", "vppsys0-0", "vppsys0-1", "vppsys0-2",
6af14ba53ac522 Johnson Wang     2022-07-25   956  						      "vppsys0-3", "vppsys0-4", "vppsys0-5", "vppsys0-6",
6af14ba53ac522 Johnson Wang     2022-07-25   957  						      "vppsys0-7", "vppsys0-8", "vppsys0-9", "vppsys0-10",
6af14ba53ac522 Johnson Wang     2022-07-25   958  						      "vppsys0-11", "vppsys0-12", "vppsys0-13", "vppsys0-14",
6af14ba53ac522 Johnson Wang     2022-07-25   959  						      "vppsys0-15", "vppsys0-16", "vppsys0-17", "vppsys0-18";
6af14ba53ac522 Johnson Wang     2022-07-25   960  					mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25   961  					#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   962  					#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   963  					#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   964  
6af14ba53ac522 Johnson Wang     2022-07-25   965  					vdosys0@MT8188_POWER_DOMAIN_VDOSYS0 {
6af14ba53ac522 Johnson Wang     2022-07-25   966  						reg = <MT8188_POWER_DOMAIN_VDOSYS0>;
6af14ba53ac522 Johnson Wang     2022-07-25   967  						clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VDO0>,
6af14ba53ac522 Johnson Wang     2022-07-25   968  							 <&topckgen CLK_TOP_CFGREG_F26M_VDO0>,
6af14ba53ac522 Johnson Wang     2022-07-25   969  							 <&vdosys0 CLK_VDO0_SMI_GALS>,
6af14ba53ac522 Johnson Wang     2022-07-25   970  							 <&vdosys0 CLK_VDO0_SMI_COMMON>,
6af14ba53ac522 Johnson Wang     2022-07-25   971  							 <&vdosys0 CLK_VDO0_SMI_EMI>,
6af14ba53ac522 Johnson Wang     2022-07-25   972  							 <&vdosys0 CLK_VDO0_SMI_IOMMU>,
6af14ba53ac522 Johnson Wang     2022-07-25   973  							 <&vdosys0 CLK_VDO0_SMI_LARB>,
6af14ba53ac522 Johnson Wang     2022-07-25   974  							 <&vdosys0 CLK_VDO0_SMI_RSI>,
6af14ba53ac522 Johnson Wang     2022-07-25   975  							 <&vdosys0 CLK_VDO0_APB_BUS>;
6af14ba53ac522 Johnson Wang     2022-07-25   976  						clock-names = "vdosys00", "vdosys01", "vdosys0-0",
6af14ba53ac522 Johnson Wang     2022-07-25   977  							      "vdosys0-1", "vdosys0-2", "vdosys0-3",
6af14ba53ac522 Johnson Wang     2022-07-25   978  							      "vdosys0-4", "vdosys0-5", "vdosys0-6";
6af14ba53ac522 Johnson Wang     2022-07-25   979  						mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25   980  						#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   981  						#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   982  						#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   983  
6af14ba53ac522 Johnson Wang     2022-07-25   984  						vppsys1@MT8188_POWER_DOMAIN_VPPSYS1 {
6af14ba53ac522 Johnson Wang     2022-07-25   985  							reg = <MT8188_POWER_DOMAIN_VPPSYS1>;
6af14ba53ac522 Johnson Wang     2022-07-25   986  							clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP1>,
6af14ba53ac522 Johnson Wang     2022-07-25   987  								 <&topckgen CLK_TOP_CFGREG_F26M_VPP1>,
6af14ba53ac522 Johnson Wang     2022-07-25   988  								 <&vppsys1 CLK_VPP1_GALS5>,
6af14ba53ac522 Johnson Wang     2022-07-25   989  								 <&vppsys1 CLK_VPP1_GALS6>,
6af14ba53ac522 Johnson Wang     2022-07-25   990  								 <&vppsys1 CLK_VPP1_LARB5>,
6af14ba53ac522 Johnson Wang     2022-07-25   991  								 <&vppsys1 CLK_VPP1_LARB6>;
6af14ba53ac522 Johnson Wang     2022-07-25   992  							clock-names = "vppsys10", "vppsys11", "vppsys1-0",
6af14ba53ac522 Johnson Wang     2022-07-25   993  								      "vppsys1-1", "vppsys1-2", "vppsys1-3";
6af14ba53ac522 Johnson Wang     2022-07-25   994  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25   995  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   996  						};
6af14ba53ac522 Johnson Wang     2022-07-25   997  
ea8f723f4179f0 Jason Chen       2023-09-05   998  						vdec0@MT8188_POWER_DOMAIN_VDEC0 {
ea8f723f4179f0 Jason Chen       2023-09-05   999  							reg = <MT8188_POWER_DOMAIN_VDEC0>;
ea8f723f4179f0 Jason Chen       2023-09-05  1000  							clocks = <&vdecsys_soc CLK_VDEC1_SOC_LARB1>;
ea8f723f4179f0 Jason Chen       2023-09-05  1001  							clock-names = "vdec0-0";
ea8f723f4179f0 Jason Chen       2023-09-05  1002  							mediatek,infracfg = <&infracfg_ao>;
ea8f723f4179f0 Jason Chen       2023-09-05  1003  							#address-cells = <1>;
ea8f723f4179f0 Jason Chen       2023-09-05  1004  							#size-cells = <0>;
ea8f723f4179f0 Jason Chen       2023-09-05  1005  							#power-domain-cells = <1>;
ea8f723f4179f0 Jason Chen       2023-09-05  1006  
6af14ba53ac522 Johnson Wang     2022-07-25  1007  							vdec1@MT8188_POWER_DOMAIN_VDEC1 {
6af14ba53ac522 Johnson Wang     2022-07-25  1008  								reg = <MT8188_POWER_DOMAIN_VDEC1>;
b3a334ebd6e058 Johnson Wang     2023-03-27  1009  								clocks = <&vdecsys CLK_VDEC2_LARB1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1010  								clock-names = "vdec1-0";
6af14ba53ac522 Johnson Wang     2022-07-25  1011  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1012  								#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1013  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1014  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1015  
cbb0f8b948cfda Fei Shao         2024-06-14  1016  						cam_vcore: cam-vcore@MT8188_POWER_DOMAIN_CAM_VCORE {
6af14ba53ac522 Johnson Wang     2022-07-25  1017  							reg = <MT8188_POWER_DOMAIN_CAM_VCORE>;
6af14ba53ac522 Johnson Wang     2022-07-25  1018  							clocks = <&topckgen CLK_TOP_CAM>,
6af14ba53ac522 Johnson Wang     2022-07-25  1019  								 <&topckgen CLK_TOP_CCU>,
6af14ba53ac522 Johnson Wang     2022-07-25  1020  								 <&topckgen CLK_TOP_CCU_AHB>,
6af14ba53ac522 Johnson Wang     2022-07-25  1021  								 <&topckgen CLK_TOP_CFGREG_CLOCK_ISP_AXI_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1022  							clock-names = "cam_vcore0", "cam_vcore1",
6af14ba53ac522 Johnson Wang     2022-07-25  1023  								      "cam_vcore2", "cam_vcore3";
6af14ba53ac522 Johnson Wang     2022-07-25  1024  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1025  							#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1026  							#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1027  							#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1028  
6af14ba53ac522 Johnson Wang     2022-07-25  1029  							cam_main@MT8188_POWER_DOMAIN_CAM_MAIN {
6af14ba53ac522 Johnson Wang     2022-07-25  1030  								reg = <MT8188_POWER_DOMAIN_CAM_MAIN>;
6af14ba53ac522 Johnson Wang     2022-07-25  1031  								clocks = <&camsys CLK_CAM_MAIN_LARB13>,
6af14ba53ac522 Johnson Wang     2022-07-25  1032  									 <&camsys CLK_CAM_MAIN_LARB14>,
6af14ba53ac522 Johnson Wang     2022-07-25  1033  									 <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
6af14ba53ac522 Johnson Wang     2022-07-25  1034  									 <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
6af14ba53ac522 Johnson Wang     2022-07-25  1035  									 <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1036  								clock-names= "cam_main-0", "cam_main-1",
6af14ba53ac522 Johnson Wang     2022-07-25  1037  									     "cam_main-2", "cam_main-3",
6af14ba53ac522 Johnson Wang     2022-07-25  1038  									     "cam_main-4";
6af14ba53ac522 Johnson Wang     2022-07-25  1039  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1040  								#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1041  								#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1042  								#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1043  
6af14ba53ac522 Johnson Wang     2022-07-25  1044  								cam_subb@MT8188_POWER_DOMAIN_CAM_SUBB {
6af14ba53ac522 Johnson Wang     2022-07-25  1045  									reg =<MT8188_POWER_DOMAIN_CAM_SUBB>;
6af14ba53ac522 Johnson Wang     2022-07-25  1046  									clocks = <&camsys CLK_CAM_MAIN_CAM_SUBB>,
6af14ba53ac522 Johnson Wang     2022-07-25  1047  										 <&camsys_rawb CLK_CAM_RAWB_LARBX>,
6af14ba53ac522 Johnson Wang     2022-07-25  1048  										 <&camsys_yuvb CLK_CAM_YUVB_LARBX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1049  									clock-names = "cam_subb-0", "cam_subb-1", "cam_subb-2";
6af14ba53ac522 Johnson Wang     2022-07-25  1050  									mediatek,smi = <&smi_cam0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1051  									mediatek,larb = <&camsys_rawb &camsys_yuvb>;
6af14ba53ac522 Johnson Wang     2022-07-25  1052  									#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1053  								};
6af14ba53ac522 Johnson Wang     2022-07-25  1054  
6af14ba53ac522 Johnson Wang     2022-07-25  1055  								cam_suba@MT8188_POWER_DOMAIN_CAM_SUBA {
6af14ba53ac522 Johnson Wang     2022-07-25  1056  									reg =<MT8188_POWER_DOMAIN_CAM_SUBA>;
6af14ba53ac522 Johnson Wang     2022-07-25  1057  									clocks = <&camsys CLK_CAM_MAIN_CAM_SUBA>,
6af14ba53ac522 Johnson Wang     2022-07-25  1058  										 <&camsys_rawa CLK_CAM_RAWA_LARBX>,
6af14ba53ac522 Johnson Wang     2022-07-25  1059  										 <&camsys_yuva CLK_CAM_YUVA_LARBX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1060  									clock-names = "cam_suba-0", "cam_suba-1", "cam_suba-2";
6af14ba53ac522 Johnson Wang     2022-07-25  1061  									mediatek,smi = <&smi_cam1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1062  									mediatek,larb = <&camsys_rawa &camsys_yuva>;
6af14ba53ac522 Johnson Wang     2022-07-25  1063  									#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1064  								};
6af14ba53ac522 Johnson Wang     2022-07-25  1065  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1066  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1067  
6af14ba53ac522 Johnson Wang     2022-07-25  1068  						vdosys1@MT8188_POWER_DOMAIN_VDOSYS1 {
6af14ba53ac522 Johnson Wang     2022-07-25  1069  							reg = <MT8188_POWER_DOMAIN_VDOSYS1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1070  							clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VDO1>,
6af14ba53ac522 Johnson Wang     2022-07-25  1071  								 <&topckgen CLK_TOP_CFGREG_F26M_VDO1>,
6af14ba53ac522 Johnson Wang     2022-07-25  1072  								 <&vdosys1 CLK_VDO1_SMI_LARB2>,
6af14ba53ac522 Johnson Wang     2022-07-25  1073  								 <&vdosys1 CLK_VDO1_SMI_LARB3>,
6af14ba53ac522 Johnson Wang     2022-07-25  1074  								 <&vdosys1 CLK_VDO1_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1075  							clock-names = "vdosys10", "vdosys11", "vdosys1-0",
6af14ba53ac522 Johnson Wang     2022-07-25  1076  								      "vdosys1-1", "vdosys1-2";
6af14ba53ac522 Johnson Wang     2022-07-25  1077  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1078  							#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1079  							#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1080  							#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1081  
cbb0f8b948cfda Fei Shao         2024-06-14  1082  							hdmi-tx@MT8188_POWER_DOMAIN_HDMI_TX {
6af14ba53ac522 Johnson Wang     2022-07-25  1083  								reg = <MT8188_POWER_DOMAIN_HDMI_TX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1084  								clocks = <&topckgen CLK_TOP_HDMI_APB>,
6af14ba53ac522 Johnson Wang     2022-07-25  1085  									 <&topckgen CLK_TOP_HDCP_24M>;
6af14ba53ac522 Johnson Wang     2022-07-25  1086  								clock-names = "hdmi_tx0", "hdmi_tx1";
6af14ba53ac522 Johnson Wang     2022-07-25  1087  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1088  								#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1089  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1090  
cbb0f8b948cfda Fei Shao         2024-06-14  1091  							dp-tx@MT8188_POWER_DOMAIN_DP_TX {
6af14ba53ac522 Johnson Wang     2022-07-25  1092  								reg = <MT8188_POWER_DOMAIN_DP_TX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1093  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1094  								#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1095  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1096  
cbb0f8b948cfda Fei Shao         2024-06-14  1097  							edp-tx@MT8188_POWER_DOMAIN_EDP_TX {
6af14ba53ac522 Johnson Wang     2022-07-25  1098  								reg = <MT8188_POWER_DOMAIN_EDP_TX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1099  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1100  								#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1101  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1102  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1103  
6af14ba53ac522 Johnson Wang     2022-07-25  1104  						venc@MT8188_POWER_DOMAIN_VENC {
6af14ba53ac522 Johnson Wang     2022-07-25  1105  							reg = <MT8188_POWER_DOMAIN_VENC>;
b3a334ebd6e058 Johnson Wang     2023-03-27  1106  							clocks = <&vencsys CLK_VENC1_LARB>,
b3a334ebd6e058 Johnson Wang     2023-03-27  1107  								 <&vencsys CLK_VENC1_VENC>,
b3a334ebd6e058 Johnson Wang     2023-03-27  1108  								 <&vencsys CLK_VENC1_GALS>,
b3a334ebd6e058 Johnson Wang     2023-03-27  1109  								 <&vencsys CLK_VENC1_GALS_SRAM>;
6af14ba53ac522 Johnson Wang     2022-07-25  1110  							clock-names = "venc-0", "venc-1", "venc-2", "venc-3";
6af14ba53ac522 Johnson Wang     2022-07-25  1111  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1112  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1113  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1114  
6af14ba53ac522 Johnson Wang     2022-07-25  1115  						wpe@MT8188_POWER_DOMAIN_WPE {
6af14ba53ac522 Johnson Wang     2022-07-25  1116  							reg = <MT8188_POWER_DOMAIN_WPE>;
6af14ba53ac522 Johnson Wang     2022-07-25  1117  							clocks = <&wpesys CLK_WPE_TOP_SMI_LARB7>,
6af14ba53ac522 Johnson Wang     2022-07-25  1118  								 <&wpesys CLK_WPE_TOP_SMI_LARB7_PCLK_EN>;
6af14ba53ac522 Johnson Wang     2022-07-25  1119  							clock-names = "wpe-0", "wpe-1";
6af14ba53ac522 Johnson Wang     2022-07-25  1120  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1121  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1122  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1123  
cbb0f8b948cfda Fei Shao         2024-06-14  1124  						img_vcore: img-vcore@MT8188_POWER_DOMAIN_IMG_VCORE {
6af14ba53ac522 Johnson Wang     2022-07-25  1125  							reg = <MT8188_POWER_DOMAIN_IMG_VCORE>;
6af14ba53ac522 Johnson Wang     2022-07-25  1126  							clocks = <&topckgen CLK_TOP_IMG>,
6af14ba53ac522 Johnson Wang     2022-07-25  1127  								 <&topckgen CLK_TOP_CFGREG_CLOCK_ISP_AXI_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1128  							clock-names = "img_vcore0", "img_vcore1";
6af14ba53ac522 Johnson Wang     2022-07-25  1129  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1130  							#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1131  							#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1132  							#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1133  
6af14ba53ac522 Johnson Wang     2022-07-25  1134  							img_main@MT8188_POWER_DOMAIN_IMG_MAIN {
6af14ba53ac522 Johnson Wang     2022-07-25  1135  								reg = <MT8188_POWER_DOMAIN_IMG_MAIN>;
6af14ba53ac522 Johnson Wang     2022-07-25  1136  								clocks = <&imgsys CLK_IMGSYS_MAIN_LARB9>,
6af14ba53ac522 Johnson Wang     2022-07-25  1137  									 <&imgsys CLK_IMGSYS_MAIN_VCORE_GALS>,
6af14ba53ac522 Johnson Wang     2022-07-25  1138  									 <&imgsys CLK_IMGSYS_MAIN_DIP0>,
6af14ba53ac522 Johnson Wang     2022-07-25  1139  									 <&imgsys CLK_IMGSYS_MAIN_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1140  								clock-names = "img_main-0", "img_main-1",
6af14ba53ac522 Johnson Wang     2022-07-25  1141  									      "img_main-2", "img_main-3";
6af14ba53ac522 Johnson Wang     2022-07-25  1142  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1143  								#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1144  								#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1145  								#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1146  
6af14ba53ac522 Johnson Wang     2022-07-25  1147  								dip@MT8188_POWER_DOMAIN_DIP {
6af14ba53ac522 Johnson Wang     2022-07-25  1148  									reg = <MT8188_POWER_DOMAIN_DIP>;
6af14ba53ac522 Johnson Wang     2022-07-25  1149  									clocks = <&imgsys CLK_IMGSYS_MAIN_WPE0>,
6af14ba53ac522 Johnson Wang     2022-07-25  1150  										 <&imgsys CLK_IMGSYS_MAIN_IPE>,
6af14ba53ac522 Johnson Wang     2022-07-25  1151  										 <&imgsys CLK_IMGSYS_MAIN_WPE1>,
6af14ba53ac522 Johnson Wang     2022-07-25  1152  										 <&imgsys CLK_IMGSYS_MAIN_WPE2>,
6af14ba53ac522 Johnson Wang     2022-07-25  1153  										 <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>,
6af14ba53ac522 Johnson Wang     2022-07-25  1154  										 <&imgsys_wpe1 CLK_IMGSYS_WPE1_LARB11>,
6af14ba53ac522 Johnson Wang     2022-07-25  1155  										 <&imgsys_wpe2 CLK_IMGSYS_WPE2_LARB11>,
6af14ba53ac522 Johnson Wang     2022-07-25  1156  										 <&imgsys_wpe3 CLK_IMGSYS_WPE3_LARB11>,
6af14ba53ac522 Johnson Wang     2022-07-25  1157  										 <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_LARB15>;
6af14ba53ac522 Johnson Wang     2022-07-25  1158  									clock-names = "dip-0", "dip-1", "dip-2",
6af14ba53ac522 Johnson Wang     2022-07-25  1159  										      "dip-3", "dip-4", "dip-5",
6af14ba53ac522 Johnson Wang     2022-07-25  1160  										      "dip-6", "dip-7", "dip-8";
6af14ba53ac522 Johnson Wang     2022-07-25  1161  									mediatek,smi = <&smi_img0 &smi_img1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1162  									mediatek,larb = <&imgsys1_dip_top &imgsys_wpe1
6af14ba53ac522 Johnson Wang     2022-07-25  1163  											 &imgsys_wpe3 &imgsys_wpe2
6af14ba53ac522 Johnson Wang     2022-07-25  1164  											 &imgsys1_dip_nr>;
6af14ba53ac522 Johnson Wang     2022-07-25  1165  									#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1166  								};
6af14ba53ac522 Johnson Wang     2022-07-25  1167  
6af14ba53ac522 Johnson Wang     2022-07-25  1168  								ipe@MT8188_POWER_DOMAIN_IPE {
6af14ba53ac522 Johnson Wang     2022-07-25  1169  									reg = <MT8188_POWER_DOMAIN_IPE>;
6af14ba53ac522 Johnson Wang     2022-07-25  1170  									clocks = <&topckgen CLK_TOP_IPE>,
6af14ba53ac522 Johnson Wang     2022-07-25  1171  										 <&imgsys CLK_IMGSYS_MAIN_IPE>,
6af14ba53ac522 Johnson Wang     2022-07-25  1172  										 <&ipesys CLK_IPE_SMI_LARB12>;
6af14ba53ac522 Johnson Wang     2022-07-25  1173  									clock-names= "ipe0", "ipe-0", "ipe-1";
6af14ba53ac522 Johnson Wang     2022-07-25  1174  									mediatek,smi = <&smi_img1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1175  									mediatek,larb = <&ipesys>;
6af14ba53ac522 Johnson Wang     2022-07-25  1176  									#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1177  								};
6af14ba53ac522 Johnson Wang     2022-07-25  1178  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1179  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1180  					};
6af14ba53ac522 Johnson Wang     2022-07-25  1181  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1182  
cbb0f8b948cfda Fei Shao         2024-06-14  1183  				pextp-mac-p0@MT8188_POWER_DOMAIN_PEXTP_MAC_P0 {
6af14ba53ac522 Johnson Wang     2022-07-25  1184  					reg = <MT8188_POWER_DOMAIN_PEXTP_MAC_P0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1185  					mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1186  					clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_FMEM>;
6af14ba53ac522 Johnson Wang     2022-07-25  1187  					clock-names = "pextp_mac_p0-0";
6af14ba53ac522 Johnson Wang     2022-07-25  1188  					#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1189  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1190  
cbb0f8b948cfda Fei Shao         2024-06-14  1191  				csirx-top@MT8188_POWER_DOMAIN_CSIRX_TOP {
6af14ba53ac522 Johnson Wang     2022-07-25  1192  					reg = <MT8188_POWER_DOMAIN_CSIRX_TOP>;
6af14ba53ac522 Johnson Wang     2022-07-25  1193  					clocks = <&topckgen CLK_TOP_SENINF>,
6af14ba53ac522 Johnson Wang     2022-07-25  1194  						 <&topckgen CLK_TOP_SENINF1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1195  					clock-names = "csirx_top0", "csirx_top1";
6af14ba53ac522 Johnson Wang     2022-07-25  1196  					#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1197  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1198  
cbb0f8b948cfda Fei Shao         2024-06-14  1199  				pextp-phy-top@MT8188_POWER_DOMAIN_PEXTP_PHY_TOP {
6af14ba53ac522 Johnson Wang     2022-07-25  1200  					reg = <MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;
6af14ba53ac522 Johnson Wang     2022-07-25  1201  					#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1202  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1203  
cbb0f8b948cfda Fei Shao         2024-06-14  1204  				adsp-ao@MT8188_POWER_DOMAIN_ADSP_AO {
6af14ba53ac522 Johnson Wang     2022-07-25  1205  					reg = <MT8188_POWER_DOMAIN_ADSP_AO>;
6af14ba53ac522 Johnson Wang     2022-07-25  1206  					mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1207  					#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1208  					#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1209  					#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1210  
cbb0f8b948cfda Fei Shao         2024-06-14  1211  					adsp-infra@MT8188_POWER_DOMAIN_ADSP_INFRA {
6af14ba53ac522 Johnson Wang     2022-07-25  1212  						reg = <MT8188_POWER_DOMAIN_ADSP_INFRA>;
a1311f18494340 Trevor Wu        2023-04-07  1213  						clocks = <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
a1311f18494340 Trevor Wu        2023-04-07  1214  							 <&topckgen CLK_TOP_ADSP>;
a1311f18494340 Trevor Wu        2023-04-07  1215  						clock-names = "adsp_infra0", "adsp_infra1";
6af14ba53ac522 Johnson Wang     2022-07-25  1216  						mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1217  						#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1218  						#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1219  						#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1220  
cbb0f8b948cfda Fei Shao         2024-06-14  1221  						audio-asrc@MT8188_POWER_DOMAIN_AUDIO_ASRC {
6af14ba53ac522 Johnson Wang     2022-07-25  1222  							reg = <MT8188_POWER_DOMAIN_AUDIO_ASRC>;
6af14ba53ac522 Johnson Wang     2022-07-25  1223  							clocks = <&topckgen CLK_TOP_ASM_H>;
6af14ba53ac522 Johnson Wang     2022-07-25  1224  							clock-names = "audio_asrc0";
6af14ba53ac522 Johnson Wang     2022-07-25  1225  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1226  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1227  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1228  
6af14ba53ac522 Johnson Wang     2022-07-25  1229  						audio@MT8188_POWER_DOMAIN_AUDIO {
6af14ba53ac522 Johnson Wang     2022-07-25  1230  							reg = <MT8188_POWER_DOMAIN_AUDIO>;
6af14ba53ac522 Johnson Wang     2022-07-25  1231  							clocks = <&topckgen CLK_TOP_A1SYS_HP>,
6af14ba53ac522 Johnson Wang     2022-07-25  1232  								 <&topckgen CLK_TOP_AUD_INTBUS>,
6af14ba53ac522 Johnson Wang     2022-07-25  1233  								 <&adsp_audio26m CLK_AUDIODSP_AUDIO26M>;
6af14ba53ac522 Johnson Wang     2022-07-25  1234  							clock-names = "audio0", "audio1", "audio2";
6af14ba53ac522 Johnson Wang     2022-07-25  1235  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1236  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1237  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1238  
6af14ba53ac522 Johnson Wang     2022-07-25  1239  						adsp@MT8188_POWER_DOMAIN_ADSP {
6af14ba53ac522 Johnson Wang     2022-07-25  1240  							reg = <MT8188_POWER_DOMAIN_ADSP>;
a1311f18494340 Trevor Wu        2023-04-07  1241  							clocks = <&apmixedsys CLK_APMIXED_ADSPPLL>;
a1311f18494340 Trevor Wu        2023-04-07  1242  							clock-names = "clk_apmixed_adsppll";
6af14ba53ac522 Johnson Wang     2022-07-25  1243  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1244  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1245  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1246  					};
6af14ba53ac522 Johnson Wang     2022-07-25  1247  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1248  
6af14ba53ac522 Johnson Wang     2022-07-25  1249  				ether@MT8188_POWER_DOMAIN_ETHER {
6af14ba53ac522 Johnson Wang     2022-07-25  1250  					reg = <MT8188_POWER_DOMAIN_ETHER>;
6af14ba53ac522 Johnson Wang     2022-07-25  1251  					clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
6af14ba53ac522 Johnson Wang     2022-07-25  1252  					clock-names = "ether0";
6af14ba53ac522 Johnson Wang     2022-07-25  1253  					mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1254  					#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1255  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1256  			};
6af14ba53ac522 Johnson Wang     2022-07-25  1257  		};
6af14ba53ac522 Johnson Wang     2022-07-25  1258  
800ef7029f37c5 jason-ch chen    2023-10-23  1259  		watchdog: watchdog@10007000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1260  			compatible = "mediatek,mt8188-wdt";
800ef7029f37c5 jason-ch chen    2023-10-23  1261  			reg = <0 0x10007000 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1262  			mediatek,disable-extrst;
800ef7029f37c5 jason-ch chen    2023-10-23  1263  			#reset-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1264  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1265  
800ef7029f37c5 jason-ch chen    2023-10-23  1266  		apmixedsys: syscon@1000c000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1267  			compatible = "mediatek,mt8188-apmixedsys", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23  1268  			reg = <0 0x1000c000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1269  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1270  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1271  
800ef7029f37c5 jason-ch chen    2023-10-23  1272  		systimer: timer@10017000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1273  			compatible = "mediatek,mt8188-timer", "mediatek,mt6765-timer";
800ef7029f37c5 jason-ch chen    2023-10-23  1274  			reg = <0 0x10017000 0 0x1000>;
6af14ba53ac522 Johnson Wang     2022-07-25  1275  			reg-names = "sys_timer_base";
800ef7029f37c5 jason-ch chen    2023-10-23  1276  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1277  			clocks = <&clk13m>;
800ef7029f37c5 jason-ch chen    2023-10-23  1278  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1279  
800ef7029f37c5 jason-ch chen    2023-10-23  1280  		pwrap: pwrap@10024000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1281  			compatible = "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23  1282  			reg = <0 0x10024000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1283  			reg-names = "pwrap";
800ef7029f37c5 jason-ch chen    2023-10-23  1284  			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1285  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
800ef7029f37c5 jason-ch chen    2023-10-23  1286  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
800ef7029f37c5 jason-ch chen    2023-10-23  1287  			clock-names = "spi", "wrap";
800ef7029f37c5 jason-ch chen    2023-10-23  1288  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1289  
5a47375e523aa6 Johnson Wang     2023-02-14  1290  		spmi: spmi@10027000 {
5a47375e523aa6 Johnson Wang     2023-02-14  1291  			compatible = "mediatek,mt8188-spmi",
5a47375e523aa6 Johnson Wang     2023-02-14  1292  				     "mediatek,mt8195-spmi";
5a47375e523aa6 Johnson Wang     2023-02-14  1293  			reg = <0 0x10027000 0 0x000e00>,
5a47375e523aa6 Johnson Wang     2023-02-14  1294  			      <0 0x10029000 0 0x000100>;
5a47375e523aa6 Johnson Wang     2023-02-14  1295  			reg-names = "pmif", "spmimst";
5a47375e523aa6 Johnson Wang     2023-02-14  1296  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH 0>,
5a47375e523aa6 Johnson Wang     2023-02-14  1297  				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH 0>;
5a47375e523aa6 Johnson Wang     2023-02-14  1298  			irq_event_en = <0x18000000 0x0001c000 0x0 0x0 0x0>;
5a47375e523aa6 Johnson Wang     2023-02-14  1299  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
5a47375e523aa6 Johnson Wang     2023-02-14  1300  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
5a47375e523aa6 Johnson Wang     2023-02-14  1301  				 <&topckgen CLK_TOP_SPMI_M_MST>;
5a47375e523aa6 Johnson Wang     2023-02-14  1302  			clock-names = "pmif_sys_ck",
5a47375e523aa6 Johnson Wang     2023-02-14  1303  				      "pmif_tmr_ck",
5a47375e523aa6 Johnson Wang     2023-02-14  1304  				      "spmimst_clk_mux";
5a47375e523aa6 Johnson Wang     2023-02-14  1305  			assigned-clocks = <&topckgen CLK_TOP_SPMI_M_MST>;
d65e64b7975b94 Sen Chu          2023-12-18  1306  			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
5a47375e523aa6 Johnson Wang     2023-02-14  1307  		};
5a47375e523aa6 Johnson Wang     2023-02-14  1308  
80d45ddb7686b1 Johnson Wang     2023-01-10  1309  		infra_iommu: iommu@10315000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  1310  			compatible = "mediatek,mt8188-iommu-infra";
80d45ddb7686b1 Johnson Wang     2023-01-10  1311  			reg = <0 0x10315000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  1312  			interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH 0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  1313  			#iommu-cells = <1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  1314  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  1315  
9de20b7422ddeb Johnson Wang     2023-01-10  1316  		gce0: mailbox@10320000 {
4e45b362c08d16 Elvis Wang       2023-05-17  1317  			compatible = "mediatek,mt8188-gce";
9de20b7422ddeb Johnson Wang     2023-01-10  1318  			reg = <0 0x10320000 0 0x4000>;
9de20b7422ddeb Johnson Wang     2023-01-10  1319  			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
9de20b7422ddeb Johnson Wang     2023-01-10  1320  			#mbox-cells = <2>;
9de20b7422ddeb Johnson Wang     2023-01-10  1321  			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
f111d8cc72fc83 Elvis Wang       2023-08-04  1322  			mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
f111d8cc72fc83 Elvis Wang       2023-08-04  1323  			mediatek,gce-events = <CMDQ_SYNC_TOKEN_SECURE_THR_EOF>;
9de20b7422ddeb Johnson Wang     2023-01-10  1324  		};
9de20b7422ddeb Johnson Wang     2023-01-10  1325  
9de20b7422ddeb Johnson Wang     2023-01-10  1326  		gce1: mailbox@10330000 {
4e45b362c08d16 Elvis Wang       2023-05-17  1327  			compatible = "mediatek,mt8188-gce";
9de20b7422ddeb Johnson Wang     2023-01-10  1328  			reg = <0 0x10330000 0 0x4000>;
9de20b7422ddeb Johnson Wang     2023-01-10  1329  			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
9de20b7422ddeb Johnson Wang     2023-01-10  1330  			#mbox-cells = <2>;
9de20b7422ddeb Johnson Wang     2023-01-10  1331  			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
9de20b7422ddeb Johnson Wang     2023-01-10  1332  		};
9de20b7422ddeb Johnson Wang     2023-01-10  1333  
cb75f24663df84 Jason Chen       2024-03-15  1334  		scp_cluster: scp@10500000 {
cb75f24663df84 Jason Chen       2024-03-15  1335  			compatible = "mediatek,mt8188-scp-dual";
cb75f24663df84 Jason Chen       2024-03-15  1336  			reg = <0 0x10720000 0 0xe0000>;
cb75f24663df84 Jason Chen       2024-03-15  1337  			reg-names = "cfg";
cb75f24663df84 Jason Chen       2024-03-15  1338  			#address-cells = <1>;
cb75f24663df84 Jason Chen       2024-03-15  1339  			#size-cells = <1>;
cb75f24663df84 Jason Chen       2024-03-15  1340  			ranges = <0 0 0x10500000 0x100000>;
cb75f24663df84 Jason Chen       2024-03-15  1341  			status = "disabled";
cb75f24663df84 Jason Chen       2024-03-15  1342  
cb75f24663df84 Jason Chen       2024-03-15  1343  			scp_c0: scp@0 {
cb75f24663df84 Jason Chen       2024-03-15  1344  				compatible = "mediatek,scp-core";
cb75f24663df84 Jason Chen       2024-03-15  1345  				reg = <0x0 0xd0000>;
cb75f24663df84 Jason Chen       2024-03-15  1346  				reg-names = "sram";
800ef7029f37c5 jason-ch chen    2023-10-23  1347  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
cb75f24663df84 Jason Chen       2024-03-15  1348  				status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1349  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1350  
cb75f24663df84 Jason Chen       2024-03-15  1351  			scp_c1: scp@d0000 {
cb75f24663df84 Jason Chen       2024-03-15  1352  				compatible = "mediatek,scp-core";
cb75f24663df84 Jason Chen       2024-03-15  1353  				reg = <0xd0000 0x2f000>;
cb75f24663df84 Jason Chen       2024-03-15  1354  				reg-names = "sram";
77165a14b8b2c6 Tinghan Shen     2022-08-17  1355  				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
77165a14b8b2c6 Tinghan Shen     2022-08-17  1356  				status = "disabled";
77165a14b8b2c6 Tinghan Shen     2022-08-17  1357  			};
cb75f24663df84 Jason Chen       2024-03-15  1358  		};
77165a14b8b2c6 Tinghan Shen     2022-08-17  1359  
1420601ea128b8 Trevor Wu        2023-03-20  1360  		afe: afe@10b10000 {
1420601ea128b8 Trevor Wu        2023-03-20  1361  			compatible = "mediatek,mt8188-afe";
1420601ea128b8 Trevor Wu        2023-03-20  1362  			mediatek,topckgen = <&topckgen>;
1420601ea128b8 Trevor Wu        2023-03-20  1363  			mediatek,infracfg = <&infracfg_ao>;
1420601ea128b8 Trevor Wu        2023-03-20  1364  			power-domains = <&spm MT8188_POWER_DOMAIN_AUDIO>;
1420601ea128b8 Trevor Wu        2023-03-20  1365  			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
1420601ea128b8 Trevor Wu        2023-03-20  1366  			resets = <&watchdog 14>;
1420601ea128b8 Trevor Wu        2023-03-20  1367  			reset-names = "audiosys";
1420601ea128b8 Trevor Wu        2023-03-20  1368  			reg = <0 0x10b10000 0 0x10000>;
1420601ea128b8 Trevor Wu        2023-03-20  1369  			clocks = <&clk26m>,
1420601ea128b8 Trevor Wu        2023-03-20  1370  				 <&apmixedsys CLK_APMIXED_APLL1>,
1420601ea128b8 Trevor Wu        2023-03-20  1371  				 <&apmixedsys CLK_APMIXED_APLL2>,
1420601ea128b8 Trevor Wu        2023-03-20  1372  				 <&topckgen CLK_TOP_APLL12_CK_DIV0>,
1420601ea128b8 Trevor Wu        2023-03-20  1373  				 <&topckgen CLK_TOP_APLL12_CK_DIV1>,
1420601ea128b8 Trevor Wu        2023-03-20  1374  				 <&topckgen CLK_TOP_APLL12_CK_DIV2>,
1420601ea128b8 Trevor Wu        2023-03-20  1375  				 <&topckgen CLK_TOP_APLL12_CK_DIV3>,
1420601ea128b8 Trevor Wu        2023-03-20  1376  				 <&topckgen CLK_TOP_APLL12_CK_DIV9>,
1420601ea128b8 Trevor Wu        2023-03-20  1377  				 <&topckgen CLK_TOP_A1SYS_HP>,
1420601ea128b8 Trevor Wu        2023-03-20  1378  				 <&topckgen CLK_TOP_AUD_INTBUS>,
1420601ea128b8 Trevor Wu        2023-03-20  1379  				 <&topckgen CLK_TOP_AUDIO_H>,
1420601ea128b8 Trevor Wu        2023-03-20  1380  				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
1420601ea128b8 Trevor Wu        2023-03-20  1381  				 <&topckgen CLK_TOP_DPTX>,
1420601ea128b8 Trevor Wu        2023-03-20  1382  				 <&topckgen CLK_TOP_I2SO1>,
1420601ea128b8 Trevor Wu        2023-03-20  1383  				 <&topckgen CLK_TOP_I2SO2>,
1420601ea128b8 Trevor Wu        2023-03-20  1384  				 <&topckgen CLK_TOP_I2SI1>,
1420601ea128b8 Trevor Wu        2023-03-20  1385  				 <&topckgen CLK_TOP_I2SI2>,
1420601ea128b8 Trevor Wu        2023-03-20  1386  				 <&adsp_audio26m CLK_AUDIODSP_AUDIO26M>,
1420601ea128b8 Trevor Wu        2023-03-20  1387  				 <&topckgen CLK_TOP_APLL1_D4>,
1420601ea128b8 Trevor Wu        2023-03-20  1388  				 <&topckgen CLK_TOP_APLL2_D4>,
1420601ea128b8 Trevor Wu        2023-03-20  1389  				 <&topckgen CLK_TOP_APLL12_CK_DIV4>,
1420601ea128b8 Trevor Wu        2023-03-20  1390  				 <&topckgen CLK_TOP_A2SYS>,
1420601ea128b8 Trevor Wu        2023-03-20  1391  				 <&topckgen CLK_TOP_AUD_IEC>;
1420601ea128b8 Trevor Wu        2023-03-20  1392  			clock-names = "clk26m",
1420601ea128b8 Trevor Wu        2023-03-20  1393  				      "apll1",
1420601ea128b8 Trevor Wu        2023-03-20  1394  				      "apll2",
1420601ea128b8 Trevor Wu        2023-03-20  1395  				      "apll12_div0",
1420601ea128b8 Trevor Wu        2023-03-20  1396  				      "apll12_div1",
1420601ea128b8 Trevor Wu        2023-03-20  1397  				      "apll12_div2",
1420601ea128b8 Trevor Wu        2023-03-20  1398  				      "apll12_div3",
1420601ea128b8 Trevor Wu        2023-03-20  1399  				      "apll12_div9",
1420601ea128b8 Trevor Wu        2023-03-20  1400  				      "top_a1sys_hp",
1420601ea128b8 Trevor Wu        2023-03-20  1401  				      "top_aud_intbus",
1420601ea128b8 Trevor Wu        2023-03-20  1402  				      "top_audio_h",
1420601ea128b8 Trevor Wu        2023-03-20  1403  				      "top_audio_local_bus",
1420601ea128b8 Trevor Wu        2023-03-20  1404  				      "top_dptx",
1420601ea128b8 Trevor Wu        2023-03-20  1405  				      "top_i2so1",
1420601ea128b8 Trevor Wu        2023-03-20  1406  				      "top_i2so2",
1420601ea128b8 Trevor Wu        2023-03-20  1407  				      "top_i2si1",
1420601ea128b8 Trevor Wu        2023-03-20  1408  				      "top_i2si2",
1420601ea128b8 Trevor Wu        2023-03-20  1409  				      "adsp_audio_26m",
1420601ea128b8 Trevor Wu        2023-03-20  1410  				      "apll1_d4",
1420601ea128b8 Trevor Wu        2023-03-20  1411  				      "apll2_d4",
1420601ea128b8 Trevor Wu        2023-03-20  1412  				      "apll12_div4",
1420601ea128b8 Trevor Wu        2023-03-20  1413  				      "top_a2sys",
1420601ea128b8 Trevor Wu        2023-03-20  1414  				      "top_aud_iec";
1420601ea128b8 Trevor Wu        2023-03-20  1415  			assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
1420601ea128b8 Trevor Wu        2023-03-20  1416  			assigned-clock-parents =  <&clk26m>;
1420601ea128b8 Trevor Wu        2023-03-20  1417  			status = "disabled";
1420601ea128b8 Trevor Wu        2023-03-20  1418  		};
1420601ea128b8 Trevor Wu        2023-03-20  1419  
a1311f18494340 Trevor Wu        2023-04-07  1420  		adsp: adsp@10b80000 {
a1311f18494340 Trevor Wu        2023-04-07  1421  			compatible = "mediatek,mt8188-dsp";
a1311f18494340 Trevor Wu        2023-04-07  1422  			reg = <0 0x10b80000 0 0x2000>,
a1311f18494340 Trevor Wu        2023-04-07  1423  			      <0 0x10d00000 0 0x80000>,
a1311f18494340 Trevor Wu        2023-04-07  1424  			      <0 0x10b8b000 0 0x100>,
a1311f18494340 Trevor Wu        2023-04-07  1425  			      <0 0x10b8f000 0 0x1000>;
a1311f18494340 Trevor Wu        2023-04-07  1426  			reg-names = "cfg", "sram", "sec", "bus";
a1311f18494340 Trevor Wu        2023-04-07  1427  			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH 0>;
a1311f18494340 Trevor Wu        2023-04-07  1428  			interrupt-names = "wdt";
a1311f18494340 Trevor Wu        2023-04-07  1429  			clocks = <&topckgen CLK_TOP_ADSP>,
a1311f18494340 Trevor Wu        2023-04-07  1430  				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>;
a1311f18494340 Trevor Wu        2023-04-07  1431  			clock-names = "audiodsp",
a1311f18494340 Trevor Wu        2023-04-07  1432  				      "adsp_bus";
a1311f18494340 Trevor Wu        2023-04-07  1433  			assigned-clocks = <&topckgen CLK_TOP_ADSP>;
a1311f18494340 Trevor Wu        2023-04-07  1434  			power-domains = <&spm MT8188_POWER_DOMAIN_ADSP>;
a1311f18494340 Trevor Wu        2023-04-07  1435  			mbox-names = "rx", "tx";
a1311f18494340 Trevor Wu        2023-04-07  1436  			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
a1311f18494340 Trevor Wu        2023-04-07  1437  			status = "disabled";
a1311f18494340 Trevor Wu        2023-04-07  1438  		};
a1311f18494340 Trevor Wu        2023-04-07  1439  
a1311f18494340 Trevor Wu        2023-04-07  1440  		adsp_mailbox0: mailbox@10b86000 {
a1311f18494340 Trevor Wu        2023-04-07  1441  			compatible = "mediatek,mt8186-adsp-mbox";
a1311f18494340 Trevor Wu        2023-04-07  1442  			#mbox-cells = <0>;
a1311f18494340 Trevor Wu        2023-04-07  1443  			reg = <0 0x10b86100 0 0x1000>;
a1311f18494340 Trevor Wu        2023-04-07  1444  			interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
a1311f18494340 Trevor Wu        2023-04-07  1445  		};
a1311f18494340 Trevor Wu        2023-04-07  1446  
a1311f18494340 Trevor Wu        2023-04-07  1447  		adsp_mailbox1: mailbox@10b87000 {
a1311f18494340 Trevor Wu        2023-04-07  1448  			compatible = "mediatek,mt8186-adsp-mbox";
a1311f18494340 Trevor Wu        2023-04-07  1449  			#mbox-cells = <0>;
a1311f18494340 Trevor Wu        2023-04-07  1450  			reg = <0 0x10b87100 0 0x1000>;
a1311f18494340 Trevor Wu        2023-04-07  1451  			interrupts = <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH 0>;
a1311f18494340 Trevor Wu        2023-04-07  1452  		};
a1311f18494340 Trevor Wu        2023-04-07  1453  
800ef7029f37c5 jason-ch chen    2023-10-23  1454  		adsp_audio26m: clock-controller@10b91100 {
800ef7029f37c5 jason-ch chen    2023-10-23  1455  			compatible = "mediatek,mt8188-adsp-audio26m";
800ef7029f37c5 jason-ch chen    2023-10-23  1456  			reg = <0 0x10b91100 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1457  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1458  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1459  
800ef7029f37c5 jason-ch chen    2023-10-23  1460  		uart0: serial@11001100 {
800ef7029f37c5 jason-ch chen    2023-10-23  1461  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
800ef7029f37c5 jason-ch chen    2023-10-23  1462  			reg = <0 0x11001100 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1463  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1464  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1465  			clock-names = "baud", "bus";
800ef7029f37c5 jason-ch chen    2023-10-23  1466  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1467  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1468  
800ef7029f37c5 jason-ch chen    2023-10-23  1469  		uart1: serial@11001200 {
800ef7029f37c5 jason-ch chen    2023-10-23  1470  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
800ef7029f37c5 jason-ch chen    2023-10-23  1471  			reg = <0 0x11001200 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1472  			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1473  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1474  			clock-names = "baud", "bus";
800ef7029f37c5 jason-ch chen    2023-10-23  1475  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1476  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1477  
800ef7029f37c5 jason-ch chen    2023-10-23  1478  		uart2: serial@11001300 {
800ef7029f37c5 jason-ch chen    2023-10-23  1479  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
800ef7029f37c5 jason-ch chen    2023-10-23  1480  			reg = <0 0x11001300 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1481  			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1482  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1483  			clock-names = "baud", "bus";
800ef7029f37c5 jason-ch chen    2023-10-23  1484  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1485  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1486  
800ef7029f37c5 jason-ch chen    2023-10-23  1487  		uart3: serial@11001400 {
800ef7029f37c5 jason-ch chen    2023-10-23  1488  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
800ef7029f37c5 jason-ch chen    2023-10-23  1489  			reg = <0 0x11001400 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1490  			interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1491  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART3>;
800ef7029f37c5 jason-ch chen    2023-10-23  1492  			clock-names = "baud", "bus";
800ef7029f37c5 jason-ch chen    2023-10-23  1493  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1494  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1495  
800ef7029f37c5 jason-ch chen    2023-10-23  1496  		auxadc: adc@11002000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1497  			compatible = "mediatek,mt8188-auxadc", "mediatek,mt8173-auxadc";
800ef7029f37c5 jason-ch chen    2023-10-23  1498  			reg = <0 0x11002000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1499  			clocks = <&infracfg_ao CLK_INFRA_AO_AUXADC>;
800ef7029f37c5 jason-ch chen    2023-10-23  1500  			clock-names = "main";
800ef7029f37c5 jason-ch chen    2023-10-23  1501  			#io-channel-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1502  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1503  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1504  
800ef7029f37c5 jason-ch chen    2023-10-23  1505  		pericfg_ao: syscon@11003000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1506  			compatible = "mediatek,mt8188-pericfg-ao", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23  1507  			reg = <0 0x11003000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1508  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1509  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1510  
800ef7029f37c5 jason-ch chen    2023-10-23  1511  		spi0: spi@1100a000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1512  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1513  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1514  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1515  			reg = <0 0x1100a000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1516  			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1517  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1518  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1519  				 <&infracfg_ao CLK_INFRA_AO_SPI0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1520  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1521  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1522  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1523  
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1524  		svs: svs@1100b000 {
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1525  			compatible = "mediatek,mt8188-svs";
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1526  			reg = <0 0x1100b000 0 0x1000>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1527  			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH 0>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1528  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1529  			clock-names = "main";
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1530  			nvmem-cells = <&svs_calibration>,
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1531  				      <&lvts_efuse_data1>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1532  			nvmem-cell-names = "svs-calibration-data",
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1533  					   "t-calibration-data";
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1534  			resets = <&infracfg_ao MT8188_INFRA_RST3_PTP_CTRL_RST>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1535  			reset-names = "svs_rst";
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1536  		};
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1537  
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1538  		lvtsap: lvts@1100b000 {
cf583e82282568 Johnson Wang     2023-03-15  1539  			compatible = "mediatek,mt8188-lvts-ap";
cf583e82282568 Johnson Wang     2023-03-15  1540  			#thermal-sensor-cells = <1>;
cf583e82282568 Johnson Wang     2023-03-15  1541  			reg = <0 0x1100b000 0 0x1000>;
cf583e82282568 Johnson Wang     2023-03-15  1542  			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
cf583e82282568 Johnson Wang     2023-03-15  1543  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
cf583e82282568 Johnson Wang     2023-03-15  1544  			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_CTRL_RST>;
cf583e82282568 Johnson Wang     2023-03-15  1545  			nvmem-cells = <&lvts_efuse_data1>;
cf583e82282568 Johnson Wang     2023-03-15  1546  			nvmem-cell-names = "lvts_calib_data1";
cf583e82282568 Johnson Wang     2023-03-15  1547  		};
cf583e82282568 Johnson Wang     2023-03-15  1548  
cbb0f8b948cfda Fei Shao         2024-06-14  1549  		disp_pwm0: disp-pwm0@1100e000 {
2dc54d6c98a726 Johnson Wang     2023-02-07  1550  			compatible = "mediatek,mt8188-disp-pwm",
2dc54d6c98a726 Johnson Wang     2023-02-07  1551  				     "mediatek,mt8183-disp-pwm";
2dc54d6c98a726 Johnson Wang     2023-02-07  1552  			reg = <0 0x1100e000 0 0x1000>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1553  			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1554  			#pwm-cells = <2>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1555  			clocks = <&topckgen CLK_TOP_DISP_PWM0>,
2dc54d6c98a726 Johnson Wang     2023-02-07  1556  				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM>,
2dc54d6c98a726 Johnson Wang     2023-02-07  1557  				 <&topckgen CLK_TOP_ULPOSC1_D4>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1558  			clock-names = "main", "mm", "pwm_src";
2dc54d6c98a726 Johnson Wang     2023-02-07  1559  			status = "disabled";
2dc54d6c98a726 Johnson Wang     2023-02-07  1560  		};
2dc54d6c98a726 Johnson Wang     2023-02-07  1561  
cbb0f8b948cfda Fei Shao         2024-06-14  1562  		disp_pwm1: disp-pwm1@1100f000 {
2dc54d6c98a726 Johnson Wang     2023-02-07  1563  			compatible = "mediatek,mt8188-disp-pwm",
2dc54d6c98a726 Johnson Wang     2023-02-07  1564  				     "mediatek,mt8183-disp-pwm";
2dc54d6c98a726 Johnson Wang     2023-02-07  1565  			reg = <0 0x1100f000 0 0x1000>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1566  			interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1567  			#pwm-cells = <2>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1568  			clocks = <&topckgen CLK_TOP_DISP_PWM1>,
2dc54d6c98a726 Johnson Wang     2023-02-07  1569  				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM1>,
2dc54d6c98a726 Johnson Wang     2023-02-07  1570  				 <&topckgen CLK_TOP_ULPOSC1_D4>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1571  			clock-names = "main", "mm", "pwm_src";
2dc54d6c98a726 Johnson Wang     2023-02-07  1572  			status = "disabled";
2dc54d6c98a726 Johnson Wang     2023-02-07  1573  		};
2dc54d6c98a726 Johnson Wang     2023-02-07  1574  
800ef7029f37c5 jason-ch chen    2023-10-23  1575  		spi1: spi@11010000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1576  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1577  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1578  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1579  			reg = <0 0x11010000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1580  			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1581  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1582  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1583  				 <&infracfg_ao CLK_INFRA_AO_SPI1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1584  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1585  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1586  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1587  
800ef7029f37c5 jason-ch chen    2023-10-23  1588  		spi2: spi@11012000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1589  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1590  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1591  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1592  			reg = <0 0x11012000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1593  			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1594  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1595  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1596  				 <&infracfg_ao CLK_INFRA_AO_SPI2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1597  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1598  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1599  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1600  
800ef7029f37c5 jason-ch chen    2023-10-23  1601  		spi3: spi@11013000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1602  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1603  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1604  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1605  			reg = <0 0x11013000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1606  			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1607  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1608  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1609  				 <&infracfg_ao CLK_INFRA_AO_SPI3>;
800ef7029f37c5 jason-ch chen    2023-10-23  1610  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1611  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1612  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1613  
800ef7029f37c5 jason-ch chen    2023-10-23  1614  		spi4: spi@11018000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1615  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1616  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1617  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1618  			reg = <0 0x11018000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1619  			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1620  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1621  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1622  				 <&infracfg_ao CLK_INFRA_AO_SPI4>;
800ef7029f37c5 jason-ch chen    2023-10-23  1623  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1624  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1625  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1626  
800ef7029f37c5 jason-ch chen    2023-10-23  1627  		spi5: spi@11019000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1628  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1629  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1630  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1631  			reg = <0 0x11019000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1632  			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1633  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1634  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1635  				 <&infracfg_ao CLK_INFRA_AO_SPI5>;
800ef7029f37c5 jason-ch chen    2023-10-23  1636  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1637  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1638  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1639  
800ef7029f37c5 jason-ch chen    2023-10-23  1640  		xhci1: usb@11200000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1641  			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
800ef7029f37c5 jason-ch chen    2023-10-23  1642  			reg = <0 0x11200000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1643  			      <0 0x11203e00 0 0x0100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1644  			reg-names = "mac", "ippc";
800ef7029f37c5 jason-ch chen    2023-10-23  1645  			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1646  			phys = <&u2port1 PHY_TYPE_USB2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1647  			       <&u3port1 PHY_TYPE_USB3>;
800ef7029f37c5 jason-ch chen    2023-10-23  1648  			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
800ef7029f37c5 jason-ch chen    2023-10-23  1649  					  <&topckgen CLK_TOP_SSUSB_XHCI>;
800ef7029f37c5 jason-ch chen    2023-10-23  1650  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
800ef7029f37c5 jason-ch chen    2023-10-23  1651  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
800ef7029f37c5 jason-ch chen    2023-10-23  1652  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_BUS>,
800ef7029f37c5 jason-ch chen    2023-10-23  1653  				 <&topckgen CLK_TOP_SSUSB_TOP_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1654  				 <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
800ef7029f37c5 jason-ch chen    2023-10-23  1655  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
800ef7029f37c5 jason-ch chen    2023-10-23  1656  			mediatek,syscon-wakeup = <&pericfg 0x468 2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1657  			wakeup-source;
800ef7029f37c5 jason-ch chen    2023-10-23  1658  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1659  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1660  
800ef7029f37c5 jason-ch chen    2023-10-23  1661  		mmc0: mmc@11230000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1662  			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
800ef7029f37c5 jason-ch chen    2023-10-23  1663  			reg = <0 0x11230000 0 0x10000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1664  			      <0 0x11f50000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1665  			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1666  			clocks = <&topckgen CLK_TOP_MSDC50_0>,
800ef7029f37c5 jason-ch chen    2023-10-23  1667  				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
800ef7029f37c5 jason-ch chen    2023-10-23  1668  				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>,
800ef7029f37c5 jason-ch chen    2023-10-23  1669  				 <&infracfg_ao CLK_INFRA_AO_RG_AES_MSDCFDE_CK_0P>;
800ef7029f37c5 jason-ch chen    2023-10-23  1670  			clock-names = "source", "hclk", "source_cg", "crypto_clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1671  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1672  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1673  
800ef7029f37c5 jason-ch chen    2023-10-23  1674  		mmc1: mmc@11240000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1675  			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
800ef7029f37c5 jason-ch chen    2023-10-23  1676  			reg = <0 0x11240000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1677  			      <0 0x11eb0000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1678  			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1679  			clocks = <&topckgen CLK_TOP_MSDC30_1>,
800ef7029f37c5 jason-ch chen    2023-10-23  1680  				 <&infracfg_ao CLK_INFRA_AO_MSDC1>,
800ef7029f37c5 jason-ch chen    2023-10-23  1681  				 <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
800ef7029f37c5 jason-ch chen    2023-10-23  1682  			clock-names = "source", "hclk", "source_cg";
800ef7029f37c5 jason-ch chen    2023-10-23  1683  			assigned-clocks = <&topckgen CLK_TOP_MSDC30_1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1684  			assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1685  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1686  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1687  
cf583e82282568 Johnson Wang     2023-03-15  1688  		lvtsmcu: thermal-sensor@11278000 {
cf583e82282568 Johnson Wang     2023-03-15  1689  			compatible = "mediatek,mt8188-lvts-mcu";
cf583e82282568 Johnson Wang     2023-03-15  1690  			#thermal-sensor-cells = <1>;
cf583e82282568 Johnson Wang     2023-03-15  1691  			reg = <0 0x11278000 0 0x1000>;
cf583e82282568 Johnson Wang     2023-03-15  1692  			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
cf583e82282568 Johnson Wang     2023-03-15  1693  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
cf583e82282568 Johnson Wang     2023-03-15  1694  			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_MCU_RST>;
cf583e82282568 Johnson Wang     2023-03-15  1695  			nvmem-cells = <&lvts_efuse_data1>;
cf583e82282568 Johnson Wang     2023-03-15  1696  			nvmem-cell-names = "lvts_calib_data1";
cf583e82282568 Johnson Wang     2023-03-15  1697  		};
cf583e82282568 Johnson Wang     2023-03-15  1698  
800ef7029f37c5 jason-ch chen    2023-10-23  1699  		i2c0: i2c@11280000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1700  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1701  			reg = <0 0x11280000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1702  			      <0 0x10220080 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1703  			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1704  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1705  			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C0>,
800ef7029f37c5 jason-ch chen    2023-10-23  1706  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1707  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1708  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1709  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1710  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1711  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1712  
800ef7029f37c5 jason-ch chen    2023-10-23  1713  		i2c2: i2c@11281000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1714  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1715  			reg = <0 0x11281000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1716  			      <0 0x10220180 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1717  			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1718  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1719  			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1720  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1721  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1722  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1723  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1724  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1725  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1726  
800ef7029f37c5 jason-ch chen    2023-10-23  1727  		i2c3: i2c@11282000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1728  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1729  			reg = <0 0x11282000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1730  			      <0 0x10220280 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1731  			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1732  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1733  			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C3>,
800ef7029f37c5 jason-ch chen    2023-10-23  1734  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1735  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1736  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1737  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1738  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1739  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1740  
800ef7029f37c5 jason-ch chen    2023-10-23  1741  		imp_iic_wrap_c: clock-controller@11283000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1742  			compatible = "mediatek,mt8188-imp-iic-wrap-c";
800ef7029f37c5 jason-ch chen    2023-10-23  1743  			reg = <0 0x11283000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1744  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1745  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1746  
800ef7029f37c5 jason-ch chen    2023-10-23  1747  		xhci2: usb@112a0000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1748  			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
800ef7029f37c5 jason-ch chen    2023-10-23  1749  			reg = <0 0x112a0000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1750  			      <0 0x112a3e00 0 0x0100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1751  			reg-names = "mac", "ippc";
800ef7029f37c5 jason-ch chen    2023-10-23  1752  			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1753  			phys = <&u2port2 PHY_TYPE_USB2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1754  			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_3P>,
800ef7029f37c5 jason-ch chen    2023-10-23  1755  					  <&topckgen CLK_TOP_USB_TOP_3P>;
800ef7029f37c5 jason-ch chen    2023-10-23  1756  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
800ef7029f37c5 jason-ch chen    2023-10-23  1757  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
800ef7029f37c5 jason-ch chen    2023-10-23  1758  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
800ef7029f37c5 jason-ch chen    2023-10-23  1759  				 <&topckgen CLK_TOP_SSUSB_TOP_P3_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1760  				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
800ef7029f37c5 jason-ch chen    2023-10-23  1761  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
8c4fb322b7e512 Shaocheng Wang   2023-06-05  1762  			mediatek,syscon-wakeup = <&pericfg 0x470 2>;
8c4fb322b7e512 Shaocheng Wang   2023-06-05  1763  			wakeup-source;
800ef7029f37c5 jason-ch chen    2023-10-23  1764  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1765  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1766  
800ef7029f37c5 jason-ch chen    2023-10-23  1767  		xhci0: usb@112b0000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1768  			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
800ef7029f37c5 jason-ch chen    2023-10-23  1769  			reg = <0 0x112b0000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1770  			      <0 0x112b3e00 0 0x0100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1771  			reg-names = "mac", "ippc";
800ef7029f37c5 jason-ch chen    2023-10-23  1772  			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1773  			phys = <&u2port0 PHY_TYPE_USB2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1774  			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>,
800ef7029f37c5 jason-ch chen    2023-10-23  1775  					  <&topckgen CLK_TOP_USB_TOP_2P>;
800ef7029f37c5 jason-ch chen    2023-10-23  1776  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
800ef7029f37c5 jason-ch chen    2023-10-23  1777  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
800ef7029f37c5 jason-ch chen    2023-10-23  1778  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
800ef7029f37c5 jason-ch chen    2023-10-23  1779  				 <&topckgen CLK_TOP_SSUSB_TOP_P2_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1780  				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
800ef7029f37c5 jason-ch chen    2023-10-23  1781  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
800ef7029f37c5 jason-ch chen    2023-10-23  1782  			mediatek,syscon-wakeup = <&pericfg 0x460 2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1783  			wakeup-source;
800ef7029f37c5 jason-ch chen    2023-10-23  1784  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1785  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1786  
1cd445dc9d3c36 Johnson Wang     2023-02-14  1787  		pcie: pcie@112f0000 {
1cd445dc9d3c36 Johnson Wang     2023-02-14  1788  			device_type = "pci";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1789  			compatible = "mediatek,mt8188-pcie",
1cd445dc9d3c36 Johnson Wang     2023-02-14  1790  				     "mediatek,mt8192-pcie";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1791  			reg = <0 0x112f0000 0 0x2000>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1792  			reg-names = "pcie-mac";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1793  			linux,pci-domain = <0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1794  			#address-cells = <3>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1795  			#size-cells = <2>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1796  			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1797  			bus-range = <0x00 0xff>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1798  			ranges = <0x82000000 0 0x20000000
1cd445dc9d3c36 Johnson Wang     2023-02-14  1799  				  0x0 0x20000000 0 0x04000000>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1800  			iommu-map = <0x0000 &infra_iommu IFR_IOMMU_PORT_PCIE_0
1cd445dc9d3c36 Johnson Wang     2023-02-14  1801  				     0xFFFF>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1802  			iommu-map-mask = <0x0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1803  			status = "disabled";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1804  			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_TL_26M>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1805  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1806  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_32K>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1807  				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1808  				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_FMEM>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1809  				 <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1810  			phys = <&pcieport PHY_TYPE_PCIE>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1811  			phy-names = "pcie-phy";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1812  			power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_MAC_P0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1813  			#interrupt-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1814  			interrupt-map-mask = <0 0 0 7>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1815  			interrupt-map = <0 0 0 1 &pcie_intc 0>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1816  					<0 0 0 2 &pcie_intc 1>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1817  					<0 0 0 3 &pcie_intc 2>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1818  					<0 0 0 4 &pcie_intc 3>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1819  
1cd445dc9d3c36 Johnson Wang     2023-02-14  1820  			pcie_intc: interrupt-controller {
1cd445dc9d3c36 Johnson Wang     2023-02-14  1821  				interrupt-controller;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1822  				#address-cells = <0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1823  				#interrupt-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1824  			};
1cd445dc9d3c36 Johnson Wang     2023-02-14  1825  		};
1cd445dc9d3c36 Johnson Wang     2023-02-14  1826  
800ef7029f37c5 jason-ch chen    2023-10-23  1827  		nor_flash: spi@1132c000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1828  			compatible = "mediatek,mt8188-nor", "mediatek,mt8186-nor";
800ef7029f37c5 jason-ch chen    2023-10-23  1829  			reg = <0 0x1132c000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1830  			clocks = <&topckgen CLK_TOP_SPINOR>,
800ef7029f37c5 jason-ch chen    2023-10-23  1831  				 <&pericfg_ao CLK_PERI_AO_FLASHIFLASHCK>,
800ef7029f37c5 jason-ch chen    2023-10-23  1832  				 <&pericfg_ao CLK_PERI_AO_FLASHIF_BUS>;
800ef7029f37c5 jason-ch chen    2023-10-23  1833  			clock-names = "spi", "sf", "axi";
800ef7029f37c5 jason-ch chen    2023-10-23  1834  			assigned-clocks = <&topckgen CLK_TOP_SPINOR>;
800ef7029f37c5 jason-ch chen    2023-10-23  1835  			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
6a40a0576320ca Fei Shao         2024-03-28  1836  			#address-cells = <1>;
6a40a0576320ca Fei Shao         2024-03-28  1837  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1838  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1839  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1840  
1cd445dc9d3c36 Johnson Wang     2023-02-14  1841  		pciephy: t-phy@11c20700 {
1cd445dc9d3c36 Johnson Wang     2023-02-14  1842  			compatible = "mediatek,generic-tphy-v2";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1843  			#address-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1844  			#size-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1845  			ranges = <0x0 0x0 0x11c20700 0x700>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1846  			power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1847  			status = "disabled";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1848  
1cd445dc9d3c36 Johnson Wang     2023-02-14  1849  			pcieport: pcie-phy@0 {
1cd445dc9d3c36 Johnson Wang     2023-02-14  1850  				reg = <0 0x700>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1851  				clocks = <&topckgen CLK_TOP_CFGREG_F_PCIE_PHY_REF>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1852  				clock-names = "ref";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1853  				#phy-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1854  			};
1cd445dc9d3c36 Johnson Wang     2023-02-14  1855  		};
1cd445dc9d3c36 Johnson Wang     2023-02-14  1856  
cbb0f8b948cfda Fei Shao         2024-06-14  1857  		mipi_tx_config0: mipi-dphy0@11c80000 {
15d7ef162af666 Johnson Wang     2023-02-07  1858  			compatible = "mediatek,mt8188-mipi-tx",
15d7ef162af666 Johnson Wang     2023-02-07  1859  				     "mediatek,mt8183-mipi-tx";
15d7ef162af666 Johnson Wang     2023-02-07  1860  			reg = <0 0x11c80000 0 0x1000>;
15d7ef162af666 Johnson Wang     2023-02-07  1861  			clocks = <&clk26m>;
15d7ef162af666 Johnson Wang     2023-02-07  1862  			clock-output-names = "mipi_tx0_pll";
15d7ef162af666 Johnson Wang     2023-02-07  1863  			status = "disabled";
15d7ef162af666 Johnson Wang     2023-02-07  1864  			#clock-cells = <0>;
15d7ef162af666 Johnson Wang     2023-02-07  1865  			#phy-cells = <0>;
15d7ef162af666 Johnson Wang     2023-02-07  1866  		};
15d7ef162af666 Johnson Wang     2023-02-07  1867  
800ef7029f37c5 jason-ch chen    2023-10-23  1868  		i2c1: i2c@11e00000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1869  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1870  			reg = <0 0x11e00000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1871  			      <0 0x10220100 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1872  			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1873  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1874  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C1>,
800ef7029f37c5 jason-ch chen    2023-10-23  1875  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1876  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1877  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1878  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1879  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1880  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1881  
800ef7029f37c5 jason-ch chen    2023-10-23  1882  		i2c4: i2c@11e01000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1883  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1884  			reg = <0 0x11e01000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1885  			      <0 0x10220380 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1886  			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1887  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1888  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C4>,
800ef7029f37c5 jason-ch chen    2023-10-23  1889  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1890  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1891  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1892  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1893  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1894  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1895  
800ef7029f37c5 jason-ch chen    2023-10-23  1896  		imp_iic_wrap_w: clock-controller@11e02000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1897  			compatible = "mediatek,mt8188-imp-iic-wrap-w";
800ef7029f37c5 jason-ch chen    2023-10-23  1898  			reg = <0 0x11e02000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1899  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1900  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1901  
800ef7029f37c5 jason-ch chen    2023-10-23  1902  		u3phy0: t-phy@11e30000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1903  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
6af14ba53ac522 Johnson Wang     2022-07-25  1904  			#address-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1905  			#size-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1906  			ranges;
800ef7029f37c5 jason-ch chen    2023-10-23  1907  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1908  
6af14ba53ac522 Johnson Wang     2022-07-25  1909  			u2port0: usb-phy@11e30000 {
6af14ba53ac522 Johnson Wang     2022-07-25  1910  				reg = <0 0x11e30000 0 0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23  1911  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P2_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1912  					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
800ef7029f37c5 jason-ch chen    2023-10-23  1913  				clock-names = "ref", "da_ref";
800ef7029f37c5 jason-ch chen    2023-10-23  1914  				#phy-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1915  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1916  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1917  
800ef7029f37c5 jason-ch chen    2023-10-23  1918  		u3phy1: t-phy@11e40000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1919  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
6af14ba53ac522 Johnson Wang     2022-07-25  1920  			#address-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1921  			#size-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1922  			ranges;
800ef7029f37c5 jason-ch chen    2023-10-23  1923  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1924  
6af14ba53ac522 Johnson Wang     2022-07-25  1925  			u2port1: usb-phy@11e40000 {
6af14ba53ac522 Johnson Wang     2022-07-25  1926  				reg = <0 0x11e40000 0 0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23  1927  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1928  					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
800ef7029f37c5 jason-ch chen    2023-10-23  1929  				clock-names = "ref", "da_ref";
800ef7029f37c5 jason-ch chen    2023-10-23  1930  				#phy-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1931  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1932  
6af14ba53ac522 Johnson Wang     2022-07-25  1933  			u3port1: usb-phy@11e40700 {
6af14ba53ac522 Johnson Wang     2022-07-25  1934  				reg = <0 0x11e40700 0 0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23  1935  				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>,
800ef7029f37c5 jason-ch chen    2023-10-23  1936  					 <&clk26m>;
800ef7029f37c5 jason-ch chen    2023-10-23  1937  				clock-names = "ref", "da_ref";
800ef7029f37c5 jason-ch chen    2023-10-23  1938  				#phy-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1939  				status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1940  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1941  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1942  
800ef7029f37c5 jason-ch chen    2023-10-23  1943  		u3phy2: t-phy@11e80000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1944  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
6af14ba53ac522 Johnson Wang     2022-07-25  1945  			#address-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1946  			#size-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1947  			ranges;
800ef7029f37c5 jason-ch chen    2023-10-23  1948  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1949  
6af14ba53ac522 Johnson Wang     2022-07-25  1950  			u2port2: usb-phy@11e80000 {
6af14ba53ac522 Johnson Wang     2022-07-25  1951  				reg = <0 0x11e80000 0 0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23  1952  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P3_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1953  					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
800ef7029f37c5 jason-ch chen    2023-10-23  1954  				clock-names = "ref", "da_ref";
800ef7029f37c5 jason-ch chen    2023-10-23  1955  				#phy-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1956  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1957  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1958  
800ef7029f37c5 jason-ch chen    2023-10-23  1959  		i2c5: i2c@11ec0000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1960  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1961  			reg = <0 0x11ec0000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1962  			      <0 0x10220480 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1963  			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1964  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1965  			clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C5>,
800ef7029f37c5 jason-ch chen    2023-10-23  1966  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1967  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1968  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1969  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1970  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1971  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1972  
800ef7029f37c5 jason-ch chen    2023-10-23  1973  		i2c6: i2c@11ec1000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1974  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1975  			reg = <0 0x11ec1000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1976  			      <0 0x10220600 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1977  			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1978  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1979  			clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C6>,
800ef7029f37c5 jason-ch chen    2023-10-23  1980  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1981  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1982  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1983  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1984  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1985  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1986  
800ef7029f37c5 jason-ch chen    2023-10-23  1987  		imp_iic_wrap_en: clock-controller@11ec2000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1988  			compatible = "mediatek,mt8188-imp-iic-wrap-en";
800ef7029f37c5 jason-ch chen    2023-10-23  1989  			reg = <0 0x11ec2000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1990  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1991  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1992  
9078d0c8584194 Johnson Wang     2023-01-11  1993  		efuse: efuse@11f20000 {
9078d0c8584194 Johnson Wang     2023-01-11  1994  			compatible = "mediatek,mt8188-efuse",
9078d0c8584194 Johnson Wang     2023-01-11  1995  				     "mediatek,efuse";
9078d0c8584194 Johnson Wang     2023-01-11  1996  			reg = <0 0x11f20000 0 0x1000>;
9078d0c8584194 Johnson Wang     2023-01-11  1997  			#address-cells = <1>;
9078d0c8584194 Johnson Wang     2023-01-11  1998  			#size-cells = <1>;
9078d0c8584194 Johnson Wang     2023-01-11  1999  
cbb0f8b948cfda Fei Shao         2024-06-14  2000  			dp_calibration: dp-data {
f5c581ccb9be69 Shuijing Li      2023-06-09  2001  				reg = <0x1a0 0x10>;
9078d0c8584194 Johnson Wang     2023-01-11  2002  			};
9078d0c8584194 Johnson Wang     2023-01-11  2003  
9078d0c8584194 Johnson Wang     2023-01-11  2004  			lvts_efuse_data1: lvts1-calib@1ac {
9078d0c8584194 Johnson Wang     2023-01-11  2005  				reg = <0x1ac 0x40>;
9078d0c8584194 Johnson Wang     2023-01-11  2006  			};
9078d0c8584194 Johnson Wang     2023-01-11  2007  
9078d0c8584194 Johnson Wang     2023-01-11  2008  			hdmirx_efuse: data2 {
9078d0c8584194 Johnson Wang     2023-01-11  2009  				reg = <0x50 0xc>;
9078d0c8584194 Johnson Wang     2023-01-11  2010  			};
9078d0c8584194 Johnson Wang     2023-01-11  2011  
9078d0c8584194 Johnson Wang     2023-01-11  2012  			hdmirx_rterm: data3 {
9078d0c8584194 Johnson Wang     2023-01-11  2013  				reg = <0x1ac 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2014  			};
9078d0c8584194 Johnson Wang     2023-01-11  2015  
9078d0c8584194 Johnson Wang     2023-01-11  2016  			hdmitx_efuse: calib@184 {
9078d0c8584194 Johnson Wang     2023-01-11  2017  				reg = <0x184 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2018  			};
9078d0c8584194 Johnson Wang     2023-01-11  2019  
cbb0f8b948cfda Fei Shao         2024-06-14  2020  			csi_efuse0: csi-data0 {
9078d0c8584194 Johnson Wang     2023-01-11  2021  				reg = <0x18c 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2022  			};
9078d0c8584194 Johnson Wang     2023-01-11  2023  
cbb0f8b948cfda Fei Shao         2024-06-14  2024  			csi_efuse1: csi-data1 {
9078d0c8584194 Johnson Wang     2023-01-11  2025  				reg = <0x190 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2026  			};
9078d0c8584194 Johnson Wang     2023-01-11  2027  
9078d0c8584194 Johnson Wang     2023-01-11  2028  			svs_calibration: calib@534 {
9078d0c8584194 Johnson Wang     2023-01-11  2029  				reg = <0x534 0x68>;
9078d0c8584194 Johnson Wang     2023-01-11  2030  			};
9078d0c8584194 Johnson Wang     2023-01-11  2031  
cbb0f8b948cfda Fei Shao         2024-06-14  2032  			gpu_segment_table0: gpu-efuse0 {
9078d0c8584194 Johnson Wang     2023-01-11  2033  				reg = <0x40 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2034  			};
9078d0c8584194 Johnson Wang     2023-01-11  2035  
cbb0f8b948cfda Fei Shao         2024-06-14  2036  			gpu_segment_table1: gpu-efuse1 {
9078d0c8584194 Johnson Wang     2023-01-11  2037  				reg = <0x4c 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2038  			};
9078d0c8584194 Johnson Wang     2023-01-11  2039  
cbb0f8b948cfda Fei Shao         2024-06-14  2040  			gpu_segment_table2: gpu-efuse2 {
9078d0c8584194 Johnson Wang     2023-01-11  2041  				reg = <0x4c 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2042  			};
9078d0c8584194 Johnson Wang     2023-01-11  2043  
9078d0c8584194 Johnson Wang     2023-01-11  2044  			gpu_volt_bin: volt-bin {
9078d0c8584194 Johnson Wang     2023-01-11  2045  				reg = <0x581 0x1>;
9078d0c8584194 Johnson Wang     2023-01-11  2046  				bits = <0 3>;
9078d0c8584194 Johnson Wang     2023-01-11  2047  			};
21938b10dbd710 William-tw Lin   2023-06-05  2048  
21938b10dbd710 William-tw Lin   2023-06-05  2049  			socinfo-data1@7a0 {
21938b10dbd710 William-tw Lin   2023-06-05  2050  				reg = <0x7a0 0x4>;
21938b10dbd710 William-tw Lin   2023-06-05  2051  			};
21938b10dbd710 William-tw Lin   2023-06-05  2052  
21938b10dbd710 William-tw Lin   2023-06-05  2053  			socinfo-data2@7e0 {
21938b10dbd710 William-tw Lin   2023-06-05  2054  				reg = <0x7e0 0x4>;
21938b10dbd710 William-tw Lin   2023-06-05  2055  			};
9078d0c8584194 Johnson Wang     2023-01-11  2056  		};
9078d0c8584194 Johnson Wang     2023-01-11  2057  
fc3eef90bc9933 Johnson Wang     2023-02-14  2058  		gpu: gpu@13000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14  2059  			compatible = "mediatek,mt8188-mali", "arm,mali-valhall";
fc3eef90bc9933 Johnson Wang     2023-02-14  2060  			reg = <0 0x13000000 0 0x4000>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2061  			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2062  				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2063  				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2064  			interrupt-names = "JOB", "MMU", "GPU";
fc3eef90bc9933 Johnson Wang     2023-02-14  2065  			clocks = <&topckgen CLK_TOP_MFG_CK_FAST_REF>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2066  				 <&apmixedsys CLK_APMIXED_MFGPLL>,
b3a334ebd6e058 Johnson Wang     2023-03-27  2067  				 <&apmixedsys CLK_APMIXED_MFGPLL>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2068  				 <&topckgen CLK_TOP_MFG_CORE_TMP>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2069  				 <&mfgcfg CLK_MFGCFG_BG3D>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2070  			clock-names = "clk_mux",
fc3eef90bc9933 Johnson Wang     2023-02-14  2071  				      "clk_pll_src",
fc3eef90bc9933 Johnson Wang     2023-02-14  2072  				      "clk_main_parent",
fc3eef90bc9933 Johnson Wang     2023-02-14  2073  				      "clk_sub_parent",
fc3eef90bc9933 Johnson Wang     2023-02-14  2074  				      "subsys_bg3d";
fc3eef90bc9933 Johnson Wang     2023-02-14  2075  			power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2076  					<&spm MT8188_POWER_DOMAIN_MFG3>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2077  					<&spm MT8188_POWER_DOMAIN_MFG4>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2078  			power-domain-names = "core0", "core1", "core2";
fc3eef90bc9933 Johnson Wang     2023-02-14  2079  			nvmem-cells = <&gpu_volt_bin>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2080  			nvmem-cell-names = "volt-bin";
fc3eef90bc9933 Johnson Wang     2023-02-14  2081  			#cooling-cells = <2>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2082  		};
fc3eef90bc9933 Johnson Wang     2023-02-14  2083  
800ef7029f37c5 jason-ch chen    2023-10-23  2084  		mfgcfg: clock-controller@13fbf000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2085  			compatible = "mediatek,mt8188-mfgcfg";
800ef7029f37c5 jason-ch chen    2023-10-23  2086  			reg = <0 0x13fbf000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2087  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2088  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2089  
800ef7029f37c5 jason-ch chen    2023-10-23  2090  		vppsys0: clock-controller@14000000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2091  			compatible = "mediatek,mt8188-vppsys0";
800ef7029f37c5 jason-ch chen    2023-10-23  2092  			reg = <0 0x14000000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2093  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2094  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2095  
80d45ddb7686b1 Johnson Wang     2023-01-10  2096  		vpp_smi_common: smi@14012000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2097  			compatible = "mediatek,mt8188-smi-common-vpp";
80d45ddb7686b1 Johnson Wang     2023-01-10  2098  			reg = <0 0x14012000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2099  			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2100  				 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2101  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2102  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2103  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2104  
80d45ddb7686b1 Johnson Wang     2023-01-10  2105  		larb4: larb@14013000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2106  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2107  			reg = <0 0x14013000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2108  			mediatek,larb-id = <SMI_L4_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2109  			mediatek,smi = <&vpp_smi_common>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2110  			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2111  				 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2112  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2113  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2114  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2115  
80d45ddb7686b1 Johnson Wang     2023-01-10  2116  		vpp_iommu: iommu@14018000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2117  			compatible = "mediatek,mt8188-iommu-vpp";
80d45ddb7686b1 Johnson Wang     2023-01-10  2118  			reg = <0 0x14018000 0 0x5000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2119  			mediatek,larbs = <&larb1 &larb3 &larb4 &larb6 &larb7
80d45ddb7686b1 Johnson Wang     2023-01-10  2120  					  &larb11b &larb12 &larb14 &larb15
80d45ddb7686b1 Johnson Wang     2023-01-10  2121  					  &larb16a &larb17a &larb23 &larb27>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2122  			interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2123  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH 0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2124  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH 0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2125  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2126  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2127  			clocks = <&vppsys0 CLK_VPP0_SMI_IOMMU>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2128  			clock-names = "bclk";
80d45ddb7686b1 Johnson Wang     2023-01-10  2129  			#iommu-cells = <1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2130  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2131  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2132  
800ef7029f37c5 jason-ch chen    2023-10-23  2133  		wpesys: clock-controller@14e00000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2134  			compatible = "mediatek,mt8188-wpesys";
800ef7029f37c5 jason-ch chen    2023-10-23  2135  			reg = <0 0x14e00000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2136  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2137  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2138  
800ef7029f37c5 jason-ch chen    2023-10-23  2139  		wpesys_vpp0: clock-controller@14e02000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2140  			compatible = "mediatek,mt8188-wpesys-vpp0";
800ef7029f37c5 jason-ch chen    2023-10-23  2141  			reg = <0 0x14e02000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2142  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2143  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2144  
80d45ddb7686b1 Johnson Wang     2023-01-10  2145  		larb7: larb@14e04000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2146  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2147  			reg = <0 0x14e04000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2148  			mediatek,larb-id = <SMI_L7_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2149  			mediatek,smi = <&vpp_smi_common>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2150  			clocks = <&wpesys CLK_WPE_TOP_SMI_LARB7>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2151  				 <&wpesys CLK_WPE_TOP_SMI_LARB7>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2152  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2153  			power-domains = <&spm MT8188_POWER_DOMAIN_WPE>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2154  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2155  
800ef7029f37c5 jason-ch chen    2023-10-23  2156  		vppsys1: clock-controller@14f00000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2157  			compatible = "mediatek,mt8188-vppsys1";
800ef7029f37c5 jason-ch chen    2023-10-23  2158  			reg = <0 0x14f00000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2159  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2160  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2161  
80d45ddb7686b1 Johnson Wang     2023-01-10  2162  		larb5: larb@14f02000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2163  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2164  			reg = <0 0x14f02000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2165  			mediatek,larb-id = <SMI_L5_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2166  			mediatek,smi = <&vdo_smi_common>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2167  			clocks = <&vppsys1 CLK_VPP1_GALS5>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2168  				 <&vppsys1 CLK_VPP1_LARB5>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2169  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2170  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2171  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2172  
80d45ddb7686b1 Johnson Wang     2023-01-10  2173  		larb6: larb@14f03000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2174  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2175  			reg = <0 0x14f03000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2176  			mediatek,larb-id = <SMI_L6_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2177  			mediatek,smi = <&vpp_smi_common>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2178  			clocks = <&vppsys1 CLK_VPP1_GALS6>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2179  				 <&vppsys1 CLK_VPP1_LARB6>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2180  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2181  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2182  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2183  
800ef7029f37c5 jason-ch chen    2023-10-23  2184  		imgsys: clock-controller@15000000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2185  			compatible = "mediatek,mt8188-imgsys";
800ef7029f37c5 jason-ch chen    2023-10-23  2186  			reg = <0 0x15000000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2187  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2188  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2189  
80d45ddb7686b1 Johnson Wang     2023-01-10  2190  		larb9: larb@15001000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2191  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2192  			reg = <0 0x15001000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2193  			mediatek,larb-id = <SMI_L9_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2194  			mediatek,smi = <&vdo_smi_common>;
7c3927c3af7353 Chengci Xu       2023-11-29  2195  			mediatek,smi-sub-comm = <&smi_img0>;
7c3927c3af7353 Chengci Xu       2023-11-29  2196  			mediatek,smi-sub-comm-inport = <0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2197  			clocks = <&imgsys CLK_IMGSYS_MAIN_LARB9>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2198  				 <&imgsys CLK_IMGSYS_MAIN_LARB9>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2199  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2200  			power-domains = <&spm MT8188_POWER_DOMAIN_IMG_MAIN>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2201  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2202  
6af14ba53ac522 Johnson Wang     2022-07-25  2203  		smi_img0: syscon@15002000 {
797147d8a9d5e9 Friday Yang      2024-06-06  2204  			compatible = "mediatek,mt8188-smi-img0",
797147d8a9d5e9 Friday Yang      2024-06-06  2205  				     "mediatek,mt8188-smi-sub-common", "syscon";
797147d8a9d5e9 Friday Yang      2024-06-06  2206  			mediatek,common-id = <3>;
797147d8a9d5e9 Friday Yang      2024-06-06  2207  			mediatek,smi = <&vdo_smi_common>;
6af14ba53ac522 Johnson Wang     2022-07-25  2208  			reg = <0 0x15002000 0 0x1000>;
797147d8a9d5e9 Friday Yang      2024-06-06  2209  			clocks = <&vdosys0 CLK_VDO0_SMI_COMMON>,
797147d8a9d5e9 Friday Yang      2024-06-06  2210  				 <&vdosys0 CLK_VDO0_SMI_GALS>;
797147d8a9d5e9 Friday Yang      2024-06-06  2211  			clock-names = "apb", "smi";
797147d8a9d5e9 Friday Yang      2024-06-06  2212  			power-domains = <&spm MT8188_POWER_DOMAIN_IMG_MAIN>;
6af14ba53ac522 Johnson Wang     2022-07-25  2213  		};
6af14ba53ac522 Johnson Wang     2022-07-25  2214  
6af14ba53ac522 Johnson Wang     2022-07-25  2215  		smi_img1: syscon@15003000 {
797147d8a9d5e9 Friday Yang      2024-06-06  2216  			compatible = "mediatek,mt8188-smi-img1",
797147d8a9d5e9 Friday Yang      2024-06-06  2217  				     "mediatek,mt8188-smi-sub-common", "syscon";
797147d8a9d5e9 Friday Yang      2024-06-06  2218  			mediatek,common-id = <4>;
797147d8a9d5e9 Friday Yang      2024-06-06  2219  			mediatek,smi = <&vpp_smi_common>;
6af14ba53ac522 Johnson Wang     2022-07-25  2220  			reg = <0 0x15003000 0 0x1000>;
797147d8a9d5e9 Friday Yang      2024-06-06  2221  			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
797147d8a9d5e9 Friday Yang      2024-06-06  2222  				 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>;
797147d8a9d5e9 Friday Yang      2024-06-06  2223  			clock-names = "apb", "smi";
797147d8a9d5e9 Friday Yang      2024-06-06  2224  			power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
6af14ba53ac522 Johnson Wang     2022-07-25  2225  		};
6af14ba53ac522 Johnson Wang     2022-07-25  2226  
800ef7029f37c5 jason-ch chen    2023-10-23  2227  		imgsys1_dip_top: clock-controller@15110000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2228  			compatible = "mediatek,mt8188-imgsys1-dip-top";
800ef7029f37c5 jason-ch chen    2023-10-23  2229  			reg = <0 0x15110000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2230  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2231  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2232  
80d45ddb7686b1 Johnson Wang     2023-01-10  2233  		larb10: larb@15120000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2234  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2235  			reg = <0 0x15120000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2236  			mediatek,larb-id = <SMI_L10_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2237  			mediatek,smi = <&vdo_smi_common>;
7c3927c3af7353 Chengci Xu       2023-11-29  2238  			mediatek,smi-sub-comm = <&smi_img0>;
7c3927c3af7353 Chengci Xu       2023-11-29  2239  			mediatek,smi-sub-comm-inport = <1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2240  			clocks = <&imgsys CLK_IMGSYS_MAIN_DIP0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2241  				 <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2242  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2243  			power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
797147d8a9d5e9 Friday Yang      2024-06-06  2244  			mediatek,smi-reset = <&imgsys1_dip_top MT8188_SMI_RST_LARB10>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2245  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2246  
800ef7029f37c5 jason-ch chen    2023-10-23  2247  		imgsys1_dip_nr: clock-controller@15130000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2248  			compatible = "mediatek,mt8188-imgsys1-dip-nr";
800ef7029f37c5 jason-ch chen    2023-10-23  2249  			reg = <0 0x15130000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2250  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2251  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2252  
80d45ddb7686b1 Johnson Wang     2023-01-10  2253  		larb15: larb@15140000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2254  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2255  			reg = <0 0x15140000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2256  			mediatek,larb-id = <SMI_L15_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2257  			mediatek,smi = <&vpp_smi_common>;
7c3927c3af7353 Chengci Xu       2023-11-29  2258  			mediatek,smi-sub-comm = <&smi_img1>;
7c3927c3af7353 Chengci Xu       2023-11-29  2259  			mediatek,smi-sub-comm-inport = <1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2260  			clocks = <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2261  				 <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_LARB15>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2262  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2263  			power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
797147d8a9d5e9 Friday Yang      2024-06-06  2264  			mediatek,smi-reset = <&imgsys1_dip_nr MT8188_SMI_RST_LARB15>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2265  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2266  
800ef7029f37c5 jason-ch chen    2023-10-23  2267  		imgsys_wpe1: clock-controller@15220000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2268  			compatible = "mediatek,mt8188-imgsys-wpe1";
800ef7029f37c5 jason-ch chen    2023-10-23  2269  			reg = <0 0x15220000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2270  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2271  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2272  
80d45ddb7686b1 Johnson Wang     2023-01-10  2273  		larb11a: larb@15230000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2274  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2275  			reg = <0 0x15230000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2276  			mediatek,larb-id = <SMI_L11A_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2277  			mediatek,smi = <&vdo_smi_common>;
7c3927c3af7353 Chengci Xu       2023-11-29  2278  			mediatek,smi-sub-comm = <&smi_img0>;
7c3927c3af7353 Chengci Xu       2023-11-29  2279  			mediatek,smi-sub-comm-inport = <2>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2280  			clocks = <&imgsys CLK_IMGSYS_MAIN_WPE0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2281  				 <&imgsys_wpe1 CLK_IMGSYS_WPE1_LARB11>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2282  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2283  			power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
797147d8a9d5e9 Friday Yang      2024-06-06  2284  			mediatek,smi-reset = <&imgsys_wpe1 MT8188_SMI_RST_LARB11A>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2285  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2286  
a171784472954b Fred-LW Lu       2023-01-14  2287  		vmm_proxy_label: vmm-proxy {
a171784472954b Fred-LW Lu       2023-01-14  2288  			regulator-name = "dvfs-vmm";
a171784472954b Fred-LW Lu       2023-01-14  2289  			regulator-min-microvolt = <550000>;
a171784472954b Fred-LW Lu       2023-01-14  2290  			regulator-max-microvolt = <725000>;
a171784472954b Fred-LW Lu       2023-01-14  2291  		};
a171784472954b Fred-LW Lu       2023-01-14  2292  
a171784472954b Fred-LW Lu       2023-01-14  2293  		opp_table_img: opp-table-img {
a171784472954b Fred-LW Lu       2023-01-14  2294  			compatible = "operating-points-v2";
a171784472954b Fred-LW Lu       2023-01-14  2295  			opp-0 {
a171784472954b Fred-LW Lu       2023-01-14  2296  				opp-hz = /bits/ 64 <273000000>;
a171784472954b Fred-LW Lu       2023-01-14  2297  				opp-microvolt = <550000>;
a171784472954b Fred-LW Lu       2023-01-14  2298  			};
a171784472954b Fred-LW Lu       2023-01-14  2299  			opp-1 {
a171784472954b Fred-LW Lu       2023-01-14  2300  				opp-hz = /bits/ 64 <364000000>;
a171784472954b Fred-LW Lu       2023-01-14  2301  				opp-microvolt = <600000>;
a171784472954b Fred-LW Lu       2023-01-14  2302  			};
a171784472954b Fred-LW Lu       2023-01-14  2303  			opp-2 {
a171784472954b Fred-LW Lu       2023-01-14  2304  				opp-hz = /bits/ 64 <546000000>;
a171784472954b Fred-LW Lu       2023-01-14  2305  				opp-microvolt = <650000>;
a171784472954b Fred-LW Lu       2023-01-14  2306  			};
a171784472954b Fred-LW Lu       2023-01-14  2307  			opp-3 {
a171784472954b Fred-LW Lu       2023-01-14  2308  				opp-hz = /bits/ 64 <660000000>;
a171784472954b Fred-LW Lu       2023-01-14  2309  				opp-microvolt = <725000>;
a171784472954b Fred-LW Lu       2023-01-14  2310  			};
a171784472954b Fred-LW Lu       2023-01-14  2311  		};
a171784472954b Fred-LW Lu       2023-01-14  2312  
a171784472954b Fred-LW Lu       2023-01-14  2313  		opp_table_ipe: opp-table-ipe {
a171784472954b Fred-LW Lu       2023-01-14  2314  			compatible = "operating-points-v2";
a171784472954b Fred-LW Lu       2023-01-14  2315  			opp-0 {
a171784472954b Fred-LW Lu       2023-01-14  2316  				opp-hz = /bits/ 64 <273000000>;
a171784472954b Fred-LW Lu       2023-01-14  2317  				opp-microvolt = <550000>;
a171784472954b Fred-LW Lu       2023-01-14  2318  			};
a171784472954b Fred-LW Lu       2023-01-14  2319  			opp-1 {
a171784472954b Fred-LW Lu       2023-01-14  2320  				opp-hz = /bits/ 64 <364000000>;
a171784472954b Fred-LW Lu       2023-01-14  2321  				opp-microvolt = <600000>;
a171784472954b Fred-LW Lu       2023-01-14  2322  			};
a171784472954b Fred-LW Lu       2023-01-14  2323  			opp-2 {
a171784472954b Fred-LW Lu       2023-01-14  2324  				opp-hz = /bits/ 64 <458000000>;
a171784472954b Fred-LW Lu       2023-01-14  2325  				opp-microvolt = <650000>;
a171784472954b Fred-LW Lu       2023-01-14  2326  			};
a171784472954b Fred-LW Lu       2023-01-14  2327  			opp-3 {
a171784472954b Fred-LW Lu       2023-01-14  2328  				opp-hz = /bits/ 64 <546000000>;
a171784472954b Fred-LW Lu       2023-01-14  2329  				opp-microvolt = <725000>;
a171784472954b Fred-LW Lu       2023-01-14  2330  			};
a171784472954b Fred-LW Lu       2023-01-14  2331  		};
a171784472954b Fred-LW Lu       2023-01-14  2332  
a171784472954b Fred-LW Lu       2023-01-14  2333  		hcp: hcp@0 {
a171784472954b Fred-LW Lu       2023-01-14  2334  			compatible = "mediatek,hcp";
a171784472954b Fred-LW Lu       2023-01-14  2335  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2336  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2337  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
cb75f24663df84 Jason Chen       2024-03-15  2338  			mediatek,scp = <&scp_c1>;
a171784472954b Fred-LW Lu       2023-01-14  2339  			iommus = <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  2340  				 <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_1>,
a171784472954b Fred-LW Lu       2023-01-14  2341  				 <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  2342  				 <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_1>,
a171784472954b Fred-LW Lu       2023-01-14  2343  				 <&vpp_iommu M4U_PORT_L11B_WPE_CQ0>,
a171784472954b Fred-LW Lu       2023-01-14  2344  				 <&vpp_iommu M4U_PORT_L11B_WPE_CQ1>,
a171784472954b Fred-LW Lu       2023-01-14  2345  				 <&vpp_iommu M4U_PORT_L11B_PIMGI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2346  				 <&vpp_iommu M4U_PORT_L11B_PIMGBI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2347  				 <&vpp_iommu M4U_PORT_L11B_PIMGCI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2348  				 <&vpp_iommu M4U_PORT_L11B_IMGI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2349  				 <&vpp_iommu M4U_PORT_L11B_IMGBI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2350  				 <&vpp_iommu M4U_PORT_L11B_IMGCI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2351  				 <&vpp_iommu M4U_PORT_L11B_SMTI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2352  				 <&vpp_iommu M4U_PORT_L11B_SMTI_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  2353  				 <&vpp_iommu M4U_PORT_L11B_SMTI_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  2354  				 <&vpp_iommu M4U_PORT_L11B_YUVO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2355  				 <&vpp_iommu M4U_PORT_L11B_YUVBO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2356  				 <&vpp_iommu M4U_PORT_L11B_YUVCO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2357  				 <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  2358  				 <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  2359  				 <&vpp_iommu M4U_PORT_L11B_WROT_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2360  				 <&vpp_iommu M4U_PORT_L11B_TCCSO_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2361  				 <&vpp_iommu M4U_PORT_L11B_TCCSI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2362  				 <&vpp_iommu M4U_PORT_L11B_TIMGO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2363  				 <&vpp_iommu M4U_PORT_L11B_YUVO_T2_C>,
a171784472954b Fred-LW Lu       2023-01-14  2364  				 <&vpp_iommu M4U_PORT_L11B_YUVO_T5_C>,
a171784472954b Fred-LW Lu       2023-01-14  2365  				 <&vpp_iommu M4U_PORT_L11B_SMTO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2366  				 <&vpp_iommu M4U_PORT_L11B_SMTO_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  2367  				 <&vpp_iommu M4U_PORT_L11B_SMTO_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  2368  				 <&vpp_iommu M4U_PORT_L11B_DBGO_T1_C>;
a171784472954b Fred-LW Lu       2023-01-14  2369  		};
a171784472954b Fred-LW Lu       2023-01-14  2370  
cbb0f8b948cfda Fei Shao         2024-06-14  2371  		hcp-l15 {
a171784472954b Fred-LW Lu       2023-01-14  2372  			compatible = "mediatek,imgsys-larb";
a171784472954b Fred-LW Lu       2023-01-14  2373  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2374  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2375  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  2376  			iommus = <&vpp_iommu M4U_PORT_L15_VIPI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2377  				 <&vpp_iommu M4U_PORT_L15_VIPBI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2378  				 <&vpp_iommu M4U_PORT_L15_SMTI_D6>,
a171784472954b Fred-LW Lu       2023-01-14  2379  				 <&vpp_iommu M4U_PORT_L15_TNCSTI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2380  				 <&vpp_iommu M4U_PORT_L15_TNCSTI_D4>,
a171784472954b Fred-LW Lu       2023-01-14  2381  				 <&vpp_iommu M4U_PORT_L15_SMTI_D4>,
a171784472954b Fred-LW Lu       2023-01-14  2382  				 <&vpp_iommu M4U_PORT_L15_IMG3O_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2383  				 <&vpp_iommu M4U_PORT_L15_IMG3BO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2384  				 <&vpp_iommu M4U_PORT_L15_IMG3CO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2385  				 <&vpp_iommu M4U_PORT_L15_IMG2O_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2386  				 <&vpp_iommu M4U_PORT_L15_SMTI_D9>,
a171784472954b Fred-LW Lu       2023-01-14  2387  				 <&vpp_iommu M4U_PORT_L15_SMTO_D4>,
a171784472954b Fred-LW Lu       2023-01-14  2388  				 <&vpp_iommu M4U_PORT_L15_FEO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2389  				 <&vpp_iommu M4U_PORT_L15_TNCSO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2390  				 <&vpp_iommu M4U_PORT_L15_TNCSTO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2391  				 <&vpp_iommu M4U_PORT_L15_SMTO_D6>,
a171784472954b Fred-LW Lu       2023-01-14  2392  				 <&vpp_iommu M4U_PORT_L15_SMTO_D9>,
a171784472954b Fred-LW Lu       2023-01-14  2393  				 <&vpp_iommu M4U_PORT_L15_TNCO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2394  				 <&vpp_iommu M4U_PORT_L15_TNCO_D1_N>;
a171784472954b Fred-LW Lu       2023-01-14  2395  		};
a171784472954b Fred-LW Lu       2023-01-14  2396  
cbb0f8b948cfda Fei Shao         2024-06-14  2397  		imgsys_fw: imgsys-fw@15000000 {
a171784472954b Fred-LW Lu       2023-01-14  2398  			compatible = "mediatek,imgsys";
a171784472954b Fred-LW Lu       2023-01-14  2399  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2400  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2401  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  2402  			reg = <0 0x15000000 0 0x4000>,	/* 0 IMGSYS_TOP */
a171784472954b Fred-LW Lu       2023-01-14  2403  			      <0 0x15020000 0 0x10000>,	/* 1 IMGSYS_TRAW */
a171784472954b Fred-LW Lu       2023-01-14  2404  			      <0 0x15040000 0 0x10000>,	/* 2 IMGSYS_LTRAW */
a171784472954b Fred-LW Lu       2023-01-14  2405  			      <0 0x15640000 0 0x10000>,	/* 3 IMGSYS_XTRAW */
a171784472954b Fred-LW Lu       2023-01-14  2406  			      <0 0x15100000 0 0x10000>,	/* 4 IMGSYS_DIP */
a171784472954b Fred-LW Lu       2023-01-14  2407  			      <0 0x15150000 0 0x10000>,	/* 4 IMGSYS_DIP_NR */
a171784472954b Fred-LW Lu       2023-01-14  2408  			      <0 0x15210000 0 0x10000>,	/* 5 IMGSYS_PQDIP_A */
a171784472954b Fred-LW Lu       2023-01-14  2409  			      <0 0x15510000 0 0x10000>,	/* 6 IMGSYS_PQDIP_B */
a171784472954b Fred-LW Lu       2023-01-14  2410  			      <0 0x15200000 0 0x10000>,	/* 7 IMGSYS_WPE_EIS */
a171784472954b Fred-LW Lu       2023-01-14  2411  			      <0 0x15500000 0 0x10000>,	/* 8 IMGSYS_WPE_TNR */
a171784472954b Fred-LW Lu       2023-01-14  2412  			      <0 0x15600000 0 0x10000>,	/* 9 IMGSYS_WPE_LITE */
a171784472954b Fred-LW Lu       2023-01-14  2413  			      <0 0x15220000 0 0x00100>,	/* 10 IMGSYS_WPE1_DIP1 */
a171784472954b Fred-LW Lu       2023-01-14  2414  			      <0 0x15320000 0 0x10000>,	/* 11 IMGSYS_ME */
a171784472954b Fred-LW Lu       2023-01-14  2415  			      <0 0x00000000 0 0x01000>,	/* 12 IMGSYS_ADL_A */
a171784472954b Fred-LW Lu       2023-01-14  2416  			      <0 0x00000000 0 0x01000>,	/* 13 IMGSYS_ADL_B */
a171784472954b Fred-LW Lu       2023-01-14  2417  			      <0 0x15520000 0 0x00100>,	/* 14 IMGSYS_WPE2_DIP1 */
a171784472954b Fred-LW Lu       2023-01-14  2418  			      <0 0x15620000 0 0x00100>,	/* 15 IMGSYS_WPE3_DIP1 */
a171784472954b Fred-LW Lu       2023-01-14  2419  			      <0 0x15110000 0 0x00100>,	/* 16 IMGSYS_DIP_TOP */
a171784472954b Fred-LW Lu       2023-01-14  2420  			      <0 0x15130000 0 0x00100>;	/* 17 IMGSYS_DIP_TOP_NR */
cb75f24663df84 Jason Chen       2024-03-15  2421  			mediatek,scp = <&scp_c1>;
a171784472954b Fred-LW Lu       2023-01-14  2422  			mediatek,hcp = <&hcp>;
a171784472954b Fred-LW Lu       2023-01-14  2423  			mediatek,larbs = <&larb9>,
a171784472954b Fred-LW Lu       2023-01-14  2424  					 <&larb10>,
a171784472954b Fred-LW Lu       2023-01-14  2425  					 <&larb11a>,
a171784472954b Fred-LW Lu       2023-01-14  2426  					 <&larb11b>,
a171784472954b Fred-LW Lu       2023-01-14  2427  					 <&larb11c>,
a171784472954b Fred-LW Lu       2023-01-14  2428  					 <&larb15>;
a171784472954b Fred-LW Lu       2023-01-14  2429  			iommus = <&vdo_iommu M4U_PORT_L9_IMGI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2430  				 <&vdo_iommu M4U_PORT_L9_UFDI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2431  				 <&vdo_iommu M4U_PORT_L9_IMGBI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2432  				 <&vdo_iommu M4U_PORT_L9_IMGCI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2433  				 <&vdo_iommu M4U_PORT_L9_SMTI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2434  				 <&vdo_iommu M4U_PORT_L9_SMTI_T4_A>,
a171784472954b Fred-LW Lu       2023-01-14  2435  				 <&vdo_iommu M4U_PORT_L9_TNCSTI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2436  				 <&vdo_iommu M4U_PORT_L9_TNCSTI_T4_A>,
a171784472954b Fred-LW Lu       2023-01-14  2437  				 <&vdo_iommu M4U_PORT_L9_YUVO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2438  				 <&vdo_iommu M4U_PORT_L9_YUVBO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2439  				 <&vdo_iommu M4U_PORT_L9_YUVCO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2440  				 <&vdo_iommu M4U_PORT_L9_TIMGO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2441  				 <&vdo_iommu M4U_PORT_L9_YUVO_T2_A>,
a171784472954b Fred-LW Lu       2023-01-14  2442  				 <&vdo_iommu M4U_PORT_L9_YUVO_T5_A>,
a171784472954b Fred-LW Lu       2023-01-14  2443  				 <&vdo_iommu M4U_PORT_L9_IMGI_T1_B>,
a171784472954b Fred-LW Lu       2023-01-14  2444  				 <&vdo_iommu M4U_PORT_L9_IMGBI_T1_B>,
a171784472954b Fred-LW Lu       2023-01-14  2445  				 <&vdo_iommu M4U_PORT_L9_IMGCI_T1_B>,
a171784472954b Fred-LW Lu       2023-01-14  2446  				 <&vdo_iommu M4U_PORT_L9_SMTI_T4_B>,
a171784472954b Fred-LW Lu       2023-01-14  2447  				 <&vdo_iommu M4U_PORT_L9_TNCSO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2448  				 <&vdo_iommu M4U_PORT_L9_SMTO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2449  				 <&vdo_iommu M4U_PORT_L9_SMTO_T4_A>,
a171784472954b Fred-LW Lu       2023-01-14  2450  				 <&vdo_iommu M4U_PORT_L9_TNCSTO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2451  				 <&vdo_iommu M4U_PORT_L9_YUVO_T2_B>,
a171784472954b Fred-LW Lu       2023-01-14  2452  				 <&vdo_iommu M4U_PORT_L9_YUVO_T5_B>,
a171784472954b Fred-LW Lu       2023-01-14  2453  				 <&vdo_iommu M4U_PORT_L9_SMTO_T4_B>;
a171784472954b Fred-LW Lu       2023-01-14  2454  			mboxes = <&gce1 13 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2455  				 <&gce1 14 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2456  				 <&gce1 19 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2457  				 <&gce1 20 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2458  				 <&gce1 21 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2459  				 <&gce1 24 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2460  				 <&gce1 25 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2461  				 <&gce1 26 CMDQ_THR_PRIO_1>,
a171784472954b Fred-LW Lu       2023-01-14  2462  				 <&gce1 27 CMDQ_THR_PRIO_1>,
a171784472954b Fred-LW Lu       2023-01-14  2463  				 <&gce1 28 CMDQ_THR_PRIO_1>;
a171784472954b Fred-LW Lu       2023-01-14  2464  			traw_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2465  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2466  			traw_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2467  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2468  			traw_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2469  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2470  			traw_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2471  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2472  			traw_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2473  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2474  			traw_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2475  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2476  			traw_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2477  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2478  			traw_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2479  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2480  			traw_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2481  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2482  			traw_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2483  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2484  			ltraw_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2485  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2486  			ltraw_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2487  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2488  			ltraw_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2489  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2490  			ltraw_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2491  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2492  			ltraw_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2493  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2494  			ltraw_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2495  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2496  			ltraw_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2497  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2498  			ltraw_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2499  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2500  			ltraw_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2501  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2502  			ltraw_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2503  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2504  			xtraw_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2505  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2506  			xtraw_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2507  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2508  			xtraw_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2509  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2510  			xtraw_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2511  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2512  			xtraw_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2513  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2514  			xtraw_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2515  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2516  			xtraw_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2517  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2518  			xtraw_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2519  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2520  			xtraw_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2521  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2522  			xtraw_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2523  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2524  			dip_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2525  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2526  			dip_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2527  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2528  			dip_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2529  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2530  			dip_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2531  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2532  			dip_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2533  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2534  			dip_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2535  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2536  			dip_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2537  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2538  			dip_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2539  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2540  			dip_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2541  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2542  			dip_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2543  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2544  			pqa_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2545  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2546  			pqa_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2547  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2548  			pqa_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2549  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2550  			pqa_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2551  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2552  			pqa_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2553  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2554  			pqa_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2555  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2556  			pqa_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2557  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2558  			pqa_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2559  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2560  			pqa_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2561  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2562  			pqa_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2563  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2564  			pqb_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2565  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2566  			pqb_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2567  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2568  			pqb_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2569  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2570  			pqb_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2571  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2572  			pqb_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2573  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2574  			pqb_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2575  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2576  			pqb_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2577  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2578  			pqb_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2579  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2580  			pqb_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2581  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2582  			pqb_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2583  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2584  			wpe_eis_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2585  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2586  			wpe_eis_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2587  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2588  			wpe_eis_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2589  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2590  			wpe_eis_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2591  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2592  			wpe_eis_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2593  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2594  			wpe_eis_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2595  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2596  			wpe_eis_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2597  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2598  			wpe_eis_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2599  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2600  			wpe_eis_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2601  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2602  			wpe_eis_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2603  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2604  			wpe_tnr_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2605  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2606  			wpe_tnr_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2607  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2608  			wpe_tnr_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2609  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2610  			wpe_tnr_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2611  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2612  			wpe_tnr_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2613  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2614  			wpe_tnr_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2615  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2616  			wpe_tnr_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2617  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2618  			wpe_tnr_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2619  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2620  			wpe_tnr_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2621  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2622  			wpe_tnr_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2623  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2624  			wpe_lite_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2625  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2626  			wpe_lite_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2627  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2628  			wpe_lite_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2629  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2630  			wpe_lite_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2631  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2632  			wpe_lite_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2633  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2634  			wpe_lite_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2635  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2636  			wpe_lite_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2637  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2638  			wpe_lite_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2639  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2640  			wpe_lite_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2641  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2642  			wpe_lite_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2643  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2644  			me_done =
a171784472954b Fred-LW Lu       2023-01-14  2645  				/bits/ 16 <CMDQ_EVENT_IMG_IMGSYS_IPE_ME_DONE>;
a171784472954b Fred-LW Lu       2023-01-14  2646  			adl_tile_done =
a171784472954b Fred-LW Lu       2023-01-14  2647  				/bits/ 16 <CMDQ_EVENT_IMG_ADL_RESERVED>;
a171784472954b Fred-LW Lu       2023-01-14  2648  			wpe_eis_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2649  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_WPE_EIS>;
a171784472954b Fred-LW Lu       2023-01-14  2650  			wpe_tnr_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2651  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_WPE_TNR>;
a171784472954b Fred-LW Lu       2023-01-14  2652  			wpe_lite_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2653  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_WPE_LITE>;
a171784472954b Fred-LW Lu       2023-01-14  2654  			traw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2655  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_TRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2656  			ltraw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2657  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_LTRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2658  			xtraw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2659  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_XTRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2660  			dip_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2661  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_DIP>;
a171784472954b Fred-LW Lu       2023-01-14  2662  			pqdip_a_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2663  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_PQDIP_A>;
a171784472954b Fred-LW Lu       2023-01-14  2664  			pqdip_b_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2665  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_PQDIP_B>;
a171784472954b Fred-LW Lu       2023-01-14  2666  			me_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2667  				/bits/ 16 <CMDQ_SYNC_TOKEN_IPESYS_ME>;
a171784472954b Fred-LW Lu       2023-01-14  2668  			vss_traw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2669  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_VSS_TRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2670  			vss_ltraw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2671  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_VSS_LTRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2672  			vss_xtraw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2673  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_VSS_XTRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2674  			vss_dip_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2675  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_VSS_DIP>;
a171784472954b Fred-LW Lu       2023-01-14  2676  			sw_sync_token_pool_1 =
a171784472954b Fred-LW Lu       2023-01-14  2677  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_1>;
a171784472954b Fred-LW Lu       2023-01-14  2678  			sw_sync_token_pool_2 =
a171784472954b Fred-LW Lu       2023-01-14  2679  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_2>;
a171784472954b Fred-LW Lu       2023-01-14  2680  			sw_sync_token_pool_3 =
a171784472954b Fred-LW Lu       2023-01-14  2681  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_3>;
a171784472954b Fred-LW Lu       2023-01-14  2682  			sw_sync_token_pool_4 =
a171784472954b Fred-LW Lu       2023-01-14  2683  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_4>;
a171784472954b Fred-LW Lu       2023-01-14  2684  			sw_sync_token_pool_5 =
a171784472954b Fred-LW Lu       2023-01-14  2685  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_5>;
a171784472954b Fred-LW Lu       2023-01-14  2686  			sw_sync_token_pool_6 =
a171784472954b Fred-LW Lu       2023-01-14  2687  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_6>;
a171784472954b Fred-LW Lu       2023-01-14  2688  			sw_sync_token_pool_7 =
a171784472954b Fred-LW Lu       2023-01-14  2689  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_7>;
a171784472954b Fred-LW Lu       2023-01-14  2690  			sw_sync_token_pool_8 =
a171784472954b Fred-LW Lu       2023-01-14  2691  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_8>;
a171784472954b Fred-LW Lu       2023-01-14  2692  			sw_sync_token_pool_9 =
a171784472954b Fred-LW Lu       2023-01-14  2693  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_9>;
a171784472954b Fred-LW Lu       2023-01-14  2694  			sw_sync_token_pool_10 =
a171784472954b Fred-LW Lu       2023-01-14  2695  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_10>;
a171784472954b Fred-LW Lu       2023-01-14  2696  			sw_sync_token_pool_11 =
a171784472954b Fred-LW Lu       2023-01-14  2697  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_11>;
a171784472954b Fred-LW Lu       2023-01-14  2698  			sw_sync_token_pool_12 =
a171784472954b Fred-LW Lu       2023-01-14  2699  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_12>;
a171784472954b Fred-LW Lu       2023-01-14  2700  			sw_sync_token_pool_13 =
a171784472954b Fred-LW Lu       2023-01-14  2701  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_13>;
a171784472954b Fred-LW Lu       2023-01-14  2702  			sw_sync_token_pool_14 =
a171784472954b Fred-LW Lu       2023-01-14  2703  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_14>;
a171784472954b Fred-LW Lu       2023-01-14  2704  			sw_sync_token_pool_15 =
a171784472954b Fred-LW Lu       2023-01-14  2705  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_15>;
a171784472954b Fred-LW Lu       2023-01-14  2706  			sw_sync_token_pool_16 =
a171784472954b Fred-LW Lu       2023-01-14  2707  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_16>;
a171784472954b Fred-LW Lu       2023-01-14  2708  			sw_sync_token_pool_17 =
a171784472954b Fred-LW Lu       2023-01-14  2709  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_17>;
a171784472954b Fred-LW Lu       2023-01-14  2710  			sw_sync_token_pool_18 =
a171784472954b Fred-LW Lu       2023-01-14  2711  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_18>;
a171784472954b Fred-LW Lu       2023-01-14  2712  			sw_sync_token_pool_19 =
a171784472954b Fred-LW Lu       2023-01-14  2713  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_19>;
a171784472954b Fred-LW Lu       2023-01-14  2714  			sw_sync_token_pool_20 =
a171784472954b Fred-LW Lu       2023-01-14  2715  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_20>;
a171784472954b Fred-LW Lu       2023-01-14  2716  			sw_sync_token_pool_21 =
a171784472954b Fred-LW Lu       2023-01-14  2717  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_21>;
a171784472954b Fred-LW Lu       2023-01-14  2718  			sw_sync_token_pool_22 =
a171784472954b Fred-LW Lu       2023-01-14  2719  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_22>;
a171784472954b Fred-LW Lu       2023-01-14  2720  			sw_sync_token_pool_23 =
a171784472954b Fred-LW Lu       2023-01-14  2721  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_23>;
a171784472954b Fred-LW Lu       2023-01-14  2722  			sw_sync_token_pool_24 =
a171784472954b Fred-LW Lu       2023-01-14  2723  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_24>;
a171784472954b Fred-LW Lu       2023-01-14  2724  			sw_sync_token_pool_25 =
a171784472954b Fred-LW Lu       2023-01-14  2725  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_25>;
a171784472954b Fred-LW Lu       2023-01-14  2726  			sw_sync_token_pool_26 =
a171784472954b Fred-LW Lu       2023-01-14  2727  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_26>;
a171784472954b Fred-LW Lu       2023-01-14  2728  			sw_sync_token_pool_27 =
a171784472954b Fred-LW Lu       2023-01-14  2729  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_27>;
a171784472954b Fred-LW Lu       2023-01-14  2730  			sw_sync_token_pool_28 =
a171784472954b Fred-LW Lu       2023-01-14  2731  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_28>;
a171784472954b Fred-LW Lu       2023-01-14  2732  			sw_sync_token_pool_29 =
a171784472954b Fred-LW Lu       2023-01-14  2733  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_29>;
a171784472954b Fred-LW Lu       2023-01-14  2734  			sw_sync_token_pool_30 =
a171784472954b Fred-LW Lu       2023-01-14  2735  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_30>;
a171784472954b Fred-LW Lu       2023-01-14  2736  			sw_sync_token_pool_31 =
a171784472954b Fred-LW Lu       2023-01-14  2737  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_31>;
a171784472954b Fred-LW Lu       2023-01-14  2738  			sw_sync_token_pool_32 =
a171784472954b Fred-LW Lu       2023-01-14  2739  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_32>;
a171784472954b Fred-LW Lu       2023-01-14  2740  			sw_sync_token_pool_33 =
a171784472954b Fred-LW Lu       2023-01-14  2741  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_33>;
a171784472954b Fred-LW Lu       2023-01-14  2742  			sw_sync_token_pool_34 =
a171784472954b Fred-LW Lu       2023-01-14  2743  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_34>;
a171784472954b Fred-LW Lu       2023-01-14  2744  			sw_sync_token_pool_35 =
a171784472954b Fred-LW Lu       2023-01-14  2745  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_35>;
a171784472954b Fred-LW Lu       2023-01-14  2746  			sw_sync_token_pool_36 =
a171784472954b Fred-LW Lu       2023-01-14  2747  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_36>;
a171784472954b Fred-LW Lu       2023-01-14  2748  			sw_sync_token_pool_37 =
a171784472954b Fred-LW Lu       2023-01-14  2749  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_37>;
a171784472954b Fred-LW Lu       2023-01-14  2750  			sw_sync_token_pool_38 =
a171784472954b Fred-LW Lu       2023-01-14  2751  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_38>;
a171784472954b Fred-LW Lu       2023-01-14  2752  			sw_sync_token_pool_39 =
a171784472954b Fred-LW Lu       2023-01-14  2753  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_39>;
a171784472954b Fred-LW Lu       2023-01-14  2754  			sw_sync_token_pool_40 =
a171784472954b Fred-LW Lu       2023-01-14  2755  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_40>;
a171784472954b Fred-LW Lu       2023-01-14  2756  			sw_sync_token_pool_41 =
a171784472954b Fred-LW Lu       2023-01-14  2757  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_41>;
a171784472954b Fred-LW Lu       2023-01-14  2758  			sw_sync_token_pool_42 =
a171784472954b Fred-LW Lu       2023-01-14  2759  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_42>;
a171784472954b Fred-LW Lu       2023-01-14  2760  			sw_sync_token_pool_43 =
a171784472954b Fred-LW Lu       2023-01-14  2761  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_43>;
a171784472954b Fred-LW Lu       2023-01-14  2762  			sw_sync_token_pool_44 =
a171784472954b Fred-LW Lu       2023-01-14  2763  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_44>;
a171784472954b Fred-LW Lu       2023-01-14  2764  			sw_sync_token_pool_45 =
a171784472954b Fred-LW Lu       2023-01-14  2765  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_45>;
a171784472954b Fred-LW Lu       2023-01-14  2766  			sw_sync_token_pool_46 =
a171784472954b Fred-LW Lu       2023-01-14  2767  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_46>;
a171784472954b Fred-LW Lu       2023-01-14  2768  			sw_sync_token_pool_47 =
a171784472954b Fred-LW Lu       2023-01-14  2769  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_47>;
a171784472954b Fred-LW Lu       2023-01-14  2770  			sw_sync_token_pool_48 =
a171784472954b Fred-LW Lu       2023-01-14  2771  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_48>;
a171784472954b Fred-LW Lu       2023-01-14  2772  			sw_sync_token_pool_49 =
a171784472954b Fred-LW Lu       2023-01-14  2773  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_49>;
a171784472954b Fred-LW Lu       2023-01-14  2774  			sw_sync_token_pool_50 =
a171784472954b Fred-LW Lu       2023-01-14  2775  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_50>;
a171784472954b Fred-LW Lu       2023-01-14  2776  			sw_sync_token_pool_51 =
a171784472954b Fred-LW Lu       2023-01-14  2777  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_51>;
a171784472954b Fred-LW Lu       2023-01-14  2778  			sw_sync_token_pool_52 =
a171784472954b Fred-LW Lu       2023-01-14  2779  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_52>;
a171784472954b Fred-LW Lu       2023-01-14  2780  			sw_sync_token_pool_53 =
a171784472954b Fred-LW Lu       2023-01-14  2781  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_53>;
a171784472954b Fred-LW Lu       2023-01-14  2782  			sw_sync_token_pool_54 =
a171784472954b Fred-LW Lu       2023-01-14  2783  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_54>;
a171784472954b Fred-LW Lu       2023-01-14  2784  			sw_sync_token_pool_55 =
a171784472954b Fred-LW Lu       2023-01-14  2785  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_55>;
a171784472954b Fred-LW Lu       2023-01-14  2786  			sw_sync_token_pool_56 =
a171784472954b Fred-LW Lu       2023-01-14  2787  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_56>;
a171784472954b Fred-LW Lu       2023-01-14  2788  			sw_sync_token_pool_57 =
a171784472954b Fred-LW Lu       2023-01-14  2789  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_57>;
a171784472954b Fred-LW Lu       2023-01-14  2790  			sw_sync_token_pool_58 =
a171784472954b Fred-LW Lu       2023-01-14  2791  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_58>;
a171784472954b Fred-LW Lu       2023-01-14  2792  			sw_sync_token_pool_59 =
a171784472954b Fred-LW Lu       2023-01-14  2793  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_59>;
a171784472954b Fred-LW Lu       2023-01-14  2794  			sw_sync_token_pool_60 =
a171784472954b Fred-LW Lu       2023-01-14  2795  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_60>;
a171784472954b Fred-LW Lu       2023-01-14  2796  			sw_sync_token_tzmp_isp_wait =
a171784472954b Fred-LW Lu       2023-01-14  2797  				/bits/ 16 <CMDQ_SYNC_TOKEN_TZMP_ISP_WAIT>;
a171784472954b Fred-LW Lu       2023-01-14  2798  			sw_sync_token_tzmp_isp_set =
a171784472954b Fred-LW Lu       2023-01-14  2799  				/bits/ 16 <CMDQ_SYNC_TOKEN_TZMP_ISP_SET>;
a171784472954b Fred-LW Lu       2023-01-14  2800  #if 0
a171784472954b Fred-LW Lu       2023-01-14  2801  			sw_sync_token_pool_61 =
a171784472954b Fred-LW Lu       2023-01-14  2802  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_61>;
a171784472954b Fred-LW Lu       2023-01-14  2803  			sw_sync_token_pool_62 =
a171784472954b Fred-LW Lu       2023-01-14  2804  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_62>;
a171784472954b Fred-LW Lu       2023-01-14  2805  			sw_sync_token_pool_63 =
a171784472954b Fred-LW Lu       2023-01-14  2806  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_63>;
a171784472954b Fred-LW Lu       2023-01-14  2807  			sw_sync_token_pool_64 =
a171784472954b Fred-LW Lu       2023-01-14  2808  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_64>;
a171784472954b Fred-LW Lu       2023-01-14  2809  			sw_sync_token_pool_65 =
a171784472954b Fred-LW Lu       2023-01-14  2810  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_65>;
a171784472954b Fred-LW Lu       2023-01-14  2811  			sw_sync_token_pool_66 =
a171784472954b Fred-LW Lu       2023-01-14  2812  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_66>;
a171784472954b Fred-LW Lu       2023-01-14  2813  			sw_sync_token_pool_67 =
a171784472954b Fred-LW Lu       2023-01-14  2814  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_67>;
a171784472954b Fred-LW Lu       2023-01-14  2815  			sw_sync_token_pool_68 =
a171784472954b Fred-LW Lu       2023-01-14  2816  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_68>;
a171784472954b Fred-LW Lu       2023-01-14  2817  			sw_sync_token_pool_69 =
a171784472954b Fred-LW Lu       2023-01-14  2818  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_69>;
a171784472954b Fred-LW Lu       2023-01-14  2819  			sw_sync_token_pool_70 =
a171784472954b Fred-LW Lu       2023-01-14  2820  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_70>;
a171784472954b Fred-LW Lu       2023-01-14  2821  			sw_sync_token_pool_71 =
a171784472954b Fred-LW Lu       2023-01-14  2822  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_71>;
a171784472954b Fred-LW Lu       2023-01-14  2823  			sw_sync_token_pool_72 =
a171784472954b Fred-LW Lu       2023-01-14  2824  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_72>;
a171784472954b Fred-LW Lu       2023-01-14  2825  			sw_sync_token_pool_73 =
a171784472954b Fred-LW Lu       2023-01-14  2826  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_73>;
a171784472954b Fred-LW Lu       2023-01-14  2827  			sw_sync_token_pool_74 =
a171784472954b Fred-LW Lu       2023-01-14  2828  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_74>;
a171784472954b Fred-LW Lu       2023-01-14  2829  			sw_sync_token_pool_75 =
a171784472954b Fred-LW Lu       2023-01-14  2830  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_75>;
a171784472954b Fred-LW Lu       2023-01-14  2831  			sw_sync_token_pool_76 =
a171784472954b Fred-LW Lu       2023-01-14  2832  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_76>;
a171784472954b Fred-LW Lu       2023-01-14  2833  			sw_sync_token_pool_77 =
a171784472954b Fred-LW Lu       2023-01-14  2834  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_77>;
a171784472954b Fred-LW Lu       2023-01-14  2835  			sw_sync_token_pool_78 =
a171784472954b Fred-LW Lu       2023-01-14  2836  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_78>;
a171784472954b Fred-LW Lu       2023-01-14  2837  			sw_sync_token_pool_79 =
a171784472954b Fred-LW Lu       2023-01-14  2838  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_79>;
a171784472954b Fred-LW Lu       2023-01-14  2839  			sw_sync_token_pool_80 =
a171784472954b Fred-LW Lu       2023-01-14  2840  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_80>;
a171784472954b Fred-LW Lu       2023-01-14  2841  			sw_sync_token_pool_81 =
a171784472954b Fred-LW Lu       2023-01-14  2842  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_81>;
a171784472954b Fred-LW Lu       2023-01-14  2843  			sw_sync_token_pool_82 =
a171784472954b Fred-LW Lu       2023-01-14  2844  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_82>;
a171784472954b Fred-LW Lu       2023-01-14  2845  			sw_sync_token_pool_83 =
a171784472954b Fred-LW Lu       2023-01-14  2846  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_83>;
a171784472954b Fred-LW Lu       2023-01-14  2847  			sw_sync_token_pool_84 =
a171784472954b Fred-LW Lu       2023-01-14  2848  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_84>;
a171784472954b Fred-LW Lu       2023-01-14  2849  			sw_sync_token_pool_85 =
a171784472954b Fred-LW Lu       2023-01-14  2850  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_85>;
a171784472954b Fred-LW Lu       2023-01-14  2851  			sw_sync_token_pool_86 =
a171784472954b Fred-LW Lu       2023-01-14  2852  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_86>;
a171784472954b Fred-LW Lu       2023-01-14  2853  			sw_sync_token_pool_87 =
a171784472954b Fred-LW Lu       2023-01-14  2854  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_87>;
a171784472954b Fred-LW Lu       2023-01-14  2855  			sw_sync_token_pool_88 =
a171784472954b Fred-LW Lu       2023-01-14  2856  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_88>;
a171784472954b Fred-LW Lu       2023-01-14  2857  			sw_sync_token_pool_89 =
a171784472954b Fred-LW Lu       2023-01-14  2858  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_89>;
a171784472954b Fred-LW Lu       2023-01-14  2859  			sw_sync_token_pool_90 =
a171784472954b Fred-LW Lu       2023-01-14  2860  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_90>;
a171784472954b Fred-LW Lu       2023-01-14  2861  			sw_sync_token_pool_91 =
a171784472954b Fred-LW Lu       2023-01-14  2862  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_91>;
a171784472954b Fred-LW Lu       2023-01-14  2863  			sw_sync_token_pool_92 =
a171784472954b Fred-LW Lu       2023-01-14  2864  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_92>;
a171784472954b Fred-LW Lu       2023-01-14  2865  			sw_sync_token_pool_93 =
a171784472954b Fred-LW Lu       2023-01-14  2866  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_93>;
a171784472954b Fred-LW Lu       2023-01-14  2867  			sw_sync_token_pool_94 =
a171784472954b Fred-LW Lu       2023-01-14  2868  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_94>;
a171784472954b Fred-LW Lu       2023-01-14  2869  			sw_sync_token_pool_95 =
a171784472954b Fred-LW Lu       2023-01-14  2870  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_95>;
a171784472954b Fred-LW Lu       2023-01-14  2871  			sw_sync_token_pool_96 =
a171784472954b Fred-LW Lu       2023-01-14  2872  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_96>;
a171784472954b Fred-LW Lu       2023-01-14  2873  			sw_sync_token_pool_97 =
a171784472954b Fred-LW Lu       2023-01-14  2874  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_97>;
a171784472954b Fred-LW Lu       2023-01-14  2875  			sw_sync_token_pool_98 =
a171784472954b Fred-LW Lu       2023-01-14  2876  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_98>;
a171784472954b Fred-LW Lu       2023-01-14  2877  			sw_sync_token_pool_99 =
a171784472954b Fred-LW Lu       2023-01-14  2878  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_99>;
a171784472954b Fred-LW Lu       2023-01-14  2879  			sw_sync_token_pool_100 =
a171784472954b Fred-LW Lu       2023-01-14  2880  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_100>;
a171784472954b Fred-LW Lu       2023-01-14  2881  #endif
a171784472954b Fred-LW Lu       2023-01-14  2882  			sw_sync_token_camsys_pool_1 =
a171784472954b Fred-LW Lu       2023-01-14  2883  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_1>;
a171784472954b Fred-LW Lu       2023-01-14  2884  			sw_sync_token_camsys_pool_2 =
a171784472954b Fred-LW Lu       2023-01-14  2885  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_2>;
a171784472954b Fred-LW Lu       2023-01-14  2886  			sw_sync_token_camsys_pool_3 =
a171784472954b Fred-LW Lu       2023-01-14  2887  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_3>;
a171784472954b Fred-LW Lu       2023-01-14  2888  			sw_sync_token_camsys_pool_4 =
a171784472954b Fred-LW Lu       2023-01-14  2889  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_4>;
a171784472954b Fred-LW Lu       2023-01-14  2890  			sw_sync_token_camsys_pool_5 =
a171784472954b Fred-LW Lu       2023-01-14  2891  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_5>;
a171784472954b Fred-LW Lu       2023-01-14  2892  			sw_sync_token_camsys_pool_6 =
a171784472954b Fred-LW Lu       2023-01-14  2893  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_6>;
a171784472954b Fred-LW Lu       2023-01-14  2894  			sw_sync_token_camsys_pool_7 =
a171784472954b Fred-LW Lu       2023-01-14  2895  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_7>;
a171784472954b Fred-LW Lu       2023-01-14  2896  			sw_sync_token_camsys_pool_8 =
a171784472954b Fred-LW Lu       2023-01-14  2897  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_8>;
a171784472954b Fred-LW Lu       2023-01-14  2898  			sw_sync_token_camsys_pool_9 =
a171784472954b Fred-LW Lu       2023-01-14  2899  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_9>;
a171784472954b Fred-LW Lu       2023-01-14  2900  			sw_sync_token_camsys_pool_10 =
a171784472954b Fred-LW Lu       2023-01-14  2901  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_10>;
a171784472954b Fred-LW Lu       2023-01-14  2902  			clocks = <&imgsys CLK_IMGSYS_MAIN_TRAW0>,
a171784472954b Fred-LW Lu       2023-01-14  2903  				 <&imgsys CLK_IMGSYS_MAIN_TRAW1>,
a171784472954b Fred-LW Lu       2023-01-14  2904  				 <&imgsys CLK_IMGSYS_MAIN_VCORE_GALS>,
a171784472954b Fred-LW Lu       2023-01-14  2905  				 <&imgsys CLK_IMGSYS_MAIN_DIP0>,
a171784472954b Fred-LW Lu       2023-01-14  2906  				 <&imgsys CLK_IMGSYS_MAIN_WPE0>,
a171784472954b Fred-LW Lu       2023-01-14  2907  				 <&imgsys CLK_IMGSYS_MAIN_WPE1>,
a171784472954b Fred-LW Lu       2023-01-14  2908  				 <&imgsys CLK_IMGSYS_MAIN_WPE2>,
a171784472954b Fred-LW Lu       2023-01-14  2909  				 <&imgsys CLK_IMGSYS_MAIN_WPE0>,
a171784472954b Fred-LW Lu       2023-01-14  2910  				 <&imgsys CLK_IMGSYS_MAIN_WPE1>,
a171784472954b Fred-LW Lu       2023-01-14  2911  				 <&imgsys CLK_IMGSYS_MAIN_WPE2>,
a171784472954b Fred-LW Lu       2023-01-14  2912  				 <&imgsys CLK_IMGSYS_MAIN_GALS>,
a171784472954b Fred-LW Lu       2023-01-14  2913  				 <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_DIP_TOP>,
a171784472954b Fred-LW Lu       2023-01-14  2914  				 <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_DIP_NR>,
a171784472954b Fred-LW Lu       2023-01-14  2915  				 <&imgsys_wpe1 CLK_IMGSYS_WPE1>,
a171784472954b Fred-LW Lu       2023-01-14  2916  				 <&imgsys_wpe2 CLK_IMGSYS_WPE2>,
a171784472954b Fred-LW Lu       2023-01-14  2917  				 <&imgsys_wpe3 CLK_IMGSYS_WPE3>,
a171784472954b Fred-LW Lu       2023-01-14  2918  				 <&imgsys CLK_IMGSYS_MAIN_IPE>;
a171784472954b Fred-LW Lu       2023-01-14  2919  
a171784472954b Fred-LW Lu       2023-01-14  2920  			clock-names = "IMGSYS_CG_IMG_TRAW0",
a171784472954b Fred-LW Lu       2023-01-14  2921  				      "IMGSYS_CG_IMG_TRAW1",
a171784472954b Fred-LW Lu       2023-01-14  2922  				      "IMGSYS_CG_IMG_VCORE_GALS",
a171784472954b Fred-LW Lu       2023-01-14  2923  				      "IMGSYS_CG_IMG_DIP0",
a171784472954b Fred-LW Lu       2023-01-14  2924  				      "IMGSYS_CG_IMG_WPE0",
a171784472954b Fred-LW Lu       2023-01-14  2925  				      "IMGSYS_CG_IMG_WPE1",
a171784472954b Fred-LW Lu       2023-01-14  2926  				      "IMGSYS_CG_IMG_WPE2",
a171784472954b Fred-LW Lu       2023-01-14  2927  				      "IMGSYS_CG_IMG_ADL_LARB",
a171784472954b Fred-LW Lu       2023-01-14  2928  				      "IMGSYS_CG_IMG_ADL_TOP0",
a171784472954b Fred-LW Lu       2023-01-14  2929  				      "IMGSYS_CG_IMG_ADL_TOP1",
a171784472954b Fred-LW Lu       2023-01-14  2930  				      "IMGSYS_CG_IMG_GALS",
a171784472954b Fred-LW Lu       2023-01-14  2931  				      "DIP_TOP_DIP_TOP",
a171784472954b Fred-LW Lu       2023-01-14  2932  				      "DIP_NR_DIP_NR",
a171784472954b Fred-LW Lu       2023-01-14  2933  				      "WPE1_CG_DIP1_WPE",
a171784472954b Fred-LW Lu       2023-01-14  2934  				      "WPE2_CG_DIP1_WPE",
a171784472954b Fred-LW Lu       2023-01-14  2935  				      "WPE3_CG_DIP1_WPE",
a171784472954b Fred-LW Lu       2023-01-14  2936  				      "ME_CG_IPE";
a171784472954b Fred-LW Lu       2023-01-14  2937  
a171784472954b Fred-LW Lu       2023-01-14  2938  			operating-points-v2 = <&opp_table_img>, <&opp_table_ipe>;
a171784472954b Fred-LW Lu       2023-01-14  2939  			dvfsrc-vmm-supply = <&vmm_proxy_label>;
782ebf1a9aeb1d Bruce Cheng      2023-06-14  2940  			assigned-clocks = <&topckgen CLK_TOP_IMG>;
782ebf1a9aeb1d Bruce Cheng      2023-06-14  2941  			assigned-clock-parents = <&apmixedsys CLK_APMIXED_IMGPLL>;
a171784472954b Fred-LW Lu       2023-01-14  2942  #if 0
a171784472954b Fred-LW Lu       2023-01-14  2943  			interconnects =
a171784472954b Fred-LW Lu       2023-01-14  2944  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2945  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2946  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_UFDI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2947  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2948  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGBI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2949  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2950  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGCI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2951  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2952  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2953  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2954  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTI_T4_A)
a171784472954b Fred-LW Lu       2023-01-14  2955  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2956  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TNCSTI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2957  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2958  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TNCSTI_T4_A)
a171784472954b Fred-LW Lu       2023-01-14  2959  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2960  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2961  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2962  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVBO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2963  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2964  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVCO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2965  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2966  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TIMGO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2967  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2968  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T2_A)
a171784472954b Fred-LW Lu       2023-01-14  2969  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2970  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T5_A)
a171784472954b Fred-LW Lu       2023-01-14  2971  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2972  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGI_T1_B)
a171784472954b Fred-LW Lu       2023-01-14  2973  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2974  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGBI_T1_B)
a171784472954b Fred-LW Lu       2023-01-14  2975  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2976  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGCI_T1_B)
a171784472954b Fred-LW Lu       2023-01-14  2977  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2978  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTI_T4_B)
a171784472954b Fred-LW Lu       2023-01-14  2979  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2980  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TNCSO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2981  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2982  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2983  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2984  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTO_T4_A)
a171784472954b Fred-LW Lu       2023-01-14  2985  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2986  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TNCSTO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2987  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2988  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T2_B)
a171784472954b Fred-LW Lu       2023-01-14  2989  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2990  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T5_B)
a171784472954b Fred-LW Lu       2023-01-14  2991  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2992  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTO_T4_B)
a171784472954b Fred-LW Lu       2023-01-14  2993  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2994  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_IMGI_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  2995  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2996  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_IMGBI_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  2997  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2998  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_IMGCI_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  2999  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3000  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTI_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3001  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3002  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTI_T4_C)
a171784472954b Fred-LW Lu       2023-01-14  3003  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3004  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTI_T6_C)
a171784472954b Fred-LW Lu       2023-01-14  3005  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3006  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3007  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3008  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVBO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3009  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3010  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVCO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3011  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3012  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_TIMGO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3013  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3014  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVO_T2_C)
a171784472954b Fred-LW Lu       2023-01-14  3015  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3016  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVO_T5_C)
a171784472954b Fred-LW Lu       2023-01-14  3017  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3018  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3019  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3020  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTO_T4_C)
a171784472954b Fred-LW Lu       2023-01-14  3021  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3022  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTO_T6_C)
a171784472954b Fred-LW Lu       2023-01-14  3023  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3024  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_DBGO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3025  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3026  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMGI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3027  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3028  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMGBI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3029  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3030  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMGCI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3031  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3032  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMGDI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3033  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3034  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_DEPI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3035  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3036  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_DMGI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3037  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3038  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_SMTI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3039  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3040  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_RECI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3041  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3042  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_RECI_D1_N)
a171784472954b Fred-LW Lu       2023-01-14  3043  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3044  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRWI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3045  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3046  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRCI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3047  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3048  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRCI_D1_N)
a171784472954b Fred-LW Lu       2023-01-14  3049  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3050  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMG4O_D1)
a171784472954b Fred-LW Lu       2023-01-14  3051  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3052  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMG4BO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3053  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3054  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_SMTI_D8)
a171784472954b Fred-LW Lu       2023-01-14  3055  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3056  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_SMTO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3057  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3058  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRMO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3059  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3060  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRMO_D1_N)
a171784472954b Fred-LW Lu       2023-01-14  3061  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3062  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_SMTO_D8)
a171784472954b Fred-LW Lu       2023-01-14  3063  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3064  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_DBGO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3065  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3066  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_VIPI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3067  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3068  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_VIPBI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3069  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3070  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTI_D6)
a171784472954b Fred-LW Lu       2023-01-14  3071  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3072  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCSTI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3073  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3074  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCSTI_D4)
a171784472954b Fred-LW Lu       2023-01-14  3075  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3076  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTI_D4)
a171784472954b Fred-LW Lu       2023-01-14  3077  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3078  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_IMG3O_D1)
a171784472954b Fred-LW Lu       2023-01-14  3079  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3080  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_IMG3BO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3081  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3082  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_IMG3CO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3083  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3084  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_IMG2O_D1)
a171784472954b Fred-LW Lu       2023-01-14  3085  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3086  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTI_D9)
a171784472954b Fred-LW Lu       2023-01-14  3087  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3088  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTO_D4)
a171784472954b Fred-LW Lu       2023-01-14  3089  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3090  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_FEO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3091  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3092  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCSO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3093  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3094  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCSTO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3095  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3096  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTO_D6)
a171784472954b Fred-LW Lu       2023-01-14  3097  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3098  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTO_D9)
a171784472954b Fred-LW Lu       2023-01-14  3099  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3100  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3101  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3102  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCO_D1_N)
a171784472954b Fred-LW Lu       2023-01-14  3103  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3104  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_PIMGI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3105  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3106  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_PIMGBI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3107  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3108  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_PIMGCI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3109  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3110  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WROT_P1)
a171784472954b Fred-LW Lu       2023-01-14  3111  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3112  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_TCCSO_P1)
a171784472954b Fred-LW Lu       2023-01-14  3113  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3114  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_TCCSI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3115  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3116  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_PIMGI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3117  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3118  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_PIMGBI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3119  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3120  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_PIMGCI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3121  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3122  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WROT_P1)
a171784472954b Fred-LW Lu       2023-01-14  3123  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3124  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_TCCSO_P1)
a171784472954b Fred-LW Lu       2023-01-14  3125  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3126  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_TCCSI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3127  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3128  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_RDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3129  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3130  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_RDMA_1)
a171784472954b Fred-LW Lu       2023-01-14  3131  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3132  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_RDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3133  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3134  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_RDMA_4P_1)
a171784472954b Fred-LW Lu       2023-01-14  3135  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3136  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_CQ0)
a171784472954b Fred-LW Lu       2023-01-14  3137  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3138  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_CQ1)
a171784472954b Fred-LW Lu       2023-01-14  3139  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3140  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_WDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3141  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3142  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_WDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3143  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3144  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_RDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3145  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3146  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_RDMA_1)
a171784472954b Fred-LW Lu       2023-01-14  3147  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3148  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_RDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3149  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3150  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_RDMA_4P_1)
a171784472954b Fred-LW Lu       2023-01-14  3151  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3152  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_CQ0)
a171784472954b Fred-LW Lu       2023-01-14  3153  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3154  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_CQ1)
a171784472954b Fred-LW Lu       2023-01-14  3155  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3156  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_WDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3157  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3158  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_WDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3159  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3160  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_RDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3161  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3162  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_RDMA_1)
a171784472954b Fred-LW Lu       2023-01-14  3163  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3164  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_RDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3165  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3166  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_RDMA_4P_1)
a171784472954b Fred-LW Lu       2023-01-14  3167  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3168  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_CQ0)
a171784472954b Fred-LW Lu       2023-01-14  3169  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3170  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_CQ1)
a171784472954b Fred-LW Lu       2023-01-14  3171  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3172  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_WDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3173  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3174  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_WDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3175  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3176  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_ME_RDMA)
a171784472954b Fred-LW Lu       2023-01-14  3177  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3178  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_ME_WDMA)
a171784472954b Fred-LW Lu       2023-01-14  3179  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3180  				<&mmqos SLAVE_LARB(SMI_L9_ID)
a171784472954b Fred-LW Lu       2023-01-14  3181  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3182  				<&mmqos SLAVE_LARB(SMI_L12_ID)
a171784472954b Fred-LW Lu       2023-01-14  3183  					&mmqos SLAVE_COMMON(1)>;
a171784472954b Fred-LW Lu       2023-01-14  3184  #endif
a171784472954b Fred-LW Lu       2023-01-14  3185  			interconnect-names =
a171784472954b Fred-LW Lu       2023-01-14  3186  				"l9_imgi_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3187  				"l9_ufdi_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3188  				"l9_imgbi_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3189  				"l9_imgci_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3190  				"l9_smti_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3191  				"l9_smti_t4_a",
a171784472954b Fred-LW Lu       2023-01-14  3192  				"l9_tncsti_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3193  				"l9_tncsti_t4_a",
a171784472954b Fred-LW Lu       2023-01-14  3194  				"l9_yuvo_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3195  				"l9_yuvbo_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3196  				"l9_yuvco_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3197  				"l9_timgo_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3198  				"l9_yuvo_t2_a",
a171784472954b Fred-LW Lu       2023-01-14  3199  				"l9_yuvo_t5_a",
a171784472954b Fred-LW Lu       2023-01-14  3200  				"l9_tncso_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3201  				"l9_smto_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3202  				"l9_smto_t4_a",
a171784472954b Fred-LW Lu       2023-01-14  3203  				"l9_tncsto_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3204  				"l9_imgi_t1_b",
a171784472954b Fred-LW Lu       2023-01-14  3205  				"l9_imgbi_t1_b",
a171784472954b Fred-LW Lu       2023-01-14  3206  				"l9_imgci_t1_b",
a171784472954b Fred-LW Lu       2023-01-14  3207  				"l9_smti_t4_b",
a171784472954b Fred-LW Lu       2023-01-14  3208  				"l9_yuvo_t2_b",
a171784472954b Fred-LW Lu       2023-01-14  3209  				"l9_yuvo_t5_b",
a171784472954b Fred-LW Lu       2023-01-14  3210  				"l9_smto_t4_b",
a171784472954b Fred-LW Lu       2023-01-14  3211  				"l11a_imgi_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3212  				"l11a_imgbi_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3213  				"l11a_imgci_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3214  				"l11a_smti_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3215  				"l11a_smti_t4_c",
a171784472954b Fred-LW Lu       2023-01-14  3216  				"l11a_smti_t6_c",
a171784472954b Fred-LW Lu       2023-01-14  3217  				"l11a_yuvo_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3218  				"l11a_yuvbo_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3219  				"l11a_yuvco_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3220  				"l11a_timgo_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3221  				"l11a_yuvo_t2_c",
a171784472954b Fred-LW Lu       2023-01-14  3222  				"l11a_yuvo_t5_c",
a171784472954b Fred-LW Lu       2023-01-14  3223  				"l11a_smto_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3224  				"l11a_smto_t4_c",
a171784472954b Fred-LW Lu       2023-01-14  3225  				"l11a_smto_t6_c",
a171784472954b Fred-LW Lu       2023-01-14  3226  				"l11a_dbgo_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3227  				"l10_imgi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3228  				"l10_imgbi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3229  				"l10_imgci_d1",
a171784472954b Fred-LW Lu       2023-01-14  3230  				"l10_imgdi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3231  				"l10_depi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3232  				"l10_dmgi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3233  				"l10_smti_d1",
a171784472954b Fred-LW Lu       2023-01-14  3234  				"l10_reci_d1",
a171784472954b Fred-LW Lu       2023-01-14  3235  				"l10_reci_d1_n",
a171784472954b Fred-LW Lu       2023-01-14  3236  				"l10_tnrwi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3237  				"l10_tnrci_d1",
a171784472954b Fred-LW Lu       2023-01-14  3238  				"l10_tnrci_d1_n",
a171784472954b Fred-LW Lu       2023-01-14  3239  				"l10_img4o_d1",
a171784472954b Fred-LW Lu       2023-01-14  3240  				"l10_img4bo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3241  				"l10_smti_d8",
a171784472954b Fred-LW Lu       2023-01-14  3242  				"l10_smto_d1",
a171784472954b Fred-LW Lu       2023-01-14  3243  				"l10_tnrmo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3244  				"l10_tnrmo_d1_n",
a171784472954b Fred-LW Lu       2023-01-14  3245  				"l10_smto_d8",
a171784472954b Fred-LW Lu       2023-01-14  3246  				"l10_dbgo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3247  				"l15_vipi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3248  				"l15_vipbi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3249  				"l15_smti_d6",
a171784472954b Fred-LW Lu       2023-01-14  3250  				"l15_tncsti_d1",
a171784472954b Fred-LW Lu       2023-01-14  3251  				"l15_tncsti_d4",
a171784472954b Fred-LW Lu       2023-01-14  3252  				"l15_smti_d4",
a171784472954b Fred-LW Lu       2023-01-14  3253  				"l15_img3o_d1",
a171784472954b Fred-LW Lu       2023-01-14  3254  				"l15_img3bo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3255  				"l15_img3co_d1",
a171784472954b Fred-LW Lu       2023-01-14  3256  				"l15_img2o_d1",
a171784472954b Fred-LW Lu       2023-01-14  3257  				"l15_smti_d9",
a171784472954b Fred-LW Lu       2023-01-14  3258  				"l15_smto_d4",
a171784472954b Fred-LW Lu       2023-01-14  3259  				"l15_feo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3260  				"l15_tncso_d1",
a171784472954b Fred-LW Lu       2023-01-14  3261  				"l15_tncsto_d1",
a171784472954b Fred-LW Lu       2023-01-14  3262  				"l15_smto_d6",
a171784472954b Fred-LW Lu       2023-01-14  3263  				"l15_smto_d9",
a171784472954b Fred-LW Lu       2023-01-14  3264  				"l15_tnco_d1",
a171784472954b Fred-LW Lu       2023-01-14  3265  				"l15_tnco_d1_n",
a171784472954b Fred-LW Lu       2023-01-14  3266  				"l11a_pimgi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3267  				"l11a_pimgbi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3268  				"l11a_pimgci_p1",
a171784472954b Fred-LW Lu       2023-01-14  3269  				"l11a_wrot_p1",
a171784472954b Fred-LW Lu       2023-01-14  3270  				"l11a_tccso_p1",
a171784472954b Fred-LW Lu       2023-01-14  3271  				"l11a_tccsi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3272  				"l11b_pimgi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3273  				"l11b_pimgbi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3274  				"l11b_pimgci_p1",
a171784472954b Fred-LW Lu       2023-01-14  3275  				"l11b_wrot_p1",
a171784472954b Fred-LW Lu       2023-01-14  3276  				"l11b_tccso_p1",
a171784472954b Fred-LW Lu       2023-01-14  3277  				"l11b_tccsi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3278  				"l11a_wpe_rdma0",
a171784472954b Fred-LW Lu       2023-01-14  3279  				"l11a_wpe_rdma1",
a171784472954b Fred-LW Lu       2023-01-14  3280  				"l11a_wpe_rdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3281  				"l11a_wpe_rdma_4p1",
a171784472954b Fred-LW Lu       2023-01-14  3282  				"l11a_wpe_cq0",
a171784472954b Fred-LW Lu       2023-01-14  3283  				"l11a_wpe_cq1",
a171784472954b Fred-LW Lu       2023-01-14  3284  				"l11a_wpe_wdma0",
a171784472954b Fred-LW Lu       2023-01-14  3285  				"l11a_wpe_wdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3286  				"l11b_wpe_rdma0",
a171784472954b Fred-LW Lu       2023-01-14  3287  				"l11b_wpe_rdma1",
a171784472954b Fred-LW Lu       2023-01-14  3288  				"l11b_wpe_rdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3289  				"l11b_wpe_rdma_4p1",
a171784472954b Fred-LW Lu       2023-01-14  3290  				"l11b_wpe_cq0",
a171784472954b Fred-LW Lu       2023-01-14  3291  				"l11b_wpe_cq1",
a171784472954b Fred-LW Lu       2023-01-14  3292  				"l11b_wpe_wdma0",
a171784472954b Fred-LW Lu       2023-01-14  3293  				"l11b_wpe_wdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3294  				"l11c_wpe_rdma0",
a171784472954b Fred-LW Lu       2023-01-14  3295  				"l11c_wpe_rdma1",
a171784472954b Fred-LW Lu       2023-01-14  3296  				"l11c_wpe_rdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3297  				"l11c_wpe_rdma_4p1",
a171784472954b Fred-LW Lu       2023-01-14  3298  				"l11c_wpe_cq0",
a171784472954b Fred-LW Lu       2023-01-14  3299  				"l11c_wpe_cq1",
a171784472954b Fred-LW Lu       2023-01-14  3300  				"l11c_wpe_wdma0",
a171784472954b Fred-LW Lu       2023-01-14  3301  				"l11c_wpe_wdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3302  				"l12_me_rdma",
a171784472954b Fred-LW Lu       2023-01-14  3303  				"l12_me_wdma",
a171784472954b Fred-LW Lu       2023-01-14  3304  				"l9_common_0",
a171784472954b Fred-LW Lu       2023-01-14  3305  				"l12_common_1";
a171784472954b Fred-LW Lu       2023-01-14  3306  		};
a171784472954b Fred-LW Lu       2023-01-14  3307  
cbb0f8b948cfda Fei Shao         2024-06-14  3308  		imgsys-l10 {
a171784472954b Fred-LW Lu       2023-01-14  3309  			compatible = "mediatek,imgsys-larb";
a171784472954b Fred-LW Lu       2023-01-14  3310  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3311  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3312  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  3313  			iommus = <&vdo_iommu M4U_PORT_L10_IMGI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3314  				 <&vdo_iommu M4U_PORT_L10_IMGBI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3315  				 <&vdo_iommu M4U_PORT_L10_IMGCI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3316  				 <&vdo_iommu M4U_PORT_L10_IMGDI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3317  				 <&vdo_iommu M4U_PORT_L10_DEPI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3318  				 <&vdo_iommu M4U_PORT_L10_DMGI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3319  				 <&vdo_iommu M4U_PORT_L10_SMTI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3320  				 <&vdo_iommu M4U_PORT_L10_RECI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3321  				 <&vdo_iommu M4U_PORT_L10_RECI_D1_N>,
a171784472954b Fred-LW Lu       2023-01-14  3322  				 <&vdo_iommu M4U_PORT_L10_TNRWI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3323  				 <&vdo_iommu M4U_PORT_L10_TNRCI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3324  				 <&vdo_iommu M4U_PORT_L10_TNRCI_D1_N>,
a171784472954b Fred-LW Lu       2023-01-14  3325  				 <&vdo_iommu M4U_PORT_L10_IMG4O_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3326  				 <&vdo_iommu M4U_PORT_L10_IMG4BO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3327  				 <&vdo_iommu M4U_PORT_L10_SMTI_D8>,
a171784472954b Fred-LW Lu       2023-01-14  3328  				 <&vdo_iommu M4U_PORT_L10_SMTO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3329  				 <&vdo_iommu M4U_PORT_L10_TNRMO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3330  				 <&vdo_iommu M4U_PORT_L10_TNRMO_D1_N>,
a171784472954b Fred-LW Lu       2023-01-14  3331  				 <&vdo_iommu M4U_PORT_L10_SMTO_D8>,
a171784472954b Fred-LW Lu       2023-01-14  3332  				 <&vdo_iommu M4U_PORT_L10_DBGO_D1>;
a171784472954b Fred-LW Lu       2023-01-14  3333  		};
a171784472954b Fred-LW Lu       2023-01-14  3334  
cbb0f8b948cfda Fei Shao         2024-06-14  3335  		imgsys-l11A {
a171784472954b Fred-LW Lu       2023-01-14  3336  			compatible = "mediatek,imgsys-larb";
a171784472954b Fred-LW Lu       2023-01-14  3337  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3338  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3339  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  3340  			iommus = <&vdo_iommu M4U_PORT_L11A_WPE_RDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  3341  				 <&vdo_iommu M4U_PORT_L11A_WPE_RDMA_1>,
a171784472954b Fred-LW Lu       2023-01-14  3342  				 <&vdo_iommu M4U_PORT_L11A_WPE_RDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  3343  				 <&vdo_iommu M4U_PORT_L11A_WPE_RDMA_4P_1>,
a171784472954b Fred-LW Lu       2023-01-14  3344  				 <&vdo_iommu M4U_PORT_L11A_WPE_CQ0>,
a171784472954b Fred-LW Lu       2023-01-14  3345  				 <&vdo_iommu M4U_PORT_L11A_WPE_CQ1>,
a171784472954b Fred-LW Lu       2023-01-14  3346  				 <&vdo_iommu M4U_PORT_L11A_PIMGI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3347  				 <&vdo_iommu M4U_PORT_L11A_PIMGBI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3348  				 <&vdo_iommu M4U_PORT_L11A_PIMGCI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3349  				 <&vdo_iommu M4U_PORT_L11A_IMGI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3350  				 <&vdo_iommu M4U_PORT_L11A_IMGBI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3351  				 <&vdo_iommu M4U_PORT_L11A_IMGCI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3352  				 <&vdo_iommu M4U_PORT_L11A_SMTI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3353  				 <&vdo_iommu M4U_PORT_L11A_SMTI_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  3354  				 <&vdo_iommu M4U_PORT_L11A_SMTI_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  3355  				 <&vdo_iommu M4U_PORT_L11A_YUVO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3356  				 <&vdo_iommu M4U_PORT_L11A_YUVBO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3357  				 <&vdo_iommu M4U_PORT_L11A_YUVCO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3358  				 <&vdo_iommu M4U_PORT_L11A_WPE_WDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  3359  				 <&vdo_iommu M4U_PORT_L11A_WPE_WDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  3360  				 <&vdo_iommu M4U_PORT_L11A_WROT_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3361  				 <&vdo_iommu M4U_PORT_L11A_TCCSO_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3362  				 <&vdo_iommu M4U_PORT_L11A_TCCSI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3363  				 <&vdo_iommu M4U_PORT_L11A_TIMGO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3364  				 <&vdo_iommu M4U_PORT_L11A_YUVO_T2_C>,
a171784472954b Fred-LW Lu       2023-01-14  3365  				 <&vdo_iommu M4U_PORT_L11A_YUVO_T5_C>,
a171784472954b Fred-LW Lu       2023-01-14  3366  				 <&vdo_iommu M4U_PORT_L11A_SMTO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3367  				 <&vdo_iommu M4U_PORT_L11A_SMTO_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  3368  				 <&vdo_iommu M4U_PORT_L11A_SMTO_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  3369  				 <&vdo_iommu M4U_PORT_L11A_DBGO_T1_C>;
a171784472954b Fred-LW Lu       2023-01-14  3370  		};
a171784472954b Fred-LW Lu       2023-01-14  3371  
cbb0f8b948cfda Fei Shao         2024-06-14  3372  		imgsys-l11C {
a171784472954b Fred-LW Lu       2023-01-14  3373  			compatible = "mediatek,imgsys-larb";
a171784472954b Fred-LW Lu       2023-01-14  3374  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3375  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3376  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  3377  			iommus = <&vdo_iommu M4U_PORT_L11C_WPE_RDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  3378  				 <&vdo_iommu M4U_PORT_L11C_WPE_RDMA_1>,
a171784472954b Fred-LW Lu       2023-01-14  3379  				 <&vdo_iommu M4U_PORT_L11C_WPE_RDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  3380  				 <&vdo_iommu M4U_PORT_L11C_WPE_RDMA_4P_1>,
a171784472954b Fred-LW Lu       2023-01-14  3381  				 <&vdo_iommu M4U_PORT_L11C_WPE_CQ0>,
a171784472954b Fred-LW Lu       2023-01-14  3382  				 <&vdo_iommu M4U_PORT_L11C_WPE_CQ1>,
a171784472954b Fred-LW Lu       2023-01-14  3383  				 <&vdo_iommu M4U_PORT_L11C_PIMGI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3384  				 <&vdo_iommu M4U_PORT_L11C_PIMGBI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3385  				 <&vdo_iommu M4U_PORT_L11C_PIMGCI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3386  				 <&vdo_iommu M4U_PORT_L11C_IMGI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3387  				 <&vdo_iommu M4U_PORT_L11C_IMGBI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3388  				 <&vdo_iommu M4U_PORT_L11C_IMGCI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3389  				 <&vdo_iommu M4U_PORT_L11C_SMTI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3390  				 <&vdo_iommu M4U_PORT_L11C_SMTI_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  3391  				 <&vdo_iommu M4U_PORT_L11C_SMTI_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  3392  				 <&vdo_iommu M4U_PORT_L11C_YUVO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3393  				 <&vdo_iommu M4U_PORT_L11C_YUVBO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3394  				 <&vdo_iommu M4U_PORT_L11C_YUVCO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3395  				 <&vdo_iommu M4U_PORT_L11C_WPE_WDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  3396  				 <&vdo_iommu M4U_PORT_L11C_WPE_WDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  3397  				 <&vdo_iommu M4U_PORT_L11C_WROT_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3398  				 <&vdo_iommu M4U_PORT_L11C_TCCSO_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3399  				 <&vdo_iommu M4U_PORT_L11C_TCCSI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3400  				 <&vdo_iommu M4U_PORT_L11C_TIMGO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3401  				 <&vdo_iommu M4U_PORT_L11C_YUVO_T2_C>,
a171784472954b Fred-LW Lu       2023-01-14  3402  				 <&vdo_iommu M4U_PORT_L11C_YUVO_T5_C>,
a171784472954b Fred-LW Lu       2023-01-14  3403  				 <&vdo_iommu M4U_PORT_L11C_SMTO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3404  				 <&vdo_iommu M4U_PORT_L11C_SMTO_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  3405  				 <&vdo_iommu M4U_PORT_L11C_SMTO_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  3406  				 <&vdo_iommu M4U_PORT_L11C_DBGO_T1_C>;
a171784472954b Fred-LW Lu       2023-01-14  3407  		};
a171784472954b Fred-LW Lu       2023-01-14  3408  
cbb0f8b948cfda Fei Shao         2024-06-14  3409  		ipesys_me: ipesys-me@15320000 {
a171784472954b Fred-LW Lu       2023-01-14  3410  			compatible = "mediatek,ipesys-me";
a171784472954b Fred-LW Lu       2023-01-14  3411  			reg = <0 0x15320000 0 0x10000>;	/* IPESYS_ME */
a171784472954b Fred-LW Lu       2023-01-14  3412  			mediatek,larb = <&larb12>;
a171784472954b Fred-LW Lu       2023-01-14  3413  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3414  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3415  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  3416  			iommus = <&vpp_iommu M4U_PORT_L12_ME_RDMA>,
a171784472954b Fred-LW Lu       2023-01-14  3417  				 <&vpp_iommu M4U_PORT_L12_ME_WDMA>;
a171784472954b Fred-LW Lu       2023-01-14  3418  			clocks =
a171784472954b Fred-LW Lu       2023-01-14  3419  				<&imgsys CLK_IMGSYS_MAIN_IPE>,
a171784472954b Fred-LW Lu       2023-01-14  3420  				<&ipesys CLK_IPESYS_TOP>,
a171784472954b Fred-LW Lu       2023-01-14  3421  				<&ipesys CLK_IPE_ME>,
a171784472954b Fred-LW Lu       2023-01-14  3422  				<&ipesys CLK_IPE_SMI_LARB12>;
a171784472954b Fred-LW Lu       2023-01-14  3423  			clock-names =
a171784472954b Fred-LW Lu       2023-01-14  3424  				"ME_CG_IPE",
a171784472954b Fred-LW Lu       2023-01-14  3425  				"ME_CG_IPE_TOP",
a171784472954b Fred-LW Lu       2023-01-14  3426  				"ME_CG",
a171784472954b Fred-LW Lu       2023-01-14  3427  				"ME_CG_LARB12";
a171784472954b Fred-LW Lu       2023-01-14  3428  
a171784472954b Fred-LW Lu       2023-01-14  3429  		};
a171784472954b Fred-LW Lu       2023-01-14  3430  
5ec8716355c62e Copy Chou        2023-06-09  3431  		aie: aie@15310000 {
5ec8716355c62e Copy Chou        2023-06-09  3432  			compatible = "mediatek,mt8188-aie", "mediatek,aie-hw3.1";
5ec8716355c62e Copy Chou        2023-06-09  3433  			reg = <0 0x15310000 0 0x1000>;
5ec8716355c62e Copy Chou        2023-06-09  3434  			interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
5ec8716355c62e Copy Chou        2023-06-09  3435  			mediatek,larb = <&larb12>;
5ec8716355c62e Copy Chou        2023-06-09  3436  			iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
5ec8716355c62e Copy Chou        2023-06-09  3437  				 <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
5ec8716355c62e Copy Chou        2023-06-09  3438  				 <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
5ec8716355c62e Copy Chou        2023-06-09  3439  				 <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
5ec8716355c62e Copy Chou        2023-06-09  3440  			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
5ec8716355c62e Copy Chou        2023-06-09  3441  			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
5ec8716355c62e Copy Chou        2023-06-09  3442  				 <&ipesys CLK_IPE_FDVT>,
5ec8716355c62e Copy Chou        2023-06-09  3443  				 <&ipesys CLK_IPE_SMI_LARB12>,
5ec8716355c62e Copy Chou        2023-06-09  3444  				 <&ipesys CLK_IPESYS_TOP>;
5ec8716355c62e Copy Chou        2023-06-09  3445  			clock-names = "IMG_IPE",
5ec8716355c62e Copy Chou        2023-06-09  3446  				      "IPE_FDVT",
5ec8716355c62e Copy Chou        2023-06-09  3447  				      "IPE_SMI_LARB12",
5ec8716355c62e Copy Chou        2023-06-09  3448  				      "IPE_TOP";
5ec8716355c62e Copy Chou        2023-06-09  3449  			operating-points-v2 = <&opp_table_ipe>;
5ec8716355c62e Copy Chou        2023-06-09  3450  			dvfsrc-vcore-supply = <&vmm_proxy_label>;
5ec8716355c62e Copy Chou        2023-06-09  3451  #if 0
5ec8716355c62e Copy Chou        2023-06-09  3452  			interconnects =
5ec8716355c62e Copy Chou        2023-06-09  3453  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_FDVT_RDA_0)
5ec8716355c62e Copy Chou        2023-06-09  3454  				 &mmqos SLAVE_COMMON(1)>,
5ec8716355c62e Copy Chou        2023-06-09  3455  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_FDVT_RDB_0)
5ec8716355c62e Copy Chou        2023-06-09  3456  				 &mmqos SLAVE_COMMON(1)>,
5ec8716355c62e Copy Chou        2023-06-09  3457  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_FDVT_WRA_0)
5ec8716355c62e Copy Chou        2023-06-09  3458  				 &mmqos SLAVE_COMMON(1)>,
5ec8716355c62e Copy Chou        2023-06-09  3459  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_FDVT_WRB_0)
5ec8716355c62e Copy Chou        2023-06-09  3460  				 &mmqos SLAVE_COMMON(1)>;
5ec8716355c62e Copy Chou        2023-06-09  3461  			interconnect-names = "l12_fdvt_rda",
5ec8716355c62e Copy Chou        2023-06-09  3462  					     "l12_fdvt_rdb",
5ec8716355c62e Copy Chou        2023-06-09  3463  					     "l12_fdvt_wra",
5ec8716355c62e Copy Chou        2023-06-09  3464  					     "l12_fdvt_wrb";
5ec8716355c62e Copy Chou        2023-06-09  3465  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
