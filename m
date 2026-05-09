Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600125F994
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 06:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778306966; cv=none; b=PQmUgaNVpzLrOrB3Hxk0q0v4wupQltIQf4v9UH0vzefY4L73xT3Z+yx/1Qi09YlSl3pA4CY7/LB+jpPNLZGSKk+1w3/59sH34rmEu1qAPhnhpyni30SqWNEYH2YdgZ3UK8Y+lwNWHDBdPr7PK6n14LYTWBoXV+d6QLbrvedJCHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778306966; c=relaxed/simple;
	bh=s4s47q4L8OoM0bwJ7FQD6YNBzmcq9RzDl+Hd/3Ioyd8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pxXDeZoSsWuwxrxjFWbmuMaxmK9cwazho0wvVBT4Zau06QqsPeTGDIpIXNtLFvjlGnltPK0MPt/EZGunQlx7ry6SB2l4TPkk33mVzkr9jNgciarXOJMv+M2HQIWqoCFa/67qCK0vS8KJ0G4FJCaLg1jTlEkB6txQ/tvpxR+chxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3D4X016; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3D4X016"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778306964; x=1809842964;
  h=date:from:to:cc:subject:message-id;
  bh=s4s47q4L8OoM0bwJ7FQD6YNBzmcq9RzDl+Hd/3Ioyd8=;
  b=L3D4X016wf1WNvWuEHkxLPvlODtqbZoOcHv6DXAedzFyh7se1I3+Q32Y
   kVQaMS3Ut8Sfb9g73iCQtXxQBmjKYPbmA6v8DgpPFJ7J1ToOYRiJsuoEw
   FVwH7l/QRWWdFZwvc2dDlYSdo51SMpyZ1JaObVAwiPvEBxaUiVoZWJrUZ
   pZ4lGesLMbBg5+8R2M0J0zfYeCir0MP14jITLoDII02QxUbXONuUwnRLJ
   c5SNH6W5qEuAkeTvcWSfYKxYgX1t5au+ViCO2wPxaJ+pBNnTnOtR34J1X
   +fwJ3E7sEA/BSMMcRxDiAFdW7fuNtTKbdf7fUSfYfjL20rXUJLVQpDrcj
   w==;
X-CSE-ConnectionGUID: 2e8bAPvTRSuSU74gTYWGrw==
X-CSE-MsgGUID: 4y7/wKawQHG9e6Vs/QBFwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78304875"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="78304875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 23:09:23 -0700
X-CSE-ConnectionGUID: 2BWt0dw+RxmliL3GeNI3Vw==
X-CSE-MsgGUID: CNApTjcgQf6L7GqS8NPwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="267324849"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2026 23:09:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLasJ-000000007N3-3mVv;
	Sat, 09 May 2026 06:09:19 +0000
Date: Sat, 09 May 2026 08:08:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb:
 /soc/pmc@d8130000/clocks/apb: failed to match any schema with compatible:
 ['via,vt8500-device-clock']
Message-ID: <202605090851.H406CVRf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexey Charkov <alchark@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbf457c584b5cbd0d44e8f05edaf3e189e894a68
commit: 22488d6bd17cbad9eeee70d64c888735b366167d ARM: dts: vt8500: Add VIA APC Rock/Paper board
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-2051-20260506 (https://download.01.org/0day-ci/archive/20260509/202605090851.H406CVRf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090851.H406CVRf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 22488d6bd17c ("ARM: dts: vt8500: Add VIA APC Rock/Paper board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605090851.H406CVRf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000: failed to match any schema with compatible: ['via,vt8500-pmc']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/plla: failed to match any schema with compatible: ['wm,wm8850-pll-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/pllb: failed to match any schema with compatible: ['wm,wm8850-pll-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/pllc: failed to match any schema with compatible: ['wm,wm8850-pll-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/plld: failed to match any schema with compatible: ['wm,wm8850-pll-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/plle: failed to match any schema with compatible: ['wm,wm8850-pll-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/pllf: failed to match any schema with compatible: ['wm,wm8850-pll-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/pllg: failed to match any schema with compatible: ['wm,wm8850-pll-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/arm: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/ahb: failed to match any schema with compatible: ['via,vt8500-device-clock']
>> arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/apb: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/ddr: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/uart0: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/uart1: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/uart2: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/uart3: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/pwm: failed to match any schema with compatible: ['via,vt8500-device-clock']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks/sdhc: failed to match any schema with compatible: ['via,vt8500-device-clock']
>> arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/fb@d8051700: failed to match any schema with compatible: ['wm,wm8505-fb']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/ge_rops@d8050400: failed to match any schema with compatible: ['wm,prizm-ge-rops']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pwm@d8220000: failed to match any schema with compatible: ['via,vt8500-pwm']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/timer@d8130100: failed to match any schema with compatible: ['via,vt8500-timer']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/ehci@d8007900: failed to match any schema with compatible: ['via,vt8500-ehci']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/sdhc@d800a000: failed to match any schema with compatible: ['wm,wm8505-sdhc']
   arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/ethernet@d8004000: failed to match any schema with compatible: ['via,vt8500-rhine']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
