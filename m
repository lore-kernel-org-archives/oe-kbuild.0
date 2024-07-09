Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26CF13C687
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527810; cv=none; b=rSZV+91OmjMibLmFj9WqHGwzKobDPjRrzsHcQEk5ysvwjgbZMkBytZfvtDPNqzQflyOdp97LNF0spzz5K1GL6TSdQdhHQn+08IdKEsjwZdrws4E3rT14DkkWlalnOcRiLt+4nGP9erm3OJ6L3bvQkzPTm/7vgeC4SDjRNfdvKQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527810; c=relaxed/simple;
	bh=afmWDcWjW9N+h9EwKH7zFra+8lZkg2wEgUCjHHXmFGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Olv4FeL79XLIXd27QzAyanFTtggfW/eJm7C0arrqEDZyG8ScQ4zWmfHOchl+jSSWw9nK4oWxaXpcQTLG0kDNbZK3hPA/6bN7sgs2IRfjjpizPpnvciWQJz8nJR6t6YF/ygHf/lvbkRk4B16Zmq9xIQXKZhExaTALAUh6mU9tz8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTrVeoTJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTrVeoTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720527809; x=1752063809;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=afmWDcWjW9N+h9EwKH7zFra+8lZkg2wEgUCjHHXmFGQ=;
  b=iTrVeoTJgDeM12qwCqP7SUfFNs2xdPcO0dxVCukpKmnN0QhgPg33q+dh
   Nn/iz2+EDVlUQ0uRdhSbRwTJVYOBVnBPukO51V4IhB/z8ylm+prbQQN+z
   YbdWGJKTpudKomzQVMT5rR3Pv+7KNyqft40zMMB/cFFNYQMfKxbq7mwQr
   VXF9tI8oFNB0prtw/ZNRkX5XWKPDiRAIMlRDKsPoQtLT0bqzi2AqAgPCQ
   5yFzLBE/UIoLXFSucfK2OnkWx4hVeS+B9gW3pvGhiz8yTooeowCJcLjtl
   B4aCJ+k6mZ1qAYmL8gEPR/PjHSF0QGQW+qKdELW34kXYjbBj/aQXd9JyY
   Q==;
X-CSE-ConnectionGUID: xyFur+yuTXmOoxTj8/PXJA==
X-CSE-MsgGUID: IWKBmD8tT/idMKu4NNIlJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21592844"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="21592844"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:23:27 -0700
X-CSE-ConnectionGUID: gMhVUfrhQPK9TcNvvVdtAg==
X-CSE-MsgGUID: JhPhKSYRRye6k8X+998tdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="47805960"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2024 05:23:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR9sS-000Wes-04;
	Tue, 09 Jul 2024 12:23:24 +0000
Date: Tue, 9 Jul 2024 20:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.6.y-cicd 12/14]
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: video-codec@30210000:
 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202407092000.s0HfkyUX-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Brandon Brnich <b-brnich@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.=
6.y-cicd
head:   32fb3aae72f286cd0d023455b5fc9e4c6b9859f5
commit: 3794845abd132df693ac076482b1a5dfa8ac560b [12/14] arm64: dts: ti: k3=
-am62p-main: Add OPP table to the VPU node
:::::: branch date: 14 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-051-20240709 (https://download.01.org/0day-ci/arch=
ive/20240709/202407092000.s0HfkyUX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240709/202407092000.s0HfkyUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407092000.s0HfkyUX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: pinctrl-single,g=
pio-range: [[29, 0, 32, 327687], [29, 33, 92, 327687], [29, 137, 5, 327687]=
, [29, 143, 3, 327687], [29, 149, 2, 327687]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: 'interrupts' doe=
s not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: Unevaluated pro=
perties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: {'compatible': =
['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interru=
pts': [[0, 178, 4]], 'power-domains': [[4, 146, 1]], 'clocks': [[3, 146, 0]=
], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'=
], 'pinctrl-0': [[30]], 'interrupts-extended': [[1, 0, 178, 4], [31, 456]],=
 'interrupt-names': ['irq', 'wakeup'], 'bootph-all': True, 'phandle': [[132=
]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['=
interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: serial@2800000: {'compatible': =
['ti,am64-uart', 'ti,am654-uart'], 'reg': [[0, 41943040, 0, 256]], 'interru=
pts': [[0, 178, 4]], 'power-domains': [[4, 146, 1]], 'clocks': [[3, 146, 0]=
], 'clock-names': ['fclk'], 'status': ['okay'], 'pinctrl-names': ['default'=
], 'pinctrl-0': [[30]], 'interrupts-extended': [[1, 0, 178, 4], [31, 456]],=
 'interrupt-names': ['irq', 'wakeup'], 'bootph-all': True, 'phandle': [[132=
]], '$nodename': ['serial@2800000']} is valid under each of {'required': ['=
interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: video-codec@30210000: 'operatin=
g-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']
--
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: syscon@43000000: compatible: ['=
syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: dss-oldi-io-ctrl@8600: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am625-dss-oldi-io=
-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,j784s4-=
acspcie-proxy-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@f4000: pinctrl-single,g=
pio-range: [[35, 0, 32, 327687], [35, 33, 55, 327687], [35, 101, 25, 327687=
], [35, 137, 5, 327687], [35, 143, 3, 327687], [35, 149, 2, 327687]] is too=
 long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: video-codec@30210000: 'operatin=
g-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: e5010@fd20000: 'clock-names' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc=
=2Eyaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
