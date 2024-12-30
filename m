Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D72E5383
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 00:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735518219; cv=none; b=rGeAe0xUqKrpVhgmPodc/a10gXr7l4vnDt90t7CY9NP4iEfB5bRDRzNlqgzHM0oNfezkDrsoBM8vOwDqNztNbQDVqZG4dWrjszVkk5hjYdahkprJ4emk1E37R3L5qJCBtR/SXc8mXyOCXHSCYPo7aNAJfV65DHN7aY0MtDERt8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735518219; c=relaxed/simple;
	bh=nhMGoaakjulq7GB0nI8GfyBTFhw2uh2vT5ZJuPHojK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pgJKZ3dABX6QvSpdbESYLzQpJyanC4fbkrggj4ydRADNzJGIBjP5XtQWy1ArzdqEkwIbxmfAETtbpUaFbNMqXJdh2C9mjQPcRYxUpiH8gK2JTsjYuP2v7inMpa4CpwXGntsoIfz3OPvQq0xerhw2KtKaEv/keWfryL3+MWtnsuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMFwmNEP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMFwmNEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735518210; x=1767054210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nhMGoaakjulq7GB0nI8GfyBTFhw2uh2vT5ZJuPHojK0=;
  b=YMFwmNEPjL5sED8415liCALT6NWcFn6KD96tTXEzjRbzixm9eGaGNNKF
   PorKH8glIjI6LnYJLE7zuTGZJUQceGSJZXjQvhISLHKTG5cmZILwvb0QY
   mYyVoNmsItx3EDJEKhOQLupfAVxOvjO8lf+pNMt7uS0Uf0DmqYcYsl5bp
   rUGwzilvTkV7ONB6O7HMyEYCjgjHxD2MC8P8FZonmnEfonBvTyuaWN7je
   GzTldF7t/T5ZIV6qBH7SaWLy6FAMrOyrJ0W4K4fbM8z2wxvDmlAIs5u6p
   gG+To0mFpjD1GNdYWNYqw31U6BIvmM2WTKtfPHy4IEqNX+N09e1K89jOw
   g==;
X-CSE-ConnectionGUID: 3K1d/vD3T8aNmvE4Ez1uSg==
X-CSE-MsgGUID: NS3tsPKKRhyniGmgrPtmqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39494608"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="39494608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 16:23:30 -0800
X-CSE-ConnectionGUID: F4FepOFPSZ+rXVkq+t0pdQ==
X-CSE-MsgGUID: N1n+oLA+RdWgnAYW+n3a1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105267653"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Dec 2024 16:23:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS3Z2-0005Fw-2K;
	Mon, 30 Dec 2024 00:23:20 +0000
Date: Mon, 30 Dec 2024 08:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: clock: ti: Convert gate.txt to
 json-schema
Message-ID: <202412300823.xrw8BWDo-lkp@intel.com>
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
In-Reply-To: <20241229135351.5014-2-akemnade@kernel.org>
References: <20241229135351.5014-2-akemnade@kernel.org>
TO: akemnade@kernel.org
TO: Tero Kristo <kristo@kernel.org>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Tony Lindgren <tony@atomide.com>
TO: devicetree@vger.kernel.org
TO: Stephen Boyd <sboyd@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: linux-clk@vger.kernel.org
TO: linux-omap@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v6.13-rc4 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/akemnade-kernel-org/dt-bindings-clock-ti-Convert-gate-txt-to-json-schema/20241229-215648
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241229135351.5014-2-akemnade%40kernel.org
patch subject: [PATCH 1/2] dt-bindings: clock: ti: Convert gate.txt to json-schema
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm-randconfig-052-20241229 (https://download.01.org/0day-ci/archive/20241230/202412300823.xrw8BWDo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300823.xrw8BWDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412300823.xrw8BWDo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-craneboard.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/am3517-evm.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/am3517-evm.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/am3517-evm.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/am3517_mt_ventoux.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd70.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-echo.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-echo.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-echo.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-echo.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-evm.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-ha.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-ha.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-ha.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-ldp.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-n9.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-n9.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-n9.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-n950.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-n950.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-n950.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sbc-t3730.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-sniper.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']
--
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/prm@48306000: failed to match any schema with compatible: ['ti,omap3-prm']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000: failed to match any schema with compatible: ['ti,omap3-cm']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-per-j-type-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/dpll3_ck@d00: failed to match any schema with compatible: ['ti,omap3-dpll-core-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/dpll1_ck@904: failed to match any schema with compatible: ['ti,omap3-dpll-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m4x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/dpll4_m5x2_mul_ck: failed to match any schema with compatible: ['ti,fixed-factor-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/clkout2_src_ck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt10_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt11_fck: failed to match any schema with compatible: ['ti,composite-clock']
>> arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: clock-dss-tv-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: clock-dss-96m-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: clock-dss2-alwon-fck: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,gate-clock.yaml#
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt1_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt2_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt3_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt4_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt5_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt6_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt7_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt8_fck: failed to match any schema with compatible: ['ti,composite-clock']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clocks/gpt9_fck: failed to match any schema with compatible: ['ti,composite-clock']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
