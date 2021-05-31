Content-Type: multipart/mixed; boundary="===============2549817858055515042=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-drm-misc:for-linux-next 2/3] Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h': 815> * writing back to memory the scene setup in the commit. The client must enable
Date: Tue, 01 Jun 2021 04:08:09 +0800
Message-ID: <202106010406.i7ZISDMh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2549817858055515042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Simon Ser <contact@emersion.fr>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2e290c8d8d29278b9a20e2765ab8f6df02f2e707
commit: bbf4627ba6415711da94f8106a7de993c49372a6 [2/3] drm: clarify and lin=
kify DRM_CLIENT_CAP_WRITEBACK_CONNECTORS docs
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  780<  * if set to 1, the DRM=
 core will expose the stereo 3D capabilities of the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version@'include/uapi/drm/drm.h':  780>  * If set to 1, the DRM=
 core will expose the stereo 3D capabilities of the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  782<  * drm_mode_modeinfo.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version@'include/uapi/drm/drm.h':  782>  * drm_mode_modeinfo. S=
ee ``DRM_MODE_FLAG_3D_*``.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  807>  * See ``DRM_MODE_FLAG_=
PIC_AR_*``.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  814<  * writing back to memo=
ry the scene setup in the commit. Depends on client
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version@'include/uapi/drm/drm.h':  815<  * also supporting DRM_=
CLIENT_CAP_ATOMIC
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  815>  * writing back to memo=
ry the scene setup in the commit. The client must enable
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  816>  * &DRM_CLIENT_CAP_ATOM=
IC first.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2549817858055515042==--

