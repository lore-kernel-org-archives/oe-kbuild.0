Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A51662F1
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722933029; cv=none; b=ixrA+ilbArNhJOdy/POutOqJLOC/WIoIBim8m6MVDGzcu4Nb5tOMhVIRO9XR+ovmG65m7lSWS8/y+4xa+UtG0o8R/wHJ6MTi0rLEGCrpvqhKhE9q6Se44l2lTCfsmxWzbaTzDms1YvLfnTHIF4fGw/N4TB0F7uXs9CUzMv+K5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722933029; c=relaxed/simple;
	bh=uK4ggZZ5zdHPeumOwM3Ls/S9Z7ej5UTJQwE9HQaDvuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b3W9YP5+EOuNloVsg4IYBkis+Ff8BDE94iU4wn+ncVkyOmWyUOeuildap3bHxzyWiZQDr1RiUgjij5xeGRVOdTOJEEhFHM0bzSmRo+clu0N0eU4qfPyxQWqNJBGuk769gzhevHrhWDRfEphXU/dfYNvRIzNtP/quND20D9Ffvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFze+2xz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFze+2xz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722933028; x=1754469028;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uK4ggZZ5zdHPeumOwM3Ls/S9Z7ej5UTJQwE9HQaDvuE=;
  b=eFze+2xzSINaCEN6P5IPlqHISh/mnuRa5zWCgRMiLEQ+ZauGa3FU8ArH
   Ohtgn0rZG0Vh8zeeaOjjx8DPrMnaGnH0EekkdD5k/rW1NOzFPdZzvcbpy
   mx4ELaDwHFanMSDTwpiiJgBabF02j+uoTX/7y1qzg+rgBXGxRvDXlGpvx
   jQRtMjulN6tW7ZoVQtbcJrFWeYhma/BUQr7jDY79E/mHCZJ6y5XA7n0Ud
   4GDMYmBJTJ58SAEgOzAHUrBJdiCkklvNuXm7mpKqUqCeGnNHuytbaolSU
   UnKlu1OBFRt06UnqIybgwZB/jMpDpNaS+I5Lo9Lu7vBxpQ3dszv0F/ko1
   Q==;
X-CSE-ConnectionGUID: Hf6eziSgRayHIDo8WgmnXQ==
X-CSE-MsgGUID: ruti3hfZQM+lvXM8C3FFCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="46336287"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="46336287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 01:30:27 -0700
X-CSE-ConnectionGUID: GRwn0Qg1RMapy4UHtlDKvQ==
X-CSE-MsgGUID: ONzBv+w4TLyLaSwEJWvYZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="61405860"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2024 01:30:26 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbFaI-0004JC-2q;
	Tue, 06 Aug 2024 08:30:22 +0000
Date: Tue, 6 Aug 2024 16:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v11 11/12] arm64: dts: Add DTS for Marvell PXA1908 and
 samsung,coreprimevelte
Message-ID: <202408061625.Gnlmw4sd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240730-pxa1908-lkml-v11-11-21dbb3e28793@skole.hr>
References: <20240730-pxa1908-lkml-v11-11-21dbb3e28793@skole.hr>
TO: "Duje Mihanović via B4 Relay" <devnull+duje.mihanovic.skole.hr@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
TO: Haojian Zhuang <haojian.zhuang@linaro.org>
TO: "Duje Mihanović" <duje.mihanovic@skole.hr>
TO: Lubomir Rintel <lkundrak@v3.sk>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: phone-devel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: Karel Balej <balejk@matfyz.cz>
CC: David Wronek <david@mainlining.org>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/clk-mmp-Switch-to-use-struct-u32_fract-instead-of-custom-one/20240730-204129
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240730-pxa1908-lkml-v11-11-21dbb3e28793%40skole.hr
patch subject: [PATCH v11 11/12] arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-051-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061625.Gnlmw4sd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061625.Gnlmw4sd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408061625.Gnlmw4sd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts:38.9-41.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: pinmux@1e000: board-pins-0:pinctrl-single,input-schmitt: [64, 0, 64, 112] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: pinmux@1e000: board-pins-2:pinctrl-single,input-schmitt: [64, 0, 64, 112] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: pinmux@1e000: uart0-pins:pinctrl-single,input-schmitt: [64, 0, 64, 112] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: pinmux@1e000: gpio-keys-pins:pinctrl-single,input-schmitt: [64, 0, 64, 112] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: pinmux@1e000: i2c-muic-pins:pinctrl-single,input-schmitt: [64, 0, 64, 112] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: pinmux@1e000: sdh0-pins-0:pinctrl-single,input-schmitt: [64, 0, 64, 112] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: pinmux@1e000: sdh0-pins-1:pinctrl-single,input-schmitt: [64, 0, 64, 112] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: pinmux@1e000: sdh0-pins-2:pinctrl-single,input-schmitt: [64, 0, 64, 112] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: mmc@80000: pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: mmc@80000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
