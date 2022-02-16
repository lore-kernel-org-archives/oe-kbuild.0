Content-Type: multipart/mixed; boundary="===============0299821708682324379=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 9976/9999] drivers/gpu/drm/i915/display/intel_ddi.c:4177 intel_ddi_encoder_destroy() warn: variable dereferenced before check 'dig_port' (see line 4169)
Date: Thu, 17 Feb 2022 05:55:47 +0800
Message-ID: <202202170550.Y6vQX0Fm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0299821708682324379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   93e7d232f85b0d597f8e9884386b9e3d43cedd3a
commit: b192f39b07ce2cf4436dd6a18fb5e11da05fcff5 [9976/9999] UPSTREAM: drm/=
i915/tc: Fix TypeC PHY connect/disconnect logic on ADL-P
:::::: branch date: 6 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-m021-20220214 (https://download.01.org/0day-ci/arch=
ive/20220217/202202170550.Y6vQX0Fm-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/display/intel_ddi.c:4177 intel_ddi_encoder_destroy() w=
arn: variable dereferenced before check 'dig_port' (see line 4169)

vim +/dig_port +4177 drivers/gpu/drm/i915/display/intel_ddi.c

b50a1aa6e1e9471 drivers/gpu/drm/i915/display/intel_ddi.c Manasi Navare  202=
0-02-14  4164  =

f6bff60e927b2f1 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak      201=
8-12-14  4165  static void intel_ddi_encoder_destroy(struct drm_encoder *en=
coder)
f6bff60e927b2f1 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak      201=
8-12-14  4166  {
cd7826aa85f1f30 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak      202=
1-05-26  4167  	struct drm_i915_private *i915 =3D to_i915(encoder->dev);
b7d02c3a124d9be drivers/gpu/drm/i915/display/intel_ddi.c Ville Syrj=C3=A4l=
=C3=A4  2019-12-04  4168  	struct intel_digital_port *dig_port =3D enc_to_d=
ig_port(to_intel_encoder(encoder));
b192f39b07ce2cf drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak      202=
1-09-29 @4169  	enum phy phy =3D intel_port_to_phy(i915, dig_port->base.por=
t);
f6bff60e927b2f1 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak      201=
8-12-14  4170  =

f6bff60e927b2f1 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak      201=
8-12-14  4171  	intel_dp_encoder_flush_work(encoder);
b192f39b07ce2cf drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak      202=
1-09-29  4172  	if (intel_phy_is_tc(i915, phy))
b192f39b07ce2cf drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak      202=
1-09-29  4173  		intel_tc_port_flush_work(dig_port);
cd7826aa85f1f30 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak      202=
1-05-26  4174  	intel_display_power_flush_work(i915);
f6bff60e927b2f1 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak      201=
8-12-14  4175  =

f6bff60e927b2f1 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak      201=
8-12-14  4176  	drm_encoder_cleanup(encoder);
41dcbc7513c69d3 drivers/gpu/drm/i915/display/intel_ddi.c Anshuman Gupta 202=
1-01-11 @4177  	if (dig_port)
41dcbc7513c69d3 drivers/gpu/drm/i915/display/intel_ddi.c Anshuman Gupta 202=
1-01-11  4178  		kfree(dig_port->hdcp_port_data.streams);
f6bff60e927b2f1 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak      201=
8-12-14  4179  	kfree(dig_port);
f6bff60e927b2f1 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak      201=
8-12-14  4180  }
f6bff60e927b2f1 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak      201=
8-12-14  4181  =


:::::: The code at line 4177 was first introduced by commit
:::::: 41dcbc7513c69d355cc52a1b4239109ed51f0cf9 UPSTREAM: drm/i915/hdcp: En=
capsulate hdcp_port_data to dig_port

:::::: TO: Anshuman Gupta <anshuman.gupta@intel.com>
:::::: CC: Sean Paul <seanpaul@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0299821708682324379==--

