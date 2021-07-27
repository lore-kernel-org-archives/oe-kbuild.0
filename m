Content-Type: multipart/mixed; boundary="===============7107970113704129371=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-drm-misc:drm-misc-next 2/2] Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h': 1060> * disable that plane. The CRTC the plane is linked to may also be disabled
Date: Tue, 27 Jul 2021 23:50:37 +0800
Message-ID: <202107272335.spw4nf3J-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7107970113704129371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Simon Ser <contact@emersion.fr>
CC: Pekka Paalanen <pekka.paalanen@collabora.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   17ce9c61c71cbc0d7e6ba0a9f34c724fb316a31b
commit: 17ce9c61c71cbc0d7e6ba0a9f34c724fb316a31b [2/2] drm: document DRM_IO=
CTL_MODE_RMFB
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  638<  * If set to 1, the ker=
nel supports specifying a CRTC index in the high bits of
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  639<  * &drm_wait_vblank_req=
uest.type.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version@'include/uapi/drm/drm.h':  638>  * If set to 1, the ker=
nel supports specifying a :ref:`CRTC index<crtc_index>`
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  639>  * in the high bits of =
&drm_wait_vblank_request.type.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1053> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1054>  * DRM_IOCTL_MODE_RMFB =
- Remove a framebuffer.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1055>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1056>  * This removes a frame=
buffer previously added via ADDFB/ADDFB2. The IOCTL
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1057>  * argument is a frameb=
uffer object ID.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1058>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1059>  * Warning: removing a =
framebuffer currently in-use on an enabled plane will
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1060>  * disable that plane. =
The CRTC the plane is linked to may also be disabled
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1061>  * (depending on driver=
 capabilities).
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1062>  */

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7107970113704129371==--

