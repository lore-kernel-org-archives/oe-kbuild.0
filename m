Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C9040D592
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jun 2026 22:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781132054; cv=none; b=Pnrie7bcUoZeJKPSIMJKZH6TazqT3vm7+gjkM4EZKCp872gX5+6HLNPbVis7iVJMskO5NnW8Uv6GS7vz5dNtb57WmkDjXg6ryH19WgtCvHfKjLvZYnNPuhoBHk+sPURB0aAt3t0emWGRlYTd39fzWkgPdC7Yl+24zfAIMvqPbqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781132054; c=relaxed/simple;
	bh=aR5lYuokVrU/JS8fzKzZAoC4jF8jn1LDgq5aDxpvitI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KkM08IaiNWx/N/HmdRruvGBkBjeSeO1Q0l9VFTihCh5Q66jZyVLEEyJTVZ3v+0+OoSsTM7W2XdtodBalnDQ56r+z8VlljEB5qPLQGqkj/q3Tokyt188ivIYeGWo6drseFON/iCN+AVGXgCPRV7m3QbYvFw5qPGsKSWhsl7zF/10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyZA46R4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyZA46R4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781132053; x=1812668053;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aR5lYuokVrU/JS8fzKzZAoC4jF8jn1LDgq5aDxpvitI=;
  b=VyZA46R4l1i5X8o8e3zRuEBikvkXheTUNqsNtWQRNdNjSZsKKFveeFRW
   ajtEw9gBUALdy3TiTyP2EUrXuHWncCcTvNdqX5tebKznCLe3O0sE1RuHN
   uETw6OilxDWs6x4ixrQcA9qbsg6YSjvzqC/EXSpPO72GRWOZskZ5agWeJ
   6NYLhk0A8yWB2iz/toXWZHS3XAFt9+VeDlkoqAmFjszoPa70Q8iyHn/9b
   kaL38dGAFAx824dtyVmz0+IE4Z5rc6NOI3bP/CSQUAAIb8m8T0EQt41yX
   m/r/wpX4OW3H/8zk8wWGx5PWrRvAfCb4StvwWa9P63tMHSFcYV94Sgufd
   w==;
X-CSE-ConnectionGUID: mzllPmeVR92LYwk/uDgtQA==
X-CSE-MsgGUID: xidnBVjrRCqBtdaLuwTYzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85834223"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85834223"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 15:54:12 -0700
X-CSE-ConnectionGUID: rfgPKmvaR6K4dDnVUdFqWw==
X-CSE-MsgGUID: cZid/NCLSgqI6zEXfasMEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="284374918"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2026 15:54:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXRoG-00000000Lz0-0RNQ;
	Wed, 10 Jun 2026 22:54:08 +0000
Date: Thu, 11 Jun 2026 06:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9242/12670]
 arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: Warning (interrupt_map): Failed
 prerequisite 'interrupt_provider'
Message-ID: <202606110632.dG1s89gb-lkp@intel.com>
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
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: 2442f10c6eae63392452ab84a813dbc1f87c724d [9242/12670] powerpc: dts:=
 Build devicetrees of enabled platforms
:::::: branch date: 28 hours ago
:::::: commit date: 9 days ago
config: powerpc-randconfig-r071-20260611 (https://download.01.org/0day-ci/a=
rchive/20260611/202606110632.dG1s89gb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 791=
7772d7d61384696c61102c08c2ea158e610fa)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606110632.dG1s89gb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:82.19-88.5: Warning (simple_bus=
_reg): /localbus@fef05000/watchdog@4,2000: simple-bus unit address format e=
rror, expected "400002000"
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:98.23-105.5: Warning (simple_bu=
s_reg): /localbus@fef05000/pic@4,4000: simple-bus unit address format error=
, expected "400004000"
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:106.25-111.5: Warning (simple_b=
us_reg): /localbus@fef05000/gpio@4,8000: simple-bus unit address format err=
or, expected "400008000"
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
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:217.22-231.4: Warning (interrup=
t_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an i=
nterrupt provider
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: Warning (interrupt_map): Faile=
d prerequisite 'interrupt_provider'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
