Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FFE12E5D
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Apr 2025 16:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745168307; cv=none; b=kr+3J1J3OOb7VRlS236Px+DSBQBDJVnjNe2p9Ea7+JQFAsFhdUz1Na32ykg5UxhgH/EyB3F71HEHPOuS5WAA3d7in5Vt4wlmH8p+SJ8Tu1wuaNF4uzHb1hunqb6FotsYP+VLo+o+e1D8MSCu/+ECSjR+qM/tN7T4JSzmG1ptZkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745168307; c=relaxed/simple;
	bh=muFTxsugLWsvps71vs2d0QAxocdYGF8oESY6hGf0JUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZQbdNv0U1/SjEtiLF7c15PaWyPaAUt14o+NMSpd+TDu9hKTkNgKDWjRbzJMT+7fEw6ajq54JpCT4hdgGjfvXtwHbenmM7ATPBh4THLi8o5klQ+Y3Iz8CoF3IppJkVm8Q/Hx7tXZuk2NuMhfmttdqfjLnVFy6qgxDyMKsi6o1YMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NC7IEnUC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NC7IEnUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745168304; x=1776704304;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=muFTxsugLWsvps71vs2d0QAxocdYGF8oESY6hGf0JUM=;
  b=NC7IEnUCqIyifYh1loQFHF3e6wYWPCAOAtRutr0TMAAcKRVorUIkNMqP
   2lAKYYv4L0iOp7XkdlcgdUhr2JxBTyBd+yYO1APgfIWQDRdErxSIOOnf5
   XwK36QjV4I2p7dwa1F1P9kM59UbLevdVDM1b49cXFCjekAscehl7BmPvX
   2ivCbAz8DgRPvDYciXF7/AuoH5amJidrNV40SPwfxmBMpr9S8kmRQBf2+
   q2FHqSFEknwnxEEC0p/ncI5Zssvb7eJh+mnaVqyPZLqUPW0/4lgISqnec
   F29qyv2Kn1oJ8DPxg5sxHSL3CFblV6yURR1RsXfWxKYC+HCvZ/w/SE6OE
   Q==;
X-CSE-ConnectionGUID: r0DPmNbrSiqZZIFSygP58g==
X-CSE-MsgGUID: zWNRK+4qR1Cb5Eq/mVeLXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46845643"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46845643"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 09:58:23 -0700
X-CSE-ConnectionGUID: GdYdUwA1QwKt9/RRavCh4w==
X-CSE-MsgGUID: OyhuV9vQQyexQ+58qtFJhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136629201"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Apr 2025 09:58:18 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Xzk-0004n3-2b;
	Sun, 20 Apr 2025 16:58:16 +0000
Date: Mon, 21 Apr 2025 00:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] powerpc: p2020: Rename wdt@ nodes to watchdog@
Message-ID: <202504210052.B0pPNOCu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250418-watchdog-v1-4-987ff2046272@posteo.net>
References: <20250418-watchdog-v1-4-987ff2046272@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Naveen N Rao <naveen@kernel.org>
CC: devicetree@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-512x-Rename-wdt-node-to-watchdog/20250419-033055
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250418-watchdog-v1-4-987ff2046272%40posteo.net
patch subject: [PATCH 4/4] powerpc: p2020: Rename wdt@ nodes to watchdog@
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-052-20250420 (https://download.01.org/0day-ci/archive/20250421/202504210052.B0pPNOCu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504210052.B0pPNOCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504210052.B0pPNOCu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/pq3-power.dtsi:10.25-12.4: Warning (unit_address_vs_reg): /soc@fef00000/power@e0070/soc-clk@24: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/pq3-power.dtsi:13.25-15.4: Warning (unit_address_vs_reg): /soc@fef00000/power@e0070/soc-clk@25: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/pq3-power.dtsi:16.25-18.4: Warning (unit_address_vs_reg): /soc@fef00000/power@e0070/soc-clk@26: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/ge_imp3a.dts:50.11-68.5: Warning (simple_bus_reg): /localbus@fef05000/nor@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/fsl/ge_imp3a.dts:70.13-74.5: Warning (simple_bus_reg): /localbus@fef05000/nvram@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/fsl/ge_imp3a.dts:76.12-79.5: Warning (simple_bus_reg): /localbus@fef05000/fpga@4,0: simple-bus unit address format error, expected "400000000"
   arch/powerpc/boot/dts/fsl/ge_imp3a.dts:81.21-88.5: Warning (simple_bus_reg): /localbus@fef05000/pic@4,20: simple-bus unit address format error, expected "400000020"
   arch/powerpc/boot/dts/fsl/ge_imp3a.dts:90.24-95.5: Warning (simple_bus_reg): /localbus@fef05000/gpio@4,400: simple-bus unit address format error, expected "400000400"
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dts:97.18-103.5: Warning (simple_bus_reg): /localbus@fef05000/watchdog@4,800: simple-bus unit address format error, expected "400000800"
   arch/powerpc/boot/dts/fsl/ge_imp3a.dts:115.12-118.5: Warning (simple_bus_reg): /localbus@fef05000/nand@6,0: simple-bus unit address format error, expected "600000000"
   arch/powerpc/boot/dts/fsl/ge_imp3a.dts:120.12-123.5: Warning (simple_bus_reg): /localbus@fef05000/nand@7,0: simple-bus unit address format error, expected "700000000"
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /: failed to match any schema with compatible: ['ge,imp3a']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: / (ge,imp3a): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: / (ge,imp3a): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: localbus@fef05000 (fsl,p2020-elbc): nor@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: localbus@fef05000 (fsl,p2020-elbc): nand@6,0: 'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000: failed to match any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): $nodename:0: 'nor@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): Unevaluated properties are not allowed ('partition@0', 'partition@7800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nvram@3,0: failed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/fpga@4,0: failed to match any schema with compatible: ['ge,imp3a-fpga-regs']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: failed to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pic-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: failed to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pic-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/gpio@4,400: failed to match any schema with compatible: ['ge,imp3a-gpio']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,800: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,800: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,800: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@6,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@7,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000: failed to match any schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#

vim +/400000800 +97 arch/powerpc/boot/dts/fsl/ge_imp3a.dts

e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   12  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   13  / {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   14  	model = "GE_IMP3A";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   15  	compatible = "ge,imp3a";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   16  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   17  	memory {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   18  		device_type = "memory";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   19  	};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   20  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   21  	lbc: localbus@fef05000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   22  		reg = <0 0xfef05000 0 0x1000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   23  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   24  		ranges = <0x0 0x0 0x0 0xff000000 0x01000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   25  			  0x1 0x0 0x0 0xe0000000 0x08000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   26  			  0x2 0x0 0x0 0xe8000000 0x08000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   27  			  0x3 0x0 0x0 0xfc100000 0x00020000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   28  			  0x4 0x0 0x0 0xfc000000 0x00008000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   29  			  0x5 0x0 0x0 0xfc008000 0x00008000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   30  			  0x6 0x0 0x0 0xfee00000 0x00040000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   31  			  0x7 0x0 0x0 0xfee80000 0x00040000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   32  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   33  		/* nor@0,0 is a mirror of part of the memory in nor@1,0
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   34  		nor@0,0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   35  			#address-cells = <1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   36  			#size-cells = <1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   37  			compatible = "ge,imp3a-firmware-mirror", "cfi-flash";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   38  			reg = <0x0 0x0 0x1000000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   39  			bank-width = <2>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   40  			device-width = <1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   41  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   42  			partition@0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   43  				label = "firmware";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   44  				reg = <0x0 0x1000000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   45  				read-only;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   46  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   47  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   48  		*/
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   49  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   50  		nor@1,0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   51  			#address-cells = <1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   52  			#size-cells = <1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   53  			compatible = "ge,imp3a-paged-flash", "cfi-flash";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   54  			reg = <0x1 0x0 0x8000000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   55  			bank-width = <2>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   56  			device-width = <1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   57  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   58  			partition@0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   59  				label = "user";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   60  				reg = <0x0 0x7800000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   61  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   62  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   63  			partition@7800000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   64  				label = "firmware";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   65  				reg = <0x7800000 0x800000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   66  				read-only;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   67  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   68  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   69  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   70  		nvram@3,0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   71  			device_type = "nvram";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   72  			compatible = "simtek,stk14ca8";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   73  			reg = <0x3 0x0 0x20000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   74  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   75  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   76  		fpga@4,0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   77  			compatible = "ge,imp3a-fpga-regs";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   78  			reg = <0x4 0x0 0x20>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   79  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   80  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   81  		gef_pic: pic@4,20 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   82  			#interrupt-cells = <1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   83  			interrupt-controller;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   84  			device_type = "interrupt-controller";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   85  			compatible = "ge,imp3a-fpga-pic", "gef,fpga-pic-1.00";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   86  			reg = <0x4 0x20 0x20>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   87  			interrupts = <6 7 0 0>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   88  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   89  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   90  		gef_gpio: gpio@4,400 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   91  			#gpio-cells = <2>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   92  			compatible = "ge,imp3a-gpio";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   93  			reg = <0x4 0x400 0x24>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   94  			gpio-controller;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   95  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   96  
1fab68667a3026b arch/powerpc/boot/dts/fsl/ge_imp3a.dts J. Neuschäfer 2025-04-18  @97  		watchdog@4,800 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   98  			compatible = "ge,imp3a-fpga-wdt", "gef,fpga-wdt-1.00",
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12   99  				"gef,fpga-wdt";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  100  			reg = <0x4 0x800 0x8>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  101  			interrupts = <10 4>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  102  			interrupt-parent = <&gef_pic>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  103  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  104  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  105  		/* Second watchdog available, driver currently supports one.
1fab68667a3026b arch/powerpc/boot/dts/fsl/ge_imp3a.dts J. Neuschäfer 2025-04-18  106  		watchdog@4,808 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  107  			compatible = "gef,imp3a-fpga-wdt", "gef,fpga-wdt-1.00",
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  108  				"gef,fpga-wdt";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  109  			reg = <0x4 0x808 0x8>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  110  			interrupts = <9 4>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  111  			interrupt-parent = <&gef_pic>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  112  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  113  		*/
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  114  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  115  		nand@6,0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  116  			compatible = "fsl,elbc-fcm-nand";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  117  			reg = <0x6 0x0 0x40000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  118  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  119  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  120  		nand@7,0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  121  			compatible = "fsl,elbc-fcm-nand";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  122  			reg = <0x7 0x0 0x40000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  123  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  124  	};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  125  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  126  	soc: soc@fef00000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  127  		ranges = <0x0 0 0xfef00000 0x100000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  128  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  129  		i2c@3000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  130  			hwmon@48 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  131  				compatible = "national,lm92";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  132  				reg = <0x48>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  133  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  134  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  135  			hwmon@4c {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  136  				compatible = "adi,adt7461";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  137  				reg = <0x4c>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  138  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  139  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  140  			rtc@51 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  141  				compatible = "epson,rx8581";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  142  				reg = <0x51>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  143  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  144  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  145  			eti@6b {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  146  				compatible = "dallas,ds1682";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  147  				reg = <0x6b>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  148  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  149  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  150  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  151  		usb@22000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  152  			phy_type = "ulpi";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  153  			dr_mode = "host";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  154  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  155  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  156  		mdio@24520 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  157  			phy0: ethernet-phy@0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  158  				interrupt-parent = <&gef_pic>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  159  				interrupts = <0xc 0x4>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  160  				reg = <0x1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  161  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  162  			phy1: ethernet-phy@1 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  163  				interrupt-parent = <&gef_pic>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  164  				interrupts = <0xb 0x4>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  165  				reg = <0x2>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  166  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  167  			tbi0: tbi-phy@11 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  168  				reg = <0x11>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  169  				device_type = "tbi-phy";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  170  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  171  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  172  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  173  		mdio@25520 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  174  			tbi1: tbi-phy@11 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  175  				reg = <0x11>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  176  				device_type = "tbi-phy";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  177  			};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  178  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  179  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  180  		mdio@26520 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  181  			status = "disabled";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  182  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  183  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  184  		enet0: ethernet@24000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  185  			tbi-handle = <&tbi0>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  186  			phy-handle = <&phy0>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  187  			phy-connection-type = "gmii";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  188  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  189  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  190  		enet1: ethernet@25000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  191  			tbi-handle = <&tbi1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  192  			phy-handle = <&phy1>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  193  			phy-connection-type = "gmii";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  194  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  195  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  196  		enet2: ethernet@26000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  197  			status = "disabled";
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  198  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  199  	};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  200  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  201  	pci0: pcie@fef08000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  202  		ranges = <0x2000000 0x0 0xc0000000 0 0xc0000000 0x0 0x20000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  203  			  0x1000000 0x0 0x00000000 0 0xfe020000 0x0 0x10000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  204  		reg = <0 0xfef08000 0 0x1000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  205  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  206  		pcie@0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  207  			ranges = <0x2000000 0x0 0xc0000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  208  				  0x2000000 0x0 0xc0000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  209  				  0x0 0x20000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  210  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  211  				  0x1000000 0x0 0x0
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  212  				  0x1000000 0x0 0x0
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  213  				  0x0 0x10000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  214  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  215  	};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  216  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  217  	pci1: pcie@fef09000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  218  		reg = <0 0xfef09000 0 0x1000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  219  		ranges = <0x2000000 0x0 0xa0000000 0 0xa0000000 0x0 0x20000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  220  			  0x1000000 0x0 0x00000000 0 0xfe010000 0x0 0x10000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  221  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  222  		pcie@0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  223  			ranges = <0x2000000 0x0 0xa0000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  224  				  0x2000000 0x0 0xa0000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  225  				  0x0 0x20000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  226  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  227  				  0x1000000 0x0 0x0
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  228  				  0x1000000 0x0 0x0
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  229  				  0x0 0x10000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  230  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  231  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  232  	};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  233  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  234  	pci2: pcie@fef0a000 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  235  		reg = <0 0xfef0a000 0 0x1000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  236  		ranges = <0x2000000 0x0 0x80000000 0 0x80000000 0x0 0x20000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  237  			  0x1000000 0x0 0x00000000 0 0xfe000000 0x0 0x10000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  238  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  239  		pcie@0 {
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  240  			ranges = <0x2000000 0x0 0x80000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  241  				  0x2000000 0x0 0x80000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  242  				  0x0 0x20000000
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  243  
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  244  				  0x1000000 0x0 0x0
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  245  				  0x1000000 0x0 0x0
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  246  				  0x0 0x10000>;
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  247  		};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  248  	};
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  249  };
e041013ac0df7fc arch/powerpc/boot/dts/ge_imp3a.dts     Martyn Welch  2012-03-12  250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
