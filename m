Content-Type: multipart/mixed; boundary="===============6460298330974755672=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4977/9257] drivers/gpu/drm/msm/dp/dp_drm.c:246 msm_dp_bridge_init() warn: passing devm_ allocated variable to kfree. 'dp_bridge'
Date: Thu, 23 Dec 2021 07:25:36 +0800
Message-ID: <202112230704.zEMgDZqS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6460298330974755672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kuogee Hsieh <quic_khsieh@quicinc.com>
CC: Rob Clark <robdclark@chromium.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2bd48302750c652889a2604b3df8b591c1d3af08
commit: 8a3b4c17f863cde8e8743edd8faffe916c49b960 [4977/9257] drm/msm/dp: em=
ploy bridge mechanism for display enable and disable
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: microblaze-randconfig-m031-20211222 (https://download.01.org/0day-c=
i/archive/20211223/202112230704.zEMgDZqS-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/msm/dp/dp_drm.c:246 msm_dp_bridge_init() warn: passing devm=
_ allocated variable to kfree. 'dp_bridge'

vim +/dp_bridge +246 drivers/gpu/drm/msm/dp/dp_drm.c

8a3b4c17f863cd Kuogee Hsieh 2021-12-07  225  =

8a3b4c17f863cd Kuogee Hsieh 2021-12-07  226  struct drm_bridge *msm_dp_brid=
ge_init(struct msm_dp *dp_display, struct drm_device *dev,
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  227  			struct drm_encoder *encoder)
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  228  {
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  229  	int rc;
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  230  	struct msm_dp_bridge *dp_brid=
ge;
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  231  	struct drm_bridge *bridge;
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  232  =

8a3b4c17f863cd Kuogee Hsieh 2021-12-07  233  	dp_bridge =3D devm_kzalloc(de=
v->dev, sizeof(*dp_bridge), GFP_KERNEL);
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  234  	if (!dp_bridge)
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  235  		return ERR_PTR(-ENOMEM);
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  236  =

8a3b4c17f863cd Kuogee Hsieh 2021-12-07  237  	dp_bridge->dp_display =3D dp_=
display;
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  238  =

8a3b4c17f863cd Kuogee Hsieh 2021-12-07  239  	bridge =3D &dp_bridge->bridge;
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  240  	bridge->funcs =3D &dp_bridge_=
ops;
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  241  	bridge->encoder =3D encoder;
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  242  =

8a3b4c17f863cd Kuogee Hsieh 2021-12-07  243  	rc =3D drm_bridge_attach(enco=
der, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  244  	if (rc) {
8a3b4c17f863cd Kuogee Hsieh 2021-12-07  245  		DRM_ERROR("failed to attach =
bridge, rc=3D%d\n", rc);
8a3b4c17f863cd Kuogee Hsieh 2021-12-07 @246  		kfree(dp_bridge);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6460298330974755672==--

