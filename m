Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DE349CF1
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699155; cv=none; b=agS9LFQ9qFEyihhl6Zf4UBtM1NiOO6skHL5RWrGvQiGvDaOW2bcU5UgZHLUjz/N1clYhef6L/KnIqYFvsOb4reL31qmjCN5ZXLbBKZqLt5Qnv1pVz7bMFQtRyunr87tvHPMfdiGneD0CLKUROB+DdMxdy+FgH6c8rIInvT3G3B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699155; c=relaxed/simple;
	bh=9br5sQs7V7Nvgjc0ZGfBbWPL7nt11JpHNwVb9l1D/YM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l0IdeUtuP6cJNcx0XMu60fuvcZCEs1jb3zOKyTeYxrhuIbR8T7sBYDRoZBfcoF9ReynMNTc9kV6q861wWcuHD0pJ3cOv8IjahseQM/q03QKq7V47PVYa4p5e37tqVM0ji2+o85viimFXxA4GL3c2q8qJTVX5fbZBJoQjxJ4B96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwrVblsu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwrVblsu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783699154; x=1815235154;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9br5sQs7V7Nvgjc0ZGfBbWPL7nt11JpHNwVb9l1D/YM=;
  b=gwrVblsuUYUsEbwk9oexA9Ig8ZCSnasMRA6BUJ4ZZ1VOkDEQCiJKsWwm
   p7KKixVJfoPoYcxRe9Lp9OWATuPbIXGLxqCMG6ICRA2eg2yasMWEoNImm
   xOAcv/KES7WOvIHQRBTiFGnNFILyb3xZxTLnPthsujr8JVz98TShlF9e2
   HuDL04eO6sGwjr3dkJJ4nFj3wb7IHA/By+oI9Mx3kglzLMptKIp1O+iek
   ejHMaX+OELhuXLnX0e66lnADb2fubBdamHtuvFLE9UyF5xWSgNWFKopt2
   c9XfFAOR6V7fk/se5GzH9p38UZKi2WmVWPyitpvmVcNS9Mkn7pFAcgFxR
   g==;
X-CSE-ConnectionGUID: 7VcJmBInTMqTDB5GlG61nw==
X-CSE-MsgGUID: LT1mQWUeTtasRJ6X+GYReQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84179568"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84179568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 08:59:13 -0700
X-CSE-ConnectionGUID: OrTdvTKARWGIXwMPatBgkw==
X-CSE-MsgGUID: mSEoggNMTlmD9GB99M2Uag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255015732"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 10 Jul 2026 08:59:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiDd7-00000000J3T-14hz;
	Fri, 10 Jul 2026 15:59:09 +0000
Date: Fri, 10 Jul 2026 23:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: Warning
 (interrupt_map): Failed prerequisite 'interrupt_provider'
Message-ID: <202607102302.dRH4eFpy-lkp@intel.com>
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
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   5 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 weeks ago
config: powerpc-randconfig-r111-20260710 (https://download.01.org/0day-ci/a=
rchive/20260710/202607102302.dRH4eFpy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e=
6e6dabdc02153552a64fc74ff5c7532447eed)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260710/202607102302.dRH4eFpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607102302.dRH4eFpy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:128.11-132.4: Warning (simple_b=
us_reg): /localbus@ffe05000/nand@4,0: simple-bus unit address format error,=
 expected "400000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:134.11-138.4: Warning (simple_b=
us_reg): /localbus@ffe05000/nand@5,0: simple-bus unit address format error,=
 expected "500000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:140.11-144.4: Warning (simple_b=
us_reg): /localbus@ffe05000/nand@6,0: simple-bus unit address format error,=
 expected "600000000"
   arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi:164.23-166.4: Warning (sim=
ple_bus_reg): /soc8572@ffe00000/gpio-controller@f000: missing or empty reg/=
ranges property
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:155.24-158.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@0: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@0)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:159.24-162.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@1: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@1)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:163.24-166.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@2: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@2)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:167.24-170.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@3: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@3)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:375.11-425.6: Warning (interrup=
t_provider): /pcie@ffe08000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' fou=
nd, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: Warning (interrupt_m=
ap): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:128.11-132.4: Warning (simple_b=
us_reg): /localbus@ffe05000/nand@4,0: simple-bus unit address format error,=
 expected "400000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:134.11-138.4: Warning (simple_b=
us_reg): /localbus@ffe05000/nand@5,0: simple-bus unit address format error,=
 expected "500000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:140.11-144.4: Warning (simple_b=
us_reg): /localbus@ffe05000/nand@6,0: simple-bus unit address format error,=
 expected "600000000"
   arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi:164.23-166.4: Warning (sim=
ple_bus_reg): /soc8572@ffe00000/gpio-controller@f000: missing or empty reg/=
ranges property
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:155.24-158.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@0: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@0)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:159.24-162.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@1: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@1)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:163.24-166.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@2: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@2)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:167.24-170.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@ffe00000/mdio@24520/ethernet-phy@3: dupli=
cate unit-address (also used in node /soc8572@ffe00000/mdio@24520/sgmii-phy=
@3)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:375.11-425.6: Warning (interrup=
t_provider): /pcie@ffe08000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' fou=
nd, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: Warning (interrupt_m=
ap): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:89.11-126.4: Warning (simple_bu=
s_reg): /localbus@fffe05000/nand@2,0: simple-bus unit address format error,=
 expected "200000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:128.11-132.4: Warning (simple_b=
us_reg): /localbus@fffe05000/nand@4,0: simple-bus unit address format error=
, expected "400000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:134.11-138.4: Warning (simple_b=
us_reg): /localbus@fffe05000/nand@5,0: simple-bus unit address format error=
, expected "500000000"
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:140.11-144.4: Warning (simple_b=
us_reg): /localbus@fffe05000/nand@6,0: simple-bus unit address format error=
, expected "600000000"
   arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi:164.23-166.4: Warning (sim=
ple_bus_reg): /soc8572@fffe00000/gpio-controller@f000: missing or empty reg=
/ranges property
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:155.24-158.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@fffe00000/mdio@24520/ethernet-phy@0: dupl=
icate unit-address (also used in node /soc8572@fffe00000/mdio@24520/sgmii-p=
hy@0)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:159.24-162.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@fffe00000/mdio@24520/ethernet-phy@1: dupl=
icate unit-address (also used in node /soc8572@fffe00000/mdio@24520/sgmii-p=
hy@1)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:163.24-166.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@fffe00000/mdio@24520/ethernet-phy@2: dupl=
icate unit-address (also used in node /soc8572@fffe00000/mdio@24520/sgmii-p=
hy@2)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:167.24-170.5: Warning (unique_u=
nit_address_if_enabled): /soc8572@fffe00000/mdio@24520/ethernet-phy@3: dupl=
icate unit-address (also used in node /soc8572@fffe00000/mdio@24520/sgmii-p=
hy@3)
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtsi:375.11-425.6: Warning (interrup=
t_provider): /pcie@fffe08000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' fo=
und, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: Warning (interrupt_map): Fa=
iled prerequisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
