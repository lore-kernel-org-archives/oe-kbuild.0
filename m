Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F21639
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jul 2024 00:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721263272; cv=none; b=MCjYxRfKN3ZEjVEDAsRn1PpoJyo7ztTRxEt6OB7MMA/zTSYoKhsSL3lOFBVMzduwBt4FnICpRnmxVyno0QS3aBR/Mx8tkq4Sagx7rYoKEu8+Cgc7rXHKWZgG6lTkkk4RCEWoudcTBlu62RiEJ2Mhl0OwtEVH7ZdEcL5cOGALLxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721263272; c=relaxed/simple;
	bh=PAE178B4mi+4lChMWDq8esg3PvJyE30Ebcyj8+8GVVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ohIzN1BOi0Q9S+4h3wGG0BY33Wje0UA6Rr05I7c9IRxrW9sizACIfeZTRRYJk2cwQ/OZk82211x5i5um0uJi8moEkaWR0XBdICM+g32/FFxVLKugFaxwR4js6y8QdSLGHgDezbFTTmMBMMpM/x0FY9bX4y1pouTpaXVGcWD04k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+5Ibi4+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+5Ibi4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721263269; x=1752799269;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PAE178B4mi+4lChMWDq8esg3PvJyE30Ebcyj8+8GVVM=;
  b=O+5Ibi4++MXtNNescGKXDseOYBoVOJXf5qdmzNRBqnp54RIz1QcV4AVy
   18AZM32mD4+nWqS0sihQOjRNA3pIsQMdQQoXLRYgRvn91GUwXxkr+u+lW
   jmTU11OOgXZDI4h1cV1vZ+Sr0eKfbbFXEeMO04gisA1T/gInIPYM/RzNz
   p03Nf/gwBHlEce591NsPMV1JcM5YGVQfNh/9oYEp8RY8qCIVKPGxSdRNC
   eGclcwB8z8sS2wblxA7vPVlz015aZ3Y7tnM8c3F4DKntnDUR0golgWgkI
   WgNwbhXm2CTarCYasArWwbdjTYRlapgO2MYX/BmVVW+ao6FKw2SpWG/zU
   Q==;
X-CSE-ConnectionGUID: xVtQn+c0TyGdII2eEJGLqQ==
X-CSE-MsgGUID: J+0uAndAQIe4USyj7gjqZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29416277"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="29416277"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 17:41:07 -0700
X-CSE-ConnectionGUID: NM98aaTATNyZiKHCOAymtw==
X-CSE-MsgGUID: IzJ5TD6zQz+S/I7iZQCRwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="50450092"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2024 17:41:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUFCh-000goI-2N;
	Thu, 18 Jul 2024 00:41:03 +0000
Date: Thu, 18 Jul 2024 08:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 50/74]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: display-subsystem:
 'route' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202407180831.CIOY6HjB-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   fdb4709395deb4bfd668475eec2c0d482f12e1e1
commit: ee91b0aba50b54513c368b731af8b916f1719fe3 [50/74] ODROID-M1S: arm64/=
dts: add display nodes to work with Hardkernel's stock U-Boot
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/arch=
ive/20240718/202407180831.CIOY6HjB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c00=
6a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240718/202407180831.CIOY6HjB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407180831.CIOY6HjB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'vamrs,rk3399pro-vmarc-som' was expected
   	'rockchip,rk3036' was expected
   	'rockchip,px3' was expected
   	'rockchip,px30' was expected
   	'rockchip,px5' was expected
   	'rockchip,rk3128' was expected
   	'rockchip,rk3228' was expected
   	'rockchip,rk3318' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /: failed to match a=
ny schema with compatible: ['rockchip,rk3566-odroid-m1s', 'rockchip,rk3566']
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: display-subsystem: '=
route' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchi=
p-drm.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: route-dsi0: 'charge_=
logo,mode', 'logo,kernel', 'logo,mode', 'logo,uboot' do not match any of th=
e regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpi=
o-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|=
mpmc),.*', '^(pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc=
|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgp=
io|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', =
'^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-=
Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt=
,.*', '^acbel,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*'=
, '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^ad=
i,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '=
^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^a=
llo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.=
*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '=
^amlogic,.*', '^ampere,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analo=
gix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^apple,.*=
', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*', =
'^aries,.*', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^asahi=
-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asus,.*', =
'^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,=
=2E*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^=
axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.=
*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bitmain,.*', '^blutek,.*', '^=
boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*=
', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', =
'^calaosystems,.*', '^calxeda,.*', '^canaan,.*', '^caninos,.*', '^capella,.=
*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', =
'^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.=
*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chro=
ntel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*'=
, '^cisco,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*',=
 '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*', '^coreriver,.*=
', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', =
'^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubiet=
ech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^=
dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '=
^digilent,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*',=
 '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*=
', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.=
*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,=
=2E*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^el=
an,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*=
', '^embedfire,.*', '^embest,.*', '^emlid,.*', '^emmicro,.*', '^empire-elec=
tronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^ene,.*', '^ene=
rgymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^eps=
on,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^e=
verspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ez=
chip,.*', '^facebook,.*', '^fairphone,.*', '^faraday,.*', '^fastrax,.*', '^=
fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech=
,.*', '^forlinx,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^gardena,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^gee=
kbuying,.*', '^gef,.*', '^gemei,.*', '^genesys,.*', '^geniatech,.*', '^gian=
tec,.*', '^giantplus,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^gplus,.*', '^grinn,.*', '^grmn=
,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.=
*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschma=
nn,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^=
holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperun,.*', '^hp,.*', '^hpe=
,.*', '^hsg,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hyc=
on,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*'=
, '^ibm,.*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*'=
, '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^=
inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*',=
 '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insi=
gnal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', =
'^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*',=
 '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^=
iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jesurun,.=
*', '^jethome,.*', '^jianda,.*', '^joz,.*', '^kam,.*', '^karo,.*', '^keithk=
oep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^=
kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^=
koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^=
laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lctech,.*', '^leadt=
ek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lg=
philips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lineartechnol=
ogy,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^=
linx,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictech=
no,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', =
'^lsi,.*', '^lunzn,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*',=
 '^mantix,.*', '^mapleboard,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*'=
, '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^medi=
atek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mella=
nox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^merak=
i,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
rystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^mikroe,.*', '^=
mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*', '^mitsubishi,.*',=
 '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^modtronix,.*', '^moortec,.*', '^m=
osaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mp=
s,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti=
,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxic=
y,.*', '^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*',=
 '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,=
=2E*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni=
,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novatek,.*', =
'^novtech,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^n=
xp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olim=
ex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^o=
ntat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*=
', '^openpandora,.*', '^openrisc,.*', '^option,.*', '^oranth,.*', '^orisete=
ch,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overk=
iz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade=
,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,=
=2E*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', =
'^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^primux,.*', '^pro=
box2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*'=
, '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^q=
nap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtro=
n,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^remark=
able,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^rich=
tek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,=
=2E*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplep=
i,.*', '^saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.=
*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^=
seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensorte=
k,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sha=
rp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^=
si-en,.*', '^si-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,=
=2E*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '=
^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '=
^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*',=
 '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smart=
labs,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun=
,.*', '^solomon,.*', '^sony,.*', '^sourceparts,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^s=
ynopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.=
*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.=
*', '^techstar,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.=
*', '^tesla,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thu=
ndercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^t=
opeet,.*', '^topic,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^tosh=
iba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^trav=
erse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*'=
, '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^u=
fispace,.*', '^ugoos,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*=
', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^vdl=
,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,=
=2E*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse=
,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vot,.*', '^=
vxt,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*=
', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^=
widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', =
'^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^w=
m,.*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
llybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^x=
nano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-opto=
electronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-top=
tech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', =
'^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*=
', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: route-hdmi: 'charge_=
logo,mode', 'logo,kernel', 'logo,mode', 'logo,uboot' do not match any of th=
e regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpi=
o-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|=
mpmc),.*', '^(pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc=
|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgp=
io|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', =
'^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-=
Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt=
,.*', '^acbel,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*'=
, '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^ad=
i,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '=
^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^a=
llo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.=
*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '=
^amlogic,.*', '^ampere,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analo=
gix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^apple,.*=
', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*', =
'^aries,.*', '^arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^asahi=
-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asus,.*', =
'^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,=
=2E*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^=
axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.=
*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bitmain,.*', '^blutek,.*', '^=
boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*=
', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', =
'^calaosystems,.*', '^calxeda,.*', '^canaan,.*', '^caninos,.*', '^capella,.=
*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', =
'^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.=
*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chro=
ntel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*'=
, '^cisco,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*',=
 '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^congatec,.*', '^coreriver,.*=
', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', =
'^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubiet=
ech,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^=
dataimage,.*', '^davicom,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^d=
enx,.*', '^devantech,.*', '^dfi,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '=
^digilent,.*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*',=
 '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*=
', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.=
*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,=
=2E*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^el=
an,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*=
', '^embedfire,.*', '^embest,.*', '^emlid,.*', '^emmicro,.*', '^empire-elec=
tronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^ene,.*', '^ene=
rgymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^eps=
on,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^e=
verspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ez=
chip,.*', '^facebook,.*', '^fairphone,.*', '^faraday,.*', '^fastrax,.*', '^=
fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech=
,.*', '^forlinx,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^gardena,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^gee=
kbuying,.*', '^gef,.*', '^gemei,.*', '^genesys,.*', '^geniatech,.*', '^gian=
tec,.*', '^giantplus,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^=
goldelico,.*', '^goodix,.*', '^google,.*', '^gplus,.*', '^grinn,.*', '^grmn=
,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.=
*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschma=
nn,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^=
holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperun,.*', '^hp,.*', '^hpe=
,.*', '^hsg,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hyc=
on,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*'=
, '^ibm,.*', '^icplus,.*', '^idt,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*'=
, '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^=
inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*',=
 '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insi=
gnal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', =
'^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*',=
 '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^=
iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jesurun,.=
*', '^jethome,.*', '^jianda,.*', '^joz,.*', '^kam,.*', '^karo,.*', '^keithk=
oep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^=
kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^=
koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^=
laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lctech,.*', '^leadt=
ek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lg=
philips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lineartechnol=
ogy,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^=
linx,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictech=
no,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', =
'^lsi,.*', '^lunzn,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*',=
 '^mantix,.*', '^mapleboard,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*'=
, '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^medi=
atek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mella=
nox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^merak=
i,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microc=
rystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^mikroe,.*', '^=
mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*', '^mitsubishi,.*',=
 '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^modtronix,.*', '^moortec,.*', '^m=
osaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mp=
s,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti=
,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxic=
y,.*', '^myir,.*', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*',=
 '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,=
=2E*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni=
,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^novatek,.*', =
'^novtech,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^n=
xp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olim=
ex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^o=
ntat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*=
', '^openpandora,.*', '^openrisc,.*', '^option,.*', '^oranth,.*', '^orisete=
ch,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overk=
iz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade=
,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,=
=2E*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^pixci=
r,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '=
^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', =
'^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^primux,.*', '^pro=
box2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*'=
, '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^q=
nap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtro=
n,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^realtek,.*', '^remark=
able,.*', '^renesas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^rich=
tek,.*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,=
=2E*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplep=
i,.*', '^saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.=
*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*', '^seeed,.*', '^=
seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensorte=
k,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sha=
rp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^=
si-en,.*', '^si-linux,.*', '^siemens,.*', '^sifive,.*', '^sigma,.*', '^sii,=
=2E*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '=
^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '=
^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*',=
 '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smart=
labs,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun=
,.*', '^solomon,.*', '^sony,.*', '^sourceparts,.*', '^spansion,.*', '^spark=
fun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '=
^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^st=
artek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '=
^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '=
^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^s=
ynopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.=
*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.=
*', '^techstar,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.=
*', '^tesla,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thu=
ndercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^t=
opeet,.*', '^topic,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^tosh=
iba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^trav=
erse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*'=
, '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^u=
fispace,.*', '^ugoos,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*=
', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^variscite,.*', '^vdl=
,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,=
=2E*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse=
,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^vot,.*', '^=
vxt,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*=
', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^=
widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', =
'^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^w=
m,.*', '^wobo,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
llybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^x=
nano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-opto=
electronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-top=
tech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', =
'^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*=
', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: tcs4525@1c: Unevalua=
ted properties are not allowed ('regulator-compatible', 'regulator-init-mic=
rovolt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.y=
aml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: pmic@20: '#sound-dai=
-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clock=
s', 'codec' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: video-codec@fdea0400=
: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: vop@fe040000: compat=
ible: ['rockchip,rk3568-vop', 'rockchip,rk3566-vop'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchi=
p-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: hdmi@fe0a0000: Uneva=
luated properties are not allowed ('#sound-dai-cells', 'power-domains' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchi=
p,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe410000: Uneval=
uated properties are not allowed ('rockchip,clk-trcm' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.y=
aml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe420000: reset-=
names:0: 'm' is not one of ['tx-m', 'rx-m']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.y=
aml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: phy@fe830000: 'phy-s=
upply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-naneng-=
combphy.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: usb2phy@fe8a0000: ot=
g-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
