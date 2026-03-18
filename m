Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5D81A285
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 00:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773794584; cv=none; b=VjQhEYU+fcadMs3DCf8aooF7HVT0poxmjLReg1/uKO/W8bFluiIYmvA8T/kIdzxCIqS4qM2U0iMKAB6LuUOhtHukxkNtq1PATOkXRi1MxggrmQOZtD3kje3BMUmb6SI722ZKoCbkV2QQQAkcAVdNyhilkD4CaXvcAixztBRRUZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773794584; c=relaxed/simple;
	bh=0ZjL7sl0Hd/eQ7Ldt3JulR29GabCPNULkF9JWA+bOh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=toTj6Oj7dO9pSnHR6n3jfXudiiaEQiMBK27fc2+FKtJrUXxe6HmoMBvx5aYsyZA/eMSLGon3vqOTWbJgJ/uu+tlAb9nnDaUkSyeBXGNT6VyeI7ykMTqbybNCG04uFNVRbA9TSjajmVWa4hekil7b4Pic5S1tRX/XV4jdA3YrjQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3nrnez2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3nrnez2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773794580; x=1805330580;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0ZjL7sl0Hd/eQ7Ldt3JulR29GabCPNULkF9JWA+bOh4=;
  b=I3nrnez22ak3cacYRcOpPvhTMwGXPS6zpZhFApoXjuRPHM2D6EQSQpQ5
   M8+ZZDiK3agVPViEYbNbeYjgDVavIEEUZrORK4V7qLrKQvfD+L49TrInn
   Wlc1AP45088bFmJENryFLXo3B6yoy1UU0vqObb/jUkGu1zIYQj/JScDjk
   sHsREevtmSBOK+zQhJpEWtqBKHw5Gz7DnOYJc2gIWfiKuEVXhENv3s3+i
   PXHj2J4ZcfOvtmKB5TaUApfEK6xUDzA1mf8v8B1bsLnmBbmMVCWic0aAa
   w/ts3CQ5t1+xjLzRowwcKqdwDaDqaPQ2+o7yzi49zZnhlA4jbSn+VXqwK
   Q==;
X-CSE-ConnectionGUID: mHMoiwUAQ8WnfCzQMpQZzg==
X-CSE-MsgGUID: teRU0si1SWam+L3Sy14fLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85157262"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85157262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 17:43:00 -0700
X-CSE-ConnectionGUID: tAzqvSA5SzCFvqUF2fsqtQ==
X-CSE-MsgGUID: lvnDOmmUTCaQV8nmRgQLmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="260334249"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Mar 2026 17:43:00 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ezw-000000002Fh-2xib;
	Wed, 18 Mar 2026 00:42:56 +0000
Date: Wed, 18 Mar 2026 08:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] powerpc: dts: Build devicetrees of enabled platforms
Message-ID: <202603180817.i3dmFzfs-lkp@intel.com>
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
In-Reply-To: <20260315-mpc83xx-dtb-v4-1-243849be4280@posteo.net>
References: <20260315-mpc83xx-dtb-v4-1-243849be4280@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
CC: devicetree@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-dts-Build-devicetrees-of-enabled-platforms/20260316-054914
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260315-mpc83xx-dtb-v4-1-243849be4280%40posteo.net
patch subject: [PATCH v4] powerpc: dts: Build devicetrees of enabled platforms
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-002-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180817.i3dmFzfs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180817.i3dmFzfs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603180817.i3dmFzfs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:89.11-126.4: Warning (simple_bus_reg): /localbus@fffe05000/nand@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:128.11-132.4: Warning (simple_bus_reg): /localbus@fffe05000/nand@4,0: simple-bus unit address format error, expected "400000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:134.11-138.4: Warning (simple_bus_reg): /localbus@fffe05000/nand@5,0: simple-bus unit address format error, expected "500000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:140.11-144.4: Warning (simple_bus_reg): /localbus@fffe05000/nand@6,0: simple-bus unit address format error, expected "600000000"
   arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi:164.23-166.4: Warning (simple_bus_reg): /soc8572@fffe00000/gpio-controller@f000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:155.24-158.5: Warning (unique_unit_address_if_enabled): /soc8572@fffe00000/mdio@24520/ethernet-phy@0: duplicate unit-address (also used in node /soc8572@fffe00000/mdio@24520/sgmii-phy@0)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:159.24-162.5: Warning (unique_unit_address_if_enabled): /soc8572@fffe00000/mdio@24520/ethernet-phy@1: duplicate unit-address (also used in node /soc8572@fffe00000/mdio@24520/sgmii-phy@1)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:163.24-166.5: Warning (unique_unit_address_if_enabled): /soc8572@fffe00000/mdio@24520/ethernet-phy@2: duplicate unit-address (also used in node /soc8572@fffe00000/mdio@24520/sgmii-phy@2)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:167.24-170.5: Warning (unique_unit_address_if_enabled): /soc8572@fffe00000/mdio@24520/ethernet-phy@3: duplicate unit-address (also used in node /soc8572@fffe00000/mdio@24520/sgmii-phy@3)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:375.11-425.6: Warning (interrupt_provider): /pcie@fffe08000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:128.11-132.4: Warning (simple_bus_reg): /localbus@ffe05000/nand@4,0: simple-bus unit address format error, expected "400000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:134.11-138.4: Warning (simple_bus_reg): /localbus@ffe05000/nand@5,0: simple-bus unit address format error, expected "500000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:140.11-144.4: Warning (simple_bus_reg): /localbus@ffe05000/nand@6,0: simple-bus unit address format error, expected "600000000"
   arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi:164.23-166.4: Warning (simple_bus_reg): /soc8572@ffe00000/gpio-controller@f000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:155.24-158.5: Warning (unique_unit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@0: duplicate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy@0)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:159.24-162.5: Warning (unique_unit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@1: duplicate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy@1)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:163.24-166.5: Warning (unique_unit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@2: duplicate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy@2)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:167.24-170.5: Warning (unique_unit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@3: duplicate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy@3)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:375.11-425.6: Warning (interrupt_provider): /pcie@ffe08000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:128.11-132.4: Warning (simple_bus_reg): /localbus@ffe05000/nand@4,0: simple-bus unit address format error, expected "400000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:134.11-138.4: Warning (simple_bus_reg): /localbus@ffe05000/nand@5,0: simple-bus unit address format error, expected "500000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:140.11-144.4: Warning (simple_bus_reg): /localbus@ffe05000/nand@6,0: simple-bus unit address format error, expected "600000000"
   arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi:164.23-166.4: Warning (simple_bus_reg): /soc8572@ffe00000/gpio-controller@f000: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:155.24-158.5: Warning (unique_unit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@0: duplicate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy@0)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:159.24-162.5: Warning (unique_unit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@1: duplicate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy@1)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:163.24-166.5: Warning (unique_unit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@2: duplicate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy@2)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:167.24-170.5: Warning (unique_unit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@3: duplicate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy@3)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:375.11-425.6: Warning (interrupt_provider): /pcie@ffe08000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
