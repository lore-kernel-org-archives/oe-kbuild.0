Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E2E35898
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jul 2026 04:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783311639; cv=none; b=h/1bleZH5yTYEf8VrQBlW5/XKrJYMlWdmRaj0lrTZDi3oi+Ux/JGpxKOmEJGR7p/dun9En4mcYSeMJ55UuWHf4s2AxwT9O1Seo7Fpd+0jXfKqn+GecGQh49d/vn5yFMfSDB7e+pd5izXvqSb9TMoYPR+5qCipGw0dzA3fNP24FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783311639; c=relaxed/simple;
	bh=q8Hf+2xU/g5chcXmKzo1jzMvTiiudq/T5kZBZBhjtWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wjd57ys3UMJgpT0rjQNosml/ob6vgU+LwhFJdArBrC81AMlWb6TBQHXpUnLyPXKZ5Q62X1Lp+5qzToJf1a/MHzB1hPwMW0nRYRDbsTm0zi6qpjavakGP6VIfXS6YIqZXDbz7bW6h/cgEfE1eXDP2vN2e9R0dbgW9Y8Eg2Dqj7GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmoAjwpK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmoAjwpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783311637; x=1814847637;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q8Hf+2xU/g5chcXmKzo1jzMvTiiudq/T5kZBZBhjtWw=;
  b=nmoAjwpKmVN2uRtjP6e2BmEta3fhCdTMHQAtD/lw0SBLSMWfqWEl33Gi
   WMY25WYJUMijzO4HiC7afv2RGiJemcC4TBbk7SLbgj3DzzhOVCNXJM6NU
   aLuVFIR714Ggyr0wQuUi+9Bx2vpt62/EAforWY4PFinagB+dGDEBel9Gu
   qAqMmBKHjbVlD/nxIh8NFrXtzrBX/FJQN8T/a00vc81BrSZ7QqsdYSJk+
   Tya5uzL3IxChIKwTx0R9RdnG75/iTa9Gd8xIew2KQE+zdViWpuxY8roGO
   BpPphKAjsZl1J5+Nbt9sSrLI91oacVxLPU3r2kLmy7Y8uo3tLjMJKdtBB
   A==;
X-CSE-ConnectionGUID: MBpVuQr1S2u6luQJvrldHw==
X-CSE-MsgGUID: P6+2+eP3T62c7N7aSwW15g==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87617717"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="87617717"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 21:20:37 -0700
X-CSE-ConnectionGUID: msk4bCFPSCutE9qfVTa9uA==
X-CSE-MsgGUID: oxeDbmtDTLKlRakiqmdpXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="255544602"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jul 2026 21:20:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgaor-00000000E4x-0ZY8;
	Mon, 06 Jul 2026 04:20:33 +0000
Date: Mon, 06 Jul 2026 12:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/a3m071.dtb: Warning (interrupt_map):
 Failed prerequisite 'interrupt_provider'
Message-ID: <202607061248.jbrKfwKB-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   5 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
config: powerpc-lite5200b_defconfig (https://download.01.org/0day-ci/archiv=
e/20260706/202607061248.jbrKfwKB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2=
fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260706/202607061248.jbrKfwKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607061248.jbrKfwKB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_=
vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/a3m071.dts:98.13-125.5: Warning (simple_bus_reg): =
/localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/a3m071.dts:127.12-132.5: Warning (simple_bus_reg):=
 /localbus/fpga@3,0: simple-bus unit address format error, expected "300000=
000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_pro=
vider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interru=
pt provider
>> arch/powerpc/boot/dts/a3m071.dtb: Warning (interrupt_map): Failed prereq=
uisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_=
vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/cm5200.dts:76.13-83.5: Warning (simple_bus_reg): /=
localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_pro=
vider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interru=
pt provider
>> arch/powerpc/boot/dts/cm5200.dtb: Warning (interrupt_map): Failed prereq=
uisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/motionpro.dts:102.12-105.5: Warning (simple_bus_re=
g): /localbus/cpld@2,0: simple-bus unit address format error, expected "200=
000000"
   arch/powerpc/boot/dts/motionpro.dts:108.14-111.5: Warning (simple_bus_re=
g): /localbus/anybus@3,0: simple-bus unit address format error, expected "3=
00000000"
   arch/powerpc/boot/dts/motionpro.dts:112.26-115.5: Warning (simple_bus_re=
g): /localbus/pro_module_general@3,0: simple-bus unit address format error,=
 expected "300000000"
   arch/powerpc/boot/dts/motionpro.dts:116.24-119.5: Warning (simple_bus_re=
g): /localbus/pro_module_dio@3,800: simple-bus unit address format error, e=
xpected "300000800"
   arch/powerpc/boot/dts/motionpro.dts:122.13-129.5: Warning (simple_bus_re=
g): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/motionpro.dts:108.14-111.5: Warning (unique_unit_a=
ddress_if_enabled): /localbus/anybus@3,0: duplicate unit-address (also used=
 in node /localbus/pro_module_general@3,0)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_pro=
vider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interru=
pt provider
>> arch/powerpc/boot/dts/motionpro.dtb: Warning (interrupt_map): Failed pre=
requisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_=
vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /lo=
calbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /l=
ocalbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_pro=
vider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interru=
pt provider
>> arch/powerpc/boot/dts/o2d.dtb: Warning (interrupt_map): Failed prerequis=
ite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_=
vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /lo=
calbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /l=
ocalbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_pro=
vider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interru=
pt provider
>> arch/powerpc/boot/dts/o2d300.dtb: Warning (interrupt_map): Failed prereq=
uisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_=
vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /lo=
calbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /l=
ocalbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_pro=
vider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interru=
pt provider
>> arch/powerpc/boot/dts/o2dnt2.dtb: Warning (interrupt_map): Failed prereq=
uisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_=
vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /lo=
calbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /l=
ocalbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_pro=
vider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interru=
pt provider
>> arch/powerpc/boot/dts/o2i.dtb: Warning (interrupt_map): Failed prerequis=
ite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_=
vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /lo=
calbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /l=
ocalbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_pro=
vider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interru=
pt provider
>> arch/powerpc/boot/dts/o2mnt.dtb: Warning (interrupt_map): Failed prerequ=
isite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_=
vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/uc101.dts:109.13-149.5: Warning (simple_bus_reg): =
/localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_pro=
vider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interru=
pt provider
>> arch/powerpc/boot/dts/uc101.dtb: Warning (interrupt_map): Failed prerequ=
isite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
