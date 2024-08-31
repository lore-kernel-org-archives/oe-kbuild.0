Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546EF33EA
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725121996; cv=none; b=k/nN1cThae4PUBIZUAGXYboE4Aszorfy31L08IPuzUd20gBXnUOKxcLBtXyjaJOduX4eFa3FBdgpvnRWE0PuUcr7qD7awLfrX3OeJos5w2yMbX2SMi6peVt6v+RImE7Dt2ioIGenxYrN2jJJLaQloEF8dPHLYZRx9AIMqSgsGKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725121996; c=relaxed/simple;
	bh=4Wk6jOfK5VIaGNDwWoOf71dYs4dYsh/zTqSklHo9lok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ix+faMsreS7eMn+3RIW7nkrhCgVJmuPCkQE2Q1mv4WfZwX44+hqjAg3NxiTOQrjE+nK22NO3VJ+mXYr+xD0AFrOwZg0pEVOOulxb6HMDaHTKDAyW6RrqWEPngSYnpzVZBuLchv+qo2jINBoLpYuP29lHUc8SRLJidO2TKi0PvN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGgjEuvk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGgjEuvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725121994; x=1756657994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Wk6jOfK5VIaGNDwWoOf71dYs4dYsh/zTqSklHo9lok=;
  b=ZGgjEuvkNVyalmRXUUrLwgqLnS1xialsDIp9XnffOsk40IGTgnQtWVxw
   K7oNV9OWoV0M1vf/ndoYVwDUfv1F6L9GKHQwbfHeNkjFswbS8KjFL4MdS
   a9dmqQ+p2vq4iRY2ncsTva4FV7AGWIrtFCLD8wC15OQDC99rHt9xvUS+K
   nHxv+AHVeMhD5U0rujKlU/sCB0dWUbvS+S+Lw7TJGfnU8nXjVBHA1mlHF
   TMuf2bwDCk8LaO1JW/c7s7wjWFx3m5w6GRrnACu6uqv/HPxABxagOSFUI
   0LzRQYzU4EOgcKoAG0q/IxmKfePrdvtPbhyEfkGPvvIuFgMNogm7eQmJP
   g==;
X-CSE-ConnectionGUID: wwnRxOyRQ9u/M7dEeke3Ew==
X-CSE-MsgGUID: NdgrGvgXSzWU/ZKKrLmf7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34912735"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="34912735"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 09:33:14 -0700
X-CSE-ConnectionGUID: 5NMy1E+uScet+D3/BRo97A==
X-CSE-MsgGUID: gsw34ptaQ/OaM7e1lIG0UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64009501"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2024 09:33:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skR2E-0002vs-2C;
	Sat, 31 Aug 2024 16:33:10 +0000
Date: Sun, 1 Sep 2024 00:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [amlogic:v6.12/arm64-dt 9/10]
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:65.7-76.4: Warning
 (unit_address_vs_reg): /sram: node has a reg or ranges property, but no unit
 name
Message-ID: <202409010005.A7tSzgEn-lkp@intel.com>
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
TO: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.12/arm64-dt
head:   d4bd8f3023b68f72431e05ec6cbc793519b449cf
commit: 520b792e83171efc8ec0b004412b44dabc044de0 [9/10] arm64: dts: amlogic: add some device nodes for C3
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-003-20240831 (https://download.01.org/0day-ci/archive/20240901/202409010005.A7tSzgEn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010005.A7tSzgEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409010005.A7tSzgEn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:65.7-76.4: Warning (unit_address_vs_reg): /sram: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:168.34-413.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:168.34-413.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts:205.9-245.4: Warning (avoid_unnecessary_addr_size): /soc/bus@fe000000/spi@56000/nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +65 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi

02310be6f08007 Xianwei Zhao 2023-05-15  15  
02310be6f08007 Xianwei Zhao 2023-05-15  16  / {
02310be6f08007 Xianwei Zhao 2023-05-15  17  	cpus {
02310be6f08007 Xianwei Zhao 2023-05-15  18  		#address-cells = <2>;
02310be6f08007 Xianwei Zhao 2023-05-15  19  		#size-cells = <0>;
02310be6f08007 Xianwei Zhao 2023-05-15  20  
02310be6f08007 Xianwei Zhao 2023-05-15  21  		cpu0: cpu@0 {
02310be6f08007 Xianwei Zhao 2023-05-15  22  			device_type = "cpu";
02310be6f08007 Xianwei Zhao 2023-05-15  23  			compatible = "arm,cortex-a35";
02310be6f08007 Xianwei Zhao 2023-05-15  24  			reg = <0x0 0x0>;
02310be6f08007 Xianwei Zhao 2023-05-15  25  			enable-method = "psci";
02310be6f08007 Xianwei Zhao 2023-05-15  26  		};
02310be6f08007 Xianwei Zhao 2023-05-15  27  
02310be6f08007 Xianwei Zhao 2023-05-15  28  		cpu1: cpu@1 {
02310be6f08007 Xianwei Zhao 2023-05-15  29  			device_type = "cpu";
02310be6f08007 Xianwei Zhao 2023-05-15  30  			compatible = "arm,cortex-a35";
02310be6f08007 Xianwei Zhao 2023-05-15  31  			reg = <0x0 0x1>;
02310be6f08007 Xianwei Zhao 2023-05-15  32  			enable-method = "psci";
02310be6f08007 Xianwei Zhao 2023-05-15  33  		};
02310be6f08007 Xianwei Zhao 2023-05-15  34  	};
02310be6f08007 Xianwei Zhao 2023-05-15  35  
02310be6f08007 Xianwei Zhao 2023-05-15  36  	timer {
02310be6f08007 Xianwei Zhao 2023-05-15  37  		compatible = "arm,armv8-timer";
02310be6f08007 Xianwei Zhao 2023-05-15  38  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
02310be6f08007 Xianwei Zhao 2023-05-15  39  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
02310be6f08007 Xianwei Zhao 2023-05-15  40  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
02310be6f08007 Xianwei Zhao 2023-05-15  41  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
02310be6f08007 Xianwei Zhao 2023-05-15  42  	};
02310be6f08007 Xianwei Zhao 2023-05-15  43  
02310be6f08007 Xianwei Zhao 2023-05-15  44  	psci {
02310be6f08007 Xianwei Zhao 2023-05-15  45  		compatible = "arm,psci-1.0";
02310be6f08007 Xianwei Zhao 2023-05-15  46  		method = "smc";
02310be6f08007 Xianwei Zhao 2023-05-15  47  	};
02310be6f08007 Xianwei Zhao 2023-05-15  48  
02310be6f08007 Xianwei Zhao 2023-05-15  49  	xtal: xtal-clk {
02310be6f08007 Xianwei Zhao 2023-05-15  50  		compatible = "fixed-clock";
02310be6f08007 Xianwei Zhao 2023-05-15  51  		clock-frequency = <24000000>;
02310be6f08007 Xianwei Zhao 2023-05-15  52  		clock-output-names = "xtal";
02310be6f08007 Xianwei Zhao 2023-05-15  53  		#clock-cells = <0>;
02310be6f08007 Xianwei Zhao 2023-05-15  54  	};
02310be6f08007 Xianwei Zhao 2023-05-15  55  
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  56  	sm: secure-monitor {
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  57  		compatible = "amlogic,meson-gxbb-sm";
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  58  
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  59  		pwrc: power-controller {
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  60  			compatible = "amlogic,c3-pwrc";
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  61  			#power-domain-cells = <1>;
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  62  		};
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  63  	};
22a9b2a488c3f0 Xianwei Zhao 2023-07-07  64  
520b792e83171e Xianwei Zhao 2024-08-30 @65  	sram {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
