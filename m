Content-Type: multipart/mixed; boundary="===============7782604243382721056=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/omapdrm/omap_overlay.c:61 omap_hwoverlays_init() warn: passing a valid pointer to 'PTR_ERR'
Date: Tue, 03 May 2022 05:10:07 +0800
Message-ID: <202205030528.aHVgrTJJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7782604243382721056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Benoit Parrot <bparrot@ti.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Neil Armstrong <narmstrong@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: c8fa1e733c597a7b11a22a3e49de5ea1362e9a7a drm/omap: introduce omap_h=
w_overlay
date:   5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-m031-20220427 (https://download.01.org/0day-ci/archi=
ve/20220503/202205030528.aHVgrTJJ-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/omapdrm/omap_overlay.c:61 omap_hwoverlays_init() warn: pass=
ing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +61 drivers/gpu/drm/omapdrm/omap_overlay.c

c8fa1e733c597a Benoit Parrot 2021-11-17  44  =

c8fa1e733c597a Benoit Parrot 2021-11-17  45  int omap_hwoverlays_init(struc=
t omap_drm_private *priv)
c8fa1e733c597a Benoit Parrot 2021-11-17  46  {
c8fa1e733c597a Benoit Parrot 2021-11-17  47  	static const enum omap_plane_=
id hw_plane_ids[] =3D {
c8fa1e733c597a Benoit Parrot 2021-11-17  48  			OMAP_DSS_GFX, OMAP_DSS_VIDE=
O1,
c8fa1e733c597a Benoit Parrot 2021-11-17  49  			OMAP_DSS_VIDEO2, OMAP_DSS_V=
IDEO3,
c8fa1e733c597a Benoit Parrot 2021-11-17  50  	};
c8fa1e733c597a Benoit Parrot 2021-11-17  51  	u32 num_overlays =3D dispc_ge=
t_num_ovls(priv->dispc);
c8fa1e733c597a Benoit Parrot 2021-11-17  52  	enum omap_overlay_caps caps;
c8fa1e733c597a Benoit Parrot 2021-11-17  53  	int i, ret;
c8fa1e733c597a Benoit Parrot 2021-11-17  54  =

c8fa1e733c597a Benoit Parrot 2021-11-17  55  	for (i =3D 0; i < num_overlay=
s; i++) {
c8fa1e733c597a Benoit Parrot 2021-11-17  56  		struct omap_hw_overlay *over=
lay;
c8fa1e733c597a Benoit Parrot 2021-11-17  57  =

c8fa1e733c597a Benoit Parrot 2021-11-17  58  		caps =3D dispc_ovl_get_caps(=
priv->dispc, hw_plane_ids[i]);
c8fa1e733c597a Benoit Parrot 2021-11-17  59  		overlay =3D omap_overlay_ini=
t(hw_plane_ids[i], caps);
c8fa1e733c597a Benoit Parrot 2021-11-17  60  		if (IS_ERR(overlay)) {
c8fa1e733c597a Benoit Parrot 2021-11-17 @61  			ret =3D PTR_ERR(overlay);
c8fa1e733c597a Benoit Parrot 2021-11-17  62  			dev_err(priv->dev, "failed =
to construct overlay for %s (%d)\n",
c8fa1e733c597a Benoit Parrot 2021-11-17  63  				overlay_id_to_name[i], ret=
);
c8fa1e733c597a Benoit Parrot 2021-11-17  64  			omap_hwoverlays_destroy(pri=
v);
c8fa1e733c597a Benoit Parrot 2021-11-17  65  			return ret;
c8fa1e733c597a Benoit Parrot 2021-11-17  66  		}
c8fa1e733c597a Benoit Parrot 2021-11-17  67  		overlay->idx =3D priv->num_o=
vls;
c8fa1e733c597a Benoit Parrot 2021-11-17  68  		priv->overlays[priv->num_ovl=
s++] =3D overlay;
c8fa1e733c597a Benoit Parrot 2021-11-17  69  	}
c8fa1e733c597a Benoit Parrot 2021-11-17  70  =

c8fa1e733c597a Benoit Parrot 2021-11-17  71  	return 0;
c8fa1e733c597a Benoit Parrot 2021-11-17  72  }
c8fa1e733c597a Benoit Parrot 2021-11-17  73  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7782604243382721056==--

