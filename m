Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B272836F
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 03:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755143446; cv=none; b=J7lHiW/Lz1oB3S8Mn5Gmg4AxwkS94lFKIwPFSNH711+SFr/zl9+bzb6JBiUuchgrOPfozQeGlssRUjL1New1XwUX76IYE4iEhBw6tizOjCVgVD4tVXozJlJ1xn5oxdPu0JxZi0GWucsry0L9A7i01Gdm8tEbkRy6lY8Zfp0Ke18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755143446; c=relaxed/simple;
	bh=snXXFmsTzudKFmumwO4tq/5CobFUL7mFVzjoyC3V+9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tSUvRy4R7s33otBi2iy1EdP+rY1ekPRHr+v6dPW+LeEWA5xQ1WCqDSonsAr2RB1NF9cF/cTMzG7bvC534311ESPbi71jbCeKYqU6wjmlOwFFpLYPAPukWKS5jYiDw+KbcpTbLBj93m0Bj2snhEqN8cr1VfKn9kuPqngbx/OheQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuLrR0M/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuLrR0M/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755143443; x=1786679443;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=snXXFmsTzudKFmumwO4tq/5CobFUL7mFVzjoyC3V+9w=;
  b=OuLrR0M/tlJzZwJ6tumxlFNdYNn+735SSs97NB6N5B81Ijt5InNVo3IP
   GjR9PUsPOf2I0Xs4ShWoLZvBTxJ/1LD9EWknDLXSKUvXcLMKJ+je9FSbw
   A+rjfDIARd98H4c/p4EI7tlFt/p6QDIxHdoek1BVDSnh2MrMRmjaJRv2+
   Um+7hiYLWUei6EgRnmhwSkEqkcBgnDpbiJMZHH5uiMdAKxeLj3je+hACs
   AgGHembUBVl78ZqwUhr8rZrrs/bIXrknsvWrErb0l/4cgum8gM34MQb1k
   INLGNOxBh9K9yEQNlU9mUwS4eCrRZfvB+F5TetVM25cgOmuB0fnsp2oiE
   A==;
X-CSE-ConnectionGUID: Mr8clY8pQ1GAK7F8sSWE6w==
X-CSE-MsgGUID: U5FKeQCuRH6UigjSbe6g3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68056385"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68056385"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 20:50:42 -0700
X-CSE-ConnectionGUID: JKjyA/OKTMyk3O18ln+ylA==
X-CSE-MsgGUID: N160PDbVSFO7dEtvnqPylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="165871157"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Aug 2025 20:50:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umOz8-000AYg-0c;
	Thu, 14 Aug 2025 03:50:38 +0000
Date: Thu, 14 Aug 2025 11:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [net-next v2 2/4] ARM: dts: aspeed-g6: Add ethernet alise and
 update MAC compatible
Message-ID: <202508141144.wfCpIjc0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250813063301.338851-3-jacky_chou@aspeedtech.com>
References: <20250813063301.338851-3-jacky_chou@aspeedtech.com>
TO: Jacky Chou <jacky_chou@aspeedtech.com>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S . Miller" <davem@davemloft.net>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: Simon Horman <horms@kernel.org>
CC: Heiner Kallweit <hkallweit1@gmail.com>
CC: "Uwe Kleine-K=F6nig" <u.kleine-koenig@baylibre.com>
CC: "Po-Yu Chuang" <ratbert@faraday-tech.com>
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: taoren@meta.com
CC: bmc-sw2@aspeedtech.com

Hi Jacky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.16]
[also build test WARNING on next-20250813]
[cannot apply to net-next/main robh/for-next net/main linus/master v6.17-rc=
1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindin=
gs-net-ftgmac100-Restrict-phy-mode-and-delay-properties-for-AST2600/2025081=
3-143719
base:   v6.16
patch link:    https://lore.kernel.org/r/20250813063301.338851-3-jacky_chou=
%40aspeedtech.com
patch subject: [net-next v2 2/4] ARM: dts: aspeed-g6: Add ethernet alise an=
d update MAC compatible
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm-randconfig-053-20250814 (https://download.01.org/0day-ci/archiv=
e/20250814/202508141144.wfCpIjc0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 376=
9ce013be2879bf0b329c14a16f5cb766f26ce)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250814/202508141144.wfCpIjc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508141144.wfCpIjc0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
670000 (aspeed,ast2600-mac23): compatible: 'oneOf' conditional failed, one =
must be fixed:
   	['aspeed,ast2600-mac23', 'aspeed,ast2600-mac', 'faraday,ftgmac100'] is =
too long
   	'faraday,ftgmac100' was expected
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000 (aspeed,ast2600-mac23): compatible: 'oneOf' conditional failed, one =
must be fixed:
   	['aspeed,ast2600-mac23', 'aspeed,ast2600-mac', 'faraday,ftgmac100'] is =
too long
   	'faraday,ftgmac100' was expected
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000 (aspeed,ast2600-mac23): Unevaluated properties are not allowed ('mel=
lanox,multi-host', 'ncsi-channel', 'ncsi-ctrl,no-channel-monitor', 'ncsi-ct=
rl,start-redo-probe', 'ncsi-package', 'ncsi-rexmit', 'ncsi-timeout' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000 (aspeed,ast2600-mac23): 'ncsi-ctrl,no-channel-monitor', 'ncsi-ctrl,s=
tart-redo-probe' do not match any of the regexes: '^#.*', '^(at25|bm|devbus=
|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', =
'^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-singl=
e|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|=
s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100a=
sk,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SU=
NW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-=
9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*=
', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*',=
 '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi=
,.*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', =
'^aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-net=
work,.*', '^allegro,.*', '^allegromicro,.*', '^alliedvision,.*', '^allo,.*'=
, '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^a=
marula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogi=
c,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*'=
, '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', =
'^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archerm=
ind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^ariaboard,.*', '^aries,.*=
', '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^a=
sahi-kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^astera=
labs,.*', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '=
^auvidea,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*=
', '^axentia,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bana=
napi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bigtreete=
ch,.*', '^bitmain,.*', '^blaize,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', =
'^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^bu=
ffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosy=
stems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capel=
la,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*',=
 '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.=
*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongz=
hou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*=
', '^cirrus,.*', '^cisco,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,=
=2E*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compulab,.*', '^comvetia,.*=
', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.=
*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.=
*', '^csot,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,=
=2E*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^da=
taimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '=
^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh=
,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.=
*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.=
*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*',=
 '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-sy=
start,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edima=
x,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^el=
an,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*=
', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*'=
, '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '=
^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^=
epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^e=
verest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^e=
xegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', =
'^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^f=
eiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^fre=
ebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujit=
su,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^ga=
teway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*=
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^g=
eniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.=
*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix=
,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^g=
umstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^har=
dkernel,.*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*', '=
^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*=
', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', =
'^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', =
'^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai=
,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*',=
 '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*', '^incircui=
t,.*', '^indiedroid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^i=
ngenic,.*', '^ingrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', =
'^inside-secure,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercont=
rol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^=
irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*',=
 '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*=
', '^jedec,.*', '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '=
^jide,.*', '^joz,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*'=
, '^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kin=
gnovel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*'=
, '^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*=
', '^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '=
^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.=
*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lin=
eartechnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^lin=
ux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', =
'^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongma=
sses,.*', '^loongson,.*', '^lsi,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '=
^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^m=
arantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '=
^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachip=
s,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensin=
g,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*',=
 '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron=
,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mik=
rotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,=
=2E*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.=
*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^mot=
orcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*'=
, '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.=
*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '=
^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '=
^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*=
', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,=
=2E*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '=
^nordic,.*', '^nothing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^=
nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic=
,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*=
', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalk=
elly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpandora,=
=2E*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisete=
ch,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overk=
iz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade=
,.*', '^parallax,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive=
,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pi=
ne64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '=
^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*=
', '^polyhex,.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', =
'^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^=
probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,=
=2E*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qis=
henglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ral=
ink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^rda,.*', '^real=
tek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^=
retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^riko=
magic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,=
=2E*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*'=
, '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', =
'^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '^seagate,.*'=
, '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirio=
n,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*',=
 '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^=
shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^sifive,.*', '^=
siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*',=
 '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^sil=
iconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', =
'^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^sk=
ov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '=
^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun=
,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemi=
t,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^squar=
e,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^st=
arfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^ste=
ricsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^=
sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '=
^syna,.*', '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*',=
 '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-displ=
ay,.*', '^technexion,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*'=
, '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^terasic,.*', '^tesla,.*', '=
^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunderco=
mm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,=
=2E*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,=
=2E*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^t=
q,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^tr=
uly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u=
-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoo=
s,.*', '^ultratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,=
=2E*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.=
*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '=
^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '=
^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^v=
oipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*'=
, '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^we=
lltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,=
=2E*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^win=
link,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf=
,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^=
xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^x=
iphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*=
', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,=
=2E*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.=
*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', =
'^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: syscon@1e6e=
2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regex=
es: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctr=
l(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/sy=
scon@1e6e2000/smp-memram@180: failed to match any schema with compatible: [=
'aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/di=
splay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast260=
0-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: adc@1e6e900=
0 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: adc@1e6e910=
0 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: crypto@1e6f=
a000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes=
: '^pinctrl-[0-9]+$'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
