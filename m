Content-Type: multipart/mixed; boundary="===============8444151320813737530=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5849/7959] drivers/gpu/drm/display/drm_hdcp_helper.c:53:58: warning: Parameter 'revoked_ksv_list' can be declared with const [constParameter]
Date: Mon, 02 May 2022 18:45:28 +0800
Message-ID: <202205021819.adUEEr3I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8444151320813737530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5469f0c06732a077c70a759a81f2a1f00b277694
commit: 6a99099fe1d6c46cbcd74298eeb386c4b9048f77 [5849/7959] drm/display: M=
ove HDCP helpers into display-helper module
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 6a99099fe1d6c46cbcd74298eeb386c4b9048f77
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/display/drm_hdcp_helper.c:53:58: warning: Parameter 'rev=
oked_ksv_list' can be declared with const [constParameter]
   static u32 drm_hdcp_get_revoked_ksvs(const u8 *buf, u8 **revoked_ksv_lis=
t,
                                                            ^

vim +/revoked_ksv_list +53 drivers/gpu/drm/display/drm_hdcp_helper.c

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  52  =

79643fddd6eb2d drivers/gpu/drm/drm_hdcp.c Ramalingam C 2020-02-12 @53  stat=
ic u32 drm_hdcp_get_revoked_ksvs(const u8 *buf, u8 **revoked_ksv_list,
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  54  				=
     u32 vrls_length)
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  55  {
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  56  	u32=
 vrl_ksv_cnt, vrl_ksv_sz, vrl_idx =3D 0;
79643fddd6eb2d drivers/gpu/drm/drm_hdcp.c Ramalingam C 2020-02-12  57  	u32=
 parsed_bytes =3D 0, ksv_count =3D 0;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  58  =

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  59  	do {
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  60  		vr=
l_ksv_cnt =3D *buf;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  61  		vr=
l_ksv_sz =3D vrl_ksv_cnt * DRM_HDCP_KSV_LEN;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  62  =

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  63  		bu=
f++;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  64  =

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  65  		DR=
M_DEBUG("vrl: %d, Revoked KSVs: %d\n", vrl_idx++,
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  66  			 =
 vrl_ksv_cnt);
79643fddd6eb2d drivers/gpu/drm/drm_hdcp.c Ramalingam C 2020-02-12  67  		me=
mcpy((*revoked_ksv_list) + (ksv_count * DRM_HDCP_KSV_LEN),
79643fddd6eb2d drivers/gpu/drm/drm_hdcp.c Ramalingam C 2020-02-12  68  		  =
     buf, vrl_ksv_sz);
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  69  =

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  70  		ks=
v_count +=3D vrl_ksv_cnt;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  71  		bu=
f +=3D vrl_ksv_sz;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  72  =

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  73  		pa=
rsed_bytes +=3D (vrl_ksv_sz + 1);
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  74  	} w=
hile (parsed_bytes < vrls_length);
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  75  =

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  76  	ret=
urn ksv_count;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  77  }
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  78  =


:::::: The code@line 53 was first introduced by commit
:::::: 79643fddd6eb2d4dec33ac6fb0c66399549fbe55 drm/hdcp: optimizing the sr=
m handling

:::::: TO: Ramalingam C <ramalingam.c@intel.com>
:::::: CC: Ramalingam C <ramalingam.c@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8444151320813737530==--

