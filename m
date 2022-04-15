Content-Type: multipart/mixed; boundary="===============1370181203884217241=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-tip:drm-tip 674/689] drivers/gpu/drm/dp/drm_dp.c:551:12-13: WARNING opportunity for min()
Date: Sat, 16 Apr 2022 07:13:22 +0800
Message-ID: <202204160714.jYBgxwJh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1370181203884217241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: intel-gfx(a)lists.freedesktop.org
CC: Intel-gfx(a)lists.freedesktop.org
CC: dri-devel(a)lists.freedesktop.org
TO: Imre Deak <imre.deak@intel.com>
CC: Jani Nikula <jani.nikula@intel.com>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   5a4dce336cfb95d05d7bedc0ab0c623784735c79
commit: d8bb92e70a434584f5b8a882eb46930cc22fd45a [674/689] drm/dp: Factor o=
ut a function to probe a DPCD address
:::::: branch date: 3 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20416/202204160714.jYBgxwJh-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/dp/drm_dp.c:551:12-13: WARNING opportunity for min()

vim +551 drivers/gpu/drm/dp/drm_dp.c

c197db75ff5c1d drivers/gpu/drm/drm_dp_helper.c Thierry Reding 2013-11-28  5=
29  =

d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
30  /**
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
31   * drm_dp_dpcd_probe() - probe a given DPCD address with a 1-byte read =
access
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
32   * @aux: DisplayPort AUX channel (SST)
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
33   * @offset: address of the register to probe
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
34   *
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
35   * Probe the provided DPCD address by reading 1 byte from it. The funct=
ion can
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
36   * be used to trigger some side-effect the read access has, like waking=
 up the
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
37   * sink, without the need for the read-out value.
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
38   *
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
39   * Returns 0 if the read access suceeded, or a negative error code on f=
ailure.
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
40   */
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
41  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
42  {
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
43  	u8 buffer;
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
44  	int ret;
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
45  =

d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
46  	ret =3D drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, 1=
);
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
47  	WARN_ON(ret =3D=3D 0);
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
48  =

d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
49  	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, ret);
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
50  =

d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11 @5=
51  	return ret < 0 ? ret : 0;
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
52  }
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
53  EXPORT_SYMBOL(drm_dp_dpcd_probe);
d8bb92e70a4345 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  5=
54  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1370181203884217241==--

