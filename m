Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0A24A078
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 05:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765864286; cv=none; b=t9Vj7UY4bGwygnYVRpVkUHRvJ/Ppsx9/uzcleajHh6Xmr7lvLnDmojjOT3sDP/RYSbiJo6KFOlOGWFWlSvg0sw4Q9DMgga6kZPSlB4K6Lo+9Sd9gaNBaF1gBi//hD6hhSb1pCbLYgCCHeYPbw26n1ZdPyvCtrFW56TxI0kR7O7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765864286; c=relaxed/simple;
	bh=qhKZEwCMHITdnuRY1W4DsQ0appCIzCYEaALNRGK90Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CAP3HMchBIfxxw5YW5Mf08+PEi2leVK41vwgVoqCO10oksW8ILJfR7h4a+y6WN9aH5T/CgvAU2IMS4KgaKwkVwOdKN1FwaQNmpKA6EKJ/vWrHPx7ApHQy0SI/XxgJQAsIhZqLNsmOVobKwZFLmkhMrWExp0CwEy7A8Zpkd9USsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjY7S1nd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjY7S1nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765864279; x=1797400279;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qhKZEwCMHITdnuRY1W4DsQ0appCIzCYEaALNRGK90Ts=;
  b=MjY7S1ndhMv7jKdwt78I/+b1p7yyEBsyfJd88mimXe4Wpq+cPYUNFpa2
   x+UwAeRYcpUw0wVcOP8rExdjUSnXuz1r7WtdnV20wKBNHtW41IRlYeRQn
   N3ndrTVxQdS7Q6N3ykcmKPTRAKOUlYmdODq3qH9FChaHwoXmmbkgf1peV
   hwpApT2NmJnY8zIfccq/qu1z0ep0di3QKPk4WcJWJ/xPVTwAVaa/TW7Xs
   LW2R7NdBplWEQEOSzBDHubkS9EaLoE/qiBm0/Y2ri2EVDeSpO+tfmE8Zv
   hHPB+4yHqUtEPQUaIjShjh32Jhula6357wZGMoAL+Wo9hR7WPVC5p56dg
   Q==;
X-CSE-ConnectionGUID: BQXtxSOuSHujEJOztn5qwQ==
X-CSE-MsgGUID: tIJS13DXQtGLeD7JQj323Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67714787"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67714787"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 21:51:14 -0800
X-CSE-ConnectionGUID: 0j9brBCwTRGjIb+CALrZVg==
X-CSE-MsgGUID: y/pZQPobTeaOFBT8n47vgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="228601643"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2025 21:51:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVNxm-0000000031g-3Sho;
	Tue, 16 Dec 2025 05:51:10 +0000
Date: Tue, 16 Dec 2025 06:50:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v1 1/3] dt-bindings: net: micrel: Convert to
 YAML schema
Message-ID: <202512160642.DdFk1gxh-lkp@intel.com>
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
In-Reply-To: <20251212084657.29239-2-eichest@gmail.com>
References: <20251212084657.29239-2-eichest@gmail.com>
TO: Stefan Eichenberger <eichest@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: hkallweit1@gmail.com
TO: linux@armlinux.org.uk
TO: geert+renesas@glider.be
TO: ben.dooks@codethink.co.uk
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: francesco.dolcini@toradex.com
CC: rafael.beims@toradex.com
CC: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Eichenberger/=
dt-bindings-net-micrel-Convert-to-YAML-schema/20251212-165111
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251212084657.29239-2-eichest%40g=
mail.com
patch subject: [PATCH net-next v1 1/3] dt-bindings: net: micrel: Convert to=
 YAML schema
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2052-20251215 (https://download.01.org/0day-ci/archi=
ve/20251216/202512160642.DdFk1gxh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251216/202512160642.DdFk1gxh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512160642.DdFk1gxh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: ethernet-phy@1 (eth=
ernet-phy-id0022.1640): Unevaluated properties are not allowed ('micrel,led=
-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: timer@1e782000 (asp=
eed,ast2400-timer): '#pwm-cells', 'fttmr010,pwm-outputs' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFa=
nuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9#+\\-.=
_@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*',=
 '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.=
*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', '^adafruit=
,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '=
^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha=
,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.=
*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*'=
, '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^a=
marula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogi=
c,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*'=
, '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', =
'^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archerm=
ind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,=
=2E*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '=
^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asr=
ock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,=
=2E*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avn=
et,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*'=
, '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^be=
lling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bla=
ize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.=
*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '=
^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^cala=
osystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^ca=
pella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.=
*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoin=
t,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^cho=
ngzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa=
,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '=
^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^c=
ompulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*',=
 '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^=
crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*'=
, '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.=
*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomput=
ing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,=
=2E*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^dig=
ilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', =
'^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptec=
hnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,=
=2E*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^e=
ckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.=
*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^e=
lement14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedf=
ire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-=
electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '=
^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', =
'^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^=
ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '=
^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fair=
child,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', =
'^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^flipkar=
t,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fre=
ebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujit=
su,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^ga=
teway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*=
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^g=
eniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.=
*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix=
,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^g=
umstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^har=
dkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', =
'^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', =
'^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywe=
ll,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,=
=2E*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', =
'^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2s=
e,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.=
*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^in=
costartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,=
=2E*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithko=
ep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^k=
ingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^k=
oe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^l=
aird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,=
=2E*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', =
'^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '=
^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^linksys,.*', =
'^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^=
litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '=
^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', =
'^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*=
', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxboti=
x,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.=
*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', =
'^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', =
'^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^meth=
ode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '=
^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.=
*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^=
mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mob=
ileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*=
', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,=
=2E*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^m=
undoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nation=
al,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcub=
e,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^ne=
txeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^=
nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.=
*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.=
*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*',=
 '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^=
olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*',=
 '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembe=
d,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^or=
anth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', =
'^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^pana=
sonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegat=
ron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^p=
hytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*=
', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^=
ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool=
[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^power=
vr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2=
,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^=
qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,=
=2E*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*'=
, '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^rda,.*=
', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervisio=
n,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,=
=2E*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.=
*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*',=
 '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '=
^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '=
^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*',=
 '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*=
', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '=
^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*=
', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^=
valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,=
=2E*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtua=
l,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,=
=2E*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*'=
, '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', =
'^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*'=
, '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*',=
 '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,=
=2E*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-p=
owers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*',=
 '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '=
^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics=
,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '=
^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zea=
lz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*',=
 '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x00\x06' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01\x08' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: ethernet-phy@1 (eth=
ernet-phy-id0022.1640): Unevaluated properties are not allowed ('micrel,led=
-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): '#pwm-cells', 'fttmr010,pwm-outputs' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFa=
nuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9#+\\-.=
_@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*',=
 '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.=
*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', '^adafruit=
,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '=
^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha=
,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.=
*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*'=
, '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^a=
marula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogi=
c,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*'=
, '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', =
'^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archerm=
ind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,=
=2E*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '=
^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asr=
ock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,=
=2E*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avn=
et,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*'=
, '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^be=
lling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bla=
ize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.=
*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '=
^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^cala=
osystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^ca=
pella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.=
*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoin=
t,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^cho=
ngzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa=
,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '=
^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^c=
ompulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*',=
 '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^=
crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*'=
, '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.=
*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomput=
ing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,=
=2E*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^dig=
ilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', =
'^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptec=
hnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,=
=2E*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^e=
ckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.=
*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^e=
lement14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedf=
ire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-=
electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '=
^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', =
'^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^=
ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '=
^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fair=
child,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', =
'^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^flipkar=
t,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fre=
ebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujit=
su,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^ga=
teway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*=
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^g=
eniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.=
*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix=
,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^g=
umstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^har=
dkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', =
'^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', =
'^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywe=
ll,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,=
=2E*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', =
'^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2s=
e,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.=
*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^in=
costartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,=
=2E*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithko=
ep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^k=
ingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^k=
oe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^l=
aird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,=
=2E*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', =
'^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '=
^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^linksys,.*', =
'^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^=
litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '=
^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', =
'^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*=
', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxboti=
x,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.=
*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', =
'^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', =
'^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^meth=
ode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '=
^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.=
*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^=
mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mob=
ileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*=
', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,=
=2E*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^m=
undoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nation=
al,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcub=
e,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^ne=
txeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^=
nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.=
*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.=
*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*',=
 '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^=
olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*',=
 '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembe=
d,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^or=
anth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', =
'^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^pana=
sonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegat=
ron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^p=
hytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*=
', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^=
ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool=
[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^power=
vr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2=
,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^=
qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,=
=2E*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*'=
, '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^rda,.*=
', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervisio=
n,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,=
=2E*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.=
*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*',=
 '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '=
^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '=
^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*',=
 '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*=
', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '=
^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*=
', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^=
valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,=
=2E*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtua=
l,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,=
=2E*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*'=
, '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', =
'^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*'=
, '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*',=
 '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,=
=2E*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-p=
owers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*',=
 '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '=
^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics=
,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '=
^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zea=
lz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*',=
 '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x00\x07' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01\x08' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: ethernet-phy@1 (eth=
ernet-phy-id0022.1640): Unevaluated properties are not allowed ('micrel,led=
-mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/micrel.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): '#pwm-cells', 'fttmr010,pwm-outputs' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts|vsc8531),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFa=
nuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9#+\\-.=
_@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*',=
 '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.=
*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', '^adafruit=
,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '=
^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha=
,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.=
*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*'=
, '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^a=
marula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogi=
c,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*'=
, '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', =
'^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archerm=
ind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,=
=2E*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '=
^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asr=
ock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,=
=2E*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avn=
et,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*'=
, '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^be=
lling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bla=
ize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.=
*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*', '=
^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^cala=
osystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^ca=
pella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.=
*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoin=
t,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^cho=
ngzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa=
,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '=
^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^c=
ompulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*',=
 '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^=
crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*'=
, '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.=
*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomput=
ing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,=
=2E*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^dig=
ilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', =
'^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptec=
hnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,=
=2E*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^e=
ckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.=
*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^e=
lement14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedf=
ire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-=
electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '=
^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', =
'^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^=
ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '=
^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fair=
child,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', =
'^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^flipkar=
t,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxlink,.*', '^fre=
ebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujit=
su,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^ga=
teway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*=
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^g=
eniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.=
*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix=
,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^g=
umstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^har=
dkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', =
'^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', =
'^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywe=
ll,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,=
=2E*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', =
'^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2s=
e,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.=
*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^in=
costartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,=
=2E*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^inn=
olux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '=
^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^i=
om,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^=
itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*'=
, '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jia=
nda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithko=
ep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^k=
ingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^k=
oe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^l=
aird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,=
=2E*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', =
'^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '=
^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^linksys,.*', =
'^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^=
litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '=
^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', =
'^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*=
', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxboti=
x,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.=
*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*', =
'^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*', =
'^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^meth=
ode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*', '=
^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik,.=
*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', '^=
mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^mob=
ileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,.*=
', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,=
=2E*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '^m=
undoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nation=
al,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netcub=
e,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^ne=
txeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^=
nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.=
*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech,.=
*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*',=
 '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^=
olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*',=
 '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembe=
d,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^or=
anth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', =
'^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^pana=
sonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda,.*', '^pegat=
ron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^p=
hytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*=
', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^=
ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool=
[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^power=
vr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2=
,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^=
qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,=
=2E*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*'=
, '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^rda,.*=
', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervisio=
n,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*=
', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*'=
, '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*',=
 '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sanc=
loud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneid=
er,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^si=
five,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', =
'^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfil=
e,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^si=
novoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitron=
ix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^sm=
artrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*'=
, '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^s=
ourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl=
,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*'=
, '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starter=
kit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storop=
ack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supe=
rmicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^syno=
psys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*'=
, '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,=
=2E*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^t=
eltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,=
=2E*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.=
*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*',=
 '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '=
^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '=
^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*',=
 '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*=
', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '=
^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*=
', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^=
valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,=
=2E*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtua=
l,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,=
=2E*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*'=
, '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', =
'^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*'=
, '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*',=
 '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,=
=2E*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-p=
owers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*',=
 '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '=
^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics=
,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '=
^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zea=
lz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*',=
 '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
