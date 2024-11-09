Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C4A1DFD1
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 09:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731144225; cv=none; b=oKvGb7946eYY3py8C/yCdNP9+aBx+KIIU5w4EMoCmRGrrBv9/bmn73/5Y2B0gFLKxTgHn4rZ4y7V0mgmD+SB+lV5CB5+CI/Tkz3cuirUnFiDPKAUs8nswkBKaHQWEidZCxuCtVdJ6qqXrRHciULE6zF4pAfFQ7Z3YNYbDGMU0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731144225; c=relaxed/simple;
	bh=32G3iZGOGhd6QTpJDaz/a5ZFAJZ3liIpWfYoBHZqbuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHMUC8SxQil/LcZIi4NIX+VrS0tg+SMyQ+Qc3jdRscjTtnk9532uKBcMUlfl3l8r3cf8YT3r5/ZpL46y4O3p5GzpZK5UsbRpBQyt9H4wLtgJGpVtnRJHhWLcwFoOil/T+0itxnnc2+JXyS9G/iJazbSqq0ScZ2e/cSKAt/GgMaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqkLOjB+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqkLOjB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731144223; x=1762680223;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=32G3iZGOGhd6QTpJDaz/a5ZFAJZ3liIpWfYoBHZqbuM=;
  b=OqkLOjB+iYqXI6zZnCjLurKXd0v71F+V8Uh+4K6gC0VMWlPnM6SlOfDt
   R+eEYBi/BUkqMbOI1iv91H6nZ7Y6FphzhxOoja2bbEpeXHm+YBsrAAMQC
   K3AMYMSNcIX0rUFcljbNQdOM3dTazM4mytydYbYMVbCXPL+ltSkasI0TR
   N5476I+snWDoJ4ygIOY6ds03Flow4slmkH421vvi6mKLT1lghQ31/54Ym
   Utxac1HGzvpSFE5f4kUbDu2epVf7e9aEQhrGb6eUwbvHe3IWAVuPPMbL4
   iKJRrK0L3IUVB1rIAjg/7LUmRllLShh8N2hHl1+Ok7h9udLh0A8F+jSmS
   Q==;
X-CSE-ConnectionGUID: zZxMtwaXQ12gb9HP/ZReDA==
X-CSE-MsgGUID: LDAkGkIjQ4eFlndgYB8dxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53585939"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53585939"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 01:23:42 -0800
X-CSE-ConnectionGUID: dsAIkG2hREWtO4KrUlfg1g==
X-CSE-MsgGUID: rbb+odwJQHe76uUw15P6vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="123483382"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2024 01:23:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9hgv-000sFS-2f;
	Sat, 09 Nov 2024 09:23:37 +0000
Date: Sat, 9 Nov 2024 17:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: add mipi dcphy nodes to rk3588
Message-ID: <202411091741.HIXExrzJ-lkp@intel.com>
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
In-Reply-To: <20241106123758.423584-2-heiko@sntech.de>
References: <20241106123758.423584-2-heiko@sntech.de>
TO: Heiko Stuebner <heiko@sntech.de>
TO: heiko@sntech.de
CC: quentin.schulz@cherry.de
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Heiko Stuebner <heiko.stuebner@cherry.de>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/arm64=
-dts-rockchip-add-mipi-dcphy-nodes-to-rk3588/20241106-210147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchi=
p.git for-next
patch link:    https://lore.kernel.org/r/20241106123758.423584-2-heiko%40sn=
tech.de
patch subject: [PATCH 1/3] arm64: dts: rockchip: add mipi dcphy nodes to rk=
3588
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20241107 (https://download.01.org/0day-ci/arch=
ive/20241109/202411091741.HIXExrzJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241109/202411091741.HIXExrzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411091741.HIXExrzJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /hdmi@fde80000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /phy@feda0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /phy@fedb0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: analog-sound: Unev=
aluated properties are not allowed ('hp-det-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/audio-graph-card.y=
aml#
--
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /hdmi@fde80000: faile=
d to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /phy@feda0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /phy@fedb0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /hdmi@fde80000: =
failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /phy@feda0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /phy@fedb0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /hdmi@fde800=
00: failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-q=
p']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /phy@feda000=
0: failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy=
']
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /phy@fedb000=
0: failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy=
']
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /hdmi@fde80000=
: failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /phy@feda0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /phy@fedb0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /hdmi@fde80000=
: failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /phy@feda0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /phy@fedb0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1276.7-1284.4: Warning =
(graph_child_address): /usb@fc000000/port: graph node has single child node=
 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /hdmi@fde80000: failed=
 to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /phy@feda0000: failed =
to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /phy@fedb0000: failed =
to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: analog-sound: 'simple-=
audio-card,hp-det-gpios' does not match any of the regexes: '^simple-audio-=
card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple=
-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$=
', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /hdmi@f=
de80000: failed to match any schema with compatible: ['rockchip,rk3588-dw-h=
dmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /phy@fe=
da0000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-=
dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /phy@fe=
db0000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-=
dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: analog-=
sound: 'simple-audio-card,hp-det-gpios' does not match any of the regexes: =
'^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]=
+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,pla=
t(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: fan@18: compatible:0: 't=
sd,mule' is not one of ['acbel,fsg032', 'ad,ad7414', 'adi,ad7414', 'ad,adm9=
240', 'adi,ad5110', 'adi,adp5589', 'adi,lt7182s', 'ams,iaq-core', 'asterala=
bs,pt5161l', 'atmel,atecc508a', 'atmel,atsha204', 'atmel,atsha204a', 'blute=
k,bpa-rs600', 'bosch,bme680', 'capella,cm32181', 'capella,cm3232', 'capella=
,cm3323', 'cisco,spi-petra', 'dallas,ds1631', 'dallas,ds1682', 'dallas,ds17=
80', 'dallas,ds4510', 'delta,ahe50dc-fan', 'delta,dps650ab', 'delta,dps920a=
b', 'delta,q54sj108a2', 'devantech,srf02', 'devantech,srf08', 'devantech,sr=
f10', 'dh,dhcom-board', 'dlg,da9053', 'domintech,dmard05', 'domintech,dmard=
06', 'domintech,dmard07', 'domintech,dmard09', 'domintech,dmard10', 'elgin,=
jg10309-01', 'fsl,mma7660', 'fsl,mma8450', 'fsl,mpl3115', 'fsl,mpr121', 'ho=
neywell,hi6130', 'ibm,cffps', 'ibm,cffps1', 'ibm,cffps2', 'ibm,p8-occ-hwmon=
', 'infineon,dps310', 'infineon,ir36021', 'infineon,irps5401', 'infineon,tl=
v493d-a1b6', 'infineon,xdp710', 'infineon,xdpe11280', 'infineon,xdpe12254',=
 'infineon,xdpe12284', 'infineon,xdpe15284', 'infineon,xdpe152c4', 'injoini=
c,ip5108', 'injoinic,ip5109', 'injoinic,ip5207', 'injoinic,ip5209', 'inspur=
,ipsps1', 'isil,isl29028', 'isil,isl29030', 'isil,isl68137', 'isil,isl69260=
', 'isil,isl69269', 'isil,isl76682', 'jedec,spd5118', 'lineartechnology,ltc=
2488', 'maxim,ds1050', 'maxim,ds1803-010', 'maxim,ds1803-050', 'maxim,ds180=
3-100', 'maxim,ds3502', 'maxim,max1619', 'maxim,max31730', 'maxim,max5481',=
 'maxim,max5482', 'maxim,max5483', 'maxim,max5484', 'maxim,max6621', 'mcube=
,mc3230', 'meas,htu21', 'meas,ms5637', 'meas,ms5803', 'meas,ms5805', 'meas,=
ms5837', 'meas,ms8607-humidity', 'meas,ms8607-temppressure', 'meas,tsys01',=
 'memsic,mmc35240', 'memsic,mxc4005', 'memsic,mxc6225', 'memsic,mxc6255', '=
memsic,mxc6655', 'menlo,m53cpld', 'microchip,mcp3421', 'microchip,mcp3422',=
 'microchip,mcp3423', 'microchip,mcp3424', 'microchip,mcp3425', 'microchip,=
mcp3426', 'microchip,mcp3427', 'microchip,mcp3428', 'microchip,mcp4017-103'=
, 'microchip,mcp4017-104', 'microchip,mcp4017-502', 'microchip,mcp4017-503'=
, 'microchip,mcp4018-103', 'microchip,mcp4018-104', 'microchip,mcp4018-502'=
, 'microchip,mcp4018-503', 'microchip,mcp4019-103', 'microchip,mcp4019-104'=
, 'microchip,mcp4019-502', 'microchip,mcp4019-503', 'microchip,tc654', 'mic=
rochip,tc655', 'micron,spi-authenta', 'miramems,da226', 'miramems,da280', '=
miramems,da311', 'mps,mp2856', 'mps,mp2857', 'mps,mp2888', 'mps,mp2891', 'm=
ps,mp2971', 'mps,mp2973', 'mps,mp2975', 'mps,mp2993', 'mps,mp5920', 'mps,mp=
5990', 'mps,mp9941', 'mps,mpq8785', 'national,lm63', 'national,lm80', 'nati=
onal,lm81', 'national,lm85', 'national,lm92', 'nuvoton,w83773g', 'oki,ml86v=
7667', 'plx,pex8648', 'pulsedlight,lidar-lite-v2', 'renesas,hs3001', 'renes=
as,isl29501', 'rohm,bh2228fv', 'rohm,dh2228fv', 'samsung,24ad0xd1', 'samsun=
g,exynos-sataphy-i2c', 'semtech,sx1301', 'sensirion,sgp30', 'sensirion,sgp4=
0', 'sensirion,sgpc3', 'sensirion,sht4x', 'sensortek,stk8312', 'sensortek,s=
tk8ba50', 'sgx,vz89x', 'silabs,em3581', 'silabs,si3210', 'silabs,si7005', '=
silabs,si7020', 'skyworks,sky81452', 'sparkfun,qwiic-joystick', 'swir,mango=
h-iotport-spi', 'taos,tsl2550', 'ti,amc6821', 'ti,hdc1000', 'ti,hdc1008', '=
ti,hdc1010', 'ti,hdc1050', 'ti,hdc1080', 'ti,lm70', 'ti,lm71', 'ti,lm73', '=
ti,lm74', 'ti,lm96000', 'ti,tmp103', 'ti,tmp121', 'ti,tmp122', 'ti,tmp125',=
 'ti,tps40400', 'ti,tps53676', 'ti,tps53679', 'ti,tps53688', 'ti,tps544b20'=
, 'ti,tps544b25', 'ti,tps544c20', 'ti,tps544c25', 'ti,tps546d24', 'ti,tsc20=
03', 'vicor,pli1209bc', 'winbond,w83793']
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: fan@18: compatible: ['ts=
d,mule', 'ti,amc6821'] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: fan@18: 'i2c-mux' does n=
ot match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /i2c@fd880000/fan@18: fa=
iled to match any schema with compatible: ['tsd,mule', 'ti,amc6821']
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /hdmi@fde80000: failed t=
o match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /phy@feda0000: failed to=
 match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /phy@fedb0000: failed to=
 match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /hdmi@fde80000: faile=
d to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /phy@feda0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /phy@fedb0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: sound: 'simple-audio-=
card,hp-det-gpios' does not match any of the regexes: '^simple-audio-card,c=
odec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio=
-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pi=
nctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /hdmi@fde80000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /phy@feda0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /phy@fedb0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: sound: 'simple-au=
dio-card,hp-det-gpios' does not match any of the regexes: '^simple-audio-ca=
rd,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-a=
udio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$',=
 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /hdmi@fde80000: failed=
 to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /phy@feda0000: failed =
to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /phy@fedb0000: failed =
to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: sound: 'simple-audio-c=
ard,hp-det-gpios' does not match any of the regexes: '^simple-audio-card,co=
dec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-=
card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pin=
ctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /hdmi@fde80000:=
 failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /phy@feda0000: =
failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /phy@fedb0000: =
failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: sound: 'simple-=
audio-card,hp-det-gpios' does not match any of the regexes: '^simple-audio-=
card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple=
-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$=
', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /hdmi@fde80000: fai=
led to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /phy@feda0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /phy@fedb0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: sound: 'simple-audi=
o-card,hp-det-gpios' does not match any of the regexes: '^simple-audio-card=
,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-aud=
io-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', '=
pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1149.7-1157.4: Warnin=
g (graph_child_address): /usb@fc000000/port: graph node has single child no=
de 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /hdmi@fde80000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /phy@feda0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /phy@fedb0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: analog-sound: Uneval=
uated properties are not allowed ('hp-det-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/audio-graph-card.y=
aml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /pcie-oscillator: fa=
iled to match any schema with compatible: ['gated-fixed-clock']
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /hdmi@fde80000: failed =
to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /phy@feda0000: failed t=
o match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /phy@fedb0000: failed t=
o match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: analog-sound: Unevaluat=
ed properties are not allowed ('hp-det-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/audio-graph-card.y=
aml#
--
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /hdmi@fde80000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: fan@18: compatible=
:0: 'tsd,mule' is not one of ['acbel,fsg032', 'ad,ad7414', 'adi,ad7414', 'a=
d,adm9240', 'adi,ad5110', 'adi,adp5589', 'adi,lt7182s', 'ams,iaq-core', 'as=
teralabs,pt5161l', 'atmel,atecc508a', 'atmel,atsha204', 'atmel,atsha204a', =
'blutek,bpa-rs600', 'bosch,bme680', 'capella,cm32181', 'capella,cm3232', 'c=
apella,cm3323', 'cisco,spi-petra', 'dallas,ds1631', 'dallas,ds1682', 'dalla=
s,ds1780', 'dallas,ds4510', 'delta,ahe50dc-fan', 'delta,dps650ab', 'delta,d=
ps920ab', 'delta,q54sj108a2', 'devantech,srf02', 'devantech,srf08', 'devant=
ech,srf10', 'dh,dhcom-board', 'dlg,da9053', 'domintech,dmard05', 'domintech=
,dmard06', 'domintech,dmard07', 'domintech,dmard09', 'domintech,dmard10', '=
elgin,jg10309-01', 'fsl,mma7660', 'fsl,mma8450', 'fsl,mpl3115', 'fsl,mpr121=
', 'honeywell,hi6130', 'ibm,cffps', 'ibm,cffps1', 'ibm,cffps2', 'ibm,p8-occ=
-hwmon', 'infineon,dps310', 'infineon,ir36021', 'infineon,irps5401', 'infin=
eon,tlv493d-a1b6', 'infineon,xdp710', 'infineon,xdpe11280', 'infineon,xdpe1=
2254', 'infineon,xdpe12284', 'infineon,xdpe15284', 'infineon,xdpe152c4', 'i=
njoinic,ip5108', 'injoinic,ip5109', 'injoinic,ip5207', 'injoinic,ip5209', '=
inspur,ipsps1', 'isil,isl29028', 'isil,isl29030', 'isil,isl68137', 'isil,is=
l69260', 'isil,isl69269', 'isil,isl76682', 'jedec,spd5118', 'lineartechnolo=
gy,ltc2488', 'maxim,ds1050', 'maxim,ds1803-010', 'maxim,ds1803-050', 'maxim=
,ds1803-100', 'maxim,ds3502', 'maxim,max1619', 'maxim,max31730', 'maxim,max=
5481', 'maxim,max5482', 'maxim,max5483', 'maxim,max5484', 'maxim,max6621', =
'mcube,mc3230', 'meas,htu21', 'meas,ms5637', 'meas,ms5803', 'meas,ms5805', =
'meas,ms5837', 'meas,ms8607-humidity', 'meas,ms8607-temppressure', 'meas,ts=
ys01', 'memsic,mmc35240', 'memsic,mxc4005', 'memsic,mxc6225', 'memsic,mxc62=
55', 'memsic,mxc6655', 'menlo,m53cpld', 'microchip,mcp3421', 'microchip,mcp=
3422', 'microchip,mcp3423', 'microchip,mcp3424', 'microchip,mcp3425', 'micr=
ochip,mcp3426', 'microchip,mcp3427', 'microchip,mcp3428', 'microchip,mcp401=
7-103', 'microchip,mcp4017-104', 'microchip,mcp4017-502', 'microchip,mcp401=
7-503', 'microchip,mcp4018-103', 'microchip,mcp4018-104', 'microchip,mcp401=
8-502', 'microchip,mcp4018-503', 'microchip,mcp4019-103', 'microchip,mcp401=
9-104', 'microchip,mcp4019-502', 'microchip,mcp4019-503', 'microchip,tc654'=
, 'microchip,tc655', 'micron,spi-authenta', 'miramems,da226', 'miramems,da2=
80', 'miramems,da311', 'mps,mp2856', 'mps,mp2857', 'mps,mp2888', 'mps,mp289=
1', 'mps,mp2971', 'mps,mp2973', 'mps,mp2975', 'mps,mp2993', 'mps,mp5920', '=
mps,mp5990', 'mps,mp9941', 'mps,mpq8785', 'national,lm63', 'national,lm80',=
 'national,lm81', 'national,lm85', 'national,lm92', 'nuvoton,w83773g', 'oki=
,ml86v7667', 'plx,pex8648', 'pulsedlight,lidar-lite-v2', 'renesas,hs3001', =
'renesas,isl29501', 'rohm,bh2228fv', 'rohm,dh2228fv', 'samsung,24ad0xd1', '=
samsung,exynos-sataphy-i2c', 'semtech,sx1301', 'sensirion,sgp30', 'sensirio=
n,sgp40', 'sensirion,sgpc3', 'sensirion,sht4x', 'sensortek,stk8312', 'senso=
rtek,stk8ba50', 'sgx,vz89x', 'silabs,em3581', 'silabs,si3210', 'silabs,si70=
05', 'silabs,si7020', 'skyworks,sky81452', 'sparkfun,qwiic-joystick', 'swir=
,mangoh-iotport-spi', 'taos,tsl2550', 'ti,amc6821', 'ti,hdc1000', 'ti,hdc10=
08', 'ti,hdc1010', 'ti,hdc1050', 'ti,hdc1080', 'ti,lm70', 'ti,lm71', 'ti,lm=
73', 'ti,lm74', 'ti,lm96000', 'ti,tmp103', 'ti,tmp121', 'ti,tmp122', 'ti,tm=
p125', 'ti,tps40400', 'ti,tps53676', 'ti,tps53679', 'ti,tps53688', 'ti,tps5=
44b20', 'ti,tps544b25', 'ti,tps544c20', 'ti,tps544c25', 'ti,tps546d24', 'ti=
,tsc2003', 'vicor,pli1209bc', 'winbond,w83793']
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: fan@18: compatible=
: ['tsd,mule', 'ti,amc6821'] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: fan@18: 'i2c-mux' =
does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /i2c@fec80000/fan@=
18: failed to match any schema with compatible: ['tsd,mule', 'ti,amc6821']
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /phy@feda0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /phy@fedb0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /hdmi@fde80000: fai=
led to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /phy@feda0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /phy@fedb0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /hdmi@fde80000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /phy@feda0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /phy@fedb0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /hdmi@fde80000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /phy@feda0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /phy@fedb0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts:1130.7-1138.4: Warning=
 (graph_child_address): /usb@fc000000/port: graph node has single child nod=
e 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: /hdmi@fde80000: faile=
d to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: /phy@feda0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: /phy@fedb0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /hdmi@fde80000: =
failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /phy@feda0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /phy@fedb0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: analog-sound: 's=
imple-audio-card,hp-det-gpios' does not match any of the regexes: '^simple-=
audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^=
simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-=
f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /hdmi@fde80000=
: failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: audio-codec@11=
: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yam=
l#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /phy@feda0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /phy@fedb0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /hdmi@fde80000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /phy@feda0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /phy@fedb0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /hdmi@fde80000: fai=
led to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /phy@feda0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /phy@fedb0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /hdmi@fde80000: fai=
led to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /phy@feda0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /phy@fedb0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /hdmi@fde80000: failed=
 to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /phy@feda0000: failed =
to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /phy@fedb0000: failed =
to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /hdmi@fde80000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /phy@feda0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /phy@fedb0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
--
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /hdmi@fde80000: fai=
led to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /phy@feda0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /phy@fedb0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: analog-sound: 'simp=
le-audio-card,hp-det-gpios' does not match any of the regexes: '^simple-aud=
io-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^sim=
ple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+=
)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: /hdmi@fde80000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: /phy@feda0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: /phy@fedb0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: analog-sound: 'sim=
ple-audio-card,hp-det-gpios' does not match any of the regexes: '^simple-au=
dio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^si=
mple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]=
+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
