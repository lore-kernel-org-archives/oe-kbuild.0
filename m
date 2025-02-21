Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDBA1C3C08
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Feb 2025 02:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740103296; cv=none; b=R3kqwD0rvZswtH/2dfaV5UlKwaOdXZYH1+C7mp25LJgp+84wf6DEfNpESjSe4UJPJ1Pf/E6lxHotKy3T5XSqHFK/1t3hPGYDOWSZ55HU78/aVkoYQFdA35auSfQq/p+nDUdyei1QQ5gL3GC+hFRwqBn91ysP+VJn4eeH0GZv5Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740103296; c=relaxed/simple;
	bh=7tLX1rGyKUTQxdancuulfulNWt0FfAQ80AWsx+vqA70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IrZg6c0uCnIxTTbgrxhTzL/Ug+wMDiuaFf+xreL9veyH0i8bXuOQSsQdVQVA9igEK1zIEooLE1k0maMRumGwmAzZG/NRn9r6FmT8iWbyAXxz5hOc4FXuxCr5Bqk+TMB2Aul0efExuonYE03KdL60EqvlY/xhir9cSe+YNiXVY4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gA2TqtNJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gA2TqtNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740103294; x=1771639294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7tLX1rGyKUTQxdancuulfulNWt0FfAQ80AWsx+vqA70=;
  b=gA2TqtNJPVy0mUbtD7W8fJsp9T7bgHb5Hq7cd2tE+7ob6OdaIJyjsk0E
   qI+fVdDfYseZJM4EvAn94737xIdkIoz3PlElXwSRCXk+nkWpYVMEerC0r
   F0fX8Pdt6wyAKdmXToS32dNDeOLxjhgoPF0hTS3fNXTg5+tqkAoJB/ian
   cHdKzCKaK0EWR7VqNxdw+fVqkyM1Gqdl9vYhNZW7yKupnI3TN0hPlChBX
   Bhpualf3ygRKxrrLWpq3YgiaJVPt4lpF6rcUusvr4e2B2MmEKLMIx0kOn
   FibWC6RKgdpUjx+GKlOoV4e1MPa2KaPlZ0sXr/tfNdz/Y9AL97oJr3TkI
   Q==;
X-CSE-ConnectionGUID: 3+F5NiwMQOGH7vi/i3wHPA==
X-CSE-MsgGUID: jQt7lIgnTuauYmSvFiJuaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44697244"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="44697244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 18:01:33 -0800
X-CSE-ConnectionGUID: X3uS6k9LQUigtbJcQiVC9A==
X-CSE-MsgGUID: t3Okrn4YTCKjBaE/9Nx+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="115425483"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2025 18:01:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlIM5-0004yd-0d;
	Fri, 21 Feb 2025 02:01:29 +0000
Date: Fri, 21 Feb 2025 10:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:pr/60 1/1]
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts:21.12-31.4: Warning
 (avoid_unnecessary_addr_size): /gpio-keys: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202502210914.ivCLa9qA-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 40a17923367118e32e5e413a952736dd83635b32 [1/1] ARM: dts: BCM5301X: Add basic DT for Phicomm K3
:::::: branch date: 4 days ago
:::::: commit date: 6 years ago
config: arm-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250221/202502210914.ivCLa9qA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210914.ivCLa9qA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502210914.ivCLa9qA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/skeleton.dtsi:17.9-50: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:21.14-44.4: Warning (unit_address_vs_reg): /chipcommonA: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:46.9-105.4: Warning (unit_address_vs_reg): /mpcore: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:150.21-157.4: Warning (unit_address_vs_reg): /usb2-phy: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x.dtsi:359.15-380.4: Warning (unit_address_vs_reg): /mdio-bus-mux: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi:10.20-19.5: Warning (avoid_unnecessary_addr_size): /nand@18028000/nandcs@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm/boot/dts/bcm47094-phicomm-k3.dts:21.12-31.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +21 arch/arm/boot/dts/bcm47094-phicomm-k3.dts

40a17923367118e Hao Dong 2019-01-20  11  
40a17923367118e Hao Dong 2019-01-20  12  / {
40a17923367118e Hao Dong 2019-01-20  13  	compatible = "phicomm,k3", "brcm,bcm47094", "brcm,bcm4708";
40a17923367118e Hao Dong 2019-01-20  14  	model = "Phicomm K3";
40a17923367118e Hao Dong 2019-01-20  15  
40a17923367118e Hao Dong 2019-01-20  16  	memory {
40a17923367118e Hao Dong 2019-01-20  17  		reg = <0x00000000 0x08000000
40a17923367118e Hao Dong 2019-01-20  18  		       0x88000000 0x18000000>;
40a17923367118e Hao Dong 2019-01-20  19  	};
40a17923367118e Hao Dong 2019-01-20  20  
40a17923367118e Hao Dong 2019-01-20 @21  	gpio-keys {
40a17923367118e Hao Dong 2019-01-20  22  		compatible = "gpio-keys";
40a17923367118e Hao Dong 2019-01-20  23  		#address-cells = <1>;
40a17923367118e Hao Dong 2019-01-20  24  		#size-cells = <0>;
40a17923367118e Hao Dong 2019-01-20  25  
40a17923367118e Hao Dong 2019-01-20  26  		restart {
40a17923367118e Hao Dong 2019-01-20  27  			label = "Reset";
40a17923367118e Hao Dong 2019-01-20  28  			linux,code = <KEY_RESTART>;
40a17923367118e Hao Dong 2019-01-20  29  			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
40a17923367118e Hao Dong 2019-01-20  30  		};
40a17923367118e Hao Dong 2019-01-20  31  	};
40a17923367118e Hao Dong 2019-01-20  32  };
40a17923367118e Hao Dong 2019-01-20  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
