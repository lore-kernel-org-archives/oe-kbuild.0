Content-Type: multipart/mixed; boundary="===============3039343787651848691=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/dsi/dsi_host.c:898:43: warning: Possible null pointer dereference: phy_shared_timings [nullPointer]
Date: Sat, 29 Jan 2022 05:02:48 +0800
Message-ID: <202201290155.oR0pqKTH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3039343787651848691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   145d9b498fc827b79c1260b4caa29a8e59d4c2b9
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/msm/dsi/dsi_host.c:898:43: warning: Possible null pointe=
r dereference: phy_shared_timings [nullPointer]
    data =3D DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(phy_shared_timings->clk_post=
) |
                                             ^
   drivers/gpu/drm/msm/dsi/dsi_host.c:2442:35: note: Calling function 'dsi_=
ctrl_config', 3rd argument 'NULL' value is 0
    dsi_ctrl_config(msm_host, false, NULL, NULL);
                                     ^
   drivers/gpu/drm/msm/dsi/dsi_host.c:898:43: note: Null pointer dereference
    data =3D DSI_CLKOUT_TIMING_CTRL_T_CLK_POST(phy_shared_timings->clk_post=
) |
                                             ^
   drivers/gpu/drm/msm/dsi/dsi_host.c:899:36: warning: Possible null pointe=
r dereference: phy_shared_timings [nullPointer]
     DSI_CLKOUT_TIMING_CTRL_T_CLK_PRE(phy_shared_timings->clk_pre);
                                      ^
   drivers/gpu/drm/msm/dsi/dsi_host.c:2442:35: note: Calling function 'dsi_=
ctrl_config', 3rd argument 'NULL' value is 0
    dsi_ctrl_config(msm_host, false, NULL, NULL);
                                     ^
   drivers/gpu/drm/msm/dsi/dsi_host.c:899:36: note: Null pointer dereference
     DSI_CLKOUT_TIMING_CTRL_T_CLK_PRE(phy_shared_timings->clk_pre);
                                      ^

vim +898 drivers/gpu/drm/msm/dsi/dsi_host.c

a689554ba6ed81 Hai Li           2015-03-31  833  =

a689554ba6ed81 Hai Li           2015-03-31  834  static void dsi_ctrl_confi=
g(struct msm_dsi_host *msm_host, bool enable,
858c595a3f5d66 Dmitry Baryshkov 2021-08-05  835  			struct msm_dsi_phy_shar=
ed_timings *phy_shared_timings, struct msm_dsi_phy *phy)
a689554ba6ed81 Hai Li           2015-03-31  836  {
a689554ba6ed81 Hai Li           2015-03-31  837  	u32 flags =3D msm_host->m=
ode_flags;
a689554ba6ed81 Hai Li           2015-03-31  838  	enum mipi_dsi_pixel_forma=
t mipi_fmt =3D msm_host->format;
d248b61f611463 Hai Li           2015-08-13  839  	const struct msm_dsi_cfg_=
handler *cfg_hnd =3D msm_host->cfg_hnd;
e3ff68812384dd Harigovindan P   2020-01-07  840  	u32 data =3D 0, lane_ctrl=
 =3D 0;
a689554ba6ed81 Hai Li           2015-03-31  841  =

a689554ba6ed81 Hai Li           2015-03-31  842  	if (!enable) {
a689554ba6ed81 Hai Li           2015-03-31  843  		dsi_write(msm_host, REG_=
DSI_CTRL, 0);
a689554ba6ed81 Hai Li           2015-03-31  844  		return;
a689554ba6ed81 Hai Li           2015-03-31  845  	}
a689554ba6ed81 Hai Li           2015-03-31  846  =

a689554ba6ed81 Hai Li           2015-03-31  847  	if (flags & MIPI_DSI_MODE=
_VIDEO) {
a689554ba6ed81 Hai Li           2015-03-31  848  		if (flags & MIPI_DSI_MOD=
E_VIDEO_HSE)
a689554ba6ed81 Hai Li           2015-03-31  849  			data |=3D DSI_VID_CFG0_=
PULSE_MODE_HSA_HE;
0f3b68b66a6deb Nicolas Boichat  2021-07-27  850  		if (flags & MIPI_DSI_MOD=
E_VIDEO_NO_HFP)
a689554ba6ed81 Hai Li           2015-03-31  851  			data |=3D DSI_VID_CFG0_=
HFP_POWER_STOP;
0f3b68b66a6deb Nicolas Boichat  2021-07-27  852  		if (flags & MIPI_DSI_MOD=
E_VIDEO_NO_HBP)
a689554ba6ed81 Hai Li           2015-03-31  853  			data |=3D DSI_VID_CFG0_=
HBP_POWER_STOP;
0f3b68b66a6deb Nicolas Boichat  2021-07-27  854  		if (flags & MIPI_DSI_MOD=
E_VIDEO_NO_HSA)
a689554ba6ed81 Hai Li           2015-03-31  855  			data |=3D DSI_VID_CFG0_=
HSA_POWER_STOP;
a689554ba6ed81 Hai Li           2015-03-31  856  		/* Always set low power =
stop mode for BLLP
a689554ba6ed81 Hai Li           2015-03-31  857  		 * to let command engine=
 send packets
a689554ba6ed81 Hai Li           2015-03-31  858  		 */
a689554ba6ed81 Hai Li           2015-03-31  859  		data |=3D DSI_VID_CFG0_E=
OF_BLLP_POWER_STOP |
a689554ba6ed81 Hai Li           2015-03-31  860  			DSI_VID_CFG0_BLLP_POWER=
_STOP;
a689554ba6ed81 Hai Li           2015-03-31  861  		data |=3D DSI_VID_CFG0_T=
RAFFIC_MODE(dsi_get_traffic_mode(flags));
a689554ba6ed81 Hai Li           2015-03-31  862  		data |=3D DSI_VID_CFG0_D=
ST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
a689554ba6ed81 Hai Li           2015-03-31  863  		data |=3D DSI_VID_CFG0_V=
IRT_CHANNEL(msm_host->channel);
a689554ba6ed81 Hai Li           2015-03-31  864  		dsi_write(msm_host, REG_=
DSI_VID_CFG0, data);
a689554ba6ed81 Hai Li           2015-03-31  865  =

a689554ba6ed81 Hai Li           2015-03-31  866  		/* Do not swap RGB color=
s */
a689554ba6ed81 Hai Li           2015-03-31  867  		data =3D DSI_VID_CFG1_RG=
B_SWAP(SWAP_RGB);
a689554ba6ed81 Hai Li           2015-03-31  868  		dsi_write(msm_host, REG_=
DSI_VID_CFG1, 0);
a689554ba6ed81 Hai Li           2015-03-31  869  	} else {
a689554ba6ed81 Hai Li           2015-03-31  870  		/* Do not swap RGB color=
s */
a689554ba6ed81 Hai Li           2015-03-31  871  		data =3D DSI_CMD_CFG0_RG=
B_SWAP(SWAP_RGB);
a689554ba6ed81 Hai Li           2015-03-31  872  		data |=3D DSI_CMD_CFG0_D=
ST_FORMAT(dsi_get_cmd_fmt(mipi_fmt));
a689554ba6ed81 Hai Li           2015-03-31  873  		dsi_write(msm_host, REG_=
DSI_CMD_CFG0, data);
a689554ba6ed81 Hai Li           2015-03-31  874  =

a689554ba6ed81 Hai Li           2015-03-31  875  		data =3D DSI_CMD_CFG1_WR=
_MEM_START(MIPI_DCS_WRITE_MEMORY_START) |
a689554ba6ed81 Hai Li           2015-03-31  876  			DSI_CMD_CFG1_WR_MEM_CON=
TINUE(
a689554ba6ed81 Hai Li           2015-03-31  877  					MIPI_DCS_WRITE_MEMORY=
_CONTINUE);
a689554ba6ed81 Hai Li           2015-03-31  878  		/* Always insert DCS com=
mand */
a689554ba6ed81 Hai Li           2015-03-31  879  		data |=3D DSI_CMD_CFG1_I=
NSERT_DCS_COMMAND;
a689554ba6ed81 Hai Li           2015-03-31  880  		dsi_write(msm_host, REG_=
DSI_CMD_CFG1, data);
a689554ba6ed81 Hai Li           2015-03-31  881  	}
a689554ba6ed81 Hai Li           2015-03-31  882  =

a689554ba6ed81 Hai Li           2015-03-31  883  	dsi_write(msm_host, REG_D=
SI_CMD_DMA_CTRL,
a689554ba6ed81 Hai Li           2015-03-31  884  			DSI_CMD_DMA_CTRL_FROM_F=
RAME_BUFFER |
a689554ba6ed81 Hai Li           2015-03-31  885  			DSI_CMD_DMA_CTRL_LOW_PO=
WER);
a689554ba6ed81 Hai Li           2015-03-31  886  =

a689554ba6ed81 Hai Li           2015-03-31  887  	data =3D 0;
a689554ba6ed81 Hai Li           2015-03-31  888  	/* Always assume dedicate=
d TE pin */
a689554ba6ed81 Hai Li           2015-03-31  889  	data |=3D DSI_TRIG_CTRL_T=
E;
a689554ba6ed81 Hai Li           2015-03-31  890  	data |=3D DSI_TRIG_CTRL_M=
DP_TRIGGER(TRIGGER_NONE);
a689554ba6ed81 Hai Li           2015-03-31  891  	data |=3D DSI_TRIG_CTRL_D=
MA_TRIGGER(TRIGGER_SW);
a689554ba6ed81 Hai Li           2015-03-31  892  	data |=3D DSI_TRIG_CTRL_S=
TREAM(msm_host->channel);
d248b61f611463 Hai Li           2015-08-13  893  	if ((cfg_hnd->major =3D=
=3D MSM_DSI_VER_MAJOR_6G) &&
d248b61f611463 Hai Li           2015-08-13  894  		(cfg_hnd->minor >=3D MSM=
_DSI_6G_VER_MINOR_V1_2))
a689554ba6ed81 Hai Li           2015-03-31  895  		data |=3D DSI_TRIG_CTRL_=
BLOCK_DMA_WITHIN_FRAME;
a689554ba6ed81 Hai Li           2015-03-31  896  	dsi_write(msm_host, REG_D=
SI_TRIG_CTRL, data);
a689554ba6ed81 Hai Li           2015-03-31  897  =

dceac340155b66 Hai Li           2016-09-15 @898  	data =3D DSI_CLKOUT_TIMIN=
G_CTRL_T_CLK_POST(phy_shared_timings->clk_post) |
dceac340155b66 Hai Li           2016-09-15  899  		DSI_CLKOUT_TIMING_CTRL_T=
_CLK_PRE(phy_shared_timings->clk_pre);
a689554ba6ed81 Hai Li           2015-03-31  900  	dsi_write(msm_host, REG_D=
SI_CLKOUT_TIMING_CTRL, data);
a689554ba6ed81 Hai Li           2015-03-31  901  =

dceac340155b66 Hai Li           2016-09-15  902  	if ((cfg_hnd->major =3D=
=3D MSM_DSI_VER_MAJOR_6G) &&
dceac340155b66 Hai Li           2016-09-15  903  	    (cfg_hnd->minor > MSM=
_DSI_6G_VER_MINOR_V1_0) &&
dceac340155b66 Hai Li           2016-09-15  904  	    phy_shared_timings->c=
lk_pre_inc_by_2)
dceac340155b66 Hai Li           2016-09-15  905  		dsi_write(msm_host, REG_=
DSI_T_CLK_PRE_EXTEND,
dceac340155b66 Hai Li           2016-09-15  906  			  DSI_T_CLK_PRE_EXTEND_=
INC_BY_2_BYTECLK);
dceac340155b66 Hai Li           2016-09-15  907  =

a689554ba6ed81 Hai Li           2015-03-31  908  	data =3D 0;
0f3b68b66a6deb Nicolas Boichat  2021-07-27  909  	if (!(flags & MIPI_DSI_MO=
DE_NO_EOT_PACKET))
a689554ba6ed81 Hai Li           2015-03-31  910  		data |=3D DSI_EOT_PACKET=
_CTRL_TX_EOT_APPEND;
a689554ba6ed81 Hai Li           2015-03-31  911  	dsi_write(msm_host, REG_D=
SI_EOT_PACKET_CTRL, data);
a689554ba6ed81 Hai Li           2015-03-31  912  =

a689554ba6ed81 Hai Li           2015-03-31  913  	/* allow only ack-err-sta=
tus to generate interrupt */
a689554ba6ed81 Hai Li           2015-03-31  914  	dsi_write(msm_host, REG_D=
SI_ERR_INT_MASK0, 0x13ff3fe0);
a689554ba6ed81 Hai Li           2015-03-31  915  =

a689554ba6ed81 Hai Li           2015-03-31  916  	dsi_intr_ctrl(msm_host, D=
SI_IRQ_MASK_ERROR, 1);
a689554ba6ed81 Hai Li           2015-03-31  917  =

a689554ba6ed81 Hai Li           2015-03-31  918  	dsi_write(msm_host, REG_D=
SI_CLK_CTRL, DSI_CLK_CTRL_ENABLE_CLKS);
a689554ba6ed81 Hai Li           2015-03-31  919  =

a689554ba6ed81 Hai Li           2015-03-31  920  	data =3D DSI_CTRL_CLK_EN;
a689554ba6ed81 Hai Li           2015-03-31  921  =

a689554ba6ed81 Hai Li           2015-03-31  922  	DBG("lane number=3D%d", m=
sm_host->lanes);
26f7d1f4d9ab10 Archit Taneja    2016-02-25  923  	data |=3D ((DSI_CTRL_LANE=
0 << msm_host->lanes) - DSI_CTRL_LANE0);
26f7d1f4d9ab10 Archit Taneja    2016-02-25  924  =

a689554ba6ed81 Hai Li           2015-03-31  925  	dsi_write(msm_host, REG_D=
SI_LANE_SWAP_CTRL,
26f7d1f4d9ab10 Archit Taneja    2016-02-25  926  		  DSI_LANE_SWAP_CTRL_DLN=
_SWAP_SEL(msm_host->dlane_swap));
65c5e5426dfc47 Archit Taneja    2015-04-08  927  =

e3ff68812384dd Harigovindan P   2020-01-07  928  	if (!(flags & MIPI_DSI_CL=
OCK_NON_CONTINUOUS)) {
e3ff68812384dd Harigovindan P   2020-01-07  929  		lane_ctrl =3D dsi_read(m=
sm_host, REG_DSI_LANE_CTRL);
858c595a3f5d66 Dmitry Baryshkov 2021-08-05  930  =

858c595a3f5d66 Dmitry Baryshkov 2021-08-05  931  		if (msm_dsi_phy_set_cont=
inuous_clock(phy, enable))
858c595a3f5d66 Dmitry Baryshkov 2021-08-05  932  			lane_ctrl &=3D ~DSI_LAN=
E_CTRL_HS_REQ_SEL_PHY;
858c595a3f5d66 Dmitry Baryshkov 2021-08-05  933  =

65c5e5426dfc47 Archit Taneja    2015-04-08  934  		dsi_write(msm_host, REG_=
DSI_LANE_CTRL,
e3ff68812384dd Harigovindan P   2020-01-07  935  			lane_ctrl | DSI_LANE_CT=
RL_CLKLN_HS_FORCE_REQUEST);
e3ff68812384dd Harigovindan P   2020-01-07  936  	}
65c5e5426dfc47 Archit Taneja    2015-04-08  937  =

a689554ba6ed81 Hai Li           2015-03-31  938  	data |=3D DSI_CTRL_ENABLE;
a689554ba6ed81 Hai Li           2015-03-31  939  =

a689554ba6ed81 Hai Li           2015-03-31  940  	dsi_write(msm_host, REG_D=
SI_CTRL, data);
5ac178381d2652 Jonathan Marek   2021-06-17  941  =

5ac178381d2652 Jonathan Marek   2021-06-17  942  	if (msm_host->cphy_mode)
5ac178381d2652 Jonathan Marek   2021-06-17  943  		dsi_write(msm_host, REG_=
DSI_CPHY_MODE_CTRL, BIT(0));
a689554ba6ed81 Hai Li           2015-03-31  944  }
a689554ba6ed81 Hai Li           2015-03-31  945  =


:::::: The code at line 898 was first introduced by commit
:::::: dceac340155b66b6c97cb802b03d4778dd82e9be drm/msm/dsi: Return more ti=
mings from PHY to host

:::::: TO: Hai Li <hali@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3039343787651848691==--

