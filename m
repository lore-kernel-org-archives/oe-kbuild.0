Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD6846BF
	for <oe-kbuild@lists.linux.dev>; Fri, 16 May 2025 04:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747369370; cv=none; b=VoE7E/BwM/mK+Aa+q66MV+cl6YfOWLEKT5PUAqoop84zcuva3+vQqZR/0hwlALHiIpmKhKCoG6q8jfYKUMV9pEHn4p/vRtrOHLyiZOcEemYR2DxFB/CfLPVKm5aVlRZfH1/ZiW6QpblA7zjZRM1mnubX7Tm4ySHiDEQmiz4LkUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747369370; c=relaxed/simple;
	bh=EHZLPYjQ6qa6saFHLdEsYldMSvKzaUU65f5D2uiSjrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BfL1D01MYT8Tgwi6iICi5TBCbgZwiYaLWVAkz6mLtH3R/aW7owSkwipU3nfjXpSGpgbYasUTicetKHiL7pkWFF35qtDYV2QDm8bXYIHVS/SZWB5kMsp8OyjDd4hCLLwTWBM7fJrTUkgsSGhXpRReZvo2VjOyf6rSBXb/Xui4SL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yrzs2Hq5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yrzs2Hq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747369365; x=1778905365;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EHZLPYjQ6qa6saFHLdEsYldMSvKzaUU65f5D2uiSjrA=;
  b=Yrzs2Hq5Nvn0lH7HzlRWQcXV3q2iHG+rMQgKG9Z1RxCODIRylKt0Gggr
   fjwb8BCNsvX6ckkFT9x0OcaEzEgKPOKe97eZx0Nrpxfe7VcTUUavxwtpT
   dYUhiDZkTYTdjgwEyBWcUt3+FUHOxZoj4kzY9ilP6h00mN7fIVFfz/Lt0
   u8da/oJu+0gjl+crrYcg/9g2XudNf5QXQb3kk9Pz61AOOovjvCK6LfoR7
   kygVBISk3vcw/rf743IarZuyN+NIzmfie/0YwuewarCIMQUe5K/B/YYVq
   e8frzv5abjKx2jjat94N1jFxxyM9SlKpu6ESPyHIwjVTQogbl3djxeJuf
   Q==;
X-CSE-ConnectionGUID: +cG0le4LQLS+T6P6i78S7A==
X-CSE-MsgGUID: sOzkmX8TRuKKTwEKDK9bjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66733992"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="66733992"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 21:22:43 -0700
X-CSE-ConnectionGUID: Flf+qeF7Q06DAEORPTw0Zg==
X-CSE-MsgGUID: r0Y1SY4/QuqlJHNkildrMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138460712"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2025 21:22:42 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFmal-0000L5-1S;
	Fri, 16 May 2025 04:22:39 +0000
Date: Fri, 16 May 2025 12:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb:
 syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of
 the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$',
 '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', ...
Message-ID: <202505161236.hFduFMTN-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Yin <peteryin.openbmc@gmail.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: Joel Stanley <joel@jms.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f1f2797f8a2478b6b2f731b4f70a87d313f9b41a
commit: bb3776e564d2190db0ef45609e66f13c60ce5b48 ARM: dts: aspeed: Harma: A=
dd Meta Harma (AST2600) BMC
date:   1 year ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year ago
config: arm-randconfig-2052-20250514 (https://download.01.org/0day-ci/archi=
ve/20250516/202505161236.hFduFMTN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250516/202505161236.hFduFMTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505161236.hFduFMTN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: ftgmac@1e670000 =
(aspeed,ast2600-mac): $nodename:0: 'ftgmac@1e670000' does not match '^ether=
net(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: ftgmac@1e690000 =
(aspeed,ast2600-mac): $nodename:0: 'ftgmac@1e690000' does not match '^ether=
net(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: ftgmac@1e690000 =
(aspeed,ast2600-mac): Unevaluated properties are not allowed ('#address-cel=
ls', '#size-cells', 'mlx,multi-host' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: ftgmac@1e690000 =
(aspeed,ast2600-mac): 'mlx,multi-host' does not match any of the regexes: '=
^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|g=
pmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '=
^(pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|=
rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|=
ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '=
^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z=
0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,=
=2E*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '=
^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*',=
 '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aero=
flexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^alde=
c,.*', '^alfa-network,.*', '^allegro,.*', '^alliedvision,.*', '^allo,.*', '=
^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amar=
ula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.=
*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '=
^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^=
arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspee=
d,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.=
*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,=
=2E*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*', =
'^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bell=
ing,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blutek,.*', '^boe,.=
*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^=
bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^cal=
ao,.*', '^calaosystems,.*', '^calxeda,.*', '^canaan,.*', '^caninos,.*', '^c=
apella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdte=
ch,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^c=
hefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*'=
, '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^ci=
rrus,.*', '^cisco,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^=
cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*', '^cool=
pi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane=
,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*=
', '^ctu,.*', '^cubietech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic=
,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*'=
, '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difr=
nce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.=
*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwo=
on,.*', '^dptechnics,.*', '^dragino,.*', '^ds,.*', '^dserve,.*', '^dynaimag=
e,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^e=
ckelmann,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*'=
, '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '=
^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^eml=
id,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,=
=2E*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engled=
er,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus=
,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar=
,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild=
,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs=
,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*=
', '^forlinx,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,=
=2E*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gardena,.=
*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', =
'^gef,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^geniatech,.*', '^gia=
ntec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*'=
, '^gmt,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^g=
plus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*',=
 '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep=
,.*', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*'=
, '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '=
^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^hu=
awei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', =
'^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus=
,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*=
', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.=
*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoini=
c,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', =
'^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec=
,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*=
', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*',=
 '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jesurun,.*', '^jeth=
ome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*', '^karo,.*', '^keit=
hkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', =
'^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', =
'^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', =
'^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lctech,.*', '^lea=
dtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^=
lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lineartechn=
ology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', =
'^linx,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logicte=
chno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*'=
, '^lsi,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*',=
 '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.=
*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', =
'^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^mel=
exis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^m=
enlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel=
,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '=
^microsys,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^=
minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^m=
ixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moor=
tec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^m=
pl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^msta=
r,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic=
,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^=
netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*'=
, '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing=
,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nov=
atek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^n=
vd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^oka=
ya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^o=
nion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^open=
cores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^option,.*'=
, '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc=
,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', =
'^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^=
pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]=
+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^platho=
me,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^po=
laroid,.*', '^polyhex,.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^power=
tip,.*', '^powervr,.*', '^powkiddy,.*', '^primux,.*', '^probox2,.*', '^prt,=
=2E*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', =
'^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^qua=
nta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspb=
errypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^remarkable,.*', '^re=
nesas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ric=
oh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktec=
h,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*'=
, '^saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '=
^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^seiro=
botics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*'=
, '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*=
', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en=
,.*', '^si-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,.*', =
'^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-=
insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek=
,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf=
,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartlabs,.*=
', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socion=
ext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourcep=
arts,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^sq=
uare,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '=
^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^=
stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*',=
 '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*'=
, '^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.=
*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tdo,.*', '^team-source-display,.*', =
'^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teej=
et,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.*', '^tfc,.*'=
, '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', =
'^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^=
toppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^t=
pk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*',=
 '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tya=
n,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*'=
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
=2E*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
llybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^x=
nano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-opto=
electronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-top=
tech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', =
'^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/usb@1e6b000=
0: failed to match any schema with compatible: ['aspeed,ast2600-uhci', 'gen=
eric-uhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/usb@1e6b000=
0: failed to match any schema with compatible: ['aspeed,ast2600-uhci', 'gen=
eric-uhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: syscon@1e6e2000 =
(aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '=
^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0=
-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: syscon@1e6e2000 =
(aspeed,ast2600-scu): pinctrl: 'oneOf' conditional failed, one must be fixe=
d:
   	'aspeed,external-nodes' is a required property
   	'aspeed,ast2400-pinctrl' was expected
   	'aspeed,ast2500-pinctrl' was expected
   	'EMMC' is not one of ['ACPI', 'ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12'=
, 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7'=
, 'ADC8', 'ADC9', 'BMCINT', 'DDCCLK', 'DDCDAT', 'EXTRST', 'FLACK', 'FLBUSY'=
, 'FLWP', 'GPID', 'GPID0', 'GPID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', 'GP=
IE4', 'GPIE6', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4',=
 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'LPCPD', 'LPCPME', 'LPCRST', 'LPCS=
MI', 'MAC1LINK', 'MAC2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3', '=
NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDS=
R4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NDTS4', 'NRI1', 'NRI2', 'NRI3', '=
NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'OSCCLK', 'PWM0', 'PWM1', 'PWM2', 'PWM3',=
 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'RMII1', 'RMII2', 'ROM=
16', 'ROM8', 'ROMCS1', 'ROMCS2', 'ROMCS3', 'ROMCS4', 'RXD1', 'RXD2', 'RXD3'=
, 'RXD4', 'SALT1', 'SALT2', 'SALT3', 'SALT4', 'SD1', 'SD2', 'SGPMCK', 'SGPM=
I', 'SGPMLD', 'SGPMO', 'SGPSCK', 'SGPSI0', 'SGPSI1', 'SGPSLD', 'SIOONCTRL',=
 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'S=
PI1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPICS1', 'TIMER3', 'TIMER4', 'TIMER5', =
'TIMER6', 'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART6', 'USB=
11D1', 'USB11H2', 'USB2D1', 'USB2H1', 'USBCKI', 'VGABIOS_ROM', 'VGAHS', 'VG=
AVS', 'VPI18', 'VPI24', 'VPI30', 'VPO12', 'VPO24', 'WDTRST1', 'WDTRST2']
   	'EMMC' is not one of ['ACPI', 'ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12'=
, 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7'=
, 'ADC8', 'ADC9', 'BMCINT', 'DDCCLK', 'DDCDAT', 'ESPI', 'FWSPICS1', 'FWSPIC=
S2', 'GPID0', 'GPID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', 'GPIE4', 'GPIE6'=
, 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4', 'I2C5', 'I2C=
6', 'I2C7', 'I2C8', 'I2C9', 'LAD0', 'LAD1', 'LAD2', 'LAD3', 'LCLK', 'LFRAME=
', 'LPCHC', 'LPCPD', 'LPCPLUS', 'LPCPME', 'LPCRST', 'LPCSMI', 'LSIRQ', 'MAC=
1LINK', 'MAC2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', '=
NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDT=
R1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', 'NRTS1', 'N=
RTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PNOR', 'PWM0', 'PWM1', 'PWM2'=
, 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'RMII1', 'RMI=
I2', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12',=
 'SALT13', 'SALT14', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', =
'SALT8', 'SALT9', 'SCL1', 'SCL2', 'SD1', 'SD2', 'SDA1', 'SDA2', 'SGPS1', 'S=
GPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'S=
IOS5', 'SIOSCI', 'SPI1', 'SPI1CS1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPI2CK', =
'SPI2CS0', 'SPI2CS1', 'SPI2MISO', 'SPI2MOSI', 'TIMER3', 'TIMER4', 'TIMER5',=
 'TIMER6', 'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART6', 'US=
B11BHID', 'USB2AD', 'USB2AH', 'USB2BD', 'USB2BH', 'USBCKI', 'VGABIOSROM', '=
VGAHS', 'VGAVS', 'VPI24', 'VPO', 'WDTRST1', 'WDTRST2']
   	'EMMCG4' is not one of ['ACPI', 'ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC1=
2', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC=
7', 'ADC8', 'ADC9', 'BMCINT', 'DDCCLK', 'DDCDAT', 'EXTRST', 'FLACK', 'FLBUS=
Y', 'FLWP', 'GPID', 'GPID0', 'GPID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', '=
GPIE4', 'GPIE6', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4=
', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'LPCPD', 'LPCPME', 'LPCRST', 'LP=
CSMI', 'MAC1LINK', 'MAC2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3',=
 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'N=
DSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NDTS4', 'NRI1', 'NRI2', 'NRI3',=
 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'OSCCLK', 'PWM0', 'PWM1', 'PWM2', 'PWM3=
', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'RMII1', 'RMII2', 'R=
OM16', 'ROM8', 'ROMCS1', 'ROMCS2', 'ROMCS3', 'ROMCS4', 'RXD1', 'RXD2', 'RXD=
3', 'RXD4', 'SALT1', 'SALT2', 'SALT3', 'SALT4', 'SD1', 'SD2', 'SGPMCK', 'SG=
PMI', 'SGPMLD', 'SGPMO', 'SGPSCK', 'SGPSI0', 'SGPSI1', 'SGPSLD', 'SIOONCTRL=
', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', =
'SPI1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPICS1', 'TIMER3', 'TIMER4', 'TIMER5'=
, 'TIMER6', 'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART6', 'U=
SB11D1', 'USB11H2', 'USB2D1', 'USB2H1', 'USBCKI', 'VGABIOS_ROM', 'VGAHS', '=
VGAVS', 'VPI18', 'VPI24', 'VPI30', 'VPO12', 'VPO24', 'WDTRST1', 'WDTRST2']
   	'EMMCG4' is not one of ['ACPI', 'ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC1=
2', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC=
7', 'ADC8', 'ADC9', 'BMCINT', 'DDCCLK', 'DDCDAT', 'ESPI', 'FWSPICS1', 'FWSP=
ICS2', 'GPID0', 'GPID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', 'GPIE4', 'GPIE=
6', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4', 'I2C5', 'I=
2C6', 'I2C7', 'I2C8', 'I2C9', 'LAD0', 'LAD1', 'LAD2', 'LAD3', 'LCLK', 'LFRA=
ME', 'LPCHC', 'LPCPD', 'LPCPLUS', 'LPCPME', 'LPCRST', 'LPCSMI', 'LSIRQ', 'M=
AC1LINK', 'MAC2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4',=
 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'N=
DTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', 'NRTS1', =
'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PNOR', 'PWM0', 'PWM1', 'PWM=
2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'RMII1', 'R=
MII2', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12=
', 'SALT13', 'SALT14', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7'=
, 'SALT8', 'SALT9', 'SCL1', 'SCL2', 'SD1', 'SD2', 'SDA1', 'SDA2', 'SGPS1', =
'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', =
'SIOS5', 'SIOSCI', 'SPI1', 'SPI1CS1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPI2CK'=
, 'SPI2CS0', 'SPI2CS1', 'SPI2MISO', 'SPI2MOSI', 'TIMER3', 'TIMER4', 'TIMER5=
', 'TIMER6', 'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART6', '=
USB11BHID', 'USB2AD', 'USB2AH', 'USB2BD', 'USB2BH', 'USBCKI', 'VGABIOSROM',=
 'VGAHS', 'VGAVS', 'VPI24', 'VPO', 'WDTRST1', 'WDTRST2']
   	'ESPI' is not one of ['ACPI', 'ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12'=
, 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7'=
, 'ADC8', 'ADC9', 'BMCINT', 'DDCCLK', 'DDCDAT', 'EXTRST', 'FLACK', 'FLBUSY'=
, 'FLWP', 'GPID', 'GPID0', 'GPID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', 'GP=
IE4', 'GPIE6', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4',=
 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'LPCPD', 'LPCPME', 'LPCRST', 'LPCS=
MI', 'MAC1LINK', 'MAC2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3', '=
NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDS=
R4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NDTS4', 'NRI1', 'NRI2', 'NRI3', '=
NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'OSCCLK', 'PWM0', 'PWM1', 'PWM2', 'PWM3',=
 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'RMII1', 'RMII2', 'ROM=
16', 'ROM8', 'ROMCS1', 'ROMCS2', 'ROMCS3', 'ROMCS4', 'RXD1', 'RXD2', 'RXD3'=
, 'RXD4', 'SALT1', 'SALT2', 'SALT3', 'SALT4', 'SD1', 'SD2', 'SGPMCK', 'SGPM=
I', 'SGPMLD', 'SGPMO', 'SGPSCK', 'SGPSI0', 'SGPSI1', 'SGPSLD', 'SIOONCTRL',=
 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'S=
PI1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPICS1', 'TIMER3', 'TIMER4', 'TIMER5', =
'TIMER6', 'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART6', 'USB=
11D1', 'USB11H2', 'USB2D1', 'USB2H1', 'USBCKI', 'VGABIOS_ROM', 'VGAHS', 'VG=
AVS', 'VPI18', 'VPI24', 'VPI30', 'VPO12', 'VPO24', 'WDTRST1', 'WDTRST2']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
