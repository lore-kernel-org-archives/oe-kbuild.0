Content-Type: multipart/mixed; boundary="===============5573645408166717500=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [chrome-os:chromeos-4.19 5/5] drivers/gpu/drm/i915/intel_modes.c:168 intel_attach_privacy_screen_property() error: uninitialized symbol 'prop'.
Date: Mon, 03 Feb 2020 11:47:40 +0300
Message-ID: <20200203084740.GJ11068@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5573645408166717500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-4.19
head:   6e9ad418e3e56843809b2de0e833818fd9fe72eb
commit: 6e9ad418e3e56843809b2de0e833818fd9fe72eb [5/5] BACKPORT: FROMLIST: =
drm/i915: Add support for integrated privacy screens

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/intel_modes.c:168 intel_attach_privacy_screen_property=
() error: uninitialized symbol 'prop'.

git remote add chrome-os https://chromium.googlesource.com/chromiumos/third=
_party/kernel
git remote update chrome-os
git checkout 6e9ad418e3e56843809b2de0e833818fd9fe72eb
vim +/prop +168 drivers/gpu/drm/i915/intel_modes.c

6e9ad418e3e568 Rajat Jain 2019-12-18  141  =

6e9ad418e3e568 Rajat Jain 2019-12-18  142  /**
6e9ad418e3e568 Rajat Jain 2019-12-18  143   * intel_attach_privacy_screen_p=
roperty -
6e9ad418e3e568 Rajat Jain 2019-12-18  144   *     create and attach the con=
necter's privacy-screen property. *
6e9ad418e3e568 Rajat Jain 2019-12-18  145   * @connector: connector for whi=
ch to init the privacy-screen property
6e9ad418e3e568 Rajat Jain 2019-12-18  146   *
6e9ad418e3e568 Rajat Jain 2019-12-18  147   * This function creates and att=
aches the "privacy-screen" property to the
6e9ad418e3e568 Rajat Jain 2019-12-18  148   * connector. Initial state of p=
rivacy-screen is set to disabled.
6e9ad418e3e568 Rajat Jain 2019-12-18  149   */
6e9ad418e3e568 Rajat Jain 2019-12-18  150  void
6e9ad418e3e568 Rajat Jain 2019-12-18  151  intel_attach_privacy_screen_prop=
erty(struct drm_connector *connector)
6e9ad418e3e568 Rajat Jain 2019-12-18  152  {
6e9ad418e3e568 Rajat Jain 2019-12-18  153  	struct intel_connector *intel_c=
onnector =3D to_intel_connector(connector);
6e9ad418e3e568 Rajat Jain 2019-12-18  154  	struct drm_property *prop;
                                                                     ^^^^
6e9ad418e3e568 Rajat Jain 2019-12-18  155  =

6e9ad418e3e568 Rajat Jain 2019-12-18  156  	if (!intel_connector->privacy_s=
creen_property) {
6e9ad418e3e568 Rajat Jain 2019-12-18  157  		prop =3D drm_property_create_e=
num(connector->dev,
6e9ad418e3e568 Rajat Jain 2019-12-18  158  						DRM_MODE_PROP_ENUM,
6e9ad418e3e568 Rajat Jain 2019-12-18  159  						"privacy-screen",
6e9ad418e3e568 Rajat Jain 2019-12-18  160  						privacy_screen_enum,
6e9ad418e3e568 Rajat Jain 2019-12-18  161  					    ARRAY_SIZE(privacy_scre=
en_enum));
6e9ad418e3e568 Rajat Jain 2019-12-18  162  		if (!prop)
6e9ad418e3e568 Rajat Jain 2019-12-18  163  			return;
6e9ad418e3e568 Rajat Jain 2019-12-18  164  =

6e9ad418e3e568 Rajat Jain 2019-12-18  165  		intel_connector->privacy_scree=
n_property =3D prop;
6e9ad418e3e568 Rajat Jain 2019-12-18  166  	}
6e9ad418e3e568 Rajat Jain 2019-12-18  167  =

6e9ad418e3e568 Rajat Jain 2019-12-18 @168  	drm_object_attach_property(&con=
nector->base, prop,
                                                                           =
                  ^^^^
Move this into the if condition?

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5573645408166717500==--

