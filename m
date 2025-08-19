Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8B2275869
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755614243; cv=none; b=ZHUjikyDe3cDmDP8Mf5dwlUPM7MoOjRRdq1iPySP5bYyKB7c90/Uvk+6qD14TiCSRj0iaoP5Yg0OVDcdCtiyQ8YizruoCb60Nj/3Wo+LYJvrOPUkZMooh3dmYGoeVt1ELPNt29aTuJkKjLv9LMhOmv2u3VCbUIrleARk8PcQ+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755614243; c=relaxed/simple;
	bh=dRmxE6oRXpVglVAp8/J2ZHn1evlG9ltdln4H1i3x92M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTl8qiuXeNo+5GOGTwXq0x5haL17el/7HjHaH2kxrfU11yohEInTHj8FZQ2qo2O+0W8HVvWzg5qGNU16KSEq3LuKLBAxprZqOPPqpNaB3J1ARAowldMCeFPMa+oopsb3ItR3A3GgkltpU2syMwI7n549zjqTNt4jvbvFBtPO4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtTR60OL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtTR60OL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755614241; x=1787150241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dRmxE6oRXpVglVAp8/J2ZHn1evlG9ltdln4H1i3x92M=;
  b=gtTR60OLWV6KTNvtHB4wJ5jtcuS9r7RvmHYBcsKHKhviOSGlsIvcXd0c
   ZD03g2ml04KqxJ2i3e8KU19iqArdIW3hSHVB0L3ObxRE2gQVP7iRBhwjZ
   RiZS7AimAu7BfKieXBmz1cU8JsHUdeKAXzcSkIhei/LtJibl4a/VntnfA
   9YgtxDCSwXGv72Go3SfgqtzRpVdInS3HSyw4vxA0pe0H1KrmT3pe+/tjR
   VdE03g0q0yKVBD7PVs0dYyEHVcUqf947LZZ9ori/ufZ1e1IeUfgz4qy8n
   1GoEzxQTxG4aCY7tStCk5XE+NHi5sNJqcywv1A4DnFi/dAFCkS8nCUbm8
   g==;
X-CSE-ConnectionGUID: Ob46G3IKTlmyC8+m8P7gfQ==
X-CSE-MsgGUID: t8eLibtiT7mLjQXOFiCkGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58008086"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="58008086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 07:37:21 -0700
X-CSE-ConnectionGUID: Xx4OaG85QLq/q8CXoMvmvg==
X-CSE-MsgGUID: N5TGqIX3TC68tHww9dnPbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="198877538"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Aug 2025 07:37:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoNSg-000H11-0r;
	Tue, 19 Aug 2025 14:37:18 +0000
Date: Tue, 19 Aug 2025 22:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] arm64: dts: rockchip: add USB-C support for ROCK
 5B/5B+/5T
Message-ID: <202508200011.teWM4rKa-lkp@intel.com>
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
In-Reply-To: <20250818-rock5bp-for-upstream-v3-1-d13f3cdec86c@kernel.org>
References: <20250818-rock5bp-for-upstream-v3-1-d13f3cdec86c@kernel.org>
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: kernel@collabora.com
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7f0817eee7ba40b48e956955d6fd8ba14750168c]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/arm64-dts-rockchip-add-USB-C-support-for-ROCK-5B-5B-5T/20250819-021532
base:   7f0817eee7ba40b48e956955d6fd8ba14750168c
patch link:    https://lore.kernel.org/r/20250818-rock5bp-for-upstream-v3-1-d13f3cdec86c%40kernel.org
patch subject: [PATCH v3] arm64: dts: rockchip: add USB-C support for ROCK 5B/5B+/5T
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-001-20250819 (https://download.01.org/0day-ci/archive/20250820/202508200011.teWM4rKa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508200011.teWM4rKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508200011.teWM4rKa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi:1028.7-1035.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi:1028.7-1035.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary

vim +/endpoint +1028 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi

aadfbdcf7e1e7f arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi        Sebastian Reichel 2025-05-08  1023  
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1024  &usb_host0_xhci {
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1025  	usb-role-switch;
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1026  	status = "okay";
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1027  
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18 @1028  	port {
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1029  		#address-cells = <1>;
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1030  		#size-cells = <0>;
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1031  
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1032  		usb_host0_xhci_to_usbc0: endpoint {
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1033  			remote-endpoint = <&usbc0_hs>;
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1034  		};
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1035  	};
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1036  };
ce32321a004780 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi Sebastian Reichel 2025-08-18  1037  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
