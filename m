Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224811E0DF2
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jan 2025 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735742798; cv=none; b=NOMqae1Wjbsw5MXMZLouR1z0Rig3pMOhaCm7SVZXXWZlDQ48mhUNIS6Ck2ncpCHimOD8Voqhj0NyRyad9j8vhFHjcGiLk9nqGjTYtN3NfzSRuTwo5wWVS/i1Sl6mK0Htq5ozgMwkMu1TZCGfDinJSjO/7pgdttlPR0cSF6NfTxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735742798; c=relaxed/simple;
	bh=3zbZRiZvQac3QQjwCFufPMfgpRwL0Q2ITSwvaVt+730=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHqF3QNyfq+6N1grJRa86A8Cxk46rgHkM9e67BTPzQZyJN8GzJ+sGuQp9TvuYadqurSkbNk1v5/ZN5mkFOde+inh9OALg/dgieHri+K9gfddXAc3FyDmmGBr9qewFSecf2jlmXGIVLhzd6451Ow8e8xb7BwC+0PWYTYG1IkvpFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6GNTF2Y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6GNTF2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735742796; x=1767278796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zbZRiZvQac3QQjwCFufPMfgpRwL0Q2ITSwvaVt+730=;
  b=K6GNTF2YwdJIZG6AilcwXtm3qJLLWySJqXslvDFS2CoP0q+iFGuVHsgi
   YPGzOJ2TP0xG/m0lnAbK3qOk9hVLA0gMVF9tcMfJAITKXi+2cSsh//vlv
   /8s0ab8oV1PYhC4k2nMXIZfxXJZNy2hUZfKvgbl82HMqZVJAgvVgjGVnQ
   xfLeRGeK6WhpxHA92vc9ug9I5Hm6SsCCSH6dCIbdoKG7enMvrFhCvzT6z
   SiGoG82B/2rqhNaJSGavQwpfnZm+LEkIjUvfqm9OB1+AeU4LF7W//Xq5b
   PtD07VIl+HL2uDU0MmIsWakb7j/BLpcjcWfZ3iS+29xmYorABF2KAXFlQ
   w==;
X-CSE-ConnectionGUID: /aKMrU9JToShlzxmL1ofHw==
X-CSE-MsgGUID: i5fYNvEySYSfqDro7aBMsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61368238"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="61368238"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 06:46:35 -0800
X-CSE-ConnectionGUID: VxQjno7KSD+jeo4AAx+huA==
X-CSE-MsgGUID: V6de8pqJSve7KUag41/RPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105905862"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jan 2025 06:46:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSzzU-0007tG-1W;
	Wed, 01 Jan 2025 14:46:32 +0000
Date: Wed, 1 Jan 2025 22:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:581.31-583.7:
 Warning (unit_address_vs_reg):
 /i2c@ff3d0000/typec-portc@22/ports/port@0/endpoint@0: node has a unit name,
 but no reg or ranges property
Message-ID: <202501012253.KYlccKRj-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Yan <andyshrk@163.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 904f983256fdd24bde974bf2f38fbacd3edbcd80 arm64: dts: rockchip: Add dts for a rk3399 based board EAIDK-610
date:   2 years, 4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 4 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20250101/202501012253.KYlccKRj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501012253.KYlccKRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501012253.KYlccKRj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:433.26-467.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:469.26-503.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:581.31-583.7: Warning (unit_address_vs_reg): /i2c@ff3d0000/typec-portc@22/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:1936.26-1970.4: Warning (avoid_unnecessary_addr_size): /mipi@ff960000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:1972.27-2008.4: Warning (avoid_unnecessary_addr_size): /mipi@ff968000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:906.7-913.4: Warning (graph_child_address): /usb@fe800000/usb@fe800000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:575.9-585.5: Warning (graph_child_address): /i2c@ff3d0000/typec-portc@22/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:1951.9-1969.5: Warning (graph_child_address): /mipi@ff960000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:1988.9-2007.5: Warning (graph_child_address): /mipi@ff968000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399.dtsi:2024.9-2042.5: Warning (graph_child_address): /edp@ff970000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +581 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts

904f983256fdd2 Andy Yan 2022-07-09  560  
904f983256fdd2 Andy Yan 2022-07-09  561  &i2c4 {
904f983256fdd2 Andy Yan 2022-07-09  562  	i2c-scl-rising-time-ns = <600>;
904f983256fdd2 Andy Yan 2022-07-09  563  	i2c-scl-falling-time-ns = <20>;
904f983256fdd2 Andy Yan 2022-07-09  564  	status = "okay";
904f983256fdd2 Andy Yan 2022-07-09  565  
904f983256fdd2 Andy Yan 2022-07-09  566  	fusb0: typec-portc@22 {
904f983256fdd2 Andy Yan 2022-07-09  567  		compatible = "fcs,fusb302";
904f983256fdd2 Andy Yan 2022-07-09  568  		reg = <0x22>;
904f983256fdd2 Andy Yan 2022-07-09  569  		interrupt-parent = <&gpio1>;
904f983256fdd2 Andy Yan 2022-07-09  570  		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
904f983256fdd2 Andy Yan 2022-07-09  571  		pinctrl-names = "default";
904f983256fdd2 Andy Yan 2022-07-09  572  		pinctrl-0 = <&fusb0_int>;
904f983256fdd2 Andy Yan 2022-07-09  573  		vbus-supply = <&vcc5v0_typec>;
904f983256fdd2 Andy Yan 2022-07-09  574  
904f983256fdd2 Andy Yan 2022-07-09 @575  		ports {
904f983256fdd2 Andy Yan 2022-07-09  576  			#address-cells = <1>;
904f983256fdd2 Andy Yan 2022-07-09  577  			#size-cells = <0>;
904f983256fdd2 Andy Yan 2022-07-09  578  
904f983256fdd2 Andy Yan 2022-07-09  579  			port@0 {
904f983256fdd2 Andy Yan 2022-07-09  580  				reg = <0>;
904f983256fdd2 Andy Yan 2022-07-09 @581  				usbc0_role_sw: endpoint@0 {
904f983256fdd2 Andy Yan 2022-07-09  582  					remote-endpoint = <&dwc3_0_role_switch>;
904f983256fdd2 Andy Yan 2022-07-09  583  				};
904f983256fdd2 Andy Yan 2022-07-09  584  			};
904f983256fdd2 Andy Yan 2022-07-09  585  		};
904f983256fdd2 Andy Yan 2022-07-09  586  
904f983256fdd2 Andy Yan 2022-07-09  587  		connector {
904f983256fdd2 Andy Yan 2022-07-09  588  			compatible = "usb-c-connector";
904f983256fdd2 Andy Yan 2022-07-09  589  			data-role = "dual";
904f983256fdd2 Andy Yan 2022-07-09  590  			label = "USB-C";
904f983256fdd2 Andy Yan 2022-07-09  591  
904f983256fdd2 Andy Yan 2022-07-09  592  			ports {
904f983256fdd2 Andy Yan 2022-07-09  593  				#address-cells = <1>;
904f983256fdd2 Andy Yan 2022-07-09  594  				#size-cells = <0>;
904f983256fdd2 Andy Yan 2022-07-09  595  
904f983256fdd2 Andy Yan 2022-07-09  596  				port@0 {
904f983256fdd2 Andy Yan 2022-07-09  597  					reg = <0>;
904f983256fdd2 Andy Yan 2022-07-09  598  
904f983256fdd2 Andy Yan 2022-07-09  599  					usbc_hs: endpoint {
904f983256fdd2 Andy Yan 2022-07-09  600  						remote-endpoint = <&u2phy0_typec_hs>;
904f983256fdd2 Andy Yan 2022-07-09  601  					};
904f983256fdd2 Andy Yan 2022-07-09  602  				};
904f983256fdd2 Andy Yan 2022-07-09  603  
904f983256fdd2 Andy Yan 2022-07-09  604  				port@1 {
904f983256fdd2 Andy Yan 2022-07-09  605  					reg = <1>;
904f983256fdd2 Andy Yan 2022-07-09  606  
904f983256fdd2 Andy Yan 2022-07-09  607  					usbc_ss: endpoint {
904f983256fdd2 Andy Yan 2022-07-09  608  						remote-endpoint = <&tcphy0_typec_ss>;
904f983256fdd2 Andy Yan 2022-07-09  609  					};
904f983256fdd2 Andy Yan 2022-07-09  610  				};
904f983256fdd2 Andy Yan 2022-07-09  611  			};
904f983256fdd2 Andy Yan 2022-07-09  612  		};
904f983256fdd2 Andy Yan 2022-07-09  613  	};
904f983256fdd2 Andy Yan 2022-07-09  614  };
904f983256fdd2 Andy Yan 2022-07-09  615  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
