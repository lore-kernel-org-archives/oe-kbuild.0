Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A330C37A
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786288352; cv=none; b=iJdO92bSo4UCnyLmz1F0s7qa0oY7ZOvlFi+nwRR++La/mVa4TT+SMOzY6AkjRMXD7LQq3ZHqBP/6n6DKiZYVTvw4cPe1fsxySIRbSNGDkwigcPSnf7AaUFMiHbJjK2WxLD/5FBpGl+vFz/zvy4XTlrmKeUOJOArw+fVmUT7rKnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786288352; c=relaxed/simple;
	bh=klC2LwIOJsTSUjiKJUN7KGGZHnl0aCxAlo1E/YtxpxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a2lY9Jvhu62tYKvNmfOyDiQJZTEvjeTg6Dm4LtQ+VrTtALKu+mZ4BlyxZoFxkJcr2PLL1b8aqe1g57d5Rrk8+5D56nb/obI1s+QATzyso1Ez0cfhmLiIJFxf4UjK5sQ3K7QigEtZXQeNV/cVjg2/R+W3HdzAJJwf4c+IPa6gRo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzXw3zrw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzXw3zrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786288348; x=1817824348;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=klC2LwIOJsTSUjiKJUN7KGGZHnl0aCxAlo1E/YtxpxI=;
  b=JzXw3zrwofCsSCwC/xRw2hWQp0r/IFvXZM1jYv6f33XKY1R9H7BzRhM5
   wLs9vLDCRXNRJYY9muvqF/3rfAmmB1dRxsXIIDwmhr+6PWnyU6CwHkMok
   gnOHQvgJber5+X0g658VGI8I1Vcc21v14jYGTU/SIlBj9gBTcaR4ADamr
   5z4RgflSon1rmjWVdW7etD0MPLj5ph08pYHe3mPuZ3HFJaHYqFUO30mYf
   7bcPy2XMWebk0FA3J1JVr3BeKTfQZgswPSVHPCkU65fHi7wZPZ4pLwqiH
   TLKW9f61SbHm1H6DiSrefGNu8ggO3MUXT4ULao2btemazaXls6xLRSSD2
   A==;
X-CSE-ConnectionGUID: AuhzduJ+TNKbdtWAdCArzA==
X-CSE-MsgGUID: LF4c7eApQwatie0a8RxPWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="97470610"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="97470610"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 08:12:27 -0700
X-CSE-ConnectionGUID: mo4CLsAOQP2+ulLca7QI4A==
X-CSE-MsgGUID: QGJrmpsxSSC67SBLbo3d/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="301051188"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Aug 2026 08:12:27 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt5CK-000000005Go-2Pvl;
	Sun, 09 Aug 2026 15:12:24 +0000
Date: Sun, 09 Aug 2026 17:11:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb:
 clock@60006000 (nvidia,tegra114-car): 'emc-timings-0',
 'nvidia,external-memory-controller' do not match any of the regexes:
 '^(sclk)|(pll-[cem])$', '^pinctrl-[0-9]+$'
Message-ID: <202608091714.mCPf7ufU-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: Mikko Perttunen <mperttunen@nvidia.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/ARM=
-tegra-tf701t-Configure-CPU-DFLL-clock-node/20260805-062316
head:   d5c8c1b807833670741593571c2d27fcb3ee913c
commit: dfcbc4a6d9c5ee2fe5d8ea0018b6e0e786f782fb ARM: tegra: tf701t: Add MC=
 and EMC timing nodes
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-2051-20260806 (https://download.01.org/0day-ci/archi=
ve/20260809/202608091714.mCPf7ufU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260809/202608091714.mCPf7ufU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608091714.mCPf7ufU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: opp-table-xusb-ss (op=
erating-points-v2): Unevaluated properties are not allowed ('opp-122400000-=
950' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: opp-table-xusb-fs (op=
erating-points-v2): $nodename:0: 'opp-table-xusb-fs' does not match '^opp-t=
able(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: opp-table-xusb-fs (op=
erating-points-v2): Unevaluated properties are not allowed ('opp-48000000-9=
50' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: opp-table-xusb-hs (op=
erating-points-v2): $nodename:0: 'opp-table-xusb-hs' does not match '^opp-t=
able(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: opp-table-xusb-hs (op=
erating-points-v2): Unevaluated properties are not allowed ('opp-61200000-9=
50' was unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: clock@60006000 (nvidi=
a,tegra114-car): 'emc-timings-0', 'nvidia,external-memory-controller' do no=
t match any of the regexes: '^(sclk)|(pll-[cem])$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/nvidia,tegra20-car=
.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: dma@6000a000 (nvidia,=
tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controll=
er(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdm=
a.yaml
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
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pv0-gpio: {'n=
vidia,pins': ['pv0'], 'nvidia,function': ['rsvd2'], 'nvidia,pull': 2, 'nvid=
ia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
