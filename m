Content-Type: multipart/mixed; boundary="===============1052191238658643565=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/drm_vblank.c:883:20: warning: Local variable crtc shadows outer variable
Date: Tue, 15 Sep 2020 15:35:40 +0800
Message-ID: <202009151533.QyMmcdqX%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1052191238658643565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fc4f28bb3daf3265d6bc5f73b497306985bb23ab
commit: 7fe3f0d15aac6c98a97e6d7086f5a6b7bc4ccae4 drm: Add get_vblank_timest=
amp() to struct drm_crtc_funcs
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/drm_vblank.c:883:20: warning: Local variable crtc shadow=
s outer variable [shadowVar]
     struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
                      ^
   drivers/gpu/drm/drm_vblank.c:875:19: note: Shadowed declaration
    struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
                     ^
   drivers/gpu/drm/drm_vblank.c:883:20: note: Shadow variable
     struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
                      ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D7fe3f0d15aac6c98a97e6d7086f5a6b7bc4ccae4
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 7fe3f0d15aac6c98a97e6d7086f5a6b7bc4ccae4
vim +883 drivers/gpu/drm/drm_vblank.c

7fe3f0d15aac6c Thomas Zimmermann 2020-01-23  849  =

3ed4351a83ca05 Daniel Vetter     2017-05-31  850  /**
3ed4351a83ca05 Daniel Vetter     2017-05-31  851   * drm_get_last_vbltimest=
amp - retrieve raw timestamp for the most recent
3ed4351a83ca05 Daniel Vetter     2017-05-31  852   *                       =
      vblank interval
3ed4351a83ca05 Daniel Vetter     2017-05-31  853   * @dev: DRM device
3ed4351a83ca05 Daniel Vetter     2017-05-31  854   * @pipe: index of CRTC w=
hose vblank timestamp to retrieve
67680d3c046450 Arnd Bergmann     2017-10-11  855   * @tvblank: Pointer to t=
arget time which should receive the timestamp
3ed4351a83ca05 Daniel Vetter     2017-05-31  856   * @in_vblank_irq:
3ed4351a83ca05 Daniel Vetter     2017-05-31  857   *     True when called f=
rom drm_crtc_handle_vblank().  Some drivers
3ed4351a83ca05 Daniel Vetter     2017-05-31  858   *     need to apply some=
 workarounds for gpu-specific vblank irq quirks
3ed4351a83ca05 Daniel Vetter     2017-05-31  859   *     if flag is set.
3ed4351a83ca05 Daniel Vetter     2017-05-31  860   *
3ed4351a83ca05 Daniel Vetter     2017-05-31  861   * Fetches the system tim=
estamp corresponding to the time of the most recent
3ed4351a83ca05 Daniel Vetter     2017-05-31  862   * vblank interval on spe=
cified CRTC. May call into kms-driver to
3ed4351a83ca05 Daniel Vetter     2017-05-31  863   * compute the timestamp =
with a high-precision GPU specific method.
3ed4351a83ca05 Daniel Vetter     2017-05-31  864   *
3ed4351a83ca05 Daniel Vetter     2017-05-31  865   * Returns zero if timest=
amp originates from uncorrected do_gettimeofday()
3ed4351a83ca05 Daniel Vetter     2017-05-31  866   * call, i.e., it isn't v=
ery precisely locked to the true vblank.
3ed4351a83ca05 Daniel Vetter     2017-05-31  867   *
3ed4351a83ca05 Daniel Vetter     2017-05-31  868   * Returns:
3ed4351a83ca05 Daniel Vetter     2017-05-31  869   * True if timestamp is c=
onsidered to be very precise, false otherwise.
3ed4351a83ca05 Daniel Vetter     2017-05-31  870   */
3ed4351a83ca05 Daniel Vetter     2017-05-31  871  static bool
3ed4351a83ca05 Daniel Vetter     2017-05-31  872  drm_get_last_vbltimestamp=
(struct drm_device *dev, unsigned int pipe,
67680d3c046450 Arnd Bergmann     2017-10-11  873  			  ktime_t *tvblank, bo=
ol in_vblank_irq)
3ed4351a83ca05 Daniel Vetter     2017-05-31  874  {
7fe3f0d15aac6c Thomas Zimmermann 2020-01-23  875  	struct drm_crtc *crtc =
=3D drm_crtc_from_index(dev, pipe);
3ed4351a83ca05 Daniel Vetter     2017-05-31  876  	bool ret =3D false;
3ed4351a83ca05 Daniel Vetter     2017-05-31  877  =

3ed4351a83ca05 Daniel Vetter     2017-05-31  878  	/* Define requested maxi=
mum error on timestamps (nanoseconds). */
3ed4351a83ca05 Daniel Vetter     2017-05-31  879  	int max_error =3D (int) =
drm_timestamp_precision * 1000;
3ed4351a83ca05 Daniel Vetter     2017-05-31  880  =

3ed4351a83ca05 Daniel Vetter     2017-05-31  881  	/* Query driver if possi=
ble and precision timestamping enabled. */
7fe3f0d15aac6c Thomas Zimmermann 2020-01-23  882  	if (crtc && crtc->funcs-=
>get_vblank_timestamp && max_error > 0) {
7fe3f0d15aac6c Thomas Zimmermann 2020-01-23 @883  		struct drm_crtc *crtc =
=3D drm_crtc_from_index(dev, pipe);
7fe3f0d15aac6c Thomas Zimmermann 2020-01-23  884  =

7fe3f0d15aac6c Thomas Zimmermann 2020-01-23  885  		ret =3D crtc->funcs->ge=
t_vblank_timestamp(crtc, &max_error,
7fe3f0d15aac6c Thomas Zimmermann 2020-01-23  886  							tvblank, in_vblank=
_irq);
7fe3f0d15aac6c Thomas Zimmermann 2020-01-23  887  	} else if (dev->driver->=
get_vblank_timestamp && max_error > 0) {
3ed4351a83ca05 Daniel Vetter     2017-05-31  888  		ret =3D dev->driver->ge=
t_vblank_timestamp(dev, pipe, &max_error,
3ed4351a83ca05 Daniel Vetter     2017-05-31  889  							tvblank, in_vblank=
_irq);
7fe3f0d15aac6c Thomas Zimmermann 2020-01-23  890  	}
3ed4351a83ca05 Daniel Vetter     2017-05-31  891  =

3ed4351a83ca05 Daniel Vetter     2017-05-31  892  	/* GPU high precision ti=
mestamp query unsupported or failed.
3ed4351a83ca05 Daniel Vetter     2017-05-31  893  	 * Return current monoto=
nic/gettimeofday timestamp as best estimate.
3ed4351a83ca05 Daniel Vetter     2017-05-31  894  	 */
3ed4351a83ca05 Daniel Vetter     2017-05-31  895  	if (!ret)
25e1a79874eb38 Arnd Bergmann     2017-10-11  896  		*tvblank =3D ktime_get(=
);
3ed4351a83ca05 Daniel Vetter     2017-05-31  897  =

3ed4351a83ca05 Daniel Vetter     2017-05-31  898  	return ret;
3ed4351a83ca05 Daniel Vetter     2017-05-31  899  }
3ed4351a83ca05 Daniel Vetter     2017-05-31  900  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1052191238658643565==--

