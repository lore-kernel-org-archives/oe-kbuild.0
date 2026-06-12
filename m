Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552693E958F
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264793; cv=none; b=Lg4Q7Ryn80AOT/cK1R4tDZRrSjV86M11Ipy1bA5XDLiQqbWtsD2giPj8mtzib4MMCHKeVzR2XOaUfz8n3OJAKLbvP25XH9fBROMy2F+WsiPY5RLu0gzMF0sOxiawJw1BZDHXSJr+vkJNVWbD2N/SHX6wTfCzvilT00lgdNSusYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264793; c=relaxed/simple;
	bh=PacwyqI7YGrgWTzMGdtBPJLqQK6vwU03Wp1h8h1m45k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RH2b3kEzjs+jQZckEzqDPcLlRgz01U0LiQGaIhSbMV9+FH9qNNjt0/LY2pUC78VfpYMw2LEFngO1akd862RknpICjemg+NlE9tuUs07rLi0BQUouM9pNhSchCNyO1jgYYlcDqz29pw5VrWaaeh9suSWzaRlRTb0To8Cu6aYGRNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIrfZkT0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIrfZkT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781264791; x=1812800791;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PacwyqI7YGrgWTzMGdtBPJLqQK6vwU03Wp1h8h1m45k=;
  b=mIrfZkT0C/EsmprT/bm3GQxpGTabznrQviil8GLmmJ7mjqhpTI9jnMtW
   qY9REzG2y3fL9drSepQ127nS/Go9QemIcYCcx0L6VwI4hXE0T27AmOsDM
   e+CstbtlQkIq82PSbG/VIxbTjONEyNkn74H+V30jymok5coKQvJu5VF67
   EY/KChg/+uqZYpBMAyBOtuWx1vZrObazBLPeahLohFQVvuE5/BmuzZ6yi
   +PWAKI8XvDUjZ6QWS46/BE7CMMTJFnAeZg+q8qtXJgTtivTVozuYMIytQ
   NmkHDZQWySoF2Xf7pm/GC1oCTJg+wy8XtxwElbSk/xWW4qzHR29XOXaGZ
   w==;
X-CSE-ConnectionGUID: 3yNuxuIBQT6UZHKWT4I+ww==
X-CSE-MsgGUID: z69WMLO4T5mHHw1OS5/Dxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85935813"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="85935813"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 04:46:31 -0700
X-CSE-ConnectionGUID: xcPpWcBFQf66MnZJ5WYC4A==
X-CSE-MsgGUID: lra8oW1+Tt+SSowP6MHntQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2026 04:46:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY0LD-00000000OgP-3UU5;
	Fri, 12 Jun 2026 11:46:27 +0000
Date: Fri, 12 Jun 2026 19:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9117/13336]
 arch/powerpc/boot/dts/fsl/ppa8548.dtb: Warning (unit_address_format): Failed
 prerequisite 'pci_bridge'
Message-ID: <202606121954.GFug2m0M-lkp@intel.com>
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
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d [9117/13336] powerpc: dts:=
 Build devicetrees of enabled platforms
:::::: branch date: 21 hours ago
:::::: commit date: 10 days ago
config: powerpc-randconfig-r112-20260611 (https://download.01.org/0day-ci/a=
rchive/20260612/202606121954.GFug2m0M-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260612/202606121954.GFug2m0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606121954.GFug2m0M-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/ppa8548.dts:51.9-53.5: Warning (unit_address_v=
s_reg): /rapidio@fe00c0000/port1: node has a reg or ranges property, but no=
 unit name
   arch/powerpc/boot/dts/fsl/ppa8548.dts:34.22-37.4: Warning (pci_bridge): =
/pci@fe0008000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/ppa8548.dts:39.22-42.4: Warning (pci_bridge): =
/pci@fe0009000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/ppa8548.dts:44.23-47.4: Warning (pci_bridge): =
/pcie@fe000a000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi:74.9-89.4: Warning (pci_br=
idge): /pcie@fe000a000/pcie@0: missing ranges for PCI bridge (or not a brid=
ge)
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: Warning (unit_address_format): Fa=
iled prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: Warning (pci_device_reg): Failed =
prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: Warning (pci_device_bus_num): Fai=
led prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/ppa8548.dts:34.22-37.4: Warning (interrupt_pro=
vider): /pci@fe0008000: '#interrupt-cells' found, but node is not an interr=
upt provider
   arch/powerpc/boot/dts/fsl/ppa8548.dts:39.22-42.4: Warning (interrupt_pro=
vider): /pci@fe0009000: '#interrupt-cells' found, but node is not an interr=
upt provider
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: Warning (interrupt_map): Failed p=
rerequisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
