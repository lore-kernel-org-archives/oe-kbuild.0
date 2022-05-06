Content-Type: multipart/mixed; boundary="===============6131131036360074188=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/mgag200: Fail on I2C initialization errors
Date: Fri, 06 May 2022 10:25:36 +0800
Message-ID: <202205061008.eYVQWRSt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6131131036360074188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220505152244.413-1-tzimmermann@suse.de>
References: <20220505152244.413-1-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: airlied(a)redhat.com
TO: jfalempe(a)redhat.com
TO: daniel(a)ffwll.ch
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: dri-devel(a)lists.freedesktop.org

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-=
next drm-tip/drm-tip tegra-drm/drm/tegra/for-next v5.18-rc5 next-20220505]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/dr=
m-mgag200-Fail-on-I2C-initialization-errors/20220505-234643
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
506/202205061008.eYVQWRSt-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/mgag200/mgag200_mode.c:819 mgag200_vga_connector_init() err=
or: uninitialized symbol 'ret'.

vim +/ret +819 drivers/gpu/drm/mgag200/mgag200_mode.c

414c453106255b1 Dave Airlie           2012-04-17  808  =

81a15b9a65565dc Thomas Zimmermann     2020-05-07  809  static int mgag200_v=
ga_connector_init(struct mga_device *mdev)
414c453106255b1 Dave Airlie           2012-04-17  810  {
832eddf5d8f4d83 Thomas Zimmermann     2020-06-05  811  	struct drm_device *=
dev =3D &mdev->base;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  812  	struct mga_connecto=
r *mconnector =3D &mdev->connector;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  813  	struct drm_connecto=
r *connector =3D &mconnector->base;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  814  	struct mga_i2c_chan=
 *i2c;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  815  	int ret;
414c453106255b1 Dave Airlie           2012-04-17  816  =

81a15b9a65565dc Thomas Zimmermann     2020-05-07  817  	i2c =3D mgag200_i2c=
_create(dev);
11682b9fc557a02 Thomas Zimmermann     2022-05-05  818  	if (IS_ERR(i2c)) {
11682b9fc557a02 Thomas Zimmermann     2022-05-05 @819  		drm_err(dev, "fail=
ed to add DDC bus: %d\n", ret);
11682b9fc557a02 Thomas Zimmermann     2022-05-05  820  		return PTR_ERR(i2c=
);
11682b9fc557a02 Thomas Zimmermann     2022-05-05  821  	}
414c453106255b1 Dave Airlie           2012-04-17  822  =

81a15b9a65565dc Thomas Zimmermann     2020-05-07  823  	ret =3D drm_connect=
or_init_with_ddc(dev, connector,
9572ae176a10f3b Andrzej Pietrasiewicz 2019-07-26  824  					  &mga_vga_conn=
ector_funcs,
9572ae176a10f3b Andrzej Pietrasiewicz 2019-07-26  825  					  DRM_MODE_CONN=
ECTOR_VGA,
81a15b9a65565dc Thomas Zimmermann     2020-05-07  826  					  &i2c->adapter=
);
81a15b9a65565dc Thomas Zimmermann     2020-05-07  827  	if (ret)
81a15b9a65565dc Thomas Zimmermann     2020-05-07  828  		goto err_mgag200_i=
2c_destroy;
414c453106255b1 Dave Airlie           2012-04-17  829  	drm_connector_helpe=
r_add(connector, &mga_vga_connector_helper_funcs);
414c453106255b1 Dave Airlie           2012-04-17  830  =

81a15b9a65565dc Thomas Zimmermann     2020-05-07  831  	mconnector->i2c =3D=
 i2c;
3d5a1c5e300483d Egbert Eich           2013-07-17  832  =

81a15b9a65565dc Thomas Zimmermann     2020-05-07  833  	return 0;
81a15b9a65565dc Thomas Zimmermann     2020-05-07  834  =

81a15b9a65565dc Thomas Zimmermann     2020-05-07  835  err_mgag200_i2c_dest=
roy:
81a15b9a65565dc Thomas Zimmermann     2020-05-07  836  	mgag200_i2c_destroy=
(i2c);
81a15b9a65565dc Thomas Zimmermann     2020-05-07  837  	return ret;
414c453106255b1 Dave Airlie           2012-04-17  838  }
414c453106255b1 Dave Airlie           2012-04-17  839  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6131131036360074188==--

