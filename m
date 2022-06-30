Content-Type: multipart/mixed; boundary="===============4234331629870108211=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 9/64] drivers/gpu/drm/display/drm_dp.c:477:12-13: WARNING opportunity for min()
Date: Thu, 30 Jun 2022 17:56:31 +0800
Message-ID: <202206301746.LCiDw4d6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4234331629870108211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   11c514c51d842f21af5ec2515d4839541be32c82
commit: e88a09b41b666add3bc3ca9194a80f0b4ee8af12 [9/64] BACKPORT: drm: Rena=
me dp/ to display/
:::::: branch date: 68 minutes ago
:::::: commit date: 3 days ago
config: alpha-randconfig-c023-20220629 (https://download.01.org/0day-ci/arc=
hive/20220630/202206301746.LCiDw4d6-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_dp.c:477:12-13: WARNING opportunity for min()
--
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:4504:64-67: ERROR: invalid=
 reference to the index variable of the iterator on line 4492
   drivers/gpu/drm/display/drm_dp_mst_topology.c:5230:13-17: ERROR: invalid=
 reference to the index variable of the iterator on line 5207
   drivers/gpu/drm/display/drm_dp_mst_topology.c:5394:5-8: ERROR: invalid r=
eference to the index variable of the iterator on line 5380

vim +477 drivers/gpu/drm/display/drm_dp.c

c197db75ff5c1d drivers/gpu/drm/drm_dp_helper.c Thierry Reding 2013-11-28  4=
55  =

20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
56  /**
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
57   * drm_dp_dpcd_probe() - probe a given DPCD address with a 1-byte read =
access
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
58   * @aux: DisplayPort AUX channel (SST)
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
59   * @offset: address of the register to probe
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
60   *
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
61   * Probe the provided DPCD address by reading 1 byte from it. The funct=
ion can
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
62   * be used to trigger some side-effect the read access has, like waking=
 up the
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
63   * sink, without the need for the read-out value.
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
64   *
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
65   * Returns 0 if the read access suceeded, or a negative error code on f=
ailure.
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
66   */
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
67  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
68  {
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
69  	u8 buffer;
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
70  	int ret;
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
71  =

20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
72  	ret =3D drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, 1=
);
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
73  	WARN_ON(ret =3D=3D 0);
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
74  =

20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
75  	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, ret);
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
76  =

20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11 @4=
77  	return ret < 0 ? ret : 0;
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
78  }
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
79  EXPORT_SYMBOL(drm_dp_dpcd_probe);
20c8ffb413be56 drivers/gpu/drm/dp/drm_dp.c     Imre Deak      2022-04-11  4=
80  =


:::::: The code@line 477 was first introduced by commit
:::::: 20c8ffb413be56d665f19d478bb2bebade409462 FROMGIT: drm/dp: Factor out=
 a function to probe a DPCD address

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserv=
iceaccount.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4234331629870108211==--

