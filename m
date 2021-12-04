Content-Type: multipart/mixed; boundary="===============4794182602369161677=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] drm/ast: Handle failed I2C initialization gracefully
Date: Sat, 04 Dec 2021 21:45:38 +0800
Message-ID: <202112042126.N4Qr3RiC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4794182602369161677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211201153100.403-2-tzimmermann@suse.de>
References: <20211201153100.403-2-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: airlied(a)redhat.com
TO: daniel(a)ffwll.ch
TO: sam(a)ravnborg.org
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: dri-devel(a)lists.freedesktop.org

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 6a8f90ec433e2f5de5fc16d7a4839771b7027cc0]

url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/ast-Fix-=
I2C-corner-cases-wrt-init-cleanup/20211201-233308
base:   6a8f90ec433e2f5de5fc16d7a4839771b7027cc0
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20211203 (https://download.01.org/0day-ci/arch=
ive/20211204/202112042126.N4Qr3RiC-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/ast/ast_mode.c:1231 ast_get_modes() error: uninitialized sy=
mbol 'edid'.
drivers/gpu/drm/ast/ast_mode.c:1232 ast_get_modes() warn: passing freed mem=
ory 'edid'

vim +/edid +1231 drivers/gpu/drm/ast/ast_mode.c

312fec1405dd54 Dave Airlie       2012-02-29  1204  =

4961eb60f14553 Thomas Zimmermann 2019-11-07  1205  /*
4961eb60f14553 Thomas Zimmermann 2019-11-07  1206   * Connector
4961eb60f14553 Thomas Zimmermann 2019-11-07  1207   */
4961eb60f14553 Thomas Zimmermann 2019-11-07  1208  =

312fec1405dd54 Dave Airlie       2012-02-29  1209  static int ast_get_modes=
(struct drm_connector *connector)
312fec1405dd54 Dave Airlie       2012-02-29  1210  {
312fec1405dd54 Dave Airlie       2012-02-29  1211  	struct ast_connector *a=
st_connector =3D to_ast_connector(connector);
fa7dbd7688849d Thomas Zimmermann 2020-06-17  1212  	struct ast_private *ast=
 =3D to_ast_private(connector->dev);
312fec1405dd54 Dave Airlie       2012-02-29  1213  	struct edid *edid;
312fec1405dd54 Dave Airlie       2012-02-29  1214  	int ret;
83c6620bae3f14 Dave Airlie       2014-03-28  1215  	bool flags =3D false;
6c9bd4432b2527 Gregory Williams  2021-07-30  1216  =

83c6620bae3f14 Dave Airlie       2014-03-28  1217  	if (ast->tx_chip_type =
=3D=3D AST_TX_DP501) {
83c6620bae3f14 Dave Airlie       2014-03-28  1218  		ast->dp501_maxclk =3D =
0xff;
83c6620bae3f14 Dave Airlie       2014-03-28  1219  		edid =3D kmalloc(128, =
GFP_KERNEL);
83c6620bae3f14 Dave Airlie       2014-03-28  1220  		if (!edid)
83c6620bae3f14 Dave Airlie       2014-03-28  1221  			return -ENOMEM;
312fec1405dd54 Dave Airlie       2012-02-29  1222  =

83c6620bae3f14 Dave Airlie       2014-03-28  1223  		flags =3D ast_dp501_re=
ad_edid(connector->dev, (u8 *)edid);
83c6620bae3f14 Dave Airlie       2014-03-28  1224  		if (flags)
83c6620bae3f14 Dave Airlie       2014-03-28  1225  			ast->dp501_maxclk =3D=
 ast_get_dp501_max_clk(connector->dev);
83c6620bae3f14 Dave Airlie       2014-03-28  1226  		else
83c6620bae3f14 Dave Airlie       2014-03-28  1227  			kfree(edid);
83c6620bae3f14 Dave Airlie       2014-03-28  1228  	}
75bd8f71712a8a Thomas Zimmermann 2021-12-01  1229  	if (!flags && ast_conne=
ctor->i2c)
312fec1405dd54 Dave Airlie       2012-02-29  1230  		edid =3D drm_get_edid(=
connector, &ast_connector->i2c->adapter);
312fec1405dd54 Dave Airlie       2012-02-29 @1231  	if (edid) {
c555f02371c338 Daniel Vetter     2018-07-09 @1232  		drm_connector_update_e=
did_property(&ast_connector->base, edid);
312fec1405dd54 Dave Airlie       2012-02-29  1233  		ret =3D drm_add_edid_m=
odes(connector, edid);
993dcb05e47e35 Jani Nikula       2012-08-15  1234  		kfree(edid);
312fec1405dd54 Dave Airlie       2012-02-29  1235  		return ret;
6c9bd4432b2527 Gregory Williams  2021-07-30  1236  	}
c555f02371c338 Daniel Vetter     2018-07-09  1237  	drm_connector_update_ed=
id_property(&ast_connector->base, NULL);
312fec1405dd54 Dave Airlie       2012-02-29  1238  	return 0;
312fec1405dd54 Dave Airlie       2012-02-29  1239  }
312fec1405dd54 Dave Airlie       2012-02-29  1240  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4794182602369161677==--

