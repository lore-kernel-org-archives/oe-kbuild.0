Content-Type: multipart/mixed; boundary="===============2008644810306475316=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/stm/ltdc.c:1124 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1119)
Date: Wed, 04 May 2022 05:55:28 +0800
Message-ID: <202205040556.P3wNmO1e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2008644810306475316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>
CC: Philippe Cornu <philippe.cornu@foss.st.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef8e4d3c2ab1f47f63b6c7e578266b7e5cc9cd1b
commit: 79b44684a14e363d24c299b772f037344ad8c8dc drm/stm: ltdc: add support=
 for CRC hashing feature
date:   10 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 weeks ago
config: arm-randconfig-m031-20220427 (https://download.01.org/0day-ci/archi=
ve/20220504/202205040556.P3wNmO1e-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1124 ltdc_crtc_set_crc_source() warn: variable d=
ereferenced before check 'crtc' (see line 1119)

Old smatch warnings:
drivers/gpu/drm/stm/ltdc.c:901 ltdc_crtc_mode_set_nofb() warn: iterator use=
d outside loop: 'bridge'
drivers/gpu/drm/stm/ltdc.c:911 ltdc_crtc_mode_set_nofb() warn: pm_runtime_g=
et_sync() also returns 1 on success

vim +/crtc +1124 drivers/gpu/drm/stm/ltdc.c

b70fbfc7d5164a Thomas Zimmermann   2020-01-23  1116  =

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1117  static int ltdc_crtc_s=
et_crc_source(struct drm_crtc *crtc, const char *source)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1118  {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1119  	struct ltdc_device *l=
dev =3D crtc_to_ltdc(crtc);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1120  	int ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1121  =

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1122  	DRM_DEBUG_DRIVER("\n"=
);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1123  =

79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1124  	if (!crtc)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1125  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1126  =

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1127  	if (source && strcmp(=
source, "auto") =3D=3D 0) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1128  		ldev->crc_active =3D=
 true;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1129  		ret =3D regmap_set_b=
its(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1130  	} else if (!source) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1131  		ldev->crc_active =3D=
 false;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1132  		ret =3D regmap_clear=
_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1133  	} else {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1134  		ret =3D -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1135  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1136  =

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1137  	ldev->crc_skip_count =
=3D 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1138  	return ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1139  }
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1140  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2008644810306475316==--

