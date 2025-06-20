Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4C61F09B4
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jun 2025 04:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750392928; cv=none; b=ocRHlRxOFqYa0avp71Khs5520xP5YoqG3IFnOzHe8l078zd2BgiqiKxI3edKSPc2kE0nwE2qob9svPVZAen9O9YWD/iDIgn0DpclaOdYAZ0H4s24Flsp+70LoxiHMRnPiJyMI1q75ImFEkuiX8GqLT+tfiFsfBt4hltym/98e+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750392928; c=relaxed/simple;
	bh=xCQxavBXCp55TStssRrSwxFH3iJdLMDAVZ9FXSgxnzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fl9PFjJA5FFJ4qhLq984DmMBCjebtTo3/O6vkyRLvawHhX3XhdEcro8Y1/SC/Rr6YsJLHpj3pVy1av8Qgr6ejwy93l4dQXVWD7/iNOtrvWG5Tp2sovOeeOS7hkbJc0NuqEInYarWnEz9BKKs2H3OWqaY0vXcU9WDEMLsBLBi0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHS8UOGm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHS8UOGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750392926; x=1781928926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xCQxavBXCp55TStssRrSwxFH3iJdLMDAVZ9FXSgxnzA=;
  b=JHS8UOGmLT0oDE3sfdWnvlg4j+EoOtgTibYbp5Q3tOqFOyHT66VEUyOF
   jJecwt3CXoQJ8YO6OjWXpOi5cIyrgW4nQl2cLIcNC0FXwIHS5aBVF5JqH
   haD4+yrYz+wTA4ih6VCoAhVHjhLIBhTPC7rS/VYDg6qDS1BHDH0emAFZQ
   RraDuh/ADZJ1gjcEswCaqrKuEXG4VJqJ2e3BlJXVFqMrAcgtkq/t5uN7m
   iI5pwO1x1/hrsG3bl0/C15+7hGSCdrknNAe7ElhvT87oDb/S2/uW7nNnL
   gTB3x4Tu+Ut50NkkyGYecfUldpf+ssBaHfe9nh+/k8ZoAYj+gKU9aYA3C
   g==;
X-CSE-ConnectionGUID: I91abkSPS8ufbVX/sVSNgA==
X-CSE-MsgGUID: IOQjfWkhSsmZbq1l2tAVEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40256682"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="40256682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 21:15:25 -0700
X-CSE-ConnectionGUID: jIG7CSDLS92Aio2iueuDvg==
X-CSE-MsgGUID: dJxcZn9aRCe/I22uad8cCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="181674814"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jun 2025 21:15:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uST9u-000LMI-0V;
	Fri, 20 Jun 2025 04:15:22 +0000
Date: Fri, 20 Jun 2025 12:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
Message-ID: <202506201105.GOFGM9gF-lkp@intel.com>
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
In-Reply-To: <20250618-add-support-for-meta-clemente-bmc-v1-2-e5ca669ee47b@fii-foxconn.com>
References: <20250618-add-support-for-meta-clemente-bmc-v1-2-e5ca669ee47b@fii-foxconn.com>
TO: Leo Wang <leo.jt.wang@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: Kees Cook <kees@kernel.org>
TO: Tony Luck <tony.luck@intel.com>
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: bruce.jy.hung@fii-foxconn.com
CC: george.kw.lee@fii-foxconn.com
CC: Leo Wang <leo.jt.wang@fii-foxconn.com>

Hi Leo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 52da431bf03b5506203bca27fe14a97895c80faf]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Wang/Documentation-devicetree-bindings-arm-aspeed-aspeed-yaml/20250618-174140
base:   52da431bf03b5506203bca27fe14a97895c80faf
patch link:    https://lore.kernel.org/r/20250618-add-support-for-meta-clemente-bmc-v1-2-e5ca669ee47b%40fii-foxconn.com
patch subject: [PATCH 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250619 (https://download.01.org/0day-ci/archive/20250620/202506201105.GOFGM9gF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201105.GOFGM9gF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506201105.GOFGM9gF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
