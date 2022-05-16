Content-Type: multipart/mixed; boundary="===============3875287479635051504=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 13/15] drm/i915/bios: Determine panel type via PNPID match
Date: Tue, 17 May 2022 04:24:33 +0800
Message-ID: <202205170309.dBWj8JNv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3875287479635051504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220510104242.6099-14-ville.syrjala@linux.intel.com>
References: <20220510104242.6099-14-ville.syrjala@linux.intel.com>
TO: Ville Syrjala <ville.syrjala@linux.intel.com>

Hi Ville,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on drm/drm-next next-20220516]
[cannot apply to drm-intel/for-linux-next v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i9=
15-bios-PNPID-panel_type-matching/20220510-184449
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20220516 (https://download.01.org/0day-ci/ar=
chive/20220517/202205170309.dBWj8JNv-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/display/intel_bios.c:662 pnpid_get_panel_type() error:=
 memcmp() 'edid_id' too small (2 vs 10)

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_bios.c:1457 parse_psr() warn: impossible=
 condition '(psr_table->idle_frames < 0) =3D> (0-15 < 0)'
drivers/gpu/drm/i915/display/intel_bios.c:1458 parse_psr() warn: impossible=
 condition '(psr_table->idle_frames > 15) =3D> (0-15 > 15)'

vim +/edid_id +662 drivers/gpu/drm/i915/display/intel_bios.c

719f4c51e2c9198 Ville Syrj=C3=A4l=C3=A4 2022-05-04  630  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  631  static int pnpid_g=
et_panel_type(struct drm_i915_private *i915,
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  632  				const struct e=
did *edid)
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  633  {
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  634  	const struct bdb_=
lvds_lfp_data *data;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  635  	const struct bdb_=
lvds_lfp_data_ptrs *ptrs;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  636  	const struct lvds=
_pnp_id *edid_id;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  637  	struct lvds_pnp_i=
d edid_id_nodate;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  638  	int i, best =3D -=
1;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  639  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  640  	if (!edid)
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  641  		return -1;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  642  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  643  	edid_id =3D (cons=
t void *)&edid->mfg_id[0];
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  644  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  645  	edid_id_nodate =
=3D *edid_id;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  646  	edid_id_nodate.mf=
g_week =3D 0;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  647  	edid_id_nodate.mf=
g_year =3D 0;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  648  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  649  	ptrs =3D find_sec=
tion(i915, BDB_LVDS_LFP_DATA_PTRS);
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  650  	if (!ptrs)
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  651  		return -1;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  652  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  653  	data =3D find_sec=
tion(i915, BDB_LVDS_LFP_DATA);
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  654  	if (!data)
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  655  		return -1;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  656  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  657  	for (i =3D 0; i <=
 16; i++) {
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  658  		const struct lvd=
s_pnp_id *vbt_id =3D
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  659  			get_lvds_pnp_id=
(data, ptrs, i);
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  660  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  661  		/* full match? */
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10 @662  		if (!memcmp(vbt_=
id, edid_id, sizeof(*vbt_id)))
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  663  			return i;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  664  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  665  		/*
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  666  		 * Accept a matc=
h w/o date if no full match is found,
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  667  		 * and the VBT e=
ntry does not specify a date.
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  668  		 */
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  669  		if (best < 0 &&
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  670  		    !memcmp(vbt_=
id, &edid_id_nodate, sizeof(*vbt_id)))
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  671  			best =3D i;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  672  	}
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  673  =

e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  674  	return best;
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  675  }
e7fd01f6ea7075a Ville Syrj=C3=A4l=C3=A4 2022-05-10  676  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3875287479635051504==--

