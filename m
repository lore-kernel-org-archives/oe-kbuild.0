Content-Type: multipart/mixed; boundary="===============4887630314451373813=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 331/3266] drivers/gpu/drm/vc4/vc4_hdmi.c:1459:2-8: preceding lock on line 1456
Date: Fri, 26 Aug 2022 07:43:10 +0800
Message-ID: <202208260727.0o3WQ2wp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4887630314451373813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Maxime Ripard <maxime@cerno.tech>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b5d939c951865f6fc229094e84b77c9a9e0ed0c7
commit: cd00ed5187bff03d4c2ba143a5993383dd6ed66c [331/3266] drm/vc4: hdmi: =
Protect device resources after removal
:::::: branch date: 18 hours ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-c44-20220824 (https://download.01.org/0day-ci/arch=
ive/20220826/202208260727.0o3WQ2wp-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1459:2-8: preceding lock on line 1456
   drivers/gpu/drm/vc4/vc4_hdmi.c:1429:2-8: preceding lock on line 1426

vim +1459 drivers/gpu/drm/vc4/vc4_hdmi.c

c8b75bca92cbf0 Eric Anholt   2015-03-02  1442  =

8d9147466776c4 Maxime Ripard 2020-12-15  1443  static void vc4_hdmi_encoder=
_post_crtc_enable(struct drm_encoder *encoder,
8d9147466776c4 Maxime Ripard 2020-12-15  1444  					      struct drm_atomic=
_state *state)
09c438139b8f5b Maxime Ripard 2020-09-03  1445  {
09c438139b8f5b Maxime Ripard 2020-09-03  1446  	struct vc4_hdmi *vc4_hdmi =
=3D encoder_to_vc4_hdmi(encoder);
cd00ed5187bff0 Maxime Ripard 2022-07-11  1447  	struct drm_device *drm =3D =
vc4_hdmi->connector.dev;
633be8c3c0c5e0 Maxime Ripard 2021-10-25  1448  	struct drm_display_mode *mo=
de =3D &vc4_hdmi->saved_adjusted_mode;
c3c2f38ce532c6 Jos=C3=A9 Exp=C3=B3sito 2022-04-20  1449  	struct drm_displa=
y_info *display =3D &vc4_hdmi->connector.display_info;
8b3f90e98e1764 Maxime Ripard 2020-09-03  1450  	bool hsync_pos =3D mode->fl=
ags & DRM_MODE_FLAG_PHSYNC;
8b3f90e98e1764 Maxime Ripard 2020-09-03  1451  	bool vsync_pos =3D mode->fl=
ags & DRM_MODE_FLAG_PVSYNC;
81fb55e500a82a Maxime Ripard 2021-10-25  1452  	unsigned long flags;
09c438139b8f5b Maxime Ripard 2020-09-03  1453  	int ret;
cd00ed5187bff0 Maxime Ripard 2022-07-11  1454  	int idx;
c8b75bca92cbf0 Eric Anholt   2015-03-02  1455  =

82cb88af12d29e Maxime Ripard 2021-10-25 @1456  	mutex_lock(&vc4_hdmi->mutex=
);
82cb88af12d29e Maxime Ripard 2021-10-25  1457  =

cd00ed5187bff0 Maxime Ripard 2022-07-11  1458  	if (!drm_dev_enter(drm, &id=
x))
cd00ed5187bff0 Maxime Ripard 2022-07-11 @1459  		return;
cd00ed5187bff0 Maxime Ripard 2022-07-11  1460  =

81fb55e500a82a Maxime Ripard 2021-10-25  1461  	spin_lock_irqsave(&vc4_hdmi=
->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  1462  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1463  	HDMI_WRITE(HDMI_VID_CTL,
c8b75bca92cbf0 Eric Anholt   2015-03-02  1464  		   VC4_HD_VID_CTL_ENABLE |
0b066a6809d0f8 Tim Gover     2021-06-28  1465  		   VC4_HD_VID_CTL_CLRRGB |
c8b75bca92cbf0 Eric Anholt   2015-03-02  1466  		   VC4_HD_VID_CTL_UNDERFLO=
W_ENABLE |
8b3f90e98e1764 Maxime Ripard 2020-09-03  1467  		   VC4_HD_VID_CTL_FRAME_CO=
UNTER_RESET |
8b3f90e98e1764 Maxime Ripard 2020-09-03  1468  		   (vsync_pos ? 0 : VC4_HD=
_VID_CTL_VSYNC_LOW) |
8b3f90e98e1764 Maxime Ripard 2020-09-03  1469  		   (hsync_pos ? 0 : VC4_HD=
_VID_CTL_HSYNC_LOW));
c8b75bca92cbf0 Eric Anholt   2015-03-02  1470  =

81d830137bdb46 Maxime Ripard 2020-09-03  1471  	HDMI_WRITE(HDMI_VID_CTL,
81d830137bdb46 Maxime Ripard 2020-09-03  1472  		   HDMI_READ(HDMI_VID_CTL)=
 & ~VC4_HD_VID_CTL_BLANKPIX);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1473  =

c3c2f38ce532c6 Jos=C3=A9 Exp=C3=B3sito 2022-04-20  1474  	if (display->is_h=
dmi) {
311e305fdb4e82 Maxime Ripard 2020-09-03  1475  		HDMI_WRITE(HDMI_SCHEDULER_=
CONTROL,
311e305fdb4e82 Maxime Ripard 2020-09-03  1476  			   HDMI_READ(HDMI_SCHEDUL=
ER_CONTROL) |
c8b75bca92cbf0 Eric Anholt   2015-03-02  1477  			   VC4_HDMI_SCHEDULER_CON=
TROL_MODE_HDMI);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1478  =

81fb55e500a82a Maxime Ripard 2021-10-25  1479  		spin_unlock_irqrestore(&vc=
4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  1480  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1481  		ret =3D wait_for(HDMI_READ=
(HDMI_SCHEDULER_CONTROL) &
2b29bf16611a1a Eric Anholt   2016-09-28  1482  			       VC4_HDMI_SCHEDULER=
_CONTROL_HDMI_ACTIVE, 1000);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1483  		WARN_ONCE(ret, "Timeout wa=
iting for "
c8b75bca92cbf0 Eric Anholt   2015-03-02  1484  			  "VC4_HDMI_SCHEDULER_CON=
TROL_HDMI_ACTIVE\n");
c8b75bca92cbf0 Eric Anholt   2015-03-02  1485  	} else {
311e305fdb4e82 Maxime Ripard 2020-09-03  1486  		HDMI_WRITE(HDMI_RAM_PACKET=
_CONFIG,
311e305fdb4e82 Maxime Ripard 2020-09-03  1487  			   HDMI_READ(HDMI_RAM_PAC=
KET_CONFIG) &
c8b75bca92cbf0 Eric Anholt   2015-03-02  1488  			   ~(VC4_HDMI_RAM_PACKET_=
ENABLE));
311e305fdb4e82 Maxime Ripard 2020-09-03  1489  		HDMI_WRITE(HDMI_SCHEDULER_=
CONTROL,
311e305fdb4e82 Maxime Ripard 2020-09-03  1490  			   HDMI_READ(HDMI_SCHEDUL=
ER_CONTROL) &
c8b75bca92cbf0 Eric Anholt   2015-03-02  1491  			   ~VC4_HDMI_SCHEDULER_CO=
NTROL_MODE_HDMI);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1492  =

81fb55e500a82a Maxime Ripard 2021-10-25  1493  		spin_unlock_irqrestore(&vc=
4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  1494  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1495  		ret =3D wait_for(!(HDMI_RE=
AD(HDMI_SCHEDULER_CONTROL) &
2b29bf16611a1a Eric Anholt   2016-09-28  1496  				 VC4_HDMI_SCHEDULER_CONT=
ROL_HDMI_ACTIVE), 1000);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1497  		WARN_ONCE(ret, "Timeout wa=
iting for "
c8b75bca92cbf0 Eric Anholt   2015-03-02  1498  			  "!VC4_HDMI_SCHEDULER_CO=
NTROL_HDMI_ACTIVE\n");
c8b75bca92cbf0 Eric Anholt   2015-03-02  1499  	}
c8b75bca92cbf0 Eric Anholt   2015-03-02  1500  =

c3c2f38ce532c6 Jos=C3=A9 Exp=C3=B3sito 2022-04-20  1501  	if (display->is_h=
dmi) {
81fb55e500a82a Maxime Ripard 2021-10-25  1502  		spin_lock_irqsave(&vc4_hdm=
i->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  1503  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1504  		WARN_ON(!(HDMI_READ(HDMI_S=
CHEDULER_CONTROL) &
c8b75bca92cbf0 Eric Anholt   2015-03-02  1505  			  VC4_HDMI_SCHEDULER_CONT=
ROL_HDMI_ACTIVE));
c8b75bca92cbf0 Eric Anholt   2015-03-02  1506  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1507  		HDMI_WRITE(HDMI_RAM_PACKET=
_CONFIG,
21317b3fba5428 Eric Anholt   2016-09-29  1508  			   VC4_HDMI_RAM_PACKET_EN=
ABLE);
21317b3fba5428 Eric Anholt   2016-09-29  1509  =

81fb55e500a82a Maxime Ripard 2021-10-25  1510  		spin_unlock_irqrestore(&vc=
4_hdmi->hw_lock, flags);
4ae3d6c09d25a9 Dom Cobley    2022-06-13  1511  		vc4_hdmi->packet_ram_enabl=
ed =3D true;
81fb55e500a82a Maxime Ripard 2021-10-25  1512  =

21317b3fba5428 Eric Anholt   2016-09-29  1513  		vc4_hdmi_set_infoframes(en=
coder);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1514  	}
c8b75bca92cbf0 Eric Anholt   2015-03-02  1515  =

691456f622a96b Maxime Ripard 2020-09-03  1516  	vc4_hdmi_recenter_fifo(vc4_=
hdmi);
c85695a2016e2e Maxime Ripard 2021-05-07  1517  	vc4_hdmi_enable_scrambling(=
encoder);
82cb88af12d29e Maxime Ripard 2021-10-25  1518  =

cd00ed5187bff0 Maxime Ripard 2022-07-11  1519  	drm_dev_exit(idx);
82cb88af12d29e Maxime Ripard 2021-10-25  1520  	mutex_unlock(&vc4_hdmi->mut=
ex);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1521  }
c8b75bca92cbf0 Eric Anholt   2015-03-02  1522  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4887630314451373813==--

