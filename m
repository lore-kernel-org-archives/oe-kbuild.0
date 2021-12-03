Content-Type: multipart/mixed; boundary="===============4225344596475693237=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pinchartl-media:drm/du/v3u/sn65dsi86 7/11] drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:223 rcar_mipi_dsi_parameters_calc() error: buffer overflow 'hsfreqrange_table' 64 <= 64
Date: Fri, 03 Dec 2021 16:52:09 +0800
Message-ID: <202112031631.Op5iw0OJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4225344596475693237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: LUU HOAI <hoai.luu.ub@renesas.com>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

tree:   git://linuxtv.org/pinchartl/media.git drm/du/v3u/sn65dsi86
head:   b24450a25b8c342e517f8c5804755b060cd6e7dc
commit: 9315788ce032979d6b3affb603891ec69090be72 [7/11] drm: rcar-du: Add R=
-Car DSI driver
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: nios2-randconfig-m031-20211203 (https://download.01.org/0day-ci/arc=
hive/20211203/202112031631.Op5iw0OJ-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:223 rcar_mipi_dsi_parameters_calc()=
 error: buffer overflow 'hsfreqrange_table' 64 <=3D 64

Old smatch warnings:
drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:224 rcar_mipi_dsi_parameters_calc()=
 error: buffer overflow 'hsfreqrange_table' 64 <=3D 64

vim +/hsfreqrange_table +223 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c

9315788ce03297 LUU HOAI 2020-02-25  183  =

9315788ce03297 LUU HOAI 2020-02-25  184  	const struct vco_cntrl_value *vco=
_cntrl;
9315788ce03297 LUU HOAI 2020-02-25  185  	unsigned long fout_target;
9315788ce03297 LUU HOAI 2020-02-25  186  	unsigned long fin, fout;
9315788ce03297 LUU HOAI 2020-02-25  187  	unsigned long hsfreq;
9315788ce03297 LUU HOAI 2020-02-25  188  	unsigned int best_err =3D -1;
9315788ce03297 LUU HOAI 2020-02-25  189  	unsigned int divider;
9315788ce03297 LUU HOAI 2020-02-25  190  	unsigned int n;
9315788ce03297 LUU HOAI 2020-02-25  191  	unsigned int i;
9315788ce03297 LUU HOAI 2020-02-25  192  	unsigned int err;
9315788ce03297 LUU HOAI 2020-02-25  193  =

9315788ce03297 LUU HOAI 2020-02-25  194  	/*
9315788ce03297 LUU HOAI 2020-02-25  195  	 * Calculate Fout =3D dot clock *=
 ColorDepth / (2 * Lane Count)
9315788ce03297 LUU HOAI 2020-02-25  196  	 * The range out Fout is [40 - 12=
50] Mhz
9315788ce03297 LUU HOAI 2020-02-25  197  	 */
9315788ce03297 LUU HOAI 2020-02-25  198  	fout_target =3D target * mipi_dsi=
_pixel_format_to_bpp(dsi->format)
9315788ce03297 LUU HOAI 2020-02-25  199  		    / (2 * dsi->lanes);
9315788ce03297 LUU HOAI 2020-02-25  200  	if (fout_target < 40000000 || fou=
t_target > 1250000000)
9315788ce03297 LUU HOAI 2020-02-25  201  		return;
9315788ce03297 LUU HOAI 2020-02-25  202  =

9315788ce03297 LUU HOAI 2020-02-25  203  	/* Find vco_cntrl */
9315788ce03297 LUU HOAI 2020-02-25  204  	for (vco_cntrl =3D vco_cntrl_tabl=
e; vco_cntrl->min_freq !=3D 0; vco_cntrl++) {
9315788ce03297 LUU HOAI 2020-02-25  205  		if (fout_target > vco_cntrl->min=
_freq &&
9315788ce03297 LUU HOAI 2020-02-25  206  		    fout_target <=3D vco_cntrl->=
max_freq) {
9315788ce03297 LUU HOAI 2020-02-25  207  			setup_info->vco_cntrl =3D vco_c=
ntrl->value;
9315788ce03297 LUU HOAI 2020-02-25  208  			if (fout_target >=3D 1150000000)
9315788ce03297 LUU HOAI 2020-02-25  209  				setup_info->prop_cntrl =3D 0x0=
c;
9315788ce03297 LUU HOAI 2020-02-25  210  			else
9315788ce03297 LUU HOAI 2020-02-25  211  				setup_info->prop_cntrl =3D 0x0=
b;
9315788ce03297 LUU HOAI 2020-02-25  212  			break;
9315788ce03297 LUU HOAI 2020-02-25  213  		}
9315788ce03297 LUU HOAI 2020-02-25  214  	}
9315788ce03297 LUU HOAI 2020-02-25  215  =

9315788ce03297 LUU HOAI 2020-02-25  216  	/* Add divider */
9315788ce03297 LUU HOAI 2020-02-25  217  	setup_info->div =3D (setup_info->=
vco_cntrl & 0x30) >> 4;
9315788ce03297 LUU HOAI 2020-02-25  218  =

9315788ce03297 LUU HOAI 2020-02-25  219  	/* Find hsfreqrange */
9315788ce03297 LUU HOAI 2020-02-25  220  	hsfreq =3D fout_target * 2;
9315788ce03297 LUU HOAI 2020-02-25  221  	for (i =3D 0; i < ARRAY_SIZE(hsfr=
eqrange_table); i++) {
9315788ce03297 LUU HOAI 2020-02-25  222  		if (hsfreq > hsfreqrange_table[i=
][0] &&
9315788ce03297 LUU HOAI 2020-02-25 @223  			hsfreq <=3D hsfreqrange_table[i=
+1][0]) {
9315788ce03297 LUU HOAI 2020-02-25  224  			setup_info->hsfreqrange =3D hsf=
reqrange_table[i+1][1];
9315788ce03297 LUU HOAI 2020-02-25  225  			break;
9315788ce03297 LUU HOAI 2020-02-25  226  		}
9315788ce03297 LUU HOAI 2020-02-25  227  	}
9315788ce03297 LUU HOAI 2020-02-25  228  =

9315788ce03297 LUU HOAI 2020-02-25  229  	/*
9315788ce03297 LUU HOAI 2020-02-25  230  	 * Calculate n and m for PLL clock
9315788ce03297 LUU HOAI 2020-02-25  231  	 * Following the HW manual the ra=
nges of n and m are
9315788ce03297 LUU HOAI 2020-02-25  232  	 * n =3D [3-8] and m =3D [64-625]
9315788ce03297 LUU HOAI 2020-02-25  233  	 */
9315788ce03297 LUU HOAI 2020-02-25  234  	fin =3D clk_get_rate(clk);
9315788ce03297 LUU HOAI 2020-02-25  235  	divider =3D 1 << setup_info->div;
9315788ce03297 LUU HOAI 2020-02-25  236  	for (n =3D 3; n < 9; n++) {
9315788ce03297 LUU HOAI 2020-02-25  237  		unsigned long fpfd;
9315788ce03297 LUU HOAI 2020-02-25  238  		unsigned int m;
9315788ce03297 LUU HOAI 2020-02-25  239  =

9315788ce03297 LUU HOAI 2020-02-25  240  		fpfd =3D fin / n;
9315788ce03297 LUU HOAI 2020-02-25  241  =

9315788ce03297 LUU HOAI 2020-02-25  242  		for (m =3D 64; m < 626; m++) {
9315788ce03297 LUU HOAI 2020-02-25  243  			fout =3D fpfd * m / divider;
9315788ce03297 LUU HOAI 2020-02-25  244  			err =3D abs((long)(fout - fout_=
target) * 10000 /
9315788ce03297 LUU HOAI 2020-02-25  245  				  (long)fout_target);
9315788ce03297 LUU HOAI 2020-02-25  246  			if (err < best_err) {
9315788ce03297 LUU HOAI 2020-02-25  247  				setup_info->m =3D m - 2;
9315788ce03297 LUU HOAI 2020-02-25  248  				setup_info->n =3D n - 1;
9315788ce03297 LUU HOAI 2020-02-25  249  				setup_info->fout =3D fout;
9315788ce03297 LUU HOAI 2020-02-25  250  				best_err =3D err;
9315788ce03297 LUU HOAI 2020-02-25  251  				if (err =3D=3D 0)
9315788ce03297 LUU HOAI 2020-02-25  252  					goto done;
9315788ce03297 LUU HOAI 2020-02-25  253  			}
9315788ce03297 LUU HOAI 2020-02-25  254  		}
9315788ce03297 LUU HOAI 2020-02-25  255  	}
9315788ce03297 LUU HOAI 2020-02-25  256  =

9315788ce03297 LUU HOAI 2020-02-25  257  done:
9315788ce03297 LUU HOAI 2020-02-25  258  	dev_dbg(dsi->dev,
9315788ce03297 LUU HOAI 2020-02-25  259  		"%pC %lu Hz -> Fout %lu Hz (targ=
et %lu Hz, error %d.%02u%%), PLL M/N/DIV %u/%u/%u\n",
9315788ce03297 LUU HOAI 2020-02-25  260  		clk, fin, setup_info->fout, fout=
_target, best_err / 100,
9315788ce03297 LUU HOAI 2020-02-25  261  		best_err % 100, setup_info->m, s=
etup_info->n, setup_info->div);
9315788ce03297 LUU HOAI 2020-02-25  262  	dev_dbg(dsi->dev,
9315788ce03297 LUU HOAI 2020-02-25  263  		"vco_cntrl =3D 0x%x\tprop_cntrl =
=3D 0x%x\thsfreqrange =3D 0x%x\n",
9315788ce03297 LUU HOAI 2020-02-25  264  		setup_info->vco_cntrl, setup_inf=
o->prop_cntrl,
9315788ce03297 LUU HOAI 2020-02-25  265  		setup_info->hsfreqrange);
9315788ce03297 LUU HOAI 2020-02-25  266  }
9315788ce03297 LUU HOAI 2020-02-25  267  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4225344596475693237==--

