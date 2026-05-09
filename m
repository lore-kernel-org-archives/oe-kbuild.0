Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662F18EFD1
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778318547; cv=none; b=TIfoW3d9Kb6lM+qGqd6E1IHFh5foV8ei5LocXy/vMhme0Z1tCDfqowklSEvdjtJvIsDbx3kFd7re8RrjVJuYYhRtlcrcepQ7fMRS5QDXCYpfBT50TE8LJJ0pvy5AHp53Y70xOVi9g9pIwPapqxlEkoFQg3tJKTVTuE5Law+gXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778318547; c=relaxed/simple;
	bh=veU6b3mJAm/GX74JlHeZalyfWiSuqptRESjo+OlKFVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AdrzHse1k6tpDYhstFxxSl/M0Jp43ucesf2ZoR6KL/5cKjQRmNMVWvSSBK3YHvhn+9gn8s/899BbSoDDmAd5GD2U+zvHqT7AT9r0qOw0X0sHIch9FVC2dbB8pMGWbpXlWkRqTQzei3mPOaIi+dBAd2K9H7Yu5LZLfpEfsyUtafs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUjNlIIC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUjNlIIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778318546; x=1809854546;
  h=date:from:to:cc:subject:message-id;
  bh=veU6b3mJAm/GX74JlHeZalyfWiSuqptRESjo+OlKFVQ=;
  b=fUjNlIICAIGuFYQpc1BOfqVkJY+OddLdG5vyRuslQkZvZlfkAEnUAAMI
   eBLSp0cO5Bxwd1K5AKcONhLIAfg8EFyLlx7ngpTC1RUrjm8ZdzPfr7sDg
   /tyUrVPLZeqG/Btlt5982wnS/Ov7u2AnScQZhBni8DgeawBpIGjXoMScH
   5ZQs858QfB1B21rpz+xqTA4oBz0wpfRw4iBdMtJYFaKvP/eEREVSOHnDR
   zRrHOvmC4QRpunDTKg7N6nEvjhJmDFRGco4z0beGyauv3bES9xRJofWtv
   Ldl9os4S7wHl7QDba/RDTOZs+vzDBNMrkrwksqp+ERDDe++VcVQipbIYv
   w==;
X-CSE-ConnectionGUID: W+hieUPgR4yXdTBiN+3CRQ==
X-CSE-MsgGUID: p5RTbZjXSsKHDH1LL2MGiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89987621"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="89987621"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 02:22:25 -0700
X-CSE-ConnectionGUID: C23f1M/+SfG37h4R97Ah8w==
X-CSE-MsgGUID: IZNx0/DPRXqqmBENh6ksIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="241988462"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 May 2026 02:22:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLdt7-000000007OT-1965;
	Sat, 09 May 2026 09:22:21 +0000
Date: Sat, 09 May 2026 11:21:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nspire/nspire-tp.dtb: timer@900d0000
 (lsi,zevio-timer): 'clock-names' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605091121.hm6rd3gk-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   81d6f7807536a0436dfada07e9292e3702d2bed4
commit: e1e9fad1499c029e6052b13e9974f5cc2ccf7c89 dt-bindings: timer: Convert lsi,zevio-timer to DT schema
date:   12 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-2052-20260506 (https://download.01.org/0day-ci/archive/20260509/202605091121.hm6rd3gk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091121.hm6rd3gk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e1e9fad1499c ("dt-bindings: timer: Convert lsi,zevio-timer to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605091121.hm6rd3gk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nspire/nspire.dtsi:44.21-47.4: Warning (unit_address_vs_reg): /base_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:49.19-53.4: Warning (unit_address_vs_reg): /ahb_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:130.16-220.5: Warning (unit_address_vs_reg): /ahb/apb@90000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nspire/nspire-tp.dtb: /base_clk: failed to match any schema with compatible: ['lsi,nspire-classic-clock']
   arch/arm/boot/dts/nspire/nspire-tp.dtb: /ahb_clk: failed to match any schema with compatible: ['lsi,nspire-classic-ahb-divider']
   arch/arm/boot/dts/nspire/nspire-tp.dtb: apb@90000000 (simple-bus): 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/nspire/nspire-tp.dtb: timer@900d0000 (lsi,zevio-timer): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml
>> arch/arm/boot/dts/nspire/nspire-tp.dtb: timer@900d0000 (lsi,zevio-timer): clocks: [[9], [9], [9]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml
   arch/arm/boot/dts/nspire/nspire-tp.dtb: /ahb/interrupt-controller@dc000000: failed to match any schema with compatible: ['lsi,zevio-intc']
--
   arch/arm/boot/dts/nspire/nspire.dtsi:44.21-47.4: Warning (unit_address_vs_reg): /base_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:49.19-53.4: Warning (unit_address_vs_reg): /ahb_clk: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nspire/nspire.dtsi:130.16-220.5: Warning (unit_address_vs_reg): /ahb/apb@90000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nspire/nspire-clp.dtb: /base_clk: failed to match any schema with compatible: ['lsi,nspire-classic-clock']
   arch/arm/boot/dts/nspire/nspire-clp.dtb: /ahb_clk: failed to match any schema with compatible: ['lsi,nspire-classic-ahb-divider']
   arch/arm/boot/dts/nspire/nspire-clp.dtb: apb@90000000 (simple-bus): 'clocks' is a dependency of 'clock-ranges'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/nspire/nspire-clp.dtb: timer@900d0000 (lsi,zevio-timer): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml
>> arch/arm/boot/dts/nspire/nspire-clp.dtb: timer@900d0000 (lsi,zevio-timer): clocks: [[9], [9], [9]] is too long
   	from schema $id: http://devicetree.org/schemas/timer/lsi,zevio-timer.yaml
   arch/arm/boot/dts/nspire/nspire-clp.dtb: /ahb/interrupt-controller@dc000000: failed to match any schema with compatible: ['lsi,zevio-intc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
