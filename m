Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07C18A6A8
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 20:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742158629; cv=none; b=KNwbkklQf+z3KZ5es4CvaeQEz36MHeU4/biOEAt5bj9xSqxJFLM5TQJRDrNLtWmKKGuOjUXGj4lmt6+skzF4BI6caG230IvRb6G2yoLPwMERw6pMhIDrVYrX4hGNDVWAyiskxO6x5/vBt08PmAbOhsttQOztKf9spVwROHO30ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742158629; c=relaxed/simple;
	bh=nNSa1+JFLgDVSWpHqRn7jwtiUwV/szu2mLJKbKefgUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLClktSy/GXmuUmwE8W/MwPPFoPm9lYxsNixDoGHzukRYoBJwNkIohOFRjBHaRHnq7WEQssEmpZNvpQSmUDxF1zUMmGGFDIfKsuyQpCE36Y2pSV6SbKcB4QYBcKyyIDm6H1dteKk9t/yjJy/hHPBKEQVwBEL8ra7NbdOrW5y4uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyQq+qqF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyQq+qqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742158627; x=1773694627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nNSa1+JFLgDVSWpHqRn7jwtiUwV/szu2mLJKbKefgUI=;
  b=hyQq+qqFeTuNq8pW7whj1D6etzITdEeF5/7ewQwU7+HxlX14uD530qEz
   3sl2URoXQAv3dGcbq+1mAwLWj2FYUuk1+enM/f8fSzNBOYHc4gvEHrPGw
   mVw4Kxn04SAiua70velB2nKhADcFYzeCIK2YlPNPl520cJ8VvEzzN2glc
   PtBrJvEJdHlA12688QnDK2b6pjNEWK76of3quHkZG9Q7VMUalJwxmEt+J
   ojMuQSZaMnU8q8FeFo7BNLc8MCy0N5bXQ8/7/KAWjnrabEZpsUfO2YKVs
   VPOiY9vchVUyxagU84/5OiF7fr2kg7bDN+ddAsb67Y+2kpJbyYOKG5rg2
   A==;
X-CSE-ConnectionGUID: whJlBqqZS+OAEywsRB3V4A==
X-CSE-MsgGUID: OPWiPlqXS8m640rn/G7QEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="54241862"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="54241862"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 13:57:06 -0700
X-CSE-ConnectionGUID: mczUSjiRROuFyIQouhS06w==
X-CSE-MsgGUID: +tzL4C43QFG02BP5D8APvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="121946650"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Mar 2025 13:57:04 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttv2c-000CEx-0i;
	Sun, 16 Mar 2025 20:57:02 +0000
Date: Mon, 17 Mar 2025 04:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gclement-mvebu:mvebu/dt64 12/12]
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning
 (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040:
 node has a unit name, but no reg or ranges property
Message-ID: <202503170455.XE8qUfaU-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git mvebu/dt64
head:   ed9c2b28ebef3333f25cefdc2ef37ee1f05cad95
commit: ed9c2b28ebef3333f25cefdc2ef37ee1f05cad95 [12/12] arm64: dts: marvell: Use preferred node names for "simple-bus"
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-004-20250317 (https://download.01.org/0day-ci/archive/20250317/202503170455.XE8qUfaU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503170455.XE8qUfaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503170455.XE8qUfaU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:177.10-200.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi:81.16-204.5: Warning (unique_unit_address_if_enabled): /soc/bus@7f000000: duplicate unit-address (also used in node /soc/behind-32bit-controller@7f000000)
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2-bus/bus@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts:158.10-187.4: Warning (avoid_unnecessary_addr_size): /cp0-bus/bus@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1-bus/bus@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property

vim +282 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi

7409b155562cc19 Konstantin Porotchkin 2019-10-04   12  
7409b155562cc19 Konstantin Porotchkin 2019-10-04   13  / {
7409b155562cc19 Konstantin Porotchkin 2019-10-04   14  	#address-cells = <2>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   15  	#size-cells = <2>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   16  
7409b155562cc19 Konstantin Porotchkin 2019-10-04   17  	aliases {
7409b155562cc19 Konstantin Porotchkin 2019-10-04   18  		serial0 = &uart0;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   19  		serial1 = &uart1;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   20  		gpio0 = &ap_gpio;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   21  		spi0 = &spi0;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   22  	};
7409b155562cc19 Konstantin Porotchkin 2019-10-04   23  
7409b155562cc19 Konstantin Porotchkin 2019-10-04   24  	psci {
7409b155562cc19 Konstantin Porotchkin 2019-10-04   25  		compatible = "arm,psci-0.2";
7409b155562cc19 Konstantin Porotchkin 2019-10-04   26  		method = "smc";
7409b155562cc19 Konstantin Porotchkin 2019-10-04   27  	};
7409b155562cc19 Konstantin Porotchkin 2019-10-04   28  
7409b155562cc19 Konstantin Porotchkin 2019-10-04   29  	reserved-memory {
7409b155562cc19 Konstantin Porotchkin 2019-10-04   30  		#address-cells = <2>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   31  		#size-cells = <2>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   32  		ranges;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   33  
7409b155562cc19 Konstantin Porotchkin 2019-10-04   34  		/*
7409b155562cc19 Konstantin Porotchkin 2019-10-04   35  		 * This area matches the mapping done with a
7409b155562cc19 Konstantin Porotchkin 2019-10-04   36  		 * mainline U-Boot, and should be updated by the
7409b155562cc19 Konstantin Porotchkin 2019-10-04   37  		 * bootloader.
7409b155562cc19 Konstantin Porotchkin 2019-10-04   38  		 */
7409b155562cc19 Konstantin Porotchkin 2019-10-04   39  
7409b155562cc19 Konstantin Porotchkin 2019-10-04   40  		psci-area@4000000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04   41  			reg = <0x0 0x4000000 0x0 0x200000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   42  			no-map;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   43  		};
99d2900f5fa4b80 Konstantin Porotchkin 2022-11-09   44  
99d2900f5fa4b80 Konstantin Porotchkin 2022-11-09   45  		tee@4400000 {
99d2900f5fa4b80 Konstantin Porotchkin 2022-11-09   46  			reg = <0 0x4400000 0 0x1000000>;
99d2900f5fa4b80 Konstantin Porotchkin 2022-11-09   47  			no-map;
99d2900f5fa4b80 Konstantin Porotchkin 2022-11-09   48  		};
7409b155562cc19 Konstantin Porotchkin 2019-10-04   49  	};
7409b155562cc19 Konstantin Porotchkin 2019-10-04   50  
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   51) 	timer {
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   52) 		compatible = "arm,armv8-timer";
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   53) 		interrupt-parent = <&gic>;
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   54) 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   55) 				<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   56) 				<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   57) 				<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   58) 	};
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   59) 
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   60) 	pmu {
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   61) 		compatible = "arm,cortex-a72-pmu";
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   62) 		interrupt-parent = <&pic>;
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   63) 		interrupts = <17>;
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   64) 	};
7c5cf1be860aa80 Rob Herring (Arm      2025-02-26   65) 
ed9c2b28ebef333 Rob Herring (Arm      2025-02-26   66) 	soc {
7409b155562cc19 Konstantin Porotchkin 2019-10-04   67  		#address-cells = <2>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   68  		#size-cells = <2>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   69  		compatible = "simple-bus";
7409b155562cc19 Konstantin Porotchkin 2019-10-04   70  		interrupt-parent = <&gic>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   71  		ranges;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   72  
ed9c2b28ebef333 Rob Herring (Arm      2025-02-26   73) 		bus@f0000000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04   74  			#address-cells = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   75  			#size-cells = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   76  			compatible = "simple-bus";
7409b155562cc19 Konstantin Porotchkin 2019-10-04   77  			ranges = <0x0 0x0 0xf0000000 0x1000000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04   78  
f86f5471f1381a3 Krzysztof Kozlowski   2024-04-01   79  			smmu: iommu@100000 {
83a3545d9c377c8 Marcin Wojtas         2020-07-15   80  				compatible = "marvell,ap806-smmu-500", "arm,mmu-500";
83a3545d9c377c8 Marcin Wojtas         2020-07-15   81  				reg = <0x100000 0x100000>;
83a3545d9c377c8 Marcin Wojtas         2020-07-15   82  				dma-coherent;
83a3545d9c377c8 Marcin Wojtas         2020-07-15   83  				#iommu-cells = <1>;
83a3545d9c377c8 Marcin Wojtas         2020-07-15   84  				#global-interrupts = <1>;
83a3545d9c377c8 Marcin Wojtas         2020-07-15   85  				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
83a3545d9c377c8 Marcin Wojtas         2020-07-15   86  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
83a3545d9c377c8 Marcin Wojtas         2020-07-15   87  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
83a3545d9c377c8 Marcin Wojtas         2020-07-15   88  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
83a3545d9c377c8 Marcin Wojtas         2020-07-15   89  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
83a3545d9c377c8 Marcin Wojtas         2020-07-15   90  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
83a3545d9c377c8 Marcin Wojtas         2020-07-15   91  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
83a3545d9c377c8 Marcin Wojtas         2020-07-15   92  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
83a3545d9c377c8 Marcin Wojtas         2020-07-15   93  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
83a3545d9c377c8 Marcin Wojtas         2020-07-15   94  				status = "disabled";
83a3545d9c377c8 Marcin Wojtas         2020-07-15   95  			};
83a3545d9c377c8 Marcin Wojtas         2020-07-15   96  
7409b155562cc19 Konstantin Porotchkin 2019-10-04   97  			gic: interrupt-controller@210000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04   98  				compatible = "arm,gic-400";
7409b155562cc19 Konstantin Porotchkin 2019-10-04   99  				#interrupt-cells = <3>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  100  				#address-cells = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  101  				#size-cells = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  102  				ranges;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  103  				interrupt-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  104  				interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  105  				reg = <0x210000 0x10000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  106  				      <0x220000 0x20000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  107  				      <0x240000 0x20000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  108  				      <0x260000 0x20000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  109  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  110  				gic_v2m0: v2m@280000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  111  					compatible = "arm,gic-v2m-frame";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  112  					msi-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  113  					reg = <0x280000 0x1000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  114  					arm,msi-base-spi = <160>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  115  					arm,msi-num-spis = <32>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  116  				};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  117  				gic_v2m1: v2m@290000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  118  					compatible = "arm,gic-v2m-frame";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  119  					msi-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  120  					reg = <0x290000 0x1000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  121  					arm,msi-base-spi = <192>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  122  					arm,msi-num-spis = <32>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  123  				};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  124  				gic_v2m2: v2m@2a0000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  125  					compatible = "arm,gic-v2m-frame";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  126  					msi-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  127  					reg = <0x2a0000 0x1000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  128  					arm,msi-base-spi = <224>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  129  					arm,msi-num-spis = <32>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  130  				};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  131  				gic_v2m3: v2m@2b0000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  132  					compatible = "arm,gic-v2m-frame";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  133  					msi-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  134  					reg = <0x2b0000 0x1000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  135  					arm,msi-base-spi = <256>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  136  					arm,msi-num-spis = <32>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  137  				};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  138  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  139  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  140  			odmi: odmi@300000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  141  				compatible = "marvell,odmi-controller";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  142  				msi-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  143  				marvell,odmi-frames = <4>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  144  				reg = <0x300000 0x4000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  145  				      <0x304000 0x4000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  146  				      <0x308000 0x4000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  147  				      <0x30C000 0x4000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  148  				marvell,spi-base = <128>, <136>, <144>, <152>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  149  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  150  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  151  			gicp: gicp@3f0040 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  152  				compatible = "marvell,ap806-gicp";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  153  				reg = <0x3f0040 0x10>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  154  				marvell,spi-ranges = <64 64>, <288 64>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  155  				msi-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  156  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  157  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  158  			pic: interrupt-controller@3f0100 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  159  				compatible = "marvell,armada-8k-pic";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  160  				reg = <0x3f0100 0x10>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  161  				#interrupt-cells = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  162  				interrupt-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  163  				interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  164  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  165  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  166  			sei: interrupt-controller@3f0200 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  167  				compatible = "marvell,ap806-sei";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  168  				reg = <0x3f0200 0x40>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  169  				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  170  				#interrupt-cells = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  171  				interrupt-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  172  				msi-controller;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  173  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  174  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  175  			xor@400000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  176  				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  177  				reg = <0x400000 0x1000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  178  				      <0x410000 0x1000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  179  				msi-parent = <&gic_v2m0>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  180  				clocks = <&ap_clk 3>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  181  				dma-coherent;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  182  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  183  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  184  			xor@420000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  185  				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  186  				reg = <0x420000 0x1000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  187  				      <0x430000 0x1000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  188  				msi-parent = <&gic_v2m0>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  189  				clocks = <&ap_clk 3>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  190  				dma-coherent;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  191  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  192  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  193  			xor@440000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  194  				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  195  				reg = <0x440000 0x1000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  196  				      <0x450000 0x1000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  197  				msi-parent = <&gic_v2m0>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  198  				clocks = <&ap_clk 3>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  199  				dma-coherent;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  200  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  201  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  202  			xor@460000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  203  				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  204  				reg = <0x460000 0x1000>,
7409b155562cc19 Konstantin Porotchkin 2019-10-04  205  				      <0x470000 0x1000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  206  				msi-parent = <&gic_v2m0>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  207  				clocks = <&ap_clk 3>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  208  				dma-coherent;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  209  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  210  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  211  			spi0: spi@510600 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  212  				compatible = "marvell,armada-380-spi";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  213  				reg = <0x510600 0x50>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  214  				#address-cells = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  215  				#size-cells = <0>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  216  				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  217  				clocks = <&ap_clk 3>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  218  				status = "disabled";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  219  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  220  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  221  			i2c0: i2c@511000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  222  				compatible = "marvell,mv78230-i2c";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  223  				reg = <0x511000 0x20>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  224  				#address-cells = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  225  				#size-cells = <0>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  226  				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  227  				clocks = <&ap_clk 3>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  228  				status = "disabled";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  229  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  230  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  231  			uart0: serial@512000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  232  				compatible = "snps,dw-apb-uart";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  233  				reg = <0x512000 0x100>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  234  				reg-shift = <2>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  235  				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  236  				reg-io-width = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  237  				clocks = <&ap_clk 3>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  238  				status = "disabled";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  239  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  240  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  241  			uart1: serial@512100 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  242  				compatible = "snps,dw-apb-uart";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  243  				reg = <0x512100 0x100>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  244  				reg-shift = <2>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  245  				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  246  				reg-io-width = <1>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  247  				clocks = <&ap_clk 3>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  248  				status = "disabled";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  249  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  250  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  251  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  252  			watchdog: watchdog@610000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  253  				compatible = "arm,sbsa-gwdt";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  254  				reg = <0x610000 0x1000>, <0x600000 0x1000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  255  				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  256  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  257  
239466bddfc02f9 Chris Packham         2022-03-30  258  			ap_sdhci0: mmc@6e0000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  259  				compatible = "marvell,armada-ap806-sdhci";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  260  				reg = <0x6e0000 0x300>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  261  				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  262  				clock-names = "core";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  263  				clocks = <&ap_clk 4>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  264  				dma-coherent;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  265  				marvell,xenon-phy-slow-mode;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  266  				status = "disabled";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  267  			};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  268  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  269  			ap_syscon0: system-controller@6f4000 {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  270  				compatible = "syscon", "simple-mfd";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  271  				reg = <0x6f4000 0x2000>;
7409b155562cc19 Konstantin Porotchkin 2019-10-04  272  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  273  				ap_pinctrl: pinctrl {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  274  					compatible = "marvell,ap806-pinctrl";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  275  
7409b155562cc19 Konstantin Porotchkin 2019-10-04  276  					uart0_pins: uart0-pins {
7409b155562cc19 Konstantin Porotchkin 2019-10-04  277  						marvell,pins = "mpp11", "mpp19";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  278  						marvell,function = "uart0";
7409b155562cc19 Konstantin Porotchkin 2019-10-04  279  					};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  280  				};
7409b155562cc19 Konstantin Porotchkin 2019-10-04  281  
7409b155562cc19 Konstantin Porotchkin 2019-10-04 @282  				ap_gpio: gpio@1040 {

:::::: The code at line 282 was first introduced by commit
:::::: 7409b155562cc19b929b57692b334c5758ffc75d arm64: dts: marvell: Prepare the introduction of AP807 based SoCs

:::::: TO: Konstantin Porotchkin <kostap@marvell.com>
:::::: CC: Gregory CLEMENT <gregory.clement@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
