Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F6870830
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781450626; cv=none; b=gYHD7wWNl+0fqyS77Kidl4IUEMRP3zOZES96k9x+TklTBW5KRaJRFg9cET85YPGFQPT08bA3EV6JKY8CR5jyMGWPS+yoMzTa7n/UTZMSXFux4nlrPSdEgIykxHTQOpVNBy2k02ZW4YwJD0AcPB6UL1X7o+I0iokKltc+0a1KAhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781450626; c=relaxed/simple;
	bh=ZLnmButP+t8VBoE8LEH6PtuBwVvl76Z0aKcL4mIo928=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fw6V3W8iyxNLTvwKRKGw4P/04NgcHChI3LD9rYqGUHg6eRYQ322axeWnKlJqTseanCiBUV0f5jXxTbI4ZIRTvEEM6RSN7gebQMQ6aogU0L/SU9t6a7tKTh0ZMsQMtpXwkQy/5ugtCDXe/ROYGg95W2x2WWwtSUnw801ofsRbS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYXMJZnA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYXMJZnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781450625; x=1812986625;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZLnmButP+t8VBoE8LEH6PtuBwVvl76Z0aKcL4mIo928=;
  b=MYXMJZnA1n9VlUMOsc5XR52Lt241AE5f/0JsOHrlMnlu4vG8QU3RzdNJ
   EPp24fazEKTUtSSB0pDjRoycDF72oXNOZqMB7TMXmog+3Oh60yhSby5eV
   ObCG62P+m6Brq8kWf1vnYNS4DmsE+8r/q9V5Ynq3a+th3rTZPNNDz4ZY8
   ajhax2tt3khYHwfmlPrTW+S+u6kBS2sUgG3NtRKs1kc2s4mL+KPKoH7OX
   C5dDghczAanZ+y27Auw76SD43kjyi9JQng+uWWs+UetY5qKhKrqkvwxjT
   h7SjMFVWoU0VJom6NGDAX/6ixMqhYpSTsWYtcPTmvsxmWczJkOCGEgKk/
   w==;
X-CSE-ConnectionGUID: xRTxS4pcQ4eLWZp/0z75Yg==
X-CSE-MsgGUID: CAtTUcvUSounCqakRMInKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82111572"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82111572"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 08:23:44 -0700
X-CSE-ConnectionGUID: lxXku8ZESPaI1aj5UgX+8Q==
X-CSE-MsgGUID: V8zvzqTwSGCpZhFiz0S+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="240908517"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2026 08:23:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYmgX-00000000Qw2-08cR;
	Sun, 14 Jun 2026 15:23:41 +0000
Date: Sun, 14 Jun 2026 23:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9027/13763]
 arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (unit_address_format):
 Failed prerequisite 'pci_bridge'
Message-ID: <202606142338.WCbSnuwR-lkp@intel.com>
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
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d [9027/13763] powerpc: dts:=
 Build devicetrees of enabled platforms
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: powerpc-randconfig-r052-20260614 (https://download.01.org/0day-ci/a=
rchive/20260614/202606142338.WCbSnuwR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606142338.WCbSnuwR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:23.9-26.4: Warning (unit_addres=
s_vs_reg): /memory: node has a reg or ranges property, but no unit name
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
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:209.22-211.4: Warning (unit_add=
ress_vs_reg): /pcie@fef09000: node has a unit name, but no reg or ranges pr=
operty
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:209.22-211.4: Warning (pci_brid=
ge): /pcie@fef09000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:129.9-143.4: Warning (pci_=
bridge): /pcie@fef09000/pcie@0: missing ranges for PCI bridge (or not a bri=
dge)
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (unit_address_format):=
 Failed prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (pci_device_reg): Fail=
ed prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (pci_device_bus_num): =
Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:56.13-72.5: Warning (simple_bus=
_reg): /localbus@fef05000/flash@1,0: simple-bus unit address format error, =
expected "100000000"
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:74.13-78.5: Warning (simple_bus=
_reg): /localbus@fef05000/nvram@3,0: simple-bus unit address format error, =
expected "300000000"
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:80.12-83.5: Warning (simple_bus=
_reg): /localbus@fef05000/fpga@4,0: simple-bus unit address format error, e=
xpected "400000000"
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:85.19-90.5: Warning (simple_bus=
_reg): /localbus@fef05000/watchdog@4,2000: simple-bus unit address format e=
rror, expected "400002000"
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:99.23-106.5: Warning (simple_bu=
s_reg): /localbus@fef05000/pic@4,4000: simple-bus unit address format error=
, expected "400004000"
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:107.26-112.5: Warning (simple_b=
us_reg): /localbus@fef05000/gpio@7,14000: simple-bus unit address format er=
ror, expected "700014000"
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
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:193.22-207.4: Warning (interrup=
t_provider): /pcie@fef08000: '#interrupt-cells' found, but node is not an i=
nterrupt provider
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:209.22-211.4: Warning (interrup=
t_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an i=
nterrupt provider
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (interrupt_map): Faile=
d prerequisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
