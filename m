Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5091E48A
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305193; cv=none; b=F1f7uFFfXOWMD5O4af4INIeDMqmfw7aMmR3otb/TKBOf1KeXr+FVRD7MCZRa0k9u17B6VBUJc6a26ksmApl6oMKYy+gx5ZN6IifWDgieCbZHe8uInfa2IL2nFOukrZKqt3cild63vGqyN3azTw1N4nETvphMOkffBFKc5xhzKcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305193; c=relaxed/simple;
	bh=kjeLs3DS2I+D9u3q/7EWSRrdQH4b07OFhICjcQZ/LKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R23CDRO0UwOv/Q5IiVu8b5edWaQ+u0WACzpXxq3V7AwN17yFvLSvV9VnoaczatGFsll7qqR9Mg50Zmz6FzXmXn98NQiJ/4x4zk/mKsdxosfVWLFVR4X6pJsSTzCa3YFYVh7HEnRzwCcCPI0yr4owroehfFdvhA7XYi5P8xNmhKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gc2xIBko; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gc2xIBko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735305190; x=1766841190;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kjeLs3DS2I+D9u3q/7EWSRrdQH4b07OFhICjcQZ/LKY=;
  b=gc2xIBkoTBdy3XEYcMgg8EDq7ThKmBtpfVgr6UvQVlSQ4QZfryYGYjik
   NnL70ORebjw4KVGXfwnia0wUa8F4YZBnn/Gg5isONStMhxEhc63N7DlgB
   Hz7qYSxeaULFIGDWoLs/OGjoRBvcMVPUUhxdjbAxilXZjS4r8chXB/Tqr
   ILFFig5VPmUZi2Ha+mtEQ0lHXKZbRMIkMLr1sbN1tpzmcd9GLiKWL6Bs8
   eqrz2qWmQaCCyNigRSXEHbfYMC1RS2iIa9yAg+s830OSd5fdMZfJaFdrH
   DcY9ycc/sFbk0tcFTOsMbf8IyGnhW8iDOJPVAQQG8ZjoYrtkIBT2mO6To
   g==;
X-CSE-ConnectionGUID: ax3QTTQRQ+aOwz6CtgZGDg==
X-CSE-MsgGUID: ZFSTcRMgSz6PbCuM/FyAdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35016859"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35016859"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 05:13:10 -0800
X-CSE-ConnectionGUID: Id52qbibSuaP/cZQgsMU8Q==
X-CSE-MsgGUID: GrjbuWYWQjSVYFcRrCK8kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105242399"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Dec 2024 05:13:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRA9K-0003CU-0G;
	Fri, 27 Dec 2024 13:13:06 +0000
Date: Fri, 27 Dec 2024 21:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Message-ID: <202412272040.aGZjDHaW-lkp@intel.com>
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
In-Reply-To: <20241227-bigtreetech-cb2-v3-2-91c556adcffe@gmail.com>
References: <20241227-bigtreetech-cb2-v3-2-91c556adcffe@gmail.com>
TO: Ivan Sergeev <ivan8215145640@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Ivan Sergeev <ivan8215145640@gmail.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4bbf9020becbfd8fc2c3da790855b7042fad455b]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Sergeev/dt-bind=
ings-arm-rockchip-Add-BigTreeTech-CB2-and-Pi2/20241227-111114
base:   4bbf9020becbfd8fc2c3da790855b7042fad455b
patch link:    https://lore.kernel.org/r/20241227-bigtreetech-cb2-v3-2-91c5=
56adcffe%40gmail.com
patch subject: [PATCH v3 2/2] arm64: dts: rockchip: Add BigTreeTech CB2 and=
 Pi2
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/arch=
ive/20241227/202412272040.aGZjDHaW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241227/202412272040.aGZjDHaW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412272040.aGZjDHaW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:821.3-15: Warni=
ng (reg_format): /mmc@fe2c0000/sdio-wifi@1:reg: property has invalid length=
 (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (=
pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (=
pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (=
simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (=
i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (=
spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:819.14-828.4: W=
arning (avoid_default_addr_size): /mmc@fe2c0000/sdio-wifi@1: Relying on def=
ault #address-cells value
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:819.14-828.4: W=
arning (avoid_default_addr_size): /mmc@fe2c0000/sdio-wifi@1: Relying on def=
ault #size-cells value
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (=
avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: Warning (=
unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_si=
ze'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ns2009@48=
: 'i2c,ignore-nak' does not match any of the regexes: '^#.*', '^(at25|bm|de=
vbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.=
*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pi=
nctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m87=
67|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*=
', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*=
', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA=
-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^=
acelink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad=
,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*',=
 '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aes=
op,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,=
=2E*', '^allegro,.*', '^allegromicro,.*', '^alliedvision,.*', '^allo,.*', '=
^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amar=
ula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.=
*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '=
^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aosong,.*', '=
^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arco=
m,.*', '^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^=
armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asi=
x,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,=
=2E*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^a=
via,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', =
'^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beag=
le,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blute=
k,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*',=
 '^bsh,.*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^cal=
amp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^can=
aan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cav=
ium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '=
^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone=
,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chung=
hwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.*=
', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', =
'^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.=
*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*',=
 '^crystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubie=
tech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^d=
allas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*',=
 '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^df=
robot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,=
=2E*', '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.=
*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dre=
am,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^e=
bbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^ed=
imax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '=
^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida=
,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,=
=2E*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.=
*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*=
', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*'=
, '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*'=
, '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,=
=2E*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.=
*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*'=
, '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', =
'^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*=
', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '=
^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^gl=
obaltop,.*', '^gmt,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^gora=
mo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^ha=
nnstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*=
', '^hideep,.*', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*'=
, '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honey=
well,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^ht=
c,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^=
hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*=
', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*=
', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '=
^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*'=
, '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^ins=
ignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*',=
 '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*'=
, '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '=
^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.=
*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^ka=
m,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackp=
eter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', =
'^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*',=
 '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice=
,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^l=
emaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^lic=
heepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^links=
prite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^lite=
on,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longch=
eer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lun=
zn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^=
mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*'=
, '^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mece=
r,.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas=
,.*', '^mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor=
,.*', '^meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,=
=2E*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '=
^microtips,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '=
^minix,.*', '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^=
mixel,.*', '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moo=
rtec,.*', '^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^=
mpl,.*', '^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mst=
ar,.*', '^mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxi=
c,.*', '^mxicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^=
neofidelity,.*', '^neonode,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,=
=2E*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newv=
ision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.=
*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatek,.*', '^novtech,.*',=
 '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^=
nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^oli=
mex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^=
ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.=
*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^orant=
h,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^o=
uya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panason=
ic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive=
,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pinerive=
r,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*'=
, '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^=
portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^pow=
kiddy,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulse=
dlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qi=
aodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^rad=
xa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^=
raydium,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^re=
nesas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ric=
oh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktec=
h,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*'=
, '^saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '=
^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '=
^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*'=
, '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^=
sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinew=
orld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^si=
five,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^s=
ilead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silicon=
mitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^si=
nowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.=
*', '^skyworks,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', =
'^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '=
^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*',=
 '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^ss=
t,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.=
*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlin=
k,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundanc=
e,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,=
=2E*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^tec=
hnologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*'=
, '^tempo,.*', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.=
*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '=
^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^toppoly,.*'=
, '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^t=
plink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.=
*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^ty=
hx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*=
', '^ufispace,.*', '^ugoos,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', =
'^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vam=
rs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*=
', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*=
', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*',=
 '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom=
,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', =
'^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^wid=
ora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^w=
inlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.=
*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^x=
iaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', =
'^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,=
=2E*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna=
,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*=
', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zt=
e,.*', '^zyxel,.*', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /i2c@fe5c=
0000/ns2009@48: failed to match any schema with compatible: ['ti,tsc2007']
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: host-port=
: phy-supply: 'oneOf' conditional failed, one must be fixed:
   	[[181, 182]] is not of type 'object'
   	[181, 182] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: host-port=
: phy-supply: 'oneOf' conditional failed, one must be fixed:
   	[[184, 185]] is not of type 'object'
   	[184, 185] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: wireless-=
bluetooth: uart1-gpios: {'rockchip,pins': [[2, 13, 0, 187]]} is not of type=
 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touch: to=
uch-gpio: {'rockchip,pins': [[0, 13, 0, 189], [0, 14, 0, 187]]} is not of t=
ype 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:821.3-15: Warni=
ng (reg_format): /mmc@fe2c0000/sdio-wifi@1:reg: property has invalid length=
 (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (pci_de=
vice_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (pci_de=
vice_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (simple=
_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (i2c_bu=
s_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (spi_bu=
s_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:819.14-828.4: W=
arning (avoid_default_addr_size): /mmc@fe2c0000/sdio-wifi@1: Relying on def=
ault #address-cells value
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi:819.14-828.4: W=
arning (avoid_default_addr_size): /mmc@fe2c0000/sdio-wifi@1: Relying on def=
ault #size-cells value
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (avoid_=
unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: Warning (unique=
_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ns2009@48: 'i2c=
,ignore-nak' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|d=
macap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^=
(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-=
single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdh=
ci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^7=
0mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[=
a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$=
', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelin=
k,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', =
'^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adi=
eng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*'=
, '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '=
^allegro,.*', '^allegromicro,.*', '^alliedvision,.*', '^allo,.*', '^allwinn=
er,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*',=
 '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^am=
pere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogi=
x,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aosong,.*', '^apm,.*'=
, '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '=
^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.=
*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '=
^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^a=
tlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '=
^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.=
*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^=
belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blutek,.*', '^b=
oe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*'=
, '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '=
^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '=
^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '=
^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyt=
e,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^ch=
ipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '=
^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.*', '^cloos=
,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab=
,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corp=
ro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystal=
fontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', =
'^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*',=
 '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.=
*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*',=
 '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^dio=
des,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domint=
ech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds=
,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^e=
bs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,.*', '^=
edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '=
^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embe=
dfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empir=
e-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^ene,.*',=
 '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*',=
 '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*=
', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*'=
, '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday=
,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*=
', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^freebox,.*',=
 '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '=
^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*'=
, '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc=
,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^geniatech,.*', '^giantec,=
=2E*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '=
^gmt,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplu=
s,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^=
haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^hideep,.*=
', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '=
^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^ho=
perf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawe=
i,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^h=
ynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*=
', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', =
'^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*',=
 '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.=
*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^i=
nspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*=
', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', =
'^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^=
jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,=
=2E*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*', '^kar=
o,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^=
kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', =
'^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', =
'^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckf=
b,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', =
'^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '=
^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '=
^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,.*', '^li=
tex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^l=
ontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunzn,.*', '^lu=
xul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', =
'^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*=
', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^med=
iatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mell=
anox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mera=
ki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micro=
crystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*'=
, '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^=
mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^m=
iyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mo=
saixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps=
,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,=
=2E*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxi=
cy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,=
=2E*', '^neonode,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^net=
ronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '=
^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,=
=2E*', '^nordic,.*', '^nothing,.*', '^novatek,.*', '^novtech,.*', '^numonyx=
,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '=
^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '=
^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*',=
 '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^open=
pandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^o=
risetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '=
^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^=
parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^ph=
icomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^p=
ixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*=
', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.=
*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*',=
 '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*'=
, '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*'=
, '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^=
raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*=
', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*',=
 '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^=
rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^r=
ohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.=
*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*'=
, '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '^seagate,.=
*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensir=
ion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*=
', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', =
'^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^sifive,.*', =
'^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*',=
 '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*',=
 '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.=
*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyw=
orks,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*'=
, '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*',=
 '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfu=
n,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^s=
star,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^star=
tek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^s=
torm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^s=
unplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^syn=
opsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*'=
, '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*'=
, '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*=
', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,=
=2E*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*=
', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^toppoly,.*', '^topwis=
e,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*',=
 '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tron=
smart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^=
u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufisp=
ace,.*', '^ugoos,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*',=
 '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^=
variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor=
,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visio=
nox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,=
=2E*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^=
wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^wellte=
ch,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*',=
 '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.=
*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wo=
bo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*=
', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.=
*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^y=
es-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yo=
nes-toptech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeite=
c,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^z=
yxel,.*', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /i2c@fe5c0000/n=
s2009@48: failed to match any schema with compatible: ['ti,tsc2007']
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: host-port: phy-=
supply: 'oneOf' conditional failed, one must be fixed:
   	[[181, 182]] is not of type 'object'
   	[181, 182] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: host-port: phy-=
supply: 'oneOf' conditional failed, one must be fixed:
   	[[184, 185]] is not of type 'object'
   	[184, 185] is too long
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: wireless-blueto=
oth: uart1-gpios: {'rockchip,pins': [[2, 13, 0, 187]]} is not of type 'arra=
y'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touch: touch-gp=
io: {'rockchip,pins': [[0, 13, 0, 189], [0, 14, 0, 187]]} is not of type 'a=
rray'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
