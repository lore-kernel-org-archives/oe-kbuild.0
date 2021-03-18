Content-Type: multipart/mixed; boundary="===============3691399090442015289=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/psr: Configure and Program IO buffer Wake and Fast Wake
Date: Fri, 19 Mar 2021 07:02:32 +0800
Message-ID: <202103190630.gZXsTX5h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3691399090442015289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210312120722.1450481-1-gwan-gyeong.mun@intel.com>
References: <20210312120722.1450481-1-gwan-gyeong.mun@intel.com>
TO: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
TO: intel-gfx(a)lists.freedesktop.org

Hi Gwan-gyeong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20210318]
[cannot apply to v5.12-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gwan-gyeong-Mun/drm-i915-p=
sr-Configure-and-Program-IO-buffer-Wake-and-Fast-Wake/20210312-200910
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-m021-20210318 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:807 intel_psr2_config_valid() erro=
r: uninitialized symbol 'io_buffer_wake_min'.
drivers/gpu/drm/i915/display/intel_psr.c:807 intel_psr2_config_valid() erro=
r: uninitialized symbol 'io_buffer_wake_max'.
drivers/gpu/drm/i915/display/intel_psr.c:814 intel_psr2_config_valid() erro=
r: uninitialized symbol 'fast_wake_min'.
drivers/gpu/drm/i915/display/intel_psr.c:814 intel_psr2_config_valid() erro=
r: uninitialized symbol 'fast_wake_max'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:1254 intel_psr2_program_plane_sel_=
fetch() error: we previously assumed 'plane_state' could be null (see line =
1246)

vim +/io_buffer_wake_min +807 drivers/gpu/drm/i915/display/intel_psr.c

6e43e276b8c94e drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-08-10  713  =

c4932d7956d822 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-02-27  714  static bool intel_psr2_config_valid(struct intel_dp *in=
tel_dp,
c4932d7956d822 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-02-27  715  				    struct intel_crtc_state *crtc_state)
c4932d7956d822 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-02-27  716  {
1895759ee932e4 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-08-27  717  	struct drm_i915_private *dev_priv =3D dp_to_i915(intel=
_dp);
1326a92c346641 drivers/gpu/drm/i915/display/intel_psr.c Maarten Lankhorst  =
   2019-10-31  718  	int crtc_hdisplay =3D crtc_state->hw.adjusted_mode.crt=
c_hdisplay;
1326a92c346641 drivers/gpu/drm/i915/display/intel_psr.c Maarten Lankhorst  =
   2019-10-31  719  	int crtc_vdisplay =3D crtc_state->hw.adjusted_mode.crt=
c_vdisplay;
f98837e85fcdcd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-11-27  720  	int psr_max_h =3D 0, psr_max_v =3D 0, max_bpp =3D=
 0;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  721  	u32 io_buffer_wake, io_buffer_wake_max, io_buffer_wake=
_min;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  722  	u32 fast_wake, fast_wake_max, fast_wake_min;
c4932d7956d822 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-02-27  723  =

b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-02-04  724  	if (!intel_dp->psr.sink_psr2_support)
c4932d7956d822 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-02-27  725  		return false;
c4932d7956d822 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-02-27  726  =

c5c874a8352918 drivers/gpu/drm/i915/display/intel_psr.c Edmund Dea         =
   2021-02-04  727  	/* JSL and EHL only supports eDP 1.3 */
c5c874a8352918 drivers/gpu/drm/i915/display/intel_psr.c Edmund Dea         =
   2021-02-04  728  	if (IS_JSL_EHL(dev_priv)) {
c5c874a8352918 drivers/gpu/drm/i915/display/intel_psr.c Edmund Dea         =
   2021-02-04  729  		drm_dbg_kms(&dev_priv->drm, "PSR2 not supported by ph=
y\n");
c5c874a8352918 drivers/gpu/drm/i915/display/intel_psr.c Edmund Dea         =
   2021-02-04  730  		return false;
c5c874a8352918 drivers/gpu/drm/i915/display/intel_psr.c Edmund Dea         =
   2021-02-04  731  	}
c5c874a8352918 drivers/gpu/drm/i915/display/intel_psr.c Edmund Dea         =
   2021-02-04  732  =

99fc38b12095cd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-08-20  733  	if (!transcoder_has_psr2(dev_priv, crtc_state->cp=
u_transcoder)) {
6471bd74713c16 drivers/gpu/drm/i915/display/intel_psr.c Wambui Karuga      =
   2020-01-30  734  		drm_dbg_kms(&dev_priv->drm,
6471bd74713c16 drivers/gpu/drm/i915/display/intel_psr.c Wambui Karuga      =
   2020-01-30  735  			    "PSR2 not supported in transcoder %s\n",
99fc38b12095cd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-08-20  736  			    transcoder_name(crtc_state->cpu_transcoder)=
);
99fc38b12095cd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-08-20  737  		return false;
99fc38b12095cd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-08-20  738  	}
99fc38b12095cd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-08-20  739  =

b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-02-04  740  	if (!psr2_global_enabled(intel_dp)) {
5c90660fcc4528 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-10-07  741  		drm_dbg_kms(&dev_priv->drm, "PSR2 disabled by fl=
ag\n");
5c90660fcc4528 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-10-07  742  		return false;
5c90660fcc4528 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-10-07  743  	}
5c90660fcc4528 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-10-07  744  =

8228c42fc0ee54 drivers/gpu/drm/i915/intel_psr.c         Manasi Navare      =
   2018-11-28  745  	/*
8228c42fc0ee54 drivers/gpu/drm/i915/intel_psr.c         Manasi Navare      =
   2018-11-28  746  	 * DSC and PSR2 cannot be enabled simultaneously. If a=
 requested
8228c42fc0ee54 drivers/gpu/drm/i915/intel_psr.c         Manasi Navare      =
   2018-11-28  747  	 * resolution requires DSC to be enabled, priority is =
given to DSC
8228c42fc0ee54 drivers/gpu/drm/i915/intel_psr.c         Manasi Navare      =
   2018-11-28  748  	 * over PSR2.
8228c42fc0ee54 drivers/gpu/drm/i915/intel_psr.c         Manasi Navare      =
   2018-11-28  749  	 */
010663a61c4037 drivers/gpu/drm/i915/display/intel_psr.c Jani Nikula        =
   2019-10-22  750  	if (crtc_state->dsc.compression_enable) {
6471bd74713c16 drivers/gpu/drm/i915/display/intel_psr.c Wambui Karuga      =
   2020-01-30  751  		drm_dbg_kms(&dev_priv->drm,
6471bd74713c16 drivers/gpu/drm/i915/display/intel_psr.c Wambui Karuga      =
   2020-01-30  752  			    "PSR2 cannot be enabled since DSC is enabled\n");
8228c42fc0ee54 drivers/gpu/drm/i915/intel_psr.c         Manasi Navare      =
   2018-11-28  753  		return false;
8228c42fc0ee54 drivers/gpu/drm/i915/intel_psr.c         Manasi Navare      =
   2018-11-28  754  	}
8228c42fc0ee54 drivers/gpu/drm/i915/intel_psr.c         Manasi Navare      =
   2018-11-28  755  =

19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  756  	if (crtc_state->crc_enabled) {
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  757  		drm_dbg_kms(&dev_priv->drm,
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  758  			    "PSR2 not enabled because it would inhibit =
pipe CRC calculation\n");
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  759  		return false;
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  760  	}
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  761  =

f7b3c22619a44c drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-08-23  762  	if (INTEL_GEN(dev_priv) >=3D 12) {
f7b3c22619a44c drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-08-23  763  		psr_max_h =3D 5120;
f7b3c22619a44c drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-08-23  764  		psr_max_v =3D 3200;
f98837e85fcdcd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-11-27  765  		max_bpp =3D 30;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  766  		io_buffer_wake_max =3D TGL_EDP_PSR2_IO_BUFFER_WAKE_MA=
X_LINES;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  767  		io_buffer_wake_min =3D TGL_EDP_PSR2_IO_BUFFER_WAKE_MI=
N_LINES;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  768  		fast_wake_max =3D TGL_EDP_PSR2_FAST_WAKE_MAX_LINES;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  769  		fast_wake_min =3D TGL_EDP_PSR2_FAST_WAKE_MIN_LINES;
f7b3c22619a44c drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-08-23  770  	} else if (INTEL_GEN(dev_priv) >=3D 10 || IS_GEMI=
NILAKE(dev_priv)) {
c90c275c6ff4b7 drivers/gpu/drm/i915/intel_psr.c         Dhinakaran Pandiyan=
   2018-03-06  771  		psr_max_h =3D 4096;
c90c275c6ff4b7 drivers/gpu/drm/i915/intel_psr.c         Dhinakaran Pandiyan=
   2018-03-06  772  		psr_max_v =3D 2304;
f98837e85fcdcd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-11-27  773  		max_bpp =3D 24;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  774  		io_buffer_wake_max =3D EDP_PSR2_IO_BUFFER_WAKE_MAX_LI=
NES;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  775  		io_buffer_wake_min =3D EDP_PSR2_IO_BUFFER_WAKE_MIN_LI=
NES;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  776  		fast_wake_max =3D EDP_PSR2_FAST_WAKE_MAX_LINES;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  777  		fast_wake_min =3D EDP_PSR2_FAST_WAKE_MIN_LINES;
cf819eff907ab4 drivers/gpu/drm/i915/intel_psr.c         Lucas De Marchi    =
   2018-12-12  778  	} else if (IS_GEN(dev_priv, 9)) {
c90c275c6ff4b7 drivers/gpu/drm/i915/intel_psr.c         Dhinakaran Pandiyan=
   2018-03-06  779  		psr_max_h =3D 3640;
c90c275c6ff4b7 drivers/gpu/drm/i915/intel_psr.c         Dhinakaran Pandiyan=
   2018-03-06  780  		psr_max_v =3D 2304;
f98837e85fcdcd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-11-27  781  		max_bpp =3D 24;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  782  		io_buffer_wake_max =3D EDP_PSR2_IO_BUFFER_WAKE_MAX_LI=
NES;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  783  		io_buffer_wake_min =3D EDP_PSR2_IO_BUFFER_WAKE_MIN_LI=
NES;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  784  		fast_wake_max =3D EDP_PSR2_FAST_WAKE_MAX_LINES;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  785  		fast_wake_min =3D EDP_PSR2_FAST_WAKE_MIN_LINES;
c90c275c6ff4b7 drivers/gpu/drm/i915/intel_psr.c         Dhinakaran Pandiyan=
   2018-03-06  786  	}
c90c275c6ff4b7 drivers/gpu/drm/i915/intel_psr.c         Dhinakaran Pandiyan=
   2018-03-06  787  =

f98837e85fcdcd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-11-27  788  	if (crtc_state->pipe_bpp > max_bpp) {
6471bd74713c16 drivers/gpu/drm/i915/display/intel_psr.c Wambui Karuga      =
   2020-01-30  789  		drm_dbg_kms(&dev_priv->drm,
6471bd74713c16 drivers/gpu/drm/i915/display/intel_psr.c Wambui Karuga      =
   2020-01-30  790  			    "PSR2 not enabled, pipe bpp %d > max supported %=
d\n",
f98837e85fcdcd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-11-27  791  			    crtc_state->pipe_bpp, max_bpp);
f98837e85fcdcd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-11-27  792  		return false;
f98837e85fcdcd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-11-27  793  	}
f98837e85fcdcd drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2019-11-27  794  =

c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  795  	/*
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  796  	 * B.Spec 49274
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  797  	 * IO buffer wake lines =3D ROUNDUP(PSR2 IO wake time =
/ total line time in microseconds)
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  798  	 * Fast wake lines =3D ROUNDUP(PSR2 aux transaction ti=
me / total line time in microseconds)
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  799  	 * For both fields limit the minimum to 7 lines and ma=
ximum to 12 lines
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  800  	 * PSR2 IO wake time =3D 50us, PSR2 aux transaction ti=
me =3D 32us.
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  801  	 */
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  802  	io_buffer_wake =3D intel_usecs_to_scanlines(&crtc_stat=
e->uapi.adjusted_mode,
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  803  						  EDP_PSR2_IO_WAKE_TIME);
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  804  	fast_wake =3D intel_usecs_to_scanlines(&crtc_state->ua=
pi.adjusted_mode,
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  805  					     EDP_PSR2_AUX_TRANSACTION_TIME);
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  806  =

c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12 @807  	if (io_buffer_wake < io_buffer_wake_min || io_buffer_w=
ake > io_buffer_wake_max) {
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  808  		drm_dbg_kms(&dev_priv->drm,
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  809  			    "PSR condition failed: Invalid PSR2 IO Buffer Wa=
ke lines (%d)\n",
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  810  			    io_buffer_wake);
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  811  		return false;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  812  	}
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  813  =

c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12 @814  	if (fast_wake < fast_wake_min || fast_wake > fast_wake=
_max) {
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  815  		drm_dbg_kms(&dev_priv->drm,
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  816  			    "PSR condition failed: Invalid PSR2 FAST Wake li=
nes (%d)\n",
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  817  			    fast_wake);
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  818  		return false;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  819  	}
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  820  =

c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  821  	intel_dp->psr.io_buffer_wake =3D
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  822  		io_buffer_wake < EDP_PSR2_IO_BUFFER_WAKE_DEFAULT ? ED=
P_PSR2_IO_BUFFER_WAKE_DEFAULT : io_buffer_wake;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  823  	intel_dp->psr.fast_wake =3D
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  824  		fast_wake < EDP_PSR2_FAST_WAKE_DEFAULT ? EDP_PSR2_FAS=
T_WAKE_DEFAULT : fast_wake;
c6e14c43060088 drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-03-12  825  =

bef5e5b3bee41c drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2018-12-03  826  	/*
bef5e5b3bee41c drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2018-12-03  827  	 * HW sends SU blocks of size four scan lines, wh=
ich means the starting
bef5e5b3bee41c drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2018-12-03  828  	 * X coordinate and Y granularity requirements wi=
ll always be met. We
8c0d2c29083d68 drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2018-12-03  829  	 * only need to validate the SU block width is a =
multiple of
8c0d2c29083d68 drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2018-12-03  830  	 * x granularity.
bef5e5b3bee41c drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2018-12-03  831  	 */
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-02-04  832  	if (crtc_hdisplay % intel_dp->psr.su_x_granularity) {
6471bd74713c16 drivers/gpu/drm/i915/display/intel_psr.c Wambui Karuga      =
   2020-01-30  833  		drm_dbg_kms(&dev_priv->drm,
6471bd74713c16 drivers/gpu/drm/i915/display/intel_psr.c Wambui Karuga      =
   2020-01-30  834  			    "PSR2 not enabled, hdisplay(%d) not multiple of =
%d\n",
b64d6c51380b7d drivers/gpu/drm/i915/display/intel_psr.c Gwan-gyeong Mun    =
   2021-02-04  835  			    crtc_hdisplay, intel_dp->psr.su_x_granularity);
bef5e5b3bee41c drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2018-12-03  836  		return false;
bef5e5b3bee41c drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2018-12-03  837  	}
bef5e5b3bee41c drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2018-12-03  838  =

6e43e276b8c94e drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-08-10  839  	if (HAS_PSR2_SEL_FETCH(dev_priv)) {
6e43e276b8c94e drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-08-10  840  		if (!intel_psr2_sel_fetch_config_valid(intel_dp,=
 crtc_state) &&
6e43e276b8c94e drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-08-10  841  		    !HAS_PSR_HW_TRACKING(dev_priv)) {
6471bd74713c16 drivers/gpu/drm/i915/display/intel_psr.c Wambui Karuga      =
   2020-01-30  842  			drm_dbg_kms(&dev_priv->drm,
6e43e276b8c94e drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-08-10  843  				    "PSR2 not enabled, selective fetch not val=
id and no HW tracking available\n");
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  844  			return false;
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  845  		}
6e43e276b8c94e drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-08-10  846  	}
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  847  =

6e43e276b8c94e drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-08-10  848  	if (!crtc_state->enable_psr2_sel_fetch &&
6e43e276b8c94e drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-08-10  849  	    (crtc_hdisplay > psr_max_h || crtc_vdisplay >=
 psr_max_v)) {
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  850  		drm_dbg_kms(&dev_priv->drm,
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  851  			    "PSR2 not enabled, resolution %dx%d > max s=
upported %dx%d\n",
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  852  			    crtc_hdisplay, crtc_vdisplay,
19167eb064da81 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-06-25  853  			    psr_max_h, psr_max_v);
618cf883becd75 drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2019-03-07  854  		return false;
618cf883becd75 drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2019-03-07  855  	}
618cf883becd75 drivers/gpu/drm/i915/intel_psr.c         Jos=C3=A9 Roberto d=
e Souza 2019-03-07  856  =

c5c772cf8d7cb6 drivers/gpu/drm/i915/display/intel_psr.c Jos=C3=A9 Roberto d=
e Souza 2020-01-22  857  	tgl_dc3co_exitline_compute_config(intel_dp, crtc_=
state);
c4932d7956d822 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-02-27  858  	return true;
c4932d7956d822 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-02-27  859  }
c4932d7956d822 drivers/gpu/drm/i915/intel_psr.c         Rodrigo Vivi       =
   2018-02-27  860  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3691399090442015289==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3691399090442015289==--

