Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B94F2F2E
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Oct 2024 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728216317; cv=none; b=QOSGRzds9ajfPgbGW+vooosU6t1d9hJtSHnF8XvcA0ryDilvZkXzzzj3QXQXhu71fo7111c1H1ebmqYHZ0kNg9CvxF6HFbZ8nbPop0kl4MR0YOtJEmnOupGtvEvoohGR/ywCx3a9vc4YA1QJvwjdfHYPF+Oj3MFLHOZxOiGGddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728216317; c=relaxed/simple;
	bh=eQ4z8cwxeJk38Fd9IDcjpYgfkMs4OY5fwvJStjGJMyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dt1iv63rzp5O0kJQRaU/Mx61IrNrVomVkWbS2MtbU4kT+to02O5Y1Zfdk5iqAYyq6r+eGcPL7quwUFSbQ3yWLdGZbpbSd/8HXXlVjl+zbn0bZEyBYnhbXkisWvOEoSiKD9rQaRfWe64MW49B9BgWmznTWb7Cis4bODaK2dRK0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCXuCJEO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCXuCJEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728216315; x=1759752315;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eQ4z8cwxeJk38Fd9IDcjpYgfkMs4OY5fwvJStjGJMyE=;
  b=KCXuCJEO2j7aBOiFn+ZSFMBahZ/K3I+LfGLMDjVm8gWBEh6Nou+7/wY5
   8rCCbDHFY99v6Qd6Nej4uJS5x/8BqzMtbC3EPLkq7ysDT7t+7ywl8cnZj
   F+gmUKYiyCugi00Jv7jACdLeiu6Ww9IMl3L/Q8uFoHXaLYTpHUZJTzM6O
   gcv9I7rPXvcIA0AoKF8YSFWe3NPLooKYg1H98OyHB3GRDHtNraCW+jI/E
   FtuI9rb+geZWGf7XUVPnjMdfV/sD47AJrj5mb68K9mseKYtqZBtj8+OaZ
   GM1QD50girYE2myXDYH295X4iI2tXkgwqsgu0Vs1rq3OgAN69Eaarsxlk
   w==;
X-CSE-ConnectionGUID: V3pLB3QWSGyW56c1uHLJdA==
X-CSE-MsgGUID: zh5rQhDZQNiBP6gN8hgbzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="49909186"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="49909186"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 05:05:15 -0700
X-CSE-ConnectionGUID: t+16jy/DSeWW0tHR4p0A5A==
X-CSE-MsgGUID: qGT20JCJS6ajjWngYd4S5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="75187970"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Oct 2024 05:05:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxQ0d-0003pI-0w;
	Sun, 06 Oct 2024 12:05:11 +0000
Date: Sun, 6 Oct 2024 20:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1158/2483]
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: pinctrl@9880: Unevaluated
 properties are not valid under the given schema ('reg', 'reg' were
 unevaluated and invalid)
Message-ID: <202410061918.5v7hXIQ3-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: pinctrl@9880: Unevaluat=
ed properties are not valid under the given schema ('reg', 'reg' were uneva=
luated and invalid)"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
commit: c3806b25c0f3b95a7f6e6edc23f93ff293173bfa [1158/2483] ARM: dts: amlo=
gic: meson8: use correct pinctrl bank node name
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20241003 (https://download.01.org/0day-ci/archiv=
e/20241006/202410061918.5v7hXIQ3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef=
3566a25ff0e34fb87339ba5e13eca17cec00f)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241006/202410061918.5v7hXIQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410061918.5v7hXIQ3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/amlogic/meson.dtsi:161.41-168.6: Warning (unique_unit_=
address_if_enabled): /soc/bus@c1100000/interrupt-controller@9880: duplicate=
 unit-address (also used in node /soc/bus@c1100000/pinctrl@9880)
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: /soc/bus@c1100000/sys=
tem-controller@4000: failed to match any schema with compatible: ['amlogic,=
meson-hhi-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: /soc/bus@c1100000/sys=
tem-controller@4000/clock-controller: failed to match any schema with compa=
tible: ['amlogic,meson8-clkc']
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: adc@8680: amlogic,hhi=
-sysctrl: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/iio/adc/amlogic,meson-sa=
radc.yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: /soc/bus@c1100000/mmc=
@8c20: failed to match any schema with compatible: ['amlogic,meson8-sdio', =
'amlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: /soc/bus@c1100000/mmc=
@8c20: failed to match any schema with compatible: ['amlogic,meson8-sdio', =
'amlogic,meson-mx-sdio']
>> arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: pinctrl@9880: Unevalu=
ated properties are not valid under the given schema ('reg', 'reg' were une=
valuated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: pinctrl@84: Unevaluat=
ed properties are not valid under the given schema ('reg', 'reg' were uneva=
luated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: ethernet@c9410000: 'p=
hy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: ethernet@c9410000: 'p=
hy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.=
yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: ethernet@c9410000: 'p=
hy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.=
yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: ethernet@c9410000: Un=
evaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-n=
ames', 'interrupts', 'pnictrl-names', 'power-domains' were unexpected)
--
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/system-co=
ntroller@4000: failed to match any schema with compatible: ['amlogic,meson-=
hhi-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/system-co=
ntroller@4000/clock-controller: failed to match any schema with compatible:=
 ['amlogic,meson8b-clkc']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/i2c@8500/=
codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/mmc@8c20:=
 failed to match any schema with compatible: ['amlogic,meson8b-sdio', 'amlo=
gic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/mmc@8c20:=
 failed to match any schema with compatible: ['amlogic,meson8b-sdio', 'amlo=
gic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/mmc@8c20/=
slot@1: failed to match any schema with compatible: ['mmc-slot']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@9880: bank@80b0: Un=
evaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@9880: bank@80b0:gpi=
o-line-names: ['WIFI_SD_D0', 'WIFI_SD_D1', 'WIFI_SD_D2', 'WIFI_SD_D3', 'BTP=
CM_DOUT', 'BTPCM_DIN', 'BTPCM_SYNC', 'BTPCM_CLK', 'WIFI_SD_CLK', 'WIFI_SD_C=
MD', 'WIFI_32K', 'WIFI_PWREN', 'UART_B_TX', 'UART_B_RX', 'UART_B_CTS_N', 'U=
ART_B_RTS_N', 'BT_EN', 'WIFI_WAKE_HOST', '', '', '', '', '', '', '', '', ''=
, '', '', '', 'VCCK_PWM_C', 'I2C_SDA_A', 'I2C_SCL_A', 'I2C_SDA_B', 'I2C_SCL=
_B', 'VDDEE_PWM_D', 'VDDEE_PWM 3V3_5V_EN', 'HDMI_HPD', 'HDMI_I2C_SDA', 'HDM=
I_I2C_SCL', 'RMII_IRQ', 'RMII_RST#', 'RMII_TXD1', 'RMII_TXD0', 'AV_select_1=
', 'AV_select_2', 'MCU_Control_S', 'SD_D1_B', 'SD_D0_B', 'SD_CLK_8726MX', '=
SD_CMD_8726MX', 'SD_D3_B', 'SD_D2_B', 'CARD_EN_DET (CARD_DET)', 'NAND_D0 (E=
MMC)', 'NAND_D1 (EMMC)', 'NAND_D2 (EMMC)', 'NAND_D3 (EMMC)', 'NAND_D4 (EMMC=
)', 'NAND_D5 (EMMC)', 'NAND_D6 (EMMC)', 'NAND_D7 (EMMC)', 'NAND_CS1 (EMMC)'=
, 'NAND_CS2 iNAND_RS1 (EMMC)', 'NAND_nR/B iNAND_CMD (EMMC)', 'NAND_ALE (EMM=
C)', 'NAND_CLE (EMMC)', 'nRE_S1 NAND_nRE (EMMC)', 'nWE_S1 NAND_nWE (EMMC)',=
 '', '', 'SPI_CS', 'RMII_RXD1', 'RMII_RXD0', 'RMII_CRS_DV', 'RMII_50M_IN', =
'GPIODIF_4', 'GPIODIF_5', 'RMII_TXEN', 'CPUETH_25MOUT', 'RMII_MDC', 'RMII_M=
DIO'] is too short
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@9880: Unevaluated p=
roperties are not valid under the given schema ('reg', 'reg' were unevaluat=
ed and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@84: Unevaluated pro=
perties are not valid under the given schema ('reg', 'reg' were unevaluated=
 and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: sound: 'anyOf' conditional =
failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/amlogic/meson.dtsi:161.41-168.6: Warning (unique_unit_=
address_if_enabled): /soc/bus@c1100000/interrupt-controller@9880: duplicate=
 unit-address (also used in node /soc/bus@c1100000/pinctrl@9880)
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/system-cont=
roller@4000: failed to match any schema with compatible: ['amlogic,meson-hh=
i-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/system-cont=
roller@4000/clock-controller: failed to match any schema with compatible: [=
'amlogic,meson8b-clkc']
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/mmc@8c20: f=
ailed to match any schema with compatible: ['amlogic,meson8b-sdio', 'amlogi=
c,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/mmc@8c20: f=
ailed to match any schema with compatible: ['amlogic,meson8b-sdio', 'amlogi=
c,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/mmc@8c20/sl=
ot@1: failed to match any schema with compatible: ['mmc-slot']
>> arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: pinctrl@9880: Unevaluated pro=
perties are not valid under the given schema ('reg', 'reg' were unevaluated=
 and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: pinctrl@84: Unevaluated prope=
rties are not valid under the given schema ('reg', 'reg' were unevaluated a=
nd invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#
--
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/system=
-controller@4000: failed to match any schema with compatible: ['amlogic,mes=
on-hhi-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/system=
-controller@4000/clock-controller: failed to match any schema with compatib=
le: ['amlogic,meson8b-clkc']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/mmc@8c=
20: failed to match any schema with compatible: ['amlogic,meson8b-sdio', 'a=
mlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/mmc@8c=
20: failed to match any schema with compatible: ['amlogic,meson8b-sdio', 'a=
mlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/mmc@8c=
20/slot@1: failed to match any schema with compatible: ['mmc-slot']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@9880: bank@80b0:=
 Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@9880: bank@80b0:=
gpio-line-names: ['J2 Header Pin 35', 'J2 Header Pin 36', 'J2 Header Pin 32=
', 'J2 Header Pin 31', 'J2 Header Pin 29', 'J2 Header Pin 18', 'J2 Header P=
in 22', 'J2 Header Pin 16', 'J2 Header Pin 23', 'J2 Header Pin 21', 'J2 Hea=
der Pin 19', 'J2 Header Pin 33', 'J2 Header Pin 8', 'J2 Header Pin 10', 'J2=
 Header Pin 15', 'J2 Header Pin 13', 'J2 Header Pin 24', 'J2 Header Pin 26'=
, 'Revision (upper)', 'Revision (lower)', 'J2 Header Pin 7', '', 'J2 Header=
 Pin 12', 'J2 Header Pin 11', '', '', '', 'TFLASH_VDD_EN', '', '', 'VCCK_PW=
M (PWM_C)', 'I2CA_SDA', 'I2CA_SCL', 'I2CB_SDA', 'I2CB_SCL', 'VDDEE_PWM (PWM=
_D)', '', 'HDMI_HPD', 'HDMI_I2C_SDA', 'HDMI_I2C_SCL', 'ETH_PHY_INTR', 'ETH_=
PHY_NRST', 'ETH_TXD1', 'ETH_TXD0', 'ETH_TXD3', 'ETH_TXD2', 'ETH_RGMII_TX_CL=
K', 'SD_DATA1 (SDB_D1)', 'SD_DATA0 (SDB_D0)', 'SD_CLK', 'SD_CMD', 'SD_DATA3=
 (SDB_D3)', 'SD_DATA2 (SDB_D2)', 'SD_CDN (SD_DET_N)', 'SDC_D0 (EMMC)', 'SDC=
_D1 (EMMC)', 'SDC_D2 (EMMC)', 'SDC_D3 (EMMC)', 'SDC_D4 (EMMC)', 'SDC_D5 (EM=
MC)', 'SDC_D6 (EMMC)', 'SDC_D7 (EMMC)', 'SDC_CLK (EMMC)', 'SDC_RSTn (EMMC)'=
, 'SDC_CMD (EMMC)', 'BOOT_SEL', '', '', '', '', '', '', '', 'ETH_RXD1', 'ET=
H_RXD0', 'ETH_RX_DV', 'RGMII_RX_CLK', 'ETH_RXD3', 'ETH_RXD2', 'ETH_TXEN', '=
ETH_PHY_REF_CLK_25MOUT', 'ETH_MDC', 'ETH_MDIO'] is too short
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
>> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@9880: Unevaluate=
d properties are not valid under the given schema ('reg', 'reg' were uneval=
uated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@84: Unevaluated =
properties are not valid under the given schema ('reg', 'reg' were unevalua=
ted and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#
--
   arch/arm/boot/dts/amlogic/meson.dtsi:161.41-168.6: Warning (unique_unit_=
address_if_enabled): /soc/bus@c1100000/interrupt-controller@9880: duplicate=
 unit-address (also used in node /soc/bus@c1100000/pinctrl@9880)
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/sys=
tem-controller@4000: failed to match any schema with compatible: ['amlogic,=
meson-hhi-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/sys=
tem-controller@4000/clock-controller: failed to match any schema with compa=
tible: ['amlogic,meson8m2-clkc', 'amlogic,meson8-clkc']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/sys=
tem-controller@4000/clock-controller: failed to match any schema with compa=
tible: ['amlogic,meson8m2-clkc', 'amlogic,meson8-clkc']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/mmc=
@8c20: failed to match any schema with compatible: ['amlogic,meson8-sdio', =
'amlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/mmc=
@8c20: failed to match any schema with compatible: ['amlogic,meson8-sdio', =
'amlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/mmc=
@8c20/slot@1: failed to match any schema with compatible: ['mmc-slot']
>> arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: pinctrl@9880: Unevalu=
ated properties are not valid under the given schema ('reg', 'reg' were une=
valuated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: pinctrl@84: Unevaluat=
ed properties are not valid under the given schema ('reg', 'reg' were uneva=
luated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
