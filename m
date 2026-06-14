Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE012EEE75
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 22:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781477937; cv=none; b=MkEzcR6tD47VtMM+YjhF0SCxUUF274bQ43QpYpPwksvJBFsrHAwCNIF0jTRZzYJsfkKD22ZKKwhi/gQ1fLE40YnOlJOGYoJpHnubeqZI+Vz+0GPlNhxSpgVD3KvL84GJNVA3nIXLXAsMnhSEHLK6x6RK73scoFEYXg05YE1/n+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781477937; c=relaxed/simple;
	bh=9Cw+fIBD+5NzRh8rEAnSYVqZQMGHZ1vyQOjU0UqsfdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y0fnoBRxCnJ4S3hv8/MZr8HhYhozZzHDMBuI4TMALOlXZlu+3Fx0R077gavNJDajVzIC/wt5LEeQP0MMD4GPOd3cJBulH3Id8dXJPjZL4PAQwz3sxK4ypIyy0aTZokAePwr0md+jx5bkdo9Bayo+tSTlzxHIJrnf/HCOMed9CYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJ83cfO+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJ83cfO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781477936; x=1813013936;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9Cw+fIBD+5NzRh8rEAnSYVqZQMGHZ1vyQOjU0UqsfdA=;
  b=GJ83cfO+fPlr3qx++DxEU5OC99DBehLuZ+W0ysthBVvFjDH/Sx1EZmqT
   COSyM4iRHgCsvzA13UudrbmDDyczvPynlVB+5xZwTem3gZOr/aP6ckofC
   GaVJR6F0B+tGpTLZwGFW86uZ8fOOKn7ikj0xFuNsrk9sH8MCB5sKG538v
   gIc8E+jGH9lD21r1lwJ77foRp6wZQRvaSHfaKS+LzommHz7gsjHYBb+x/
   lIK6jX+zkGW0Q1eApsXTwL67xwJj9gddJOlYWOpxgqLlrL52tgb1KRKhX
   GknMzfPZENmkHAaSbSk9IM4tEa/Vik5SAfEaIJ1THD6mx4BRh/G+JBI4L
   A==;
X-CSE-ConnectionGUID: PrPup+sbTmmaFYTIz4yNhw==
X-CSE-MsgGUID: wzQQds6nSP2eO/Vu1Jjigg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93606157"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="93606157"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 15:58:55 -0700
X-CSE-ConnectionGUID: 5OKjj2MDT72y8im3E061qw==
X-CSE-MsgGUID: 0kJ66PveQpa9OnxcoHIYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="247342007"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2026 15:58:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYtn1-00000000RGc-350h;
	Sun, 14 Jun 2026 22:58:51 +0000
Date: Mon, 15 Jun 2026 06:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9027/13763]
 arch/powerpc/boot/dts/fsl/p2020ds.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202606150626.ejyqvrg5-lkp@intel.com>
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
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d [9027/13763] powerpc: dts:=
 Build devicetrees of enabled platforms
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: powerpc-randconfig-002-20260615 (https://download.01.org/0day-ci/ar=
chive/20260615/202606150626.ejyqvrg5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305=
faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260615/202606150626.ejyqvrg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606150626.ejyqvrg5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/pq3-power.dtsi:16.25-18.4: Warning (unit_addre=
ss_vs_reg): /soc@ffe00000/power@e0070/soc-clk@26: node has a unit name, but=
 no reg or ranges property
   arch/powerpc/boot/dts/fsl/p2020ds.dtsi:36.10-77.4: Warning (simple_bus_r=
eg): /localbus@ffe05000/nor@0,0: simple-bus unit address format error, expe=
cted "0"
   arch/powerpc/boot/dts/fsl/p2020ds.dtsi:79.11-111.4: Warning (simple_bus_=
reg): /localbus@ffe05000/nand@2,0: simple-bus unit address format error, ex=
pected "200000000"
   arch/powerpc/boot/dts/fsl/p2020ds.dtsi:113.20-116.4: Warning (simple_bus=
_reg): /localbus@ffe05000/board-control@3,0: simple-bus unit address format=
 error, expected "300000000"
   arch/powerpc/boot/dts/fsl/p2020ds.dtsi:118.11-121.4: Warning (simple_bus=
_reg): /localbus@ffe05000/nand@4,0: simple-bus unit address format error, e=
xpected "400000000"
   arch/powerpc/boot/dts/fsl/p2020ds.dtsi:123.11-126.4: Warning (simple_bus=
_reg): /localbus@ffe05000/nand@5,0: simple-bus unit address format error, e=
xpected "500000000"
   arch/powerpc/boot/dts/fsl/p2020ds.dtsi:128.11-131.4: Warning (simple_bus=
_reg): /localbus@ffe05000/nand@6,0: simple-bus unit address format error, e=
xpected "600000000"
   arch/powerpc/boot/dts/fsl/p2020ds.dtsi:145.24-148.5: Warning (unique_uni=
t_address_if_enabled): /soc@ffe00000/mdio@24520/ethernet-phy@1: duplicate u=
nit-address (also used in node /soc@ffe00000/mdio@24520/sgmii-phy@1)
   arch/powerpc/boot/dts/fsl/p2020ds.dtsi:149.24-152.5: Warning (unique_uni=
t_address_if_enabled): /soc@ffe00000/mdio@24520/ethernet-phy@2: duplicate u=
nit-address (also used in node /soc@ffe00000/mdio@24520/sgmii-phy@2)
   arch/powerpc/boot/dts/fsl/p2020ds.dtsi:274.11-324.6: Warning (interrupt_=
provider): /pcie@ffe09000/pcie@0/uli1575@0/isa@1e: '#interrupt-cells' found=
, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: Warning (interrupt_map): Failed p=
rerequisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
