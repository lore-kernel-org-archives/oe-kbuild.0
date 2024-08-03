Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B63111AA
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 02:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722653713; cv=none; b=cdn3FkJqLl1aO9OzurAZmfAwojcoS+sPBlqQjM3Q5oSjCHgtH02nbZlCV9CBKC9YJphB07GDTlpC6xbgfuF3EHgUsLTVNLbIp6jV+k2D92j143JNWn3hkbIhv6JhvvzNDJ43lyUhJtuT4rXlpoacg9dv+DzNP8gWq1WUifdxSbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722653713; c=relaxed/simple;
	bh=lIKUUNxrRtYHiLBJfd05sodZiKyjV0XrHR58hHRzN/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TfikYa63FGDDQwx8ZFzDRWeHKcIk4zzZOaApkyz3MNI0kgdhUA0wn1Y9ctZwg2E5xvyBvRpMELIwQxWlSFogFfEm3mgPcrkCrbPw/4fKw1DaNTsFgI0q4r7j1cU6JcosraGOz/m8jgJW1VJjm6ZbTl358JKXS7SK5q+4FGib4zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1myCQbu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1myCQbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722653711; x=1754189711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lIKUUNxrRtYHiLBJfd05sodZiKyjV0XrHR58hHRzN/o=;
  b=Q1myCQbuMqhKqwBdZ6AgoQKGYd6Nu0qK5T3dsnmDdTA0rXREXvL+Aayc
   rkZqALv4PNiG077MtgGUpbK+0S+5MNLo7UfmVeTcNefzlBDU+q26+mUW0
   ZfUdSoY6Pp0MSB5F4oEvL87wt29zhDqOlSgmc1zIjvb/l/RH6vRhxwNL1
   1MeMDlOsMSQ5C9q8EP+223tkk9OAO3k5qw/v6pUuMXsXJ77NNUVpAlAlA
   LhqmKmE2ju9kHUZle6kkMSXKC9WjSgMfArfhsjvCzendHgNi+xEIMCtQi
   FV8B58EXr0iAzrZ+SHypyYcl+HSzZTKBHOgsca/l2zJ7oiegSG0wmsRSA
   w==;
X-CSE-ConnectionGUID: 6MOOWr0oSMa7zazAJuAiFg==
X-CSE-MsgGUID: YUtyom/8TjKyQBCW7eFAxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20567149"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="20567149"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 19:54:58 -0700
X-CSE-ConnectionGUID: fD3cULggQau5DH+dtY19tQ==
X-CSE-MsgGUID: NtOVCefdR6+TcBj3p/ITvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="60444379"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 19:54:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa4v0-000xsS-1p;
	Sat, 03 Aug 2024 02:54:54 +0000
Date: Sat, 3 Aug 2024 10:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 4/7]
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning
 (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges
 property, but no unit name
Message-ID: <202408031005.IpmbEzat-lkp@intel.com>
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

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   714b7640b7e49da5d8d3b9b3a36c0d776accbe6d
commit: fb83121c01a156634ed0cf816f5bbac12de2656c [4/7] CHROMIUM: arm64: dts: mt8188: Refactor panel node names and labels
:::::: branch date: 18 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-001-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031005.IpmbEzat-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031005.IpmbEzat-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408031005.IpmbEzat-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:270.42-274.5: Warning (unit_address_vs_reg): /reserved-memory/secure-cma-region: node has a reg or ranges property, but no unit name
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:14.37-28.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:23.40-26.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:29.37-42.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:37.40-40.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:270.42-274.5: Warning (unit_address_vs_reg): /reserved-memory/secure-cma-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:80.27-86.4: Warning (unit_address_format): /soc/i2c@11ec1000/vcm@0c: unit name should not have leading 0s
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (unit_address_vs_reg): /soc/t-phy@11e80000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:452.16-458.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:460.16-463.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (unit_address_vs_reg): /soc/hcp@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:30.37-39.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:34.40-37.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:41.37-50.5: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-ciri-camera-v4l2.dtsi:45.40-48.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@1/port/endpoint@2: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:331.19-349.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:103.9-106.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.36-233.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.42-238.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:240.38-244.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:246.44-250.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:252.46-256.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:258.46-262.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:264.44-268.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name

vim +331 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi

4d82972937d69c Johnson Wang 2023-01-10  325  
419700708d1b37 Johnson Wang 2023-02-16  326  &disp_dsi0 {
419700708d1b37 Johnson Wang 2023-02-16  327  	#address-cells = <1>;
419700708d1b37 Johnson Wang 2023-02-16  328  	#size-cells = <0>;
419700708d1b37 Johnson Wang 2023-02-16  329  	status = "okay";
419700708d1b37 Johnson Wang 2023-02-16  330  
fb83121c01a156 Fei Shao     2024-07-24 @331  	dsi_panel: panel {
419700708d1b37 Johnson Wang 2023-02-16  332  		compatible = "boe,tv110c9m-ll3";
419700708d1b37 Johnson Wang 2023-02-16  333  		reg = <0>;
419700708d1b37 Johnson Wang 2023-02-16  334  		enable-gpios = <&pio 25 0>;
5a892039af765a Fei Shao     2024-07-24  335  		avdd-supply = <&ppvar_mipi_disp_avdd>;
5a892039af765a Fei Shao     2024-07-24  336  		avee-supply = <&ppvar_mipi_disp_avee>;
419700708d1b37 Johnson Wang 2023-02-16  337  		pinctrl-names = "default";
0d093046fe4ae1 Fei Shao     2024-07-22  338  		pinctrl-0 = <&disp_default>;
419700708d1b37 Johnson Wang 2023-02-16  339  		pp1800-supply = <&mt6359_vm18_ldo_reg>;
b98a01409487b4 Fei Shao     2024-07-23  340  		backlight = <&backlight_lcd0>;
231fceca7d470a Fei Shao     2023-03-29  341  		rotation = <270>;
419700708d1b37 Johnson Wang 2023-02-16  342  		status = "okay";
419700708d1b37 Johnson Wang 2023-02-16  343  
419700708d1b37 Johnson Wang 2023-02-16  344  		port {
fb83121c01a156 Fei Shao     2024-07-24  345  			dsi_panel_in: endpoint {
419700708d1b37 Johnson Wang 2023-02-16  346  				remote-endpoint = <&dsi_out>;
419700708d1b37 Johnson Wang 2023-02-16  347  			};
419700708d1b37 Johnson Wang 2023-02-16  348  		};
419700708d1b37 Johnson Wang 2023-02-16  349  	};
419700708d1b37 Johnson Wang 2023-02-16  350  
419700708d1b37 Johnson Wang 2023-02-16  351  	ports {
419700708d1b37 Johnson Wang 2023-02-16  352  		port {
419700708d1b37 Johnson Wang 2023-02-16  353  			dsi_out: endpoint {
fb83121c01a156 Fei Shao     2024-07-24  354  				remote-endpoint = <&dsi_panel_in>;
419700708d1b37 Johnson Wang 2023-02-16  355  			};
419700708d1b37 Johnson Wang 2023-02-16  356  		};
419700708d1b37 Johnson Wang 2023-02-16  357  	};
419700708d1b37 Johnson Wang 2023-02-16  358  };
419700708d1b37 Johnson Wang 2023-02-16  359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
