Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E62E3706
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Jul 2025 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720039; cv=none; b=X31r9OFrX1FgVREGfUi8ZGhtqjahofwiiLfkTqd9mW/SXUrEq6FMmdF22WTG4x6JDot/lZ1Uj8gFEbh9dhJ7KhrTqmo7I35mbLP38aMOwFG/5hZLs7tCDmNiD98STIyrs7vGSDZ+4AZOi+2CFfKr7M5/p0GulBjPEq0iJf0otzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720039; c=relaxed/simple;
	bh=sz9DC5yuMFB0s+wD68MUygz+VwCPiqEu5phVUjgPf+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVEiCcKL4ejrudLk2qBarWzvUbKYjx6hUI7rhL9w71EZ+OYopNCsaMqmuh2EWOzHBY8sRnkhlN3t5W1ytG+78GY7kxd5F5poDrEJUA80bAglnhG2b0AuAYGpl6g0InmHHT2yqM6ItQN9QzljbENCdGdBg9w/frN7osdD8+0Mbww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHQR29YO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHQR29YO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751720037; x=1783256037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sz9DC5yuMFB0s+wD68MUygz+VwCPiqEu5phVUjgPf+E=;
  b=cHQR29YOep6GBUxVi7S3iH6MByXG6XRc1N/PqqkBP7SibXQqWLdfdH0E
   MSLjN+IUIB41dXpnkRJRzyraVMWXjOckHaQwcfqF237MbWckuMadsaLN0
   0BfO52R63FwyvjtNegfUDqpfAbR4Yt7dvo66aPgvnvlmQzp3/QTCM7BP9
   p0tmoKvyBH2w6X1Cr4yXNHaj4DSlf7NBC+ESn1cD+KsPQbWqjomjsTvs+
   4+hitX4CKKzlS8NDJ9obw2sc31PpRYRGhX5vwwirG89VtI0bw5taAaBAw
   otVysceBHLc6dZzWiHb6x8Nf/weMth+IGMyLOmwcztwb8SvP/htY9Kz5O
   A==;
X-CSE-ConnectionGUID: qZUvtgzYRtGESBope8MREw==
X-CSE-MsgGUID: vWx3cDmDTfWG3K01TO77ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="65360606"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="65360606"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 05:53:56 -0700
X-CSE-ConnectionGUID: I2oY8noVTtq0LI85gO55Fg==
X-CSE-MsgGUID: V+G0JnOGTTe5LwPtOi8KXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="154239105"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Jul 2025 05:53:55 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY2Ou-0004Ul-2A;
	Sat, 05 Jul 2025 12:53:52 +0000
Date: Sat, 5 Jul 2025 20:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <202507052013.eBxBQ13Y-lkp@intel.com>
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
In-Reply-To: <20250702050421.13729-6-rentao.bupt@gmail.com>
References: <20250702050421.13729-6-rentao.bupt@gmail.com>
TO: rentao.bupt@gmail.com
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org
TO: Tao Ren <taoren@meta.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/rentao-bupt-gmail-com/ARM-dts-aspeed-Expand-data0-partition-in-facebook-bmc-flash-layout-128-dtsi/20250702-130721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250702050421.13729-6-rentao.bupt%40gmail.com
patch subject: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20250702 (https://download.01.org/0day-ci/archive/20250705/202507052013.eBxBQ13Y-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f1a4bb62452d88a0edd9340b3ca7c9b11ad9193f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507052013.eBxBQ13Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507052013.eBxBQ13Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: / (facebook,darwin-bmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'facebook,darwin-bmc' is not one of ['delta,ahe50dc-bmc', 'facebook,galaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
   	'facebook,darwin-bmc' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'yadro,vegman-sx20-bmc']
   	'facebook,darwin-bmc' is not one of ['ampere,mtjefferson-bmc', 'ampere,mtmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,bletchley-bmc', 'facebook,catalina-bmc', 'facebook,cloudripper-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,greatlakes-bmc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,yosemite4-bmc', 'ibm,blueridge-bmc', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc', 'ibm,sbp1-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-bmc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /: failed to match any schema with compatible: ['facebook,darwin-bmc', 'aspeed,ast2600']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts', 'ref_voltage' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts', 'ref_voltage' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: kcs@28 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: kcs@2c (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: kcs@114 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: spi (spi-gpio): gpio-miso: False schema does not allow [64, 189, 0]
   	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: spi (spi-gpio): gpio-mosi: False schema does not allow [64, 188, 0]
   	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: spi (spi-gpio): gpio-sck: False schema does not allow [64, 187, 0]
   	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: spi (spi-gpio): 'sck-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: spi (spi-gpio): Unevaluated properties are not allowed ('gpio-miso', 'gpio-mosi', 'gpio-sck' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
