Content-Type: multipart/mixed; boundary="===============1357918405153557568=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:for-linux-next 3/9] drivers/gpu/drm/display/drm_dp_helper.c:551:12-13: WARNING opportunity for min()
Date: Tue, 26 Apr 2022 06:09:36 +0800
Message-ID: <202204260623.JIoWbLSv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1357918405153557568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Lyude Paul <lyude@redhat.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   644edf52b6305506ba7fd552323c1dfaa9cf6d8d
commit: 1e0f66420b13fdd45754be0f15220a9185d59aa4 [3/9] drm/display: Introdu=
ce a DRM display-helper module
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-c022-20220425 (https://download.01.org/0day-ci/ar=
chive/20220426/202204260623.JIoWbLSv-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_dp_helper.c:551:12-13: WARNING opportunity f=
or min()

vim +551 drivers/gpu/drm/display/drm_dp_helper.c

c197db75ff5c1d4 drivers/gpu/drm/drm_dp_helper.c Thierry Reding 2013-11-28  =
529  =

d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
530  /**
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
531   * drm_dp_dpcd_probe() - probe a given DPCD address with a 1-byte read=
 access
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
532   * @aux: DisplayPort AUX channel (SST)
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
533   * @offset: address of the register to probe
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
534   *
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
535   * Probe the provided DPCD address by reading 1 byte from it. The func=
tion can
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
536   * be used to trigger some side-effect the read access has, like wakin=
g up the
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
537   * sink, without the need for the read-out value.
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
538   *
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
539   * Returns 0 if the read access suceeded, or a negative error code on =
failure.
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
540   */
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
541  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
542  {
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
543  	u8 buffer;
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
544  	int ret;
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
545  =

d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
546  	ret =3D drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, =
1);
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
547  	WARN_ON(ret =3D=3D 0);
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
548  =

d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
549  	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, ret);
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
550  =

d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11 @=
551  	return ret < 0 ? ret : 0;
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
552  }
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
553  EXPORT_SYMBOL(drm_dp_dpcd_probe);
d8bb92e70a43458 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  =
554  =


:::::: The code@line 551 was first introduced by commit
:::::: d8bb92e70a434584f5b8a882eb46930cc22fd45a drm/dp: Factor out a functi=
on to probe a DPCD address

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Imre Deak <imre.deak@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1357918405153557568==--

