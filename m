Content-Type: multipart/mixed; boundary="===============4839022181426389666=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [lee-linaro:tb-fix-w1-warnings 15/194] drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2057 bw_calcs_init() warn: possible memory leak of 'dceip'
Date: Fri, 26 Feb 2021 07:44:29 +0800
Message-ID: <202102260726.iVobpJBn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4839022181426389666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lee Jones <lee.jones@linaro.org>

tree:   https://git.linaro.org/people/lee.jones/linux.git tb-fix-w1-warnings
head:   88ee6a99115ba595216378f4f3f1eaf160547d1f
commit: 12f826c4dc0ee5a163fec3ac5aa6b8c7b9be552e [15/194] drm/amd/display/d=
c/calcs/dce_calcs: Remove some large variables from the stack
:::::: branch date: 4 hours ago
:::::: commit date: 2 days ago
config: parisc-randconfig-m031-20210225 (attached as .config)
compiler: hppa64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:2057 bw_calcs_in=
it() warn: possible memory leak of 'dceip'

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:1740 calculate_b=
andwidth() warn: Function too hairy.  No more merges.
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3408 bw_calcs() =
warn: inconsistent indenting

vim +/dceip +2057 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c

4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2038  =

4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2039  /*****************************************=
**************************************
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2040   * Public functions
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2041   *****************************************=
*************************************/
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2042  void bw_calcs_init(struct bw_calcs_dceip *=
bw_dceip,
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2043  	struct bw_calcs_vbios *bw_vbios,
00c91d0d480a0c drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Joshu=
a Aberback     2017-01-09  2044  	struct hw_asic_id asic_id)
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2045  {
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2046  	struct bw_calcs_dceip *dceip;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2047  	struct bw_calcs_vbios *vbios;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2048  =

00c91d0d480a0c drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Joshu=
a Aberback     2017-01-09  2049  	enum bw_calcs_version version =3D bw_calc=
s_version_from_asic_id(asic_id);
00c91d0d480a0c drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Joshu=
a Aberback     2017-01-09  2050  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2051  	dceip =3D kzalloc(sizeof(dceip), GFP_KERN=
EL);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2052  	if (!dceip)
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2053  		return;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2054  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2055  	vbios =3D kzalloc(sizeof(vbios), GFP_KERN=
EL);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2056  	if (!vbios)
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08 @2057  		return;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2058  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2059  	dceip->version =3D version;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2060  =

4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2061  	switch (version) {
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2062  	case BW_CALCS_VERSION_CARRIZO:
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2063  		vbios->memory_type =3D bw_def_gddr5;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2064  		vbios->dram_channel_width_in_bits =3D 64;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2065  		vbios->number_of_dram_channels =3D asic_=
id.vram_width / vbios->dram_channel_width_in_bits;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2066  		vbios->number_of_dram_banks =3D 8;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2067  		vbios->high_yclk =3D bw_int_to_fixed(160=
0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2068  		vbios->mid_yclk =3D bw_int_to_fixed(1600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2069  		vbios->low_yclk =3D bw_frc_to_fixed(6666=
6, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2070  		vbios->low_sclk =3D bw_int_to_fixed(200);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2071  		vbios->mid1_sclk =3D bw_int_to_fixed(300=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2072  		vbios->mid2_sclk =3D bw_int_to_fixed(300=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2073  		vbios->mid3_sclk =3D bw_int_to_fixed(300=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2074  		vbios->mid4_sclk =3D bw_int_to_fixed(300=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2075  		vbios->mid5_sclk =3D bw_int_to_fixed(300=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2076  		vbios->mid6_sclk =3D bw_int_to_fixed(300=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2077  		vbios->high_sclk =3D bw_frc_to_fixed(626=
09, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2078  		vbios->low_voltage_max_dispclk =3D bw_in=
t_to_fixed(352);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2079  		vbios->mid_voltage_max_dispclk =3D bw_in=
t_to_fixed(467);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2080  		vbios->high_voltage_max_dispclk =3D bw_i=
nt_to_fixed(643);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2081  		vbios->low_voltage_max_phyclk =3D bw_int=
_to_fixed(540);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2082  		vbios->mid_voltage_max_phyclk =3D bw_int=
_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2083  		vbios->high_voltage_max_phyclk =3D bw_in=
t_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2084  		vbios->data_return_bus_width =3D bw_int_=
to_fixed(32);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2085  		vbios->trc =3D bw_int_to_fixed(50);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2086  		vbios->dmifmc_urgent_latency =3D bw_int_=
to_fixed(4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2087  		vbios->stutter_self_refresh_exit_latency=
 =3D bw_frc_to_fixed(153, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2088  		vbios->stutter_self_refresh_entry_latenc=
y =3D bw_int_to_fixed(0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2089  		vbios->nbp_state_change_latency =3D bw_f=
rc_to_fixed(19649, 1000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2090  		vbios->mcifwrmc_urgent_latency =3D bw_in=
t_to_fixed(10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2091  		vbios->scatter_gather_enable =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2092  		vbios->down_spread_percentage =3D bw_frc=
_to_fixed(5, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2093  		vbios->cursor_width =3D 32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2094  		vbios->average_compression_rate =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2095  		vbios->number_of_request_slots_gmc_reser=
ves_for_dmif_per_channel =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2096  		vbios->blackout_duration =3D bw_int_to_f=
ixed(0); /* us */
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2097  		vbios->maximum_blackout_recovery_time =
=3D bw_int_to_fixed(0);
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2098  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2099  		dceip->max_average_percent_of_ideal_port=
_bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2100  		dceip->max_average_percent_of_ideal_dram=
bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2101  		dceip->percent_of_ideal_port_bw_received=
_after_urgent_latency =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2102  		dceip->large_cursor =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2103  		dceip->dmif_request_buffer_size =3D bw_i=
nt_to_fixed(768);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2104  		dceip->dmif_pipe_en_fbc_chunk_tracker =
=3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2105  		dceip->cursor_max_outstanding_group_num =
=3D 1;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2106  		dceip->lines_interleaved_into_lb =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2107  		dceip->chunk_width =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2108  		dceip->number_of_graphics_pipes =3D 3;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2109  		dceip->number_of_underlay_pipes =3D 1;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2110  		dceip->low_power_tiling_mode =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2111  		dceip->display_write_back_supported =3D =
false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2112  		dceip->argb_compression_support =3D fals=
e;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2113  		dceip->underlay_vscaler_efficiency6_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2114  			bw_frc_to_fixed(35556, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2115  		dceip->underlay_vscaler_efficiency8_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2116  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2117  		dceip->underlay_vscaler_efficiency10_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2118  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2119  		dceip->underlay_vscaler_efficiency12_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2120  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2121  		dceip->graphics_vscaler_efficiency6_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2122  			bw_frc_to_fixed(35, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2123  		dceip->graphics_vscaler_efficiency8_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2124  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2125  		dceip->graphics_vscaler_efficiency10_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2126  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2127  		dceip->graphics_vscaler_efficiency12_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2128  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2129  		dceip->alpha_vscaler_efficiency =3D bw_i=
nt_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2130  		dceip->max_dmif_buffer_allocated =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2131  		dceip->graphics_dmif_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2132  		dceip->underlay_luma_dmif_size =3D 19456;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2133  		dceip->underlay_chroma_dmif_size =3D 235=
52;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2134  		dceip->pre_downscaler_enabled =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2135  		dceip->underlay_downscale_prefetch_enabl=
ed =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2136  		dceip->lb_write_pixels_per_dispclk =3D b=
w_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2137  		dceip->lb_size_per_component444 =3D bw_i=
nt_to_fixed(82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2138  		dceip->graphics_lb_nodownscaling_multi_l=
ine_prefetching =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2139  		dceip->stutter_and_dram_clock_state_chan=
ge_gated_before_cursor =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2140  			bw_int_to_fixed(0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2141  		dceip->underlay420_luma_lb_size_per_comp=
onent =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2142  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2143  		dceip->underlay420_chroma_lb_size_per_co=
mponent =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2144  			bw_int_to_fixed(164352);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2145  		dceip->underlay422_lb_size_per_component=
 =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2146  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2147  		dceip->cursor_chunk_width =3D bw_int_to_=
fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2148  		dceip->cursor_dcp_buffer_lines =3D bw_in=
t_to_fixed(4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2149  		dceip->underlay_maximum_width_efficient_=
for_tiling =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2150  			bw_int_to_fixed(1920);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2151  		dceip->underlay_maximum_height_efficient=
_for_tiling =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2152  			bw_int_to_fixed(1080);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2153  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_multiple_displays_or_single_rotated_display =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2154  			bw_frc_to_fixed(3, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2155  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_single_display_no_rotation =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2156  			bw_int_to_fixed(25);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2157  		dceip->minimum_outstanding_pte_request_l=
imit =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2158  			2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2159  		dceip->maximum_total_outstanding_pte_req=
uests_allowed_by_saw =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2160  			bw_int_to_fixed(128);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2161  		dceip->limit_excessive_outstanding_dmif_=
requests =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2162  		dceip->linear_mode_line_request_alternat=
ion_slice =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2163  			bw_int_to_fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2164  		dceip->scatter_gather_lines_of_pte_prefe=
tching_in_linear_mode =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2165  			32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2166  		dceip->display_write_back420_luma_mcifwr=
_buffer_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2167  		dceip->display_write_back420_chroma_mcif=
wr_buffer_size =3D 8192;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2168  		dceip->request_efficiency =3D bw_frc_to_=
fixed(8, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2169  		dceip->dispclk_per_request =3D bw_int_to=
_fixed(2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2170  		dceip->dispclk_ramping_factor =3D bw_frc=
_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2171  		dceip->display_pipe_throughput_factor =
=3D bw_frc_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2172  		dceip->scatter_gather_pte_request_rows_i=
n_tiling_mode =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2173  		dceip->mcifwr_all_surfaces_burst_time =
=3D bw_int_to_fixed(0); /* todo: this is a bug*/
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2174  		break;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2175  	case BW_CALCS_VERSION_POLARIS10:
0c75d5acc80dc5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Jerry=
 (Fangzhi  Zuo 2018-04-11  2176) 		/* TODO: Treat VEGAM the same as P10 for=
 now
0c75d5acc80dc5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Jerry=
 (Fangzhi  Zuo 2018-04-11  2177) 		 * Need to tune the para for VEGAM if ne=
eded */
0c75d5acc80dc5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Jerry=
 (Fangzhi  Zuo 2018-04-11  2178) 	case BW_CALCS_VERSION_VEGAM:
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2179  		vbios->memory_type =3D bw_def_gddr5;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2180  		vbios->dram_channel_width_in_bits =3D 32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2181  		vbios->number_of_dram_channels =3D asic_=
id.vram_width / vbios->dram_channel_width_in_bits;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2182  		vbios->number_of_dram_banks =3D 8;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2183  		vbios->high_yclk =3D bw_int_to_fixed(600=
0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2184  		vbios->mid_yclk =3D bw_int_to_fixed(3200=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2185  		vbios->low_yclk =3D bw_int_to_fixed(1000=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2186  		vbios->low_sclk =3D bw_int_to_fixed(300);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2187  		vbios->mid1_sclk =3D bw_int_to_fixed(400=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2188  		vbios->mid2_sclk =3D bw_int_to_fixed(500=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2189  		vbios->mid3_sclk =3D bw_int_to_fixed(600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2190  		vbios->mid4_sclk =3D bw_int_to_fixed(700=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2191  		vbios->mid5_sclk =3D bw_int_to_fixed(800=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2192  		vbios->mid6_sclk =3D bw_int_to_fixed(974=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2193  		vbios->high_sclk =3D bw_int_to_fixed(115=
4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2194  		vbios->low_voltage_max_dispclk =3D bw_in=
t_to_fixed(459);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2195  		vbios->mid_voltage_max_dispclk =3D bw_in=
t_to_fixed(654);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2196  		vbios->high_voltage_max_dispclk =3D bw_i=
nt_to_fixed(1108);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2197  		vbios->low_voltage_max_phyclk =3D bw_int=
_to_fixed(540);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2198  		vbios->mid_voltage_max_phyclk =3D bw_int=
_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2199  		vbios->high_voltage_max_phyclk =3D bw_in=
t_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2200  		vbios->data_return_bus_width =3D bw_int_=
to_fixed(32);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2201  		vbios->trc =3D bw_int_to_fixed(48);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2202  		vbios->dmifmc_urgent_latency =3D bw_int_=
to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2203  		vbios->stutter_self_refresh_exit_latency=
 =3D bw_int_to_fixed(5);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2204  		vbios->stutter_self_refresh_entry_latenc=
y =3D bw_int_to_fixed(0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2205  		vbios->nbp_state_change_latency =3D bw_i=
nt_to_fixed(45);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2206  		vbios->mcifwrmc_urgent_latency =3D bw_in=
t_to_fixed(10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2207  		vbios->scatter_gather_enable =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2208  		vbios->down_spread_percentage =3D bw_frc=
_to_fixed(5, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2209  		vbios->cursor_width =3D 32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2210  		vbios->average_compression_rate =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2211  		vbios->number_of_request_slots_gmc_reser=
ves_for_dmif_per_channel =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2212  		vbios->blackout_duration =3D bw_int_to_f=
ixed(0); /* us */
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2213  		vbios->maximum_blackout_recovery_time =
=3D bw_int_to_fixed(0);
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2214  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2215  		dceip->max_average_percent_of_ideal_port=
_bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2216  		dceip->max_average_percent_of_ideal_dram=
bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2217  		dceip->percent_of_ideal_port_bw_received=
_after_urgent_latency =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2218  		dceip->large_cursor =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2219  		dceip->dmif_request_buffer_size =3D bw_i=
nt_to_fixed(768);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2220  		dceip->dmif_pipe_en_fbc_chunk_tracker =
=3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2221  		dceip->cursor_max_outstanding_group_num =
=3D 1;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2222  		dceip->lines_interleaved_into_lb =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2223  		dceip->chunk_width =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2224  		dceip->number_of_graphics_pipes =3D 6;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2225  		dceip->number_of_underlay_pipes =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2226  		dceip->low_power_tiling_mode =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2227  		dceip->display_write_back_supported =3D =
false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2228  		dceip->argb_compression_support =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2229  		dceip->underlay_vscaler_efficiency6_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2230  			bw_frc_to_fixed(35556, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2231  		dceip->underlay_vscaler_efficiency8_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2232  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2233  		dceip->underlay_vscaler_efficiency10_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2234  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2235  		dceip->underlay_vscaler_efficiency12_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2236  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2237  		dceip->graphics_vscaler_efficiency6_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2238  			bw_frc_to_fixed(35, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2239  		dceip->graphics_vscaler_efficiency8_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2240  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2241  		dceip->graphics_vscaler_efficiency10_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2242  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2243  		dceip->graphics_vscaler_efficiency12_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2244  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2245  		dceip->alpha_vscaler_efficiency =3D bw_i=
nt_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2246  		dceip->max_dmif_buffer_allocated =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2247  		dceip->graphics_dmif_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2248  		dceip->underlay_luma_dmif_size =3D 19456;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2249  		dceip->underlay_chroma_dmif_size =3D 235=
52;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2250  		dceip->pre_downscaler_enabled =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2251  		dceip->underlay_downscale_prefetch_enabl=
ed =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2252  		dceip->lb_write_pixels_per_dispclk =3D b=
w_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2253  		dceip->lb_size_per_component444 =3D bw_i=
nt_to_fixed(245952);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2254  		dceip->graphics_lb_nodownscaling_multi_l=
ine_prefetching =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2255  		dceip->stutter_and_dram_clock_state_chan=
ge_gated_before_cursor =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2256  			bw_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2257  		dceip->underlay420_luma_lb_size_per_comp=
onent =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2258  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2259  		dceip->underlay420_chroma_lb_size_per_co=
mponent =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2260  			bw_int_to_fixed(164352);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2261  		dceip->underlay422_lb_size_per_component=
 =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2262  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2263  		dceip->cursor_chunk_width =3D bw_int_to_=
fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2264  		dceip->cursor_dcp_buffer_lines =3D bw_in=
t_to_fixed(4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2265  		dceip->underlay_maximum_width_efficient_=
for_tiling =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2266  			bw_int_to_fixed(1920);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2267  		dceip->underlay_maximum_height_efficient=
_for_tiling =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2268  			bw_int_to_fixed(1080);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2269  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_multiple_displays_or_single_rotated_display =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2270  			bw_frc_to_fixed(3, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2271  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_single_display_no_rotation =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2272  			bw_int_to_fixed(25);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2273  		dceip->minimum_outstanding_pte_request_l=
imit =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2274  			2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2275  		dceip->maximum_total_outstanding_pte_req=
uests_allowed_by_saw =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2276  			bw_int_to_fixed(128);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2277  		dceip->limit_excessive_outstanding_dmif_=
requests =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2278  		dceip->linear_mode_line_request_alternat=
ion_slice =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2279  			bw_int_to_fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2280  		dceip->scatter_gather_lines_of_pte_prefe=
tching_in_linear_mode =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2281  			32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2282  		dceip->display_write_back420_luma_mcifwr=
_buffer_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2283  		dceip->display_write_back420_chroma_mcif=
wr_buffer_size =3D 8192;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2284  		dceip->request_efficiency =3D bw_frc_to_=
fixed(8, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2285  		dceip->dispclk_per_request =3D bw_int_to=
_fixed(2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2286  		dceip->dispclk_ramping_factor =3D bw_frc=
_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2287  		dceip->display_pipe_throughput_factor =
=3D bw_frc_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2288  		dceip->scatter_gather_pte_request_rows_i=
n_tiling_mode =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2289  		dceip->mcifwr_all_surfaces_burst_time =
=3D bw_int_to_fixed(0);
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2290  		break;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2291  	case BW_CALCS_VERSION_POLARIS11:
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2292  		vbios->memory_type =3D bw_def_gddr5;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2293  		vbios->dram_channel_width_in_bits =3D 32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2294  		vbios->number_of_dram_channels =3D asic_=
id.vram_width / vbios->dram_channel_width_in_bits;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2295  		vbios->number_of_dram_banks =3D 8;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2296  		vbios->high_yclk =3D bw_int_to_fixed(600=
0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2297  		vbios->mid_yclk =3D bw_int_to_fixed(3200=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2298  		vbios->low_yclk =3D bw_int_to_fixed(1000=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2299  		vbios->low_sclk =3D bw_int_to_fixed(300);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2300  		vbios->mid1_sclk =3D bw_int_to_fixed(400=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2301  		vbios->mid2_sclk =3D bw_int_to_fixed(500=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2302  		vbios->mid3_sclk =3D bw_int_to_fixed(600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2303  		vbios->mid4_sclk =3D bw_int_to_fixed(700=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2304  		vbios->mid5_sclk =3D bw_int_to_fixed(800=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2305  		vbios->mid6_sclk =3D bw_int_to_fixed(974=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2306  		vbios->high_sclk =3D bw_int_to_fixed(115=
4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2307  		vbios->low_voltage_max_dispclk =3D bw_in=
t_to_fixed(459);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2308  		vbios->mid_voltage_max_dispclk =3D bw_in=
t_to_fixed(654);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2309  		vbios->high_voltage_max_dispclk =3D bw_i=
nt_to_fixed(1108);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2310  		vbios->low_voltage_max_phyclk =3D bw_int=
_to_fixed(540);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2311  		vbios->mid_voltage_max_phyclk =3D bw_int=
_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2312  		vbios->high_voltage_max_phyclk =3D bw_in=
t_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2313  		vbios->data_return_bus_width =3D bw_int_=
to_fixed(32);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2314  		vbios->trc =3D bw_int_to_fixed(48);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2315  		if (vbios->number_of_dram_channels =3D=
=3D 2) // 64-bit
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2316  			vbios->dmifmc_urgent_latency =3D bw_int=
_to_fixed(4);
00c91d0d480a0c drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Joshu=
a Aberback     2017-01-09  2317  		else
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2318  			vbios->dmifmc_urgent_latency =3D bw_int=
_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2319  		vbios->stutter_self_refresh_exit_latency=
 =3D bw_int_to_fixed(5);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2320  		vbios->stutter_self_refresh_entry_latenc=
y =3D bw_int_to_fixed(0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2321  		vbios->nbp_state_change_latency =3D bw_i=
nt_to_fixed(45);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2322  		vbios->mcifwrmc_urgent_latency =3D bw_in=
t_to_fixed(10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2323  		vbios->scatter_gather_enable =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2324  		vbios->down_spread_percentage =3D bw_frc=
_to_fixed(5, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2325  		vbios->cursor_width =3D 32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2326  		vbios->average_compression_rate =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2327  		vbios->number_of_request_slots_gmc_reser=
ves_for_dmif_per_channel =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2328  		vbios->blackout_duration =3D bw_int_to_f=
ixed(0); /* us */
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2329  		vbios->maximum_blackout_recovery_time =
=3D bw_int_to_fixed(0);
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2330  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2331  		dceip->max_average_percent_of_ideal_port=
_bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2332  		dceip->max_average_percent_of_ideal_dram=
bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2333  		dceip->percent_of_ideal_port_bw_received=
_after_urgent_latency =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2334  		dceip->large_cursor =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2335  		dceip->dmif_request_buffer_size =3D bw_i=
nt_to_fixed(768);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2336  		dceip->dmif_pipe_en_fbc_chunk_tracker =
=3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2337  		dceip->cursor_max_outstanding_group_num =
=3D 1;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2338  		dceip->lines_interleaved_into_lb =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2339  		dceip->chunk_width =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2340  		dceip->number_of_graphics_pipes =3D 5;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2341  		dceip->number_of_underlay_pipes =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2342  		dceip->low_power_tiling_mode =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2343  		dceip->display_write_back_supported =3D =
false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2344  		dceip->argb_compression_support =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2345  		dceip->underlay_vscaler_efficiency6_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2346  			bw_frc_to_fixed(35556, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2347  		dceip->underlay_vscaler_efficiency8_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2348  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2349  		dceip->underlay_vscaler_efficiency10_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2350  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2351  		dceip->underlay_vscaler_efficiency12_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2352  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2353  		dceip->graphics_vscaler_efficiency6_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2354  			bw_frc_to_fixed(35, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2355  		dceip->graphics_vscaler_efficiency8_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2356  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2357  		dceip->graphics_vscaler_efficiency10_bit=
_per_component =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2358  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2359  		dceip->graphics_vscaler_efficiency12_bit=
_per_component =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2360  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2361  		dceip->alpha_vscaler_efficiency =3D bw_i=
nt_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2362  		dceip->max_dmif_buffer_allocated =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2363  		dceip->graphics_dmif_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2364  		dceip->underlay_luma_dmif_size =3D 19456;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2365  		dceip->underlay_chroma_dmif_size =3D 235=
52;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2366  		dceip->pre_downscaler_enabled =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2367  		dceip->underlay_downscale_prefetch_enabl=
ed =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2368  		dceip->lb_write_pixels_per_dispclk =3D b=
w_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2369  		dceip->lb_size_per_component444 =3D bw_i=
nt_to_fixed(245952);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2370  		dceip->graphics_lb_nodownscaling_multi_l=
ine_prefetching =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2371  		dceip->stutter_and_dram_clock_state_chan=
ge_gated_before_cursor =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2372  			bw_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2373  		dceip->underlay420_luma_lb_size_per_comp=
onent =3D bw_int_to_fixed(
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2374  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2375  		dceip->underlay420_chroma_lb_size_per_co=
mponent =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2376  			bw_int_to_fixed(164352);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2377  		dceip->underlay422_lb_size_per_component=
 =3D bw_int_to_fixed(
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2378  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2379  		dceip->cursor_chunk_width =3D bw_int_to_=
fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2380  		dceip->cursor_dcp_buffer_lines =3D bw_in=
t_to_fixed(4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2381  		dceip->underlay_maximum_width_efficient_=
for_tiling =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2382  			bw_int_to_fixed(1920);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2383  		dceip->underlay_maximum_height_efficient=
_for_tiling =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2384  			bw_int_to_fixed(1080);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2385  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_multiple_displays_or_single_rotated_display =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2386  			bw_frc_to_fixed(3, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2387  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_single_display_no_rotation =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2388  			bw_int_to_fixed(25);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2389  		dceip->minimum_outstanding_pte_request_l=
imit =3D bw_int_to_fixed(
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2390  			2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2391  		dceip->maximum_total_outstanding_pte_req=
uests_allowed_by_saw =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2392  			bw_int_to_fixed(128);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2393  		dceip->limit_excessive_outstanding_dmif_=
requests =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2394  		dceip->linear_mode_line_request_alternat=
ion_slice =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2395  			bw_int_to_fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2396  		dceip->scatter_gather_lines_of_pte_prefe=
tching_in_linear_mode =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2397  			32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2398  		dceip->display_write_back420_luma_mcifwr=
_buffer_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2399  		dceip->display_write_back420_chroma_mcif=
wr_buffer_size =3D 8192;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2400  		dceip->request_efficiency =3D bw_frc_to_=
fixed(8, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2401  		dceip->dispclk_per_request =3D bw_int_to=
_fixed(2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2402  		dceip->dispclk_ramping_factor =3D bw_frc=
_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2403  		dceip->display_pipe_throughput_factor =
=3D bw_frc_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2404  		dceip->scatter_gather_pte_request_rows_i=
n_tiling_mode =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2405  		dceip->mcifwr_all_surfaces_burst_time =
=3D bw_int_to_fixed(0);
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2406  		break;
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2407  	case BW_CALCS_VERSION_POLARIS12:
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2408  		vbios->memory_type =3D bw_def_gddr5;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2409  		vbios->dram_channel_width_in_bits =3D 32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2410  		vbios->number_of_dram_channels =3D asic_=
id.vram_width / vbios->dram_channel_width_in_bits;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2411  		vbios->number_of_dram_banks =3D 8;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2412  		vbios->high_yclk =3D bw_int_to_fixed(600=
0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2413  		vbios->mid_yclk =3D bw_int_to_fixed(3200=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2414  		vbios->low_yclk =3D bw_int_to_fixed(1000=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2415  		vbios->low_sclk =3D bw_int_to_fixed(678);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2416  		vbios->mid1_sclk =3D bw_int_to_fixed(864=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2417  		vbios->mid2_sclk =3D bw_int_to_fixed(900=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2418  		vbios->mid3_sclk =3D bw_int_to_fixed(920=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2419  		vbios->mid4_sclk =3D bw_int_to_fixed(940=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2420  		vbios->mid5_sclk =3D bw_int_to_fixed(960=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2421  		vbios->mid6_sclk =3D bw_int_to_fixed(980=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2422  		vbios->high_sclk =3D bw_int_to_fixed(104=
9);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2423  		vbios->low_voltage_max_dispclk =3D bw_in=
t_to_fixed(459);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2424  		vbios->mid_voltage_max_dispclk =3D bw_in=
t_to_fixed(654);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2425  		vbios->high_voltage_max_dispclk =3D bw_i=
nt_to_fixed(1108);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2426  		vbios->low_voltage_max_phyclk =3D bw_int=
_to_fixed(540);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2427  		vbios->mid_voltage_max_phyclk =3D bw_int=
_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2428  		vbios->high_voltage_max_phyclk =3D bw_in=
t_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2429  		vbios->data_return_bus_width =3D bw_int_=
to_fixed(32);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2430  		vbios->trc =3D bw_int_to_fixed(48);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2431  		if (vbios->number_of_dram_channels =3D=
=3D 2) // 64-bit
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2432  			vbios->dmifmc_urgent_latency =3D bw_int=
_to_fixed(4);
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2433  		else
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2434  			vbios->dmifmc_urgent_latency =3D bw_int=
_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2435  		vbios->stutter_self_refresh_exit_latency=
 =3D bw_int_to_fixed(5);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2436  		vbios->stutter_self_refresh_entry_latenc=
y =3D bw_int_to_fixed(0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2437  		vbios->nbp_state_change_latency =3D bw_i=
nt_to_fixed(250);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2438  		vbios->mcifwrmc_urgent_latency =3D bw_in=
t_to_fixed(10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2439  		vbios->scatter_gather_enable =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2440  		vbios->down_spread_percentage =3D bw_frc=
_to_fixed(5, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2441  		vbios->cursor_width =3D 32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2442  		vbios->average_compression_rate =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2443  		vbios->number_of_request_slots_gmc_reser=
ves_for_dmif_per_channel =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2444  		vbios->blackout_duration =3D bw_int_to_f=
ixed(0); /* us */
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2445  		vbios->maximum_blackout_recovery_time =
=3D bw_int_to_fixed(0);
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2446  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2447  		dceip->max_average_percent_of_ideal_port=
_bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2448  		dceip->max_average_percent_of_ideal_dram=
bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2449  		dceip->percent_of_ideal_port_bw_received=
_after_urgent_latency =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2450  		dceip->large_cursor =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2451  		dceip->dmif_request_buffer_size =3D bw_i=
nt_to_fixed(768);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2452  		dceip->dmif_pipe_en_fbc_chunk_tracker =
=3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2453  		dceip->cursor_max_outstanding_group_num =
=3D 1;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2454  		dceip->lines_interleaved_into_lb =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2455  		dceip->chunk_width =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2456  		dceip->number_of_graphics_pipes =3D 5;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2457  		dceip->number_of_underlay_pipes =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2458  		dceip->low_power_tiling_mode =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2459  		dceip->display_write_back_supported =3D =
true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2460  		dceip->argb_compression_support =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2461  		dceip->underlay_vscaler_efficiency6_bit_=
per_component =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2462  			bw_frc_to_fixed(35556, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2463  		dceip->underlay_vscaler_efficiency8_bit_=
per_component =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2464  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2465  		dceip->underlay_vscaler_efficiency10_bit=
_per_component =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2466  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2467  		dceip->underlay_vscaler_efficiency12_bit=
_per_component =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2468  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2469  		dceip->graphics_vscaler_efficiency6_bit_=
per_component =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2470  			bw_frc_to_fixed(35, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2471  		dceip->graphics_vscaler_efficiency8_bit_=
per_component =3D
e4b3f6f299436b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Dmytr=
o Laktyushkin  2018-03-08  2472  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2473  		dceip->graphics_vscaler_efficiency10_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2474  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2475  		dceip->graphics_vscaler_efficiency12_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2476  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2477  		dceip->alpha_vscaler_efficiency =3D bw_i=
nt_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2478  		dceip->max_dmif_buffer_allocated =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2479  		dceip->graphics_dmif_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2480  		dceip->underlay_luma_dmif_size =3D 19456;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2481  		dceip->underlay_chroma_dmif_size =3D 235=
52;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2482  		dceip->pre_downscaler_enabled =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2483  		dceip->underlay_downscale_prefetch_enabl=
ed =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2484  		dceip->lb_write_pixels_per_dispclk =3D b=
w_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2485  		dceip->lb_size_per_component444 =3D bw_i=
nt_to_fixed(245952);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2486  		dceip->graphics_lb_nodownscaling_multi_l=
ine_prefetching =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2487  		dceip->stutter_and_dram_clock_state_chan=
ge_gated_before_cursor =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2488  			bw_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2489  		dceip->underlay420_luma_lb_size_per_comp=
onent =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2490  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2491  		dceip->underlay420_chroma_lb_size_per_co=
mponent =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2492  			bw_int_to_fixed(164352);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2493  		dceip->underlay422_lb_size_per_component=
 =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2494  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2495  		dceip->cursor_chunk_width =3D bw_int_to_=
fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2496  		dceip->cursor_dcp_buffer_lines =3D bw_in=
t_to_fixed(4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2497  		dceip->underlay_maximum_width_efficient_=
for_tiling =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2498  			bw_int_to_fixed(1920);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2499  		dceip->underlay_maximum_height_efficient=
_for_tiling =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2500  			bw_int_to_fixed(1080);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2501  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_multiple_displays_or_single_rotated_display =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2502  			bw_frc_to_fixed(3, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2503  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_single_display_no_rotation =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2504  			bw_int_to_fixed(25);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2505  		dceip->minimum_outstanding_pte_request_l=
imit =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2506  			2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2507  		dceip->maximum_total_outstanding_pte_req=
uests_allowed_by_saw =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2508  			bw_int_to_fixed(128);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2509  		dceip->limit_excessive_outstanding_dmif_=
requests =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2510  		dceip->linear_mode_line_request_alternat=
ion_slice =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2511  			bw_int_to_fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2512  		dceip->scatter_gather_lines_of_pte_prefe=
tching_in_linear_mode =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2513  			32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2514  		dceip->display_write_back420_luma_mcifwr=
_buffer_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2515  		dceip->display_write_back420_chroma_mcif=
wr_buffer_size =3D 8192;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2516  		dceip->request_efficiency =3D bw_frc_to_=
fixed(8, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2517  		dceip->dispclk_per_request =3D bw_int_to=
_fixed(2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2518  		dceip->dispclk_ramping_factor =3D bw_frc=
_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2519  		dceip->display_pipe_throughput_factor =
=3D bw_frc_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2520  		dceip->scatter_gather_pte_request_rows_i=
n_tiling_mode =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2521  		dceip->mcifwr_all_surfaces_burst_time =
=3D bw_int_to_fixed(0);
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2522  		break;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2523  	case BW_CALCS_VERSION_STONEY:
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2524  		vbios->memory_type =3D bw_def_gddr5;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2525  		vbios->dram_channel_width_in_bits =3D 64;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2526  		vbios->number_of_dram_channels =3D asic_=
id.vram_width / vbios->dram_channel_width_in_bits;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2527  		vbios->number_of_dram_banks =3D 8;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2528  		vbios->high_yclk =3D bw_int_to_fixed(186=
6);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2529  		vbios->mid_yclk =3D bw_int_to_fixed(1866=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2530  		vbios->low_yclk =3D bw_int_to_fixed(1333=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2531  		vbios->low_sclk =3D bw_int_to_fixed(200);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2532  		vbios->mid1_sclk =3D bw_int_to_fixed(600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2533  		vbios->mid2_sclk =3D bw_int_to_fixed(600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2534  		vbios->mid3_sclk =3D bw_int_to_fixed(600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2535  		vbios->mid4_sclk =3D bw_int_to_fixed(600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2536  		vbios->mid5_sclk =3D bw_int_to_fixed(600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2537  		vbios->mid6_sclk =3D bw_int_to_fixed(600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2538  		vbios->high_sclk =3D bw_int_to_fixed(800=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2539  		vbios->low_voltage_max_dispclk =3D bw_in=
t_to_fixed(352);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2540  		vbios->mid_voltage_max_dispclk =3D bw_in=
t_to_fixed(467);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2541  		vbios->high_voltage_max_dispclk =3D bw_i=
nt_to_fixed(643);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2542  		vbios->low_voltage_max_phyclk =3D bw_int=
_to_fixed(540);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2543  		vbios->mid_voltage_max_phyclk =3D bw_int=
_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2544  		vbios->high_voltage_max_phyclk =3D bw_in=
t_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2545  		vbios->data_return_bus_width =3D bw_int_=
to_fixed(32);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2546  		vbios->trc =3D bw_int_to_fixed(50);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2547  		vbios->dmifmc_urgent_latency =3D bw_int_=
to_fixed(4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2548  		vbios->stutter_self_refresh_exit_latency=
 =3D bw_frc_to_fixed(158, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2549  		vbios->stutter_self_refresh_entry_latenc=
y =3D bw_int_to_fixed(0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2550  		vbios->nbp_state_change_latency =3D bw_f=
rc_to_fixed(2008, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2551  		vbios->mcifwrmc_urgent_latency =3D bw_in=
t_to_fixed(10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2552  		vbios->scatter_gather_enable =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2553  		vbios->down_spread_percentage =3D bw_frc=
_to_fixed(5, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2554  		vbios->cursor_width =3D 32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2555  		vbios->average_compression_rate =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2556  		vbios->number_of_request_slots_gmc_reser=
ves_for_dmif_per_channel =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2557  		vbios->blackout_duration =3D bw_int_to_f=
ixed(0); /* us */
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2558  		vbios->maximum_blackout_recovery_time =
=3D bw_int_to_fixed(0);
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2559  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2560  		dceip->max_average_percent_of_ideal_port=
_bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2561  		dceip->max_average_percent_of_ideal_dram=
bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2562  		dceip->percent_of_ideal_port_bw_received=
_after_urgent_latency =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2563  		dceip->large_cursor =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2564  		dceip->dmif_request_buffer_size =3D bw_i=
nt_to_fixed(768);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2565  		dceip->dmif_pipe_en_fbc_chunk_tracker =
=3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2566  		dceip->cursor_max_outstanding_group_num =
=3D 1;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2567  		dceip->lines_interleaved_into_lb =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2568  		dceip->chunk_width =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2569  		dceip->number_of_graphics_pipes =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2570  		dceip->number_of_underlay_pipes =3D 1;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2571  		dceip->low_power_tiling_mode =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2572  		dceip->display_write_back_supported =3D =
false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2573  		dceip->argb_compression_support =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2574  		dceip->underlay_vscaler_efficiency6_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2575  			bw_frc_to_fixed(35556, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2576  		dceip->underlay_vscaler_efficiency8_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2577  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2578  		dceip->underlay_vscaler_efficiency10_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2579  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2580  		dceip->underlay_vscaler_efficiency12_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2581  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2582  		dceip->graphics_vscaler_efficiency6_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2583  			bw_frc_to_fixed(35, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2584  		dceip->graphics_vscaler_efficiency8_bit_=
per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2585  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2586  		dceip->graphics_vscaler_efficiency10_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2587  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2588  		dceip->graphics_vscaler_efficiency12_bit=
_per_component =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2589  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2590  		dceip->alpha_vscaler_efficiency =3D bw_i=
nt_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2591  		dceip->max_dmif_buffer_allocated =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2592  		dceip->graphics_dmif_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2593  		dceip->underlay_luma_dmif_size =3D 19456;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2594  		dceip->underlay_chroma_dmif_size =3D 235=
52;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2595  		dceip->pre_downscaler_enabled =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2596  		dceip->underlay_downscale_prefetch_enabl=
ed =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2597  		dceip->lb_write_pixels_per_dispclk =3D b=
w_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2598  		dceip->lb_size_per_component444 =3D bw_i=
nt_to_fixed(82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2599  		dceip->graphics_lb_nodownscaling_multi_l=
ine_prefetching =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2600  		dceip->stutter_and_dram_clock_state_chan=
ge_gated_before_cursor =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2601  			bw_int_to_fixed(0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2602  		dceip->underlay420_luma_lb_size_per_comp=
onent =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2603  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2604  		dceip->underlay420_chroma_lb_size_per_co=
mponent =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2605  			bw_int_to_fixed(164352);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2606  		dceip->underlay422_lb_size_per_component=
 =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2607  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2608  		dceip->cursor_chunk_width =3D bw_int_to_=
fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2609  		dceip->cursor_dcp_buffer_lines =3D bw_in=
t_to_fixed(4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2610  		dceip->underlay_maximum_width_efficient_=
for_tiling =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2611  			bw_int_to_fixed(1920);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2612  		dceip->underlay_maximum_height_efficient=
_for_tiling =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2613  			bw_int_to_fixed(1080);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2614  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_multiple_displays_or_single_rotated_display =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2615  			bw_frc_to_fixed(3, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2616  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_single_display_no_rotation =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2617  			bw_int_to_fixed(25);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2618  		dceip->minimum_outstanding_pte_request_l=
imit =3D bw_int_to_fixed(
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2619  			2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2620  		dceip->maximum_total_outstanding_pte_req=
uests_allowed_by_saw =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2621  			bw_int_to_fixed(128);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2622  		dceip->limit_excessive_outstanding_dmif_=
requests =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2623  		dceip->linear_mode_line_request_alternat=
ion_slice =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2624  			bw_int_to_fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2625  		dceip->scatter_gather_lines_of_pte_prefe=
tching_in_linear_mode =3D
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2626  			32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2627  		dceip->display_write_back420_luma_mcifwr=
_buffer_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2628  		dceip->display_write_back420_chroma_mcif=
wr_buffer_size =3D 8192;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2629  		dceip->request_efficiency =3D bw_frc_to_=
fixed(8, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2630  		dceip->dispclk_per_request =3D bw_int_to=
_fixed(2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2631  		dceip->dispclk_ramping_factor =3D bw_frc=
_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2632  		dceip->display_pipe_throughput_factor =
=3D bw_frc_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2633  		dceip->scatter_gather_pte_request_rows_i=
n_tiling_mode =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2634  		dceip->mcifwr_all_surfaces_burst_time =
=3D bw_int_to_fixed(0);
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2635  		break;
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2636  	case BW_CALCS_VERSION_VEGA10:
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2637  		vbios->memory_type =3D bw_def_hbm;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2638  		vbios->dram_channel_width_in_bits =3D 12=
8;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2639  		vbios->number_of_dram_channels =3D asic_=
id.vram_width / vbios->dram_channel_width_in_bits;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2640  		vbios->number_of_dram_banks =3D 16;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2641  		vbios->high_yclk =3D bw_int_to_fixed(240=
0);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2642  		vbios->mid_yclk =3D bw_int_to_fixed(1700=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2643  		vbios->low_yclk =3D bw_int_to_fixed(1000=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2644  		vbios->low_sclk =3D bw_int_to_fixed(300);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2645  		vbios->mid1_sclk =3D bw_int_to_fixed(350=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2646  		vbios->mid2_sclk =3D bw_int_to_fixed(400=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2647  		vbios->mid3_sclk =3D bw_int_to_fixed(500=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2648  		vbios->mid4_sclk =3D bw_int_to_fixed(600=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2649  		vbios->mid5_sclk =3D bw_int_to_fixed(700=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2650  		vbios->mid6_sclk =3D bw_int_to_fixed(760=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2651  		vbios->high_sclk =3D bw_int_to_fixed(776=
);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2652  		vbios->low_voltage_max_dispclk =3D bw_in=
t_to_fixed(460);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2653  		vbios->mid_voltage_max_dispclk =3D bw_in=
t_to_fixed(670);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2654  		vbios->high_voltage_max_dispclk =3D bw_i=
nt_to_fixed(1133);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2655  		vbios->low_voltage_max_phyclk =3D bw_int=
_to_fixed(540);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2656  		vbios->mid_voltage_max_phyclk =3D bw_int=
_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2657  		vbios->high_voltage_max_phyclk =3D bw_in=
t_to_fixed(810);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2658  		vbios->data_return_bus_width =3D bw_int_=
to_fixed(32);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2659  		vbios->trc =3D bw_int_to_fixed(48);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2660  		vbios->dmifmc_urgent_latency =3D bw_int_=
to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2661  		vbios->stutter_self_refresh_exit_latency=
 =3D bw_frc_to_fixed(75, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2662  		vbios->stutter_self_refresh_entry_latenc=
y =3D bw_frc_to_fixed(19, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2663  		vbios->nbp_state_change_latency =3D bw_i=
nt_to_fixed(39);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2664  		vbios->mcifwrmc_urgent_latency =3D bw_in=
t_to_fixed(10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2665  		vbios->scatter_gather_enable =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2666  		vbios->down_spread_percentage =3D bw_frc=
_to_fixed(5, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2667  		vbios->cursor_width =3D 32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2668  		vbios->average_compression_rate =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2669  		vbios->number_of_request_slots_gmc_reser=
ves_for_dmif_per_channel =3D 8;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2670  		vbios->blackout_duration =3D bw_int_to_f=
ixed(0); /* us */
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2671  		vbios->maximum_blackout_recovery_time =
=3D bw_int_to_fixed(0);
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2672  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2673  		dceip->max_average_percent_of_ideal_port=
_bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2674  		dceip->max_average_percent_of_ideal_dram=
bw_display_can_use_in_normal_system_operation =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2675  		dceip->percent_of_ideal_port_bw_received=
_after_urgent_latency =3D 100;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2676  		dceip->large_cursor =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2677  		dceip->dmif_request_buffer_size =3D bw_i=
nt_to_fixed(2304);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2678  		dceip->dmif_pipe_en_fbc_chunk_tracker =
=3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2679  		dceip->cursor_max_outstanding_group_num =
=3D 1;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2680  		dceip->lines_interleaved_into_lb =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2681  		dceip->chunk_width =3D 256;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2682  		dceip->number_of_graphics_pipes =3D 6;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2683  		dceip->number_of_underlay_pipes =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2684  		dceip->low_power_tiling_mode =3D 0;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2685  		dceip->display_write_back_supported =3D =
true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2686  		dceip->argb_compression_support =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2687  		dceip->underlay_vscaler_efficiency6_bit_=
per_component =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2688  			bw_frc_to_fixed(35556, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2689  		dceip->underlay_vscaler_efficiency8_bit_=
per_component =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2690  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2691  		dceip->underlay_vscaler_efficiency10_bit=
_per_component =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2692  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2693  		dceip->underlay_vscaler_efficiency12_bit=
_per_component =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2694  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2695  		dceip->graphics_vscaler_efficiency6_bit_=
per_component =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2696  			bw_frc_to_fixed(35, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2697  		dceip->graphics_vscaler_efficiency8_bit_=
per_component =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2698  			bw_frc_to_fixed(34286, 10000);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2699  		dceip->graphics_vscaler_efficiency10_bit=
_per_component =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2700  			bw_frc_to_fixed(32, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2701  		dceip->graphics_vscaler_efficiency12_bit=
_per_component =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2702  			bw_int_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2703  		dceip->alpha_vscaler_efficiency =3D bw_i=
nt_to_fixed(3);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2704  		dceip->max_dmif_buffer_allocated =3D 4;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2705  		dceip->graphics_dmif_size =3D 24576;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2706  		dceip->underlay_luma_dmif_size =3D 19456;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2707  		dceip->underlay_chroma_dmif_size =3D 235=
52;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2708  		dceip->pre_downscaler_enabled =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2709  		dceip->underlay_downscale_prefetch_enabl=
ed =3D false;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2710  		dceip->lb_write_pixels_per_dispclk =3D b=
w_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2711  		dceip->lb_size_per_component444 =3D bw_i=
nt_to_fixed(245952);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2712  		dceip->graphics_lb_nodownscaling_multi_l=
ine_prefetching =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2713  		dceip->stutter_and_dram_clock_state_chan=
ge_gated_before_cursor =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2714  			bw_int_to_fixed(1);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2715  		dceip->underlay420_luma_lb_size_per_comp=
onent =3D bw_int_to_fixed(
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2716  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2717  		dceip->underlay420_chroma_lb_size_per_co=
mponent =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2718  			bw_int_to_fixed(164352);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2719  		dceip->underlay422_lb_size_per_component=
 =3D bw_int_to_fixed(
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2720  			82176);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2721  		dceip->cursor_chunk_width =3D bw_int_to_=
fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2722  		dceip->cursor_dcp_buffer_lines =3D bw_in=
t_to_fixed(4);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2723  		dceip->underlay_maximum_width_efficient_=
for_tiling =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2724  			bw_int_to_fixed(1920);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2725  		dceip->underlay_maximum_height_efficient=
_for_tiling =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2726  			bw_int_to_fixed(1080);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2727  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_multiple_displays_or_single_rotated_display =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2728  			bw_frc_to_fixed(3, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2729  		dceip->peak_pte_request_to_eviction_rati=
o_limiting_single_display_no_rotation =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2730  			bw_int_to_fixed(25);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2731  		dceip->minimum_outstanding_pte_request_l=
imit =3D bw_int_to_fixed(
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2732  			2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2733  		dceip->maximum_total_outstanding_pte_req=
uests_allowed_by_saw =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2734  			bw_int_to_fixed(128);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2735  		dceip->limit_excessive_outstanding_dmif_=
requests =3D true;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2736  		dceip->linear_mode_line_request_alternat=
ion_slice =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2737  			bw_int_to_fixed(64);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2738  		dceip->scatter_gather_lines_of_pte_prefe=
tching_in_linear_mode =3D
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2739  			32;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2740  		dceip->display_write_back420_luma_mcifwr=
_buffer_size =3D 12288;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2741  		dceip->display_write_back420_chroma_mcif=
wr_buffer_size =3D 8192;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2742  		dceip->request_efficiency =3D bw_frc_to_=
fixed(8, 10);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2743  		dceip->dispclk_per_request =3D bw_int_to=
_fixed(2);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2744  		dceip->dispclk_ramping_factor =3D bw_frc=
_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2745  		dceip->display_pipe_throughput_factor =
=3D bw_frc_to_fixed(105, 100);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2746  		dceip->scatter_gather_pte_request_rows_i=
n_tiling_mode =3D 2;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2747  		dceip->mcifwr_all_surfaces_burst_time =
=3D bw_int_to_fixed(0);
2c8ad2d5a20c8b drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Alex =
Deucher        2017-06-15  2748  		break;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2749  	default:
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2750  		break;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2751  	}
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2752  	*bw_dceip =3D *dceip;
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2753  	*bw_vbios =3D *vbios;
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2754  =

12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2755  	kfree(dceip);
12f826c4dc0ee5 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c       Lee J=
ones           2021-01-08  2756  	kfree(vbios);
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2757  }
4562236b3bc0a2 drivers/gpu/drm/amd/display/dc/calcs/bandwidth_calcs.c Harry=
 Wentland      2017-09-12  2758  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4839022181426389666==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4839022181426389666==--

