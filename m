Content-Type: multipart/mixed; boundary="===============3289947273543131540=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:for-linux-next 2/9] drivers/gpu/drm/display/drm_dp_cec.c:133:12-13: WARNING opportunity for min()
Date: Tue, 26 Apr 2022 05:28:51 +0800
Message-ID: <202204260519.eNL06xce-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3289947273543131540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Lyude Paul <lyude@redhat.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Alex Deucher <alexander.deucher@amd.com>

Hi Thomas,

First bad commit (maybe !=3D root cause):

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   644edf52b6305506ba7fd552323c1dfaa9cf6d8d
commit: da68386d9edb1f57abf886febe5c5169ebd4d2c9 [2/9] drm: Rename dp/ to d=
isplay/
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm-randconfig-c003-20220425 (https://download.01.org/0day-ci/archi=
ve/20220426/202204260519.eNL06xce-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_dp_cec.c:133:12-13: WARNING opportunity for =
min()

vim +133 drivers/gpu/drm/display/drm_dp_cec.c

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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3289947273543131540==--

