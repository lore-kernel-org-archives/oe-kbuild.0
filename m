Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E822378839
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 05:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660021; cv=none; b=uxys6WqUGH/jgz11LMvhHhpxxPKSF+wft8B1/r1ev30tKpyEYHLttjwLBgO0AuoiNaYlcgpPio1yRW1VojzB1RhR0riau0hVK7EW/NI51hiHeLLXpoQNDFFbm72Ojiiam75lEAR/ZnvXkRfL55KqJU2VYryAb53oDrmxA6lsmCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660021; c=relaxed/simple;
	bh=MBaZAD5tjEk0cr/IQwMSBiJApc6ko8jBlsc4kNhY1Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NjNzvbWeDQoNQ4pKuRv6uK6M7ewJgi4LF7/6FAJUbx2p2nxUcTwvLyamaxLDPYEhHtZmQTZ4BBLyef7v4anIlYjuK4jq/AsVtZxw/Vs3I+jjZUM6n473DBtViL5+dSK7YGDdm91xwK1s2Beao/A+s63GseUXLCdOsghRUdotdbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ei/BZONS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ei/BZONS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783660019; x=1815196019;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MBaZAD5tjEk0cr/IQwMSBiJApc6ko8jBlsc4kNhY1Ok=;
  b=Ei/BZONS9qu/cwxsjVWqE8MJIoM16qbnnY26R7XZJjk6BxNSyMKThyBZ
   Xf/PNEbnkw4hYcIxDKwQe2RKo118/onOo4f+LQ4q/4LjCoHxeP4nm0qnh
   JicH9il+sYrsns2Acar/OgbumAVkPapMvDyQKAlKVtxzPNRHZGowUaaUR
   VA57DTMHx/1xeWAAKl4BHHB7W6EcL6dT+zcj5LL1uo+RpQ1VUpjWHWjmX
   iZMEbzIXuAZvDr8eXsYD9c9G43vrT9lApocovsDMG4hQ+bqKLlICw3IzN
   OHQT4t+chGHcB6CGcYAHKxChNOXX1dhzHusf0LyDSB1z9N0cstHHOXXAy
   w==;
X-CSE-ConnectionGUID: zCsqnDucSuii13aRW4pc6Q==
X-CSE-MsgGUID: yBJR7NSeTIC4ap1cKsAo+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107154693"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107154693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 22:06:59 -0700
X-CSE-ConnectionGUID: Ei7mJRlsRiKn3A5mWHug+g==
X-CSE-MsgGUID: Ba5F0BuuTfyrbXVy7gxHMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258671507"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2026 22:06:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi3Rs-00000000IWN-1JJ0;
	Fri, 10 Jul 2026 05:06:52 +0000
Date: Fri, 10 Jul 2026 13:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning
 (unit_address_format): Failed prerequisite 'pci_bridge'
Message-ID: <202607101355.wqzCP6JP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   5 weeks ago
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: powerpc-randconfig-r063-20260710 (https://download.01.org/0day-ci/a=
rchive/20260710/202607101355.wqzCP6JP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e=
6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607101355.wqzCP6JP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:23.9-26.4: Warning (unit_address=
_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:44.16-46.4: Warning (unit_=
address_vs_reg): /soc@fef00000/dma-channel@0: node has a unit name, but no =
reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:47.17-49.4: Warning (unit_=
address_vs_reg): /soc@fef00000/dma-channel@80: node has a unit name, but no=
 reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:50.18-52.4: Warning (unit_=
address_vs_reg): /soc@fef00000/dma-channel@100: node has a unit name, but n=
o reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:53.18-55.4: Warning (unit_=
address_vs_reg): /soc@fef00000/dma-channel@180: node has a unit name, but n=
o reg or ranges property
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (unit_addr=
ess_vs_reg): /pcie@fef09000: node has a unit name, but no reg or ranges pro=
perty
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (pci_bridg=
e): /pcie@fef09000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:129.9-143.4: Warning (pci_=
bridge): /pcie@fef09000/pcie@0: missing ranges for PCI bridge (or not a bri=
dge)
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (unit_address_format): =
Failed prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (pci_device_reg): Faile=
d prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (pci_device_bus_num): F=
ailed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:56.13-72.5: Warning (simple_bus_=
reg): /localbus@fef05000/flash@1,0: simple-bus unit address format error, e=
xpected "100000000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:74.13-78.5: Warning (simple_bus_=
reg): /localbus@fef05000/nvram@3,0: simple-bus unit address format error, e=
xpected "300000000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:80.12-83.5: Warning (simple_bus_=
reg): /localbus@fef05000/fpga@4,0: simple-bus unit address format error, ex=
pected "400000000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:85.19-91.5: Warning (simple_bus_=
reg): /localbus@fef05000/watchdog@4,2000: simple-bus unit address format er=
ror, expected "400002000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:101.23-108.5: Warning (simple_bu=
s_reg): /localbus@fef05000/pic@4,4000: simple-bus unit address format error=
, expected "400004000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:109.26-114.5: Warning (simple_bu=
s_reg): /localbus@fef05000/gpio@7,14000: simple-bus unit address format err=
or, expected "700014000"
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:44.16-46.4: Warning (simpl=
e_bus_reg): /soc@fef00000/dma-channel@0: missing or empty reg/ranges proper=
ty
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:47.17-49.4: Warning (simpl=
e_bus_reg): /soc@fef00000/dma-channel@80: missing or empty reg/ranges prope=
rty
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:50.18-52.4: Warning (simpl=
e_bus_reg): /soc@fef00000/dma-channel@100: missing or empty reg/ranges prop=
erty
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:53.18-55.4: Warning (simpl=
e_bus_reg): /soc@fef00000/dma-channel@180: missing or empty reg/ranges prop=
erty
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:22.12-26.4: Warning (uniqu=
e_unit_address_if_enabled): /soc@fef00000/mcm-law@0: duplicate unit-address=
 (also used in node /soc@fef00000/dma-channel@0)
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:195.22-209.4: Warning (interrupt=
_provider): /pcie@fef08000: '#interrupt-cells' found, but node is not an in=
terrupt provider
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (interrupt=
_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an in=
terrupt provider
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
