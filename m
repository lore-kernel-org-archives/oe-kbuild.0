Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393581173F
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722774939; cv=none; b=c6233yWzKZ+ezeXbEw8gIflO7GhOXzrN9DSfpmY4iXe6ASx81BIT+9Sp44n3Bc0QxR8LQPQpVYBciPgxqNKAuaBT8zfCnr6zedVaNIKybK1J2u+6Nqh3mWRueYR4FsUBJP96785kLBquVH7ynl3sPft+gPUCydKBAgZgJJcw6LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722774939; c=relaxed/simple;
	bh=jHprluxh7mlbxyN5D7X0AAoqCO/QXLMGtvC2koODByQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIpsBkSLgtgxfThmUcKlTQxzQYp8fvl679akNjLzTCDY2YwkbqmehugU1xVVOXN5v6yw/kQ//rg+l+PDxwUS/19Q4e0j9qN1chDK86Vb2flelga1oIEm9KN+mxEKA1ca/RDQfQDRw/54ZEUd3ydgJnNmiZv8E+yPAlrcQZeiBbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDnBfNSA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDnBfNSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722774936; x=1754310936;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jHprluxh7mlbxyN5D7X0AAoqCO/QXLMGtvC2koODByQ=;
  b=hDnBfNSAVRQq7zwXrOk//t+8TXz1SeOF9aExx3L14mTt805AiIaldyZf
   wE6uvmY/gmSvYubja2morMExNWs1ckS5uUc5HHhnvt4jKeHmYEOjpaX44
   fS8rXlZbFDVYmNBVI3fx1pogqjaNA5YDJV9FXq3zmZp2O5fDdNO/0rktK
   orpcO+LjrV77nXHV/At4tEtQ6uvrLgZcGfUDvmkSaNPSJ7kP7ZQCFIvNV
   gpZlxv97HX/BXH1CO0vbnptjpwWedTBpBdURFdT4pJ+LntoOW6HWTG07Z
   EmLxTk6be+/O3HSZPjyK/Zx8nh2By0rg9t3mbCTp9QYd03n10RTquyf9j
   w==;
X-CSE-ConnectionGUID: oRv52cebRMitmjdT+7LDhw==
X-CSE-MsgGUID: txtCyD+3R+iuEjf0uZXjzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31893925"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="31893925"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 05:35:35 -0700
X-CSE-ConnectionGUID: FodwMoT6Tae6sM7Kcp2lDw==
X-CSE-MsgGUID: DwBDRj4FQaCrsBXl15Sk4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="86465815"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2024 05:35:34 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saaSR-0001R4-0i;
	Sun, 04 Aug 2024 12:35:31 +0000
Date: Sun, 4 Aug 2024 20:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/7] ARM: dts: aspeed-g6: Use generic 'ethernet' for
 ftgmac100 nodes
Message-ID: <202408042047.QacYrVgW-lkp@intel.com>
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
In-Reply-To: <20240802-dt-warnings-bmc-dts-cleanups-v1-6-1cb1378e5fcd@codec=
onstruct.com.au>
References: <20240802-dt-warnings-bmc-dts-cleanups-v1-6-1cb1378e5fcd@codeco=
nstruct.com.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: Eddie James <eajames@linux.ibm.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Jeffery/ARM-d=
ts-aspeed-Fix-coprocessor-interrupt-controller-node-name/20240803-065329
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240802-dt-warnings-bmc-dts-clean=
ups-v1-6-1cb1378e5fcd%40codeconstruct.com.au
patch subject: [PATCH 6/7] ARM: dts: aspeed-g6: Use generic 'ethernet' for =
ftgmac100 nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20240803 (https://download.01.org/0day-ci/archiv=
e/20240804/202408042047.QacYrVgW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240804/202408042047.QacYrVgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408042047.QacYrVgW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'aspeed,ast2600-evb-a1' is not one of ['amd,daytonax-bmc', 'amd,ethanol=
x-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', =
'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', '=
asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,m=
inipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yose=
mitev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,m=
ihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,with=
erspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6=
-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', =
'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,ce=
ntriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-=
bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc',=
 'yadro,vegman-sx20-bmc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	'aspeed,ast2600' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: timer: 'clocks' does=
 not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /sdram@1e6e0000: fai=
led to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sys=
con']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: bus@1e600000: compat=
ible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e660000: p=
hy-mode:0: 'rgmii-rxid' is not one of ['rgmii', 'rmii']
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e660000: U=
nevaluated properties are not allowed ('#address-cells', '#size-cells' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e680000: p=
hy-mode:0: 'rgmii-rxid' is not one of ['rgmii', 'rmii']
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e680000: U=
nevaluated properties are not allowed ('#address-cells', '#size-cells' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e670000: U=
nevaluated properties are not allowed ('#address-cells', '#size-cells' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: ethernet@1e690000: U=
nevaluated properties are not allowed ('#address-cells', '#size-cells' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: syscon@1e6e2000: 'sm=
p-memram@180' does not match any of the regexes: '^interrupt-controller@[0-=
9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id=
@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/syscon@1e6e=
2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,a=
st2600-smpmem']
--
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: timer: 'clocks' does no=
t match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /sdram@1e6e0000: failed=
 to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon=
']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: bus@1e600000: compatibl=
e: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e660000: phy-=
mode:0: 'rgmii-rxid' is not one of ['rgmii', 'rmii']
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e660000: Unev=
aluated properties are not allowed ('#address-cells', '#size-cells' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e680000: phy-=
mode:0: 'rgmii-rxid' is not one of ['rgmii', 'rmii']
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e680000: Unev=
aluated properties are not allowed ('#address-cells', '#size-cells' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e670000: Unev=
aluated properties are not allowed ('#address-cells', '#size-cells' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: ethernet@1e690000: Unev=
aluated properties are not allowed ('#address-cells', '#size-cells' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: syscon@1e6e2000: 'smp-m=
emram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-=
f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0=
-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/syscon@1e6e200=
0/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2=
600-smpmem']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: timer: 'clo=
cks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /sdram@1e6e=
0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-ed=
ac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: bus@1e60000=
0: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000: Unevaluated properties are not allowed ('#address-cells', '#size-ce=
lls', 'mellanox,multi-host', 'ncsi-channel', 'ncsi-ctrl,no-channel-monitor'=
, 'ncsi-ctrl,start-redo-probe', 'ncsi-package', 'ncsi-rexmit', 'ncsi-timeou=
t' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000: 'ncsi-ctrl,no-channel-monitor', 'ncsi-ctrl,start-redo-probe' do not=
 match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[=
ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|=
max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-single|PowerPC),.*', =
'^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-au=
dio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*',=
 '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-=
9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abili=
s,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^=
acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^ada=
pteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*=
', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,=
=2E*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^all=
iedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '=
^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '=
^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*',=
 '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*',=
 '^anvo,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.=
*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^aries,.*', '=
^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi=
-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs=
,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auv=
idea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '=
^axentia,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi=
,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.=
*', '^bitmain,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^=
brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.=
*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxe=
da,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,=
=2E*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '=
^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*=
', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chron=
tel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',=
 '^cisco,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', =
'^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*', '^coolpi,.*', '=
^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^c=
reative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,=
=2E*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^=
cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delt=
a,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '=
^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^d=
ioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^d=
ongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dser=
ve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.=
*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^e=
es,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.=
*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '=
^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix=
,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^ene,.*', '^energymic=
ro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*'=
, '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspi=
n,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.=
*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fasc=
ontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*'=
, '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^freebox,.*', '^freecom,.=
*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', =
'^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gatework=
s,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gemei,.*', '^gem=
tek,.*', '^genesys,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^=
glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goldelico,.*',=
 '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn=
,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.=
*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschma=
nn,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^=
holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '=
^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^hwa=
com,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', =
'^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '=
^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '=
^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce=
,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inno=
lux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^=
intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^io=
m,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*',=
 '^jdi,.*', '^jedec,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide=
,.*', '^joz,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^k=
hadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnove=
l,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^k=
osagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^=
lantiq,.*', '^lattice,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,=
=2E*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,=
=2E*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineartechnology,=
=2E*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^li=
nx,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno=
,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^=
lsi,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^m=
acnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^me=
as,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis=
,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo=
,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*'=
, '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mic=
rosys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^mi=
niand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mit=
sumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtroni=
x,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^=
moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^ms=
i,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murat=
a,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '=
^nec,.*', '^neonode,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^=
netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*'=
, '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nok=
ia,.*', '^nordic,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsbo=
ard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', =
'^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^o=
neplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.=
*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '=
^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', =
'^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', =
'^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^=
parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^p=
hytec,.*', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^p=
lantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', =
'^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', '^poslab,.=
*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^primeview,.=
*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*'=
, '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*',=
 '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*',=
 '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', =
'^realtek,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^revotics=
,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '=
^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roof=
ull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^samsung,.*', '^samtec,=
=2E*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.=
*', '^schneider,.*', '^sciosense,.*', '^seagate,.*', '^seeed,.*', '^seirobo=
tics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', =
'^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*',=
 '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.=
*', '^si-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', '^=
sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-in=
sight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.=
*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.=
*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*',=
 '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionex=
t,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourcepar=
ts,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^squa=
re,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^s=
tarfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^st=
ericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '=
^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', =
'^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*'=
, '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^=
technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet=
,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.*', '^tfc,.*', =
'^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^=
ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^to=
ppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk=
,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '=
^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,=
=2E*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*'=
, '^ufispace,.*', '^ugoos,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '=
^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamr=
s,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*'=
, '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*'=
, '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', =
'^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,=
=2E*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*',=
 '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^wi=
dora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^=
winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,=
=2E*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', =
'^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*=
', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yama=
ha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yn=
a,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.=
*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^z=
te,.*', '^zyxel,.*', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: syscon@1e6e=
2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-contr=
oller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^s=
ilicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/sy=
scon@1e6e2000/smp-memram@180: failed to match any schema with compatible: [=
'aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/sy=
scon@1e6e2000/interrupt-controller@560: failed to match any schema with com=
patible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/sy=
scon@1e6e2000/interrupt-controller@570: failed to match any schema with com=
patible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/di=
splay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast260=
0-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: adc@1e6e900=
0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: adc@1e6e910=
0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
