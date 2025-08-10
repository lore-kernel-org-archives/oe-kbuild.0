Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF8202F83
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789587; cv=none; b=VGTZJ/SHvt6tDQRwBIJ9TM0AoNdsi59WhP1teEh70hh3ZnyLP5VyMf6k63CO1tz9uhypeDmCQCEmAng2TGRhMqEcgO2qHLCiF77vn2hb5gwXNCLN1kfmiIxZF3AT4SmFVDQ+/66Lj5maFvLbjtkruLDQT1SdvkkWuz6Vj6i3QD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789587; c=relaxed/simple;
	bh=wwfZeNcUi32P1BWKqWFbOOCYWEo37vtFy1cuM8dSJ38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iaLSubc9nA0xBwgio4VwjbZyVjUscvQLu0HLvnrEjy6IsATvWw6MOXmla2YwpDfgPIL9MXLlSc+n/joblMwG43ldQjPUN6nXsvBZX66BieBj4/Vii9cYmcwJtv2cE+Yx8qd14ZsecVbHzf6WfZlh/BhmjmST3D4U72fGoyjHp7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvZBmrNM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvZBmrNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754789577; x=1786325577;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wwfZeNcUi32P1BWKqWFbOOCYWEo37vtFy1cuM8dSJ38=;
  b=bvZBmrNMHetsYwwkOwABB6a4UMU7z512pnffBBs18+OENPCspMvjpizw
   kN5IL5i/URnAywDn/2ahD14Ml9fOx8cfI0ylpmBDiJ1cfQfOzidZoaO2w
   XhRmBeCQDeO0pTctPc8Guj8QQ5qn0yBHyc0jQsWlpeEZObQ3dra93hCSj
   OU/T4EiCh+Vrl5epUzcSOQr6L4n8SjWbXZ5LDWjEa3U+pBbWaHtxxC2dD
   cRl1s6/brL4/8KymjXaM0fD8uXAG7BVvkbedMjq/3q3LGfHBK27pALVY/
   9qq8dvVJ2YZ1OaIbMPCtbENaz9b5IW728vy3ip2IRGP8+ldVzZCJkZC3r
   w==;
X-CSE-ConnectionGUID: T8csGakPQ3CKU939K/Hp1g==
X-CSE-MsgGUID: Rs9RY1C5TYqgcnXYVX4Zdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="74673046"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="74673046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 18:32:56 -0700
X-CSE-ConnectionGUID: hXU2LY/6S52iOa+LWMGspQ==
X-CSE-MsgGUID: qUnDkKuMQFOgxZ+XRXcIXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="164847456"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 09 Aug 2025 18:32:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukuvb-00056y-2s;
	Sun, 10 Aug 2025 01:32:51 +0000
Date: Sun, 10 Aug 2025 09:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 383/801]
 arch/arm64/boot/dts/actions/s700-cubieboard7.dtb: pinctrl@e01b0000
 (actions,s700-pinctrl): #gpio-cells: [2] is not of type 'integer'
Message-ID: <202508100908.Oinq34UG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-c=
onvert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: a92832e2ff52e63d0c65935767a13aaa487625e1 [383/801] dt-bindings: mux=
: Convert adi,adgs1408 to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250807 (https://download.01.org/0day-ci/arch=
ive/20250810/202508100908.Oinq34UG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250810/202508100908.Oinq34UG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508100908.Oinq34UG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/actions/s700-cubieboard7.dtb: /soc/power-controller@=
e01b0100: failed to match any schema with compatible: ['actions,s700-sps']
   arch/arm64/boot/dts/actions/s700-cubieboard7.dtb: /soc/pinctrl@e01b0000:=
 failed to match any schema with compatible: ['actions,s700-pinctrl']
>> arch/arm64/boot/dts/actions/s700-cubieboard7.dtb: pinctrl@e01b0000 (acti=
ons,s700-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/actions/s700-cubieboard7.dtb: pinctrl@e01b0000 (acti=
ons,s700-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: system-controller@1fbf0200 (a=
iroha,en7581-gpio-sysctl): pinctrl:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/airoha,en7581-gpio-s=
ysctl.yaml#
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pinctrl (airoha,en7581-pinctr=
l): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/airoha,en7581-pi=
nctrl.yaml#
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pinctrl (airoha,en7581-pinctr=
l): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/airoha/en7581-evb.dtb: pinctrl (airoha,en7581-pinctr=
l): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi:584.10-633.5: Warning =
(simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff800000=
 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('ph=
y-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.=
yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: ethernet@ff804000=
 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('ph=
y-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.=
yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: gpio@ffc03200 (sn=
ps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: gpio-controller@0=
 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: gpio-controller@0=
 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: gpio@ffc03300 (sn=
ps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: gpio-controller@0=
 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: gpio-controller@0=
 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dtb: sysmgr@ffd12000 (=
altr,sys-mgr-s10): 'interrupts' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/altera/altr,sys-mgr.=
yaml#
--
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /: failed to match any=
 schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /: failed to match any=
 schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: sata@e0300000 (snps,dw=
c-ahci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e1040000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e1040000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e1040000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e1050000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e1050000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e1050000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e0020000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e0020000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e0020000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e0030000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e0030000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e0030000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e0080000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e0080000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: gpio@e0080000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: ccp@e0100000 (amd,ccp-=
seattle-v1a): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/amd,ccp-seattle-v1a.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /bus/ethernet@e0700000=
: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: /bus/ethernet@e0900000=
: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
--
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /: failed to match any=
 schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /: failed to match any=
 schema with compatible: ['amd,seattle-overdrive', 'amd,seattle']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: sata@e0300000 (snps,dw=
c-ahci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: sata@e0d00000 (snps,dw=
c-ahci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e1040000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e1040000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e1040000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e1050000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e1050000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e1050000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e0020000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e0020000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e0020000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e0030000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e0030000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e0030000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e0080000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e0080000 (arm,pl0=
61): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: gpio@e0080000 (arm,pl0=
61): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: ccp@e0100000 (amd,ccp-=
seattle-v1a): 'iommus' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/amd,ccp-seattle-v1a.yaml#
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /bus/ethernet@e0700000=
: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
   arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: /bus/ethernet@e0900000=
: failed to match any schema with compatible: ['amd,xgbe-seattle-v1a']
--
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: pinctrl@4000 (a=
mlogic,pinctrl-a4): gpio@100:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: pinctrl@4000 (a=
mlogic,pinctrl-a4): gpio@140:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: pinctrl@4000 (a=
mlogic,pinctrl-a4): gpio@180:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: pinctrl@4000 (a=
mlogic,pinctrl-a4): gpio@1c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: pinctrl@4000 (a=
mlogic,pinctrl-a4): gpio@240:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@100: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@100: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@140: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@140: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@180: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@180: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@1c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@1c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@240: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@240: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: pinctrl@8e700 (=
amlogic,pinctrl-a4): gpio@4:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: pinctrl@8e700 (=
amlogic,pinctrl-a4): gpio@44:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@4: #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@4: #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@44: #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: gpio@44: #gpio-=
cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@100:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@140:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@180:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@1a0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@1c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@200:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@240:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@280:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@2c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s6): gpio@300:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@c0: #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@c0: #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@100: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@100: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@140: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@140: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@180: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@180: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@1a0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@1a0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@1c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@1c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@200: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@200: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@240: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@240: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@280: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@280: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@2c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@2c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@300: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: gpio@300: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s7): gpio@c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s7): gpio@100:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s7): gpio@140:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s7): gpio@180:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s7): gpio@1c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s7): gpio@200:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s7): gpio@240:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s7): gpio@2c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: pinctrl@4000 (a=
mlogic,pinctrl-s7): gpio@300:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@c0: #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@c0: #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@100: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@100: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@140: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@140: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@180: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@180: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@1c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@1c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@200: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@200: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@240: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@240: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@2c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@2c0: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@300: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: gpio@300: #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@100:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@140:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@180:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@1c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@200:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@240:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@280:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@2c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: pinctrl@4000 =
(amlogic,pinctrl-s7d): gpio@300:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-=
a4.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@c0: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@c0: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@100: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@100: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@140: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@140: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@180: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@180: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@1c0: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@1c0: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@200: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@200: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@240: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@240: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@280: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@280: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@2c0: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@2c0: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@300: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: gpio@300: #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:165.34-179.6: Warning (unit_=
address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but =
no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:165.34-179.6: Warning (simpl=
e_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges pro=
perty
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: pinctrl@4000 (a=
mlogic,t7-periphs-pinctrl): bank@4000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pi=
nctrl-a1.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: pinctrl@4000 (a=
mlogic,t7-periphs-pinctrl): bank@4000: Unevaluated properties are not allow=
ed ('#gpio-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pi=
nctrl-a1.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: bank@4000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: bank@4000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:165.34-179.6: Warning (unit_=
address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but =
no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:165.34-179.6: Warning (simpl=
e_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges pro=
perty
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: pinctrl@4=
000 (amlogic,t7-periphs-pinctrl): bank@4000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pi=
nctrl-a1.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: pinctrl@4=
000 (amlogic,t7-periphs-pinctrl): bank@4000: Unevaluated properties are not=
 allowed ('#gpio-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pi=
nctrl-a1.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: bank@4000=
: #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: bank@4000=
: #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:116.33-468.6: Warning (unit_ad=
dress_vs_reg): /soc/bus@fe000000/pinctrl@400: node has a unit name, but no =
reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:116.33-468.6: Warning (simple_=
bus_reg): /soc/bus@fe000000/pinctrl@400: missing or empty reg/ranges proper=
ty
>> arch/arm64/boot/dts/amlogic/meson-a1-ad401.dtb: pinctrl@400 (amlogic,mes=
on-a1-periphs-pinctrl): bank@400:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pi=
nctrl-a1.yaml#
>> arch/arm64/boot/dts/amlogic/meson-a1-ad401.dtb: pinctrl@400 (amlogic,mes=
on-a1-periphs-pinctrl): bank@400: Unevaluated properties are not allowed ('=
#gpio-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pi=
nctrl-a1.yaml#
>> arch/arm64/boot/dts/amlogic/meson-a1-ad401.dtb: bank@400: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/meson-a1-ad401.dtb: bank@400: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:116.33-468.6: Warning (unit_ad=
dress_vs_reg): /soc/bus@fe000000/pinctrl@400: node has a unit name, but no =
reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:116.33-468.6: Warning (simple_=
bus_reg): /soc/bus@fe000000/pinctrl@400: missing or empty reg/ranges proper=
ty
>> arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: pinctrl@400 (amlogic,mes=
on-a1-periphs-pinctrl): bank@400:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pi=
nctrl-a1.yaml#
>> arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: pinctrl@400 (amlogic,mes=
on-a1-periphs-pinctrl): bank@400: Unevaluated properties are not allowed ('=
#gpio-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pi=
nctrl-a1.yaml#
>> arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: bank@400: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/amlogic/meson-a1-ad402.dtb: bank@400: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   	['apm,xgene-pcie', 'apm,xgene2-pcie'] is too long
   	'apm,xgene-storm-pcie' was expected
   	'apm,xgene-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/apm,xgene-pcie.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2c0000: failed to ma=
tch any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a000000: failed to ma=
tch any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a200000: failed to ma=
tch any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/sata@1a400000: failed to ma=
tch any schema with compatible: ['apm,xgene-ahci-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: mmc@1c000000 (arasan,sdhci-4.9a)=
: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: gpio@1f63c000 (apm,xgene-gpio): =
#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: gpio@1f63c000 (apm,xgene-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: gpio@1f63c000 (apm,xgene-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: gpio@1c024000 (snps,dw-apb-gpio)=
: gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: gpio-controller@0 (snps,dw-apb-g=
pio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: gpio-controller@0 (snps,dw-apb-g=
pio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: gpio@17001000 (apm,xgene-gpio-sb=
): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/apm,xgene-gpio-sb.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: gpio@17001000 (apm,xgene-gpio-sb=
): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: gpio@17001000 (apm,xgene-gpio-sb=
): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mdio@1f610000: failed to ma=
tch any schema with compatible: ['apm,xgene-mdio-xfi']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f610000: failed t=
o match any schema with compatible: ['apm,xgene2-sgenet']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f620000: failed t=
o match any schema with compatible: ['apm,xgene2-xgenet']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: i2c@10511000 (snps,designware-i2=
c): Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/snps,designware-i2c.=
yaml#
--
>> arch/arm64/boot/dts/apple/t7000-j42d.dtb: pinctrl@20e300000 (apple,t7000=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t7000-j42d.dtb: pinctrl@20e300000 (apple,t7000=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t7000-j42d.dtb: pinctrl@20e300000 (apple,t7000=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j132.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j137.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140a.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j140k.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j152f.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j160.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j174.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j185f.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j213.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j215.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j223.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j230k.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@20f100000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@2100f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@2111f0000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j214k.dtb: pinctrl@212024000 (apple,t801=
0-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j680.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@20f100000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@2100f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@2111f0000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8012-j780.dtb: pinctrl@212024000 (apple,t8010=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@233100000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@233100000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@233100000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@2340f0000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@2340f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@2340f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@2351f0000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@2351f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@2351f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@236024000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
   arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@236024000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d201.dtb: pinctrl@236024000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@233100000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@233100000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@233100000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@2340f0000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@2340f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@2340f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@2351f0000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@2351f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@2351f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@236024000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
   arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@236024000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d20.dtb: pinctrl@236024000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@233100000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@233100000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@233100000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@2340f0000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@2340f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@2340f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@2351f0000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@2351f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@2351f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@236024000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
   arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@236024000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d211.dtb: pinctrl@236024000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@233100000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@233100000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@233100000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@2340f0000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@2340f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@2340f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@2351f0000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@2351f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@2351f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@236024000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
   arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@236024000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d21.dtb: pinctrl@236024000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@233100000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@233100000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@233100000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@2340f0000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@2340f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@2340f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@2351f0000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@2351f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@2351f0000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@236024000 (apple,t8015=
-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
   arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@236024000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d221.dtb: pinctrl@236024000 (apple,t8015=
-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@233100000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@233100000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@233100000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@2340f0000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@2340f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@2340f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@2351f0000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@2351f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@2351f0000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@236024000 (apple,t8015-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.ya=
ml#
   arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@236024000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8015-d22.dtb: pinctrl@236024000 (apple,t8015-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/axiado/ax3000-evk.dtb: gpio-controller@80500000 (axi=
ado,ax3000-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
>> arch/arm64/boot/dts/axiado/ax3000-evk.dtb: gpio-controller@80500000 (axi=
ado,ax3000-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/axiado/ax3000-evk.dtb: gpio-controller@80500000 (axi=
ado,ax3000-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/axiado/ax3000-evk.dtb: gpio-controller@80580000 (axi=
ado,ax3000-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
   arch/arm64/boot/dts/axiado/ax3000-evk.dtb: gpio-controller@80580000 (axi=
ado,ax3000-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/axiado/ax3000-evk.dtb: gpio-controller@80580000 (axi=
ado,ax3000-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/axiado/ax3000-evk.dtb: gpio-controller@80600000 (axi=
ado,ax3000-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
   arch/arm64/boot/dts/axiado/ax3000-evk.dtb: gpio-controller@80600000 (axi=
ado,ax3000-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: /soc/system-controll=
er@50010000: failed to match any schema with compatible: ['bitmain,bm1880-s=
ctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: /soc/system-controll=
er@50010000/pinctrl@400: failed to match any schema with compatible: ['bitm=
ain,bm1880-pinctrl']
>> arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: gpio@50027000 (snps,=
dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: gpio@50027400 (snps,=
dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: gpio@50027800 (snps,=
dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dtb: gpio@4c0000 (blaize,=
blzp1600-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/blaize,blzp1600-gpi=
o.yaml#
>> arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dtb: gpio@4c0000 (blaize,=
blzp1600-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dtb: gpio@4c0000 (blaize,=
blzp1600-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dtb: gpio@74 (ti,tca9539)=
: #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dtb: gpio@74 (ti,tca9539)=
: #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dtb: gpio@74 (ti,tca9539)=
: #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dtb: gpio@75 (ti,tca9539)=
: #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dtb: gpio@75 (ti,tca9539)=
: #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dtb: gpio@75 (ti,tca9539)=
: #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: gpio@2300000 (fsl,ls1=
028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: gpio@2300000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: gpio@2300000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: gpio@2310000 (fsl,ls1=
028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: gpio@2310000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: gpio@2310000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: gpio@2320000 (fsl,ls1=
028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: gpio@2320000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: gpio@2300000 (fsl,ls1=
028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: gpio@2300000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: gpio@2300000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: gpio@2310000 (fsl,ls1=
028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: gpio@2310000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: gpio@2310000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: gpio@2320000 (fsl,ls1=
028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: gpio@2320000 (fsl,ls1=
028a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: gpio@2300000 (fsl,ls1=
088a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: gpio@2300000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: gpio@2300000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: gpio@2310000 (fsl,ls1=
088a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: gpio@2310000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: gpio@2310000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: gpio@2320000 (fsl,ls1=
088a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: gpio@2320000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: gpio@2300000 (fsl,ls1=
088a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: gpio@2300000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: gpio@2300000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: gpio@2310000 (fsl,ls1=
088a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: gpio@2310000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: gpio@2310000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: gpio@2320000 (fsl,ls1=
088a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: gpio@2320000 (fsl,ls1=
088a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: gpio@2300000 (fsl,ls=
2080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: gpio@2300000 (fsl,ls=
2080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: gpio@2300000 (fsl,ls=
2080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: gpio@2310000 (fsl,ls=
2080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: gpio@2310000 (fsl,ls=
2080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: gpio@2310000 (fsl,ls=
2080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: gpio@2320000 (fsl,ls=
2080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: gpio@2320000 (fsl,ls=
2080a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: gpio@2300000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: gpio@2310000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: gpio@2320000 (fsl,ls2=
080a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: gpio-expander@22 (nxp,p=
cal6524): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: gpio-expander@22 (nxp,p=
cal6524): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: gpio-expander@22 (nxp,p=
cal6524): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: gpio-expander@22 (nxp,p=
cal6524): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: gpio-expander@22 (nxp,p=
cal6524): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: gpio-expander@22 (nxp,p=
cal6524): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: gpio@2300000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: gpio@2310000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: gpio@2320000 (fs=
l,ls1028a-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:611.10-668.5: Warning (sim=
ple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: clock-controller@ffd=
10000 (intel,agilex-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: gpio@ffc03200 (snps,=
dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: gpio@ffc03300 (snps,=
dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dtb: gpio-controller@0 (s=
nps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:611.10-668.5: Warning (sim=
ple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: clock-controller@ffd100=
00 (intel,easic-n5x-clkmgr): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,easic-n5x.ya=
ml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: gpio@ffc03200 (snps,dw-=
apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: gpio-controller@0 (snps=
,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: gpio-controller@0 (snps=
,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: gpio@ffc03300 (snps,dw-=
apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: gpio-controller@0 (snps=
,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dtb: gpio-controller@0 (snps=
,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/lg/lg1312-ref.dtb: /: failed to match any schema wit=
h compatible: ['lge,lg1312-ref', 'lge,lg1312']
   arch/arm64/boot/dts/lg/lg1312-ref.dtb: /: failed to match any schema wit=
h compatible: ['lge,lg1312-ref', 'lge,lg1312']
   arch/arm64/boot/dts/lg/lg1312-ref.dtb: amba (simple-bus): $nodename:0: '=
amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)=
(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd400000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd400000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd400000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd410000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd410000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd410000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd420000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd420000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd420000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd430000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd430000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd430000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd440000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd440000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd440000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd450000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd450000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd450000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd460000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd460000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd460000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd470000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd470000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd470000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd480000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd480000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd480000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd490000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd490000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd490000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4a0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4a0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4a0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4b0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4b0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4b0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4c0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4c0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4c0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4d0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4d0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4d0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4e0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4e0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4e0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4f0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4f0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd4f0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd500000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd500000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd500000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd510000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd510000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1312-ref.dtb: gpio@fd510000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
--
   arch/arm64/boot/dts/lg/lg1313-ref.dtb: /: failed to match any schema wit=
h compatible: ['lge,lg1313-ref', 'lge,lg1313']
   arch/arm64/boot/dts/lg/lg1313-ref.dtb: /: failed to match any schema wit=
h compatible: ['lge,lg1313-ref', 'lge,lg1313']
   arch/arm64/boot/dts/lg/lg1313-ref.dtb: amba (simple-bus): $nodename:0: '=
amba' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)=
(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd400000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd400000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd400000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd410000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd410000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd410000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd420000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd420000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd420000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd430000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd430000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd430000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd440000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd440000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd440000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd450000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd450000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd450000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd460000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd460000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd460000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd470000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd470000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd470000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd480000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd480000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd480000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd490000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd490000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd490000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4a0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4a0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4a0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4b0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4b0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4b0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4c0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4c0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4c0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4d0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4d0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4d0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4e0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4e0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4e0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4f0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4f0000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd4f0000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd500000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd500000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd500000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd510000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd510000 (arm,pl061): #gpio-=
cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/lg/lg1313-ref.dtb: gpio@fd510000 (arm,pl061): #gpio-=
cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
--
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi:129.6-324.4: Warning (u=
nit_address_vs_reg): /soc: node has a reg or ranges property, but no unit n=
ame
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
0 (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
0 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
0 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
4 (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
4 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
4 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
8 (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
8 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
8 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
c (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
c (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@50=
c (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
0 (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
0 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
0 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
4 (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
4 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
4 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
8 (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
8 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
8 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
c (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
c (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@51=
c (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@52=
0 (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@52=
0 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@52=
0 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@52=
4 (brcm,bcm6345-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908-netgear-raxe500.dtb: gpio@52=
4 (brcm,bcm6345-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi:129.6-324.4: Warning (u=
nit_address_vs_reg): /soc: node has a reg or ranges property, but no unit n=
ame
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@500 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@500 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@500 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@504 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@504 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@504 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@508 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@508 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@508 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@50c (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@50c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@50c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@510 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@510 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@510 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@514 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@514 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@514 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@518 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@518 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@518 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@51c (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@51c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@51c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@520 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@520 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@520 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@524 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm94908.dtb: gpio@524 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@500 (brcm,bcm634=
5-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@500 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@500 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@504 (brcm,bcm634=
5-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@504 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@504 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@508 (brcm,bcm634=
5-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@508 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@508 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@50c (brcm,bcm634=
5-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@50c (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@50c (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@510 (brcm,bcm634=
5-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@510 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@510 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@514 (brcm,bcm634=
5-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@514 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@514 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@518 (brcm,bcm634=
5-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@518 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@518 (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@51c (brcm,bcm634=
5-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@51c (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dtb: gpio@51c (brcm,bcm634=
5-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@500 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@500 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@500 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@504 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@504 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@504 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@508 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@508 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@508 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@50c (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@50c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@50c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@510 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@510 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@510 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@514 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@514 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@514 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@518 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@518 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@518 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@51c (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@51c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dtb: gpio@51c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@500 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@500 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@500 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@504 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@504 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@504 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@508 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@508 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@508 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@50c (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@50c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@50c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@510 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@510 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@510 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@514 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@514 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@514 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@518 (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@518 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@518 (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@51c (brcm,bcm6345=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@51c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dtb: gpio@51c (brcm,bcm6345=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/mediatek/mt6779-evb.dtb: intpol-controller@c53a650 (=
mediatek,mt6779-sysirq): $nodename:0: 'intpol-controller@c53a650' does not =
match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/med=
iatek,mt6577-sysirq.yaml#
>> arch/arm64/boot/dts/mediatek/mt6779-evb.dtb: pinctrl@10005000 (mediatek,=
mt6779-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt6779-evb.dtb: pinctrl@10005000 (mediatek,=
mt6779-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt6779-evb.dtb: pinctrl@10005000 (mediatek,=
mt6779-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt6779-evb.dtb: /soc/clock-controller@11210=
000: failed to match any schema with compatible: ['mediatek,mt6779-audio', =
'syscon']
--
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: syscon@10006000 (syscon): c=
ompatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: pinctrl@10005000 (mediatek,=
mt6795-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6795-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: pinctrl@10005000 (mediatek,=
mt6795-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: pinctrl@10005000 (mediatek,=
mt6795-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: timer@10008000 (mediatek,mt=
6795-timer): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6795-timer', 'mediatek,mt6577-timer'] is too long
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt6577-timer', 'mediat=
ek,mt6765-timer', 'mediatek,mt6795-systimer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt2701-timer', 'mediat=
ek,mt6572-timer', 'mediatek,mt6580-timer', 'mediatek,mt6582-timer', 'mediat=
ek,mt6589-timer', 'mediatek,mt7623-timer', 'mediatek,mt8127-timer', 'mediat=
ek,mt8135-timer', 'mediatek,mt8173-timer', 'mediatek,mt8516-timer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt7629-timer', 'mediat=
ek,mt8183-timer', 'mediatek,mt8186-timer', 'mediatek,mt8188-timer', 'mediat=
ek,mt8192-timer', 'mediatek,mt8195-timer', 'mediatek,mt8196-timer', 'mediat=
ek,mt8365-systimer']
   	'mediatek,mt6765-timer' was expected
   	from schema $id: http://devicetree.org/schemas/timer/mediatek,timer.yam=
l#
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: /soc/timer@10008000: failed=
 to match any schema with compatible: ['mediatek,mt6795-timer', 'mediatek,m=
t6577-timer']
   arch/arm64/boot/dts/mediatek/mt6795-evb.dtb: intpol-controller@10200620 =
(mediatek,mt6795-sysirq): $nodename:0: 'intpol-controller@10200620' does no=
t match '^interrupt-controller(@[0-9a-f,]+)*$'
--
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000 (mediatek,=
mt6797-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'i=
2c7', 'uart0', 'uart1' do not match any of the regexes: '-[0-9]*$', '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000 (mediatek,=
mt6797-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000 (mediatek,=
mt6797-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000 (mediatek,=
mt6797-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: /power-controller@10006000:=
 failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: intpol-controller@10200620 =
(mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' does no=
t match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/med=
iatek,mt6577-sysirq.yaml#
--
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: pinctrl@10005000 (media=
tek,mt6797-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6'=
, 'i2c7', 'uart0', 'uart1' do not match any of the regexes: '-[0-9]*$', '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: pinctrl@10005000 (media=
tek,mt6797-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: pinctrl@10005000 (media=
tek,mt6797-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: pinctrl@10005000 (media=
tek,mt6797-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: /power-controller@10006=
000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: intpol-controller@10200=
620 (mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' doe=
s not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/med=
iatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11008000 (mediatek,=
mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@1100e000 (mediatek,=
mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11010000 (mediatek,=
mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: pinctrl@11d00000 (=
mediatek,mt7981-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7981-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: pinctrl@11d00000 (=
mediatek,mt7981-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: pinctrl@11d00000 (=
mediatek,mt7981-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: pinctrl@11d0000=
0 (mediatek,mt7981-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7981-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: pinctrl@11d0000=
0 (mediatek,mt7981-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: pinctrl@11d0000=
0 (mediatek,mt7981-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pinctrl@10005000 (mediatek,=
mt8183-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'mmc0', 'm=
mc0default', 'mmc1', 'mmc1default', 'pwm1', 'spi0', 'spi1', 'spi2', 'spi3',=
 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pinctrl@10005000 (mediatek,=
mt8183-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pinctrl@10005000 (mediatek,=
mt8183-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pinctrl@10005000 (mediatek,=
mt8183-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220=
000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys=
', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: /soc/audio-controller@11220=
000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,=
mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: syscon@13000000 (mediatek,m=
t8183-mfgcfg): 'power-domains' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: thermal-sensor (murata,ncp0=
3wf104): $nodename:0: 'thermal-sensor' does not match '^thermistor(.*)?$'
   	from schema $id: http://devicetree.org/schemas/hwmon/ntc-thermistor.yam=
l#
--
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pinctrl@10005000 (mediatek,=
mt8192-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8192-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pinctrl@10005000 (mediatek,=
mt8192-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pinctrl@10005000 (mediatek,=
mt8192-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic (mediatek,mt6359): '#s=
ound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: syscon@11210000 (mediatek,m=
t8192-audsys): 'mt8192-afe-pcm' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_cl=
k', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'aud_apll24m_clk=
', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk', 'aud_tml_cl=
k', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud_adc_hires_tml=
', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac_predis_clk', =
'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', 'aud_infra_26m=
_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_d4', 'top_mux_=
aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top_mux_aud_eng1'=
, 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2s0_m_sel', 'to=
p_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_m_sel', 'top_i=
2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_sel', 'top_i2s9=
_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_div2', 'top_apll=
12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_div5', 'top_apl=
l12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_div9', 'top_mu=
x_audio_h', 'top_clk26m_clk'] is too long
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pinctrl@10005000 (mediatek,=
mt8195-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pinctrl@10005000 (mediatek,=
mt8195-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: pinctrl@10005000 (mediatek,=
mt8195-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000 (media=
tek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 7=
97, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
--
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: mux-controller (mmio-mu=
x): #mux-control-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mux/reg-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@600104000 (microchi=
p,sparx5-spi): num-cs: 16 is greater than the maximum of 4
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@600104000 (microchi=
p,sparx5-spi): Unevaluated properties are not allowed ('reg-shift' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@1 (spi-mux): mux-co=
ntrols: [[10], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/spi-mux.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: spi@1 (spi-mux): Uneval=
uated properties are not allowed ('mux-controls' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-mux.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: pinctrl@6110101e0 (micr=
ochip,sparx5-pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/mscc,ocelot-pinc=
trl.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: pinctrl@6110101e0 (micr=
ochip,sparx5-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: pinctrl@6110101e0 (micr=
ochip,sparx5-pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@61101036c (microch=
ip,sparx5-sgpio): gpio@0:#gpio-cells: 3 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,sparx5=
-sgpio.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@61101036c (microch=
ip,sparx5-sgpio): gpio@1:#gpio-cells: 3 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,sparx5=
-sgpio.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@0 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@0 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@1 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@1 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@611010484 (microch=
ip,sparx5-sgpio): gpio@0:#gpio-cells: 3 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,sparx5=
-sgpio.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@611010484 (microch=
ip,sparx5-sgpio): gpio@1:#gpio-cells: 3 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,sparx5=
-sgpio.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@0 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@0 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@1 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@1 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@61101059c (microch=
ip,sparx5-sgpio): gpio@0:#gpio-cells: 3 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,sparx5=
-sgpio.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@61101059c (microch=
ip,sparx5-sgpio): gpio@1:#gpio-cells: 3 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/microchip,sparx5=
-sgpio.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@0 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@0 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@1 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: gpio@1 (microchip,sparx=
5-sgpio-bank): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: switch@600000000 (micro=
chip,sparx5-switch): reg-names:1: 'devices' was expected
   	from schema $id: http://devicetree.org/schemas/net/microchip,sparx5-swi=
tch.yaml#
   arch/arm64/boot/dts/microchip/sparx5_pcb125.dtb: switch@600000000 (micro=
chip,sparx5-switch): 'ethernet-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/net/microchip,sparx5-swi=
tch.yaml#
--
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: crmu (simple-b=
us): sdio1_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: crmu (simple-b=
us): crmu_ref25m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: crmu (simple-b=
us): hsls_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: crmu (simple-b=
us): $nodename:0: 'crmu' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localb=
us|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: /crmu/otp@1c40=
0: failed to match any schema with compatible: ['brcm,ocotp-v2']
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: /crmu/gpio@248=
00: failed to match any schema with compatible: ['brcm,iproc-gpio']
>> arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: gpio@24800 (br=
cm,iproc-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: gpio@24800 (br=
cm,iproc-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: fs4 (simple-bu=
s): raid@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: fs4 (simple-bu=
s): raid@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: fs4 (simple-bu=
s): raid@2: 'anyOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: usb (simple-bu=
s): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus=
|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: /usb/usb@2000:=
 failed to match any schema with compatible: ['brcm,bdc-v0.16']
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: /usb/usb@21000=
: failed to match any schema with compatible: ['brcm,bdc-v0.16']
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: hsls (simple-b=
us): $nodename:0: 'hsls' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localb=
us|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: pinconf@140000=
 (pinconf-single): $nodename:0: 'pinconf@140000' does not match '^(pinctrl|=
pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: /hsls/gpio@d00=
00: failed to match any schema with compatible: ['brcm,iproc-gpio']
>> arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: gpio@d0000 (br=
cm,iproc-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: gpio@d0000 (br=
cm,iproc-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: nand@360000 (b=
rcm,nand-iproc): $nodename:0: 'nand@360000' does not match '^nand-controlle=
r(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/brcm,brcmnand.yaml#
   arch/arm64/boot/dts/broadcom/stingray/bcm958802a802x.dtb: nand@360000 (b=
rcm,nand-iproc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,nand-iproc', 'brcm,brcmnand-v6.1'] is too short
   	'brcm,nand-iproc' is not one of ['brcm,brcmnand-v2.1', 'brcm,brcmnand-v=
2.2', 'brcm,brcmnand-v4.0', 'brcm,brcmnand-v5.0', 'brcm,brcmnand-v6.0', 'br=
cm,brcmnand-v6.1', 'brcm,brcmnand-v6.2', 'brcm,brcmnand-v7.0', 'brcm,brcmna=
nd-v7.1', 'brcm,brcmnand-v7.2', 'brcm,brcmnand-v7.3']
   	'brcm,nand-bcm63138' was expected
   	'brcm,nand-bcm63168' was expected
   	'brcm,brcmnand' was expected
   	'brcm,brcmnand-v6.1' is not one of ['brcm,brcmnand-v7.0', 'brcm,brcmnan=
d-v7.1']
--
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@40:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@80:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@100:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@140:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@180:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@1c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@200:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@240:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@280:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@2c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@300:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@340:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@0: #gpio-cells: [2=
] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@0: #gpio-cells: [2=
] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@40: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@40: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@80: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@80: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@c0: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@c0: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@100: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@100: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@140: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@140: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@180: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@180: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@1c0: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@1c0: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@200: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@200: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@240: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@240: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@280: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@280: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@2c0: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@2c0: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@300: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@300: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@340: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: gpio@340: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@40:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@80:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@100:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@140:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@180:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@1c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@200:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@240:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@280:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@2c0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@300:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: pinctrl@40040000 (nuvot=
on,ma35d1-pinctrl): gpio@340:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,ma35d1-p=
inctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@0: #gpio-cells: [2=
] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@0: #gpio-cells: [2=
] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@40: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@40: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@80: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@80: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@c0: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@c0: #gpio-cells: [=
2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@100: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@100: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@140: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@140: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@180: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@180: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@1c0: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@1c0: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@200: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@200: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@240: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@240: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@280: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@280: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@2c0: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@2c0: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@300: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@300: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@340: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dtb: gpio@340: #gpio-cells: =
[2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: ahb (simple-bus): a=
pb:ranges: [[0, 0, 4026531840, 3145728], [4293918720, 0, 4293918720, 90112]=
] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: timer@8000 (nuvoton=
,npcm845-timer): 'clock-names' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/nuvoton,npcm7xx-ti=
mer.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@8=
01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'n=
uvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@8=
01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'n=
uvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@9=
01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'n=
uvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@9=
01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'n=
uvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a=
01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'n=
uvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a=
01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'n=
uvoton,npcm750-wdt']
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: pinctrl@f0010000 (n=
uvoton,npcm845-pinctrl): gpio@f0010000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-=
pinctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: pinctrl@f0010000 (n=
uvoton,npcm845-pinctrl): gpio@f0011000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-=
pinctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: pinctrl@f0010000 (n=
uvoton,npcm845-pinctrl): gpio@f0012000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-=
pinctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: pinctrl@f0010000 (n=
uvoton,npcm845-pinctrl): gpio@f0013000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-=
pinctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: pinctrl@f0010000 (n=
uvoton,npcm845-pinctrl): gpio@f0014000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-=
pinctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: pinctrl@f0010000 (n=
uvoton,npcm845-pinctrl): gpio@f0015000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-=
pinctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: pinctrl@f0010000 (n=
uvoton,npcm845-pinctrl): gpio@f0016000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-=
pinctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: pinctrl@f0010000 (n=
uvoton,npcm845-pinctrl): gpio@f0017000:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-=
pinctrl.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0010000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0010000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0011000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0011000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0012000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0012000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0013000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0013000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0014000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0014000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0015000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0015000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0016000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0016000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0017000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: gpio@f0017000: #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /host1x@50000000/tse=
c@54500000: failed to match any schema with compatible: ['nvidia,tegra210-t=
sec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpu@57000000 (nvidia=
,gm20b): clock-names: ['gpu', 'pwr', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpu@57000000 (nvidia=
,gm20b): clocks: [[3, 184], [3, 299], [3, 189]] is too long
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpu@57000000 (nvidia=
,gm20b): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,gm20b'] is too short
   	'nvidia,gk20a' was expected
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /interrupt-controlle=
r@60004000: failed to match any schema with compatible: ['nvidia,tegra210-i=
ctlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpio@6000d000 (nvidi=
a,tegra210-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra20-gpio=
=2Eyaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpio@6000d000 (nvidi=
a,tegra210-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: gpio@6000d000 (nvidi=
a,tegra210-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /dma@60020000: faile=
d to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,t=
egra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /dma@60020000: faile=
d to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,t=
egra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /memory-controller@7=
0019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: external-memory-cont=
roller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any =
of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidi=
a,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: clock@70110000 (nvid=
ia,tegra210-dfll): reset-names: ['dvco', 'dfll'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra124-df=
ll.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: clock@70110000 (nvid=
ia,tegra210-dfll): resets: [[3, 224], [3, 155]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra124-df=
ll.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /host1x@50000000/tsec@545=
00000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: gpu@57000000 (nvidia,gm20=
b): clock-names: ['gpu', 'pwr', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: gpu@57000000 (nvidia,gm20=
b): clocks: [[3, 184], [3, 299], [3, 189]] is too long
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: gpu@57000000 (nvidia,gm20=
b): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,gm20b'] is too short
   	'nvidia,gk20a' was expected
   	from schema $id: http://devicetree.org/schemas/nvidia,gk20a.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /interrupt-controller@600=
04000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: gpio@6000d000 (nvidia,teg=
ra210-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra20-gpio=
=2Eyaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: gpio@6000d000 (nvidia,teg=
ra210-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: gpio@6000d000 (nvidia,teg=
ra210-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /dma@60020000: failed to =
match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra1=
48-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /dma@60020000: failed to =
match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra1=
48-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /memory-controller@700190=
00: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: external-memory-controlle=
r@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of th=
e regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidi=
a,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: clock@70110000 (nvidia,te=
gra210-dfll): reset-names: ['dvco', 'dfll'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra124-df=
ll.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: clock@70110000 (nvidia,te=
gra210-dfll): resets: [[3, 224], [3, 155]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra124-df=
ll.yaml#
--
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: gpio@2200000 (nvidia,te=
gra234-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpi=
o.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: gpio@2200000 (nvidia,te=
gra234-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: gpio@2200000 (nvidia,te=
gra234-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6800000 (nvidi=
a,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6900000 (nvidi=
a,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ethernet@6a00000 (nvidi=
a,tegra234-mgbe): 'snps,axi-config', 'stmmac-axi-config' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nvidia,tegra234-mgbe=
=2Eyaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: gpio@c2f0000 (nvidia,te=
gra234-gpio-aon): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpi=
o.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: gpio@c2f0000 (nvidia,te=
gra234-gpio-aon): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: gpio@c2f0000 (nvidia,te=
gra234-gpio-aon): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1604.27-1652.6: Warning (avoid_unn=
ecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecess=
ary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg=
" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:463.26-466.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address =
(also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:478.26-481.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address =
(also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:491.26-494.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address =
(also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:503.26-506.6: Warning (unique_unit=
_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address =
(also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1591.11-1601.7: Warning (graph_chi=
ld_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/po=
rts: graph node has single child node 'port@0', #address-cells/#size-cells =
are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: pinctrl@1000000 (qcom,msm8916-=
pinctrl): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8916-pin=
ctrl.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: pinctrl@1000000 (qcom,msm8916-=
pinctrl): Unevaluated properties are not allowed ('#gpio-cells', '#interrup=
t-cells', 'gpio-controller', 'gpio-ranges', 'interrupt-controller' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8916-pin=
ctrl.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: pinctrl@1000000 (qcom,msm8916-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: pinctrl@1000000 (qcom,msm8916-=
pinctrl): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: pmic@0 (qcom,pm8916): mpps@a00=
0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: pmic@0 (qcom,pm8916): gpio@c00=
0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: mpps@a000 (qcom,pm8916-mpp): #=
gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.ya=
ml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: mpps@a000 (qcom,pm8916-mpp): #=
gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: mpps@a000 (qcom,pm8916-mpp): #=
gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: gpio@c000 (qcom,pm8916-gpio): =
#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: gpio@c000 (qcom,pm8916-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: gpio@c000 (qcom,pm8916-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: pmic@0 (qcom,pm8150): gpio@c00=
0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: gpio@c000 (qcom,pm8150-gpio): =
#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: gpio@c000 (qcom,pm8150-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: gpio@c000 (qcom,pm8150-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: pinctrl@f000000 (qcom,qdu1000-=
tlmm): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,qdu1000-tlm=
m.yaml#
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: pinctrl@f000000 (qcom,qdu1000-=
tlmm): Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-c=
ells', 'gpio-controller', 'gpio-ranges', 'interrupt-controller', 'wakeup-pa=
rent' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,qdu1000-tlm=
m.yaml#
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: pinctrl@f000000 (qcom,qdu1000-=
tlmm): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/qdu1000-idp.dtb: pinctrl@f000000 (qcom,qdu1000-=
tlmm): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: pmic@0 (qcom,pm8150): gpio@c00=
0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: gpio@c000 (qcom,pm8150-gpio): =
#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.y=
aml#
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: gpio@c000 (qcom,pm8150-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: gpio@c000 (qcom,pm8150-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: pinctrl@f000000 (qcom,qdu1000-=
tlmm): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,qdu1000-tlm=
m.yaml#
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: pinctrl@f000000 (qcom,qdu1000-=
tlmm): Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-c=
ells', 'gpio-controller', 'gpio-ranges', 'interrupt-controller', 'wakeup-pa=
rent' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,qdu1000-tlm=
m.yaml#
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: pinctrl@f000000 (qcom,qdu1000-=
tlmm): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/qru1000-idp.dtb: pinctrl@f000000 (qcom,qdu1000-=
tlmm): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/qcom/sm4450-qrd.dtb: pinctrl@f100000 (qcom,sm4450-tl=
mm): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm4450-tlmm=
=2Eyaml#
>> arch/arm64/boot/dts/qcom/sm4450-qrd.dtb: pinctrl@f100000 (qcom,sm4450-tl=
mm): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/qcom/sm4450-qrd.dtb: pinctrl@f100000 (qcom,sm4450-tl=
mm): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio@3020=
000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio-cont=
roller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio-cont=
roller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio@3021=
000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio-cont=
roller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio-cont=
roller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio@3022=
000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio-cont=
roller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio-cont=
roller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio@3023=
000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio-cont=
roller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: gpio-cont=
roller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: /: failed to match any =
schema with compatible: ['marvell,berlin4ct-dmp', 'marvell,berlin4ct', 'mar=
vell,berlin']
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: /: failed to match any =
schema with compatible: ['marvell,berlin4ct-dmp', 'marvell,berlin4ct', 'mar=
vell,berlin']
>> arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio@400 (snps,dw-apb-g=
pio): gpio-port@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio-port@0 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio-port@0 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio@800 (snps,dw-apb-g=
pio): gpio-port@1:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio-port@1 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio-port@1 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio@c00 (snps,dw-apb-g=
pio): gpio-port@2:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio-port@2 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio-port@2 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio@1000 (snps,dw-apb-=
gpio): gpio-port@3:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio-port@3 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-dmp.dtb: gpio-port@3 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
--
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: /: failed to match any =
schema with compatible: ['marvell,berlin4ct-stb', 'marvell,berlin4ct', 'mar=
vell,berlin']
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: /: failed to match any =
schema with compatible: ['marvell,berlin4ct-stb', 'marvell,berlin4ct', 'mar=
vell,berlin']
>> arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio@400 (snps,dw-apb-g=
pio): gpio-port@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
>> arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio-port@0 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio-port@0 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio@800 (snps,dw-apb-g=
pio): gpio-port@1:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio-port@1 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio-port@1 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio@c00 (snps,dw-apb-g=
pio): gpio-port@2:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio-port@2 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio-port@2 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio@1000 (snps,dw-apb-=
gpio): gpio-port@3:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.ya=
ml#
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio-port@3 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/synaptics/berlin4ct-stb.dtb: gpio-port@3 (snps,dw-ap=
b-gpio-port): #gpio-cells: [2] is not of type 'integer'
--
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba=
,tmpv7708-pinctrl): 'pwm_mux' does not match any of the regexes: '-pins$', =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti=
-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba=
,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|=
pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti=
-pinctrl.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: gpio@28020000 (toshiba=
,gpio-tmpv7708): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/toshiba,gpio-viscon=
ti.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: gpio@28020000 (toshiba=
,gpio-tmpv7708): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: gpio@28020000 (toshiba=
,gpio-tmpv7708): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (tos=
hiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwm=
ac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: wdt@28330000 (toshiba,=
visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(timer|watchdog=
)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,viscont=
i-wdt.yaml#
--
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: gpio@f19d0=
000 (xlnx,versal-gpio-1.0): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-zynq.yaml#
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: gpio@f19d0=
000 (xlnx,versal-gpio-1.0): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: gpio@f19d0=
000 (xlnx,versal-gpio-1.0): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: gpio@f1020=
000 (xlnx,pmc-gpio-1.0): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-zynq.yaml#
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: gpio@f1020=
000 (xlnx,pmc-gpio-1.0): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: gpio@f1020=
000 (xlnx,pmc-gpio-1.0): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
