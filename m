Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7873321423C
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 02:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760755818; cv=none; b=gIie823DlQcCG0rHmAnf6unSKLevW5DfKtTh5yleqXDQpQqLsd/shBL2YGoN9g+Ur6LXZO6441H/UA7WM7Bn/l/D1HDiPW6FCPCzP9yFqimhitVsczgUSztIFvxd3WMe/qPvEtkoCQbX+5n7OB1smIRa9hMHT4oQbbiCMdBHOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760755818; c=relaxed/simple;
	bh=fTzQHb9kuwz6Bp09fr34//OELFelsE9qaaKi9mJAK1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4w1bFQ8R+nEajrXev3hguYZKuVOqh+eZblijJDQd6JziwEPPBwn4k5P/2kMEQ88Xe+SPpzRV+thM2xC0ElqZ7pvJg/f1QChihFkm0bJicPglHNxYe+dC3lQdTJtmVF8VCe/jti9JdgrPgchcTi1Op+gOFEVaqulHWQ5OjhxHHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fO59Wh6Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fO59Wh6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760755815; x=1792291815;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fTzQHb9kuwz6Bp09fr34//OELFelsE9qaaKi9mJAK1w=;
  b=fO59Wh6QVB0PfLMS31TefChZrbkgjJEp0dEnBLFtIEGk6ihjeVWRA4CH
   h4OiDTqVhb5a4T9ogoVT17Xx2v7gPcBhO6dLQZcj6K34N3JuQjf3K4hq7
   npz8sVos63++ah/bJB499dby4wJ76pMMvKZUVa0pmktP2PuCWKp+mDT0g
   +NtcLA1kTvEm+sbSwDUamJ+0IrV9TY1jlMqWKaXK3K08XmQfo0b/ffELe
   9m0QGlJZg26RO+PW87BMabohwBUccnlAyAUTw54IuEKVcMNgdtiHDtdp+
   EAW3UCCVF3fPddOghQszWDfFtKK3AiXJAFWadkUBxiEStwQhIznKgzLSy
   w==;
X-CSE-ConnectionGUID: Va+4sBHxSPW0w3te1Hf4+Q==
X-CSE-MsgGUID: A7hTBwrjTV214mjVkqnHPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63117024"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="63117024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 19:50:14 -0700
X-CSE-ConnectionGUID: nYlpBUCHR1GBgdORwJ0JNw==
X-CSE-MsgGUID: uR8AI6SDQtWj8ULQMhK/KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="181945642"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2025 14:27:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9rzH-0007m3-1N;
	Fri, 17 Oct 2025 21:27:47 +0000
Date: Sat, 18 Oct 2025 05:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/5] arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet
 support
Message-ID: <202510180539.zpbYdo7b-lkp@intel.com>
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
In-Reply-To: <20251016202129.157614-6-prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
References: <20251016202129.157614-6-prabhakar.mahadev-lad.rj@bp.renesas.co=
m>
TO: Prabhakar <prabhakar.csengg@gmail.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Prabhakar <prabhakar.csengg@gmail.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-=
renesas-r9a09g077-Add-ETHSS-node/20251017-043131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel=
=2Egit next
patch link:    https://lore.kernel.org/r/20251016202129.157614-6-prabhakar.=
mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH 5/5] arm64: dts: renesas: rzt2h-n2h-evk: Enable Ether=
net support
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-051-20251017 (https://download.01.org/0day-ci/arch=
ive/20251018/202510180539.zpbYdo7b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251018/202510180539.zpbYdo7b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510180539.zpbYdo7b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: ethernet-phy@3 (=
ethernet-phy-id0007.0772): 'vsc8531,led-0-mode', 'vsc8531,led-1-mode' do no=
t match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi=
[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952=
|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|Powe=
rPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^=
(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '=
^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_=
][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.=
*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^a=
cer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^a=
d,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvisio=
n,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*'=
, '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediat=
ech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.=
*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,=
=2E*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^ar=
asan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon4=
0,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*=
', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*=
', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^b=
eagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bit=
main,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*=
', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '=
^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^ca=
lao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^ca=
ninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cc=
t,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.=
*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chips=
park,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^ch=
uwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*',=
 '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^=
compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '=
^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^c=
reative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.=
*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypre=
ss,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*=
', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*=
', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^di=
gi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*'=
, '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon=
,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*',=
 '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^e=
bv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.=
*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^el=
an,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*=
', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*'=
, '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^en=
dian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^eng=
leder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^es=
win,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervi=
sion,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,=
=2E*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^=
fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.=
*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxli=
nk,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl=
,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gard=
ena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,=
=2E*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^g=
enexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', =
'^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelic=
o,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', =
'^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^h=
aoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*',=
 '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^=
hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar=
,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^=
hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*'=
, '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyund=
ai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*=
', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incirc=
uit,.*', '^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*=
', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^=
ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^=
jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome=
,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luck=
fox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^m=
acnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*',=
 '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megach=
ips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsens=
ing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*=
', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micr=
on,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^m=
ikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramem=
s,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.=
*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mot=
orcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*'=
, '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.=
*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '=
^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '=
^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*=
', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,=
=2E*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nv=
idia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^ok=
i,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^=
onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '=
^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,=
=2E*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda=
,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phon=
tech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '=
^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', =
'^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhe=
x,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip=
,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.=
*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', =
'^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '=
^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '=
^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*=
', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*',=
 '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*',=
 '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^r=
ocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rosea=
pplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,=
=2E*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.=
*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^s=
eagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', =
'^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sg=
micro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinewor=
ld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siem=
ens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '=
^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*',=
 '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinl=
inx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,=
=2E*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smar=
tlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', =
'^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^=
sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.=
*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^ssta=
r,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek=
,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^stor=
m,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunp=
lus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synol=
ogy,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg=
,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*'=
, '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^te=
ejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla=
,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^th=
undercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^=
topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^tor=
adex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', =
'^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '=
^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', =
'^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^u=
goos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^u=
rt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,=
=2E*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*',=
 '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*',=
 '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '=
^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,=
=2E*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.=
*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi=
2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^win=
gtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '=
^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*=
', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingb=
angda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong=
,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^=
yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*',=
 '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', =
'^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.=
*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: ethernet-phy@2 (=
ethernet-phy-id0007.0772): 'vsc8531,led-0-mode', 'vsc8531,led-1-mode' do no=
t match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi=
[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952=
|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|Powe=
rPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^=
(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '=
^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_=
][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.=
*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^a=
cer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^a=
d,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvisio=
n,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*'=
, '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediat=
ech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.=
*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,=
=2E*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^ar=
asan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon4=
0,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*=
', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*=
', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^b=
eagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bit=
main,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*=
', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '=
^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^ca=
lao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^ca=
ninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cc=
t,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.=
*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chips=
park,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^ch=
uwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*',=
 '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^=
compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '=
^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^c=
reative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.=
*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypre=
ss,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*=
', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*=
', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^di=
gi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*'=
, '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon=
,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*',=
 '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^e=
bv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.=
*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^el=
an,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*=
', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*'=
, '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^en=
dian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^eng=
leder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^es=
win,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervi=
sion,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,=
=2E*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^=
fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.=
*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxli=
nk,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl=
,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gard=
ena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,=
=2E*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^g=
enexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', =
'^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelic=
o,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', =
'^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^h=
aoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*',=
 '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^=
hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar=
,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^=
hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*'=
, '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyund=
ai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*=
', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incirc=
uit,.*', '^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*=
', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^=
ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^=
jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome=
,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luck=
fox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^m=
acnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*',=
 '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megach=
ips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsens=
ing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*=
', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micr=
on,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^m=
ikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramem=
s,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.=
*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mot=
orcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*'=
, '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.=
*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '=
^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '=
^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*=
', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,=
=2E*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nv=
idia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^ok=
i,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^=
onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '=
^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,=
=2E*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda=
,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phon=
tech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '=
^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', =
'^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhe=
x,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip=
,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.=
*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', =
'^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '=
^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '=
^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*=
', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*',=
 '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*',=
 '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^r=
ocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rosea=
pplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,=
=2E*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.=
*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^s=
eagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', =
'^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sg=
micro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinewor=
ld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siem=
ens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '=
^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*',=
 '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinl=
inx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,=
=2E*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smar=
tlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', =
'^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^=
sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.=
*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^ssta=
r,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek=
,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^stor=
m,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunp=
lus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synol=
ogy,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg=
,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*'=
, '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^te=
ejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla=
,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^th=
undercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^=
topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^tor=
adex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', =
'^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '=
^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', =
'^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^u=
goos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^u=
rt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,=
=2E*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*',=
 '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*',=
 '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '=
^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,=
=2E*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.=
*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi=
2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^win=
gtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '=
^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*=
', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingb=
angda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong=
,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^=
yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*',=
 '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', =
'^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.=
*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: ethernet-phy@3 (=
ethernet-phy-id0007.0772): 'vsc8531,led-0-mode', 'vsc8531,led-1-mode' do no=
t match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi=
[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952=
|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|Powe=
rPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^=
(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '=
^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_=
][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.=
*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^a=
cer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^a=
d,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvisio=
n,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*'=
, '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediat=
ech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.=
*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,=
=2E*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^ar=
asan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon4=
0,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*=
', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*=
', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^b=
eagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bit=
main,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*=
', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '=
^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^ca=
lao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^ca=
ninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cc=
t,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.=
*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chips=
park,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^ch=
uwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*',=
 '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^=
compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '=
^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^c=
reative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.=
*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypre=
ss,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*=
', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*=
', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^di=
gi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*'=
, '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon=
,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*',=
 '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^e=
bv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.=
*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^el=
an,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*=
', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*'=
, '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^en=
dian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^eng=
leder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^es=
win,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervi=
sion,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,=
=2E*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^=
fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.=
*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxli=
nk,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl=
,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gard=
ena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,=
=2E*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^g=
enexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', =
'^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelic=
o,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', =
'^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^h=
aoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*',=
 '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^=
hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar=
,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^=
hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*'=
, '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyund=
ai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*=
', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incirc=
uit,.*', '^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*=
', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^=
ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^=
jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome=
,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luck=
fox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^m=
acnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*',=
 '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megach=
ips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsens=
ing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*=
', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micr=
on,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^m=
ikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramem=
s,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.=
*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mot=
orcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*'=
, '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.=
*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '=
^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '=
^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*=
', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,=
=2E*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nv=
idia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^ok=
i,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^=
onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '=
^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,=
=2E*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda=
,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phon=
tech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '=
^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', =
'^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhe=
x,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip=
,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.=
*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', =
'^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '=
^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '=
^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*=
', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*',=
 '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*',=
 '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^r=
ocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rosea=
pplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,=
=2E*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.=
*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^s=
eagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', =
'^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sg=
micro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinewor=
ld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siem=
ens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '=
^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*',=
 '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinl=
inx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,=
=2E*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smar=
tlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', =
'^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^=
sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.=
*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^ssta=
r,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek=
,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^stor=
m,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunp=
lus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synol=
ogy,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg=
,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*'=
, '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^te=
ejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla=
,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^th=
undercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^=
topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^tor=
adex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', =
'^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '=
^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', =
'^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^u=
goos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^u=
rt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,=
=2E*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*',=
 '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*',=
 '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '=
^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,=
=2E*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.=
*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi=
2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^win=
gtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '=
^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*=
', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingb=
angda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong=
,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^=
yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*',=
 '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', =
'^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.=
*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: ethernet-phy@2 (=
ethernet-phy-id0007.0772): 'vsc8531,led-0-mode', 'vsc8531,led-1-mode' do no=
t match any of the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi=
[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952=
|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-single|#pinctrl-single|Powe=
rPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^=
(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '=
^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_=
][a-zA-Z0-9#+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.=
*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^a=
cer,.*', '^acme,.*', '^actions,.*', '^actiontec,.*', '^active-semi,.*', '^a=
d,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*'=
, '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^ae=
sop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network=
,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvisio=
n,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*'=
, '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediat=
ech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.=
*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,=
=2E*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^ar=
asan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon4=
0,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*=
', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*=
', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^b=
eagle,.*', '^belling,.*', '^bestar,.*', '^bhf,.*', '^bigtreetech,.*', '^bit=
main,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*=
', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '=
^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^ca=
lao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^ca=
ninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cc=
t,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.=
*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chips=
park,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^ch=
uwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*',=
 '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^=
compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '=
^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^c=
reative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.=
*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypre=
ss,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*=
', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*=
', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^di=
gi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*'=
, '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon=
,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*',=
 '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^e=
bv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.=
*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^el=
an,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*=
', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*'=
, '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^en=
dian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^eng=
leder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^es=
win,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervi=
sion,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,=
=2E*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^=
fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.=
*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^foxli=
nk,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl=
,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gard=
ena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,=
=2E*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^g=
enexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', =
'^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelic=
o,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', =
'^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^h=
aoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*',=
 '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^=
hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar=
,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^=
hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^hwacom,.*'=
, '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyund=
ai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*=
', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incirc=
uit,.*', '^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*=
', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm=
,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^i=
ntel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepa=
th,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^=
ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^=
jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome=
,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '^karo,.*'=
, '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '^kinet=
ic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*', '^kob=
ol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lac=
ie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*'=
, '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^lina=
ro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', '^link=
sys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteo=
n,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
er,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luck=
fox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^m=
acnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', =
'^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*',=
 '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megach=
ips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsens=
ing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*=
', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micr=
on,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^m=
ikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramem=
s,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.=
*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mot=
orcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*'=
, '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.=
*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '=
^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '=
^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*=
', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,=
=2E*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', =
'^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^=
novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nv=
idia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^ok=
i,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^=
onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '=
^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,=
=2E*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '=
^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,=
=2E*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^particle,.*', '^pda=
,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^phon=
tech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '=
^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', =
'^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhe=
x,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip=
,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.=
*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', =
'^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '=
^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '=
^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*=
', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*',=
 '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*',=
 '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^r=
ocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^rosea=
pplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,=
=2E*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.=
*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^s=
eagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', =
'^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sg=
micro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shinewor=
ld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siem=
ens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '=
^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.*',=
 '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinl=
inx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,=
=2E*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^smar=
tlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', =
'^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^=
sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.=
*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^ssta=
r,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek=
,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^stor=
m,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunp=
lus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synol=
ogy,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg=
,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*'=
, '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^te=
ejet,.*', '^teltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla=
,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^th=
undercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^=
topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^tor=
adex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', =
'^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '=
^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', =
'^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^u=
goos,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^u=
rt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,=
=2E*', '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*',=
 '^vialab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*',=
 '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '=
^vocore,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,=
=2E*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.=
*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi=
2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^win=
gtech,.*', '^winlink,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '=
^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*=
', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingb=
angda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong=
,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^=
yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*',=
 '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', =
'^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.=
*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
