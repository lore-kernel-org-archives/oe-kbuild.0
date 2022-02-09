Content-Type: multipart/mixed; boundary="===============7603673213890865898=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 644/4439] drivers/gpu/drm/dp/drm_dp_cec.c:133:12-13: WARNING opportunity for min()
Date: Wed, 09 Feb 2022 14:12:55 +0800
Message-ID: <202202091405.JTtJXwo1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7603673213890865898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   554f92dbda161fa073844ae6c62db257b8860a0a
commit: adb9d5a2cc77e8aefe98fe4c11656c5b7025c248 [644/4439] drm/dp: Move Di=
splayPort helpers into separate helper module
:::::: branch date: 25 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20209/202202091405.JTtJXwo1-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/dp/drm_dp_cec.c:133:12-13: WARNING opportunity for min()

vim +133 drivers/gpu/drm/dp/drm_dp_cec.c

2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  117  =

2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  118  s=
tatic int drm_dp_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  119  	=
			    u32 signal_free_time, struct cec_msg *msg)
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  120  {
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  121  	=
struct drm_dp_aux *aux =3D cec_get_drvdata(adap);
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  122  	=
unsigned int retries =3D min(5, attempts - 1);
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  123  	=
ssize_t err;
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  124  =

2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  125  	=
err =3D drm_dp_dpcd_write(aux, DP_CEC_TX_MESSAGE_BUFFER,
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  126  	=
			msg->msg, msg->len);
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  127  	=
if (err < 0)
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  128  	=
	return err;
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  129  =

2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  130  	=
err =3D drm_dp_dpcd_writeb(aux, DP_CEC_TX_MESSAGE_INFO,
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  131  	=
			 (msg->len - 1) | (retries << 4) |
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  132  	=
			 DP_CEC_TX_MESSAGE_SEND);
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11 @133  	=
return err < 0 ? err : 0;
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  134  }
2c6d1fffa1d9b0 drivers/gpu/drm/drm_dp_cec.c Hans Verkuil 2018-07-11  135  =


:::::: The code@line 133 was first introduced by commit
:::::: 2c6d1fffa1d9b0a5b5ac1a23be9ad64abe60910d drm: add support for Displa=
yPort CEC-Tunneling-over-AUX

:::::: TO: Hans Verkuil <hans.verkuil@cisco.com>
:::::: CC: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7603673213890865898==--

