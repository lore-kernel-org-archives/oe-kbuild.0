Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35C918E034
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126133; cv=none; b=f0IwHgJlMLtdSPVtiiZVuzVMWhH6qUOnd+AuzUgpxWjWSnpRnJG6jDYkGz3Mj2SI2TxC0wrNG9x4TmzdMRGVneF7oRPYaLPGO5zBNaqh2YdRapPgCRSXddaNXRheZZyIUP9J6xsF48aHE7opxVMGcBseqlgqw5hoi/4ZfyUyqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126133; c=relaxed/simple;
	bh=jz1AX4C3QfmIBDMFz8MeoOFW2dq/HvOEuEUBwKXwV9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nqlku+rKJ4dLYjOJzA8V4dcIIz66Zkn9a2DaUOjqoYnzhsmcGL2XoCt8cbY71CETr19Euvg9qkdPDP68+6JeAZIHkjr7o8RwKpAQYTK1KJLwIZyMQ0OW5TFznEGZ4FGADglwjwaBxthervfMZ+KAieKaxII8FSonZnrxj59Y7QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLsYGLJ+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLsYGLJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723126130; x=1754662130;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jz1AX4C3QfmIBDMFz8MeoOFW2dq/HvOEuEUBwKXwV9s=;
  b=iLsYGLJ+Xr4uiSQY4W7sQ7TrN0w6wHo9T+BIr9wow9lxQhQUChioLUWa
   B0ngkRClBcvrVj0fpckDFnh8W6Jz3jSHeJTH/8sIsAlotdqQ/yBuwvsn+
   seu4cEcRQDHijnUw4c+L9Qcw2476CR4U2zTg/fs7v7Msf9FGpxcWhGGGL
   AZy5uwWRTVfSi8ztjNNH191QYktvesdzNZjdTiDRk2OX/iw/1mcRG+Sjy
   cG0Uo0Ea+VTv9WWkWwHfRPkclSmO42TReANBGFWCubTUtHHuit26quWVF
   PzMCLzLjttYa2BCC6HE0C2QpE6Tv6P6cfVeTYxWCkCeOw+PFuYU4PWDbR
   Q==;
X-CSE-ConnectionGUID: MeyHfbXIQCu2vpGvcL8laQ==
X-CSE-MsgGUID: sI6I7aAzR+WTV/DeQwALVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32400614"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="32400614"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 07:08:49 -0700
X-CSE-ConnectionGUID: 1OYVyC+RS4aB6sq0AvWUvA==
X-CSE-MsgGUID: Zjko26r/QPWZDW1zrQMjUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="57110937"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2024 07:08:49 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc3os-0006EM-1d;
	Thu, 08 Aug 2024 14:08:46 +0000
Date: Thu, 8 Aug 2024 22:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 01/11] ARM: nvidia: tf701t: use unimomentary pinmux
 setup
Message-ID: <202408082151.9bmBi3DO-lkp@intel.com>
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
In-Reply-To: <20240806123906.161218-2-clamor95@gmail.com>
References: <20240806123906.161218-2-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/fo=
r-next linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/ARM=
-nvidia-tf701t-use-unimomentary-pinmux-setup/20240806-204404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20240806123906.161218-2-clamor95%4=
0gmail.com
patch subject: [PATCH v1 01/11] ARM: nvidia: tf701t: use unimomentary pinmu=
x setup
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20240807 (https://download.01.org/0day-ci/archiv=
e/20240808/202408082151.9bmBi3DO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423=
aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240808/202408082151.9bmBi3DO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408082151.9bmBi3DO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts:45.22-51.5: Warning (u=
nit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit n=
ame, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra114.dtsi:725.15-735.4: Warning (unique_uni=
t_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in =
node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra114.dtsi:765.15-775.4: Warning (unique_uni=
t_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in =
node /usb-phy@7d008000)
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /interrupt-controller=
@60004000: failed to match any schema with compatible: ['nvidia,tegra114-ic=
tlr', 'nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /interrupt-controller=
@60004000: failed to match any schema with compatible: ['nvidia,tegra114-ic=
tlr', 'nvidia,tegra30-ictlr']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /dma@6000a000: failed=
 to match any schema with compatible: ['nvidia,tegra114-apbdma']
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux@70000868: pinm=
ux:clk-32k-in:nvidia,pins:0: 'clk_32k_in' is not one of ['ulpi_data0_po1', =
'ulpi_data1_po2', 'ulpi_data2_po3', 'ulpi_data3_po4', 'ulpi_data4_po5', 'ul=
pi_data5_po6', 'ulpi_data6_po7', 'ulpi_data7_po0', 'ulpi_clk_py0', 'ulpi_di=
r_py1', 'ulpi_nxt_py2', 'ulpi_stp_py3', 'dap3_fs_pp0', 'dap3_din_pp1', 'dap=
3_dout_pp2', 'dap3_sclk_pp3', 'pv0', 'pv1', 'sdmmc1_clk_pz0', 'sdmmc1_cmd_p=
z1', 'sdmmc1_dat3_py4', 'sdmmc1_dat2_py5', 'sdmmc1_dat1_py6', 'sdmmc1_dat0_=
py7', 'clk2_out_pw5', 'clk2_req_pcc5', 'hdmi_int_pn7', 'ddc_scl_pv4', 'ddc_=
sda_pv5', 'uart2_rxd_pc3', 'uart2_txd_pc2', 'uart2_rts_n_pj6', 'uart2_cts_n=
_pj5', 'uart3_txd_pw6', 'uart3_rxd_pw7', 'uart3_cts_n_pa1', 'uart3_rts_n_pc=
0', 'pu0', 'pu1', 'pu2', 'pu3', 'pu4', 'pu5', 'pu6', 'gen1_i2c_sda_pc5', 'g=
en1_i2c_scl_pc4', 'dap4_fs_pp4', 'dap4_din_pp5', 'dap4_dout_pp6', 'dap4_scl=
k_pp7', 'clk3_out_pee0', 'clk3_req_pee1', 'gmi_wp_n_pc7', 'gmi_iordy_pi5', =
'gmi_wait_pi7', 'gmi_adv_n_pk0', 'gmi_clk_pk1', 'gmi_cs0_n_pj0', 'gmi_cs1_n=
_pj2', 'gmi_cs2_n_pk3', 'gmi_cs3_n_pk4', 'gmi_cs4_n_pk2', 'gmi_cs6_n_pi3', =
'gmi_cs7_n_pi6', 'gmi_ad0_pg0', 'gmi_ad1_pg1', 'gmi_ad2_pg2', 'gmi_ad3_pg3'=
, 'gmi_ad4_pg4', 'gmi_ad5_pg5', 'gmi_ad6_pg6', 'gmi_ad7_pg7', 'gmi_ad8_ph0'=
, 'gmi_ad9_ph1', 'gmi_ad10_ph2', 'gmi_ad11_ph3', 'gmi_ad12_ph4', 'gmi_ad13_=
ph5', 'gmi_ad14_ph6', 'gmi_ad15_ph7', 'gmi_a16_pj7', 'gmi_a17_pb0', 'gmi_a1=
8_pb1', 'gmi_a19_pk7', 'gmi_wr_n_pi0', 'gmi_oe_n_pi1', 'gmi_dqs_p_pj3', 'gm=
i_rst_n_pi4', 'gen2_i2c_scl_pt5', 'gen2_i2c_sda_pt6', 'sdmmc4_clk_pcc4', 's=
dmmc4_cmd_pt7', 'sdmmc4_dat0_paa0', 'sdmmc4_dat1_paa1', 'sdmmc4_dat2_paa2',=
 'sdmmc4_dat3_paa3', 'sdmmc4_dat4_paa4', 'sdmmc4_dat5_paa5', 'sdmmc4_dat6_p=
aa6', 'sdmmc4_dat7_paa7', 'cam_mclk_pcc0', 'pcc1', 'pbb0', 'cam_i2c_scl_pbb=
1', 'cam_i2c_sda_pbb2', 'pbb3', 'pbb4', 'pbb5', 'pbb6', 'pbb7', 'pcc2', 'pw=
r_i2c_scl_pz6', 'pwr_i2c_sda_pz7', 'kb_row0_pr0', 'kb_row1_pr1', 'kb_row2_p=
r2', 'kb_row3_pr3', 'kb_row4_pr4', 'kb_row5_pr5', 'kb_row6_pr6', 'kb_row7_p=
r7', 'kb_row8_ps0', 'kb_row9_ps1', 'kb_row10_ps2', 'kb_col0_pq0', 'kb_col1_=
pq1', 'kb_col2_pq2', 'kb_col3_pq3', 'kb_col4_pq4', 'kb_col5_pq5', 'kb_col6_=
pq6', 'kb_col7_pq7', 'clk_32k_out_pa0', 'sys_clk_req_pz5', 'core_pwr_req', =
'cpu_pwr_req', 'pwr_int_n', 'owr', 'dap1_fs_pn0', 'dap1_din_pn1', 'dap1_dou=
t_pn2', 'dap1_sclk_pn3', 'clk1_req_pee2', 'clk1_out_pw4', 'spdif_in_pk6', '=
spdif_out_pk5', 'dap2_fs_pa2', 'dap2_din_pa4', 'dap2_dout_pa5', 'dap2_sclk_=
pa3', 'dvfs_pwm_px0', 'gpio_x1_aud_px1', 'gpio_x3_aud_px3', 'dvfs_clk_px2',=
 'gpio_x4_aud_px4', 'gpio_x5_aud_px5', 'gpio_x6_aud_px6', 'gpio_x7_aud_px7'=
, 'sdmmc3_clk_pa6', 'sdmmc3_cmd_pa7', 'sdmmc3_dat0_pb7', 'sdmmc3_dat1_pb6',=
 'sdmmc3_dat2_pb5', 'sdmmc3_dat3_pb4', 'hdmi_cec_pee3', 'sdmmc1_wp_n_pv3', =
'sdmmc3_cd_n_pv2', 'gpio_w2_aud_pw2', 'gpio_w3_aud_pw3', 'usb_vbus_en0_pn4'=
, 'usb_vbus_en1_pn5', 'sdmmc3_clk_lb_in_pee5', 'sdmmc3_clk_lb_out_pee4', 'r=
eset_out_n', 'drive_ao1', 'drive_ao2', 'drive_at1', 'drive_at2', 'drive_at3=
', 'drive_at4', 'drive_at5', 'drive_cdev1', 'drive_cdev2', 'drive_dap1', 'd=
rive_dap2', 'drive_dap3', 'drive_dap4', 'drive_dbg', 'drive_sdio3', 'drive_=
spi', 'drive_uaa', 'drive_uab', 'drive_uart2', 'drive_uart3', 'drive_sdio1'=
, 'drive_ddc', 'drive_gma', 'drive_gme', 'drive_gmf', 'drive_gmg', 'drive_g=
mh', 'drive_owr', 'drive_uda']
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-=
pinmux.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux@70000868: pinm=
ux:clk-32k-in:nvidia,function:0: 'clk' is not one of ['blink', 'cec', 'cldv=
fs', 'clk12', 'cpu', 'dap', 'dap1', 'dap2', 'dev3', 'displaya', 'displaya_a=
lt', 'displayb', 'dtv', 'emc_dll', 'extperiph1', 'extperiph2', 'extperiph3'=
, 'gmi', 'gmi_alt', 'hda', 'hsi', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2cpwr',=
 'i2s0', 'i2s1', 'i2s2', 'i2s3', 'i2s4', 'irda', 'kbc', 'nand', 'nand_alt',=
 'owr', 'pmi', 'pwm0', 'pwm1', 'pwm2', 'pwm3', 'pwron', 'reset_out_n', 'rsv=
d1', 'rsvd2', 'rsvd3', 'rsvd4', 'sdmmc1', 'sdmmc2', 'sdmmc3', 'sdmmc4', 'so=
c', 'spdif', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'spi6', 'sysclk', 'tra=
ce', 'uarta', 'uartb', 'uartc', 'uartd', 'ulpi', 'usb', 'vgp1', 'vgp2', 'vg=
p3', 'vgp4', 'vgp5', 'vgp6', 'vi', 'vi_alt1', 'vi_alt3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-=
pinmux.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux@70000868: pinm=
ux:gmi-cs4-clk:nvidia,pins:1: 'gmi_clk_lb' is not one of ['ulpi_data0_po1',=
 'ulpi_data1_po2', 'ulpi_data2_po3', 'ulpi_data3_po4', 'ulpi_data4_po5', 'u=
lpi_data5_po6', 'ulpi_data6_po7', 'ulpi_data7_po0', 'ulpi_clk_py0', 'ulpi_d=
ir_py1', 'ulpi_nxt_py2', 'ulpi_stp_py3', 'dap3_fs_pp0', 'dap3_din_pp1', 'da=
p3_dout_pp2', 'dap3_sclk_pp3', 'pv0', 'pv1', 'sdmmc1_clk_pz0', 'sdmmc1_cmd_=
pz1', 'sdmmc1_dat3_py4', 'sdmmc1_dat2_py5', 'sdmmc1_dat1_py6', 'sdmmc1_dat0=
_py7', 'clk2_out_pw5', 'clk2_req_pcc5', 'hdmi_int_pn7', 'ddc_scl_pv4', 'ddc=
_sda_pv5', 'uart2_rxd_pc3', 'uart2_txd_pc2', 'uart2_rts_n_pj6', 'uart2_cts_=
n_pj5', 'uart3_txd_pw6', 'uart3_rxd_pw7', 'uart3_cts_n_pa1', 'uart3_rts_n_p=
c0', 'pu0', 'pu1', 'pu2', 'pu3', 'pu4', 'pu5', 'pu6', 'gen1_i2c_sda_pc5', '=
gen1_i2c_scl_pc4', 'dap4_fs_pp4', 'dap4_din_pp5', 'dap4_dout_pp6', 'dap4_sc=
lk_pp7', 'clk3_out_pee0', 'clk3_req_pee1', 'gmi_wp_n_pc7', 'gmi_iordy_pi5',=
 'gmi_wait_pi7', 'gmi_adv_n_pk0', 'gmi_clk_pk1', 'gmi_cs0_n_pj0', 'gmi_cs1_=
n_pj2', 'gmi_cs2_n_pk3', 'gmi_cs3_n_pk4', 'gmi_cs4_n_pk2', 'gmi_cs6_n_pi3',=
 'gmi_cs7_n_pi6', 'gmi_ad0_pg0', 'gmi_ad1_pg1', 'gmi_ad2_pg2', 'gmi_ad3_pg3=
', 'gmi_ad4_pg4', 'gmi_ad5_pg5', 'gmi_ad6_pg6', 'gmi_ad7_pg7', 'gmi_ad8_ph0=
', 'gmi_ad9_ph1', 'gmi_ad10_ph2', 'gmi_ad11_ph3', 'gmi_ad12_ph4', 'gmi_ad13=
_ph5', 'gmi_ad14_ph6', 'gmi_ad15_ph7', 'gmi_a16_pj7', 'gmi_a17_pb0', 'gmi_a=
18_pb1', 'gmi_a19_pk7', 'gmi_wr_n_pi0', 'gmi_oe_n_pi1', 'gmi_dqs_p_pj3', 'g=
mi_rst_n_pi4', 'gen2_i2c_scl_pt5', 'gen2_i2c_sda_pt6', 'sdmmc4_clk_pcc4', '=
sdmmc4_cmd_pt7', 'sdmmc4_dat0_paa0', 'sdmmc4_dat1_paa1', 'sdmmc4_dat2_paa2'=
, 'sdmmc4_dat3_paa3', 'sdmmc4_dat4_paa4', 'sdmmc4_dat5_paa5', 'sdmmc4_dat6_=
paa6', 'sdmmc4_dat7_paa7', 'cam_mclk_pcc0', 'pcc1', 'pbb0', 'cam_i2c_scl_pb=
b1', 'cam_i2c_sda_pbb2', 'pbb3', 'pbb4', 'pbb5', 'pbb6', 'pbb7', 'pcc2', 'p=
wr_i2c_scl_pz6', 'pwr_i2c_sda_pz7', 'kb_row0_pr0', 'kb_row1_pr1', 'kb_row2_=
pr2', 'kb_row3_pr3', 'kb_row4_pr4', 'kb_row5_pr5', 'kb_row6_pr6', 'kb_row7_=
pr7', 'kb_row8_ps0', 'kb_row9_ps1', 'kb_row10_ps2', 'kb_col0_pq0', 'kb_col1=
_pq1', 'kb_col2_pq2', 'kb_col3_pq3', 'kb_col4_pq4', 'kb_col5_pq5', 'kb_col6=
_pq6', 'kb_col7_pq7', 'clk_32k_out_pa0', 'sys_clk_req_pz5', 'core_pwr_req',=
 'cpu_pwr_req', 'pwr_int_n', 'owr', 'dap1_fs_pn0', 'dap1_din_pn1', 'dap1_do=
ut_pn2', 'dap1_sclk_pn3', 'clk1_req_pee2', 'clk1_out_pw4', 'spdif_in_pk6', =
'spdif_out_pk5', 'dap2_fs_pa2', 'dap2_din_pa4', 'dap2_dout_pa5', 'dap2_sclk=
_pa3', 'dvfs_pwm_px0', 'gpio_x1_aud_px1', 'gpio_x3_aud_px3', 'dvfs_clk_px2'=
, 'gpio_x4_aud_px4', 'gpio_x5_aud_px5', 'gpio_x6_aud_px6', 'gpio_x7_aud_px7=
', 'sdmmc3_clk_pa6', 'sdmmc3_cmd_pa7', 'sdmmc3_dat0_pb7', 'sdmmc3_dat1_pb6'=
, 'sdmmc3_dat2_pb5', 'sdmmc3_dat3_pb4', 'hdmi_cec_pee3', 'sdmmc1_wp_n_pv3',=
 'sdmmc3_cd_n_pv2', 'gpio_w2_aud_pw2', 'gpio_w3_aud_pw3', 'usb_vbus_en0_pn4=
', 'usb_vbus_en1_pn5', 'sdmmc3_clk_lb_in_pee5', 'sdmmc3_clk_lb_out_pee4', '=
reset_out_n', 'drive_ao1', 'drive_ao2', 'drive_at1', 'drive_at2', 'drive_at=
3', 'drive_at4', 'drive_at5', 'drive_cdev1', 'drive_cdev2', 'drive_dap1', '=
drive_dap2', 'drive_dap3', 'drive_dap4', 'drive_dbg', 'drive_sdio3', 'drive=
_spi', 'drive_uaa', 'drive_uab', 'drive_uart2', 'drive_uart3', 'drive_sdio1=
', 'drive_ddc', 'drive_gma', 'drive_gme', 'drive_gmf', 'drive_gmg', 'drive_=
gmh', 'drive_owr', 'drive_uda']
   	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-=
pinmux.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pv0-gpio: {'n=
vidia,pins': ['pv0'], 'nvidia,function': ['rsvd2'], 'nvidia,pull': 2, 'nvid=
ia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pv1-gpio: {'n=
vidia,pins': ['pv1'], 'nvidia,function': ['rsvd1'], 'nvidia,pull': 2, 'nvid=
ia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pu0-gpio: {'n=
vidia,pins': ['pu0'], 'nvidia,function': ['rsvd3'], 'nvidia,pull': 0, 'nvid=
ia,tristate': 0, 'nvidia,enable-input': 0} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pu2-gpio: {'n=
vidia,pins': ['pu2'], 'nvidia,function': ['rsvd1'], 'nvidia,pull': 2, 'nvid=
ia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pcc-gpio: {'n=
vidia,pins': ['pcc1', 'pcc2'], 'nvidia,function': ['rsvd2'], 'nvidia,pull':=
 1, 'nvidia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pbb3-gpio: {'=
nvidia,pins': ['pbb3'], 'nvidia,function': ['rsvd4'], 'nvidia,pull': 0, 'nv=
idia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pbb4-5-6-gpio=
: {'nvidia,pins': ['pbb4', 'pbb5', 'pbb6'], 'nvidia,function': ['rsvd4'], '=
nvidia,pull': 0, 'nvidia,tristate': 0, 'nvidia,enable-input': 0} is not of =
type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pbb7-gpio: {'=
nvidia,pins': ['pbb7'], 'nvidia,function': ['rsvd2'], 'nvidia,pull': 0, 'nv=
idia,tristate': 0, 'nvidia,enable-input': 0} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000c000/audio-c=
odec@1c: failed to match any schema with compatible: ['realtek,rt5639']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58=
: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58=
: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58=
/gpio: failed to match any schema with compatible: ['ti,palmas-gpio']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58=
/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58=
/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti=
,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58=
/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti=
,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58=
/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /kbc@7000e200: failed=
 to match any schema with compatible: ['nvidia,tegra114-kbc']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
