Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0A25DB12
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Aug 2025 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458803; cv=none; b=T1nCrZj+/HAEnaaaXZdCynVPyssl9uHE5NpE9aPcOpd/tBHh9hBKs2rPK2JkG90/spzHx5tLeiXpqUr+kSFIRCWshkbSs5l5iACc9QkutCG3u3IenfIBevUu3kpwBFElCFygQmhWRxw7WBWKh+f5K9ZOnaTXdQwxWOdFgRvZXtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458803; c=relaxed/simple;
	bh=rl/3Odnfkwd+Ld4rXTHtgoDgXF89kMo+qmHbUe7jtTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Evcub7YbuGtEJ2GMdGBFxy7U/ZkRRSW3qCwwZNaq50trzcN1kFg7ZHUb6wro8Yyhnpz0DXw/Y3CRuf4Wcy7Xdjq5DuoKx40vuzi+9llwQN/ZyOnmmGHhzNzxq5ZH8M5Zk8O0gRpJWmNXQPNx+dv/zXJb2+Q7NJYEoA9+bL5KDk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTOyKM3C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTOyKM3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756458800; x=1787994800;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rl/3Odnfkwd+Ld4rXTHtgoDgXF89kMo+qmHbUe7jtTc=;
  b=kTOyKM3CAxNdEbCZewi4ypvWray2WFoJaK9m/w6r4Eu769BTrJg1cvV0
   ea9btNiKSpYXr7kjSIOkmHwrudIzBbIRKcu2yw8lxjH43n3ZqQguxVnlE
   v7aTy7tX7mg4cEbb3Cr6UKJiOwcp8/2QTYDU6VdSd+GqHAvECFbqMQ8ei
   vwhEvABLc2jrwkpAV2F4I/2Iso96eOzuUMVgOUnNVLNY0QouE9gy3Qw88
   UYmGsy3HBQ6qRobZeXmZ+goVZ+oPq21en5kE7ONOI1yNTTH0AnIL97EmD
   wSnIG/3VSY7ojr1OueNAgITin5fQ5SdeZFrOVRGrQm6AKSUb2Tk6oEB6A
   A==;
X-CSE-ConnectionGUID: L2Jc5X7rQ1mxMgaCUyYvCg==
X-CSE-MsgGUID: yLdxzFFWQm+TPUKSmUzvng==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62387292"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="62387292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:13:20 -0700
X-CSE-ConnectionGUID: GN3n1XX9Q2WZXyyI60iKpA==
X-CSE-MsgGUID: SCBEY6AJTpGzKN4pCI2WKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="174712845"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 29 Aug 2025 02:13:17 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urvAZ-0002sF-1D;
	Fri, 29 Aug 2025 09:13:15 +0000
Date: Fri, 29 Aug 2025 11:12:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:timers/clocksource 8/24]
 arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: timer@1e782000
 (aspeed,ast2400-timer): '#pwm-cells', 'fttmr010,pwm-outputs' do not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508291159.YTTEl61N-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/=
clocksource
head:   7b098309ced7709c0a502b5eb9f54bd1f26fc6c6
commit: 7276dac8cd12b56c5120cf127380b7be15824047 [8/24] dt-bindings: timer:=
 Convert faraday,fttmr010 to DT schema
:::::: branch date: 4 weeks ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-2051-20250826 (https://download.01.org/0day-ci/archi=
ve/20250829/202508291159.YTTEl61N-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.8
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250829/202508291159.YTTEl61N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508291159.YTTEl61N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/display@1e=
6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', =
'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: timer@1e782000 (asp=
eed,ast2400-timer): '#pwm-cells', 'fttmr010,pwm-outputs' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*',=
 '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}=
$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abraco=
n,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^act=
ions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^ad=
aptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,=
=2E*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcate=
l,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', =
'^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.=
*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.=
*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire=
,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech=
,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptin=
a,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*=
', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspe=
ed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,=
=2E*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^av=
ic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*',=
 '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bel=
ling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^blut=
ek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*'=
, '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^ca=
lamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^ca=
naan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^ca=
vium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', =
'^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipon=
e,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chun=
ghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.=
*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*',=
 '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,=
=2E*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.=
*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^ctera,.*', '^c=
tu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '=
^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.=
*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', =
'^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.=
*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink=
,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragi=
no,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^e=
bang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econ=
et,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^ei=
nfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida=
,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.=
*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^e=
nclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '=
^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', =
'^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*',=
 '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fa=
irchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*'=
, '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focal=
tech,.*', '^forlinx,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^frien=
dlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^game=
force,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.=
*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^g=
enesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*',=
 '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,=
=2E*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.=
*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^hao=
chuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', =
'^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hi=
tex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoper=
f,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.=
*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hyni=
tron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', =
'^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^i=
mi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^=
infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*',=
 '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^insp=
ur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', =
'^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^i=
ssi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jad=
ard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*'=
, '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunz=
n,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^m=
antix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*',=
 '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer=
,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,=
=2E*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mento=
r,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip=
,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^=
microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^=
minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^m=
ixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moor=
tec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^m=
pl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^msta=
r,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic=
,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^n=
eofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*'=
, '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven=
,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,=
=2E*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatek,.*', =
'^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^=
nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^=
oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', =
'^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*',=
 '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^optio=
n,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pegatron=
,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picoch=
ip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^=
plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*',=
 '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', '^poslab,=
=2E*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*',=
 '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*'=
, '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^=
qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^r=
adxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', =
'^raydium,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^=
renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^=
richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockc=
hip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseappl=
epi,.*', '^rve,.*', '^saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*'=
, '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', =
'^sciosense,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.=
*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,=
=2E*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shi=
mafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
=2E*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo=
,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^=
spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*',=
 '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', =
'^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*',=
 '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*=
', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*'=
, '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.=
*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.=
*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,=
=2E*', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^th=
ine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,=
=2E*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^to=
ppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk=
,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '=
^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,=
=2E*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*'=
, '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', =
'^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', =
'^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexc=
om,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.=
*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.=
*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '=
^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waves=
hare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^=
whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^wi=
nbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wi=
relesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*=
', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xi=
ngbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunl=
ong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*',=
 '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.=
*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*=
', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zt=
e,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x00\x06' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01\x08' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02\t' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/display@1e=
6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', =
'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): '#pwm-cells', 'fttmr010,pwm-outputs' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*',=
 '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}=
$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abraco=
n,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^act=
ions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^ad=
aptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,=
=2E*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcate=
l,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', =
'^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.=
*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.=
*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire=
,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech=
,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptin=
a,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*=
', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspe=
ed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,=
=2E*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^av=
ic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*',=
 '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bel=
ling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^blut=
ek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*'=
, '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^ca=
lamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^ca=
naan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^ca=
vium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', =
'^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipon=
e,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chun=
ghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.=
*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*',=
 '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,=
=2E*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.=
*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^ctera,.*', '^c=
tu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '=
^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.=
*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', =
'^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.=
*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink=
,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragi=
no,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^e=
bang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econ=
et,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^ei=
nfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida=
,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.=
*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^e=
nclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '=
^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', =
'^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*',=
 '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fa=
irchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*'=
, '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focal=
tech,.*', '^forlinx,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^frien=
dlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^game=
force,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.=
*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^g=
enesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*',=
 '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,=
=2E*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.=
*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^hao=
chuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', =
'^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hi=
tex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoper=
f,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.=
*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hyni=
tron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', =
'^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^i=
mi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^=
infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*',=
 '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^insp=
ur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', =
'^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^i=
ssi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jad=
ard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*'=
, '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunz=
n,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^m=
antix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*',=
 '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer=
,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,=
=2E*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mento=
r,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip=
,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^=
microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^=
minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^m=
ixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moor=
tec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^m=
pl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^msta=
r,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic=
,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^n=
eofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*'=
, '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven=
,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,=
=2E*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatek,.*', =
'^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^=
nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^=
oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', =
'^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*',=
 '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^optio=
n,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pegatron=
,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picoch=
ip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^=
plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*',=
 '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', '^poslab,=
=2E*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*',=
 '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*'=
, '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^=
qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^r=
adxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', =
'^raydium,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^=
renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^=
richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockc=
hip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseappl=
epi,.*', '^rve,.*', '^saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*'=
, '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', =
'^sciosense,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.=
*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,=
=2E*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shi=
mafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
=2E*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo=
,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^=
spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*',=
 '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', =
'^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*',=
 '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*=
', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*'=
, '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.=
*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.=
*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,=
=2E*', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^th=
ine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,=
=2E*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^to=
ppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk=
,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '=
^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,=
=2E*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*'=
, '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', =
'^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', =
'^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexc=
om,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.=
*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.=
*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '=
^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waves=
hare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^=
whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^wi=
nbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wi=
relesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*=
', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xi=
ngbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunl=
ong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*',=
 '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.=
*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*=
', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zt=
e,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x00\x07' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01\x08' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02\t' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/display@1e=
6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', =
'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): '#pwm-cells', 'fttmr010,pwm-outputs' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*',=
 '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}=
$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abraco=
n,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^act=
ions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^ad=
aptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,=
=2E*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcate=
l,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', =
'^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.=
*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.=
*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire=
,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech=
,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptin=
a,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*=
', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '=
^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspe=
ed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,=
=2E*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^av=
ic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*',=
 '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^bel=
ling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^blut=
ek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*'=
, '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^ca=
lamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^ca=
naan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^ca=
vium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', =
'^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipon=
e,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chun=
ghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.=
*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*',=
 '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,=
=2E*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.=
*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^ctera,.*', '^c=
tu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '=
^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.=
*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', =
'^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.=
*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink=
,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragi=
no,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^e=
bang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econ=
et,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^ei=
nfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida=
,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.=
*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^e=
nclustra,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '=
^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', =
'^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*',=
 '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fa=
irchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*'=
, '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focal=
tech,.*', '^forlinx,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^frien=
dlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^game=
force,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.=
*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^g=
enesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*',=
 '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,=
=2E*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.=
*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^hao=
chuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', =
'^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hi=
tex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoper=
f,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.=
*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hyni=
tron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', =
'^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^i=
mi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*', '^=
infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*',=
 '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^insp=
ur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', =
'^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^i=
ssi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jad=
ard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*'=
, '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunz=
n,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^m=
antix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*',=
 '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer=
,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,=
=2E*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mento=
r,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip=
,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^=
microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^=
minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^m=
ixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moor=
tec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^m=
pl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^msta=
r,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic=
,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^n=
eofidelity,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*'=
, '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven=
,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,=
=2E*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatek,.*', =
'^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^=
nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^=
oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', =
'^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*',=
 '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^optio=
n,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pegatron=
,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picoch=
ip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^=
plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*',=
 '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', '^poslab,=
=2E*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*',=
 '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*'=
, '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^=
qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^r=
adxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', =
'^raydium,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^=
renesas,.*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^=
richtek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockc=
hip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseappl=
epi,.*', '^rve,.*', '^saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*'=
, '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', =
'^sciosense,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.=
*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,=
=2E*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shi=
mafuji,.*', '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*',=
 '^siemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil=
,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insig=
ht,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*',=
 '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*',=
 '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '=
^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,=
=2E*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo=
,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^=
spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*',=
 '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', =
'^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*',=
 '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*=
', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*'=
, '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.=
*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.=
*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,=
=2E*', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^th=
ine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,=
=2E*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^to=
ppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk=
,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '=
^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,=
=2E*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*'=
, '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', =
'^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', =
'^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexc=
om,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.=
*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.=
*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '=
^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waves=
hare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^=
whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^wi=
nbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wi=
relesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*=
', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xi=
ngbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunl=
ong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*',=
 '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.=
*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*=
', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zt=
e,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@3: aspeed,fan-t=
ach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dtb: /soc/syscon@40000000:=
 failed to match any schema with compatible: ['cortina,gemini-syscon', 'sys=
con', 'simple-mfd']
   arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dtb: /soc/syscon@40000000/=
pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinct=
rl']
>> arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dtb: timer@43000000 (farad=
ay,fttmr010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dtb: /soc/power-controller=
@4b000000: failed to match any schema with compatible: ['cortina,gemini-pow=
er-controller']
   arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dtb: power-controller@4b00=
0000 (cortina,gemini-power-controller): '#power-domain-cells' is a required=
 property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dtb: pci@50000000 (cortina=
,gemini-pci): Unevaluated properties are not allowed ('resets' was unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/pci/faraday,ftpci100.yam=
l#
   arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dtb: ide@63000000 (cortina=
,gemini-pata): ide-port@0: '#thermal-sensor-cells' does not match any of th=
e regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
   arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dtb: ide@63000000 (cortina=
,gemini-pata): Unevaluated properties are not allowed ('#address-cells', '#=
size-cells', 'ide-port@0', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
--
   arch/arm/boot/dts/gemini/gemini-dlink-dns-313.dtb: /soc/syscon@40000000:=
 failed to match any schema with compatible: ['cortina,gemini-syscon', 'sys=
con', 'simple-mfd']
   arch/arm/boot/dts/gemini/gemini-dlink-dns-313.dtb: /soc/syscon@40000000/=
pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinct=
rl']
>> arch/arm/boot/dts/gemini/gemini-dlink-dns-313.dtb: timer@43000000 (farad=
ay,fttmr010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-dlink-dns-313.dtb: /soc/power-controller=
@4b000000: failed to match any schema with compatible: ['cortina,gemini-pow=
er-controller']
   arch/arm/boot/dts/gemini/gemini-dlink-dns-313.dtb: power-controller@4b00=
0000 (cortina,gemini-power-controller): '#power-domain-cells' is a required=
 property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/gemini/gemini-dlink-dns-313.dtb: ide@63000000 (cortina=
,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
   arch/arm/boot/dts/gemini/gemini-dlink-dns-313.dtb: usb@69000000 (cortina=
,gemini-usb): 'usb-phy' does not match any of the regexes: '^pinctrl-[0-9]+=
$'
   	from schema $id: http://devicetree.org/schemas/usb/faraday,fotg210.yaml#
   arch/arm/boot/dts/gemini/gemini-dlink-dns-313.dtb: phy (gpio-usb-b-conne=
ctor): Unevaluated properties are not allowed ('#phy-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.=
yaml#
--
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: /soc/syscon@40000000: fail=
ed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon',=
 'simple-mfd']
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: /soc/syscon@40000000/pinct=
rl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: timer@43000000 (faraday,ft=
tmr010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: /soc/power-controller@4b00=
0000: failed to match any schema with compatible: ['cortina,gemini-power-co=
ntroller']
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: power-controller@4b000000 =
(cortina,gemini-power-controller): '#power-domain-cells' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: ide@63000000 (cortina,gemi=
ni-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
   arch/arm/boot/dts/gemini/gemini-nas4220b.dtb: ide@63400000 (cortina,gemi=
ni-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
--
   arch/arm/boot/dts/gemini/gemini-ns2502.dtb: /soc/syscon@40000000: failed=
 to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', '=
simple-mfd']
   arch/arm/boot/dts/gemini/gemini-ns2502.dtb: /soc/syscon@40000000/pinctrl=
: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-ns2502.dtb: timer@43000000 (faraday,fttm=
r010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-ns2502.dtb: /soc/power-controller@4b0000=
00: failed to match any schema with compatible: ['cortina,gemini-power-cont=
roller']
   arch/arm/boot/dts/gemini/gemini-ns2502.dtb: power-controller@4b000000 (c=
ortina,gemini-power-controller): '#power-domain-cells' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/gemini/gemini-ns2502.dtb: ide@63000000 (cortina,gemini=
-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
   arch/arm/boot/dts/gemini/gemini-ns2502.dtb: ide@63400000 (cortina,gemini=
-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
--
   arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: /soc/syscon@40000000: failed=
 to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', '=
simple-mfd']
   arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: /soc/syscon@40000000/pinctrl=
: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: timer@43000000 (faraday,fttm=
r010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: /soc/power-controller@4b0000=
00: failed to match any schema with compatible: ['cortina,gemini-power-cont=
roller']
   arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: power-controller@4b000000 (c=
ortina,gemini-power-controller): '#power-domain-cells' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
--
   arch/arm/boot/dts/gemini/gemini-sl93512r.dtb: /soc/syscon@40000000: fail=
ed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon',=
 'simple-mfd']
   arch/arm/boot/dts/gemini/gemini-sl93512r.dtb: /soc/syscon@40000000/pinct=
rl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-sl93512r.dtb: timer@43000000 (faraday,ft=
tmr010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-sl93512r.dtb: /soc/power-controller@4b00=
0000: failed to match any schema with compatible: ['cortina,gemini-power-co=
ntroller']
   arch/arm/boot/dts/gemini/gemini-sl93512r.dtb: power-controller@4b000000 =
(cortina,gemini-power-controller): '#power-domain-cells' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/gemini/gemini-sl93512r.dtb: pci@50000000 (cortina,gemi=
ni-pci): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/faraday,ftpci100.yam=
l#
   arch/arm/boot/dts/gemini/gemini-sl93512r.dtb: ide@63000000 (cortina,gemi=
ni-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
   arch/arm/boot/dts/gemini/gemini-sl93512r.dtb: ide@63400000 (cortina,gemi=
ni-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
--
   arch/arm/boot/dts/gemini/gemini-sq201.dtb: /soc/syscon@40000000: failed =
to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 's=
imple-mfd']
   arch/arm/boot/dts/gemini/gemini-sq201.dtb: /soc/syscon@40000000/pinctrl:=
 failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-sq201.dtb: timer@43000000 (faraday,fttmr=
010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-sq201.dtb: /soc/power-controller@4b00000=
0: failed to match any schema with compatible: ['cortina,gemini-power-contr=
oller']
   arch/arm/boot/dts/gemini/gemini-sq201.dtb: power-controller@4b000000 (co=
rtina,gemini-power-controller): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/gemini/gemini-sq201.dtb: pci@50000000 (cortina,gemini-=
pci): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/faraday,ftpci100.yam=
l#
   arch/arm/boot/dts/gemini/gemini-sq201.dtb: ide@63000000 (cortina,gemini-=
pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
--
   arch/arm/boot/dts/gemini/gemini-ssi1328.dtb: /soc/syscon@40000000: faile=
d to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', =
'simple-mfd']
   arch/arm/boot/dts/gemini/gemini-ssi1328.dtb: /soc/syscon@40000000/pinctr=
l: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-ssi1328.dtb: timer@43000000 (faraday,ftt=
mr010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-ssi1328.dtb: /soc/power-controller@4b000=
000: failed to match any schema with compatible: ['cortina,gemini-power-con=
troller']
   arch/arm/boot/dts/gemini/gemini-ssi1328.dtb: power-controller@4b000000 (=
cortina,gemini-power-controller): '#power-domain-cells' is a required prope=
rty
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/gemini/gemini-ssi1328.dtb: ide@63000000 (cortina,gemin=
i-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
   arch/arm/boot/dts/gemini/gemini-ssi1328.dtb: ide@63400000 (cortina,gemin=
i-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yam=
l#
--
   arch/arm/boot/dts/gemini/gemini-wbd111.dtb: /soc/syscon@40000000: failed=
 to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', '=
simple-mfd']
   arch/arm/boot/dts/gemini/gemini-wbd111.dtb: /soc/syscon@40000000/pinctrl=
: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-wbd111.dtb: timer@43000000 (faraday,fttm=
r010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-wbd111.dtb: /soc/power-controller@4b0000=
00: failed to match any schema with compatible: ['cortina,gemini-power-cont=
roller']
   arch/arm/boot/dts/gemini/gemini-wbd111.dtb: power-controller@4b000000 (c=
ortina,gemini-power-controller): '#power-domain-cells' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/gemini/gemini-wbd111.dtb: pci@50000000 (cortina,gemini=
-pci): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/faraday,ftpci100.yam=
l#
--
   arch/arm/boot/dts/gemini/gemini-wbd222.dtb: /soc/syscon@40000000: failed=
 to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', '=
simple-mfd']
   arch/arm/boot/dts/gemini/gemini-wbd222.dtb: /soc/syscon@40000000/pinctrl=
: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-wbd222.dtb: timer@43000000 (faraday,fttm=
r010): syscon: False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml#
   arch/arm/boot/dts/gemini/gemini-wbd222.dtb: /soc/power-controller@4b0000=
00: failed to match any schema with compatible: ['cortina,gemini-power-cont=
roller']
   arch/arm/boot/dts/gemini/gemini-wbd222.dtb: power-controller@4b000000 (c=
ortina,gemini-power-controller): '#power-domain-cells' is a required proper=
ty
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm/boot/dts/gemini/gemini-wbd222.dtb: pci@50000000 (cortina,gemini=
-pci): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/faraday,ftpci100.yam=
l#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
