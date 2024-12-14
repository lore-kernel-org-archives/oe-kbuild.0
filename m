Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E937461FFE
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 05:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734152748; cv=none; b=WXtlV8hx0ZQ0u7aBFLQZxplwvVRByuSHIOOHCBjZGOh1Xof857dLyylqUBXVssdYFnFtk9Abz+fYBQyrb6ZQUM5VB4zAdLgxIWus9Onmx0psaZFiAw4yALFirQxT2NH5362h9WIvGMGZLVnm3Hny/meQoqiGsIyzVSq1G9MJMMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734152748; c=relaxed/simple;
	bh=M1PaZ9uHiq9qJ5NVWlIM7b0d2EonOLWGG/x6bRxqqHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cwx59cSuClX3QIZk2lp97p6Df1fFSckmifBq/cvSH3feOAIGmwd+CnF84W9Mj+5NK7eD+cvsn8wj7DG0F1n+Z+dC7avFDxQxZKsdbucoGNep47dS9vL8wG65Q/LJuDCIWgUlx3NWiaenAfFYJ2taI8F/uXLDKEqRcUM8vC0IqyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECWYK4ui; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECWYK4ui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734152744; x=1765688744;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M1PaZ9uHiq9qJ5NVWlIM7b0d2EonOLWGG/x6bRxqqHs=;
  b=ECWYK4uiVeMAUH88NVQj2seZpp4ckhmXjh18VvQ3pBvEBcYN8NmsPiXE
   9GWZSpeBjjgJyJ+7FM7VnzqdFiMo5IaOBZhWLdPqYDjZpZqn3uPdSNmhB
   /oxI9VuYzsNk13R4qYzB7nnwcrBbZL/BgbT2vWhSpPE6sVd13lmcrY+rT
   exDYAzWION95pZLWxWtkDxEeC6eXYDYEM7Vmmsr+OSe4fdsuIcYF+q7E8
   6xF9gWniFJ+YW7fyseFej8xNIFI06Am482xHITN46CqikthAP+GgMxxTi
   v612od9YkzUMz18+Jh1DPeuGj4biebZ6eR1acxIHcK/PobMmg11yrvXh6
   A==;
X-CSE-ConnectionGUID: sfHd7boKQxm/pFWQK/GiAA==
X-CSE-MsgGUID: CQuhlhHVT+ukZuQ9cImw2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38391745"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="38391745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 21:05:43 -0800
X-CSE-ConnectionGUID: FRhPXBikQsycZRtZSyy0lA==
X-CSE-MsgGUID: a1BFTJrDSdS0Y/F1m2yovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100873103"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2024 21:05:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMKLT-000CiN-1z;
	Sat, 14 Dec 2024 05:05:39 +0000
Date: Sat, 14 Dec 2024 13:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: display: panel-lvds: Add compatible for AUO
 G084SN05 V9
Message-ID: <202412141456.NMxjSA0Q-lkp@intel.com>
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
In-Reply-To: <20241209204003.1295503-1-festevam@gmail.com>
References: <20241209204003.1295503-1-festevam@gmail.com>
TO: Fabio Estevam <festevam@gmail.com>
TO: neil.armstrong@linaro.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: shawnguo@kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: dri-devel@lists.freedesktop.org
CC: Fabio Estevam <festevam@denx.de>

Hi Fabio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-Estevam/dt-bin=
dings-display-panel-lvds-Add-compatible-for-AUO-G084SN05-V9/20241210-084331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20241209204003.1295503-1-festevam%=
40gmail.com
patch subject: [PATCH] dt-bindings: display: panel-lvds: Add compatible for=
 AUO G084SN05 V9
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20241211 (https://download.01.org/0day-ci/archiv=
e/20241214/202412141456.NMxjSA0Q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241214/202412141456.NMxjSA0Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412141456.NMxjSA0Q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/ebi@10000000=
: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: nand-controller: =
#address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: nand-controller: =
#size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: /ahb/ebi@10000000=
/nand-controller: failed to match any schema with compatible: ['atmel,sama5=
d3-nand-controller']
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel: compatible=
: ['sharp,lq150x1lg11', 'panel-lvds'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/sharp,lq15=
0x1lg11.yaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel: 'data-mapp=
ing', 'height-mm', 'panel-timing', 'port', 'width-mm' do not match any of t=
he regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/sharp,lq15=
0x1lg11.yaml#
>> arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel: compatible=
:0: 'sharp,lq150x1lg11' is not one of ['admatec,9904379', 'auo,b101ew05', '=
auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hs=
d101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel: Unevaluate=
d properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/microchip/at91-nattis-2-natte-2.dtb: panel-timing: clo=
ck-frequency: 'anyOf' conditional failed, one must be fixed:
   	[50000000, 65000000, 80000000] is not of type 'integer'
   	size is 32, expected 64
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: adv7280@21: 'adv,force-=
bt656-4' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|dmaca=
p|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(key=
pad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-sing=
le|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),=
=2E*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70m=
ai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-=
zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$',=
 '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,=
=2E*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', =
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
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: /soc/bus@2100000/mipi@2=
1dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: /soc/bus@2100000/vdoa@2=
1e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: /soc/ipu@2400000: faile=
d to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: /soc/ipu@2800000: faile=
d to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: /capture-subsystem: fai=
led to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: /display-subsystem: fai=
led to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: /disp0: failed to match=
 any schema with compatible: ['fsl,imx-parallel-display']
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: panel-lvds: compatible:=
0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084=
sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2=
', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: panel-lvds: compatible:=
 ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: adv7280@21: 'adv,f=
orce-bt656-4' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|=
dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '=
^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl=
-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sd=
hci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^=
70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^=
[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*=
$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^aceli=
nk,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*',=
 '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^ad=
ieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*=
', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', =
'^allegro,.*', '^allegromicro,.*', '^alliedvision,.*', '^allo,.*', '^allwin=
ner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*'=
, '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^a=
mpere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analog=
ix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aosong,.*', '^apm,.*=
', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', =
'^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,=
=2E*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*'=
, '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', =
'^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*'=
, '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azote=
q,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*',=
 '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blutek,.*', =
'^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,=
=2E*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.=
*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.=
*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.=
*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^char=
gebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*',=
 '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.=
*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.*', '^=
cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^com=
pulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '=
^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^cr=
ystalfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,=
=2E*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dall=
as,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^=
delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrob=
ot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*'=
, '^diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '=
^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*=
', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.=
*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,=
=2E*', '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^el=
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
', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^geniatech,.*', '=
^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop=
,.*', '^gmt,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*',=
 '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,=
=2E*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^=
hideep,.*', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^h=
it,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,=
=2E*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.=
*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hyd=
is,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', =
'^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', =
'^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^in=
et-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '=
^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insign=
al,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^=
inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '=
^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iw=
ave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*',=
 '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.=
*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpete=
r,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^k=
obo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^=
kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*=
', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lema=
ker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^lichee=
pi,.*', '^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,=
=2E*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longche=
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
eofidelity,.*', '^neonode,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.=
*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvisi=
on,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*',=
 '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatek,.*', '^novtech,.*', '^=
numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp=
,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex=
,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ont=
at,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*',=
 '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.=
*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya=
,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,=
=2E*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive,=
=2E*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pineriv=
er,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*=
', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '=
^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^po=
wkiddy,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^puls=
edlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^q=
iaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^ra=
dxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '=
^raydium,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^r=
enesas,.*', '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ri=
coh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rockte=
ch,.*', '^rohm,.*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*=
', '^saef,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', =
'^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', =
'^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*=
', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '=
^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shine=
world,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^s=
ifive,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^=
silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silico=
nmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^s=
inowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,=
=2E*', '^skyworks,.*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*=
', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*'=
, '^sony,.*', '^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.=
*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '=
^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starr=
y,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^stor=
link,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sund=
ance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synolo=
gy,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.=
*', '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^te=
chnologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*=
', '^tempo,.*', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,=
=2E*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*'=
, '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^toppoly,=
=2E*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*'=
, '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tro=
nfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*',=
 '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^ud=
oo,.*', '^ufispace,.*', '^ugoos,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,=
=2E*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*'=
, '^vamrs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vi=
alab,.*', '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vi=
shay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^voco=
re,.*', '^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', =
'^wacom,.*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^w=
e,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*'=
, '^widora,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.=
*', '^winlink,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*',=
 '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.=
*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xipher=
a,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^=
yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', =
'^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zea=
lz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*',=
 '^zte,.*', '^zyxel,.*', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: /soc/bus@2100000/m=
ipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-cs=
i2']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: /soc/bus@2100000/v=
doa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: /soc/ipu@2400000: =
failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: /soc/ipu@2800000: =
failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: /capture-subsystem=
: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: /display-subsystem=
: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: /disp0: failed to =
match any schema with compatible: ['fsl,imx-parallel-display']
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: panel-lvds: compat=
ible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo=
,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd10=
1pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: panel-lvds: compat=
ible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: adv7280@21: 'adv,force=
-bt656-4' does not match any of the regexes: '^#.*', '^(at25|bm|devbus|dmac=
ap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^(ke=
ypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-sin=
gle|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci)=
,.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '^70ma=
i,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-z=
A-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', =
'^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acelink,.=
*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', '^a=
dafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng=
,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '=
^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^al=
legro,.*', '^allegromicro,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,=
=2E*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', =
'^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^amp=
ere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix=
,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*=
', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq,.*=
', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^b=
elling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blutek,.*', '^bo=
e,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*',=
 '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^=
calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^=
caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^=
cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte=
,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chi=
pspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^=
chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.*', '^cloos,=
=2E*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compula=
b,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^cor=
pro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crysta=
lfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*',=
 '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*'=
, '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,=
=2E*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.=
*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^=
diodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^dom=
intech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '=
^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', =
'^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,.*',=
 '^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*'=
, '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^e=
mbedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^em=
pire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^ene,.=
*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.=
*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest=
,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,=
=2E*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^fa=
raday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiya=
ng,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^freebox=
,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.=
*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gatewa=
y,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '=
^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^geniatech,.*', '^gia=
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
 '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesur=
un,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*', '^ka=
ro,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*', '=
^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.*',=
 '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*',=
 '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lck=
fb,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*',=
 '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', =
'^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*', =
'^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,.*', '^l=
itex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^=
lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunzn,.*', '^l=
uxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*',=
 '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.=
*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^me=
diatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mel=
lanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^mer=
aki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^micr=
ocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*=
', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '=
^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^=
miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^m=
osaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mp=
s,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti=
,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxic=
y,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.=
*', '^neonode,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netron=
ix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^ne=
xbox,.*', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*'=
, '^nordic,.*', '^nothing,.*', '^novatek,.*', '^novtech,.*', '^numonyx,.*',=
 '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^ocea=
nic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc=
,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^op=
alkelly,.*', '^openailab,.*', '^opencores,.*', '^openembed,.*', '^openpando=
ra,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^oranth,.*', '^oriset=
ech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^over=
kiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parad=
e,.*', '^parallax,.*', '^pda,.*', '^pericom,.*', '^pervasive,.*', '^phicomm=
,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*', '^pineriver,.*', '^pixcir=
,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^=
pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^portwell,.*', '=
^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pr=
imeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^p=
urism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^q=
ihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raids=
onic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^=
rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^re=
rvision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikom=
agic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.=
*', '^ronbo,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '=
^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^s=
bs,.*', '^schindler,.*', '^schneider,.*', '^sciosense,.*', '^seagate,.*', '=
^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.=
*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^=
sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shi=
ratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*', '^sifive,.*', '^sig=
ma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '^silead,.*', '^si=
lergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*', '^si=
lvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '=
^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,=
=2E*', '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '=
^sochip,.*', '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^=
sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.=
*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^ssta=
r,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^startek=
,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^stor=
m,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunp=
lus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^synops=
ys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '=
^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*', '=
^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', =
'^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*'=
, '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^=
tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^toppoly,.*', '^topwise,.*'=
, '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tp=
o,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart=
,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blo=
x,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.=
*', '^ugoos,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^us=
i,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vamrs,.*', '^varis=
cite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*',=
 '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.=
*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', =
'^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchan=
glong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*',=
 '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wili=
gear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^w=
instar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*',=
 '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xi=
llybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.*', '^x=
nano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^yes-opto=
electronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yones-top=
tech,.*', '^ys,.*', '^ysoft,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', =
'^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*=
', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: /soc/bus@2100000/mipi@=
21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: /soc/bus@2100000/vdoa@=
21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: /soc/ipu@2400000: fail=
ed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: /soc/ipu@2800000: fail=
ed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: /capture-subsystem: fa=
iled to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: /display-subsystem: fa=
iled to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: /disp0: failed to matc=
h any schema with compatible: ['fsl,imx-parallel-display']
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: panel-lvds: compatible=
:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g08=
4sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww=
2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: panel-lvds: compatible=
: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
--
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: adv7280@21: 'adv,=
force-bt656-4' does not match any of the regexes: '^#.*', '^(at25|bm|devbus=
|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', =
'^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctr=
l-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|s=
dhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask,.*', '=
^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '=
^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]=
*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*', '^acel=
ink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*'=
, '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^a=
dieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.=
*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*',=
 '^allegro,.*', '^allegromicro,.*', '^alliedvision,.*', '^allo,.*', '^allwi=
nner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*=
', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^=
ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analo=
gix,.*', '^anbernic,.*', '^andestech,.*', '^anvo,.*', '^aosong,.*', '^apm,.=
*', '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*',=
 '^arctic,.*', '^arcx,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom=
,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*',=
 '^aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '=
^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*',=
 '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*', '^azoteq=
,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^beagle,.*', =
'^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blutek,.*', '=
^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.=
*', '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*',=
 '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*',=
 '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*',=
 '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargeb=
yte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^=
chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*',=
 '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^clockwork,.*', '^clo=
os,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compul=
ab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^co=
rpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^cryst=
alfontz,.*', '^csky,.*', '^csq,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*'=
, '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*=
', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta=
,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*=
', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^d=
iodes,.*', '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domi=
ntech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^=
ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '=
^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,.*', =
'^edt,.*', '^ees,.*', '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*',=
 '^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^em=
bedfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^emp=
ire-electronix,.*', '^emtrion,.*', '^enclustra,.*', '^endless,.*', '^ene,.*=
', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*=
', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,=
=2E*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin=
,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*', '^far=
aday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyan=
g,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^freebox,=
=2E*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,=
=2E*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gat=
eway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*'=
, '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^geniatech,.*', '^=
giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^globaltop,=
=2E*', '^gmt,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*'=
, '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar=
,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hechuang,.*', '^h=
ideep,.*', '^himax,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hi=
t,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.=
*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*',=
 '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,=
=2E*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '=
^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '=
^img,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^ine=
t-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^=
injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insigna=
l,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^i=
nventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^=
isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwa=
ve,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', =
'^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^kam,.*=
', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter=
,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^ko=
bo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^k=
yo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*'=
, '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemak=
er,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheep=
i,.*', '^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprit=
e,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liteon,.=
*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,=
=2E*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^lunzn=
,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^ma=
ntix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', =
'^maxim,.*', '^maxlinear,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,=
=2E*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas=
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
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: /soc/bus@2100000/=
mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-c=
si2']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: /soc/bus@2100000/=
vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: /soc/ipu@2400000:=
 failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: /soc/ipu@2800000:=
 failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: /capture-subsyste=
m: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: /display-subsyste=
m: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: /disp0: failed to=
 match any schema with compatible: ['fsl,imx-parallel-display']
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: panel-lvds: compa=
tible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'au=
o,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd1=
01pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: panel-lvds: compa=
tible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: nand-controller@=
112000: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: iomuxc-gpr@20e00=
00: 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: 'pinc=
trl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-g=
pr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: /soc/bus@2100000=
/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-=
csi2']
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: /soc/bus@2100000=
/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa=
']
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: /soc/ipu@2400000=
: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: /soc/ipu@2800000=
: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: /capture-subsyst=
em: failed to match any schema with compatible: ['fsl,imx-capture-subsystem=
']
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: /display-subsyst=
em: failed to match any schema with compatible: ['fsl,imx-display-subsystem=
']
>> arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel0: com=
patible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', '=
auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hs=
d101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel0: com=
patible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel0: Une=
valuated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel1: com=
patible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', '=
auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hs=
d101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel1: com=
patible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#
   arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: lvds-panel1: Une=
valuated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds=
=2Eyaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
