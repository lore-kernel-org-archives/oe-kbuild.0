Content-Type: multipart/mixed; boundary="===============6719878157777981426=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 46/68] drm/vc4: hdmi: Protect device resources after removal
Date: Sat, 02 Jul 2022 23:30:52 +0800
Message-ID: <202207022342.h9ZM30YW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6719878157777981426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220622143209.600298-47-maxime@cerno.tech>
References: <20220622143209.600298-47-maxime@cerno.tech>
TO: Maxime Ripard <maxime@cerno.tech>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Maxime Ripard <maxime@cerno.tech>
TO: Daniel Vetter <daniel.vetter@intel.com>
TO: David Airlie <airlied@linux.ie>
CC: dri-devel(a)lists.freedesktop.org

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220622]
[also build test WARNING on v5.19-rc4]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next drm-tip/dr=
m-tip linus/master anholt/for-next v5.19-rc3 v5.19-rc2 v5.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-vc=
4-Fix-hotplug-for-vc4/20220622-223842
base:    ac0ba5454ca85162c08dc429fef1999e077ca976
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: csky-randconfig-c004-20220629 (https://download.01.org/0day-ci/arch=
ive/20220702/202207022342.h9ZM30YW-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1432:2-8: preceding lock on line 1429
   drivers/gpu/drm/vc4/vc4_hdmi.c:1402:2-8: preceding lock on line 1399

vim +1432 drivers/gpu/drm/vc4/vc4_hdmi.c

c8b75bca92cbf0 Eric Anholt   2015-03-02  1415  =

8d9147466776c4 Maxime Ripard 2020-12-15  1416  static void vc4_hdmi_encoder=
_post_crtc_enable(struct drm_encoder *encoder,
8d9147466776c4 Maxime Ripard 2020-12-15  1417  					      struct drm_atomic=
_state *state)
09c438139b8f5b Maxime Ripard 2020-09-03  1418  {
09c438139b8f5b Maxime Ripard 2020-09-03  1419  	struct vc4_hdmi *vc4_hdmi =
=3D encoder_to_vc4_hdmi(encoder);
a2f357f3dbaddb Maxime Ripard 2022-06-22  1420  	struct drm_device *drm =3D =
vc4_hdmi->connector.dev;
633be8c3c0c5e0 Maxime Ripard 2021-10-25  1421  	struct drm_display_mode *mo=
de =3D &vc4_hdmi->saved_adjusted_mode;
c3c2f38ce532c6 Jos=C3=A9 Exp=C3=B3sito 2022-04-20  1422  	struct drm_displa=
y_info *display =3D &vc4_hdmi->connector.display_info;
8b3f90e98e1764 Maxime Ripard 2020-09-03  1423  	bool hsync_pos =3D mode->fl=
ags & DRM_MODE_FLAG_PHSYNC;
8b3f90e98e1764 Maxime Ripard 2020-09-03  1424  	bool vsync_pos =3D mode->fl=
ags & DRM_MODE_FLAG_PVSYNC;
81fb55e500a82a Maxime Ripard 2021-10-25  1425  	unsigned long flags;
09c438139b8f5b Maxime Ripard 2020-09-03  1426  	int ret;
a2f357f3dbaddb Maxime Ripard 2022-06-22  1427  	int idx;
c8b75bca92cbf0 Eric Anholt   2015-03-02  1428  =

82cb88af12d29e Maxime Ripard 2021-10-25 @1429  	mutex_lock(&vc4_hdmi->mutex=
);
82cb88af12d29e Maxime Ripard 2021-10-25  1430  =

a2f357f3dbaddb Maxime Ripard 2022-06-22  1431  	if (!drm_dev_enter(drm, &id=
x))
a2f357f3dbaddb Maxime Ripard 2022-06-22 @1432  		return;
a2f357f3dbaddb Maxime Ripard 2022-06-22  1433  =

81fb55e500a82a Maxime Ripard 2021-10-25  1434  	spin_lock_irqsave(&vc4_hdmi=
->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  1435  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1436  	HDMI_WRITE(HDMI_VID_CTL,
c8b75bca92cbf0 Eric Anholt   2015-03-02  1437  		   VC4_HD_VID_CTL_ENABLE |
0b066a6809d0f8 Tim Gover     2021-06-28  1438  		   VC4_HD_VID_CTL_CLRRGB |
c8b75bca92cbf0 Eric Anholt   2015-03-02  1439  		   VC4_HD_VID_CTL_UNDERFLO=
W_ENABLE |
8b3f90e98e1764 Maxime Ripard 2020-09-03  1440  		   VC4_HD_VID_CTL_FRAME_CO=
UNTER_RESET |
8b3f90e98e1764 Maxime Ripard 2020-09-03  1441  		   (vsync_pos ? 0 : VC4_HD=
_VID_CTL_VSYNC_LOW) |
8b3f90e98e1764 Maxime Ripard 2020-09-03  1442  		   (hsync_pos ? 0 : VC4_HD=
_VID_CTL_HSYNC_LOW));
c8b75bca92cbf0 Eric Anholt   2015-03-02  1443  =

81d830137bdb46 Maxime Ripard 2020-09-03  1444  	HDMI_WRITE(HDMI_VID_CTL,
81d830137bdb46 Maxime Ripard 2020-09-03  1445  		   HDMI_READ(HDMI_VID_CTL)=
 & ~VC4_HD_VID_CTL_BLANKPIX);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1446  =

c3c2f38ce532c6 Jos=C3=A9 Exp=C3=B3sito 2022-04-20  1447  	if (display->is_h=
dmi) {
311e305fdb4e82 Maxime Ripard 2020-09-03  1448  		HDMI_WRITE(HDMI_SCHEDULER_=
CONTROL,
311e305fdb4e82 Maxime Ripard 2020-09-03  1449  			   HDMI_READ(HDMI_SCHEDUL=
ER_CONTROL) |
c8b75bca92cbf0 Eric Anholt   2015-03-02  1450  			   VC4_HDMI_SCHEDULER_CON=
TROL_MODE_HDMI);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1451  =

81fb55e500a82a Maxime Ripard 2021-10-25  1452  		spin_unlock_irqrestore(&vc=
4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  1453  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1454  		ret =3D wait_for(HDMI_READ=
(HDMI_SCHEDULER_CONTROL) &
2b29bf16611a1a Eric Anholt   2016-09-28  1455  			       VC4_HDMI_SCHEDULER=
_CONTROL_HDMI_ACTIVE, 1000);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1456  		WARN_ONCE(ret, "Timeout wa=
iting for "
c8b75bca92cbf0 Eric Anholt   2015-03-02  1457  			  "VC4_HDMI_SCHEDULER_CON=
TROL_HDMI_ACTIVE\n");
c8b75bca92cbf0 Eric Anholt   2015-03-02  1458  	} else {
311e305fdb4e82 Maxime Ripard 2020-09-03  1459  		HDMI_WRITE(HDMI_RAM_PACKET=
_CONFIG,
311e305fdb4e82 Maxime Ripard 2020-09-03  1460  			   HDMI_READ(HDMI_RAM_PAC=
KET_CONFIG) &
c8b75bca92cbf0 Eric Anholt   2015-03-02  1461  			   ~(VC4_HDMI_RAM_PACKET_=
ENABLE));
311e305fdb4e82 Maxime Ripard 2020-09-03  1462  		HDMI_WRITE(HDMI_SCHEDULER_=
CONTROL,
311e305fdb4e82 Maxime Ripard 2020-09-03  1463  			   HDMI_READ(HDMI_SCHEDUL=
ER_CONTROL) &
c8b75bca92cbf0 Eric Anholt   2015-03-02  1464  			   ~VC4_HDMI_SCHEDULER_CO=
NTROL_MODE_HDMI);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1465  =

81fb55e500a82a Maxime Ripard 2021-10-25  1466  		spin_unlock_irqrestore(&vc=
4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  1467  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1468  		ret =3D wait_for(!(HDMI_RE=
AD(HDMI_SCHEDULER_CONTROL) &
2b29bf16611a1a Eric Anholt   2016-09-28  1469  				 VC4_HDMI_SCHEDULER_CONT=
ROL_HDMI_ACTIVE), 1000);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1470  		WARN_ONCE(ret, "Timeout wa=
iting for "
c8b75bca92cbf0 Eric Anholt   2015-03-02  1471  			  "!VC4_HDMI_SCHEDULER_CO=
NTROL_HDMI_ACTIVE\n");
c8b75bca92cbf0 Eric Anholt   2015-03-02  1472  	}
c8b75bca92cbf0 Eric Anholt   2015-03-02  1473  =

c3c2f38ce532c6 Jos=C3=A9 Exp=C3=B3sito 2022-04-20  1474  	if (display->is_h=
dmi) {
81fb55e500a82a Maxime Ripard 2021-10-25  1475  		spin_lock_irqsave(&vc4_hdm=
i->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  1476  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1477  		WARN_ON(!(HDMI_READ(HDMI_S=
CHEDULER_CONTROL) &
c8b75bca92cbf0 Eric Anholt   2015-03-02  1478  			  VC4_HDMI_SCHEDULER_CONT=
ROL_HDMI_ACTIVE));
311e305fdb4e82 Maxime Ripard 2020-09-03  1479  		HDMI_WRITE(HDMI_SCHEDULER_=
CONTROL,
311e305fdb4e82 Maxime Ripard 2020-09-03  1480  			   HDMI_READ(HDMI_SCHEDUL=
ER_CONTROL) |
c8b75bca92cbf0 Eric Anholt   2015-03-02  1481  			   VC4_HDMI_SCHEDULER_CON=
TROL_VERT_ALWAYS_KEEPOUT);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1482  =

311e305fdb4e82 Maxime Ripard 2020-09-03  1483  		HDMI_WRITE(HDMI_RAM_PACKET=
_CONFIG,
21317b3fba5428 Eric Anholt   2016-09-29  1484  			   VC4_HDMI_RAM_PACKET_EN=
ABLE);
21317b3fba5428 Eric Anholt   2016-09-29  1485  =

81fb55e500a82a Maxime Ripard 2021-10-25  1486  		spin_unlock_irqrestore(&vc=
4_hdmi->hw_lock, flags);
81fb55e500a82a Maxime Ripard 2021-10-25  1487  =

21317b3fba5428 Eric Anholt   2016-09-29  1488  		vc4_hdmi_set_infoframes(en=
coder);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1489  	}
c8b75bca92cbf0 Eric Anholt   2015-03-02  1490  =

691456f622a96b Maxime Ripard 2020-09-03  1491  	vc4_hdmi_recenter_fifo(vc4_=
hdmi);
c85695a2016e2e Maxime Ripard 2021-05-07  1492  	vc4_hdmi_enable_scrambling(=
encoder);
82cb88af12d29e Maxime Ripard 2021-10-25  1493  =

a2f357f3dbaddb Maxime Ripard 2022-06-22  1494  	drm_dev_exit(idx);
82cb88af12d29e Maxime Ripard 2021-10-25  1495  	mutex_unlock(&vc4_hdmi->mut=
ex);
c8b75bca92cbf0 Eric Anholt   2015-03-02  1496  }
c8b75bca92cbf0 Eric Anholt   2015-03-02  1497  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6719878157777981426==--

