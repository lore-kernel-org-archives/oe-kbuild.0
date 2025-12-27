Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A81FBEA8
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766859944; cv=none; b=bmLXx/5bfS/YIClOYut516gXXaArUsOKDSYQVcsM0KTP+R5tt98bLvgRlm4ikeXr3X5Moik47IXNJDu37XEBcEzi4BrRSJ2zMUrp8HljKTuYCa1NGJtNZh2xwcJ3ElIYsOdYuhh9bnsIMYdV2GqkhhTQp86cmkagvqBsHKSVncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766859944; c=relaxed/simple;
	bh=nLv1vVO3fTOGuEkocDWt76ZJUrx4jhIe/zcDWPtvBec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UfOT0fFzjDlpF1GjTt3IjKhJI0BI1DEPsXszHEBI88cquz/RWgiRqh4VZm3N3WTRK749ckXfhxS5o2nXm2a3hLphTosSI5fKqNuunwFz5+vO4pQ0NR2Pa4yUQHJLQEnAzKon2UfC9ZCQwJoQ3C9/rq5OlezbOxu53bXvll0biA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyjzaOqo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyjzaOqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766859943; x=1798395943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLv1vVO3fTOGuEkocDWt76ZJUrx4jhIe/zcDWPtvBec=;
  b=jyjzaOqoufL2YVHducEnfjSODXckDcpMI3Dk1DtLXTTEOjgosLZ0+g7k
   hLTymyGkzVhuGjNwMAkUM7rRhYMsvVo56vxf1bc3gqRaWJ1ua0Qo5BHCX
   wB8aLTNzb+12juMFeYZw7+GidvtkZFsuu6iZGKIn8QnAtH52WdLjy/v1p
   fq3mTKOKlTb3xTGW9ipW1Hhrr4/MaGumLvw6dMJWYWfcjA7nhcBJtQZS5
   EHqLpsOxGg36uOMnOGzNqPDJw6v4RvFKl8uu2vFsZAeFlrnbDMKSR32HH
   rp1MIV6SRL1kTeveMVFibSrZ2D3siMEhDptbfPBuc809wKdS5SAG5Lh8E
   Q==;
X-CSE-ConnectionGUID: LZ5fXiAMRtS10SIkWqye7Q==
X-CSE-MsgGUID: eSKmHSKjR66PKB4lY7h/sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79274774"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79274774"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 10:25:42 -0800
X-CSE-ConnectionGUID: TABDPAW2SEugDVG7CkAZUw==
X-CSE-MsgGUID: IVwrbj0hQzyszzRNHqgk9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="204712852"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 27 Dec 2025 10:25:41 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZYyx-000000007FM-0fvw;
	Sat, 27 Dec 2025 18:25:39 +0000
Date: Sat, 27 Dec 2025 19:25:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
Message-ID: <202512271957.CRMEXxsh-lkp@intel.com>
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
In-Reply-To: <20251224-ventura2_initial_dts-v2-2-f193ba5d4073@gmail.com>
References: <20251224-ventura2_initial_dts-v2-2-f193ba5d4073@gmail.com>
TO: Kyle Hsieh <kylehsieh1995@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Kyle Hsieh <kylehsieh1995@gmail.com>

Hi Kyle,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Hsieh/dt-bindings-arm-aspeed-add-Meta-ventura2-board/20251224-144815
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-2-f193ba5d4073%40gmail.com
patch subject: [PATCH v2 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2051-20251225 (https://download.01.org/0day-ci/archive/20251227/202512271957.CRMEXxsh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271957.CRMEXxsh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512271957.CRMEXxsh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: / (facebook,ventura2-rmc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'facebook,ventura2-rmc' is not one of ['delta,ahe50dc-bmc', 'facebook,galaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
   	'facebook,ventura2-rmc' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemitev2-bmc', 'facebook,wedge400-bmc', 'facebook,wedge400-data64-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'yadro,vegman-sx20-bmc']
   	'facebook,ventura2-rmc' is not one of ['ampere,mtjefferson-bmc', 'ampere,mtmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,bletchley-bmc', 'facebook,catalina-bmc', 'facebook,clemente-bmc', 'facebook,cloudripper-bmc', 'facebook,darwin-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,fuji-data64-bmc', 'facebook,greatlakes-bmc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,santabarbara-bmc', 'facebook,ventura2-bmc', 'facebook,yosemite4-bmc', 'facebook,yosemite5-bmc', 'ibm,balcones-bmc', 'ibm,blueridge-bmc', 'ibm,bonnell-bmc', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc', 'ibm,sbp1-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'nvidia,gb200nvl-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-bmc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /: failed to match any schema with compatible: ['facebook,ventura2-rmc', 'aspeed,ast2600']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: sdram@1e6e0000 (aspeed,ast2600-sdram-edac): compatible: ['aspeed,ast2600-sdram-edac', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/edac/aspeed,ast2400-sdram-edac.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: i2c@400 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,hw-timeout-ms' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bus@1e78a000/i2c@580/power-monitor@69: failed to match any schema with compatible: ['pmbus']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
