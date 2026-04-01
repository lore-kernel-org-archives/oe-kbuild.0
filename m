Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325330F7FB
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 03:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775015580; cv=none; b=qW0eEt+ZsRjrDmwohZmzjK2rlBvV9yvp0BI7XYh/Qo6UhGWxF4SMZjJTzqmQCY9BxQJlEL/yKHNfvXZ/EFUk8839WnP1dPKSb0IdW1V8WVRNnJVWlkON4x1pBntz9hb73SOAL95ZoJtkQCRdlvU75k2/4EOjxJGPvuvcqBLa+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775015580; c=relaxed/simple;
	bh=n8zQslXEDwGnUc+5VOEZ6qo566dZfhbh61JlMkszb2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZAOMeL6m2mh93uIFoQSWa1/9iBHKEK04pSHaK4p8qblkcHqzlWTBZsvah1HMmokiVW7XPKORTDVgUphA87KvUD+zK8eO5qFu1MwTBgQIsFAC9An/snFhXwGqdS0xFUr4BDGHOEdkH/5VnB2oB1dMnCGT8hH6kJjYBSd7J23uTrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g41bGjc+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g41bGjc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775015579; x=1806551579;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n8zQslXEDwGnUc+5VOEZ6qo566dZfhbh61JlMkszb2k=;
  b=g41bGjc+1jAi/xcjlqmi8FZa7awoHfaeoW92XffJWmgXXJCfQ+T+95i8
   ugPlfUe1E3o+DDk9gdG3XusaxZPOWUHlkHgO/cYOjIyCTHpWvBovRzMpA
   AUL/0M1Qop1af/hbqk3UBpaLP0VRRbD7sudOY9q5XcgCkaln/yjEhK9e4
   lhZDyC8z6jGanwWwBMdg0QD6kE4trUSZxRZvrxhoBXltoXMcQeH8qyAvJ
   I28NDifbKm8NfOfKrmnOt8zyVvuDK4IB5ZfYnRjJujfLPGN7mReqaAevI
   Z3Hta4A9UwUY7+dDsLaCVFl11J3DZysy9TW9YfP6sXir8SZmPZkdhZqGo
   w==;
X-CSE-ConnectionGUID: v/YKK1OWTOSh+uMFP7XKOA==
X-CSE-MsgGUID: u75Uu1gJSLC76OyAnKxBqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75758755"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75758755"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 20:52:59 -0700
X-CSE-ConnectionGUID: FhY3lR8ASGyOtHDB4SPVRQ==
X-CSE-MsgGUID: 9VVn06H6RcyioI1RPctR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="225726866"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 31 Mar 2026 20:52:57 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7mdS-000000008dV-36w0;
	Wed, 01 Apr 2026 03:52:54 +0000
Date: Wed, 01 Apr 2026 05:52:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb:
 dma@6000a000 (nvidia,tegra114-apbdma): $nodename:0: 'dma@6000a000' does not
 match '^dma-controller(@.*)?$'
Message-ID: <202604010524.462u9056-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: 7a430af7d135be5042f14987bce16f6b40a3f694 dt-bindings: dma: nvidia,t=
egra20-apbdma: Add undocumented compatibles and "clock-names"
date:   7 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2053-20260328 (https://download.01.org/0day-ci/archi=
ve/20260401/202604010524.462u9056-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260401/202604010524.462u9056-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 7a430af7d135 ("dt-bindings: dma: nvidia,tegra20-apbdma: Add undocu=
mented compatibles and "clock-names"")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604010524.462u9056-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:740.15-750.4: Warning (unique_uni=
t_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in =
node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:780.15-790.4: Warning (unique_uni=
t_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in =
node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: hdmi@54280000 (nvidia=
,tegra114-hdmi): 'port' does not match any of the regexes: '^pinctrl-[0-9]+=
$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,teg=
ra20-hdmi.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: hdmi@54280000 (nvidia=
,tegra114-hdmi): 'nvidia,ddc-i2c-bus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,teg=
ra20-hdmi.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: hdmi@54280000 (nvidia=
,tegra114-hdmi): 'nvidia,hpd-gpio' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,teg=
ra20-hdmi.yaml
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: dma@6000a000 (nvidia,=
tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controll=
er(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux@70000868 (nvid=
ia,tegra114-pinmux): pinmux:gmi-cs4-clk:nvidia,pins:1: 'gmi_clk_lb' is not =
one of ['ulpi_data0_po1', 'ulpi_data1_po2', 'ulpi_data2_po3', 'ulpi_data3_p=
o4', 'ulpi_data4_po5', 'ulpi_data5_po6', 'ulpi_data6_po7', 'ulpi_data7_po0'=
, 'ulpi_clk_py0', 'ulpi_dir_py1', 'ulpi_nxt_py2', 'ulpi_stp_py3', 'dap3_fs_=
pp0', 'dap3_din_pp1', 'dap3_dout_pp2', 'dap3_sclk_pp3', 'pv0', 'pv1', 'sdmm=
c1_clk_pz0', 'sdmmc1_cmd_pz1', 'sdmmc1_dat3_py4', 'sdmmc1_dat2_py5', 'sdmmc=
1_dat1_py6', 'sdmmc1_dat0_py7', 'clk2_out_pw5', 'clk2_req_pcc5', 'hdmi_int_=
pn7', 'ddc_scl_pv4', 'ddc_sda_pv5', 'uart2_rxd_pc3', 'uart2_txd_pc2', 'uart=
2_rts_n_pj6', 'uart2_cts_n_pj5', 'uart3_txd_pw6', 'uart3_rxd_pw7', 'uart3_c=
ts_n_pa1', 'uart3_rts_n_pc0', 'pu0', 'pu1', 'pu2', 'pu3', 'pu4', 'pu5', 'pu=
6', 'gen1_i2c_sda_pc5', 'gen1_i2c_scl_pc4', 'dap4_fs_pp4', 'dap4_din_pp5', =
'dap4_dout_pp6', 'dap4_sclk_pp7', 'clk3_out_pee0', 'clk3_req_pee1', 'gmi_wp=
_n_pc7', 'gmi_iordy_pi5', 'gmi_wait_pi7', 'gmi_adv_n_pk0', 'gmi_clk_pk1', '=
gmi_cs0_n_pj0', 'gmi_cs1_n_pj2', 'gmi_cs2_n_pk3', 'gmi_cs3_n_pk4', 'gmi_cs4=
_n_pk2', 'gmi_cs6_n_pi3', 'gmi_cs7_n_pi6', 'gmi_ad0_pg0', 'gmi_ad1_pg1', 'g=
mi_ad2_pg2', 'gmi_ad3_pg3', 'gmi_ad4_pg4', 'gmi_ad5_pg5', 'gmi_ad6_pg6', 'g=
mi_ad7_pg7', 'gmi_ad8_ph0', 'gmi_ad9_ph1', 'gmi_ad10_ph2', 'gmi_ad11_ph3', =
'gmi_ad12_ph4', 'gmi_ad13_ph5', 'gmi_ad14_ph6', 'gmi_ad15_ph7', 'gmi_a16_pj=
7', 'gmi_a17_pb0', 'gmi_a18_pb1', 'gmi_a19_pk7', 'gmi_wr_n_pi0', 'gmi_oe_n_=
pi1', 'gmi_dqs_p_pj3', 'gmi_rst_n_pi4', 'gen2_i2c_scl_pt5', 'gen2_i2c_sda_p=
t6', 'sdmmc4_clk_pcc4', 'sdmmc4_cmd_pt7', 'sdmmc4_dat0_paa0', 'sdmmc4_dat1_=
paa1', 'sdmmc4_dat2_paa2', 'sdmmc4_dat3_paa3', 'sdmmc4_dat4_paa4', 'sdmmc4_=
dat5_paa5', 'sdmmc4_dat6_paa6', 'sdmmc4_dat7_paa7', 'cam_mclk_pcc0', 'pcc1'=
, 'pbb0', 'cam_i2c_scl_pbb1', 'cam_i2c_sda_pbb2', 'pbb3', 'pbb4', 'pbb5', '=
pbb6', 'pbb7', 'pcc2', 'pwr_i2c_scl_pz6', 'pwr_i2c_sda_pz7', 'kb_row0_pr0',=
 'kb_row1_pr1', 'kb_row2_pr2', 'kb_row3_pr3', 'kb_row4_pr4', 'kb_row5_pr5',=
 'kb_row6_pr6', 'kb_row7_pr7', 'kb_row8_ps0', 'kb_row9_ps1', 'kb_row10_ps2'=
, 'kb_col0_pq0', 'kb_col1_pq1', 'kb_col2_pq2', 'kb_col3_pq3', 'kb_col4_pq4'=
, 'kb_col5_pq5', 'kb_col6_pq6', 'kb_col7_pq7', 'clk_32k_out_pa0', 'sys_clk_=
req_pz5', 'core_pwr_req', 'cpu_pwr_req', 'pwr_int_n', 'owr', 'dap1_fs_pn0',=
 'dap1_din_pn1', 'dap1_dout_pn2', 'dap1_sclk_pn3', 'clk1_req_pee2', 'clk1_o=
ut_pw4', 'spdif_in_pk6', 'spdif_out_pk5', 'dap2_fs_pa2', 'dap2_din_pa4', 'd=
ap2_dout_pa5', 'dap2_sclk_pa3', 'dvfs_pwm_px0', 'gpio_x1_aud_px1', 'gpio_x3=
_aud_px3', 'dvfs_clk_px2', 'gpio_x4_aud_px4', 'gpio_x5_aud_px5', 'gpio_x6_a=
ud_px6', 'gpio_x7_aud_px7', 'sdmmc3_clk_pa6', 'sdmmc3_cmd_pa7', 'sdmmc3_dat=
0_pb7', 'sdmmc3_dat1_pb6', 'sdmmc3_dat2_pb5', 'sdmmc3_dat3_pb4', 'hdmi_cec_=
pee3', 'sdmmc1_wp_n_pv3', 'sdmmc3_cd_n_pv2', 'gpio_w2_aud_pw2', 'gpio_w3_au=
d_pw3', 'usb_vbus_en0_pn4', 'usb_vbus_en1_pn5', 'sdmmc3_clk_lb_in_pee5', 's=
dmmc3_clk_lb_out_pee4', 'reset_out_n', 'drive_ao1', 'drive_ao2', 'drive_at1=
', 'drive_at2', 'drive_at3', 'drive_at4', 'drive_at5', 'drive_cdev1', 'driv=
e_cdev2', 'drive_dap1', 'drive_dap2', 'drive_dap3', 'drive_dap4', 'drive_db=
g', 'drive_sdio3', 'drive_spi', 'drive_uaa', 'drive_uab', 'drive_uart2', 'd=
rive_uart3', 'drive_sdio1', 'drive_ddc', 'drive_gma', 'drive_gme', 'drive_g=
mf', 'drive_gmg', 'drive_gmh', 'drive_owr', 'drive_uda']
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-=
pinmux.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux@70000868 (nvid=
ia,tegra114-pinmux): pinmux:clk-32k-in:nvidia,function:0: 'clk' is not one =
of ['blink', 'cec', 'cldvfs', 'clk12', 'cpu', 'dap', 'dap1', 'dap2', 'dev3'=
, 'displaya', 'displaya_alt', 'displayb', 'dtv', 'emc_dll', 'extperiph1', '=
extperiph2', 'extperiph3', 'gmi', 'gmi_alt', 'hda', 'hsi', 'i2c1', 'i2c2', =
'i2c3', 'i2c4', 'i2cpwr', 'i2s0', 'i2s1', 'i2s2', 'i2s3', 'i2s4', 'irda', '=
kbc', 'nand', 'nand_alt', 'owr', 'pmi', 'pwm0', 'pwm1', 'pwm2', 'pwm3', 'pw=
ron', 'reset_out_n', 'rsvd1', 'rsvd2', 'rsvd3', 'rsvd4', 'sdmmc1', 'sdmmc2'=
, 'sdmmc3', 'sdmmc4', 'soc', 'spdif', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5=
', 'spi6', 'sysclk', 'trace', 'uarta', 'uartb', 'uartc', 'uartd', 'ulpi', '=
usb', 'vgp1', 'vgp2', 'vgp3', 'vgp4', 'vgp5', 'vgp6', 'vi', 'vi_alt1', 'vi_=
alt3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-=
pinmux.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux@70000868 (nvid=
ia,tegra114-pinmux): pinmux:clk-32k-in:nvidia,pins:0: 'clk_32k_in' is not o=
ne of ['ulpi_data0_po1', 'ulpi_data1_po2', 'ulpi_data2_po3', 'ulpi_data3_po=
4', 'ulpi_data4_po5', 'ulpi_data5_po6', 'ulpi_data6_po7', 'ulpi_data7_po0',=
 'ulpi_clk_py0', 'ulpi_dir_py1', 'ulpi_nxt_py2', 'ulpi_stp_py3', 'dap3_fs_p=
p0', 'dap3_din_pp1', 'dap3_dout_pp2', 'dap3_sclk_pp3', 'pv0', 'pv1', 'sdmmc=
1_clk_pz0', 'sdmmc1_cmd_pz1', 'sdmmc1_dat3_py4', 'sdmmc1_dat2_py5', 'sdmmc1=
_dat1_py6', 'sdmmc1_dat0_py7', 'clk2_out_pw5', 'clk2_req_pcc5', 'hdmi_int_p=
n7', 'ddc_scl_pv4', 'ddc_sda_pv5', 'uart2_rxd_pc3', 'uart2_txd_pc2', 'uart2=
_rts_n_pj6', 'uart2_cts_n_pj5', 'uart3_txd_pw6', 'uart3_rxd_pw7', 'uart3_ct=
s_n_pa1', 'uart3_rts_n_pc0', 'pu0', 'pu1', 'pu2', 'pu3', 'pu4', 'pu5', 'pu6=
', 'gen1_i2c_sda_pc5', 'gen1_i2c_scl_pc4', 'dap4_fs_pp4', 'dap4_din_pp5', '=
dap4_dout_pp6', 'dap4_sclk_pp7', 'clk3_out_pee0', 'clk3_req_pee1', 'gmi_wp_=
n_pc7', 'gmi_iordy_pi5', 'gmi_wait_pi7', 'gmi_adv_n_pk0', 'gmi_clk_pk1', 'g=
mi_cs0_n_pj0', 'gmi_cs1_n_pj2', 'gmi_cs2_n_pk3', 'gmi_cs3_n_pk4', 'gmi_cs4_=
n_pk2', 'gmi_cs6_n_pi3', 'gmi_cs7_n_pi6', 'gmi_ad0_pg0', 'gmi_ad1_pg1', 'gm=
i_ad2_pg2', 'gmi_ad3_pg3', 'gmi_ad4_pg4', 'gmi_ad5_pg5', 'gmi_ad6_pg6', 'gm=
i_ad7_pg7', 'gmi_ad8_ph0', 'gmi_ad9_ph1', 'gmi_ad10_ph2', 'gmi_ad11_ph3', '=
gmi_ad12_ph4', 'gmi_ad13_ph5', 'gmi_ad14_ph6', 'gmi_ad15_ph7', 'gmi_a16_pj7=
', 'gmi_a17_pb0', 'gmi_a18_pb1', 'gmi_a19_pk7', 'gmi_wr_n_pi0', 'gmi_oe_n_p=
i1', 'gmi_dqs_p_pj3', 'gmi_rst_n_pi4', 'gen2_i2c_scl_pt5', 'gen2_i2c_sda_pt=
6', 'sdmmc4_clk_pcc4', 'sdmmc4_cmd_pt7', 'sdmmc4_dat0_paa0', 'sdmmc4_dat1_p=
aa1', 'sdmmc4_dat2_paa2', 'sdmmc4_dat3_paa3', 'sdmmc4_dat4_paa4', 'sdmmc4_d=
at5_paa5', 'sdmmc4_dat6_paa6', 'sdmmc4_dat7_paa7', 'cam_mclk_pcc0', 'pcc1',=
 'pbb0', 'cam_i2c_scl_pbb1', 'cam_i2c_sda_pbb2', 'pbb3', 'pbb4', 'pbb5', 'p=
bb6', 'pbb7', 'pcc2', 'pwr_i2c_scl_pz6', 'pwr_i2c_sda_pz7', 'kb_row0_pr0', =
'kb_row1_pr1', 'kb_row2_pr2', 'kb_row3_pr3', 'kb_row4_pr4', 'kb_row5_pr5', =
'kb_row6_pr6', 'kb_row7_pr7', 'kb_row8_ps0', 'kb_row9_ps1', 'kb_row10_ps2',=
 'kb_col0_pq0', 'kb_col1_pq1', 'kb_col2_pq2', 'kb_col3_pq3', 'kb_col4_pq4',=
 'kb_col5_pq5', 'kb_col6_pq6', 'kb_col7_pq7', 'clk_32k_out_pa0', 'sys_clk_r=
eq_pz5', 'core_pwr_req', 'cpu_pwr_req', 'pwr_int_n', 'owr', 'dap1_fs_pn0', =
'dap1_din_pn1', 'dap1_dout_pn2', 'dap1_sclk_pn3', 'clk1_req_pee2', 'clk1_ou=
t_pw4', 'spdif_in_pk6', 'spdif_out_pk5', 'dap2_fs_pa2', 'dap2_din_pa4', 'da=
p2_dout_pa5', 'dap2_sclk_pa3', 'dvfs_pwm_px0', 'gpio_x1_aud_px1', 'gpio_x3_=
aud_px3', 'dvfs_clk_px2', 'gpio_x4_aud_px4', 'gpio_x5_aud_px5', 'gpio_x6_au=
d_px6', 'gpio_x7_aud_px7', 'sdmmc3_clk_pa6', 'sdmmc3_cmd_pa7', 'sdmmc3_dat0=
_pb7', 'sdmmc3_dat1_pb6', 'sdmmc3_dat2_pb5', 'sdmmc3_dat3_pb4', 'hdmi_cec_p=
ee3', 'sdmmc1_wp_n_pv3', 'sdmmc3_cd_n_pv2', 'gpio_w2_aud_pw2', 'gpio_w3_aud=
_pw3', 'usb_vbus_en0_pn4', 'usb_vbus_en1_pn5', 'sdmmc3_clk_lb_in_pee5', 'sd=
mmc3_clk_lb_out_pee4', 'reset_out_n', 'drive_ao1', 'drive_ao2', 'drive_at1'=
, 'drive_at2', 'drive_at3', 'drive_at4', 'drive_at5', 'drive_cdev1', 'drive=
_cdev2', 'drive_dap1', 'drive_dap2', 'drive_dap3', 'drive_dap4', 'drive_dbg=
', 'drive_sdio3', 'drive_spi', 'drive_uaa', 'drive_uab', 'drive_uart2', 'dr=
ive_uart3', 'drive_sdio1', 'drive_ddc', 'drive_gma', 'drive_gme', 'drive_gm=
f', 'drive_gmg', 'drive_gmh', 'drive_owr', 'drive_uda']
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-=
pinmux.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pv0-gpio: {'n=
vidia,pins': ['pv0'], 'nvidia,function': ['rsvd2'], 'nvidia,pull': 2, 'nvid=
ia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pv1-gpio: {'n=
vidia,pins': ['pv1'], 'nvidia,function': ['rsvd1'], 'nvidia,pull': 2, 'nvid=
ia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
--
   arch/arm/boot/dts/nvidia/tegra114.dtsi:740.15-750.4: Warning (unique_uni=
t_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in =
node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:780.15-790.4: Warning (unique_uni=
t_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in =
node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: dma@6000a000 (nvidia,tegr=
a114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@=
.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: rt5640@1c (realtek,rt5640=
): Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps51632@43=
: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65090@48=
: failed to match any schema with compatible: ['ti,tps65090']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58=
: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58=
: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58=
/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58=
/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti=
,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58=
/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti=
,palmas-pmic']
--
   arch/arm/boot/dts/nvidia/tegra114.dtsi:740.15-750.4: Warning (unique_uni=
t_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in =
node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:780.15-790.4: Warning (unique_uni=
t_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in =
node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: dma@6000a000 (nvidia,tegra11=
4-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@.*)=
?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/regulator@43: =
failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: faile=
d to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: faile=
d to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: =
failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas=
-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: =
failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas=
-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/rtc: f=
ailed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /kbc@7000e200: failed to mat=
ch any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /memory-controller@70019000:=
 failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /ahub@70080000: failed to ma=
tch any schema with compatible: ['nvidia,tegra114-ahub']
--
   arch/arm/boot/dts/nvidia/tegra114.dtsi:740.15-750.4: Warning (unique_uni=
t_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in =
node /usb-phy@7d000000)
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: dma@6000a000 (nvidia,tegra114=
-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@.*)?=
$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed=
 to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed=
 to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: f=
ailed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-=
pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: f=
ailed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-=
pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/rtc: fa=
iled to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /kbc@7000e200: failed to matc=
h any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /memory-controller@70019000: =
failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /ahub@70080000: failed to mat=
ch any schema with compatible: ['nvidia,tegra114-ahub']
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used i=
n node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used i=
n node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used i=
n node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /pcie@1003000: failed=
 to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /gpu@57000000: failed=
 to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: dma@60020000 (nvidia,=
tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controll=
er(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /i2c@7000d000/pmic@40=
: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /clock@70110000: fail=
ed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: /ahub@70300000: faile=
d to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: cpu@0 (arm,cortex-a15=
): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: cpu@0 (arm,cortex-a15=
): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used i=
n node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used i=
n node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used i=
n node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /pcie@1003000: f=
ailed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /gpu@57000000: f=
ailed to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: dma@60020000 (nv=
idia,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-con=
troller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /i2c@7000d000/pm=
ic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /clock@70110000:=
 failed to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: /ahub@70300000: =
failed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: cpu@0 (arm,corte=
x-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: cpu@0 (arm,corte=
x-a15): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-s=
upply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used i=
n node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used i=
n node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used i=
n node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /pcie@1003000: failed =
to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /gpu@57000000: failed =
to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: dma@60020000 (nvidia,t=
egra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controlle=
r(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: audio-codec@1c (realte=
k,rt5639): Unevaluated properties are not allowed ('realtek,ldo1-en-gpios' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /i2c@7000d000/pmic@40:=
 failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /clock@70110000: faile=
d to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: /ahub@70300000: failed=
 to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: cpu@0 (arm,cortex-a15)=
: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: cpu@0 (arm,cortex-a15)=
: Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi:29.9-32.4: Warning (unit_add=
ress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: / (google,nyan-big-rev7)=
: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 21474=
83648, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /pcie@1003000: failed to=
 match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /gpu@57000000: failed to=
 match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: dma@60020000 (nvidia,teg=
ra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(=
@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /i2c@7000d000/pmic@40: f=
ailed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /clock@70110000: failed =
to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: /ahub@70300000: failed t=
o match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: cpu@0 (arm,cortex-a15): =
'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: cpu@0 (arm,cortex-a15): =
Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply' w=
ere unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi:29.9-32.4: Warning (unit_add=
ress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: / (google,nyan-big-r=
ev7): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2=
147483648, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /pcie@1003000: faile=
d to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /gpu@57000000: faile=
d to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: dma@60020000 (nvidia=
,tegra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-control=
ler(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /i2c@7000d000/pmic@4=
0: failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /clock@70110000: fai=
led to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: /ahub@70300000: fail=
ed to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: cpu@0 (arm,cortex-a1=
5): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: cpu@0 (arm,cortex-a1=
5): Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-suppl=
y' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi:29.9-32.4: Warning (unit_add=
ress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: / (google,nyan-blaze-r=
ev10): False schema does not allow {'device_type': ['memory'], 'reg': [[0, =
2147483648, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /pcie@1003000: failed =
to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /gpu@57000000: failed =
to match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: dma@60020000 (nvidia,t=
egra124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controlle=
r(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /i2c@7000d000/pmic@40:=
 failed to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /clock@70110000: faile=
d to match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: /ahub@70300000: failed=
 to match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: cpu@0 (arm,cortex-a15)=
: 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: cpu@0 (arm,cortex-a15)=
: Unevaluated properties are not allowed ('clock-latency', 'vdd-cpu-supply'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1108.15-1118.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used i=
n node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1148.15-1158.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used i=
n node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra124.dtsi:1187.15-1197.4: Warning (unique_u=
nit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used i=
n node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /pcie@1003000: failed to =
match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /gpu@57000000: failed to =
match any schema with compatible: ['nvidia,gk20a']
>> arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: dma@60020000 (nvidia,tegr=
a124-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@=
.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /i2c@7000d000/pmic@40: fa=
iled to match any schema with compatible: ['ams,as3722']
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /clock@70110000: failed t=
o match any schema with compatible: ['nvidia,tegra124-dfll']
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: /ahub@70300000: failed to=
 match any schema with compatible: ['nvidia,tegra124-ahub']
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: cpu@0 (arm,cortex-a15): '=
operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: cpu@0 (arm,cortex-a15): U=
nevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
