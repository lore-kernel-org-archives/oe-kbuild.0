Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1CC2E630
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 05:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726636142; cv=none; b=jRWd5DFGZ30S13uunrpm2Gm4WvhoYMzC6fzUWy04jLY0FbIgz/tDernvgw724ABA9q4/hTClKm+L3SKUEzL/vCQdTm8VebIQO/kwMK00HNSoaqjlOkzECtAQQExMl8hOHiwyAN6nD3tuP7CUkmQ7cWwAOZ2dfYMzp7AQmCR1FmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726636142; c=relaxed/simple;
	bh=c9UloXTXqv7QZkffSTGXL0OUwvn953M/eixEXIFXBas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGhjFjCa1rGg2N4GkI7VwZ/fLST+uY93Ij/YdVObl5C7R0ljfj8EPkKF0smU67h41zsYKxZDtVOqoKAXaix1W4AzDV0EnPiZtGHlDJmpQO8LueqrjaAljPk9zDAZa4vOCgLP/GkmiWEHuDfEGp+0uJrmdqIcPPzOcKK0eA6RR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtEVcsdr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtEVcsdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726636140; x=1758172140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9UloXTXqv7QZkffSTGXL0OUwvn953M/eixEXIFXBas=;
  b=OtEVcsdrG8YZQHgVqepOTBKNJUuKB/iLtwhnoDDwAJnLRlA2C41Jcti8
   OT+wdvq6CpAt4omO1dy0kqBX5nKO0cKF/1SG4vEKsvTysbcmKcC25szjh
   AdOIISrW6eoBNZKgmd/DV1WeCRodujCB5705dXi6J1HaYcxxQdYos41gy
   wsj4hJeBjyEwjcmHHnoMtl1x9fpzkg7Q1s64R6+HGxXKYp+KNetMi/ewS
   hUVXfPLQWvVtco2yPhohbk4mfORjsD8slz6WLiUZukh+8vZYEr6l5G/SC
   hJT6ETx/DUMvKIWoxBjGN3GMvnoj90eyje9IYbpXHxDjzbz2SnxFn9eG6
   A==;
X-CSE-ConnectionGUID: J4WPGHDSSJmHRXEhMgrwhA==
X-CSE-MsgGUID: WvDhjyB3QP2LQe8zHx3cNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25685988"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25685988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 22:09:00 -0700
X-CSE-ConnectionGUID: VHBkdK95QFi6pQM/qPDhdw==
X-CSE-MsgGUID: 2swE7cSnSFKTnLQ3+YeRGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73779544"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2024 22:08:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqmvv-000Bt5-20;
	Wed, 18 Sep 2024 05:08:55 +0000
Date: Wed, 18 Sep 2024 13:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.1-main 15/235]
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro-rtl8367.dts:83.22-129.4:
 Warning (unit_address_vs_reg): /ethernet@fe010000/mdio/switch1: node has a
 reg or ranges property, but no unit name
Message-ID: <202409181331.5PRNS3O8-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.1-main
head:   d77f27a08153c2b1e4bf61b38e4b20ecd44c047f
commit: b8baa228e24773ace5a0ddc40c8b55c55142ac4d [15/235] arm64: dts: rockchip: add hw-rev 00 of r2pro
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 9 months ago
config: arm64-randconfig-001-20240918 (https://download.01.org/0day-ci/archive/20240918/202409181331.5PRNS3O8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409181331.5PRNS3O8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409181331.5PRNS3O8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro-rtl8367.dts:83.22-129.4: Warning (unit_address_vs_reg): /ethernet@fe010000/mdio/switch1: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro-rtl8367.dts:11.27-17.4: Warning (unit_address_vs_reg): /rtkgsw_red@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts:559.11-600.4: Warning (unique_unit_address): /ethernet@fe2a0000/mdio/switch@0: duplicate unit-address (also used in node /ethernet@fe2a0000/mdio/ethernet-phy@0)

vim +83 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro-rtl8367.dts

b8baa228e24773 Frank Wunderlich 2022-02-24    9  
b8baa228e24773 Frank Wunderlich 2022-02-24   10  / {
b8baa228e24773 Frank Wunderlich 2022-02-24  @11  	rtkgsw_red: rtkgsw_red@0 {
b8baa228e24773 Frank Wunderlich 2022-02-24   12  		compatible = "realtek,rtk-gsw"; //reduced phy driver
b8baa228e24773 Frank Wunderlich 2022-02-24   13  		realtek,mdio = <&mdio1>;
b8baa228e24773 Frank Wunderlich 2022-02-24   14  		realtek,reset-pin = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
b8baa228e24773 Frank Wunderlich 2022-02-24   15  		realtek,extifconfig = "rgmii,rgmii"; //own property to setup rgmii instead of sgmii
b8baa228e24773 Frank Wunderlich 2022-02-24   16  		status = "disabled";
b8baa228e24773 Frank Wunderlich 2022-02-24   17  	};
b8baa228e24773 Frank Wunderlich 2022-02-24   18  };
b8baa228e24773 Frank Wunderlich 2022-02-24   19  
b8baa228e24773 Frank Wunderlich 2022-02-24   20  &gmac0 {
b8baa228e24773 Frank Wunderlich 2022-02-24   21  	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
b8baa228e24773 Frank Wunderlich 2022-02-24   22  	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
b8baa228e24773 Frank Wunderlich 2022-02-24   23  	clock_in_out = "input";
b8baa228e24773 Frank Wunderlich 2022-02-24   24  	phy-handle = <&rgmii_phy0>;
b8baa228e24773 Frank Wunderlich 2022-02-24   25  	phy-mode = "rgmii";
b8baa228e24773 Frank Wunderlich 2022-02-24   26  	pinctrl-names = "default";
b8baa228e24773 Frank Wunderlich 2022-02-24   27  	pinctrl-0 = <&gmac0_miim
b8baa228e24773 Frank Wunderlich 2022-02-24   28  		     &gmac0_tx_bus2
b8baa228e24773 Frank Wunderlich 2022-02-24   29  		     &gmac0_rx_bus2
b8baa228e24773 Frank Wunderlich 2022-02-24   30  		     &gmac0_rgmii_clk
b8baa228e24773 Frank Wunderlich 2022-02-24   31  		     &gmac0_rgmii_bus>;
b8baa228e24773 Frank Wunderlich 2022-02-24   32  	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
b8baa228e24773 Frank Wunderlich 2022-02-24   33  	snps,reset-active-low;
b8baa228e24773 Frank Wunderlich 2022-02-24   34  	/* Reset time is 20ms, 100ms for rtl8211f */
b8baa228e24773 Frank Wunderlich 2022-02-24   35  	snps,reset-delays-us = <0 20000 100000>;
b8baa228e24773 Frank Wunderlich 2022-02-24   36  	tx_delay = <0x3c>;
b8baa228e24773 Frank Wunderlich 2022-02-24   37  	rx_delay = <0x2f>;
b8baa228e24773 Frank Wunderlich 2022-02-24   38  	status = "okay";
b8baa228e24773 Frank Wunderlich 2022-02-24   39  	/delete-node/ fixed-link;
b8baa228e24773 Frank Wunderlich 2022-02-24   40  };
b8baa228e24773 Frank Wunderlich 2022-02-24   41  
b8baa228e24773 Frank Wunderlich 2022-02-24   42  &gmac1 {
b8baa228e24773 Frank Wunderlich 2022-02-24   43  	/delete-property/ phy-handle;
b8baa228e24773 Frank Wunderlich 2022-02-24   44  	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
b8baa228e24773 Frank Wunderlich 2022-02-24   45  	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
b8baa228e24773 Frank Wunderlich 2022-02-24   46  	clock_in_out = "output";
b8baa228e24773 Frank Wunderlich 2022-02-24   47  	phy-mode = "rgmii";
b8baa228e24773 Frank Wunderlich 2022-02-24   48  	pinctrl-names = "default";
b8baa228e24773 Frank Wunderlich 2022-02-24   49  	pinctrl-0 = <&gmac1m1_miim
b8baa228e24773 Frank Wunderlich 2022-02-24   50  		     &gmac1m1_tx_bus2
b8baa228e24773 Frank Wunderlich 2022-02-24   51  		     &gmac1m1_rx_bus2
b8baa228e24773 Frank Wunderlich 2022-02-24   52  		     &gmac1m1_rgmii_clk
b8baa228e24773 Frank Wunderlich 2022-02-24   53  		     &gmac1m1_rgmii_bus>;
b8baa228e24773 Frank Wunderlich 2022-02-24   54  
b8baa228e24773 Frank Wunderlich 2022-02-24   55  	snps,reset-gpio = <&gpio0 RK_PB7 GPIO_ACTIVE_LOW>;
b8baa228e24773 Frank Wunderlich 2022-02-24   56  	snps,reset-active-low;
b8baa228e24773 Frank Wunderlich 2022-02-24   57  	/* Reset time is 20ms, 100ms for rtl8211f */
b8baa228e24773 Frank Wunderlich 2022-02-24   58  	snps,reset-delays-us = <0 20000 100000>;
b8baa228e24773 Frank Wunderlich 2022-02-24   59  
b8baa228e24773 Frank Wunderlich 2022-02-24   60  	tx_delay = <0x4f>;
b8baa228e24773 Frank Wunderlich 2022-02-24   61  	rx_delay = <0x26>;
b8baa228e24773 Frank Wunderlich 2022-02-24   62  
b8baa228e24773 Frank Wunderlich 2022-02-24   63  	status = "okay";
b8baa228e24773 Frank Wunderlich 2022-02-24   64  
b8baa228e24773 Frank Wunderlich 2022-02-24   65  	fixed-link {
b8baa228e24773 Frank Wunderlich 2022-02-24   66  		speed = <1000>;
b8baa228e24773 Frank Wunderlich 2022-02-24   67  		full-duplex;
b8baa228e24773 Frank Wunderlich 2022-02-24   68  		pause;
b8baa228e24773 Frank Wunderlich 2022-02-24   69  	};
b8baa228e24773 Frank Wunderlich 2022-02-24   70  };
b8baa228e24773 Frank Wunderlich 2022-02-24   71  
b8baa228e24773 Frank Wunderlich 2022-02-24   72  &mdio0 {
b8baa228e24773 Frank Wunderlich 2022-02-24   73  	rgmii_phy0: ethernet-phy@0 {
b8baa228e24773 Frank Wunderlich 2022-02-24   74  		compatible = "ethernet-phy-ieee802.3-c22";
b8baa228e24773 Frank Wunderlich 2022-02-24   75  		reg = <0x0>;
b8baa228e24773 Frank Wunderlich 2022-02-24   76  	};
b8baa228e24773 Frank Wunderlich 2022-02-24   77  };
b8baa228e24773 Frank Wunderlich 2022-02-24   78  
b8baa228e24773 Frank Wunderlich 2022-02-24   79  /delete-node/ &rgmii_phy1;
b8baa228e24773 Frank Wunderlich 2022-02-24   80  
b8baa228e24773 Frank Wunderlich 2022-02-24   81  &mdio1 {
b8baa228e24773 Frank Wunderlich 2022-02-24   82  	//ethernet-phy@0 needs to be deleted
b8baa228e24773 Frank Wunderlich 2022-02-24  @83  	rtkgsw_dsa: switch1 {
b8baa228e24773 Frank Wunderlich 2022-02-24   84  		compatible = "realtek,rtl8367s";
b8baa228e24773 Frank Wunderlich 2022-02-24   85  		realtek,reset-pin = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
b8baa228e24773 Frank Wunderlich 2022-02-24   86  		reg = <0>;
b8baa228e24773 Frank Wunderlich 2022-02-24   87  		status = "disabled";
b8baa228e24773 Frank Wunderlich 2022-02-24   88  
b8baa228e24773 Frank Wunderlich 2022-02-24   89  		ports {
b8baa228e24773 Frank Wunderlich 2022-02-24   90  			#address-cells = <1>;
b8baa228e24773 Frank Wunderlich 2022-02-24   91  			#size-cells = <0>;
b8baa228e24773 Frank Wunderlich 2022-02-24   92  
b8baa228e24773 Frank Wunderlich 2022-02-24   93  			port@0 {
b8baa228e24773 Frank Wunderlich 2022-02-24   94  				reg = <0>;
b8baa228e24773 Frank Wunderlich 2022-02-24   95  				label = "lan0";
b8baa228e24773 Frank Wunderlich 2022-02-24   96  			};
b8baa228e24773 Frank Wunderlich 2022-02-24   97  
b8baa228e24773 Frank Wunderlich 2022-02-24   98  			port@1 {
b8baa228e24773 Frank Wunderlich 2022-02-24   99  				reg = <1>;
b8baa228e24773 Frank Wunderlich 2022-02-24  100  				label = "lan1";
b8baa228e24773 Frank Wunderlich 2022-02-24  101  			};
b8baa228e24773 Frank Wunderlich 2022-02-24  102  
b8baa228e24773 Frank Wunderlich 2022-02-24  103  			port@2 {
b8baa228e24773 Frank Wunderlich 2022-02-24  104  				reg = <2>;
b8baa228e24773 Frank Wunderlich 2022-02-24  105  				label = "lan2";
b8baa228e24773 Frank Wunderlich 2022-02-24  106  			};
b8baa228e24773 Frank Wunderlich 2022-02-24  107  
b8baa228e24773 Frank Wunderlich 2022-02-24  108  			port@3 {
b8baa228e24773 Frank Wunderlich 2022-02-24  109  				reg = <3>;
b8baa228e24773 Frank Wunderlich 2022-02-24  110  				label = "lan3";
b8baa228e24773 Frank Wunderlich 2022-02-24  111  			};
b8baa228e24773 Frank Wunderlich 2022-02-24  112  
b8baa228e24773 Frank Wunderlich 2022-02-24  113  			port@6 {
b8baa228e24773 Frank Wunderlich 2022-02-24  114  				reg = <6>;
b8baa228e24773 Frank Wunderlich 2022-02-24  115  				ethernet = <&gmac1>;
b8baa228e24773 Frank Wunderlich 2022-02-24  116  				phy-mode = "rgmii";
b8baa228e24773 Frank Wunderlich 2022-02-24  117  				realtek,ext-int = <1>;
b8baa228e24773 Frank Wunderlich 2022-02-24  118  
b8baa228e24773 Frank Wunderlich 2022-02-24  119  				tx-internal-delay-ps = <0>;
b8baa228e24773 Frank Wunderlich 2022-02-24  120  				rx-internal-delay-ps = <0>;
b8baa228e24773 Frank Wunderlich 2022-02-24  121  
b8baa228e24773 Frank Wunderlich 2022-02-24  122  				fixed-link {
b8baa228e24773 Frank Wunderlich 2022-02-24  123  					speed = <1000>;
b8baa228e24773 Frank Wunderlich 2022-02-24  124  					full-duplex;
b8baa228e24773 Frank Wunderlich 2022-02-24  125  					pause;
b8baa228e24773 Frank Wunderlich 2022-02-24  126  				};
b8baa228e24773 Frank Wunderlich 2022-02-24  127  			};
b8baa228e24773 Frank Wunderlich 2022-02-24  128  		};
b8baa228e24773 Frank Wunderlich 2022-02-24  129  	};
b8baa228e24773 Frank Wunderlich 2022-02-24  130  };
b8baa228e24773 Frank Wunderlich 2022-02-24  131  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
