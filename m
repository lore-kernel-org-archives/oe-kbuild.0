Content-Type: multipart/mixed; boundary="===============3519778103888596497=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:for-linux-next 1/7] drivers/gpu/drm/ast/ast_mode.c:1019 ast_crtc_dpms() warn: ignoring unreachable code.
Date: Wed, 04 May 2022 17:55:04 +0800
Message-ID: <202205041752.s96JbPPp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3519778103888596497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   d7442505de9259f8b975232470378d399c25b2fa
commit: 594e9c04b5864b4b8b151ef4ba9521c59e0f5c54 [1/7] drm/ast: Create the =
driver for ASPEED proprietory Display-Port
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: ia64-randconfig-m031-20220501 (https://download.01.org/0day-ci/arch=
ive/20220504/202205041752.s96JbPPp-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/ast/ast_mode.c:1019 ast_crtc_dpms() warn: ignoring unreacha=
ble code.

vim +1019 drivers/gpu/drm/ast/ast_mode.c

616048af6dde5c Thomas Zimmermann 2021-02-09   983  =

a6ff807b71e3ff Thomas Zimmermann 2019-11-07   984  /*
a6ff807b71e3ff Thomas Zimmermann 2019-11-07   985   * CRTC
a6ff807b71e3ff Thomas Zimmermann 2019-11-07   986   */
a6ff807b71e3ff Thomas Zimmermann 2019-11-07   987  =

312fec1405dd54 Dave Airlie       2012-02-29   988  static void ast_crtc_dpm=
s(struct drm_crtc *crtc, int mode)
312fec1405dd54 Dave Airlie       2012-02-29   989  {
fa7dbd7688849d Thomas Zimmermann 2020-06-17   990  	struct ast_private *ast=
 =3D to_ast_private(crtc->dev);
594e9c04b5864b KuoHsiang Chou    2022-04-28   991  	u8 ch =3D AST_DPMS_VSYN=
C_OFF | AST_DPMS_HSYNC_OFF;
312fec1405dd54 Dave Airlie       2012-02-29   992  =

2fbeec03e17165 Thomas Zimmermann 2019-12-02   993  	/* TODO: Maybe control =
display signal generation with
2fbeec03e17165 Thomas Zimmermann 2019-12-02   994  	 *       Sync Enable (b=
it CR17.7).
2fbeec03e17165 Thomas Zimmermann 2019-12-02   995  	 */
312fec1405dd54 Dave Airlie       2012-02-29   996  	switch (mode) {
312fec1405dd54 Dave Airlie       2012-02-29   997  	case DRM_MODE_DPMS_ON:
594e9c04b5864b KuoHsiang Chou    2022-04-28   998  		ast_set_index_reg_mask=
(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0);
594e9c04b5864b KuoHsiang Chou    2022-04-28   999  		ast_set_index_reg_mask=
(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
83c6620bae3f14 Dave Airlie       2014-03-28  1000  		if (ast->tx_chip_type =
=3D=3D AST_TX_DP501)
83c6620bae3f14 Dave Airlie       2014-03-28  1001  			ast_set_dp501_video_o=
utput(crtc->dev, 1);
594e9c04b5864b KuoHsiang Chou    2022-04-28  1002  =

594e9c04b5864b KuoHsiang Chou    2022-04-28  1003  		if (ast->tx_chip_type =
=3D=3D AST_TX_ASTDP) {
594e9c04b5864b KuoHsiang Chou    2022-04-28  1004  			ast_dp_power_on_off(c=
rtc->dev, AST_DP_POWER_ON);
594e9c04b5864b KuoHsiang Chou    2022-04-28  1005  			ast_wait_for_vretrace=
(ast);
594e9c04b5864b KuoHsiang Chou    2022-04-28  1006  			ast_dp_set_on_off(crt=
c->dev, 1);
594e9c04b5864b KuoHsiang Chou    2022-04-28  1007  		}
594e9c04b5864b KuoHsiang Chou    2022-04-28  1008  =

594e9c04b5864b KuoHsiang Chou    2022-04-28  1009  		ast_crtc_load_lut(ast,=
 crtc);
312fec1405dd54 Dave Airlie       2012-02-29  1010  		break;
594e9c04b5864b KuoHsiang Chou    2022-04-28  1011  	case DRM_MODE_DPMS_STAN=
DBY:
594e9c04b5864b KuoHsiang Chou    2022-04-28  1012  	case DRM_MODE_DPMS_SUSP=
END:
312fec1405dd54 Dave Airlie       2012-02-29  1013  	case DRM_MODE_DPMS_OFF:
594e9c04b5864b KuoHsiang Chou    2022-04-28  1014  		ch =3D mode;
83c6620bae3f14 Dave Airlie       2014-03-28  1015  		if (ast->tx_chip_type =
=3D=3D AST_TX_DP501)
83c6620bae3f14 Dave Airlie       2014-03-28  1016  			ast_set_dp501_video_o=
utput(crtc->dev, 0);
312fec1405dd54 Dave Airlie       2012-02-29  1017  		break;
594e9c04b5864b KuoHsiang Chou    2022-04-28  1018  =

594e9c04b5864b KuoHsiang Chou    2022-04-28 @1019  		if (ast->tx_chip_type =
=3D=3D AST_TX_ASTDP) {
594e9c04b5864b KuoHsiang Chou    2022-04-28  1020  			ast_dp_set_on_off(crt=
c->dev, 0);
594e9c04b5864b KuoHsiang Chou    2022-04-28  1021  			ast_dp_power_on_off(c=
rtc->dev, AST_DP_POWER_OFF);
594e9c04b5864b KuoHsiang Chou    2022-04-28  1022  		}
594e9c04b5864b KuoHsiang Chou    2022-04-28  1023  =

594e9c04b5864b KuoHsiang Chou    2022-04-28  1024  		ast_set_index_reg_mask=
(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0x20);
594e9c04b5864b KuoHsiang Chou    2022-04-28  1025  		ast_set_index_reg_mask=
(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, ch);
312fec1405dd54 Dave Airlie       2012-02-29  1026  	}
312fec1405dd54 Dave Airlie       2012-02-29  1027  }
312fec1405dd54 Dave Airlie       2012-02-29  1028  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3519778103888596497==--

