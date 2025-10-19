Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC9923A9AD
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760910208; cv=none; b=a56/N4nQt5zu/zJ8PRD4uuK8yJrG2W5GICJ/Xx5vFpwm+l0601pReXeKzQitlGGWbNdmxflwiuBguSjQupflj4GP0vSAEWk1a3VkGsdHcAktGP1KKT/Qjrhn9UE81lfEzhFx+OP1zWDb612pjxezjW1qHGZ66x9MzFJ2HQb9b5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760910208; c=relaxed/simple;
	bh=0WyE8KWcxGI5tc8fElO+hCDdQr9uVOguhKgzCjRgWl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrEOU0pbCnHIxC3ouRk0NXhdIf4574wq0TVLqGYk66m0ZXANQ5QRyN5gRpP+pyOGCoQx8sezzYG1ePdrfGMIUK6EiBbyex6ah/QD3Yn6Pw+n3bhctS5BOq+RSCLDjrDAHs9ULoJmmOKhliinY+bFUPq+QcUrQtvCHsSV6Mj0Fzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITsu/DRn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITsu/DRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760910206; x=1792446206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0WyE8KWcxGI5tc8fElO+hCDdQr9uVOguhKgzCjRgWl0=;
  b=ITsu/DRnJQvxcqFSqmfU35mgkcR2PVwmGFoIU/ouToef+KzehvhCl5Vw
   vATnr+4fQWCjdqUW/qAXMG3ynkF0XOADiGbQguKpvr2RpjFsXH0GUiMw1
   dJufQgOPT+wbB7PolLKaxW6i7ApgEQ7In14fvFvEP8cpdo7h4/itoRCN0
   SuqMzZMT6mWqN72bpTI/wUX9CvrscAhkSj19UFenVJs470FmvluzvDR0k
   S+7RzyZZjs/A+XAO8T/vp46dA++MN+jeQVOq54Cfibes2jg56us23zLW/
   nGp7anZowy5R6rVsOFw/Q6CZ1UwAg4c1VHjxHdLgNk2IV8eiJMKYEPJSQ
   g==;
X-CSE-ConnectionGUID: fugj0ShsTcO2tWIF752AiQ==
X-CSE-MsgGUID: kw/NRNaYQjunnuww1BkZ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62071064"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="62071064"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 14:43:25 -0700
X-CSE-ConnectionGUID: +2KlkWVkTeeY20emaSc93g==
X-CSE-MsgGUID: DBqwPMjuSFShqz9JErjmrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="182889976"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2025 14:43:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAbBR-0009KD-37;
	Sun, 19 Oct 2025 21:43:21 +0000
Date: Mon, 20 Oct 2025 05:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 3/7] dt-bindings: clock: brcm,kona-ccu: Add BCM21664
 and BCM281xx bus clocks
Message-ID: <202510200508.aHFkZ6qW-lkp@intel.com>
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
In-Reply-To: <20251013-kona-bus-clock-v7-3-8f473d99ae19@gmail.com>
References: <20251013-kona-bus-clock-v7-3-8f473d99ae19@gmail.com>
TO: Artur Weber <aweber.kernel@gmail.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: Ray Jui <rjui@broadcom.com>
TO: Scott Branden <sbranden@broadcom.com>
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Alex Elder <elder@kernel.org>
CC: Stanislav Jakubek <stano.jakubek@gmail.com>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: linux-arm-kernel@lists.infradead.org
CC: phone-devel@vger.kernel.org
CC: Artur Weber <aweber.kernel@gmail.com>

Hi Artur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Artur-Weber/clk-bcm-kona-Move-CLOCK_COUNT-defines-into-the-driver/20251013-214530
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20251013-kona-bus-clock-v7-3-8f473d99ae19%40gmail.com
patch subject: [PATCH v7 3/7] dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20251014 (https://download.01.org/0day-ci/archive/20251020/202510200508.aHFkZ6qW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200508.aHFkZ6qW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510200508.aHFkZ6qW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm28155-ap.dtb: aon_ccu@35002000 (brcm,bcm11351-aon-ccu): clock-output-names: ['hub_timer', 'pmu_bsc', 'pmu_bsc_var'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/brcm,kona-ccu.yaml#
>> arch/arm/boot/dts/broadcom/bcm28155-ap.dtb: master_ccu@3f001000 (brcm,bcm11351-master-ccu): clock-output-names: ['sdio1', 'sdio2', 'sdio3', 'sdio4', 'usb_ic', 'hsic2_48m', 'hsic2_12m'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/brcm,kona-ccu.yaml#
>> arch/arm/boot/dts/broadcom/bcm28155-ap.dtb: slave_ccu@3e011000 (brcm,bcm11351-slave-ccu): clock-output-names: ['uartb', 'uartb2', 'uartb3', 'uartb4', 'ssp0', 'ssp2', 'bsc1', 'bsc2', 'bsc3', 'pwm'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/brcm,kona-ccu.yaml#
--
>> arch/arm/boot/dts/broadcom/bcm21664-garnet.dtb: aon_ccu@35002000 (brcm,bcm21664-aon-ccu): clock-output-names: ['hub_timer'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/brcm,kona-ccu.yaml#
>> arch/arm/boot/dts/broadcom/bcm21664-garnet.dtb: slave_ccu@3e011000 (brcm,bcm21664-slave-ccu): clock-output-names: ['uartb', 'uartb2', 'uartb3', 'bsc1', 'bsc2', 'bsc3', 'bsc4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/brcm,kona-ccu.yaml#
>> arch/arm/boot/dts/broadcom/bcm21664-garnet.dtb: master_ccu@3f001000 (brcm,bcm21664-master-ccu): clock-output-names: ['sdio1', 'sdio2', 'sdio3', 'sdio4', 'sdio1_sleep', 'sdio2_sleep', 'sdio3_sleep', 'sdio4_sleep'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/brcm,kona-ccu.yaml#
--
>> arch/arm/boot/dts/broadcom/bcm23550-sparrow.dtb: aon_ccu@35002000 (brcm,bcm21664-aon-ccu): clock-output-names: ['hub_timer'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/brcm,kona-ccu.yaml#
>> arch/arm/boot/dts/broadcom/bcm23550-sparrow.dtb: slave_ccu@3e011000 (brcm,bcm21664-slave-ccu): clock-output-names: ['uartb', 'uartb2', 'uartb3', 'bsc1', 'bsc2', 'bsc3', 'bsc4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/brcm,kona-ccu.yaml#
>> arch/arm/boot/dts/broadcom/bcm23550-sparrow.dtb: master_ccu@3f001000 (brcm,bcm21664-master-ccu): clock-output-names: ['sdio1', 'sdio2', 'sdio3', 'sdio4', 'sdio1_sleep', 'sdio2_sleep', 'sdio3_sleep', 'sdio4_sleep'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/brcm,kona-ccu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
