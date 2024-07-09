Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C81474BE
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 23:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720569175; cv=none; b=b/eMiW7I7aKSGyGE0y6prt229feKH8YbsXKkUYNInvckAD4oeFFSt8GZiu1NInK36kNe+EVQXs1Szjr7yc0lGpZyHxLSL5xlFNs439JLQ1wFB9Sly+BPshZHw26sU/JvNnAhhPP83ke9/L/Sy2+Y/GqLJ3GrV6RO3KxsKwDfOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720569175; c=relaxed/simple;
	bh=KZ8DoU0r1DPWuSV0qSXvdwuVTZIjGJdrKYMTUK9UdX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uKug7TsuuCQ6sNXh7r9RtnInfqedWxlfjBit1n/avg0GYwx8QAtbVtlVoELK6qXSmaMTLU6AERQ94tCGlbT/TGsaN6Y8xooFWWBR4P16/fDNNhqejEPytihNPo/V/NI2AuO2cidL3mkL/804RuT+NsF/Gd2Di5PDRgZKYtvaatI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5b4lOIe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5b4lOIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720569174; x=1752105174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZ8DoU0r1DPWuSV0qSXvdwuVTZIjGJdrKYMTUK9UdX4=;
  b=V5b4lOIe+EetgL6V4QSfVfk09QUKPNkR2z3R1T6m8SHz5qtQRquKHAlY
   dJGsYcDclFzUhgkeKs8jrL3HlUd9md90EVerb6s0Num1lXX2AJzNycywY
   P1A9X+G5SsUdLHq4ONWJgKMeenEW/STeim3B32EiGv+qC/sMGYyD93c+f
   img1rXeFw0xV9ypfOJ5YYBTWQLB/mmBs8CfaGcNhagAZOeDlds8XDeVtu
   s9GNV/HQVLRHEMbTi7yGVA2lQBeLNI0vlmzaMTIoAq4sUDYnt16PrTwfm
   5TlcWndYRz8YMIvkEMxlemRK976xK9yneAycADg5RugOe2uDq3aKaub9k
   w==;
X-CSE-ConnectionGUID: U85ucvk4TvqIIEBx4fIoIw==
X-CSE-MsgGUID: b3VCRIweRiSSbfpRv6ZJyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18004488"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="18004488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 16:52:53 -0700
X-CSE-ConnectionGUID: BL2X6V+OSPyTJfivLdOtdw==
X-CSE-MsgGUID: Emb/mOlZTuGWyVY24C6wcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="52419199"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jul 2024 16:52:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRKdd-000XG2-2P;
	Tue, 09 Jul 2024 23:52:49 +0000
Date: Wed, 10 Jul 2024 07:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:sophgo/dt 1/1] arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10:
 fatal error: dt-bindings/clock/sophgo,sg2042-clkgen.h: No such file or
 directory
Message-ID: <202407100724.P6OottHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Chen Wang <unicorn_wang@outlook.com>
CC: Guo Ren <guoren@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sophgo/dt
head:   b1240a39511b9206293b82ac372c5114d6e15821
commit: b1240a39511b9206293b82ac372c5114d6e15821 [1/1] riscv: dts: add clock generator for Sophgo SG2042 SoC
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: riscv-randconfig-051-20240710 (https://download.01.org/0day-ci/archive/20240710/202407100724.P6OottHO-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100724.P6OottHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407100724.P6OottHO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:6:
>> arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error: dt-bindings/clock/sophgo,sg2042-clkgen.h: No such file or directory
       7 | #include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:6:
   arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error: dt-bindings/clock/sophgo,sg2042-clkgen.h: No such file or directory
       7 | #include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

vim +7 arch/riscv/boot/dts/sophgo/sg2042.dtsi

b1240a39511b92 Chen Wang 2023-11-24  @7  #include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
b1240a39511b92 Chen Wang 2023-11-24   8  #include <dt-bindings/clock/sophgo,sg2042-pll.h>
b1240a39511b92 Chen Wang 2023-11-24   9  #include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
967a94a92aaaaf Chen Wang 2023-10-07  10  #include <dt-bindings/interrupt-controller/irq.h>
1ce7587e507e17 Chen Wang 2024-01-30  11  #include <dt-bindings/reset/sophgo,sg2042-reset.h>
1ce7587e507e17 Chen Wang 2024-01-30  12  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
