Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8FF2D47EA
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Feb 2026 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770923384; cv=none; b=uxAjgY1wq37oZDPwAlDHM/2loeU8Ezjx6QBPnZVLgEVi0+yx1uNZ01UZF7M6s4JGSmaKKRWyaDGGGWUiP3HlBCzNJMKzg9YVhJ+3R6sVvYQE9OD9UEL1W2CXHegAxqfMX0D0qM5M7AQkknvrXdCA96n4Gn2U58YgNeCUiLGSoOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770923384; c=relaxed/simple;
	bh=6WtTWJx0T8m48x8bui995NSo72jC6m2/He15ZKkmNLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LC/4AGIlBS1YOsYAdG5XwIu9LK/tB8EpnUG6AO225DpVQx8uuAzp3rgkK7BNrFOSRLuvdOG+VaIP18e/lta18qiSJLEvFjmeVlzKobaC7TboZouO5bh9NCyB0Mtz9EFi2kJbMcvfVktlYJJNOhJsipq3To/I/FmYyX4D/y2mB9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RR2/mvj1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RR2/mvj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770923380; x=1802459380;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6WtTWJx0T8m48x8bui995NSo72jC6m2/He15ZKkmNLk=;
  b=RR2/mvj1DNkhN/2KijDTXqXQhIRVJUeQ3VK6hfo02nbXEKn/17J/QxiX
   zJCXSQzsxwbZeACkU/XLJ6vrdcvVGe9CJJjflCaEpOosKETHnB4KpNRjX
   dCF9z656XY8Z01ObTFbAf2BG5e+aYGe1PEiHRskFbQnSoyal6bM3m0h1g
   GZTNcPx1EhdTWTCuS6NXCjLnvP5+qqZjJGQ35GS1/qZLXf/zhTAyaTE4F
   QRAOY6vHWGzxwDDoG9SZR2mRagtWs9QgWpA8/KjOuTM3aOqfaqejCDkt/
   0clfneIeFWJ3SZy/9Zmo1Od95VXeBprjG/US6GgyjQr5zSZwZ0GQVw5vt
   A==;
X-CSE-ConnectionGUID: /BAWwkdFT7uEJsk0FJAUMg==
X-CSE-MsgGUID: XUllDXRgSx6TS9g+TWIcaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72289501"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="72289501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 11:09:40 -0800
X-CSE-ConnectionGUID: jB8W3yh8SWqYjlIeQ9OT4A==
X-CSE-MsgGUID: NrTO534gSm619okZ65Bydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="216888404"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Feb 2026 11:09:37 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqc4G-000000001Mn-0MNc;
	Thu, 12 Feb 2026 19:09:36 +0000
Date: Thu, 12 Feb 2026 20:08:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] dt-bindings: hwmon: convert npcm750-pwm-fan to DT
 schema
Message-ID: <202602122000.AE5CPi8e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260210154117.1126857-1-tmaimon77@gmail.com>
References: <20260210154117.1126857-1-tmaimon77@gmail.com>
TO: Tomer Maimon <tmaimon77@gmail.com>
TO: andrew@codeconstruct.com.au
TO: avifishman70@gmail.com
TO: tali.perry1@gmail.com
TO: linux@roeck-us.net
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: venture@google.com
CC: yuenn@google.com
CC: benjaminfair@google.com
CC: openbmc@lists.ozlabs.org
CC: linux-hwmon@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Tomer Maimon <tmaimon77@gmail.com>

Hi Tomer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.19 next-20260211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bind=
ings-hwmon-convert-npcm750-pwm-fan-to-DT-schema/20260211-000136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stagin=
g.git hwmon-next
patch link:    https://lore.kernel.org/r/20260210154117.1126857-1-tmaimon77=
%40gmail.com
patch subject: [PATCH v1] dt-bindings: hwmon: convert npcm750-pwm-fan to DT=
 schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260211 (https://download.01.org/0day-ci/archi=
ve/20260212/202602122000.AE5CPi8e-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43=
d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260212/202602122000.AE5CPi8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602122000.AE5CPi8e-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: clock-controller@f080=
1000 (nuvoton,npcm750-clk): 'clock-controller' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm750-cl=
k.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: clock-controller@f080=
1000 (nuvoton,npcm750-clk): compatible: ['nuvoton,npcm750-clk', 'syscon'] i=
s too long
   	from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm750-cl=
k.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: /ahb/spi@fb000000: fa=
iled to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: /ahb/spi@c0000000: fa=
iled to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: /ahb/spi@fb001000: fa=
iled to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: apb (simple-bus): wat=
chdog@901C: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: /ahb/apb/lpc_kcs@7000=
: failed to match any schema with compatible: ['nuvoton,npcm750-lpc-kcs', '=
simple-mfd', 'syscon']
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@0:fan-tach-ch:0: size is 16, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:0: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:1: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:0: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:1: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:fan-tach-ch:0: size is 16, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@2:cooling-levels:0: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@2:cooling-levels:1: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@2:cooling-levels:0: size is 8, expected=
 32
--
   	from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm750-cl=
k.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: clock-controller@f080=
1000 (nuvoton,npcm750-clk): compatible: ['nuvoton,npcm750-clk', 'syscon'] i=
s too long
   	from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm750-cl=
k.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: /ahb/spi@fb000000: fa=
iled to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: /ahb/spi@c0000000: fa=
iled to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: /ahb/spi@fb001000: fa=
iled to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: apb (simple-bus): wat=
chdog@901C: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: /ahb/apb/lpc_kcs@7000=
: failed to match any schema with compatible: ['nuvoton,npcm750-lpc-kcs', '=
simple-mfd', 'syscon']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: /ahb/apb/spi@201000/j=
tag_master@0: failed to match any schema with compatible: ['nuvoton,npcm750=
-jtag-master']
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@0:fan-tach-ch:0: size is 8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:fan-tach-ch:0: size is 8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@2:fan-tach-ch:0: size is 8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@3:fan-tach-ch:0: size is 8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@4:fan-tach-ch:0: size is 8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dtb: i2c-mux@71 (nxp,pca95=
46): i2c@0: Unevaluated properties are not allowed ('pcie-slot' was unexpec=
ted)
--
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: clock-controller@f080=
1000 (nuvoton,npcm750-clk): 'clock-controller' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm750-cl=
k.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: clock-controller@f080=
1000 (nuvoton,npcm750-clk): compatible: ['nuvoton,npcm750-clk', 'syscon'] i=
s too long
   	from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm750-cl=
k.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: /ahb/spi@fb000000: fa=
iled to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: /ahb/spi@c0000000: fa=
iled to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: /ahb/spi@fb001000: fa=
iled to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: apb (simple-bus): wat=
chdog@901C: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: /ahb/apb/lpc_kcs@7000=
: failed to match any schema with compatible: ['nuvoton,npcm750-lpc-kcs', '=
simple-mfd', 'syscon']
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@0:fan-tach-ch:0: size is 16, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:0: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:1: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:0: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:1: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@1:fan-tach-ch:0: size is 16, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@2:cooling-levels:0: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@2:cooling-levels:1: size is 8, expected=
 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@10=
3000 (nuvoton,npcm750-pwm-fan): fan@2:cooling-levels:0: size is 8, expected=
 32
--
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: /ahb/spi@f=
b000000: failed to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: flash@1 (j=
edec,spi-nor): Unevaluated properties are not allowed ('npcm,fiu-rx-bus-wid=
th' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: flash@1 (j=
edec,spi-nor): 'npcm,fiu-rx-bus-width' does not match any of the regexes: '=
^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|g=
pmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '=
^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rc=
ar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|=
st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^9tripod,=
=2E*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-=
zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', =
'^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,=
=2E*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,=
=2E*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvisio=
n,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*'=
, '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediat=
ech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.=
*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anlog=
ic,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^apt=
ina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,=
=2E*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.=
*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*',=
 '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '=
^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*=
', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axenti=
a,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^b=
ananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^bhf=
,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blu=
tek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*=
', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur=
,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^cal=
xeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascod=
a,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', =
'^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comv=
etia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^co=
rtina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '=
^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubi=
etech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^=
dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*'=
, '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff=
,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*=
', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,=
=2E*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^eb=
ang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econe=
t,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egn=
ite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin=
,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*'=
, '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emt=
rion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^eukrea,.=
*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.=
*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphon=
e,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower,.*', '^flipkart,.*=
', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^genia=
tech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', =
'^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*'=
, '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumst=
ix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardker=
nel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hi=
max,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^hitron,.*', '^holt,.*', '^holtek,.*', '^honestar,.*',=
 '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.=
*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^h=
xt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*=
', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^=
ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.=
*', '^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^=
inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*',=
 '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,=
=2E*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,=
=2E*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^i=
te,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^j=
asonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,=
=2E*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^jutouch,.*', '^kam=
,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpe=
ter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '=
^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', =
'^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,=
=2E*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^=
lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^li=
cheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^link=
ease,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '=
^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd=
,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*',=
 '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,=
=2E*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,=
=2E*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlin=
ear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*',=
 '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '=
^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '=
^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^mic=
rochip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.=
*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milianke,.*', '^milkv,=
=2E*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi=
,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*',=
 '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motor=
ola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^msc=
c,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.=
*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^ne=
ardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcube,.*', '^net=
gear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '=
^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*=
', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic=
,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.*', '^nuclei=
,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*=
', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', =
'^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*=
', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openem=
bed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^=
oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*'=
, '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^pa=
nasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^peg=
atron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '=
^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,=
=2E*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*'=
, '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^=
pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^p=
owervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^pro=
box2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*'=
, '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishengl=
ong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.=
*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^rays=
tar,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesa=
s,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richte=
k,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*=
', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '=
^roseapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^s=
amtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindl=
er,.*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*',=
 '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.=
*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', =
'^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shin=
eworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^=
siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*=
', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,=
=2E*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', =
'^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', =
'^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^=
smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.=
*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*'=
, '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkf=
un,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^=
sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^sta=
rtek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^=
storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^=
sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^s=
ynology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '=
^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display=
,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', =
'^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*',=
 '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*=
', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '=
^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*=
', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^=
tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,=
=2E*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '=
^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo=
,.*', '^ufispace,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^un=
i-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^u=
too,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*'=
, '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^video=
strong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vi=
tesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltaf=
ield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*=
', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek=
,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*'=
, '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*=
', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wob=
o,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*'=
, '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.=
*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yam=
aha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^y=
na,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzu=
kihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*',=
 '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: /ahb/spi@c=
0000000: failed to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: /ahb/spi@f=
b001000: failed to match any schema with compatible: ['nuvoton,npcm750-fiu']
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: apb (simpl=
e-bus): watchdog@901C: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: /ahb/apb/l=
pc_kcs@7000: failed to match any schema with compatible: ['nuvoton,npcm750-=
lpc-kcs', 'simple-mfd', 'syscon']
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-co=
ntroller@103000 (nuvoton,npcm750-pwm-fan): fan@0:fan-tach-ch:0: size is 16,=
 expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-co=
ntroller@103000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:0: size is =
8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-co=
ntroller@103000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:1: size is =
8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
>> arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-co=
ntroller@103000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:0: size is =
8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-co=
ntroller@103000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:1: size is =
8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-co=
ntroller@103000 (nuvoton,npcm750-pwm-fan): fan@1:fan-tach-ch:0: size is 16,=
 expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-co=
ntroller@103000 (nuvoton,npcm750-pwm-fan): fan@2:cooling-levels:0: size is =
8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-co=
ntroller@103000 (nuvoton,npcm750-pwm-fan): fan@2:cooling-levels:1: size is =
8, expected 32
   	from schema $id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.ya=
ml
   arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-co=
ntroller@103000 (nuvoton,npcm750-pwm-fan): fan@2:cooling-levels:0: size is =
8, expected 32

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
