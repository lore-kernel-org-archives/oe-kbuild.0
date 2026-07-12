Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E646B37F741
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 23:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783898928; cv=none; b=dg+5CzCCBGWi5L1LKARHaNAi8+VlniWzOGQOULzxVPZw+yXVglHcdd3sYwPWBJuJoZU/UhsgmdJmz9cOgrBOx3DSDXMD1mEdCx7UntVGEy6f7hv09R5gIJxHVPPf5Qqp6kCrYzged1T0Ge4gdx2h+apxRaDuaQPY+invCyKDQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783898928; c=relaxed/simple;
	bh=jpSb5KKKJBvVPp26I0SbOCt4PrafRkwwNdaMsXpSCKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UVUVGD6IlLXcnsNV9D+5N5hLafBQfoWKGs9GCn+ddJQIw3/m8uVNW5Eud+e5FWsUgUEdaKsnia1LtF9OAI7pZaGSJxQLV+zymHeKijwdjTUrrmjHzDs1SmqhS4f/en81HqrnClFeXFSb+xBqZiLMZ6ih6Tnjaz5DdDDABB01ykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRmzq5lP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRmzq5lP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783898926; x=1815434926;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jpSb5KKKJBvVPp26I0SbOCt4PrafRkwwNdaMsXpSCKs=;
  b=XRmzq5lPs947/ymATxs458q9n1W1o2O4VGi2PPRLsc8gupeQbIS63rec
   syy8D5sNmyX9E2MO57nazboZYQ/7dWdh2MBq0rJoGqxin2T2LYFy99Omu
   Todqz0ZoaFZLjSnruJebDr6eNxKrjiedEBjwI7DnEXnbIDpn16Z+Rqaqr
   Hoz4yKE7tHKVdeyF2h/Taelu40YeGMUByEIoV0OGDxV9rQZurGqgpD1nW
   RwOL1Hyc8qzvt4sXnxC1THXPIZbGMNaU0cM29wbFEMJWkrEgIiV1yaO/I
   R/dOjOedgeIPFSgvBjFn3ElbuaRf+T0ZsgwntRKHQ1DtDRK8R7CVc13qn
   Q==;
X-CSE-ConnectionGUID: AZgT0VKdTy2SsA1vBAyEiQ==
X-CSE-MsgGUID: ahNyjEyASCCe+BlyqkKq5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88192110"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88192110"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 16:28:45 -0700
X-CSE-ConnectionGUID: p7DCLYbcSjOu6ZZitlea+Q==
X-CSE-MsgGUID: Cb+8jUDiQjWO6J4YJ+F6zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250984299"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2026 16:28:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj3bF-00000000LCb-49cP;
	Sun, 12 Jul 2026 23:28:41 +0000
Date: Mon, 13 Jul 2026 07:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/pdm360ng.dtb: Warning (interrupt_map):
 Failed prerequisite 'interrupt_provider'
Message-ID: <202607130653.JeYdKPEo-lkp@intel.com>
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
head:   44696aa3a489d2baf58efa61b37833f100072bee
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   6 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 6 weeks ago
config: powerpc-mpc512x_defconfig (https://download.01.org/0day-ci/archive/=
20260713/202607130653.JeYdKPEo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e=
6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260713/202607130653.JeYdKPEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607130653.JeYdKPEo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc5121.dtsi:41.9-44.4: Warning (unit_address_vs_r=
eg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc5121.dtsi:457.13-466.5: Warning (spi_bus_bridge=
): /soc@80000000/psc@11900: node name for SPI buses should be 'spi'
   arch/powerpc/boot/dts/pdm360ng.dtb: Warning (spi_bus_reg): Failed prereq=
uisite 'spi_bus_bridge'
   arch/powerpc/boot/dts/mpc5121.dtsi:79.9-88.4: Warning (avoid_unnecessary=
_addr_size): /clocks: unnecessary #address-cells/#size-cells without "range=
s", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/mpc5121.dtsi:273.13-280.5: Warning (unique_unit_ad=
dress_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also us=
ed in node /soc@80000000/ethernet@2800)
   arch/powerpc/boot/dts/mpc5121.dtsi:508.20-525.4: Warning (interrupt_prov=
ider): /pci@80008500: '#interrupt-cells' found, but node is not an interrup=
t provider
>> arch/powerpc/boot/dts/pdm360ng.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
