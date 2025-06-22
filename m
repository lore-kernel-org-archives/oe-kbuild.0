Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33958199920
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jun 2025 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750604039; cv=none; b=sVSCNQZ5jMt7kw9zjfD7wU8eGd/sY8IhlSEcER/7hxzHypJIaGe9nEPXuYDxG49BFTqZbQkn/jE2DACWTP1SLBGQv8eRZI9mhx1fVoNN6oDQAoXAeuE3L0qiPj+0p7pokzXL/uDHzVWaG5EXtatE+w0+QVICNewHVxNj/SVQ3jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750604039; c=relaxed/simple;
	bh=Z49bI35dDxEpllIfAhKkjU6vUPjG08uEyATDEvheTsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lqckOXwtjPMH0Ew5s4vOjA/llauYGaJ3T9eLV6lWhxyAKlEqol0jH1se+ue6aovdoGFbdsKm664Ka0KfXiOidmXnTTRo9qlvEsmeRe78oS4A/6JohhKwF+5IZ3yWUJ6XUIgBYqA6S9YQC3ypjH4+uOjrfkgHXDfXe18O/h7gzEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwc4xAKl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwc4xAKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750604037; x=1782140037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z49bI35dDxEpllIfAhKkjU6vUPjG08uEyATDEvheTsI=;
  b=hwc4xAKlbpjDMTNcJxpwHa2W5wN8GSR1LaKOy9iPUQ8ZhwdlqOFbRzyQ
   5AHzWkVWx/6vaA/f5YS5P2OE2MIprgrM+qE3Oztz/opCz+toE2dtZcelj
   n9UrtHAAfCAUEU6EgW1xvRXCfKUA3WvV6RnBLlGYoJrifC+DjP8s7zjWG
   ldykE8/EKW2fXBMmCKF4/AOX7cfJgSZ83OVLulbc3vvpHIQU3ussvNsSr
   WCwDhg9KbCqe0KCfZvrxiucJ+d7qjxRqGcR0Jitu6j3c8DuvrScdtbgxr
   PVm00GDcLFsWwno+38ePucuzSGv6v54fFq5hUqF5MHsYBF/Kms2wQOlnq
   Q==;
X-CSE-ConnectionGUID: +ZWkDa0jQiS5Dx3Z7cERow==
X-CSE-MsgGUID: Ah+jGTm0QTOU62OAkPV9MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="63494861"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="63494861"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 07:53:56 -0700
X-CSE-ConnectionGUID: UmHofSWgR56iSladR3BclA==
X-CSE-MsgGUID: xvIkfoJRRpqQczhXIsIT9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="151574736"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2025 07:53:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTM4u-000NLy-2k;
	Sun, 22 Jun 2025 14:53:52 +0000
Date: Sun, 22 Jun 2025 22:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
Message-ID: <202506222213.cFftMr8q-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20250619 (https://download.01.org/0day-ci/archive/20250622/202506222213.cFftMr8q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506222213.cFftMr8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506222213.cFftMr8q-lkp@intel.com/

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
