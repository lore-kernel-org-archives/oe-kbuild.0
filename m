Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858174908B4
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 17:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786729290; cv=none; b=imgJb4YnLWX6tHMJ7VbAGgX0bP6Fd9mBStWBdV48/GuR7SvcJq4CrXgUab9t3KgMGbn5ld5+Hk98E8U5EidRRifj+MDMkuQZdNjEY5rpMGq1HFVHIJ973NQpDoPeNtqWyb5hp6G/UrfJ1HtWXPY+LJEiTIL8wynV7tEIVoahqwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786729290; c=relaxed/simple;
	bh=Dv1k4MRoG5VKwyJvCfAaNER2gWeSp/Kw9frw9/nOhhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XA7hhcj4BaX4BDkh7AGscSaELpYf8RM2n49iQY/X/uDGYXgoLkBGapS+CCEJRiZoWscpowGQ6gMEiNIWV7JNowB5AjbCLmJipRH8zK3oKVgOYh69zJLAXnq2IbByL10/6Lwkf8lz72To6DDgUN53s06+vBaTjbusmesx9r1KUwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdoxEeBf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdoxEeBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786729289; x=1818265289;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Dv1k4MRoG5VKwyJvCfAaNER2gWeSp/Kw9frw9/nOhhs=;
  b=MdoxEeBfEUoJRyAj7Ztv4JRKr5h4e+iAOk3/+bX8BvBoMcc4AnbH3V75
   oSk3/mHkFaXbZrSULw1zImG1sh7Izc752Og5a+KPIN1qzrVNwNG5ZzxGo
   q05G9ALX08DX6bTXOOUhex/ThjuJvwDGGBcKUpcfVZTL6qDZ5s7VviVEz
   fexhzz3VEFEl0YV4iGtRp88B5Q7/N5gmUbiUfvb8z9O8xZoJrCuoiUlyl
   MAcjJ5wln4RafkpaEp8kkgTFjPkkyokzqAaNnizNgDr2KSUZ8afW2q0PI
   ZVceT8NlWvfJSL9oTm4NbLcMZzYvmpot+BCPpgtIy3Pmh4ioZddvVVUoP
   A==;
X-CSE-ConnectionGUID: +jcwFD6UQOiJycmzNSfSGQ==
X-CSE-MsgGUID: VSZ+0BWGQ/6HjMgsijwjng==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91123353"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="91123353"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 10:41:28 -0700
X-CSE-ConnectionGUID: T317Nj3kTpSGdPLTWjirtg==
X-CSE-MsgGUID: 3Hca3bW9TZKU9LQ/OTy/uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263845184"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2026 10:41:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuvuF-00000000Ziy-1hYA;
	Fri, 14 Aug 2026 17:41:23 +0000
Date: Sat, 15 Aug 2026 01:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/mvme7100.dtb: Warning
 (interrupt_map): Failed prerequisite 'interrupt_provider'
Message-ID: <202608150136.FHBDCKma-lkp@intel.com>
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
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d powerpc: dts: Build device=
trees of enabled platforms
date:   2 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 2 months ago
config: powerpc-randconfig-r133-20260814 (https://download.01.org/0day-ci/a=
rchive/20260815/202608150136.FHBDCKma-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c=
1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260815/202608150136.FHBDCKma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2442f10c6eae ("powerpc: dts: Build devicetrees of enabled platform=
s")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608150136.FHBDCKma-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/mvme7100.dts:102.17-108.5: Warning (simple_bus=
_reg): /localbus@f1005000/serial@5,1000: simple-bus unit address format err=
or, expected "500001000"
   arch/powerpc/boot/dts/fsl/mvme7100.dts:110.17-116.5: Warning (simple_bus=
_reg): /localbus@f1005000/serial@5,2000: simple-bus unit address format err=
or, expected "500002000"
   arch/powerpc/boot/dts/fsl/mvme7100.dts:118.17-124.5: Warning (simple_bus=
_reg): /localbus@f1005000/serial@5,3000: simple-bus unit address format err=
or, expected "500003000"
   arch/powerpc/boot/dts/fsl/mvme7100.dts:126.17-132.5: Warning (simple_bus=
_reg): /localbus@f1005000/serial@5,4000: simple-bus unit address format err=
or, expected "500004000"
   arch/powerpc/boot/dts/fsl/mvme7100.dts:30.11-32.6: Warning (i2c_bus_reg)=
: /soc@f1000000/i2c@3000/rtc@68: missing or empty reg property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:22.12-26.4: Warning (uniqu=
e_unit_address_if_enabled): /soc@f1000000/mcm-law@0: duplicate unit-address=
 (also used in node /soc@f1000000/dma-channel@0)
   arch/powerpc/boot/dts/fsl/mvme7100.dts:135.22-137.4: Warning (interrupt_=
provider): /pcie@f1008000: '#interrupt-cells' found, but node is not an int=
errupt provider
   arch/powerpc/boot/dts/fsl/mvme7100.dts:139.22-141.4: Warning (interrupt_=
provider): /pcie@f1009000: '#interrupt-cells' found, but node is not an int=
errupt provider
>> arch/powerpc/boot/dts/fsl/mvme7100.dtb: Warning (interrupt_map): Failed =
prerequisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
