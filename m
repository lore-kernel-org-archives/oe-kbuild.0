Content-Type: multipart/mixed; boundary="===============3387234889055215856=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/display/drm_hdcp_helper.c:254 drm_hdcp_request_srm() error: uninitialized symbol 'fw'.
Date: Mon, 19 Sep 2022 14:11:13 +0800
Message-ID: <202209191450.Y4sMY2Om-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3387234889055215856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: 6a99099fe1d6c46cbcd74298eeb386c4b9048f77 drm/display: Move HDCP hel=
pers into display-helper module
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: arc-randconfig-m041-20220919 (https://download.01.org/0day-ci/archi=
ve/20220919/202209191450.Y4sMY2Om-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/display/drm_hdcp_helper.c:254 drm_hdcp_request_srm() error:=
 uninitialized symbol 'fw'.

vim +/fw +254 drivers/gpu/drm/display/drm_hdcp_helper.c

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  232  =

79643fddd6eb2d drivers/gpu/drm/drm_hdcp.c Ramalingam C 2020-02-12  233  sta=
tic int drm_hdcp_request_srm(struct drm_device *drm_dev,
79643fddd6eb2d drivers/gpu/drm/drm_hdcp.c Ramalingam C 2020-02-12  234  			=
	u8 **revoked_ksv_list, u32 *revoked_ksv_cnt)
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  235  {
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  236  	ch=
ar fw_name[36] =3D "display_hdcp_srm.bin";
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  237  	co=
nst struct firmware *fw;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  238  	in=
t ret;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  239  =

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  240  	re=
t =3D request_firmware_direct(&fw, (const char *)fw_name,
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  241  			=
	      drm_dev->dev);
5fe89a6acd668c drivers/gpu/drm/drm_hdcp.c Sean Paul    2020-04-14  242  	if=
 (ret < 0) {
5fe89a6acd668c drivers/gpu/drm/drm_hdcp.c Sean Paul    2020-04-14  243  		*=
revoked_ksv_cnt =3D 0;
5fe89a6acd668c drivers/gpu/drm/drm_hdcp.c Sean Paul    2020-04-14  244  		*=
revoked_ksv_list =3D NULL;
5fe89a6acd668c drivers/gpu/drm/drm_hdcp.c Sean Paul    2020-04-14  245  		r=
et =3D 0;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  246  		g=
oto exit;
5fe89a6acd668c drivers/gpu/drm/drm_hdcp.c Sean Paul    2020-04-14  247  	}
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  248  =

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  249  	if=
 (fw->size && fw->data)
79643fddd6eb2d drivers/gpu/drm/drm_hdcp.c Ramalingam C 2020-02-12  250  		r=
et =3D drm_hdcp_srm_update(fw->data, fw->size, revoked_ksv_list,
79643fddd6eb2d drivers/gpu/drm/drm_hdcp.c Ramalingam C 2020-02-12  251  			=
		  revoked_ksv_cnt);
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  252  =

6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  253  exi=
t:
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07 @254  	re=
lease_firmware(fw);
79643fddd6eb2d drivers/gpu/drm/drm_hdcp.c Ramalingam C 2020-02-12  255  	re=
turn ret;
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  256  }
6498bf5800a302 drivers/gpu/drm/drm_hdcp.c Ramalingam C 2019-05-07  257  =


:::::: The code at line 254 was first introduced by commit
:::::: 6498bf5800a302ef69e7f4914e727893f278bb2f drm: revocation check at dr=
m subsystem

:::::: TO: Ramalingam C <ramalingam.c@intel.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3387234889055215856==--

