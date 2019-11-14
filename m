Content-Type: multipart/mixed; boundary="===============0224308975574461914=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: switch intel_ddi_init() to intel types
Date: Thu, 14 Nov 2019 11:52:34 +0000
Message-ID: <20191114115053.GG19079@kadam.lan>
In-Reply-To: <20191106064713.8201-1-lucas.demarchi@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0224308975574461914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Resending with corrected From header.  -dan ]
[ This does feel like potentially a bad merge...  -dan ]

Hi Lucas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on next-20191112]
[cannot apply to v5.4-rc7]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Lucas-De-Marchi/drm-i915-s=
witch-intel_ddi_init-to-intel-types/20191108-185646
base:   git://anongit.freedesktop.org/drm-intel for-linux-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/display/intel_ddi.c:4717 intel_ddi_init() error: unini=
tialized symbol 'encoder'.

# https://github.com/0day-ci/linux/commit/be1087a2f14d66a04a24e7cb5a7cc6a51=
66ff836
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout be1087a2f14d66a04a24e7cb5a7cc6a5166ff836
vim +/encoder +4717 drivers/gpu/drm/i915/display/intel_ddi.c

c39055b072f8b1 drivers/gpu/drm/i915/intel_ddi.c         Ander Conselvan de =
Oliveira 2016-11-23  4683  void intel_ddi_init(struct drm_i915_private *dev=
_priv, enum port port)
00c09d70df6b30 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni       =
         2012-10-26  4684  {
f6bff60e927b2f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak          =
         2018-12-14  4685  	struct ddi_vbt_port_info *port_info =3D
f6bff60e927b2f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak          =
         2018-12-14  4686  		&dev_priv->vbt.ddi_port_info[port];
00c09d70df6b30 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni       =
         2012-10-26  4687  	struct intel_digital_port *intel_dig_port;
be1087a2f14d66 drivers/gpu/drm/i915/display/intel_ddi.c Lucas De Marchi    =
         2019-11-05  4688  	struct intel_encoder *encoder;
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4689  	bool init_hdmi, init_dp, init_lspcon =3D false;
d8fe2ab6bb283d drivers/gpu/drm/i915/display/intel_ddi.c Matt Roper         =
         2019-07-09  4690  	enum phy phy =3D intel_port_to_phy(dev_priv, po=
rt);
10e7bec38bbda4 drivers/gpu/drm/i915/intel_ddi.c         Ville Syrj=C3=A4l=
=C3=A4               2015-12-08  4691  =

f6bff60e927b2f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak          =
         2018-12-14  4692  	init_hdmi =3D port_info->supports_dvi || port_i=
nfo->supports_hdmi;
f6bff60e927b2f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak          =
         2018-12-14  4693  	init_dp =3D port_info->supports_dp;
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4694  =

ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4695  	if (intel_bios_is_lspcon_present(dev_priv, port=
)) {
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4696  		/*
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4697  		 * Lspcon device needs to be driven with DP co=
nnector
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4698  		 * with special detection sequence. So make su=
re DP
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4699  		 * is initialized before lspcon.
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4700  		 */
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4701  		init_dp =3D true;
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4702  		init_lspcon =3D true;
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4703  		init_hdmi =3D false;
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4704  		DRM_DEBUG_KMS("VBT says port %c has lspcon\n",=
 port_name(port));
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4705  	}
ff66212415e324 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma    =
         2016-10-14  4706  =

311a20949f047a drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni       =
         2013-09-12  4707  	if (!init_dp && !init_hdmi) {
500ea70d503ed9 drivers/gpu/drm/i915/intel_ddi.c         Rodrigo Vivi       =
         2015-08-07  4708  		DRM_DEBUG_KMS("VBT says port %c is not DVI/HDM=
I/DP compatible, respect it\n",
311a20949f047a drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni       =
         2013-09-12  4709  			      port_name(port));
500ea70d503ed9 drivers/gpu/drm/i915/intel_ddi.c         Rodrigo Vivi       =
         2015-08-07  4710  		return;
311a20949f047a drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni       =
         2013-09-12  4711  	}
00c09d70df6b30 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni       =
         2012-10-26  4712  =

b14c5679dd2c87 drivers/gpu/drm/i915/intel_ddi.c         Daniel Vetter      =
         2013-09-19  4713  	intel_dig_port =3D kzalloc(sizeof(*intel_dig_po=
rt), GFP_KERNEL);
00c09d70df6b30 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni       =
         2012-10-26  4714  	if (!intel_dig_port)
00c09d70df6b30 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni       =
         2012-10-26  4715  		return;
00c09d70df6b30 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni       =
         2012-10-26  4716  =

be1087a2f14d66 drivers/gpu/drm/i915/display/intel_ddi.c Lucas De Marchi    =
         2019-11-05 @4717  	drm_encoder_init(&dev_priv->drm, &encoder->base=
, &intel_ddi_funcs,

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============0224308975574461914==--

