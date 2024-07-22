Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EDC1BF54
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721677139; cv=none; b=rDYEn0+FQ1WX52VQMieMhy8GlFArageaXQg3tdRTqANELGFvOp3A8x7Ya/k60qvZJ5nZ8eYmOX7m/g/LE1UlMHLAhPRO2BM+shaqG3FQ+qfqcTUzgPRABQkT58Q8kgQq/VtwDxtDU/NdTg28YLWM5ys1CM4NWmA71CB8AVTKXIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721677139; c=relaxed/simple;
	bh=pZf4R9DKkks1dMtaGqTwm1JtibT+kP+KhVK3TSyH+ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jh0/JxZxDD7Zv/tUdh4fK6j27o6Xi7yPmMSMw9m98JIjHnYIG39AJgPcxvGEAransEhBXUzA4GOytroyoQGU3v/TVC448eB6tad6873L8elc3xlWvHeCuV3dmbaFaoRiF5cWOme0AViLKqU6Z6Fw7a5LQ1HXZK/hcIt2eGB1C8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkiw+QW3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkiw+QW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721677137; x=1753213137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZf4R9DKkks1dMtaGqTwm1JtibT+kP+KhVK3TSyH+ts=;
  b=dkiw+QW3KK9rDyOzMMjy69yYErnDEp7Dm8ms80FdtzxchL/d7LVWLW3Y
   1mkYtaqevaaJNC38oFm6HdnY0Du79RN0LMlvYNjRvzmk35/w+Y+8NZvFg
   C0Amcv8glEjyAZe+BKOWJf9zDqHJ8UazevKoQ3pSyKkR39mClG8Rch7q5
   68QZK9mzh0pV9tmgG+YXC5epytlV23gDRHwBSoTHhR7hN9Rtkc+DiKEgl
   F5lEqwka75NRIKGoAR8cEa8hGLvaUm+9AKH5xg0dwU9Zm852um2m0jX6K
   lIToEVfAIgtx5RdWXahAbhpRl0n/P26MR6zXMGH952Etu59q2JfAMu1Al
   A==;
X-CSE-ConnectionGUID: 6z8HUfk1QeqHZdrN1m/Zog==
X-CSE-MsgGUID: ngKqogidRs6f7zUYOmMbFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19080053"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="19080053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 12:38:56 -0700
X-CSE-ConnectionGUID: Eq1mGFvBT0enQpjF7UNj0g==
X-CSE-MsgGUID: eJTBNbEjR3ONTa9AgS2EJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="52220795"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2024 12:38:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVys0-000lLa-2B;
	Mon, 22 Jul 2024 19:38:52 +0000
Date: Tue, 23 Jul 2024 03:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 11/13]
 arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5:
 Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node
 has a unit name, but no reg or ranges property
Message-ID: <202407230356.xm3C73YK-lkp@intel.com>
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
head:   5fa44db817ded9fe838048d7cc2d6b3743415d05
commit: 15f5ac81d614a78d9d297026b1a308e032999ce8 [11/13] CHROMIUM: arm64: dts: mt8188: Use dash in node names (camera)
:::::: branch date: 3 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240723/202407230356.xm3C73YK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230356.xm3C73YK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407230356.xm3C73YK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2012.24-2014.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/data3: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2020.26-2022.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data0: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2024.26-2026.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2032.35-2034.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse0: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2036.35-2038.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2040.35-2042.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse2: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2044.27-2047.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/volt-bin: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:402.16-408.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:410.16-413.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2333.14-2369.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:111.9-114.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:178.36-182.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:184.42-187.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:189.38-193.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:195.44-199.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:201.46-205.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:207.46-211.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:213.44-217.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2012.24-2014.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/data3: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2020.26-2022.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data0: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2024.26-2026.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/csi-data1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2032.35-2034.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse0: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2036.35-2038.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2040.35-2042.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/gpu-efuse2: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2044.27-2047.6: Warning (unit_address_vs_reg): /soc/efuse@11f20000/volt-bin: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:402.16-408.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:410.16-413.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2333.14-2369.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:14.37-28.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:23.40-26.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:29.37-42.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:37.40-40.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:111.9-114.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:178.36-182.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:184.42-187.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:189.38-193.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:195.44-199.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:201.46-205.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:207.46-211.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:213.44-217.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name

vim +30 arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi

cd578ad28ca35d Zhi Mao  2024-04-24  28  
cd578ad28ca35d Zhi Mao  2024-04-24  29  &seninf_top {
15f5ac81d614a7 Fei Shao 2024-07-01 @30  		seninf_csi_port_0: csi-receiver@0 {
cd578ad28ca35d Zhi Mao  2024-04-24  31  			compatible = "mediatek,seninf";
cd578ad28ca35d Zhi Mao  2024-04-24  32  			csi-port = "0";
cd578ad28ca35d Zhi Mao  2024-04-24  33  			port {
cd578ad28ca35d Zhi Mao  2024-04-24 @34  				seninf_csi_port_0_in_2: endpoint@2 {
cd578ad28ca35d Zhi Mao  2024-04-24  35  					data-lanes = <1 2 3 4>;
cd578ad28ca35d Zhi Mao  2024-04-24  36  					remote-endpoint = <&main_sensor_out_2>;
cd578ad28ca35d Zhi Mao  2024-04-24  37  				};
cd578ad28ca35d Zhi Mao  2024-04-24  38  			};
cd578ad28ca35d Zhi Mao  2024-04-24  39  		};
cd578ad28ca35d Zhi Mao  2024-04-24  40  
15f5ac81d614a7 Fei Shao 2024-07-01  41  		seninf_csi_port_1: csi-receiver@1 {
cd578ad28ca35d Zhi Mao  2024-04-24  42  			compatible = "mediatek,seninf";
cd578ad28ca35d Zhi Mao  2024-04-24  43  			csi-port = "1";
cd578ad28ca35d Zhi Mao  2024-04-24  44  			port {
cd578ad28ca35d Zhi Mao  2024-04-24  45  				seninf_csi_port_1_in_2: endpoint@2 {
cd578ad28ca35d Zhi Mao  2024-04-24  46  					data-lanes = <1 4>;
cd578ad28ca35d Zhi Mao  2024-04-24  47  					remote-endpoint = <&sub_sensor_out_2>;
cd578ad28ca35d Zhi Mao  2024-04-24  48  				};
cd578ad28ca35d Zhi Mao  2024-04-24  49  			};
cd578ad28ca35d Zhi Mao  2024-04-24  50  		};
cd578ad28ca35d Zhi Mao  2024-04-24  51  };
cd578ad28ca35d Zhi Mao  2024-04-24  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
