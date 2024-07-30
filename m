Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C3818C915
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722372306; cv=none; b=f2YEYNEt4Rs4Zz368ZnlKfPK9JDGwT29CL3nGyLC66kpvZhSmRpOjjA0efRBv4xoljOxGDN3F5bjZz9qYqA5/fQTYkI6C7El4jnpzT95a8I0o/qWgCICtXcZMrjSyBFzQsGsQrHXhNVCVJZLQ1KKzqyrMa3FWB68VIhpRLG6/iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722372306; c=relaxed/simple;
	bh=UEGeD1vlAMpFWcdASmm4yvOAojqZqNDbjywsYIZo4O8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9aHbgLmOm3HELqS2KPADd9RiukFz6Ee29RKD59lM3XIyPFSdpM45taXC7723ra8AHlDguPTIvyRB+GHE7oxub6oWHo2kXwo4ZfJ08/BMJNC4ugPAVRCNZkqsjbd8TS94h3be4zOJpYzdyI7F503C64aLSiJwwVKxdoFF3dBHCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bviBKnOJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bviBKnOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722372303; x=1753908303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UEGeD1vlAMpFWcdASmm4yvOAojqZqNDbjywsYIZo4O8=;
  b=bviBKnOJw3d4sctDClg6vUtlLJ6FOWIw8orhjUl0muNnhVPF7jdDbQdF
   S2Zj8Ga10cOs0SZkwtzjfQFBd1CVkyVxu+94jR9r0KZLz+TH7bxq5IhMX
   mQ+hyQjM8Mt/3lCgwcZC+G/PAMnEHmWKqVfOKr3rcKav1fIEBgYn/xjlg
   xMqJyI0Dc8CY6W3ynJTOdOHRr/eRvWGr+N1narYOX/oooaqzSUQwPp2X8
   idIvXy3qioDMDTePJeDluDAYaStMCo7i+CDp6gE56eetjjWcg3T775Gjk
   W7fF+5jnjPaBVBao3Drn5wmYqhy36Nz7IPwrQW6H4pmlUf6mtZ3pCMzbJ
   g==;
X-CSE-ConnectionGUID: Y6YasBf3SRWAgxAuC5TfuA==
X-CSE-MsgGUID: sIx+QkunTVSzDADAHn7ovw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31369828"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="31369828"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 13:45:00 -0700
X-CSE-ConnectionGUID: Kvf0u3D/QfGC+lzVb4SzyA==
X-CSE-MsgGUID: r8GOQXReRf25od72DTxdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="91972089"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jul 2024 13:44:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYtiJ-000tKW-29;
	Tue, 30 Jul 2024 20:44:55 +0000
Date: Wed, 31 Jul 2024 04:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.12-armsoc/dts64 24/24]
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning
 (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or
 ranges property
Message-ID: <202407310417.zbRnKp4a-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Dragan Simic <dsimic@manjaro.org>
CC: Heiko Stuebner <heiko@sntech.de>

Hi Dragan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.12-armsoc/dts64
head:   296602b8e5f715d6a0ccdcd37d57170c2c81d5e4
commit: 296602b8e5f715d6a0ccdcd37d57170c2c81d5e4 [24/24] arm64: dts: rockchip: Move RK3399 OPPs to dtsi files for SoC variants
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240731/202407310417.zbRnKp4a-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310417.zbRnKp4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310417.zbRnKp4a-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2098.21-2100.6: Warning (avoid_unnecessary_addr_size): /dsi@ff960000/ports/port@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2098.21-2100.6: Warning (graph_child_address): /dsi@ff960000/ports/port@1: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:581.31-583.7: Warning (unit_address_vs_reg): /i2c@ff3d0000/typec-portc@22/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:906.7-913.4: Warning (graph_child_address): /usb@fe800000/usb@fe800000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:575.9-585.5: Warning (graph_child_address): /i2c@ff3d0000/typec-portc@22/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +530 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi

296602b8e5f715 Dragan Simic 2024-07-21   13  
296602b8e5f715 Dragan Simic 2024-07-21   14  / {
296602b8e5f715 Dragan Simic 2024-07-21   15  	compatible = "rockchip,rk3399";
296602b8e5f715 Dragan Simic 2024-07-21   16  
296602b8e5f715 Dragan Simic 2024-07-21   17  	interrupt-parent = <&gic>;
296602b8e5f715 Dragan Simic 2024-07-21   18  	#address-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   19  	#size-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   20  
296602b8e5f715 Dragan Simic 2024-07-21   21  	aliases {
296602b8e5f715 Dragan Simic 2024-07-21   22  		gpio0 = &gpio0;
296602b8e5f715 Dragan Simic 2024-07-21   23  		gpio1 = &gpio1;
296602b8e5f715 Dragan Simic 2024-07-21   24  		gpio2 = &gpio2;
296602b8e5f715 Dragan Simic 2024-07-21   25  		gpio3 = &gpio3;
296602b8e5f715 Dragan Simic 2024-07-21   26  		gpio4 = &gpio4;
296602b8e5f715 Dragan Simic 2024-07-21   27  		i2c0 = &i2c0;
296602b8e5f715 Dragan Simic 2024-07-21   28  		i2c1 = &i2c1;
296602b8e5f715 Dragan Simic 2024-07-21   29  		i2c2 = &i2c2;
296602b8e5f715 Dragan Simic 2024-07-21   30  		i2c3 = &i2c3;
296602b8e5f715 Dragan Simic 2024-07-21   31  		i2c4 = &i2c4;
296602b8e5f715 Dragan Simic 2024-07-21   32  		i2c5 = &i2c5;
296602b8e5f715 Dragan Simic 2024-07-21   33  		i2c6 = &i2c6;
296602b8e5f715 Dragan Simic 2024-07-21   34  		i2c7 = &i2c7;
296602b8e5f715 Dragan Simic 2024-07-21   35  		i2c8 = &i2c8;
296602b8e5f715 Dragan Simic 2024-07-21   36  		serial0 = &uart0;
296602b8e5f715 Dragan Simic 2024-07-21   37  		serial1 = &uart1;
296602b8e5f715 Dragan Simic 2024-07-21   38  		serial2 = &uart2;
296602b8e5f715 Dragan Simic 2024-07-21   39  		serial3 = &uart3;
296602b8e5f715 Dragan Simic 2024-07-21   40  		serial4 = &uart4;
296602b8e5f715 Dragan Simic 2024-07-21   41  		spi0 = &spi0;
296602b8e5f715 Dragan Simic 2024-07-21   42  		spi1 = &spi1;
296602b8e5f715 Dragan Simic 2024-07-21   43  		spi2 = &spi2;
296602b8e5f715 Dragan Simic 2024-07-21   44  		spi3 = &spi3;
296602b8e5f715 Dragan Simic 2024-07-21   45  		spi4 = &spi4;
296602b8e5f715 Dragan Simic 2024-07-21   46  		spi5 = &spi5;
296602b8e5f715 Dragan Simic 2024-07-21   47  	};
296602b8e5f715 Dragan Simic 2024-07-21   48  
296602b8e5f715 Dragan Simic 2024-07-21   49  	cpus {
296602b8e5f715 Dragan Simic 2024-07-21   50  		#address-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21   51  		#size-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21   52  
296602b8e5f715 Dragan Simic 2024-07-21   53  		cpu-map {
296602b8e5f715 Dragan Simic 2024-07-21   54  			cluster0 {	/* Cortex-A53 */
296602b8e5f715 Dragan Simic 2024-07-21   55  				core0 {
296602b8e5f715 Dragan Simic 2024-07-21   56  					cpu = <&cpu_l0>;
296602b8e5f715 Dragan Simic 2024-07-21   57  				};
296602b8e5f715 Dragan Simic 2024-07-21   58  				core1 {
296602b8e5f715 Dragan Simic 2024-07-21   59  					cpu = <&cpu_l1>;
296602b8e5f715 Dragan Simic 2024-07-21   60  				};
296602b8e5f715 Dragan Simic 2024-07-21   61  				core2 {
296602b8e5f715 Dragan Simic 2024-07-21   62  					cpu = <&cpu_l2>;
296602b8e5f715 Dragan Simic 2024-07-21   63  				};
296602b8e5f715 Dragan Simic 2024-07-21   64  				core3 {
296602b8e5f715 Dragan Simic 2024-07-21   65  					cpu = <&cpu_l3>;
296602b8e5f715 Dragan Simic 2024-07-21   66  				};
296602b8e5f715 Dragan Simic 2024-07-21   67  			};
296602b8e5f715 Dragan Simic 2024-07-21   68  
296602b8e5f715 Dragan Simic 2024-07-21   69  			cluster1 {	/* Cortex-A72 */
296602b8e5f715 Dragan Simic 2024-07-21   70  				core0 {
296602b8e5f715 Dragan Simic 2024-07-21   71  					cpu = <&cpu_b0>;
296602b8e5f715 Dragan Simic 2024-07-21   72  				};
296602b8e5f715 Dragan Simic 2024-07-21   73  				core1 {
296602b8e5f715 Dragan Simic 2024-07-21   74  					cpu = <&cpu_b1>;
296602b8e5f715 Dragan Simic 2024-07-21   75  				};
296602b8e5f715 Dragan Simic 2024-07-21   76  			};
296602b8e5f715 Dragan Simic 2024-07-21   77  		};
296602b8e5f715 Dragan Simic 2024-07-21   78  
296602b8e5f715 Dragan Simic 2024-07-21   79  		cpu_l0: cpu@0 {
296602b8e5f715 Dragan Simic 2024-07-21   80  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21   81  			compatible = "arm,cortex-a53";
296602b8e5f715 Dragan Simic 2024-07-21   82  			reg = <0x0 0x0>;
296602b8e5f715 Dragan Simic 2024-07-21   83  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21   84  			capacity-dmips-mhz = <485>;
296602b8e5f715 Dragan Simic 2024-07-21   85  			clocks = <&cru ARMCLKL>;
296602b8e5f715 Dragan Simic 2024-07-21   86  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21   87  			dynamic-power-coefficient = <100>;
296602b8e5f715 Dragan Simic 2024-07-21   88  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21   89  			i-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   90  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   91  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21   92  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21   93  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21   94  			d-cache-sets = <128>;
296602b8e5f715 Dragan Simic 2024-07-21   95  			next-level-cache = <&l2_cache_l>;
296602b8e5f715 Dragan Simic 2024-07-21   96  		};
296602b8e5f715 Dragan Simic 2024-07-21   97  
296602b8e5f715 Dragan Simic 2024-07-21   98  		cpu_l1: cpu@1 {
296602b8e5f715 Dragan Simic 2024-07-21   99  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21  100  			compatible = "arm,cortex-a53";
296602b8e5f715 Dragan Simic 2024-07-21  101  			reg = <0x0 0x1>;
296602b8e5f715 Dragan Simic 2024-07-21  102  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21  103  			capacity-dmips-mhz = <485>;
296602b8e5f715 Dragan Simic 2024-07-21  104  			clocks = <&cru ARMCLKL>;
296602b8e5f715 Dragan Simic 2024-07-21  105  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21  106  			dynamic-power-coefficient = <100>;
296602b8e5f715 Dragan Simic 2024-07-21  107  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21  108  			i-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21  109  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  110  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21  111  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21  112  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  113  			d-cache-sets = <128>;
296602b8e5f715 Dragan Simic 2024-07-21  114  			next-level-cache = <&l2_cache_l>;
296602b8e5f715 Dragan Simic 2024-07-21  115  		};
296602b8e5f715 Dragan Simic 2024-07-21  116  
296602b8e5f715 Dragan Simic 2024-07-21  117  		cpu_l2: cpu@2 {
296602b8e5f715 Dragan Simic 2024-07-21  118  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21  119  			compatible = "arm,cortex-a53";
296602b8e5f715 Dragan Simic 2024-07-21  120  			reg = <0x0 0x2>;
296602b8e5f715 Dragan Simic 2024-07-21  121  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21  122  			capacity-dmips-mhz = <485>;
296602b8e5f715 Dragan Simic 2024-07-21  123  			clocks = <&cru ARMCLKL>;
296602b8e5f715 Dragan Simic 2024-07-21  124  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21  125  			dynamic-power-coefficient = <100>;
296602b8e5f715 Dragan Simic 2024-07-21  126  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21  127  			i-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21  128  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  129  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21  130  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21  131  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  132  			d-cache-sets = <128>;
296602b8e5f715 Dragan Simic 2024-07-21  133  			next-level-cache = <&l2_cache_l>;
296602b8e5f715 Dragan Simic 2024-07-21  134  		};
296602b8e5f715 Dragan Simic 2024-07-21  135  
296602b8e5f715 Dragan Simic 2024-07-21  136  		cpu_l3: cpu@3 {
296602b8e5f715 Dragan Simic 2024-07-21  137  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21  138  			compatible = "arm,cortex-a53";
296602b8e5f715 Dragan Simic 2024-07-21  139  			reg = <0x0 0x3>;
296602b8e5f715 Dragan Simic 2024-07-21  140  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21  141  			capacity-dmips-mhz = <485>;
296602b8e5f715 Dragan Simic 2024-07-21  142  			clocks = <&cru ARMCLKL>;
296602b8e5f715 Dragan Simic 2024-07-21  143  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21  144  			dynamic-power-coefficient = <100>;
296602b8e5f715 Dragan Simic 2024-07-21  145  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21  146  			i-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21  147  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  148  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21  149  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21  150  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  151  			d-cache-sets = <128>;
296602b8e5f715 Dragan Simic 2024-07-21  152  			next-level-cache = <&l2_cache_l>;
296602b8e5f715 Dragan Simic 2024-07-21  153  		};
296602b8e5f715 Dragan Simic 2024-07-21  154  
296602b8e5f715 Dragan Simic 2024-07-21  155  		cpu_b0: cpu@100 {
296602b8e5f715 Dragan Simic 2024-07-21  156  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21  157  			compatible = "arm,cortex-a72";
296602b8e5f715 Dragan Simic 2024-07-21  158  			reg = <0x0 0x100>;
296602b8e5f715 Dragan Simic 2024-07-21  159  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21  160  			capacity-dmips-mhz = <1024>;
296602b8e5f715 Dragan Simic 2024-07-21  161  			clocks = <&cru ARMCLKB>;
296602b8e5f715 Dragan Simic 2024-07-21  162  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21  163  			dynamic-power-coefficient = <436>;
296602b8e5f715 Dragan Simic 2024-07-21  164  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21  165  			i-cache-size = <0xC000>;
296602b8e5f715 Dragan Simic 2024-07-21  166  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  167  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21  168  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21  169  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  170  			d-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21  171  			next-level-cache = <&l2_cache_b>;
296602b8e5f715 Dragan Simic 2024-07-21  172  
296602b8e5f715 Dragan Simic 2024-07-21  173  			thermal-idle {
296602b8e5f715 Dragan Simic 2024-07-21  174  				#cooling-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  175  				duration-us = <10000>;
296602b8e5f715 Dragan Simic 2024-07-21  176  				exit-latency-us = <500>;
296602b8e5f715 Dragan Simic 2024-07-21  177  			};
296602b8e5f715 Dragan Simic 2024-07-21  178  		};
296602b8e5f715 Dragan Simic 2024-07-21  179  
296602b8e5f715 Dragan Simic 2024-07-21  180  		cpu_b1: cpu@101 {
296602b8e5f715 Dragan Simic 2024-07-21  181  			device_type = "cpu";
296602b8e5f715 Dragan Simic 2024-07-21  182  			compatible = "arm,cortex-a72";
296602b8e5f715 Dragan Simic 2024-07-21  183  			reg = <0x0 0x101>;
296602b8e5f715 Dragan Simic 2024-07-21  184  			enable-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21  185  			capacity-dmips-mhz = <1024>;
296602b8e5f715 Dragan Simic 2024-07-21  186  			clocks = <&cru ARMCLKB>;
296602b8e5f715 Dragan Simic 2024-07-21  187  			#cooling-cells = <2>; /* min followed by max */
296602b8e5f715 Dragan Simic 2024-07-21  188  			dynamic-power-coefficient = <436>;
296602b8e5f715 Dragan Simic 2024-07-21  189  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
296602b8e5f715 Dragan Simic 2024-07-21  190  			i-cache-size = <0xC000>;
296602b8e5f715 Dragan Simic 2024-07-21  191  			i-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  192  			i-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21  193  			d-cache-size = <0x8000>;
296602b8e5f715 Dragan Simic 2024-07-21  194  			d-cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  195  			d-cache-sets = <256>;
296602b8e5f715 Dragan Simic 2024-07-21  196  			next-level-cache = <&l2_cache_b>;
296602b8e5f715 Dragan Simic 2024-07-21  197  
296602b8e5f715 Dragan Simic 2024-07-21  198  			thermal-idle {
296602b8e5f715 Dragan Simic 2024-07-21  199  				#cooling-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  200  				duration-us = <10000>;
296602b8e5f715 Dragan Simic 2024-07-21  201  				exit-latency-us = <500>;
296602b8e5f715 Dragan Simic 2024-07-21  202  			};
296602b8e5f715 Dragan Simic 2024-07-21  203  		};
296602b8e5f715 Dragan Simic 2024-07-21  204  
296602b8e5f715 Dragan Simic 2024-07-21  205  		l2_cache_l: l2-cache-cluster0 {
296602b8e5f715 Dragan Simic 2024-07-21  206  			compatible = "cache";
296602b8e5f715 Dragan Simic 2024-07-21  207  			cache-level = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  208  			cache-unified;
296602b8e5f715 Dragan Simic 2024-07-21  209  			cache-size = <0x80000>;
296602b8e5f715 Dragan Simic 2024-07-21  210  			cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  211  			cache-sets = <512>;
296602b8e5f715 Dragan Simic 2024-07-21  212  		};
296602b8e5f715 Dragan Simic 2024-07-21  213  
296602b8e5f715 Dragan Simic 2024-07-21  214  		l2_cache_b: l2-cache-cluster1 {
296602b8e5f715 Dragan Simic 2024-07-21  215  			compatible = "cache";
296602b8e5f715 Dragan Simic 2024-07-21  216  			cache-level = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  217  			cache-unified;
296602b8e5f715 Dragan Simic 2024-07-21  218  			cache-size = <0x100000>;
296602b8e5f715 Dragan Simic 2024-07-21  219  			cache-line-size = <64>;
296602b8e5f715 Dragan Simic 2024-07-21  220  			cache-sets = <1024>;
296602b8e5f715 Dragan Simic 2024-07-21  221  		};
296602b8e5f715 Dragan Simic 2024-07-21  222  
296602b8e5f715 Dragan Simic 2024-07-21  223  		idle-states {
296602b8e5f715 Dragan Simic 2024-07-21  224  			entry-method = "psci";
296602b8e5f715 Dragan Simic 2024-07-21  225  
296602b8e5f715 Dragan Simic 2024-07-21  226  			CPU_SLEEP: cpu-sleep {
296602b8e5f715 Dragan Simic 2024-07-21  227  				compatible = "arm,idle-state";
296602b8e5f715 Dragan Simic 2024-07-21  228  				local-timer-stop;
296602b8e5f715 Dragan Simic 2024-07-21  229  				arm,psci-suspend-param = <0x0010000>;
296602b8e5f715 Dragan Simic 2024-07-21  230  				entry-latency-us = <120>;
296602b8e5f715 Dragan Simic 2024-07-21  231  				exit-latency-us = <250>;
296602b8e5f715 Dragan Simic 2024-07-21  232  				min-residency-us = <900>;
296602b8e5f715 Dragan Simic 2024-07-21  233  			};
296602b8e5f715 Dragan Simic 2024-07-21  234  
296602b8e5f715 Dragan Simic 2024-07-21  235  			CLUSTER_SLEEP: cluster-sleep {
296602b8e5f715 Dragan Simic 2024-07-21  236  				compatible = "arm,idle-state";
296602b8e5f715 Dragan Simic 2024-07-21  237  				local-timer-stop;
296602b8e5f715 Dragan Simic 2024-07-21  238  				arm,psci-suspend-param = <0x1010000>;
296602b8e5f715 Dragan Simic 2024-07-21  239  				entry-latency-us = <400>;
296602b8e5f715 Dragan Simic 2024-07-21  240  				exit-latency-us = <500>;
296602b8e5f715 Dragan Simic 2024-07-21  241  				min-residency-us = <2000>;
296602b8e5f715 Dragan Simic 2024-07-21  242  			};
296602b8e5f715 Dragan Simic 2024-07-21  243  		};
296602b8e5f715 Dragan Simic 2024-07-21  244  	};
296602b8e5f715 Dragan Simic 2024-07-21  245  
296602b8e5f715 Dragan Simic 2024-07-21  246  	display-subsystem {
296602b8e5f715 Dragan Simic 2024-07-21  247  		compatible = "rockchip,display-subsystem";
296602b8e5f715 Dragan Simic 2024-07-21  248  		ports = <&vopl_out>, <&vopb_out>;
296602b8e5f715 Dragan Simic 2024-07-21  249  	};
296602b8e5f715 Dragan Simic 2024-07-21  250  
296602b8e5f715 Dragan Simic 2024-07-21  251  	dmc: memory-controller {
296602b8e5f715 Dragan Simic 2024-07-21  252  		compatible = "rockchip,rk3399-dmc";
296602b8e5f715 Dragan Simic 2024-07-21  253  		rockchip,pmu = <&pmugrf>;
296602b8e5f715 Dragan Simic 2024-07-21  254  		devfreq-events = <&dfi>;
296602b8e5f715 Dragan Simic 2024-07-21  255  		clocks = <&cru SCLK_DDRC>;
296602b8e5f715 Dragan Simic 2024-07-21  256  		clock-names = "dmc_clk";
296602b8e5f715 Dragan Simic 2024-07-21  257  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  258  	};
296602b8e5f715 Dragan Simic 2024-07-21  259  
296602b8e5f715 Dragan Simic 2024-07-21  260  	pmu_a53 {
296602b8e5f715 Dragan Simic 2024-07-21  261  		compatible = "arm,cortex-a53-pmu";
296602b8e5f715 Dragan Simic 2024-07-21  262  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;
296602b8e5f715 Dragan Simic 2024-07-21  263  	};
296602b8e5f715 Dragan Simic 2024-07-21  264  
296602b8e5f715 Dragan Simic 2024-07-21  265  	pmu_a72 {
296602b8e5f715 Dragan Simic 2024-07-21  266  		compatible = "arm,cortex-a72-pmu";
296602b8e5f715 Dragan Simic 2024-07-21  267  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster1>;
296602b8e5f715 Dragan Simic 2024-07-21  268  	};
296602b8e5f715 Dragan Simic 2024-07-21  269  
296602b8e5f715 Dragan Simic 2024-07-21  270  	psci {
296602b8e5f715 Dragan Simic 2024-07-21  271  		compatible = "arm,psci-1.0";
296602b8e5f715 Dragan Simic 2024-07-21  272  		method = "smc";
296602b8e5f715 Dragan Simic 2024-07-21  273  	};
296602b8e5f715 Dragan Simic 2024-07-21  274  
296602b8e5f715 Dragan Simic 2024-07-21  275  	timer {
296602b8e5f715 Dragan Simic 2024-07-21  276  		compatible = "arm,armv8-timer";
296602b8e5f715 Dragan Simic 2024-07-21  277  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
296602b8e5f715 Dragan Simic 2024-07-21  278  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
296602b8e5f715 Dragan Simic 2024-07-21  279  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
296602b8e5f715 Dragan Simic 2024-07-21  280  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
296602b8e5f715 Dragan Simic 2024-07-21  281  		arm,no-tick-in-suspend;
296602b8e5f715 Dragan Simic 2024-07-21  282  	};
296602b8e5f715 Dragan Simic 2024-07-21  283  
296602b8e5f715 Dragan Simic 2024-07-21  284  	xin24m: xin24m {
296602b8e5f715 Dragan Simic 2024-07-21  285  		compatible = "fixed-clock";
296602b8e5f715 Dragan Simic 2024-07-21  286  		clock-frequency = <24000000>;
296602b8e5f715 Dragan Simic 2024-07-21  287  		clock-output-names = "xin24m";
296602b8e5f715 Dragan Simic 2024-07-21  288  		#clock-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  289  	};
296602b8e5f715 Dragan Simic 2024-07-21  290  
296602b8e5f715 Dragan Simic 2024-07-21  291  	pcie0: pcie@f8000000 {
296602b8e5f715 Dragan Simic 2024-07-21  292  		compatible = "rockchip,rk3399-pcie";
296602b8e5f715 Dragan Simic 2024-07-21  293  		reg = <0x0 0xf8000000 0x0 0x2000000>,
296602b8e5f715 Dragan Simic 2024-07-21  294  		      <0x0 0xfd000000 0x0 0x1000000>;
296602b8e5f715 Dragan Simic 2024-07-21  295  		reg-names = "axi-base", "apb-base";
296602b8e5f715 Dragan Simic 2024-07-21  296  		device_type = "pci";
296602b8e5f715 Dragan Simic 2024-07-21  297  		#address-cells = <3>;
296602b8e5f715 Dragan Simic 2024-07-21  298  		#size-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  299  		#interrupt-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  300  		aspm-no-l0s;
296602b8e5f715 Dragan Simic 2024-07-21  301  		bus-range = <0x0 0x1f>;
296602b8e5f715 Dragan Simic 2024-07-21  302  		clocks = <&cru ACLK_PCIE>, <&cru ACLK_PERF_PCIE>,
296602b8e5f715 Dragan Simic 2024-07-21  303  			 <&cru PCLK_PCIE>, <&cru SCLK_PCIE_PM>;
296602b8e5f715 Dragan Simic 2024-07-21  304  		clock-names = "aclk", "aclk-perf",
296602b8e5f715 Dragan Simic 2024-07-21  305  			      "hclk", "pm";
296602b8e5f715 Dragan Simic 2024-07-21  306  		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21  307  			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH 0>,
296602b8e5f715 Dragan Simic 2024-07-21  308  			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  309  		interrupt-names = "sys", "legacy", "client";
296602b8e5f715 Dragan Simic 2024-07-21  310  		interrupt-map-mask = <0 0 0 7>;
296602b8e5f715 Dragan Simic 2024-07-21  311  		interrupt-map = <0 0 0 1 &pcie0_intc 0>,
296602b8e5f715 Dragan Simic 2024-07-21  312  				<0 0 0 2 &pcie0_intc 1>,
296602b8e5f715 Dragan Simic 2024-07-21  313  				<0 0 0 3 &pcie0_intc 2>,
296602b8e5f715 Dragan Simic 2024-07-21  314  				<0 0 0 4 &pcie0_intc 3>;
296602b8e5f715 Dragan Simic 2024-07-21  315  		max-link-speed = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  316  		msi-map = <0x0 &its 0x0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  317  		phys = <&pcie_phy 0>, <&pcie_phy 1>,
296602b8e5f715 Dragan Simic 2024-07-21  318  		       <&pcie_phy 2>, <&pcie_phy 3>;
296602b8e5f715 Dragan Simic 2024-07-21  319  		phy-names = "pcie-phy-0", "pcie-phy-1",
296602b8e5f715 Dragan Simic 2024-07-21  320  			    "pcie-phy-2", "pcie-phy-3";
296602b8e5f715 Dragan Simic 2024-07-21  321  		ranges = <0x82000000 0x0 0xfa000000 0x0 0xfa000000 0x0 0x1e00000>,
296602b8e5f715 Dragan Simic 2024-07-21  322  			 <0x81000000 0x0 0xfbe00000 0x0 0xfbe00000 0x0 0x100000>;
296602b8e5f715 Dragan Simic 2024-07-21  323  		resets = <&cru SRST_PCIE_CORE>, <&cru SRST_PCIE_MGMT>,
296602b8e5f715 Dragan Simic 2024-07-21  324  			 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>,
296602b8e5f715 Dragan Simic 2024-07-21  325  			 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>,
296602b8e5f715 Dragan Simic 2024-07-21  326  			 <&cru SRST_A_PCIE>;
296602b8e5f715 Dragan Simic 2024-07-21  327  		reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
296602b8e5f715 Dragan Simic 2024-07-21  328  			      "pm", "pclk", "aclk";
296602b8e5f715 Dragan Simic 2024-07-21  329  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  330  
296602b8e5f715 Dragan Simic 2024-07-21  331  		pcie0_intc: interrupt-controller {
296602b8e5f715 Dragan Simic 2024-07-21  332  			interrupt-controller;
296602b8e5f715 Dragan Simic 2024-07-21  333  			#address-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  334  			#interrupt-cells = <1>;
296602b8e5f715 Dragan Simic 2024-07-21  335  		};
296602b8e5f715 Dragan Simic 2024-07-21  336  	};
296602b8e5f715 Dragan Simic 2024-07-21  337  
296602b8e5f715 Dragan Simic 2024-07-21  338  	pcie0_ep: pcie-ep@f8000000 {
296602b8e5f715 Dragan Simic 2024-07-21  339  		compatible = "rockchip,rk3399-pcie-ep";
296602b8e5f715 Dragan Simic 2024-07-21  340  		reg = <0x0 0xfd000000 0x0 0x1000000>,
296602b8e5f715 Dragan Simic 2024-07-21  341  		      <0x0 0xfa000000 0x0 0x2000000>;
296602b8e5f715 Dragan Simic 2024-07-21  342  		reg-names = "apb-base", "mem-base";
296602b8e5f715 Dragan Simic 2024-07-21  343  		clocks = <&cru ACLK_PCIE>, <&cru ACLK_PERF_PCIE>,
296602b8e5f715 Dragan Simic 2024-07-21  344  			 <&cru PCLK_PCIE>, <&cru SCLK_PCIE_PM>;
296602b8e5f715 Dragan Simic 2024-07-21  345  		clock-names = "aclk", "aclk-perf",
296602b8e5f715 Dragan Simic 2024-07-21  346  			      "hclk", "pm";
296602b8e5f715 Dragan Simic 2024-07-21  347  		max-functions = /bits/ 8 <8>;
296602b8e5f715 Dragan Simic 2024-07-21  348  		num-lanes = <4>;
296602b8e5f715 Dragan Simic 2024-07-21  349  		resets = <&cru SRST_PCIE_CORE>, <&cru SRST_PCIE_MGMT>,
296602b8e5f715 Dragan Simic 2024-07-21  350  			 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>,
296602b8e5f715 Dragan Simic 2024-07-21  351  			 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>,
296602b8e5f715 Dragan Simic 2024-07-21  352  			 <&cru SRST_A_PCIE>;
296602b8e5f715 Dragan Simic 2024-07-21  353  		reset-names = "core", "mgmt", "mgmt-sticky", "pipe",
296602b8e5f715 Dragan Simic 2024-07-21  354  			      "pm", "pclk", "aclk";
296602b8e5f715 Dragan Simic 2024-07-21  355  		phys = <&pcie_phy 0>, <&pcie_phy 1>,
296602b8e5f715 Dragan Simic 2024-07-21  356  		       <&pcie_phy 2>, <&pcie_phy 3>;
296602b8e5f715 Dragan Simic 2024-07-21  357  		phy-names = "pcie-phy-0", "pcie-phy-1",
296602b8e5f715 Dragan Simic 2024-07-21  358  			    "pcie-phy-2", "pcie-phy-3";
296602b8e5f715 Dragan Simic 2024-07-21  359  		rockchip,max-outbound-regions = <32>;
296602b8e5f715 Dragan Simic 2024-07-21  360  		pinctrl-names = "default";
296602b8e5f715 Dragan Simic 2024-07-21  361  		pinctrl-0 = <&pcie_clkreqnb_cpm>;
296602b8e5f715 Dragan Simic 2024-07-21  362  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  363  	};
296602b8e5f715 Dragan Simic 2024-07-21  364  
296602b8e5f715 Dragan Simic 2024-07-21  365  	gmac: ethernet@fe300000 {
296602b8e5f715 Dragan Simic 2024-07-21  366  		compatible = "rockchip,rk3399-gmac";
296602b8e5f715 Dragan Simic 2024-07-21  367  		reg = <0x0 0xfe300000 0x0 0x10000>;
296602b8e5f715 Dragan Simic 2024-07-21  368  		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  369  		interrupt-names = "macirq";
296602b8e5f715 Dragan Simic 2024-07-21  370  		clocks = <&cru SCLK_MAC>, <&cru SCLK_MAC_RX>,
296602b8e5f715 Dragan Simic 2024-07-21  371  			 <&cru SCLK_MAC_TX>, <&cru SCLK_MACREF>,
296602b8e5f715 Dragan Simic 2024-07-21  372  			 <&cru SCLK_MACREF_OUT>, <&cru ACLK_GMAC>,
296602b8e5f715 Dragan Simic 2024-07-21  373  			 <&cru PCLK_GMAC>;
296602b8e5f715 Dragan Simic 2024-07-21  374  		clock-names = "stmmaceth", "mac_clk_rx",
296602b8e5f715 Dragan Simic 2024-07-21  375  			      "mac_clk_tx", "clk_mac_ref",
296602b8e5f715 Dragan Simic 2024-07-21  376  			      "clk_mac_refout", "aclk_mac",
296602b8e5f715 Dragan Simic 2024-07-21  377  			      "pclk_mac";
296602b8e5f715 Dragan Simic 2024-07-21  378  		power-domains = <&power RK3399_PD_GMAC>;
296602b8e5f715 Dragan Simic 2024-07-21  379  		resets = <&cru SRST_A_GMAC>;
296602b8e5f715 Dragan Simic 2024-07-21  380  		reset-names = "stmmaceth";
296602b8e5f715 Dragan Simic 2024-07-21  381  		rockchip,grf = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21  382  		snps,txpbl = <0x4>;
296602b8e5f715 Dragan Simic 2024-07-21  383  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  384  	};
296602b8e5f715 Dragan Simic 2024-07-21  385  
296602b8e5f715 Dragan Simic 2024-07-21  386  	sdio0: mmc@fe310000 {
296602b8e5f715 Dragan Simic 2024-07-21  387  		compatible = "rockchip,rk3399-dw-mshc",
296602b8e5f715 Dragan Simic 2024-07-21  388  			     "rockchip,rk3288-dw-mshc";
296602b8e5f715 Dragan Simic 2024-07-21  389  		reg = <0x0 0xfe310000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21  390  		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  391  		max-frequency = <150000000>;
296602b8e5f715 Dragan Simic 2024-07-21  392  		clocks = <&cru HCLK_SDIO>, <&cru SCLK_SDIO>,
296602b8e5f715 Dragan Simic 2024-07-21  393  			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
296602b8e5f715 Dragan Simic 2024-07-21  394  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
296602b8e5f715 Dragan Simic 2024-07-21  395  		fifo-depth = <0x100>;
296602b8e5f715 Dragan Simic 2024-07-21  396  		power-domains = <&power RK3399_PD_SDIOAUDIO>;
296602b8e5f715 Dragan Simic 2024-07-21  397  		resets = <&cru SRST_SDIO0>;
296602b8e5f715 Dragan Simic 2024-07-21  398  		reset-names = "reset";
296602b8e5f715 Dragan Simic 2024-07-21  399  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  400  	};
296602b8e5f715 Dragan Simic 2024-07-21  401  
296602b8e5f715 Dragan Simic 2024-07-21  402  	sdmmc: mmc@fe320000 {
296602b8e5f715 Dragan Simic 2024-07-21  403  		compatible = "rockchip,rk3399-dw-mshc",
296602b8e5f715 Dragan Simic 2024-07-21  404  			     "rockchip,rk3288-dw-mshc";
296602b8e5f715 Dragan Simic 2024-07-21  405  		reg = <0x0 0xfe320000 0x0 0x4000>;
296602b8e5f715 Dragan Simic 2024-07-21  406  		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  407  		max-frequency = <150000000>;
296602b8e5f715 Dragan Simic 2024-07-21  408  		assigned-clocks = <&cru HCLK_SD>;
296602b8e5f715 Dragan Simic 2024-07-21  409  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21  410  		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
296602b8e5f715 Dragan Simic 2024-07-21  411  			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
296602b8e5f715 Dragan Simic 2024-07-21  412  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
296602b8e5f715 Dragan Simic 2024-07-21  413  		fifo-depth = <0x100>;
296602b8e5f715 Dragan Simic 2024-07-21  414  		power-domains = <&power RK3399_PD_SD>;
296602b8e5f715 Dragan Simic 2024-07-21  415  		resets = <&cru SRST_SDMMC>;
296602b8e5f715 Dragan Simic 2024-07-21  416  		reset-names = "reset";
296602b8e5f715 Dragan Simic 2024-07-21  417  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  418  	};
296602b8e5f715 Dragan Simic 2024-07-21  419  
296602b8e5f715 Dragan Simic 2024-07-21  420  	sdhci: mmc@fe330000 {
296602b8e5f715 Dragan Simic 2024-07-21  421  		compatible = "rockchip,rk3399-sdhci-5.1", "arasan,sdhci-5.1";
296602b8e5f715 Dragan Simic 2024-07-21  422  		reg = <0x0 0xfe330000 0x0 0x10000>;
296602b8e5f715 Dragan Simic 2024-07-21  423  		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  424  		arasan,soc-ctl-syscon = <&grf>;
296602b8e5f715 Dragan Simic 2024-07-21  425  		assigned-clocks = <&cru SCLK_EMMC>;
296602b8e5f715 Dragan Simic 2024-07-21  426  		assigned-clock-rates = <200000000>;
296602b8e5f715 Dragan Simic 2024-07-21  427  		clocks = <&cru SCLK_EMMC>, <&cru ACLK_EMMC>;
296602b8e5f715 Dragan Simic 2024-07-21  428  		clock-names = "clk_xin", "clk_ahb";
296602b8e5f715 Dragan Simic 2024-07-21  429  		clock-output-names = "emmc_cardclock";
296602b8e5f715 Dragan Simic 2024-07-21  430  		#clock-cells = <0>;
296602b8e5f715 Dragan Simic 2024-07-21  431  		phys = <&emmc_phy>;
296602b8e5f715 Dragan Simic 2024-07-21  432  		phy-names = "phy_arasan";
296602b8e5f715 Dragan Simic 2024-07-21  433  		power-domains = <&power RK3399_PD_EMMC>;
296602b8e5f715 Dragan Simic 2024-07-21  434  		disable-cqe-dcmd;
296602b8e5f715 Dragan Simic 2024-07-21  435  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  436  	};
296602b8e5f715 Dragan Simic 2024-07-21  437  
296602b8e5f715 Dragan Simic 2024-07-21  438  	usb_host0_ehci: usb@fe380000 {
296602b8e5f715 Dragan Simic 2024-07-21  439  		compatible = "generic-ehci";
296602b8e5f715 Dragan Simic 2024-07-21  440  		reg = <0x0 0xfe380000 0x0 0x20000>;
296602b8e5f715 Dragan Simic 2024-07-21  441  		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  442  		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
296602b8e5f715 Dragan Simic 2024-07-21  443  			 <&u2phy0>;
296602b8e5f715 Dragan Simic 2024-07-21  444  		phys = <&u2phy0_host>;
296602b8e5f715 Dragan Simic 2024-07-21  445  		phy-names = "usb";
296602b8e5f715 Dragan Simic 2024-07-21  446  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  447  	};
296602b8e5f715 Dragan Simic 2024-07-21  448  
296602b8e5f715 Dragan Simic 2024-07-21  449  	usb_host0_ohci: usb@fe3a0000 {
296602b8e5f715 Dragan Simic 2024-07-21  450  		compatible = "generic-ohci";
296602b8e5f715 Dragan Simic 2024-07-21  451  		reg = <0x0 0xfe3a0000 0x0 0x20000>;
296602b8e5f715 Dragan Simic 2024-07-21  452  		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  453  		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>,
296602b8e5f715 Dragan Simic 2024-07-21  454  			 <&u2phy0>;
296602b8e5f715 Dragan Simic 2024-07-21  455  		phys = <&u2phy0_host>;
296602b8e5f715 Dragan Simic 2024-07-21  456  		phy-names = "usb";
296602b8e5f715 Dragan Simic 2024-07-21  457  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  458  	};
296602b8e5f715 Dragan Simic 2024-07-21  459  
296602b8e5f715 Dragan Simic 2024-07-21  460  	usb_host1_ehci: usb@fe3c0000 {
296602b8e5f715 Dragan Simic 2024-07-21  461  		compatible = "generic-ehci";
296602b8e5f715 Dragan Simic 2024-07-21  462  		reg = <0x0 0xfe3c0000 0x0 0x20000>;
296602b8e5f715 Dragan Simic 2024-07-21  463  		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  464  		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
296602b8e5f715 Dragan Simic 2024-07-21  465  			 <&u2phy1>;
296602b8e5f715 Dragan Simic 2024-07-21  466  		phys = <&u2phy1_host>;
296602b8e5f715 Dragan Simic 2024-07-21  467  		phy-names = "usb";
296602b8e5f715 Dragan Simic 2024-07-21  468  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  469  	};
296602b8e5f715 Dragan Simic 2024-07-21  470  
296602b8e5f715 Dragan Simic 2024-07-21  471  	usb_host1_ohci: usb@fe3e0000 {
296602b8e5f715 Dragan Simic 2024-07-21  472  		compatible = "generic-ohci";
296602b8e5f715 Dragan Simic 2024-07-21  473  		reg = <0x0 0xfe3e0000 0x0 0x20000>;
296602b8e5f715 Dragan Simic 2024-07-21  474  		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  475  		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>,
296602b8e5f715 Dragan Simic 2024-07-21  476  			 <&u2phy1>;
296602b8e5f715 Dragan Simic 2024-07-21  477  		phys = <&u2phy1_host>;
296602b8e5f715 Dragan Simic 2024-07-21  478  		phy-names = "usb";
296602b8e5f715 Dragan Simic 2024-07-21  479  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  480  	};
296602b8e5f715 Dragan Simic 2024-07-21  481  
296602b8e5f715 Dragan Simic 2024-07-21  482  	debug@fe430000 {
296602b8e5f715 Dragan Simic 2024-07-21  483  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21  484  		reg = <0 0xfe430000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  485  		clocks = <&cru PCLK_COREDBG_L>;
296602b8e5f715 Dragan Simic 2024-07-21  486  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  487  		cpu = <&cpu_l0>;
296602b8e5f715 Dragan Simic 2024-07-21  488  	};
296602b8e5f715 Dragan Simic 2024-07-21  489  
296602b8e5f715 Dragan Simic 2024-07-21  490  	debug@fe432000 {
296602b8e5f715 Dragan Simic 2024-07-21  491  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21  492  		reg = <0 0xfe432000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  493  		clocks = <&cru PCLK_COREDBG_L>;
296602b8e5f715 Dragan Simic 2024-07-21  494  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  495  		cpu = <&cpu_l1>;
296602b8e5f715 Dragan Simic 2024-07-21  496  	};
296602b8e5f715 Dragan Simic 2024-07-21  497  
296602b8e5f715 Dragan Simic 2024-07-21  498  	debug@fe434000 {
296602b8e5f715 Dragan Simic 2024-07-21  499  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21  500  		reg = <0 0xfe434000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  501  		clocks = <&cru PCLK_COREDBG_L>;
296602b8e5f715 Dragan Simic 2024-07-21  502  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  503  		cpu = <&cpu_l2>;
296602b8e5f715 Dragan Simic 2024-07-21  504  	};
296602b8e5f715 Dragan Simic 2024-07-21  505  
296602b8e5f715 Dragan Simic 2024-07-21  506  	debug@fe436000 {
296602b8e5f715 Dragan Simic 2024-07-21  507  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21  508  		reg = <0 0xfe436000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  509  		clocks = <&cru PCLK_COREDBG_L>;
296602b8e5f715 Dragan Simic 2024-07-21  510  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  511  		cpu = <&cpu_l3>;
296602b8e5f715 Dragan Simic 2024-07-21  512  	};
296602b8e5f715 Dragan Simic 2024-07-21  513  
296602b8e5f715 Dragan Simic 2024-07-21  514  	debug@fe610000 {
296602b8e5f715 Dragan Simic 2024-07-21  515  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21  516  		reg = <0 0xfe610000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  517  		clocks = <&cru PCLK_COREDBG_B>;
296602b8e5f715 Dragan Simic 2024-07-21  518  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  519  		cpu = <&cpu_b0>;
296602b8e5f715 Dragan Simic 2024-07-21  520  	};
296602b8e5f715 Dragan Simic 2024-07-21  521  
296602b8e5f715 Dragan Simic 2024-07-21  522  	debug@fe710000 {
296602b8e5f715 Dragan Simic 2024-07-21  523  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
296602b8e5f715 Dragan Simic 2024-07-21  524  		reg = <0 0xfe710000 0 0x1000>;
296602b8e5f715 Dragan Simic 2024-07-21  525  		clocks = <&cru PCLK_COREDBG_B>;
296602b8e5f715 Dragan Simic 2024-07-21  526  		clock-names = "apb_pclk";
296602b8e5f715 Dragan Simic 2024-07-21  527  		cpu = <&cpu_b1>;
296602b8e5f715 Dragan Simic 2024-07-21  528  	};
296602b8e5f715 Dragan Simic 2024-07-21  529  
296602b8e5f715 Dragan Simic 2024-07-21 @530  	usbdrd3_0: usb@fe800000 {
296602b8e5f715 Dragan Simic 2024-07-21  531  		compatible = "rockchip,rk3399-dwc3";
296602b8e5f715 Dragan Simic 2024-07-21  532  		#address-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  533  		#size-cells = <2>;
296602b8e5f715 Dragan Simic 2024-07-21  534  		ranges;
296602b8e5f715 Dragan Simic 2024-07-21  535  		clocks = <&cru SCLK_USB3OTG0_REF>, <&cru SCLK_USB3OTG0_SUSPEND>,
296602b8e5f715 Dragan Simic 2024-07-21  536  			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_RKSOC_AXI_PERF>,
296602b8e5f715 Dragan Simic 2024-07-21  537  			 <&cru ACLK_USB3>, <&cru ACLK_USB3_GRF>;
296602b8e5f715 Dragan Simic 2024-07-21  538  		clock-names = "ref_clk", "suspend_clk",
296602b8e5f715 Dragan Simic 2024-07-21  539  			      "bus_clk", "aclk_usb3_rksoc_axi_perf",
296602b8e5f715 Dragan Simic 2024-07-21  540  			      "aclk_usb3", "grf_clk";
296602b8e5f715 Dragan Simic 2024-07-21  541  		resets = <&cru SRST_A_USB3_OTG0>;
296602b8e5f715 Dragan Simic 2024-07-21  542  		reset-names = "usb3-otg";
296602b8e5f715 Dragan Simic 2024-07-21  543  		status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  544  
296602b8e5f715 Dragan Simic 2024-07-21  545  		usbdrd_dwc3_0: usb@fe800000 {
296602b8e5f715 Dragan Simic 2024-07-21  546  			compatible = "snps,dwc3";
296602b8e5f715 Dragan Simic 2024-07-21  547  			reg = <0x0 0xfe800000 0x0 0x100000>;
296602b8e5f715 Dragan Simic 2024-07-21  548  			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH 0>;
296602b8e5f715 Dragan Simic 2024-07-21  549  			clocks = <&cru SCLK_USB3OTG0_REF>, <&cru ACLK_USB3OTG0>,
296602b8e5f715 Dragan Simic 2024-07-21  550  				 <&cru SCLK_USB3OTG0_SUSPEND>;
296602b8e5f715 Dragan Simic 2024-07-21  551  			clock-names = "ref", "bus_early", "suspend";
296602b8e5f715 Dragan Simic 2024-07-21  552  			dr_mode = "otg";
296602b8e5f715 Dragan Simic 2024-07-21  553  			phys = <&u2phy0_otg>, <&tcphy0_usb3>;
296602b8e5f715 Dragan Simic 2024-07-21  554  			phy-names = "usb2-phy", "usb3-phy";
296602b8e5f715 Dragan Simic 2024-07-21  555  			phy_type = "utmi_wide";
296602b8e5f715 Dragan Simic 2024-07-21  556  			snps,dis_enblslpm_quirk;
296602b8e5f715 Dragan Simic 2024-07-21  557  			snps,dis-u2-freeclk-exists-quirk;
296602b8e5f715 Dragan Simic 2024-07-21  558  			snps,dis_u2_susphy_quirk;
296602b8e5f715 Dragan Simic 2024-07-21  559  			snps,dis-del-phy-power-chg-quirk;
296602b8e5f715 Dragan Simic 2024-07-21  560  			snps,dis-tx-ipgap-linecheck-quirk;
296602b8e5f715 Dragan Simic 2024-07-21  561  			power-domains = <&power RK3399_PD_USB3>;
296602b8e5f715 Dragan Simic 2024-07-21  562  			status = "disabled";
296602b8e5f715 Dragan Simic 2024-07-21  563  		};
296602b8e5f715 Dragan Simic 2024-07-21  564  	};
296602b8e5f715 Dragan Simic 2024-07-21  565  
296602b8e5f715 Dragan Simic 2024-07-21 @566  	usbdrd3_1: usb@fe900000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
