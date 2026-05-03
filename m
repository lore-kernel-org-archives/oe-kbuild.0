Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739F175A7B
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777797500; cv=none; b=tqrimSJlAK0WChfknBiXpHb+90hUSik0AB05dxqlyOZnSF2bXt8WAVcV3gStTl5MJ6phCvZezHHUR0tX0b7VHhwjzS28fyiA5LRCxDVLsdAEDcC/dOTsHkiXuL+HDliHNsOisq6tCNfzg2DYE52yrwgVjaYkuaF7+ZqaNK4322Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777797500; c=relaxed/simple;
	bh=JmmtfBbKqzbLbLq8YmjAENY0wXcCUXEuI/ONMwAFPGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c248esl5OdIvaZcOw9b3mp9gsECWcMT8gRC72mjV2GL3mZCKVeb5aCKUDkxmWnOhgWnLM4nmMO5fbmoUx/WtFzOxnZa17Oms8wvtvAg7v2tirKutz+kfna1Te3jq+gc3HE6HcXd89+FM/W8OlZqHmxa22BSunAJPxFy4f0+DJrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEy/muha; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEy/muha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777797499; x=1809333499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JmmtfBbKqzbLbLq8YmjAENY0wXcCUXEuI/ONMwAFPGQ=;
  b=oEy/muhaD1f+zNqvGLoy9dy4ZSDiPIXEE1P3VZndphVM4eFOQAO1mGYF
   yUQyrwsM9mpAzdU3KTwvsnt9KoEsZcKgbqUt3ZnjNIX+bncTN6wSkx2iz
   7oZaOo1vAKxVyyXqbKyOQSWRjot1GorWmQvYIyKgUaXYkl3SGelZQnjrP
   yErZbdGk2hRdHm6nKQVit2+A4fqRM5dcpTNT09ZBDz4Uw6aSWVXDxU0CU
   98jJyfgKG9huyO35WAw0NHBf7MoEiJSics4bJkoG+Mv59wnInEpWsC2mi
   3iWBv4iP55TdmHOmJJQwor0e4dX8mUE3VEtYY2wNPzEk9Hf+YWjgDGzwP
   Q==;
X-CSE-ConnectionGUID: wbkGuwDNQKSxyK9+YYTNBQ==
X-CSE-MsgGUID: VOpCvMsASmSxuzCz/gvzfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="81260497"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="81260497"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 01:38:17 -0700
X-CSE-ConnectionGUID: 7exyd66VQXiyJjqO/qmUOA==
X-CSE-MsgGUID: /L3SoouyQ9Kb3JMs5CihtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="239568487"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 03 May 2026 01:38:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJSL7-000000005VF-3oLg;
	Sun, 03 May 2026 08:38:13 +0000
Date: Sun, 3 May 2026 10:38:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: pwm: stmpe: convert to DT schema
Message-ID: <202605031023.f54RksC4-lkp@intel.com>
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
In-Reply-To: <20260501073305.5866-1-manishbaing2789@gmail.com>
References: <20260501073305.5866-1-manishbaing2789@gmail.com>
TO: Manish Baing <manishbaing2789@gmail.com>
TO: ukleinek@kernel.org
TO: thierry.reding@gmail.com
TO: linusw@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: mcoquelin.stm32@gmail.com
CC: alexandre.torgue@foss.st.com
CC: linux-pwm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: manishbaing2789@gmail.com

Hi Manish,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manish-Baing/dt-bindings-pwm-stmpe-convert-to-DT-schema/20260502-063803
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260501073305.5866-1-manishbaing2789%40gmail.com
patch subject: [PATCH] dt-bindings: pwm: stmpe: convert to DT schema
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm-randconfig-2051-20260502 (https://download.01.org/0day-ci/archive/20260503/202605031023.f54RksC4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031023.f54RksC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605031023.f54RksC4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: stmpe_adc (st,stmpe-adc): 'iio-device@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stmpe-adc.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: stmpe_gpio (st,stmpe-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: stmpe_gpio (st,stmpe-gpio): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: stmpe_gpio (st,stmpe-gpio): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: stmpe_gpio (st,stmpe-gpio): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: stmpe_pwm (st,stmpe-pwm): $nodename:0: 'stmpe_pwm' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/st,stmpe-pwm.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: rng@0 (ti,omap4-rng): clock-names:0: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/rng/inside-secure,safexcel-eip76.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: wifi@1 (brcm,bcm4329-fmac): Unevaluated properties are not allowed ('brcm,sd-head-align', 'brcm,sd_head_align', 'brcm,sd_sgentry_align' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
